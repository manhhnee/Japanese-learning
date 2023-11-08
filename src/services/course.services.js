const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');
const db = require('../models');
const { Op } = require('sequelize');

class CourseServices {
    async getListCourse(limit, page, search) {
        var offset = 0;
        if (page && limit) {
            offset = (page - 1) * limit;
        }
        if (!limit) {
            limit = 100;
        }

        const searchCondition = search ? { title: { [Op.like]: `%${search}%` } } : {};
        const options = {
            ...searchCondition,
        };
        const Count = await db.Course.count({
            where: {
                ...options,
            },
        });
        const courses = await db.Course.findAll({
            where: {
                ...options,
            },
            offset: offset,
            limit: limit,
            attributes: {
                exclude: ['createdAt', 'updatedAt'],
            },
            include: [
                {
                    model: db.Teacher,
                    attributes: {
                        exclude: ['createdAt', 'updatedAt'],
                    },
                    include: [
                        {
                            model: db.User,
                            // as: 'inforUser',
                            attributes: {
                                exclude: ['id', 'password', 'createdAt', 'updatedAt'],
                            },
                        },
                    ],
                },
            ],
        });
        const Courses = JSON.parse(JSON.stringify(courses));
        for (let i = 0; i < Courses.length; i++) {
            const rating = await db.rating_course.findAll({
                where: {
                    course_id: Courses[i].id,
                },
                attributes: [[db.sequelize.fn('AVG', db.sequelize.col('rate')), 'totalStar']],
            });
            const Rating = JSON.parse(JSON.stringify(rating));
            Courses[i].totalStar = Rating[0].totalStar ? Rating[0].totalStar : 0;
        }
        const totalPages = Math.ceil(Count / limit);
        return {
            success: true,
            result: Courses,
            totalPages: totalPages,
            page: page ? page : 1,
        };
    }
    async CourseDetails(id_course) {
        const course = await db.Course.findOne({
            where: {
                id: id_course,
            },
            attributes: {
                exclude: ['createdAt', 'updatedAt'],
            },
            include: [
                {
                    model: db.Teacher,
                    attributes: {
                        exclude: ['createdAt', 'updatedAt'],
                    },
                    include: [
                        {
                            model: db.User,
                            // as: 'inforUser',
                            attributes: {
                                exclude: ['id', 'password', 'createdAt', 'updatedAt'],
                            },
                        },
                    ],
                },
            ],
        });
        const Course = JSON.parse(JSON.stringify(course));
        const rating = await db.rating_course.findAll({
            where: {
                course_id: id_course,
            },
            attributes: [[db.sequelize.fn('AVG', db.sequelize.col('rate')), 'totalStar']],
        });
        const Rating = JSON.parse(JSON.stringify(rating));
        Course.totalStar = Rating[0].totalStar ? Rating[0].totalStar : 0;
        const comment = await db.review_course.findAll({
            where: {
                course_id: id_course,
            },
            attributes: {
                exclude: ['createdAt', 'updatedAt'],
            },
        });
        const Comment = JSON.parse(JSON.stringify(comment));
        Course.comment = Comment;
        return Course;
    }
}
module.exports = new CourseServices();
