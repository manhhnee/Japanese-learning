const userServices = require('../services/user.services');
const USERS_MESSAGES = require('../constants/messages');

class AccountController {
    async register(req, res, next) {
        const data = req.body;
        const result = await userServices.register(data);
        return res.json(result);
    }
    async login(req, res, next) {
        const { user } = req;
        const result = await userServices.login(user.id);
        return res.json(result);
    }

    async getMyprofile(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const result = await userServices.getProfile(userID);
        res.json(result);
    }

    async getProfile(req, res, next) {
        const { userID } = req.params;
        const result = await userServices.getProfile(userID);
        res.json(result);
    }
}
module.exports = new AccountController();
