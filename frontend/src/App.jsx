import { useState } from 'react';
import './App.css';
import { User, CreditCard, Send, LogIn } from 'lucide-react';

function App() {
  const [response, setResponse] = useState('');
  const [loggedIn, setLoggedIn] = useState(false);
  const API_URL = import.meta.env.VITE_API_GATEWAY_URL;

  const handleLogin = () => {
    setLoggedIn(true);
  };

  const callApi = async (path) => {
    try {
      const res = await fetch(`${API_URL}${path}`);
      const data = await res.text();
      setResponse(data);
    } catch (err) {
      setResponse("API Error: " + err.message);
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-sky-500 to-indigo-800 text-white flex flex-col items-center justify-center p-4 font-sans">
      <h1 className="text-4xl md:text-5xl font-bold mb-6 text-center drop-shadow-md">
        🚀 Test Banking App on Azure Infra
      </h1>

      {!loggedIn ? (
        <button
          onClick={handleLogin}
          className="bg-white text-indigo-800 font-semibold px-6 py-3 rounded-full shadow-md hover:bg-indigo-100 flex items-center gap-2 mb-8"
        >
          <LogIn className="w-5 h-5" />
          Mock Login
        </button>
      ) : (
        <div className="flex flex-wrap gap-4 justify-center mb-6">
          <button
            className="bg-white text-sky-800 px-5 py-3 rounded-full font-medium flex items-center gap-2 shadow-md hover:bg-sky-100"
            onClick={() => callApi('/api/v1/users/123')}
          >
            <User className="w-5 h-5" />
            Call User API
          </button>
          <button
            className="bg-white text-green-800 px-5 py-3 rounded-full font-medium flex items-center gap-2 shadow-md hover:bg-green-100"
            onClick={() => callApi('/api/v1/accounts/123')}
          >
            <CreditCard className="w-5 h-5" />
            Call Account API
          </button>
          <button
            className="bg-white text-pink-800 px-5 py-3 rounded-full font-medium flex items-center gap-2 shadow-md hover:bg-pink-100"
            onClick={() => callApi('/api/v1/transactions')}
          >
            <Send className="w-5 h-5" />
            Call Transaction API
          </button>
        </div>
      )}

      <div className="bg-white text-gray-800 rounded-xl p-4 w-full max-w-2xl text-center shadow-lg">
        <p className="font-mono break-words">
          {response || "Click an API to see the response here"}
        </p>
      </div>
    </div>
  );
}

export default App;
