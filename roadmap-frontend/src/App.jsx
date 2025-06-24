import { useState } from 'react'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import ItemsList from './assets/pages/ItemsList'
import Login from './assets/pages/Login';
import Register from './assets/pages/Register';
import Comment from './assets/pages/Comment';
import Navbar from './assets/pages/Navbar';
import ProtectedRoute from './Authorization/ProtectedRoute';
function App() {
  const [count, setCount] = useState(0)

 return (
    <Router>
      <Navbar/>
      <Routes>
        <Route path="/" element={
          <ProtectedRoute>
            <ItemsList />
          </ProtectedRoute>
        }/>
        <Route path="login" element={<Login/>}/>
        <Route path="register" element={<Register/>} />
       
      </Routes>
    </Router>
  );
}

export default App
