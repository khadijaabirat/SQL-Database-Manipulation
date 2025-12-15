-- Add a new product with reference 19, name 'Agrafeuse', price 50.6 DH
INSERT INTO produit
VALUES (19, 'Agrafeuse', 50.6);
-- Register a new invoice number 8 dated 21/11/2010
INSERT INTO facture
VALUES (8, "2010-11-21");
-- Update the price of the stapler to 70.0 DH
UPDATE produit
SET `prixht` = 70
WHERE design = 'Agrafeuse';
-- Correct the date of invoice 6 to 14/10/2010
UPDATE Facture
SET DatFact = '2010-10-14'
WHERE Numfact = 6;
-- Update the description of the notebook to "Cahier 24 pages"
UPDATE Produit
SET Design = 'Cahier 24 pages'
WHERE RefProd = 3;
-- Delete the product "Agrafeuse"
DELETE FROM Produit
WHERE Design = 'Agrafeuse';
-- Delete invoice number 2
DELETE FROM Facture
WHERE Numfact = 2;
-- Display all available products in stock
SELECT *
FROM Produit;
-- Show products with price > 2.30 DH
SELECT *
FROM Produit
WHERE PrixHT > 2.30;
-- Display products priced between 50 DH and 5000 DH 
SELECT *
FROM Facture
WHERE DatFact < '2020-10-16';
-- Show product names in stock with price < 2000 DH
SELECT Design
FROM Produit
WHERE PrixHT < 2000;
--  Display all invoice numbers
SELECT Numfact
FROM Facture;
-- Show all quantities invoiced for product reference 5
SELECT Qte
FROM Est_Facture
WHERE RefProd = 5;
-- Count total available products
SELECT COUNT(*) AS TotalProducts
FROM Produit;
-- Display product names and prices from cheapest to most expensive
SELECT Design,
    PrixHT
FROM Produit
ORDER BY PrixHT ASC;
-- Find the product with the highest price
SELECT Design,
    PrixHT
FROM Produit
ORDER BY PrixHT DESC
LIMIT 1;
-- Find the product with the lowest price
SELECT Design,
    PrixHT
FROM Produit
ORDER BY PrixHT
LIMIT 1;
-- Display names of products that have been invoiced
SELECT DISTINCT p.Design
FROM Produit p
    INNER JOIN Est_Facture ef ON p.RefProd = ef.RefProd;
-- Display names and prices of products never invoiced
SELECT p.Design,
    p.PrixHT
FROM Produit p
    LEFT JOIN Est_Facture ef ON p.RefProd = ef.RefProd
WHERE ef.RefProd IS NULL;
-- Show invoiced products with their sold quantities
SELECT p.Design,
    ef.Qte
FROM Produit p
    INNER JOIN Est_Facture ef ON p.RefProd = ef.RefProd;
--  Display invoiced products with their total quantities sold
SELECT p.Design,
    ef.Qte
FROM Produit p
    INNER JOIN Est_Facture ef ON p.RefProd = ef.RefProd;
-- Show product references and quantities from invoices dated April 1, 2024
SELECT ef.RefProd,
    ef.Qte
FROM Est_Facture ef
    INNER JOIN Facture f ON ef.Numfact = f.Numfact
WHERE f.DatFact = '2024-04-01';
-- Display clients who placed at least one order
SELECT DISTINCT c.Nom,
    c.Prenom
FROM Client c
    INNER JOIN Commande cmd ON c.IdClient = cmd.IdClient;
-- Show clients who never placed any order
SELECT c.Nom,
    c.Prenom
FROM Client c
    LEFT JOIN Commande cmd ON c.IdClient = cmd.IdClient
WHERE cmd.IdClient IS NULL;
-- Display all orders with associated client information
SELECT cmd.Numfact,
    c.Nom,
    c.Prenom,
    c.Ville,
    f.DatFact
FROM Commande cmd
    INNER JOIN Client c ON cmd.IdClient = c.IdClient
    INNER JOIN Facture f ON cmd.Numfact = f.Numfact
ORDER BY cmd.Numfact;
-- Show clients with more than one order and their total order count
SELECT c.Nom,
    c.Prenom,
    COUNT(cmd.Numfact) AS NombreCommandes
FROM Client c
    INNER JOIN Commande cmd ON c.IdClient = cmd.IdClient
GROUP BY c.IdClient,
    c.Nom,
    c.Prenom
HAVING COUNT(cmd.Numfact) > 1
ORDER BY NombreCommandes DESC;
-- Show invoices with client names and invoice dates
SELECT f.Numfact,
    f.DatFact,
    c.Nom,
    c.Prenom
FROM Facture f
    INNER JOIN Commande cmd ON f.Numfact = cmd.Numfact
    INNER JOIN Client c ON cmd.IdClient = c.IdClient
ORDER BY f.DatFact DESC;
-- Show all products with their category
SELECT p.Design,
    p.PrixHT,
    FROM Produit p
    LEFT JOIN Produit_Categorie pc ON p.RefProd = pc.RefProd
    LEFT JOIN Categorie_Produit cp ON pc.IdCateg = cp.IdCateg
ORDER BY Categorie,
    p.Design;