import React, {useState} from "react";
import { BarChart, Bar, Tooltip, XAxis, YAxis } from 'recharts';
import Axios from 'axios';

function BarGraph(){
// console.log(branch_sales_data);
const [branch_sales_data,setBranchSales] = useState([]);

Axios.post('http://localhost:4000/chart_sales_per_branch')
.then((response) =>{
  setBranchSales(response.data);
});

  return (
    <div className="row">
      <div className="col s12">
        <div className='col s12 l6 m6'>
            <div className='card'>
              <div className='card-content'>
                <h5>ALL-TIME SALES</h5>
                  <BarChart width={600} height={300} data={branch_sales_data}>
                    <XAxis dataKey="BRANCH" />
                    <YAxis />
                    <Tooltip/>
                    <Bar dataKey="SALES" fill="#8884d8"/>
                  </BarChart>
              </div>
            </div>
        </div>
      </div>
    </div>
  );
}

export default BarGraph;