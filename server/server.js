const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const connection = require('./db');


const app = express();

app.use(cors());
app.use(bodyParser.json());


app.post('/login',(req,res) => {
    const username = req.body.username;
    const password = req.body.password;
    const LOGIN_QUERY = `SELECT * FROM accounts WHERE username = ? AND password = ?`;
    connection.query(LOGIN_QUERY,[username,password],
        (err,result) => {
            if(err){
                res.send({err:err});
            }
            if(result.length > 0 ){
                res.send(result);
            }else{
                res.send({message: "WRONG USERNAME/PASSWORD!"});
            }
        });
});

app.post('/validate_session',(req,res) => {
    const user = req.body.usernameStr;
    const VERIFY_USER = `SELECT id,name FROM accounts WHERE username = ?`;
    connection.query(VERIFY_USER,[user],
        (err,result) => {
            if(err){
                res.send({err:err});
            }
            if(result.length > 0 ){
                res.send(result);
            }else{
                res.send({message: "invalid"});
            }
        });
});


app.post('/sales_rpt',(req,res)=>{
    const fromDT = req.body.from;
    const toDT = req.body.to;
    const SALES_QUERY = `SELECT pos_sales.id_no as ID, master_item.ref_cd as REF_CODE, master_item.ref_nm as REF_NAME, pos_sales.cost_am as COST_AMT, pos_sales.price_am as PRICE_AMT, pos_sales.qty_am as QTY_AMT, tran_dt as TRANSAC_DATE, master_client.ref_nm as CLIENT FROM master_item LEFT JOIN pos_sales ON master_item.id_no = pos_sales.itemid_no LEFT JOIN master_client ON pos_sales.clientid_no = master_client.id_no
    WHERE tran_dt >= ? AND tran_dt <= ? ORDER BY pos_sales.id_no ASC`;
    connection.query(SALES_QUERY,[fromDT,toDT],
        (err,result) => {
            if(err){
                res.send({err:err});
            }
            if(result.length > 0){
                res.send(result);
            }else{
                res.send(result);
            }
        });

});

app.post('/client_cnt',(req,res) =>{
    const CLIENT_QUERY = `SELECT COUNT(id_no) as CLIENT_CNT FROM master_client`;
    connection.query(CLIENT_QUERY,(err,result) =>{
        if(err) console.log(err)
        else res.send(result);
    })
});

app.post('/branches_cnt',(req,res) =>{
    const BRANCH_QUERY = `SELECT COUNT(id_no) as BRANCH_CNT FROM master_location`;
    connection.query(BRANCH_QUERY,(err,result) =>{
        if(err) console.log(err)
        else res.send(result);
    })
});

app.post('/items_cnt',(req,res) =>{
    const ITEM_QUERY = `SELECT COUNT(id_no) as ITEM_CNT FROM master_item`;
    connection.query(ITEM_QUERY,(err,result) =>{
        if(err) console.log(err)
        else res.send(result);
    })
});

app.post('/trans_cnt',(req,res) =>{
    const TRANSAC_QUERY = `SELECT COUNT(id_no) as TRANSAC_CNT FROM pos_sales`;
    connection.query(TRANSAC_QUERY,(err,result) =>{
        if(err) console.log(err)
        else res.send(result);
    })
});



// app.get('/tasks',(req,res)=>{
//     const TASK_QUERY = `SELECT *FROM task`;
//     connection.query(TASK_QUERY, (err,response)=>{
//         if(err) console.log(err)
//         else res.send(response)
//     })
//     // res.send('list of all task');
// });

// app.post('/addTask',(req,res)=>{
//     // console.log(req.body.date);
//     const ADD_QUERY = `INSERT INTO task_db.task (tasks) VALUES ('${req.body.task}')`;
//     connection.query(ADD_QUERY, (err)=>{
//         if(err) console.log(err,response)
//         else res.send('added')
//     });
// });

// app.delete('/deleteTask/:id',(req,res)=>{
//     // res.send('delete task')
//     // console.log(req.params.id);
//     const DELETE_QUERY = `DELETE FROM task_db.task WHERE (id=${req.params.id})`;
//     connection.query(DELETE_QUERY, (err)=>{
//         if(err) console.log(err,response)
//         else res.send('deleted')
//     })
// });


app.listen(4000,()=>{
    console.log('running on port 4000');
});