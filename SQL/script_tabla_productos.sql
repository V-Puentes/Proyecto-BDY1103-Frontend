--- Eliminar tablas existentes (en orden por dependencias)
DROP TABLE producto;
DROP TABLE compra;
DROP TABLE entrega;
DROP TABLE repartidor;
DROP TABLE clientes;

-- Eliminar secuencias
DROP SEQUENCE seq_id_entrega;
DROP SEQUENCE seq_cod_compra;
DROP SEQUENCE seq_id_producto;

-- 1. Tabla CLIENTES 
CREATE TABLE clientes (
    run_cliente NUMBER PRIMARY KEY,
    dv_run_cliente VARCHAR2(1) NOT NULL,
    nombre_cliente VARCHAR2(100) NOT NULL,
    direccion_cliente VARCHAR2(200) NOT NULL
);

-- 2. Tabla REPARTIDOR 
CREATE TABLE repartidor (
    run_repartidor NUMBER PRIMARY KEY,
    dv_run_repartidor VARCHAR2(1) NOT NULL,
    nombre_repartidor VARCHAR2(100) NOT NULL,
    fecha_contrato DATE NOT NULL
);

-- 3. Tabla ENTREGA 
CREATE TABLE entrega (
    id_entrega NUMBER PRIMARY KEY,
    run_repartidor NUMBER NOT NULL,
    estado_entrega VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_entrega_repartidor FOREIGN KEY (run_repartidor)
    REFERENCES repartidor(run_repartidor)
);

-- 4. Tabla COMPRA 
CREATE TABLE compra (
    cod_compra NUMBER PRIMARY KEY,
    run_cliente NUMBER NOT NULL,
    descripcion_compra VARCHAR2(200),
    total_sin_iva NUMBER NOT NULL,
    total_con_iva NUMBER NOT NULL,
    fecha_compra DATE NOT NULL,
    id_entrega NUMBER NOT NULL,
    CONSTRAINT fk_compra_cliente FOREIGN KEY (run_cliente)
    REFERENCES clientes(run_cliente),
    CONSTRAINT fk_compra_entrega FOREIGN KEY (id_entrega)
    REFERENCES entrega(id_entrega)
);

-- 5. Tabla PRODUCTO - MODIFICADA para incluir todos tus productos
CREATE TABLE producto (
    id_producto NUMBER PRIMARY KEY,
    nombre_producto VARCHAR2(100) NOT NULL,
    descripcion_producto VARCHAR2(500),
    precio_producto NUMBER NOT NULL,
    oferta_producto NUMBER(1) DEFAULT 0 CHECK (oferta_producto IN (0, 1)),
    franquicia_producto VARCHAR2(100),
    foto_producto VARCHAR2(255),
    cod_compra NUMBER,
    CONSTRAINT fk_producto_compra FOREIGN KEY (cod_compra)
    REFERENCES compra(cod_compra)
);

-- Comentarios para documentar las tablas
COMMENT ON TABLE clientes IS 'Almacena la información de los clientes de la tienda';
COMMENT ON TABLE repartidor IS 'Contiene los datos de los repartidores';
COMMENT ON TABLE entrega IS 'Registra el estado y repartidor asignado para cada entrega';
COMMENT ON TABLE compra IS 'Almacena las compras realizadas por los clientes';
COMMENT ON TABLE producto IS 'Contiene los productos disponibles en la tienda';

-- Secuencias para generar IDs automáticamente
CREATE SEQUENCE seq_id_entrega START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_cod_compra START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_id_producto START WITH 1 INCREMENT BY 1;

