-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 04, 2021 alle 09:58
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
-- Struttura della tabella `indirizzo`
--

CREATE TABLE `indirizzo` (
  `oid` int(11) NOT NULL,
  `via` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `citta_oid` int(11) DEFAULT NULL,
  `negozio_oid` int(11) DEFAULT NULL,
  `utente_esterno_registrato_oid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `indirizzo`
--

INSERT INTO `indirizzo` (`oid`, `via`, `numero`, `citta_oid`, `negozio_oid`, `utente_esterno_registrato_oid`) VALUES
(1, 'Ancona', 33, 1, 1, NULL),
(2, 'della Posta', 3, 2, 2, NULL),
(3, 'Comune', 101, 3, 3, NULL);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `indirizzo`
--
ALTER TABLE `indirizzo`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `fk_indirizzo_citta` (`citta_oid`),
  ADD KEY `idx_indirizzo_citta` (`citta_oid`),
  ADD KEY `fk_indirizzo_negozio` (`negozio_oid`),
  ADD KEY `idx_indirizzo_negozio` (`negozio_oid`),
  ADD KEY `fk_indirizzo_utente_esterno_re` (`utente_esterno_registrato_oid`),
  ADD KEY `idx_indirizzo_utente_esterno_r` (`utente_esterno_registrato_oid`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `indirizzo`
--
ALTER TABLE `indirizzo`
  ADD CONSTRAINT `fk_indirizzo_citta` FOREIGN KEY (`citta_oid`) REFERENCES `citta` (`oid`),
  ADD CONSTRAINT `fk_indirizzo_negozio` FOREIGN KEY (`negozio_oid`) REFERENCES `negozio` (`oid`),
  ADD CONSTRAINT `fk_indirizzo_utente_esterno_re` FOREIGN KEY (`utente_esterno_registrato_oid`) REFERENCES `utente_esterno_registrato` (`user_oid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
