-- Negozio.volume vendite [ent3#att42]
drop view `negozio_volume_vendite_view`;
create view `negozio_volume_vendite_view` as
select AL1.`oid` as `oid`, sum(AL3.`der_attr`) as `der_attr`
from  `negozio` AL1 
               left outer join `spesa` AL2 on AL1.`oid`=AL2.`negozio_oid`
               left outer join `spesa_importo_totale_view` AL3 on AL2.`oid`=AL3.`oid`
group by AL1.`oid`;


