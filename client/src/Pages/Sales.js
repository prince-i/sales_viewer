import React from 'react';
import Axios from 'axios';
import { render } from 'react-dom';
import { Redirect } from 'react-router-dom';
import Nav from '../Components/Nav';

function Sales() {
    let auth = localStorage.getItem('auth');
    if(auth === 0 || auth === '' || auth === null || auth === undefined){
        return <Redirect to="/" />
    }

    return(
        <div className='admin'>
             <Nav/>
             <h1 className='center'>HANEP KA</h1>
        </div>
      
    )    
}

export default Sales;