const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');
const db = require('../models');
const { Op } = require('sequelize');

class teacherService {
    async getListTeacher(limit,page,search) {
        var offset = 0;
        if (page && limit) {
            offset = (page - 1) * limit;
        }
        if (!limit) {
            limit = 100;
        }
       
       
        const searchCondition = search ? { nick_name: { [Op.like]: `%${search}%` } } : {};
        const options = {
            ...searchCondition,
        };
        const Count = await db.User.count({
            where: {
                ...options,
                role: 'teacher',
            },
        });
        const teachers = await db.User.findAll({
            where: {
                ...options,
            },
            offset: offset,
            limit: limit,
            attributes: {
                exclude: ['password','createdAt','updatedAt'],
            },
        });
        const Teachers = JSON.parse(JSON.stringify(teachers));

        const totalPages = Math.ceil(Count / limit);
        return {
            success: true,
            result: Teachers,
            totalPages: totalPages,
            page: page ? page : 1,
        };
    }
    async teacherDetails(id_teacher) {
        const teacher = await db.User.findOne({
            where: {
                id: id_teacher,
            },
            attributes: {
                exclude: ['password','createdAt','updatedAt'],
            },
            include: [
                { model: db.Teacher, as: 'Teacher', attributes: { exclude: ['createdAt','updatedAt']} },
                
            ],
        });
        if (!teacher) throw new ErrorsWithStatus({status: HTTP_STATUS.NOT_FOUND, message: 'Teacher not found'})
        return {
            success: true,
            result: teacher,
        }
    }
}
module.exports = new teacherService();
