import React, { Component,useState }from 'react';
import M from 'materialize-css';

class Searchsales extends Component {
    
    componentDidMount(){
        let elems = document.querySelectorAll('.datepicker');
        M.Datepicker.init(elems, {autoClose:true,format:'yyyy-mm-dd'});
        
        // this.state = {
        //     from: '',
        //     to: ''
        // }
    }

    

    render(){
        return(
            <div className='row'>
                <div className='col s12'>
                    <div className='input-field col s12 l4'>
                        <input type="text" className="datepicker" id="from"/>
                        <label>From</label>
                    </div>

                    <div className='input-field col s12 l4'>
                        <input type="text" className="datepicker" id="to"/>
                        <label>To</label>
                    </div>

                    <div className='input-field col s12 l4'>
                       <button className='btn blue z-depth-1 col s12'>Search</button>
                    </div>

                    {/* TABLE */}
                    <div className='col s12'>
                        <table className='center'>
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
                        </table>
                    </div>
                </div>
            </div>
        );
    }
}

export default Searchsales;
