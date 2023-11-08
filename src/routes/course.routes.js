const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const teacherControllers = require('../controllers/teacher.controllers');
const courseController = require('../controllers/course.controller');

const router = Router();

router.get('/', wrapController(courseController.getListCourse));
router.get('/:id_Course', wrapController(courseController.getCourseDetail));
// router.post('/',  wrapController(teacherServices.createData));
module.exports = router;
