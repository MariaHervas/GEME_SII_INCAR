with Tipos_nuevos; use Tipos_nuevos;
package porc_temp_umbral is
 
   private
    --variables internas, que van al .ads, deben ser PRIVADAS
   type T_Umbral is new Float range 0.0..100.0; --l�mites que el umbral pueda tener, decidido por nosotros
   Umbral_Min, Umbral_Max: T_temp;
   Kont, Tot: Integer;
   Porcentaje: Float;
  
   arrayTemp: tipoArrayTemp;
   lenArray: Integer;
   
<<<<<<< HEAD
   procedure Porcentaje_Dentro_Del_Umbral (ArrayTemp: in TipoArrayTemp);
=======
   procedure Porcentaje_Dentro_Del_Umbral (ArrayTemp: in tipoArrayTemp);
>>>>>>> 66592ed8984e395879e65d3934d127733a8160ac
end porc_temp_umbral;