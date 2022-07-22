const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database');

router.get('/api/eventos', (req, res)=> {
    mysqlConnection.query('SELECT * FROM eventos', (err, rows, fields)=> {
        if(!err) {  
            res.json(rows);
        } else {   
             console.log(err); 
        } 
    });
});

router.get('/api/evento/:id', (req, res)=> {
    const { id } = req.params 
    mysqlConnection.query('SELECT * FROM eventos WHERE id = ?', [id], (err, rows, fields)=> {
        if(!err) {  
            res.json(rows[0]);
        } else {   
            console.log(err); 
        } 
    });
});

router.post('/api/nuevo_evento', (req, res)=> {
    const {id , nombre, imagen, descripcion, fecha, direccion} = req.body;
    const query = `CALL eventsAddOrEdit(?, ?, ?, ?, ?, ?);`;
    mysqlConnection.query(query,[id, nombre, imagen, descripcion, fecha, direccion], (err, rows, fields)=>{
        if (!err) {
            res.json({Status: 'Evento agregado correctamente'})
        } else {
            console.log(err);
        }
    })
});

router.put('/api/edit_evento/:id', (req, res)=>{
    const {nombre, imagen, descripcion, fecha, direccion} = req.body;
    const {id} = req.params;

    const query = `CALL eventsAddOrEdit(?, ?, ?, ?, ?, ?);`
    mysqlConnection.query(query,[id, nombre, imagen, descripcion, fecha, direccion], (err, rows, fields)=>{ 
        if (!err) {
            res.json({Status: 'Evento Actualizado correctamente'})
        } else {
            console.log(err);
        }
    });
});

router.delete('/api/delete_evento/:id', (req, res)=>{
    const {id} = req.params;
    mysqlConnection.query('DELETE FROM eventos WHERE id = ?',[id],(err, rows, fields)=>{ 
        if (!err) {
            res.json({Status: 'Evento Eliminado correctamente'})
        } else {
            console.log(err);
        }
    });
});


module.exports = router;