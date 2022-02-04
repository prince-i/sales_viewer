import React from 'react';
import Axios from 'axios';
import { render } from 'react-dom';
import { Redirect } from 'react-router-dom';
import Nav from '../Components/Nav';

function Sales() {
    return(
        <div className='admin'>
             <Nav/>
             <h1 className='center'>SALES</h1>
        </div>
      
    )    
}

export default Sales;