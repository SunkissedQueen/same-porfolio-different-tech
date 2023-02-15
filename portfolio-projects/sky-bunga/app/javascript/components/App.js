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

const App = ({
  logged_in,
  current_user,
  new_user_route,
  sign_in_route,
  sign_out_route
}) => {
  console.log("logged_in:", logged_in)
  console.log("current_user:", current_user)
  console.log("new_user_route:", new_user_route)
  console.log("sign_in_route:", sign_in_route)
  console.log("sign_out_route:", sign_out_route)
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