-- Responsabile [ent12]
alter table `responsabile`  add column  `licenziato`  bit;


-- Riga ordine [ent7]
alter table `riga_ordine`  add column  `sconto`  decimal(19,2);
alter table `riga_ordine`  add column  `sub_totale`  decimal(19,2);


