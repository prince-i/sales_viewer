import React from 'react';
import './App.css';
import Login from './Pages/Login';
import Admin from './Pages/Admin';
import { BrowserRouter as Router, Switch, Route, Redirect} from 'react-router-dom';

function App() {

  return (
   <Router>
     <Switch>
       <Route exact path="/" component = {Login}/>
       <Route exact path="/admin" component = {Admin}/>
       {/* <Route exact path="/admin" component = {() => <Admin authorized={true}/>}/> */}
       
     </Switch>
   </Router>
  );
}

export default App;
