-- =============================================
-- Database: StoreManagement
-- Created for: SQL Practice Activity
-- =============================================

CREATE DATABASE IF NOT EXISTS StoreManagement;
USE StoreManagement;

-- =============================================
-- Table Creation
-- =============================================

-- Produit Table
CREATE TABLE Produit (
    RefProd INT PRIMARY KEY,
    Design VARCHAR(100) NOT NULL,
    PrixHT DECIMAL(10,2) NOT NULL
);

-- Facture Table
CREATE TABLE Facture (
    Numfact INT PRIMARY KEY,
    DatFact DATE NOT NULL
);

-- Client Table
CREATE TABLE Client (
    IdClient INT PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Prenom VARCHAR(50) NOT NULL,
    Ville VARCHAR(50) NOT NULL
);

-- Categorie_Produit Table
CREATE TABLE Categorie_Produit (
    IdCateg INT PRIMARY KEY,
    NomCateg VARCHAR(50) NOT NULL
);

-- Anc_Produit Table (Product History)
CREATE TABLE Anc_Produit (
    RefProd INT PRIMARY KEY,
    Design VARCHAR(100) NOT NULL,
    PrixHT DECIMAL(10,2) NOT NULL
);

-- Commande Table (Invoice-Client Relationship)
CREATE TABLE Commande (
    Numfact INT,
    IdClient INT,
    PRIMARY KEY (Numfact, IdClient),
    FOREIGN KEY (Numfact) REFERENCES Facture(Numfact),
    FOREIGN KEY (IdClient) REFERENCES Client(IdClient)
);

-- Est_Facture Table (Invoice-Product Relationship)
CREATE TABLE Est_Facture (
    Numfact INT,
    RefProd INT,
    Qte INT NOT NULL,
    PRIMARY KEY (Numfact, RefProd),
    FOREIGN KEY (Numfact) REFERENCES Facture(Numfact),
    FOREIGN KEY (RefProd) REFERENCES Produit(RefProd)
);

-- Produit_Categorie Table (Product-Category Relationship)
CREATE TABLE Produit_Categorie (
    RefProd INT,
    IdCateg INT,
    PRIMARY KEY (RefProd, IdCateg),
    FOREIGN KEY (RefProd) REFERENCES Produit(RefProd),
    FOREIGN KEY (IdCateg) REFERENCES Categorie_Produit(IdCateg)
);

-- =============================================
-- Data Insertion
-- =============================================

-- Insert Products
INSERT INTO Produit (RefProd, Design, PrixHT) VALUES
(1, 'Livre', 120.0),
(2, 'Stylo Bic', 10.0),
(3, 'Cahier A4', 30.0),
(4, 'Gomme', 5.0),
(5, 'Sac à dos scolaire', 250.0),
(6, 'Ordinateur Dell', 9000.0),
(7, 'Tablette Samsung', 3200.0),
(8, 'Casque Bluetooth', 800.0),
(9, 'Imprimante HP', 1500.0),
(10, 'Souris sans fil', 200.0),
(11, 'Clavier mécanique', 400.0),
(12, 'Tapis de souris', 80.0),
(13, 'Chargeur USB-C', 120.0),
(14, 'Disque Dur 1To', 600.0),
(15, 'Clé USB 64Go', 150.0),
(16, 'Carnet de notes', 35.0),
(17, 'Tableau Blanc', 500.0),
(18, 'Scanner Epson', 2500.0),
(20, 'Clé USB 128Go', 250.0),
(21, 'Batterie Externe 10000mAh', 350.0),
(22, 'Enceinte Bluetooth', 1200.0),
(23, 'Webcam HD', 800.0),
(24, 'Rétroprojecteur', 4500.0),
(25, 'Casque Gaming', 2200.0),
(26, 'Paperboard', 900.0),
(27, 'Calculate scientifique', 350.0),
(28, 'Lampe LED de bureau', 150.0),
(29, 'Sacoche pour ordinateur', 450.0),
(30, 'Disque SSD 512Go', 1000.0),
(31, 'Support écran ajustable', 750.0);

-- Insert Invoices
INSERT INTO Facture (Numfact, DatFact) VALUES
(1, '2024-01-12'),
(2, '2024-01-15'),
(3, '2024-01-20'),
(4, '2024-01-28'),
(5, '2024-02-05'),
(6, '2024-02-10'),
(7, '2010-10-16'),
(9, '2010-12-02'),
(10, '2011-03-03'),
(11, '2012-06-17'),
(12, '2015-09-25'),
(13, '2018-12-08'),
(14, '2020-07-21'),
(15, '2022-05-30'),
(16, '2024-04-01'),
(17, '2024-05-03'),
(18, '2024-03-10'),
(19, '2024-03-15');

