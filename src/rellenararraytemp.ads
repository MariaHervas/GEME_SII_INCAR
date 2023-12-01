with Tipos_nuevos; use Tipos_nuevos;

package rellenarArrayTemp is



   procedure rellenarArray(valorTemp: Float; arrayTemp: out tipoArrayTemp; lenArray: in out Integer);
   function arrayLLeno(arrayTemp: tipoArrayTemp) return tipoArrayTemp;
   procedure mostrarArray(arrayTemp: in tipoArrayTemp; lenArray: in Integer);

end rellenarArrayTemp;
