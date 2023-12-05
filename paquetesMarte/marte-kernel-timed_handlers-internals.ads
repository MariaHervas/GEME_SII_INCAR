------------------------------------------------------------------------------
--  ------------------         M a R T E   O S         -------------------  --
------------------------------------------------------------------------------
--                                                             V1.9 2009-08-19
--
--       'K e r n e l . T i m e d _ H a n d l e r s . I n t e r n a l s'
--
--                                 Spec
--
--
--  File 'kernel-timed_handlers-internals.ads'                        By MAR.
--
--
--
--
--  ----------------------------------------------------------------------
--   Copyright (C) 2000-2008, Universidad de Cantabria, SPAIN
--
--   MaRTE OS web page: http://marte.unican.es
--   Contact Addresses: Mario Aldea Rivas          aldeam@unican.es
--                      Michael Gonzalez Harbour      mgh@unican.es
--
--  MaRTE OS  is free software; you can  redistribute it and/or  modify it
--  under the terms of the GNU General Public License  as published by the
--  Free Software Foundation;  either  version 2, or (at  your option) any
--  later version.
--
--  MaRTE OS  is distributed  in the  hope  that  it will be   useful, but
--  WITHOUT  ANY  WARRANTY;     without  even the   implied   warranty  of
--  MERCHANTABILITY  or  FITNESS FOR A  PARTICULAR PURPOSE.    See the GNU
--  General Public License for more details.
--
--  You should have received  a  copy of  the  GNU General Public  License
--  distributed with MaRTE  OS;  see file COPYING.   If not,  write to the
--  Free Software  Foundation,  59 Temple Place  -  Suite 330,  Boston, MA
--  02111-1307, USA.
--
--  As a  special exception, if you  link this  unit  with other  files to
--  produce an   executable,   this unit  does  not  by  itself cause  the
--  resulting executable to be covered by the  GNU General Public License.
--  This exception does  not however invalidate  any other reasons why the
--  executable file might be covered by the GNU Public License.
--
-------------------------------------------------------------------------------
with MaRTE.HAL;

package MaRTE.Kernel.Timed_Handlers.Internals is

   package K renames MaRTE.Kernel;

   -----------------------------
   --  Pending_Handlers_List  --
   -----------------------------
   Pending_Handlers_List : K.Timed_Events_Lists.List :=
     K.Timed_Events_Lists.Null_List;
   --  List to store pending handlers that expired while handler
   --  execution is disabled.

   -------------------------
   --  Execution_Allowed  --
   -------------------------
   Execution_Allowed : Boolean := True;

   -----------------------------
   --  Execute_Timed_Handler  --
   -----------------------------
   procedure Execute_Timed_Handler
     (TE_Ac                  : in Timed_Handler_TE_Ac;
      From_Timer_Int_Handler : in Boolean;
      Now                    : in HAL.HWTime := HAL.HWTime'Last);
   pragma Inline (Execute_Timed_Handler);

end MaRTE.Kernel.Timed_Handlers.Internals;