-- Insert Clients
INSERT INTO Client (IdClient, Nom, Prenom, Ville) VALUES
(1, 'El Idrissi', 'Omar', 'Casablanca'),
(2, 'Bennani', 'Fatima', 'Rabat'),
(3, 'Tazi', 'Mohamed', 'Fès'),
(4, 'Ouazzani', 'Sofia', 'Tanger'),
(5, 'Jebli', 'Hassan', 'Marrakech'),
(6, 'Ait Laheen', 'Karim', 'Agadir'),
(7, 'Essaidi', 'Imane', 'Oujda'),
(8, 'Hajji', 'Abdellah', 'Kenitra'),
(9, 'El Amrani', 'Yassine', 'Meknès'),
(10, 'Zaidi', 'Nadia', 'Essaouira'),
(11, 'Karim', 'El Bachir', 'Fès'),
(12, 'Soukaina', 'Meziane', 'Rabat'),
(13, 'Yassir', 'Benali', 'Rabat'),
(14, 'Sarah', 'Touhami', 'Casablanca'),
(15, 'Nour', 'El Idrissi', 'Fès'),
(16, 'Walid', 'Moussa', 'Meknès'),
(17, 'Hind', 'Bakkali', 'Agadir'),
(18, 'Ali', 'Hammadi', 'Tanger'),
(19, 'Client', 'Supplémentaire', 'Rabat');

-- Insert Categories
INSERT INTO Categorie_Produit (IdCateg, NomCateg) VALUES
(1, 'Papeterie'),
(2, 'Informatique'),
(3, 'Accessoires'),
(4, 'Stockage'),
(5, 'Audio'),
(6, 'Périphérique'),
(7, 'Equipements de bureau'),
(8, 'Mobilier de Bureau');

-- Insert Product-Category Relationships
INSERT INTO Produit_Categorie (RefProd, IdCateg) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(6, 2), (7, 2), (9, 2), (10, 2), (11, 2),
(8, 3), (12, 3), (13, 3), (14, 4), (15, 4),
(16, 1), (17, 7), (18, 2), (19, 7), (20, 4),
(21, 5), (22, 5), (23, 6), (24, 6), (25, 5),
(26, 7), (27, 1), (28, 7), (29, 3), (30, 4);

-- Insert Orders (Invoice-Client relationships)
INSERT INTO Commande (Numfact, IdClient) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 1), (8, 1), (9, 11), (10, 11),
(11, 12), (12, 12), (16, 19), (17, 2),
(10, 13), (11, 13), (12, 14), (13, 15),
(14, 16), (15, 17), (10, 18), (11, 18);

-- Insert Invoice Details (Est_Facture)
INSERT INTO Est_Facture (Numfact, RefProd, Qte) VALUES
(1, 1, 2), (1, 3, 5), (2, 2, 10), (3, 4, 4),
(4, 5, 1), (4, 6, 2), (5, 7, 3), (5, 8, 2),
(6, 9, 1), (6, 10, 4), (6, 11, 5), (7, 3, 2),
(8, 4, 1), (9, 5, 3), (10, 6, 4), (11, 7, 2),
(12, 8, 1), (16, 26, 2), (17, 27, 3), (18, 28, 1),
(19, 29, 2), (20, 30, 1), (21, 16, 3), (22, 17, 2),
(23, 18, 1), (24, 19, 5), (25, 20, 2), (26, 21, 4),
(27, 22, 2), (28, 23, 3), (29, 24, 1), (30, 25, 2);

-- Insert Product History (Anc_Produit)
INSERT INTO Anc_Produit (RefProd, Design, PrixHT) VALUES
(1, 'Livre', 100), (2, 'Stylo Bic', 8), (3, 'Cahier A4', 25),
(6, 'Ordinateur Dell', 8500), (9, 'Imprimante HP', 1400),
(16, 'Carnet de notes', 30), (19, 'Agrafeuse', 40),
(22, 'Enceinte Bluetooth', 1000), (24, 'Rétroprojecteur', 4000),
(26, 'Paperboard', 850), (27, 'Calculate scientifique', 300),
(28, 'Lampe LED de bureau', 120), (29, 'Sacoche pour ordinateur', 400),
(30, 'Disque SSD 512Go', 900);

-- =============================================
-- Verification Queries
-- =============================================

-- Verify table counts
SELECT 'Produit' AS Table_Name, COUNT(*) AS Count FROM Produit
UNION ALL SELECT 'Facture', COUNT(*) FROM Facture
UNION ALL SELECT 'Client', COUNT(*) FROM Client
UNION ALL SELECT 'Categorie_Produit', COUNT(*) FROM Categorie_Produit
UNION ALL SELECT 'Commande', COUNT(*) FROM Commande
UNION ALL SELECT 'Est_Facture', COUNT(*) FROM Est_Facture
UNION ALL SELECT 'Produit_Categorie', COUNT(*) FROM Produit_Categorie
UNION ALL SELECT 'Anc_Produit', COUNT(*) FROM Anc_Produit;

-- Display sample data from each table
SELECT * FROM Produit LIMIT 5;
SELECT * FROM Facture LIMIT 5;
SELECT * FROM Client LIMIT 5;