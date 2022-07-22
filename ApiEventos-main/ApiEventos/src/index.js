const express = require('express');

const app = express();

app.set('port', process.env.PORT || 3001);

app.use(express.json());


app.use(require('./routes/events'));


app.listen(app.get('port'), ()=>{
    console.log('listening on port ', app.get('port'));
});
