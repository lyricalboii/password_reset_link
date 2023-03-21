import React,{useState} from "react";

const Signup = () => {
    const [data, setData] = useState({name: "", email: "", password: ""})
    const {name, email, password} = data;
    const host = "http://localhost:5050";

    const handleSubmit = async(e)=>{
        e.preventDefault();
        const response = await fetch(`${host}/register`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                
            },
            body: JSON.stringify(data)
        })

        const json = await response.json();
        console.log(json)
    }

  return (
    <div className="container mt-3">
      <form onSubmit={handleSubmit}>
      <div className="mb-3">
          <label htmlFor="name" className="form-label">
            Name
          </label>
          <input
            type="text"
            className="form-control"
            id="name"
            name="name"
            value={name}
            onChange={(e)=> setData({...data, [e.target.name]: e.target.value})}
            aria-describedby="emailHelp"
          />
        </div>
        <div className="mb-3">
          <label htmlFor="email" className="form-label">
            Email address
          </label>
          <input
            type="email"
            className="form-control"
            id="email"
            value={email}
            aria-describedby="emailHelp"
            onChange={(e)=> setData({...data, [e.target.name]: e.target.value})}
            name="email"
          />
          <div id="emailHelp" className="form-text">
            We'll never share your email with anyone else.
          </div>
        </div>
        <div className="mb-3">
          <label htmlFor="password" className="form-label">
            Password
          </label>
          <input
            type="password"
            name="password"
            className="form-control"
            onChange={(e)=> setData({...data, [e.target.name]: e.target.value})}
            id="password"
            value={password}
          />
        </div>
        <button type="submit" className="btn btn-primary">
          Submit
        </button>
      </form>
    </div>
  );
};

export default Signup;
