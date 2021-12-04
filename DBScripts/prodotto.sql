-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 04, 2021 alle 10:05
-- Versione del server: 10.4.22-MariaDB
-- Versione PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supermercati`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto`
--

CREATE TABLE `prodotto` (
  `oid` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `prezzo` decimal(19,2) DEFAULT NULL,
  `data_inserimento` date DEFAULT NULL,
  `immagine` varchar(255) DEFAULT NULL,
  `fascia_prezzo_oid` int(11) DEFAULT NULL,
  `nazione_oid` int(11) DEFAULT NULL,
  `categoria_oid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `prodotto`
--

INSERT INTO `prodotto` (`oid`, `nome`, `descrizione`, `prezzo`, `data_inserimento`, `immagine`, `fascia_prezzo_oid`, `nazione_oid`, `categoria_oid`) VALUES
(1, 'Arance', 'Descrizione arance', '5.00', '2021-12-01', NULL, 1, 1, 2),
(2, 'Carote', 'Descrizione carote', '6.00', '2021-10-12', NULL, 1, 3, 1),
(3, 'Biscotti al Cioccolato', 'descrizione biscotti', '10.00', '2021-12-01', NULL, 2, 2, 3);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `fk_prodotto_fascia_prezzo` (`fascia_prezzo_oid`),
  ADD KEY `idx_prodotto_fascia_prezzo` (`fascia_prezzo_oid`),
  ADD KEY `fk_prodotto_nazione` (`nazione_oid`),
  ADD KEY `idx_prodotto_nazione` (`nazione_oid`),
  ADD KEY `fk_prodotto_categoria` (`categoria_oid`),
  ADD KEY `idx_prodotto_categoria` (`categoria_oid`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  ADD CONSTRAINT `fk_prodotto_categoria` FOREIGN KEY (`categoria_oid`) REFERENCES `categoria` (`oid`),
  ADD CONSTRAINT `fk_prodotto_fascia_prezzo` FOREIGN KEY (`fascia_prezzo_oid`) REFERENCES `fascia_prezzo` (`oid`),
  ADD CONSTRAINT `fk_prodotto_nazione` FOREIGN KEY (`nazione_oid`) REFERENCES `nazione` (`oid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
