import ReactDOM from 'react-dom'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'
import 'semanticJS'
import 'semanticCSS'
// import './app.styl'

class App extends React.Component {
  render() {
    return <div id='app'>
      {this.props.children}
    </div>
  }
}

ReactDOM.render(
  <Router history={browserHistory}>
    <Route path='/' component={App}>
    </Route>
  </Router>
, document.getElementById('root'));

