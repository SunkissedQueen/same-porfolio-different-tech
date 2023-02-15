import React from "react"
import { BrowserRouter, Routes, Route } from "react-router-dom"
import AboutMe from "./pages/AboutMe"
import BungaEdit from "./pages/BungaEdit"
import BungaIndex from "./pages/BungaIndex"
import BungaNew from "./pages/BungaNew"
import BungaShow from "./pages/BungaShow"
import Home from "./pages/Home"
import NotFound from "./pages/NotFound"
import Footer from "./components/Footer"
import Header from "./components/Header"

const App = () => {
  return (
    <BrowserRouter>
      <Header />
      <h1>Sky Bungalow App</h1>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<AboutMe />} />
        <Route path="/edit" element={<BungaEdit />} />
        <Route path="/index" element={<BungaIndex />} />
        <Route path="/new" element={<BungaNew />} />
        <Route path="/show" element={<BungaShow />} />
        <Route path="/not" element={<NotFound />} />
      </Routes>
      <Footer />
    </BrowserRouter>
  )
}
export default App