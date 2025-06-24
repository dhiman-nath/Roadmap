import React, { useState, useEffect, useContext } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { AuthContext } from '../../Authorization/AuthContext';

const Navbar = () => {

    const [isOpen, setIsOpen] = useState(false);
//   const [isLoggedIn, setIsLoggedIn] = useState(false);
  const navigate = useNavigate();
  const {logout, isLoggedIn} = useContext(AuthContext);

  useEffect(() => {
    const token = localStorage.getItem('token');
    // setIsLoggedIn(!!token);
  }, []);

 const handleLogout = async () => {
//   const token = localStorage.getItem('token');

  try {
    // await fetch('http://localhost:8000/api/logout', {
    //   method: 'POST',
    //   headers: {
    //     'Content-Type': 'application/json',
    //     Authorization: `Bearer ${token}`,
    //   },
    // });
    logout();

    // Clear token and update state
    // localStorage.removeItem('token');
    // setIsLoggedIn(false);
    // navigate('/login');
  } catch (error) {
    console.error('Logout failed:', error);
  }
};

    return (
        <div>
            <nav className="bg-white border-b border-gray-200 shadow-sm">
      <div className="max-w-7xl mx-auto px-4 py-3 flex justify-between items-center">
        <Link to="/" className="text-xl font-bold text-blue-600">RoadmapApp</Link>

        <div className="md:hidden">
          <button onClick={() => setIsOpen(!isOpen)}>
            <svg
              className="w-6 h-6 text-gray-800"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg"
            >
              {isOpen ? (
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
              ) : (
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16" />
              )}
            </svg>
          </button>
        </div>

        <div className={`md:flex gap-6 items-center ${isOpen ? 'block' : 'hidden'} md:block`}>
          <Link to="/" className="text-gray-700 hover:text-blue-600">Home</Link>
          

          {isLoggedIn ? (
            <button onClick={handleLogout} className="text-red-600 hover:underline">Logout</button>
          ) : (
            <>
              <Link to="/login" className="text-blue-600 hover:underline">Login</Link>
              <Link to="/register" className="text-blue-600 hover:underline">Register</Link>
            </>
          )}
        </div>
      </div>
    </nav>
        </div>
    );
};

export default Navbar;