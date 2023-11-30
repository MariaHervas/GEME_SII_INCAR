package Tipos_nuevos is

   subtype T_temp is Float range 0.0..100.0;
   type tipoArrayTemp is array (1..15) of T_temp;

end Tipos_nuevos;
