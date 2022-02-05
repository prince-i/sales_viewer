import React, { Component } from 'react';
import { BrowserRouter as Router, Switch, Route, Redirect, Link } from 'react-router-dom';
import M from 'materialize-css';

class Nav extends Component {
  
    componentDidMount() {
        let elems = document.querySelectorAll('.dropdown-trigger');
        M.Dropdown.init(elems, {inDuration: 300, outDuration: 225,constrainWidth:false});
    }
    Logout = () =>{
        // console.log('logout');
        localStorage.setItem('auth','0');
    }

render(){
    return (
            <nav className='blue z-depth-2'>
                <ul className='right'>
                   <li>
                       {/* <a href=''>Statistics</a> */}
                       <Link to="/admin">Statistics</Link>
                   </li>
                   <li>
                       {/* <a href=''>Sales Report</a> */}
                       <Link to="/sales">Sales Report</Link>
                   </li>
                   <li>
                       <a href='#' className='dropdown-trigger' data-target='account_settings' id='acctname'>Account</a>
                       <ul id='account_settings' className='dropdown-content'>
                        <li><a href="">Account Settings</a></li>
                        <li><a href="" onClick={this.Logout}>Logout</a></li>
                        </ul>
                    </li>
                   </ul>
               </nav>
            );
    }
}


export default Nav;