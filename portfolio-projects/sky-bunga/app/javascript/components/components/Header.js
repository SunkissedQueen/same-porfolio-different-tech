import React from "react"
import { Nav, NavItem } from "reactstrap"
import { NavLink } from "react-router-dom"

const Header = ({
  logged_in,
  current_user,
  new_user_route,
  sign_in_route,
  sign_out_route
}) => {
  console.log("current_user:", current_user)
  console.log("new_user_route:", new_user_route)
  return (
    <Nav>
      <NavItem>
        <NavLink to="/" className="nav-link">
          Home
        </NavLink>
      </NavItem>
      <NavItem>
        <NavLink to="/about" className="nav-link">
          About Me
        </NavLink>
      </NavItem>
      { logged_in && 
        <>
          <NavItem>
            <NavLink to="/index" className="nav-link">
              See the Vacant Bungalows
            </NavLink>
          </NavItem>
          <NavItem>
            <NavLink to="/new" className="nav-link">
              Add a Bungalow
            </NavLink>
          </NavItem>
          <NavItem>
            <a href={sign_out_route} className="nav-link">
              Sign Out
            </a>
          </NavItem>
        </>
      }
      { !logged_in && 
        <>
          <NavItem>
            <a href={sign_in_route} className="nav-link">
              Sign In
            </a>
          </NavItem>
          <NavItem>
            <a href={new_user_route} className="nav-link">
              Sign Up
            </a>
          </NavItem>
        </>
      }
    </Nav>
  )
}

export default Header