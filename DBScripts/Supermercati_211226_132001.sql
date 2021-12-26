-- REL FK: Prodotto onlineToRiga ordine [rel9#role18]
alter table `riga_ordine`   add index fk_riga_ordine_prodotto (`prodotto_online_oid`), add constraint fk_riga_ordine_prodotto foreign key (`prodotto_online_oid`) references `prodotto` ();


