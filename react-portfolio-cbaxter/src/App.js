import React from "react"
import { Routes, Route } from "react-router-dom"
import Header from "./components/Header"
import Footer from "./components/Footer"
import AboutMe from "./pages/AboutMe"
import Projects from "./pages/Projects"
import Contact from "./pages/Contact"
import Home from "./pages/Home"
import Learn from "./pages/Learn"
import NotFound from "./pages/NotFound"

const App = () => {
  return (
    <>
      <h3>This is the App Page</h3>
      <Header />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/aboutme" element={<AboutMe />} />
        <Route path="/projects" element={<Projects />} />
        <Route path="/contact" element={<Contact />} />
        <Route path="/learn" element={<Learn />} />
        <Route path="*" element={<NotFound />} />
      </Routes>
      <Footer />
    </>
  )
}

export default App