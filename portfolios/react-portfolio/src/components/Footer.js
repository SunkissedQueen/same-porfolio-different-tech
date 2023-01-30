import React, {useState} from "react"
import { NavLink } from "react-router-dom"

const Footer = () => {

  return (
    <>
      <h5>
        &copy; Syntactical Astronaut | Jan 2023
      </h5>
      <h5>
        Acknowledgements:
      </h5>
      <NavLink to="/learn">
        LEARN Academy
      </NavLink>
      <br />
      <a href="https://www.w3schools.com/" target="_blank">
        W3Schools
      </a> 
      <br />
      <a href="https://www.freecodecamp.org/news/react-router-tutorial/#:~:text=To%20add%20the%20link%20in,link%20if%20it%20is%20active." target="_blank">
        Free Code Camp
      </a> 
    </>
  )
}

export default Footer