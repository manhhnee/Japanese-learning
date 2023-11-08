'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class review_course extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            review_course.belongsTo(models.User, { foreignKey: 'user_id', targetKey: 'id' });
            review_course.belongsTo(models.Course, { foreignKey: 'course_id', targetKey: 'id' });
            // define association here
        }
    }
    review_course.init(
        {
            user_id: DataTypes.INTEGER,
            course_id: DataTypes.INTEGER,
            comment: DataTypes.TEXT,
            comment_date: DataTypes.DATE,
        },
        {
            sequelize,
            modelName: 'review_course',
        },
    );
    return review_course;
};
