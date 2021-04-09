import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import Fib from './Fib';
import OtherPage from './OtherPage';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <h3>Fibonacci Calculator vKubernetes 2.0</h3>
          <div>
            <Link to="/" className="App-link">Home</Link>
            <Link to="/otherPage" className="App-link">Other Page</Link>
          </div>
        </header>
        <div className="App-content">
          <Route exact path="/" component={Fib} />
          <Route path="/otherPage" component={OtherPage}/>
        </div>
      </div>
    </Router>
  );
}

export default App;
