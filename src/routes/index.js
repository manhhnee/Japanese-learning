const teacherRoute = require('./teacher.routes');
const courseRoute = require('./course.routes');

const route = (app) => {
    app.use('/api/teacher', teacherRoute);
    app.use('/api/course', courseRoute);
    // ////////////////////////////////
    app.use('/', (req, res, next) => {
        return res.send('WELCOME TO SERVER');
    });
};

module.exports = route;
