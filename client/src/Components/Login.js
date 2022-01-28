import React, {useState} from 'react';
import Axios from 'axios';


function Login(){
    
        const loginFormStyle = {
            marginTop: '3%',
        }
        const [username, setUsername] = useState('');
        const [password, setPassword] = useState('');

        const [loginStatus, setLoginStatus] = useState('');

        const login = () => {
            Axios.post('http://localhost:4000/login',{
                username: username,
                password: password,
            }).then((response) => {
                console.log(response);
               if(response.data.message){
                   setLoginStatus(response.data.message)
               }else{
                setLoginStatus(response.data[0].username)
               }
            })
        }

        return(
           
               <div className='row container z-depth-1' style={loginFormStyle}>
                <div className='col s12'>
                <h5 className='center'>LOGIN</h5>
                    <div className='col s12 input-field'>
                        <input type="text" value ={username} onChange={(e) => setUsername(e.target.value)}/><label>USERNAME</label>
                    </div>
                    <div className='col s12 input-field'>
                        <input type="password" value={password} onChange={(e) => setPassword(e.target.value)}/><label>PASSWORD</label>
                    </div>
                    {/* BUTTON */}
                    <div className='col s12 input-field'>
                        <button className='btn btn-large blue col s12' onClick={login}>LOGIN</button>
                    </div>
                </div>
                <h3 className='center'>{loginStatus}</h3>
               </div>
           
        );
    }


export default Login;