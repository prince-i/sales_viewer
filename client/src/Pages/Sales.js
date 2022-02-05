import React from 'react';
import Axios from 'axios';
import { render } from 'react-dom';
import { Redirect } from 'react-router-dom';
import Nav from '../Components/Nav';
import Search from '../Components/Searchsales';
function Sales() {
    let auth = localStorage.getItem('auth');
    // console.log(auth);
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
                // console.log(response.data[0].id);
                // console.log(response.data[0].name);
                document.querySelector("#acctname").innerHTML = response.data[0].name;
            }
           
        });
    }

    return(
        <div className='admin'>
             <Nav/>
             <h1 className='center'>SALES</h1>
            <Search/>
        </div>
      
    )    
}

export default Sales;