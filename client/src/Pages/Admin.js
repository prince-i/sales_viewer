import React, {useState} from 'react';
import Axios from 'axios';
// import { render } from 'react-dom';
import { Redirect } from 'react-router-dom';
import Nav from '../Components/Nav';
import SampleChart from '../Components/BarGraph';

function Admin() {
    const [clients,SetClient] = useState('0');
    const [branches, setBranches] = useState('0');
    const [itemsCnt, setItemsCnt] = useState('0');
    const [transactCnt,setTransaction] = useState('0');

    let auth = localStorage.getItem('auth');
    let username = localStorage.getItem('username');
    // CONVERT USERNAME FROM HEX TO ASCII/STRING
    var usernameString = username.toString();//force conversion
    var usernameStr = '';
    for (var i = 0; i < usernameString.length; i += 2){
        usernameStr += String.fromCharCode(parseInt(usernameString.substr(i, 2), 16));
    }
    // VALIDATION OF AUTHENTICATED LOGIN
    if(auth === '0' || auth === '' || auth === null || auth === undefined){
        return <Redirect to="/" />
    }else{
        // CHECK USERNAME IF VALID IN DB
        Axios.post('http://localhost:4000/validate_session',{
            usernameStr: usernameStr
        }).then((response) => {
            if(response.data.message){
                localStorage.setItem('auth','0');
            }else{
                document.querySelector("#acctname").innerHTML = response.data[0].name;
            }
            
        });
    }

    Axios.post('http://localhost:4000/client_cnt')
    .then((response) =>{
        SetClient(response.data[0].CLIENT_CNT);
    });

    Axios.post('http://localhost:4000/branches_cnt')
    .then((response) =>{
        // console.log(response.data);
        setBranches(response.data[0].BRANCH_CNT);
    });

    Axios.post('http://localhost:4000/items_cnt')
    .then((response) =>{
        setItemsCnt(response.data[0].ITEM_CNT);
    });

    Axios.post('http://localhost:4000/trans_cnt')
    .then((response) =>{
        setTransaction(response.data[0].TRANSAC_CNT);
    });

    return(
        <div className='admin'>
            <Nav/>
            <h1 className='center'>DASHBOARD</h1>
            {/* CARDS */}
            <div className='row col s12'>
                {/* CLIENT */}
                <div className='col s3'>
                    <div className='card'>
                        <div className='card-content'>
                            <h5>TOTAL CLIENTS</h5>
                            <span id="" className='flow-text'>{clients}</span>
                        </div>
                    </div>
                </div>
                {/* BRANCHES */}
                <div className='col s3'>
                    <div className='card'>
                        <div className='card-content'>
                            <h5>TOTAL BRANCHES</h5>
                            <span id="" className='flow-text'>{branches}</span>
                        </div>
                    </div>
                </div>
                {/* ITEMS */}
                <div className='col s3'>
                    <div className='card'>
                        <div className='card-content'>
                            <h5>TOTAL ITEMS</h5>
                            <span id="" className='flow-text'>{itemsCnt}</span>
                        </div>
                    </div>
                </div>
                {/* TRANSACTIONS */}
                <div className='col s3'>
                    <div className='card'>
                        <div className='card-content'>
                            <h5>TOTAL TRANSACTION</h5>
                            <span id="" className='flow-text'>{transactCnt}</span>
                        </div>
                    </div>
                </div>
            </div>
            <SampleChart/>
        </div>
      
    )    
}

export default Admin;