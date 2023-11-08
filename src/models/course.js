'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Course extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            Course.belongsTo(models.Teacher, { foreignKey: 'teacher_id', targetKey: 'id' });
            Course.hasMany(models.review_course, { foreignKey: 'course_id' });
            Course.hasMany(models.rating_course, { foreignKey: 'course_id' });
            // define association here
        }
    }
    Course.init(
        {
            teacher_id: DataTypes.INTEGER,
            title: DataTypes.STRING,
            description: DataTypes.TEXT,
            price: DataTypes.FLOAT,
            status: DataTypes.TINYINT,
        },
        {
            sequelize,
            modelName: 'Course',
        },
    );
    return Course;
};
