import React from 'react';

const BannerHero = ({ title, description, imageUrl, imageAlt }) => {
  return (
    <div
      className="banner-hero bg-primary text-white"
      style={{ backgroundColor: 'var(--rosado-oscuro)' }}
    >
      <div className="container">
        <div className="row align-items-center">
          <div className="col-md-6">
            <h1 className="display-4 fw-bold-titulohome">{title}</h1>
            <p className="lead">{description}</p>
          </div>
          <div className="col-md-6 text-center">
            <img
              src='/assets/png/logoRocket2.png'
              alt={imageAlt || 'portada'}
              className="img-fluid rounded shadow-lg"
              height="300"
              width="300"
            />
          </div>
        </div>
      </div>
    </div>
  );
};

export default BannerHero;