-- Insertar datos de clientes
INSERT INTO clientes VALUES (12345678, 'K', 'Ana García', 'Av. Libertador 123, Santiago');
INSERT INTO clientes VALUES (23456789, '5', 'Carlos López', 'Calle Principal 456, Valparaíso');
INSERT INTO clientes VALUES (34567890, '2', 'María Rodríguez', 'Paseo del Mar 789, Viña del Mar');
INSERT INTO clientes VALUES (45678901, '3', 'Javier Méndez', 'Los Alerces 321, Concepción');
INSERT INTO clientes VALUES (56789012, '7', 'Laura Fernández', 'Av. Central 654, La Serena');
INSERT INTO clientes VALUES (15678923, '7', 'María González', 'Av. Providencia 123, Santiago');
INSERT INTO clientes VALUES (18765432, 'K', 'Carlos López', 'Calle Prat 456, Valparaíso');
INSERT INTO clientes VALUES (20458796, '3', 'Ana Rodríguez', 'Los Placeres 789, Viña del Mar');
INSERT INTO clientes VALUES (22569874, '5', 'Javier Silva', 'Pje. Los Aromos 321, Concepción');
INSERT INTO clientes VALUES (23987456, '1', 'Laura Méndez', 'Av. Argentina 654, Valparaíso');
INSERT INTO clientes VALUES (25632147, '9', 'Pedro Fernández', 'Los Olmos 987, Santiago');
INSERT INTO clientes VALUES (26789451, '2', 'Sofía Martínez', 'Av. Alemania 147, Temuco');
INSERT INTO clientes VALUES (27894561, '4', 'Miguel Torres', 'Los Pinos 258, La Serena');
INSERT INTO clientes VALUES (28965412, '6', 'Elena Vargas', 'Costa Brava 369, Antofagasta');
INSERT INTO clientes VALUES (29547863, '8', 'Daniel Castro', 'Los Alerces 741, Puerto Montt');

