const { checkSchema } = require('express-validator');
const HTTP_STATUS = require('../constants/httpStatus');
const USERS_MESSAGES = require('../constants/messages');
const ErrorsWithStatus = require('../constants/Error');
const hashPassword = require('../utils/crypto');
const { verifyToken } = require('../utils/JWT');
const validate = require('../utils/validation');
const userServices = require('../services/user.services');
const db = require('../models');
const { wrapController } = require('../utils/handle');
const checkRegisterValidator = checkSchema(
    {
        first_name: {
            notEmpty: {
                errorMessage: USERS_MESSAGES.NAME_IS_REQUIRED,
            },
            isString: {
                errorMessage: USERS_MESSAGES.NAME_MUST_BE_STRING,
            },
            isLength: {
                options: {
                    max: 50,
                    min: 1,
                },
                errorMessage: USERS_MESSAGES.NAME_LENGTH_FROM_1_TO_50,
            },
            trim: true,
        },
        last_name: {
            notEmpty: {
                errorMessage: USERS_MESSAGES.NAME_IS_REQUIRED,
            },
            isString: {
                errorMessage: USERS_MESSAGES.NAME_MUST_BE_STRING,
            },
            isLength: {
                options: {
                    max: 50,
                    min: 1,
                },
                errorMessage: USERS_MESSAGES.NAME_LENGTH_FROM_1_TO_50,
            },
            trim: true,
        },
        email: {
            isEmail: {
                errorMessage: USERS_MESSAGES.EMAIL_IS_INVALID,
            },
            notEmpty: {
                errorMessage: USERS_MESSAGES.EMAIL_IS_REQUIRED,
            },
            trim: true,
            custom: {
                options: async (value) => {
                    const isExistEmail = await userServices.isEmailExist(value);
                    if (isExistEmail) {
                        throw new Error(USERS_MESSAGES.EMAIL_ALREADY_EXISTS);
                    }
                    return true;
                },
            },
        },
        password: {
            notEmpty: {
                errorMessage: USERS_MESSAGES.PASSWORD_IS_REQUIRED,
            },
            isString: {
                errorMessage: USERS_MESSAGES.PASSWORD_MUST_BE_STRING,
            },
            isStrongPassword: {
                options: {
                    minLength: 8,
                    minLowercase: 1,
                    minUppercase: 0,
                    minNumbers: 1,
                    minSymbols: 0,
                },
                errorMessage: USERS_MESSAGES.PASSWORD_MUST_BE_STRONG,
            },
        },
    },
    ['body'],
);

const checkLoginValidator = checkSchema(
    {
        email: {
            isEmail: {
                errorMessage: USERS_MESSAGES.EMAIL_IS_INVALID,
            },
            notEmpty: {
                errorMessage: USERS_MESSAGES.EMAIL_IS_REQUIRED,
            },
            custom: {
                options: async (value, { req }) => {
                    const user = await userServices.findUserLogin(value, req.body.password);
                    req.user = user;
                    return true;
                },
            },
        },
        password: {
            notEmpty: {
                errorMessage: USERS_MESSAGES.PASSWORD_IS_REQUIRED,
            },
        },
    },
    ['body'],
);

const checkAccessTokenValidator = checkSchema(
    {
        Authorization: {
            custom: {
                options: async (value, { req }) => {
                    if (!value) {
                        throw new ErrorsWithStatus({
                            message: USERS_MESSAGES.ACCESS_TOKEN_REQUIRED,
                            status: HTTP_STATUS.UNAUTHORIZED,
                        });
                    }
                    const accessToken = value.split(' ')[1];
                    const decoded_authorization = await verifyToken(accessToken);
                    req.decoded_authorization = decoded_authorization;
                    return true;
                },
            },
        },
    },
    ['headers'],
);
const checkUserExistValidator = checkSchema(
    {
        userID: {
            custom: {
                options: async (value, { req }) => {
                    const user = await db.User.findOne({
                        where: { id: value },
                    });
                    if (!user) {
                        throw new ErrorsWithStatus({
                            message: USERS_MESSAGES.USER_NOT_FOUND,
                            status: HTTP_STATUS.NOT_FOUND,
                        });
                    }
                },
            },
        },
    },
    ['params'],
);

const checkChangePasswordValidator = checkSchema(
    {
        password: {
            notEmpty: {
                errorMessage: USERS_MESSAGES.PASSWORD_IS_REQUIRED,
            },
            isString: {
                errorMessage: USERS_MESSAGES.PASSWORD_MUST_BE_STRING,
            },
            isStrongPassword: {
                options: {
                    minLength: 8,
                    minLowercase: 1,
                    minUppercase: 0,
                    minNumbers: 1,
                    minSymbols: 0,
                },
                errorMessage: USERS_MESSAGES.PASSWORD_MUST_BE_STRONG,
            },
        },
        confirm_password: {
            notEmpty: {
                errorMessage: USERS_MESSAGES.CONFIRM_PASSWORD_IS_REQUIRED,
            },
            isString: {
                errorMessage: USERS_MESSAGES.CONFIRM_PASSWORD_MUST_BE_STRING,
            },
            custom: {
                options: (value, { req }) => {
                    if (value !== req.body.password) {
                        throw new Error(USERS_MESSAGES.CONFIRM_PASSWORD_MUST_BE_THE_SAME_AS_PASSWORD);
                    }
                    return true;
                },
            },
        },
    },
    ['body'],
);

const checkUpdateProfileValidator = checkSchema(
    {
        firstname: {
            optional: true,
            isString: {
                errorMessage: USERS_MESSAGES.NAME_MUST_BE_STRING,
            },
            isLength: {
                options: {
                    max: 50,
                    min: 1,
                },
                errorMessage: USERS_MESSAGES.NAME_LENGTH_FROM_1_TO_50,
            },
            trim: true,
        },
        lastname: {
            optional: true,
            isString: {
                errorMessage: USERS_MESSAGES.NAME_MUST_BE_STRING,
            },
            isLength: {
                options: {
                    max: 50,
                    min: 1,
                },
                errorMessage: USERS_MESSAGES.NAME_LENGTH_FROM_1_TO_50,
            },
            trim: true,
        },
        phoneNumber: {
            optional: true,
            isString: {
                errorMessage: USERS_MESSAGES.PHONENUMBER_MUST_BE_STRING,
            },
            isMobilePhone: {
                errorMessage: 'Phone number is invalid',
            },
        },
    },
    ['body'],
);
const isAdminValidator = (req, res, next) => {
    const { decoded_authorization } = req;
    if (decoded_authorization.role !== 'admin') {
        throw new ErrorsWithStatus({
            status: HTTP_STATUS.UNAUTHORIZED,
            message: USERS_MESSAGES.NOT_ENOUGH_AUTHORIZATION,
        });
    }
    next();
};
exports.registerValidator = validate(checkRegisterValidator);
exports.loginValidator = validate(checkLoginValidator);
exports.accessTokenValidator = validate(checkAccessTokenValidator);
exports.UserExistValidator = validate(checkUserExistValidator);
exports.ChangePasswordValidator = validate(checkChangePasswordValidator);
exports.UpdateProfileValidator = validate(checkUpdateProfileValidator);
exports.isAdminValidator = wrapController(isAdminValidator);
