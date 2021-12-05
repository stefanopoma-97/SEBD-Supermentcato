-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Città [ent1]
create table `citta` (
   `oid`  integer  not null,
   `nazione`  varchar(255),
   `provincia`  varchar(255),
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Stato ordine [ent10]
create table `stato_ordine` (
   `oid`  integer  not null,
   `stato`  varchar(255),
  primary key (`oid`)
);


-- Prodotto nuovo [ent11]
create table `prodotto_nuovo` (
   `prodotto_oid`  integer  not null,
  primary key (`prodotto_oid`)
);


-- Responsabile [ent12]
create table `responsabile` (
   `user_oid`  integer  not null,
   `nome`  varchar(255),
   `cognome`  varchar(255),
  primary key (`user_oid`)
);


-- Utente esterno registrato [ent13]
create table `utente_esterno_registrato` (
   `user_oid`  integer  not null,
   `nome`  varchar(255),
   `cognome`  varchar(255),
  primary key (`user_oid`)
);


-- Dipendente [ent14]
create table `dipendente` (
   `responsabile_oid`  integer  not null,
  primary key (`responsabile_oid`)
);


-- Fascia prezzo [ent15]
create table `fascia_prezzo` (
   `oid`  integer  not null,
   `fascia`  varchar(255),
  primary key (`oid`)
);


-- Negozio nuovo [ent18]
create table `negozio_nuovo` (
   `negozio_oid`  integer  not null,
  primary key (`negozio_oid`)
);


-- Nazione [ent19]
create table `nazione` (
   `oid`  integer  not null,
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Indirizzo [ent2]
create table `indirizzo` (
   `oid`  integer  not null,
   `numero`  integer,
   `via`  varchar(255),
  primary key (`oid`)
);


-- Orario [ent20]
create table `orario` (
   `oid`  integer  not null,
   `ora_fine`  time,
   `ora_inizio`  time,
   `giorno`  varchar(255),
  primary key (`oid`)
);


-- Negozio [ent3]
create table `negozio` (
   `oid`  integer  not null,
   `fondazione`  date,
   `massimo_ordini_giornalieri`  integer,
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Prodotto [ent4]
create table `prodotto` (
   `oid`  integer  not null,
   `data_inserimento`  date,
   `prezzo`  decimal(19,2),
   `descrizione`  varchar(255),
   `nome`  varchar(255),
   `immagine`  varchar(255),
  primary key (`oid`)
);


-- Categoria [ent5]
create table `categoria` (
   `oid`  integer  not null,
   `descrizione`  varchar(255),
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Promozione [ent6]
create table `promozione` (
   `oid`  integer  not null,
   `scadenza`  date,
   `sconto`  decimal(19,2),
   `valida_online`  bit,
   `valida_in_negozio`  bit,
  primary key (`oid`)
);


-- Riga ordine [ent7]
create table `riga_ordine` (
   `oid`  integer  not null,
   `quantita`  integer,
   `costo`  decimal(19,2),
  primary key (`oid`)
);


-- Prodotto online [ent8]
create table `prodotto_online` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Spesa [ent9]
create table `spesa` (
   `oid`  integer  not null,
   `data_di_spedizione`  date,
   `data_di_creazione`  date,
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Città_Indirizzo [rel1]
alter table `indirizzo`  add column  `citta_oid`  integer;
alter table `indirizzo`   add index fk_indirizzo_citta (`citta_oid`), add constraint fk_indirizzo_citta foreign key (`citta_oid`) references `citta` (`oid`);


-- Riga ordine_Spesa [rel10]
alter table `riga_ordine`  add column  `spesa_oid`  integer;
alter table `riga_ordine`   add index fk_riga_ordine_spesa (`spesa_oid`), add constraint fk_riga_ordine_spesa foreign key (`spesa_oid`) references `spesa` (`oid`);


-- Fascia prezzo_Prodotto [rel11]
alter table `prodotto`  add column  `fascia_prezzo_oid`  integer;
alter table `prodotto`   add index fk_prodotto_fascia_prezzo (`fascia_prezzo_oid`), add constraint fk_prodotto_fascia_prezzo foreign key (`fascia_prezzo_oid`) references `fascia_prezzo` (`oid`);


-- Spesa_Stato ordine [rel12]
alter table `stato_ordine`  add column  `spesa_oid`  integer;
alter table `stato_ordine`   add index fk_stato_ordine_spesa (`spesa_oid`), add constraint fk_stato_ordine_spesa foreign key (`spesa_oid`) references `spesa` (`oid`);


-- User_Spesa [rel13]
alter table `spesa`  add column  `utente_esterno_registrato_oid`  integer;
alter table `spesa`   add index fk_spesa_utente_esterno_regist (`utente_esterno_registrato_oid`), add constraint fk_spesa_utente_esterno_regist foreign key (`utente_esterno_registrato_oid`) references `utente_esterno_registrato` (`user_oid`);


-- User_Negozio [rel14]
alter table `responsabile`  add column  `negozio_oid`  integer;
alter table `responsabile`   add index fk_responsabile_negozio (`negozio_oid`), add constraint fk_responsabile_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Negozio_Utente esterno registrato [rel15]
alter table `utente_esterno_registrato`  add column  `negozio_oid`  integer;
alter table `utente_esterno_registrato`   add index fk_utente_esterno_registrato_n (`negozio_oid`), add constraint fk_utente_esterno_registrato_n foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Dipendente_Stato ordine [rel16]
alter table `stato_ordine`  add column  `dipendente_oid`  integer;
alter table `stato_ordine`   add index fk_stato_ordine_dipendente (`dipendente_oid`), add constraint fk_stato_ordine_dipendente foreign key (`dipendente_oid`) references `dipendente` (`responsabile_oid`);


-- Spesa_Negozio [rel17]
alter table `spesa`  add column  `negozio_oid`  integer;
alter table `spesa`   add index fk_spesa_negozio (`negozio_oid`), add constraint fk_spesa_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Prodotto_Nazione [rel18]
alter table `prodotto`  add column  `nazione_oid`  integer;
alter table `prodotto`   add index fk_prodotto_nazione (`nazione_oid`), add constraint fk_prodotto_nazione foreign key (`nazione_oid`) references `nazione` (`oid`);


-- Orario_Negozio [rel19]
alter table `negozio`  add column  `orario_oid`  integer;
alter table `negozio`   add index fk_negozio_orario (`orario_oid`), add constraint fk_negozio_orario foreign key (`orario_oid`) references `orario` (`oid`);


-- Negozio_Indirizzo [rel2]
alter table `indirizzo`  add column  `negozio_oid`  integer;
alter table `indirizzo`   add index fk_indirizzo_negozio (`negozio_oid`), add constraint fk_indirizzo_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- User_Indirizzo [rel3]
alter table `indirizzo`  add column  `utente_esterno_registrato_oid`  integer;
alter table `indirizzo`   add index fk_indirizzo_utente_esterno_re (`utente_esterno_registrato_oid`), add constraint fk_indirizzo_utente_esterno_re foreign key (`utente_esterno_registrato_oid`) references `utente_esterno_registrato` (`user_oid`);


-- Prodotto_Categoria [rel4]
alter table `prodotto`  add column  `categoria_oid`  integer;
alter table `prodotto`   add index fk_prodotto_categoria (`categoria_oid`), add constraint fk_prodotto_categoria foreign key (`categoria_oid`) references `categoria` (`oid`);


-- Promozione_Negozio [rel5]
alter table `promozione`  add column  `negozio_oid`  integer;
alter table `promozione`   add index fk_promozione_negozio (`negozio_oid`), add constraint fk_promozione_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Promozione_Prodotto [rel6]
alter table `promozione`  add column  `prodotto_oid`  integer;
alter table `promozione`   add index fk_promozione_prodotto (`prodotto_oid`), add constraint fk_promozione_prodotto foreign key (`prodotto_oid`) references `prodotto` (`oid`);


-- Prodotto online_Negozio [rel7]
alter table `prodotto_online`  add column  `negozio_oid`  integer;
alter table `prodotto_online`   add index fk_prodotto_online_negozio (`negozio_oid`), add constraint fk_prodotto_online_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Prodotto online_Prodotto [rel8]
alter table `prodotto_online`  add column  `prodotto_oid`  integer;
alter table `prodotto_online`   add index fk_prodotto_online_prodotto (`prodotto_oid`), add constraint fk_prodotto_online_prodotto foreign key (`prodotto_oid`) references `prodotto` (`oid`);


-- Riga ordine_Prodotto online [rel9]
alter table `riga_ordine`  add column  `prodotto_online_oid`  integer;
alter table `riga_ordine`   add index fk_riga_ordine_prodotto_online (`prodotto_online_oid`), add constraint fk_riga_ordine_prodotto_online foreign key (`prodotto_online_oid`) references `prodotto_online` (`oid`);


-- GEN FK: Prodotto nuovo --> Prodotto
alter table `prodotto_nuovo`   add index fk_prodotto_nuovo_prodotto (`prodotto_oid`), add constraint fk_prodotto_nuovo_prodotto foreign key (`prodotto_oid`) references `prodotto` (`oid`);


-- GEN FK: Responsabile --> User
alter table `responsabile`   add index fk_responsabile_user (`user_oid`), add constraint fk_responsabile_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: Utente esterno registrato --> User
alter table `utente_esterno_registrato`   add index fk_utente_esterno_registrato_u (`user_oid`), add constraint fk_utente_esterno_registrato_u foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: Dipendente --> Responsabile
alter table `dipendente`   add index fk_dipendente_responsabile (`responsabile_oid`), add constraint fk_dipendente_responsabile foreign key (`responsabile_oid`) references `responsabile` (`user_oid`);


-- GEN FK: Negozio nuovo --> Negozio
alter table `negozio_nuovo`   add index fk_negozio_nuovo_negozio (`negozio_oid`), add constraint fk_negozio_nuovo_negozio foreign key (`negozio_oid`) references `negozio` (`oid`);


-- Stato ordine.utenteEsterno [ent10#att55]
create view `stato_ordine_utenteesterno_vie` as
select AL1.`oid` as `oid`, AL3.`oid` as `der_attr`
from  `stato_ordine` AL1 
               left outer join `spesa` AL2 on AL1.`spesa_oid`=AL2.`oid`
               left outer join `user` AL3 on AL2.`utente_esterno_registrato_oid`=AL3.`oid`;


-- Stato ordine.dipendente [ent10#att56]
create view `stato_ordine_dipendente_view` as
select AL1.`oid` as `oid`, AL2.`oid` as `der_attr`
from  `stato_ordine` AL1 
               left outer join `user` AL2 on AL1.`dipendente_oid`=AL2.`oid`;


-- Dipendente.ordiniGestiti [ent14#att54]
create view `dipendente_ordinigestiti_view` as
select AL1.`responsabile_oid` as `responsabile_oid`, count(distinct AL2.`oid`) as `der_attr`
from  `dipendente` AL1 
               left outer join `stato_ordine` AL2 on AL1.`responsabile_oid`=AL2.`dipendente_oid`
group by AL1.`responsabile_oid`;


-- Negozio.numeroLavoratori [ent3#att58]
create view `negozio_numerolavoratori_view` as
select AL1.`oid` as `oid`, count(distinct AL2.`user_oid`) as `der_attr`
from  `negozio` AL1 
               left outer join `responsabile` AL2 on AL1.`oid`=AL2.`negozio_oid`
group by AL1.`oid`;


-- Spesa.importo totale [ent9#att34]
create view `spesa_importo_totale_view` as
select AL1.`oid` as `oid`, sum(AL2.`costo`) as `der_attr`
from  `spesa` AL1 
               left outer join `riga_ordine` AL2 on AL1.`oid`=AL2.`spesa_oid`
group by AL1.`oid`;


-- Negozio.volume vendite [ent3#att42]
create view `negozio_volume_vendite_view` as
select AL1.`oid` as `oid`, sum(AL3.`der_attr`) as `der_attr`
from  `negozio` AL1 
               left outer join `spesa` AL2 on AL1.`oid`=AL2.`negozio_oid`
               left outer join `spesa_importo_totale_view` AL3 on AL2.`oid`=AL3.`oid`
group by AL1.`oid`;


