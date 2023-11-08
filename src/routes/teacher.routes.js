const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const teacherControllers = require('../controllers/teacher.controllers');
const teacherServices = require('../services/teacher.services');
// const { loginValidator } = require('../middlewares/user.middlewares.js');

const router = Router();

// const UserController = require('../controllers/user.controllers');
router.get('/', wrapController(teacherControllers.getListTeacher));
router.get('/:id_teacher', wrapController(teacherControllers.getTeacherDetail));
router.post('/', wrapController(teacherServices.createData));
module.exports = router;
