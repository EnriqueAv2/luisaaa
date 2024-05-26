const express = require('express');
const { engine} = require('express-handlebars');
const myconnection = require('express-myconnection');
const mysql = require('mysql');
const sessions = require('express-session');
const bodyParser = require('body-parser');

const app = express();
app.set('port', 8000);

app.set('views', __dirnames + '/views');
app.engine('.hbs', engine({
    extname: '.hbs',
}));
app.set('view engine', 'hbs');

app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(bodyParser.json());

app.use(myconnection(mysql, {
    host: 'localhost',
    user: 'root',
    password: 'root',
    port: 3306,
    database:'profesime'
}));

app.use(sessions({
    secret:'secret',
    resave: true,
    saveUninitialized: true
}));

app.listen(app.get('port'), () => {
    console.log('listening on port ', app.get('port'));
});

app.get('/', (req, res) => {
    res.render('home');
});