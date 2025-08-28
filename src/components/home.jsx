import React, { useState, useEffect, useContext } from 'react';
import { Link } from 'react-router-dom';
import { Search } from 'lucide-react';
import { DataContext } from '../context/DataProvider.jsx';
import BannerHero from './bannerHero';

const HomePage = () => {
  const [productos, setProductos] = useState([]);
  const [franquiciasFiltradas, setFranquiciasFiltradas] = useState([]);
  const [filtroActivo, setFiltroActivo] = useState('todos');
  const [loading, setLoading] = useState(true);
  const [busqueda, setBusqueda] = useState('');
  const { carrito, setCarrito } = useContext(DataContext);

  const añadirAlCarrito = (producto) => {
    const productoExistente = carrito.find(item => item.id === producto.id);
    if (productoExistente) {
      setCarrito(carrito.map(item =>
        item.id === producto.id ? { ...item, cantidad: item.cantidad + 1 } : item
      ));
    } else {
      setCarrito([...carrito, { ...producto, cantidad: 1 }]);
    }
  };

  useEffect(() => {
    // Cargar los datos del JSON
    fetch('/productos.json')
      .then(response => response.json())
      .then(data => {
        setProductos(data.productos);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error al cargar los datos:', error);
        setLoading(false);
      });
  }, []);

  // Filtrar productos por franquicia
  const filtrarProductos = (franquicia) => {
    setFiltroActivo(franquicia);
    if (franquicia === 'todos') {
      setFranquiciasFiltradas([]);
    } else if (franquicia === 'ofertas') {
      setFranquiciasFiltradas(productos.filter(producto => producto.oferta));
    } else {
      setFranquiciasFiltradas(productos.filter(producto => producto.franquicia === franquicia));
    }
  };

  // Filtrar productos por búsqueda
  const handleBusqueda = (e) => {
    const terminoBusqueda = e.target.value.toLowerCase();
    setBusqueda(terminoBusqueda);
  };

  // Productos a mostrar según filtros
  const productosMostrados = busqueda
    ? productos.filter(p => p.nombre.toLowerCase().includes(busqueda.toLowerCase()))
    : (franquiciasFiltradas.length > 0 ? franquiciasFiltradas : productos);

  // Formatear precio
  const formatearPrecio = (precio) => {
    return `$${precio.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")}`;
  };

  return (
    <div className="home-page">

      {/* Banner Hero */}
      <BannerHero
        title="Mimi's Trinkets"
        description="Tu tienda especializada en productos de anime, manga y videojuegos"
        imageUrl="/api/placeholder/500/300"//CAMBIAR ESTO
        imageAlt="Cartas coleccionables"//ESTO TAMBIÉN
      />


      {/* Sección de búsqueda y filtros */}
      <div className="container mt-5">
        <div className="row mb-4">
          <div className="col-md-6">
            <h2 className="mb-3">Nuestros Productos</h2>
          </div>
          <div className="col-md-6">
            <div className="input-group">
              <input
                type="text"
                className="form-control"
                placeholder="Buscar productos..."
                value={busqueda}
                onChange={handleBusqueda}
              />
              <button className="btn btn-primary" type="button">
                <Search size={20} />
              </button>
            </div>
          </div>
        </div>

        {/* Filtros de categorías */}
        <div className="row mb-4">
          <div className="col-12">
            <div className="d-flex flex-wrap gap-2">
              <button
                className={`btn ${filtroActivo === 'todos' ? 'btn-primary' : 'btn-outline-primary'}`}
                onClick={() => filtrarProductos('todos')}
              >
                Todos
              </button>
              <button
                className={`btn ${filtroActivo === 'goods' ? 'btn-primary' : 'btn-outline-primary'}`}
                onClick={() => filtrarProductos('goods')}
              >
                Goods
              </button>
              <button
                className={`btn ${filtroActivo === 'cds' ? 'btn-primary' : 'btn-outline-primary'}`}
                onClick={() => filtrarProductos('cds')}
              >
                Cds
              </button>
              <button
                className={`btn ${filtroActivo === 'figures' ? 'btn-primary' : 'btn-outline-primary'}`}
                onClick={() => filtrarProductos('figures')}
              >
                Figures
              </button>
              <button
                className={`btn ${filtroActivo === 'mangas' ? 'btn-primary' : 'btn-outline-primary'}`}
                onClick={() => filtrarProductos('mangas')}
              >
                Mangas
              </button>
              <button
                className={`btn ${filtroActivo === 'ofertas' ? 'btn-danger' : 'btn-outline-danger'}`}
                onClick={() => filtrarProductos('ofertas')}
              >
                Ofertas
              </button>
            </div>
          </div>
        </div>

        {/* Grid de productos */}
        {loading ? (
          <div className="text-center py-5">
            <div className="spinner-border text-primary" role="status">
              <span className="visually-hidden">Cargando...</span>
            </div>
          </div>
        ) : (
          <div className="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
            {productosMostrados.map((producto) => (
              <div className="col" key={producto.id}>
                <div className="card h-100 border-0 shadow-sm">
                  {producto.oferta && (
                    <div className="badge bg-danger position-absolute top-0 end-0 m-2">
                      Oferta
                    </div>
                  )}
                  <img
                    src={producto.foto}
                    className="card-img-top p-3"
                    alt={producto.nombre}
                  />
                  <div className="card-body">
                    <span className="badge bg-primary mb-2">{producto.franquicia}</span>
                    <h5 className="card-title">{producto.nombre}</h5>
                    <p className="card-text small text-muted">{producto.descripcion}</p>
                    <div className="d-flex justify-content-between align-items-center">
                      <span className="fs-5 fw-bold">{formatearPrecio(producto.precio)}</span>
                      <button
                        className="btn btn-outline-primary btn-sm"
                        onClick={() => añadirAlCarrito(producto)}
                      >
                        Añadir al carrito
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}

        {/* Mensaje si no hay productos */}
        {!loading && productosMostrados.length === 0 && (
          <div className="text-center py-5">
            <h3>No se encontraron productos</h3>
            <p>Intenta con otra búsqueda o filtro</p>
          </div>
        )}
      </div>

      {/* Sección de categorías destacadas */}
      <div className="container mt-5 mb-5">
        <h2 className="text-center mb-4">Categorías Destacadas</h2>
        <div className="row g-4">
          <div className="col-md-4">
            <div className="card text-white bg-gradient h-100" style={{ backgroundColor: '#3466AF' }}>
              <div className="card-body text-center py-5">
                <h3 className="card-title">Goods</h3>
                <p className="card-text">Descubre llaveros y accesorios de tus franquicias favoritas</p>
                <Link to="/goods" className="btn btn-light">Ver colección</Link>
              </div>
            </div>
          </div>
          <div className="col-md-4">
            <div className="card text-white bg-gradient h-100" style={{ backgroundColor: '#4B5D8B' }}>
              <div className="card-body text-center py-5">
                <h3 className="card-title">Figures</h3>
                <p className="card-text">Figuritas: Nendoroids, Figma y  Bishojo</p>
                <Link to="/figures" className="btn btn-light">Ver colección</Link>
              </div>
            </div>
          </div>
          <div className="col-md-4">
            <div className="card text-white bg-gradient h-100" style={{ backgroundColor: '#143254' }}>
              <div className="card-body text-center py-5">
                <h3 className="card-title">Cds</h3>
                <p className="card-text">Encuentra los cd's de tus idols favoritos.</p>
                <Link to="/cds" className="btn btn-light">Ver colección</Link>
              </div>
            </div>
          </div>
          <div className="col-md-4">
            <div className="card text-white bg-gradient h-100" style={{ backgroundColor: '#143254' }}>
              <div className="card-body text-center py-5">
                <h3 className="card-title">Mangas</h3>
                <p className="card-text">Encuentra los mejores mangas y novelas ligeras de tus series favoritas.</p>
                <Link to="/mangas" className="btn btn-light">Ver colección</Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default HomePage;