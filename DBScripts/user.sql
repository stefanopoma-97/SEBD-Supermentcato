-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 03, 2021 alle 16:36
-- Versione del server: 10.4.22-MariaDB
-- Versione PHP: 8.0.13


--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`oid`, `username`, `password`, `email`, `group_oid`) VALUES
(1, 'stefano', 'stefano', 'stefano@gmail', 2),
(2, 'dipendente', 'dipendente', 'dipendente@gmail', 3),
(3, 'responsabile', 'responsabile', 'responsabile@gmail', 4),
(4, 'dirigente', 'dirigente', 'dirigente@gmail', 5),
(5, 'thomas', 'thomas', 'thomas@gmail', 2);

--
-- Indici per le tabelle scaricate
--

