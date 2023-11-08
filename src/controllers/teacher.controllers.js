const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');
const teacherServices = require('../services/teacher.services');
class TeacherController {
    async getListTeacher(req, res, next) {
        const { limit, page, search } = req.query;
        const result = await teacherServices.getListTeacher(Number(limit), Number(page), search);
        res.json(result);
    }
    async getTeacherDetail(req, res, next) {
        const { id_teacher } = req.params;
        const result = await teacherServices.teacherDetails(id_teacher);
        res.json(result);
    }
}

module.exports = new TeacherController();
