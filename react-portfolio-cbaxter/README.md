## Getting Started with Create React App

$ yarn create react-app <app-name>
$ cd <app-name>

## branch: react-setup
Styling 
- $ yarn add bootstrap
- $ yarn add reactstrap
- Add to src/index.js: import 'bootstrap/dist/css/bootstrap.min.css'

Src Directories 
- Create three directories in your React application's src directory: assets, components, and pages.
- Components: Header, Footer
- Pages: Home, AboutMe, Projects, Contact, NotFound
- boilerplate functional component
```javascript
  import React from "react"

  const Home = () => {
    return (
      <>
        <h3>This is the Home Page</h3>
      </>
    )
  }

  export default Home
```

React Routers 
- $ yarn add react-router-dom
- import router components
```javascript
  // src/index.js
  import { BrowserRouter } from "react-router-dom" 

  const root = ReactDOM.createRoot(document.getElementById("root"))
  root.render(
    <React.StrictMode>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </React.StrictMode>
  )

  // src/App.js
  import { Routes, Route } from "react-router-dom"
  import Header from "./components/Header"
  import Footer from "./components/Footer"
  import AboutMe from "./pages/AboutMe"
  import Projects from "./pages/Projects"
  import Contact from "./pages/Contact"
  import Home from "./pages/Home"
  import NotFound from "./pages/NotFound"

  return (
  <>
    <Header />
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/aboutme" element={<AboutMe />} />
      <Route path="/projects" element={<Projects />} />
      <Route path="/contact" element={<Contact />} />
      <Route path="*" element={<NotFound />} />
    </Routes>
    <Footer />
  </>
)
```

## branch: header
- navigation will be place on the header bar
```javascript
  import React from "react"
  import { Nav, NavItem } from "reactstrap"
  import { NavLink } from "react-router-dom"

  const Header = () => {
    return (
      <Nav>
        <NavItem>
          <NavLink to="/" className="nav-link">
            Home
          </NavLink>
        </NavItem>
        <NavItem>
          <NavLink to="/aboutme" className="nav-link">
            About Me
          </NavLink>
        </NavItem>
        <NavItem>
          <NavLink to="/projects" className="nav-link">
            Projects
          </NavLink>
        </NavItem>
        <NavItem>
          <NavLink to="/contact" className="nav-link">
            Contact
          </NavLink>
        </NavItem>
      </Nav>
    )
  }

  export default Header
```

## branch: footer
- copyright for branding of this year
  - `&copy;` 
- Link for resources
  - react components
  - react router
  - syllabus
