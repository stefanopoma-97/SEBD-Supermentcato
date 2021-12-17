-- Spesa.importo totale [ent9#att63]
drop view `spesa_importo_totale_view`;
create view `spesa_importo_totale_view` as
select AL1.`oid` as `oid`, sum(AL2.`sub_totale`) as `der_attr`
from  `spesa` AL1 
               left outer join `riga_ordine` AL2 on AL1.`oid`=AL2.`spesa_oid`
group by AL1.`oid`;


