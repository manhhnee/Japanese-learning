'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Rating extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            Rating.belongsTo(models.User, { foreignKey: 'user_id', targetKey: 'id' });
            Rating.belongsTo(models.Course, { foreignKey: 'course_id', targetKey: 'id' });
            // define association here
        }
    }
    Rating.init(
        {
            user_id: DataTypes.INTEGER,
            course_id: DataTypes.INTEGER,
            star: DataTypes.INTEGER,
            comment: DataTypes.TEXT,
            rating_date: DataTypes.DATE,
        },
        {
            sequelize,
            modelName: 'Rating',
        },
    );
    return Rating;
};
