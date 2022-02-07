import React, { useState } from 'react';
import Axios from 'axios';
import { Redirect } from 'react-router-dom';
import Nav from '../Components/Nav';

function Sales() {

    let today = new Date().toISOString().slice(0, 10)
    const [from, setFromDT] = useState(today);
    const [to, setToDT] = useState(today);
    const [salesData, setSalesData] = useState([]);

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
                document.querySelector("#acctname").innerHTML = response.data[0].name;
            }
           
        });
    }

    const sales = () =>{
        Axios.post('http://localhost:4000/sales_rpt',{
            from: from,
            to:to
        }).then((response) => response.data)
        .then((response) => setSalesData(response));
    }
    
    const export_sales = () => {
        let separator = ',';
        let table_id = 'salesTable';
        var rows = document.querySelectorAll('table#' + table_id + ' tr');
        // Construct csv
        if(rows.length > 1){
            var csv = [];
        for (var i = 0; i < rows.length; i++) {
            var row = [], cols = rows[i].querySelectorAll('td, th');
            for (var j = 0; j < cols.length; j++) {
                var data = cols[j].innerText.replace(/(\r\n|\n|\r)/gm, '').replace(/(\s\s)/gm, ' ')
                data = data.replace(/"/g, '""');
                // Push escaped string
                row.push('"' + data + '"');
            }
            csv.push(row.join(separator));
        }
        var csv_string = csv.join('\n');
        // Download it
        var filename = 'Sales_Viewer'+ '_' + new Date().toLocaleDateString() + '.csv';
        var link = document.createElement('a');
        link.style.display = 'none';
        link.setAttribute('target', '_blank');
        link.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv_string));
        link.setAttribute('download', filename);
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        }
    }
    // console.table(salesData);
    return(
        <div className='admin'>
             <Nav/>
             <h1 className='center'>SALES</h1>
             <div className='row'>
                <div className='col s12'>
                    <div className='input-field col s12 l4'>
                        <input type="date" className="" id="from" value={from} onChange={(e) => setFromDT(e.target.value)}/>
                        <label>From</label>
                    </div>

                    <div className='input-field col s12 l4'>
                        <input type="date" className="" id="to"   
                        value={to} onChange={(e) => setToDT(e.target.value)}
                        />
                        <label>To</label>
                    </div>

                    <div className='input-field col s12 l2'>
                       <button className='btn blue z-depth-1 col s12' onClick={sales}>Search</button>
                    </div>
                    <div className='input-field col s12 l2'>
                       <button className='btn #0d47a1 blue darken-4 z-depth-1 col s12' onClick={export_sales}>export</button>
                    </div>

                    {/* TABLE */}
                    <div className='col s12'>
                        <table className='center' id='salesTable'>
                            <thead>
                                <tr>
                                <th>#</th>
                                <th>ITEM CODE</th>
                                <th>ITEM NAME</th>
                                <th>COST AMT.</th>
                                <th>PRICE AMT.</th>
                                <th>QTY. AMT.</th>
                                <th>TRANSACTION DATE</th>
                                <th>CLIENT</th>
                                </tr>
                            </thead>
                            <tbody>
                                    {
                                        salesData.map((row) =>(
                                            <tr key={row.ID}>
                                            <td>{row.ID}</td>
                                            <td>{row.REF_CODE}</td>
                                            <td>{row.REF_NAME}</td>
                                            <td>{row.COST_AMT}</td>
                                            <td>{row.PRICE_AMT}</td>
                                            <td>{row.QTY_AMT}</td>
                                            <td>{
                                                    (row.TRANSAC_DATE).split('T')[0]
                                                }
                                            </td>
                                            <td>{row.CLIENT}</td> 
                                        </tr>
                                        ))
                                    }
                                </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
      
    )    
}

export default Sales;