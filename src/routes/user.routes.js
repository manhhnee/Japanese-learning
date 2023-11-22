const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const {
    registerValidator,
    loginValidator,
    accessTokenValidator,
    UserExistValidator,
} = require('../middlewares/user.middlewares.js');
// const { FormdataValidator } = require('../middlewares/Formdata.middlewares');
const router = Router();

const userControllers = require('../controllers/user.controllers');
router.post('/register', registerValidator, wrapController(userControllers.register));
router.post('/login', loginValidator, wrapController(userControllers.login));
router.get('/profile/me', accessTokenValidator, wrapController(userControllers.getMyprofile));
router.get('/profile/:userID', UserExistValidator, wrapController(userControllers.getProfile));

module.exports = router;
