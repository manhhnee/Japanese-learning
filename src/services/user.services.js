const db = require('../models');
const ErrorsWithStatus = require('../constants/Error');
const hashPassword = require('../utils/crypto');
const USERS_MESSAGES = require('../constants/messages');
const { signAccessToken, signReFreshToken } = require('../utils/JWT');
const HTTP_STATUS = require('../constants/httpStatus');
const dotenv = require('dotenv');
dotenv.config();
class UserServices {
    async findUserLogin(email, password) {
        const user = await db.User.findOne({
            where: { mail: email, password: hashPassword(password) },
        });
        if (user === null) {
            throw new Error(USERS_MESSAGES.WRONG_EMAIL_OR_PASSWORD);
        }
        return user;
    }
    async isEmailExist(email) {
        const user = await db.User.findOne({ where: { mail: email } });
        if (user === null) return false;
        else return true;
    }

    ////////// MAIN FUNCTION /////////////
    async register(data) {
        const user = await db.User.create({
            first_name: data.first_name,
            last_name: data.last_name,
            mail: data.email,
            role: data.role,
            password: hashPassword(data.password),
        });
        // await sendEmail('<h1 style="color:red">😍 register successfully 😍</h1>', 'PBL6_message', data.email);
        return {
            success: true,
            message: USERS_MESSAGES.REGISTER_SUCCESS,
        };
    }
    async login(userID) {
        const accessToken = await signAccessToken({ userID: userID });

        return {
            success: true,
            message: USERS_MESSAGES.LOGIN_SUCCESS,
            accessToken,
        };
    }

    async getProfile(userID) {
        const user = await db.User.findOne({
            where: { id: userID },
            attributes: {
                exclude: ['password'],
            },
        });
        return {
            success: true,
            user: user,
        };
    }
}
module.exports = new UserServices();
