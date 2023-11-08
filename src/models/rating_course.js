'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class rating_course extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            rating_course.belongsTo(models.User, { foreignKey: 'user_id', targetKey: 'id' });
            rating_course.belongsTo(models.Course, { foreignKey: 'course_id', targetKey: 'id' });
            // define association here
        }
    }
    rating_course.init(
        {
            user_id: DataTypes.INTEGER,
            course_id: DataTypes.INTEGER,
            rate: DataTypes.FLOAT,
            rating_date: DataTypes.DATE,
        },
        {
            sequelize,
            modelName: 'rating_course',
        },
    );
    return rating_course;
};
