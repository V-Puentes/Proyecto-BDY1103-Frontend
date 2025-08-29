-- Crear la base de datos
CREATE DATABASE TIENDAANIME;

-- Conectar a la base de datos
CONNECT TO TIENDAANIME;

-- Crear tabla de productos
CREATE TABLE productos (
    id INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion CLOB,
    precio DECIMAL(10, 2) NOT NULL,
    foto VARCHAR(255),
    oferta SMALLINT DEFAULT 0,
    franquicia VARCHAR(10) NOT NULL CHECK (franquicia IN ('figures', 'mangas', 'goods', 'cds'))
);

-- Insertar datos de productos (cada INSERT por separado)
INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (1, '(Figura Bishojo) Hatsune Miku - Hatsune Miku 15° Aniversario', 'figura a escala del 15th aniversario de Hatsune Miku Fresa', 318000.00, './assets/png/1.png', 1, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (2, '(Figura Bishojo) Hatsune Miku MAGICAL MIRAI 2025 ver.', 'Hatsune Miku – Magical Mirai 2025 Ver. – Figura a escala.', 218200.00, './assets/png/2.png', 0, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (3, '(Figura Bishojo) Shenhe Genshin Impact', 'Shenhe – Lonesome Transcendence Ver. (Genshin Impact) – Figura a escala', 260990.00, './assets/png/3.png', 1, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (4, '(Figura Bishojo) Vocal series 01: Hatsune Miku: World Is Mine 2024 Ver.', 'Hatsune Miku – World Is Mine 2024 Ver. (Vocal Series 01, Bishojo)', 204200.00, './assets/png/4.png', 0, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (5, '(Figura Bishojo)Frieren: Beyond Journey''s End Fern: Reflections of a Distant Memory.', 'Frieren: Beyond Journey''s End mage Fern – Figura a escala.', 80990.00, './assets/png/5.png', 1, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (6, '(Figma) Joker', 'Figura Figma de Joker de Persona 5 con detalles icónicos del personaje.', 88900.00, './assets/png/6.png', 0, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (7, '(Figma) Styles Black Corset Dress', 'Elegante vestido corset negro para personalizar tus figuras Figma.', 32000.00, './assets/png/7.png', 1, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (8, '(Figma) OMGKawaiiAngel', 'Figura Figma de OMGkawaiiAngel de Needy Girl Overdose', 49990.00, './assets/png/8.png', 0, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (9, '(Figma) Himmel', 'Figura Figma del legendario héroe de ''Sousou no Frieren''.', 119990.00, './assets/png/9.png', 1, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (10, '(Figma) A2', 'Figura Figma de la androide rebelde de ''NieR:Automata''', 82900.00, './assets/png/10.png', 0, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (11, '(Nendoroid)Kanata Shinkai', 'Figura Nendoroid del idol Kanata Shinkai de ''Ensemble Stars!!', 36990.00, './assets/png/11.png', 1, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (12, '(Nendoroid) Twilight Sparkle', 'Figura Nendoroid de Twilight Sparkle de ''My Little Pony''', 41600.00, './assets/png/12.png', 0, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (13, '(Nendoroid) Kenma Kozume: Second Uniform Ver', 'Nendoroid de Kenma con su uniforme alterno de ''Haikyuu!!''.', 37990.00, './assets/png/13.png', 0, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (14, '(Nendoroid) Nana Osaki', 'Figura Nendoroid de la icónica rockera de ''NANA''.', 41990.00, './assets/png/14.png', 1, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (15, '(Nendoroid) Maquillaje facial personalizable!: Rena 02 (Peach/Cinnamon/Cream/Almond Milk)', 'Rostros artísticos intercambiables para Nendoroid Doll.', 8990.00, './assets/png/15.png', 0, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (16, '(Manga Sets) Skip and Loafer Vol. 1–12', 'set de manga colección Completa [12 Libros] Español', 68990.00, './assets/png/16.png', 1, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (17, 'Go For It, Nakamura! (Ganbare! Nakamura-kun!!) Vol.1-2', 'Caja con 24 sobres de la expansión Maze of Memories.', 12990.00, './assets/png/17.png', 0, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (18, 'Cardcaptor Sakura: Clear Card Vol. 1–16', 'Cardcaptor Sakura: Clear Card - Colección completa en formato tankoubon con sobrecubierta', 17990.00, './assets/png/18.png', 1, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (19, 'Let''s! Haikyu!? Vol. 1–11', 'Set de 11 libros del manga alternativo de Haikyu!!.', 7990.00, './assets/png/19.png', 0, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (20, 'The Guy She Was Interested in Wasn''t a Guy at All Vol. 1–3', 'Set 3 libros - Trilogía manga romántica GirlsLove', 17590.00, './assets/png/20.png', 1, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (21, 'Blue Lock vol. 01', 'Blue Lock - Manga en formato tankoubon con sobrecubierta y páginas a color exclusivas', 12490.00, './assets/png/21.png', 0, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (22, 'Naruto vol. 66', 'Naruto Vol. 66 - La batalla en la dimensión del Kamui.', 16990.00, './assets/png/22.png', 1, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (23, '¡Huyamos juntas! vol. 01', 'Huyamos juntas! Vol. 1. - Romance y reencuentro entre dos mujeres marcado por recuerdos de juventud y un amor imposible de olvidar.', 10990.00, './assets/png/23.png', 0, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (24, 'El callejón', 'El Callejón - Antología de 11 relatos cortos de Junji Ito que mezclan terror y misterio', 20990.00, './assets/png/24.png', 0, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (25, 'One punch man vol. 24', 'One Punch Man Vol. 24 - Saitama se enfrenta al rey Orochi.', 16990.00, './assets/png/25.png', 1, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (26, '(KeyChain)Obey Me! - Set de Llaveros Acrílicos Belphegor', 'Set de 2 llaveros acrílicos de Belphegor de Obey Me!, edición especial de la Shibuya109 Pop Up Store.', 8200.00, './assets/png/26.png', 0, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (27, '(pines)Obey Me! Nightbringer - Caja con 7 Chapas Coleccionables (Arte Oficial)', 'Caja (1BOX=7) de chapas metálicas de la serie Obey Me! Nightbringer, con ilustraciones oficiales exclusivas.', 28500.00, './assets/png/27.png', 1, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (28, '(pines)Hatsune Miku - In your memory.', 'Set de chapas metálicas de Hatsune Miku ''in your memory''.', 6500.00, './assets/png/28.png', 0, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (29, '(pines)Funda Decorativa para Pines 57mm - Hydrangea', 'Cubierta protectora y decorativa para pines de 57mm con diseño de hortensias.', 1700.00, './assets/png/29.png', 1, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (30, '(pines) Funda Protectora para Pines 100mm – Universal)', 'Cubierta transparente compatible con pines de 100mm.', 1700.00, './assets/png/30.png', 0, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (31, '(doll) Naruto Shippuden – Doll Kakashi Hatake', 'Mini figura colgante de Kakashi Hatake con cadena eslabonada.', 49990.00, './assets/png/31.png', 1, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (32, '(keychain) The Fragrant Flower Blooms with Dignity – Llavero Acrílico Kaoruko Waguri', 'Llavero acrílico con diseño de Kaoruko Waguri y detalle de alambre.', 8990.00, './assets/png/32.png', 0, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (33, '(keychain) Haikyuu!! – Caja 8 llaveros de Goma', 'Set de 8 figuras de goma estilo Nitotan con los personajes de Haikyuu!!', 32390.00, './assets/png/33.png', 1, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (34, '(calendario)Sumikko Gurashi – Calendario de Escritorio', 'Calendario de mesa con adorables ilustraciones de Sumikko Gurashi.', 6990.00, '/assets/png/34.png', 0, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (35, '(stand) Haikyuu!! The Way Home – Acrílico Stand Shoyo Hinata', 'Figura acrílica de Shoyo Hinata en la colección The Way Home.', 7990.00, './assets/png/35.png', 1, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (36, 'BanG Dream! Ave Mujica – CD Regular Edition (+ Bromide)', 'Edición regular del nuevo lanzamiento de Ave Mujica para BanG Dream!, incluye un bromide de regalo.', 12990.00, './assets/png/36.png', 0, 'cds');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (37, 'BanG Dream! Ave Mujica – Limited Deluxe Edition (+ Bromide, Pin y Llavero)', 'Edición limitada de producción deluxe del nuevo título de Ave Mujica para BanG Dream!, con bromide, pin y llavero exclusivos.', 126990.00, './assets/png/37.png', 0, 'cds');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (38, 'Hina Tachibana – HOLIC [Limited First Edition]', 'Edición limitada de primera producción de HOLIC, el nuevo lanzamiento musical de Hina Tachibana.', 39990.00, './assets/png/38.png', 1, 'cds');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (39, 'My Hero Academia Season 7 ED2 – Rokutousei by Zarame [Limited Edition CD+DVD]', 'Edición limitada de producción del segundo ending de la temporada 7 de My Hero Academia, ''Rokutousei'' interpretado por Zarame, incluye CD + DVD.', 11990.00, './assets/png/39.png', 0, 'cds');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (40, 'THE IDOLM@STER SideM – Fantastic Combination ~ PINATATIME!! ~ High x Joker', 'CD musical oficial de THE IDOLM@STER SideM, parte de la serie Fantastic Combination, con High x Joker.', 10990.00, './assets/png/40.png', 1, 'cds');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (41, 'PLAVE – Kakurenbo [Edición Solo BAMBY]', 'Edición especial con portada individual de BAMBY para el sencillo Kakurenbo de PLAVE.', 16990.00, './assets/png/41.png', 0, 'cds');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (42, 'Paradox Live – Battle of Unity Round 3 FUTURE', 'Tercera entrega de la serie Battle of Unity de Paradox Live, con nuevas canciones y duelos musicales.', 11990.00, './assets/png/42.png', 0, 'cds');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (43, 'Hatsune Miku Colorful Stage! – Yoka ni Mitorete / D/N/A (Nightcord at 25:00)', 'CD oficial del juego Hatsune Miku: Colorful Stage!', 11990.00, './assets/png/43.png', 1, 'cds');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (44, 'Astro Dive – First Message -LMLMM x x x -', 'Primer lanzamiento de Astro Dive, un álbum con la energía única de la agrupación.', 24390.00, './assets/png/44.png', 0, 'cds');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (45, 'BanG Dream! Roselia – Ishizue no Hanakanmuri [Edición Regular]', 'Edición regular del lanzamiento musical de Roselia para BanG Dream!, titulado Ishizue no Hanakanmuri.', 12990.00, './assets/png/45.png', 1, 'cds');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (46, '(doll)Blue Lock – Peluche Pien Rin Itoshi', 'Peluche oficial de Pien Rin Itoshi de Blue Lock, ideal para coleccionistas y fans del manga/anime.', 41990.00, './assets/png/46.png', 0, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (47, '(doll) BanG Dream! – Peluche Kaoru Seta (Hello, Happy World!)', '(doll) Peluche oficial de Kaoru Seta de la banda Hello, Happy World! de BanG Dream!', 32000.00, './assets/png/47.png', 1, 'goods');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (48, '(figura bishoujo) Hatsune Miku EXPO 10th Anniversary', 'Figura a escala 1/7 de Hatsune Miku conmemorativa del 10º aniversario del EXPO.', 184490.00, './assets/png/48.png', 0, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (49, '(nendoroid)PICCODO Action Doll X Honkai: Star Rail – Chibi Doll Jiaoqiu', 'Figura chibi articulada de Jiaoqiu de Honkai: Star Rail en formato PICCODO Action.', 41380.00, './assets/png/49.png', 1, 'figures');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (50, 'Naruto vol. 01', 'Naruto Vol. 1 - El inicio de la aventura de Naruto Uzumaki.', 9590.00, './assets/png/50.png', 0, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (51, 'Manga Boy Meets Maria', 'Boy Meets Maria es un manga de género shōnen-ai ilustrado y escrito por Peyo.', 15990.00, './assets/png/51.png', 0, 'mangas');

INSERT INTO productos (id, nombre, descripcion, precio, foto, oferta, franquicia) 
VALUES (52, 'Nana tomo 01', 'Primer tomo del manga NANA, que sigue la vida de dos jóvenes mujeres con el mismo nombre pero personalidades y sueños muy diferentes.', 9590.00, './assets/png/52.png', 0, 'mangas');