-- Insertar datos de repartidores
INSERT INTO repartidor VALUES (98765432, '1', 'Pedro González', DATE '2022-03-15');
INSERT INTO repartidor VALUES (87654321, '4', 'Sofía Ramírez', DATE '2023-01-10');
INSERT INTO repartidor VALUES (76543210, '9', 'Miguel Torres', DATE '2022-11-20');
INSERT INTO repartidor VALUES (65432109, '2', 'Elena Castro', DATE '2023-05-05');
INSERT INTO repartidor VALUES (54321098, '6', 'Daniel Silva', DATE '2022-08-30');
INSERT INTO repartidor VALUES (14523698, '7', 'Fernando Rojas', DATE '2022-05-15');
INSERT INTO repartidor VALUES (15987432, 'K', 'Camila Navarro', DATE '2023-02-10');
INSERT INTO repartidor VALUES (16874523, '3', 'Alejandro Díaz', DATE '2022-11-25');
INSERT INTO repartidor VALUES (17589632, '5', 'Valentina Soto', DATE '2023-04-18');
INSERT INTO repartidor VALUES (18653247, '1', 'Roberto Mendoza', DATE '2022-09-30');
INSERT INTO repartidor VALUES (19487562, '9', 'Carolina Herrera', DATE '2023-01-05');
INSERT INTO repartidor VALUES (20369874, '2', 'Francisco Ríos', DATE '2022-07-22');
INSERT INTO repartidor VALUES (21458796, '4', 'Natalia Vega', DATE '2023-03-14');
INSERT INTO repartidor VALUES (22659874, '6', 'Gabriel Pizarro', DATE '2022-12-08');
INSERT INTO repartidor VALUES (23784159, '8', 'Daniela Contreras', DATE '2023-06-19');
-- Insertar entregas
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 98765432, 'En preparación');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 87654321, 'En camino');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 76543210, 'Entregado');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 65432109, 'En preparación');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 54321098, 'Entregado');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 14523698, 'Pendiente');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 15987432, 'En preparación');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 16874523, 'En camino');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 17589632, 'Entregado');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 18653247, 'Pendiente');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 19487562, 'En preparación');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 20369874, 'En camino');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 21458796, 'Entregado');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 22659874, 'Pendiente');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 23784159, 'En preparación');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 14523698, 'En camino');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 15987432, 'Entregado');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 16874523, 'Pendiente');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 17589632, 'En preparación');
INSERT INTO entrega VALUES (seq_id_entrega.NEXTVAL, 18653247, 'En camino');
-- Insertar compras
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 12345678, 'Compra de figuras de anime', 250000, 297500, DATE '2023-10-15', 1);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 23456789, 'Mangas y productos coleccionables', 120000, 142800, DATE '2023-10-16', 2);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 34567890, 'CDs de bandas sonoras', 85000, 101150, DATE '2023-10-17', 3);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 45678901, 'Figuras y goods', 310000, 368900, DATE '2023-10-18', 4);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 56789012, 'Colección completa de mangas', 180000, 214200, DATE '2023-10-19', 5);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 15678923, 'Figura Hatsune Miku 15° Aniversario', 318000, 378420, DATE '2023-10-15', 1);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 18765432, 'Colección completa Skip and Loafer', 68990, 82098, DATE '2023-10-16', 2);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 20458796, 'Figura Shenhe Genshin Impact', 260990, 310578, DATE '2023-10-17', 3);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 22569874, 'CD BanG Dream! Ave Mujica Deluxe Edition', 126990, 151118, DATE '2023-10-18', 4);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 23987456, 'Set de llaveros Haikyuu!!', 32390, 38544, DATE '2023-10-19', 5);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 25632147, 'Figura Frieren: Beyond Journey''s End', 80990, 96378, DATE '2023-10-20', 6);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 26789451, 'Manga Cardcaptor Sakura Complete Collection', 17990, 21408, DATE '2023-10-21', 7);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 27894561, 'Nendoroid Kanata Shinkai', 36990, 44018, DATE '2023-10-22', 8);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 28965412, 'CD PLAVE - Kakurenbo', 16990, 20218, DATE '2023-10-23', 9);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 29547863, 'Figura A2 NieR:Automata', 82900, 98651, DATE '2023-10-24', 10);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 15678923, 'Peluche Rin Itoshi Blue Lock', 41990, 49968, DATE '2023-10-25', 11);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 18765432, 'Manga Naruto Vol. 66', 16990, 20218, DATE '2023-10-26', 12);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 20458796, 'Figura Himmel Sousou no Frieren', 119990, 142788, DATE '2023-10-27', 13);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 22569874, 'CD Hatsune Miku Colorful Stage', 11990, 14268, DATE '2023-10-28', 14);
INSERT INTO compra VALUES (seq_cod_compra.NEXTVAL, 23987456, 'Set chapas Obey Me! Nightbringer', 28500, 33915, DATE '2023-10-29', 15);
-- Insertar datos de productos
INSERT INTO producto VALUES (1, '(Figura Bishojo) Hatsune Miku - Hatsune Miku 15° Aniversario', 'figura a escala del 15th aniversario de Hatsune Miku Fresa', 318000, 1, 'figures', './assets/png/1.png', NULL);
INSERT INTO producto VALUES (2, '(Figura Bishojo) Hatsune Miku MAGICAL MIRAI 2025 ver.', 'Hatsune Miku – Magical Mirai 2025 Ver. – Figura a escala.', 218200, 0, 'figures', './assets/png/2.png', NULL);
INSERT INTO producto VALUES (3, '(Figura Bishojo) Shenhe Genshin Impact', 'Shenhe – Lonesome Transcendence Ver. (Genshin Impact) – Figura a escala', 260990, 1, 'figures', './assets/png/3.png', NULL);
INSERT INTO producto VALUES (4, '(Figura Bishojo) Vocal series 01: Hatsune Miku: World Is Mine 2024 Ver.', 'Hatsune Miku – World Is Mine 2024 Ver. (Vocal Series 01, Bishojo)', 204200, 0, 'figures', './assets/png/4.png', NULL);
INSERT INTO producto VALUES (5, '(Figura Bishojo)Frieren: Beyond Journey''s End Fern: Reflections of a Distant Memory.', 'Frieren: Beyond Journey''s End mage Fern – Figura a escala.', 80990, 1, 'figures', './assets/png/5.png', NULL);
INSERT INTO producto VALUES (6, '(Figma) Joker', 'Figura Figma de Joker de Persona 5 con detalles icónicos del personaje.', 88900, 0, 'figures', './assets/png/6.png', NULL);
INSERT INTO producto VALUES (7, '(Figma) Styles Black Corset Dress', 'Elegante vestido corset negro para personalizar tus figuras Figma.', 32000, 1, 'figures', './assets/png/7.png', NULL);
INSERT INTO producto VALUES (8, '(Figma) OMGKawaiiAngel', 'Figura Figma de OMGkawaiiAngel de Needy Girl Overdose', 49990, 0, 'figures', './assets/png/8.png', NULL);
INSERT INTO producto VALUES (9, '(Figma) Himmel', 'Figura Figma del legendario héroe de ''Sousou no Frieren''.', 119990, 1, 'figures', './assets/png/9.png', NULL);
INSERT INTO producto VALUES (10, '(Figma) A2', 'Figura Figma de la androide rebelde de ''NieR:Automata''', 82900, 0, 'figures', './assets/png/10.png', NULL);
INSERT INTO producto VALUES (11, '(Nendoroid)Kanata Shinkai', 'Figura Nendoroid del idol Kanata Shinkai de ''Ensemble Stars!!', 36990, 1, 'figures', './assets/png/11.png', NULL);
INSERT INTO producto VALUES (12, '(Nendoroid) Twilight Sparkle', 'Figura Nendoroid de Twilight Sparkle de ''My Little Pony''', 41600, 0, 'figures', './assets/png/12.png', NULL);
INSERT INTO producto VALUES (13, '(Nendoroid) Kenma Kozume: Second Uniform Ver', 'Nendoroid de Kenma con su uniforme alterno de ''Haikyuu!!''.', 37990, 0, 'figures', './assets/png/13.png', NULL);
INSERT INTO producto VALUES (14, '(Nendoroid) Nana Osaki', 'Figura Nendoroid de la icónica rockera de ''NANA''.', 41990, 1, 'figures', './assets/png/14.png', NULL);
INSERT INTO producto VALUES (15, '(Nendoroid) Maquillaje facial personalizable!: Rena 02 (Peach/Cinnamon/Cream/Almond Milk)', 'Rostros artísticos intercambiables para Nendoroid Doll.', 8990, 0, 'figures', './assets/png/15.png', NULL);
INSERT INTO producto VALUES (16, '(Manga Sets) Skip and Loafer Vol. 1–12', 'set de manga colección Completa [12 Libros] Español', 68990, 1, 'mangas', './assets/png/16.png', NULL);
INSERT INTO producto VALUES (17, 'Go For It, Nakamura! (Ganbare! Nakamura-kun!!) Vol.1-2', 'Caja con 24 sobres de la expansión Maze of Memories.', 12990, 0, 'mangas', './assets/png/17.png', NULL);
INSERT INTO producto VALUES (18, 'Cardcaptor Sakura: Clear Card Vol. 1–16', 'Cardcaptor Sakura: Clear Card - Colección completa en formato tankoubon con sobrecubierta', 17990, 1, 'mangas', './assets/png/18.png', NULL);
INSERT INTO producto VALUES (19, 'Let''s! Haikyu!? Vol. 1–11', 'Set de 11 libros del manga alternativo de Haikyu!!.', 7990, 0, 'mangas', './assets/png/19.png', NULL);
INSERT INTO producto VALUES (20, 'The Guy She Was Interested in Wasn''t a Guy at All Vol. 1–3', 'Set 3 libros - Trilogía manga romántica GirlsLove', 17590, 1, 'mangas', './assets/png/20.png', NULL);
INSERT INTO producto VALUES (21, 'Blue Lock vol. 01', 'Blue Lock - Manga en formato tankoubon con sobrecubierta y páginas a color exclusivas', 12490, 0, 'mangas', './assets/png/21.png', NULL);
INSERT INTO producto VALUES (22, 'Naruto vol. 66', 'Naruto Vol. 66 - La batalla en la dimensión del Kamui.', 16990, 1, 'mangas', './assets/png/22.png', NULL);
INSERT INTO producto VALUES (23, '¡Huyamos juntas! vol. 01', 'Huyamos juntas! Vol. 1. - Romance y reencuentro entre dos mujeres marcado por recuerdos de juventud y un amor imposible de olvidar.', 10990, 0, 'mangas', './assets/png/23.png', NULL);
INSERT INTO producto VALUES (24, 'El callejón', 'El Callejón - Antología de 11 relatos cortos de Junji Ito que mezclan terror y misterio', 20990, 0, 'mangas', './assets/png/24.png', NULL);
INSERT INTO producto VALUES (25, 'One punch man vol. 24', 'One Punch Man Vol. 24 - Saitama se enfrenta al rey Orochi.', 16990, 1, 'mangas', './assets/png/25.png', NULL);
INSERT INTO producto VALUES (26, '(KeyChain)Obey Me! - Set de Llaveros Acrílicos Belphegor', 'Set de 2 llaveros acrílicos de Belphegor de Obey Me!, edición especial de la Shibuya109 Pop Up Store.', 8200, 0, 'goods', './assets/png/26.png', NULL);
INSERT INTO producto VALUES (27, '(pines)Obey Me! Nightbringer - Caja con 7 Chapas Coleccionables (Arte Oficial)', 'Caja (1BOX=7) de chapas metálicas de la serie Obey Me! Nightbringer, con ilustraciones oficiales exclusivas.', 28500, 1, 'goods', './assets/png/27.png', NULL);
INSERT INTO producto VALUES (28, '(pines)Hatsune Miku - In your memory.', 'Set de chapas metálicas de Hatsune Miku ''in your memory''.', 6500, 0, 'goods', './assets/png/28.png', NULL);
INSERT INTO producto VALUES (29, '(pines)Funda Decorativa para Pines 57mm - Hydrangea', 'Cubierta protectora y decorativa para pines de 57mm con diseño de hortensias.', 1700, 1, 'goods', './assets/png/29.png', NULL);
INSERT INTO producto VALUES (30, '(pines) Funda Protectora para Pines 100mm – Universal)', 'Cubierta transparente compatible con pines de 100mm.', 1700, 0, 'goods', './assets/png/30.png', NULL);
INSERT INTO producto VALUES (31, '(doll) Naruto Shippuden – Doll Kakashi Hatake', 'Mini figura colgante de Kakashi Hatake con cadena eslabonada.', 49990, 1, 'goods', './assets/png/31.png', NULL);
INSERT INTO producto VALUES (32, '(keychain) The Fragrant Flower Blooms with Dignity – Llavero Acrílico Kaoruko Waguri', 'Llavero acrílico con diseño de Kaoruko Waguri y detalle de alambre.', 8990, 0, 'goods', './assets/png/32.png', NULL);
INSERT INTO producto VALUES (33, '(keychain) Haikyuu!! – Caja 8 llaveros de Goma', 'Set de 8 figuras de goma estilo Nitotan con los personajes de Haikyuu!!', 32390, 1, 'goods', './assets/png/33.png', NULL);
INSERT INTO producto VALUES (34, '(calendario)Sumikko Gurashi – Calendario de Escritorio', 'Calendario de mesa con adorables ilustraciones de Sumikko Gurashi.', 6990, 0, 'goods', '/assets/png/34.png', NULL);
INSERT INTO producto VALUES (35, '(stand) Haikyuu!! The Way Home – Acrílico Stand Shoyo Hinata', 'Figura acrílica de Shoyo Hinata en la colección The Way Home.', 7990, 1, 'goods', './assets/png/35.png', NULL);
INSERT INTO producto VALUES (36, 'BanG Dream! Ave Mujica – CD Regular Edition (+ Bromide)', 'Edición regular del nuevo lanzamiento de Ave Mujica para BanG Dream!, incluye un bromide de regalo.', 12990, 0, 'cds', './assets/png/36.png', NULL);
INSERT INTO producto VALUES (37, 'BanG Dream! Ave Mujica – Limited Deluxe Edition (+ Bromide, Pin y Llavero)', 'Edición limitada de producción deluxe del nuevo título de Ave Mujica para BanG Dream!, con bromide, pin y llavero exclusivos.', 126990, 0, 'cds', './assets/png/37.png', NULL);
INSERT INTO producto VALUES (38, 'Hina Tachibana – HOLIC [Limited First Edition]', 'Edición limitada de primera producción de HOLIC, el nuevo lanzamiento musical de Hina Tachibana.', 39990, 1, 'cds', './assets/png/38.png', NULL);
INSERT INTO producto VALUES (39, 'My Hero Academia Season 7 ED2 – Rokutousei by Zarame [Limited Edition CD+DVD]', 'Edición limitada de producción del segundo ending de la temporada 7 de My Hero Academia, ''Rokutousei'' interpretado por Zarame, incluye CD + DVD.', 11990, 0, 'cds', './assets/png/39.png', NULL);
INSERT INTO producto VALUES (40, 'THE IDOLM@STER SideM – Fantastic Combination ~ PINATATIME!! ~ High x Joker', 'CD musical oficial de THE IDOLM@STER SideM, parte de la serie Fantastic Combination, con High x Joker.', 10990, 1, 'cds', './assets/png/40.png', NULL);
INSERT INTO producto VALUES (41, 'PLAVE – Kakurenbo [Edición Solo BAMBY]', 'Edición especial con portada individual de BAMBY para el sencillo Kakurenbo de PLAVE.', 16990, 0, 'cds', './assets/png/41.png', NULL);
INSERT INTO producto VALUES (42, 'Paradox Live – Battle of Unity Round 3 FUTURE', 'Tercera entrega de la serie Battle of Unity de Paradox Live, con nuevas canciones y duelos musicales.', 11990, 0, 'cds', './assets/png/42.png', NULL);
INSERT INTO producto VALUES (43, 'Hatsune Miku Colorful Stage! – Yoka ni Mitorete / D/N/A (Nightcord at 25:00)', 'CD oficial del juego Hatsune Miku: Colorful Stage!', 11990, 1, 'cds', './assets/png/43.png', NULL);
INSERT INTO producto VALUES (44, 'Astro Dive – First Message -LMLMM x x x -', 'Primer lanzamiento de Astro Dive, un álbum con la energía única de la agrupación.', 24390, 0, 'cds', './assets/png/44.png', NULL);
INSERT INTO producto VALUES (45, 'BanG Dream! Roselia – Ishizue no Hanakanmuri [Edición Regular]', 'Edición regular del lanzamiento musical de Roselia para BanG Dream!, titulado Ishizue no Hanakanmuri.', 12990, 1, 'cds', './assets/png/45.png', NULL);
INSERT INTO producto VALUES (46, '(doll)Blue Lock – Peluche Pien Rin Itoshi', 'Peluche oficial de Pien Rin Itoshi de Blue Lock, ideal para coleccionistas и fans del manga/anime.', 41990, 0, 'goods', './assets/png/46.png', NULL);
INSERT INTO producto VALUES (47, '(doll) BanG Dream! – Peluche Kaoru Seta (Hello, Happy World!)', 'Peluche oficial de Kaoru Seta de la banda Hello, Happy World! de BanG Dream!', 32000, 1, 'goods', './assets/png/47.png', NULL);
INSERT INTO producto VALUES (48, '(figura bishoujo) Hatsune Miku EXPO 10th Anniversary', 'Figura a escala 1/7 de Hatsune Miku conmemorativa del 10º aniversario del EXPO.', 184490, 0, 'figures', './assets/png/48.png', NULL);
INSERT INTO producto VALUES (49, '(nendoroid)PICCODO Action Doll X Honkai: Star Rail – Chibi Doll Jiaoqiu', 'Figura chibi articulada de Jiaoqiu de Honkai: Star Rail en formato PICCODO Action.', 41380, 1, 'figures', './assets/png/49.png', NULL);
INSERT INTO producto VALUES (50, 'Naruto vol. 01', 'Naruto Vol. 1 - El inicio de la aventura de Naruto Uzumaki.', 9590, 0, 'mangas', './assets/png/50.png', NULL);
INSERT INTO producto VALUES (51, 'Manga Boy Meets Maria', 'Boy Meets Maria es un manga de género shōnen-ai ilustrado y escrito por Peyo.', 15990, 0, 'mangas', './assets/png/51.png', NULL);
INSERT INTO producto VALUES (52, 'Nana tomo 01', 'Primer tomo del manga NANA, que sigue la vida de dos jóvenes mujeres con el mismo nombre pero personalidades y sueños muy diferentes.', 9590, 0, 'mangas', './assets/png/52.png', NULL);

COMMIT;
-- Consulta para verificar los datos insertados
SELECT 'Clientes: ' || COUNT(*) FROM clientes
UNION ALL
SELECT 'Repartidores: ' || COUNT(*) FROM repartidor
UNION ALL
SELECT 'Entregas: ' || COUNT(*) FROM entrega
UNION ALL
SELECT 'Compras: ' || COUNT(*) FROM compra
UNION ALL
SELECT 'Productos: ' || COUNT(*) FROM producto;
