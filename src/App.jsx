import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import Navbar from './components/navbar';
import Home from './components/home';
import Footer from "./components/footer";
import { DataProvider } from './context/DataProvider.jsx';
import PageGoods from './components/goodsPage.jsx';
import PageMangas from './components/mangasPage.jsx';
import PageFigures from './components/figuresPage.jsx';
import PageCds from './components/cdsPage.jsx';
import Sale from './components/salePage.jsx';
import Contact from './components/contactPage.jsx';
import Payment from './components/paymentsPage.jsx';
import Thanks from './components/confirmationPage.jsx';

const About = () => <h2>ℹ️ Acerca de</h2>;

function App() {
  return (
    <DataProvider>
      <Router>
        <Navbar />
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/about" element={<About />} />
            <Route path="/contacto" element={<Contact />} />
            <Route path="/goods" element={<PageGoods />} />
            <Route path="/figures" element={<PageFigures />} />
            <Route path="/mangas" element={<PageMangas />} />
            <Route path="/cds" element={<PageCds />} />
            <Route path="/ofertas" element={<Sale />} />
            <Route path="/pagos" element={<Payment />} />
            <Route path="/gracias" element={<Thanks />} />
          </Routes>
        <Footer />
      </Router>
    </DataProvider>
  );
}


export default App;