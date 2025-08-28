const Footer = () => {
  return (
    <footer className="py-5" style={{ backgroundColor: 'var(--rosa-claro)' }}> {/* Fondo más suave */}
      <div className="container">
        {/* Sección de Ventajas */}
        <div className="row text-center g-4">
          <div className="col-md-3">
            <div className="p-3">
              <div className="fs-1" style={{ color: 'var(--rosado-medium)' }}>🚚</div>
              <h5 className="text-dark">Envío Gratis</h5>
              <p className="small" style={{ color: 'var(--gris-oscuro)' }}>En compras sobre $50.000</p>
            </div>
          </div>
          <div className="col-md-3">
            <div className="p-3">
              <div className="fs-1" style={{ color: 'var(--rosado-medium)' }}>🔒</div>
              <h5 className="text-dark">Pago Seguro</h5>
              <p className="small" style={{ color: 'var(--gris-oscuro)' }}>Transacciones protegidas</p>
            </div>
          </div>
          <div className="col-md-3">
            <div className="p-3">
              <div className="fs-1" style={{ color: 'var(--rosado-medium)' }}>💯</div>
              <h5 className="text-dark">Garantía Original</h5>
              <p className="small" style={{ color: 'var(--gris-oscuro)' }}>Productos 100% auténticos</p>
            </div>
          </div>
          <div className="col-md-3">
            <div className="p-3">
              <div className="fs-1" style={{ color: 'var(--rosado-medium)' }}>💬</div>
              <h5 className="text-dark">Atención 24/7</h5>
              <p className="small" style={{ color: 'var(--gris-oscuro)' }}>Soporte técnico todos los días</p>
            </div>
          </div>
        </div>

        {/* Información adicional */}
        <div className="border-top mt-5 pt-3 text-center" style={{ color: 'var(--gris-oscuro)' }}>
          <p className="small">&copy; {new Date().getFullYear()} Tu Empresa. Todos los derechos reservados.</p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
