import React from 'react'
import ReactDOM from 'react-dom'
import App from './App'
import './index.css'
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import { AppContextProvider } from './components/AppContext.js'

ReactDOM.render(
    <React.StrictMode>
        <AppContextProvider>
            <App />
        </AppContextProvider>
    </React.StrictMode>,
    document.getElementById('root')
);
