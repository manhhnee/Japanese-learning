const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');
const CourseServices = require('../services/course.services');
class CourseController {
    async getListCourse(req, res, next) {
        const { limit, page, search } = req.query;
        const result = await CourseServices.getListCourse(Number(limit), Number(page), search);
        res.json(result);
    }
    async getCourseDetail(req, res, next) {
        const { id_Course } = req.params;
        const result = await CourseServices.CourseDetails(id_Course);
        res.json(result);
    }
}

module.exports = new CourseController();
