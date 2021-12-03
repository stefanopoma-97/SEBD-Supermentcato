-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 03, 2021 alle 16:33
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
-- Struttura della tabella `group`
--

CREATE TABLE `group` (
  `oid` int(11) NOT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `module_oid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `group`
--

INSERT INTO `group` (`oid`, `groupname`, `module_oid`) VALUES
(1, 'UtenteEsterno', 1),
(2, 'UtenteEsternoRegistrato', 2),
(3, 'Dipendente', 3),
(4, 'Responsabile', 4),
(5, 'Dirigente', 5);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `fk_group_module` (`module_oid`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `fk_group_module` FOREIGN KEY (`module_oid`) REFERENCES `module` (`oid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
