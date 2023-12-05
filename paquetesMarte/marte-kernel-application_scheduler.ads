------------------------------------------------------------------------------
--  ------------------         M a R T E   O S         -------------------  --
------------------------------------------------------------------------------
--                                                             V1.9 2009-08-19
--
--         'K e r n e l . A p p l i c a t i o n. S c h e d u l e r'
--
--                                 Spec
--
--
--  File 'k-application_scheduler.ads'                                 By MAR.
--
--
--  Application-defined scheduling. Scheduler operations.
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
with MaRTE.Kernel.Mutexes;
with MaRTE.Kernel.Signals;
with MaRTE.Kernel.Application_Scheduling_Data;

package MaRTE.Kernel.Application_Scheduler is

   pragma Elaborate_Body;

   package K renames MaRTE.Kernel;

   package APPSCHD_DATA       renames K.Application_Scheduling_Data;

   --------------------------
   -- Send_Event_From_Task --
   --------------------------
   --
   --  Used to send all the events generated by appscheduled tasks
   --  (appart from "TASK_NOTIFICATION" and "READY" events).
   procedure Send_Event_From_Task
     (Event_Code      : in K.Application_Scheduling_Data.Event_Code_T;
      ST              : in Task_Id; --  Scheduler task
      T               : in Task_Id;
      Prio            : in Task_Priority := Task_Priority'First;
      M               : in Mutexes.Mutex_Descriptor :=
        Mutexes.Null_Mutex_Descriptor);
   --  pragma Inline (Send_Event_From_Task); {MAR OJO} para 3.15p

   ------------------------
   -- Send_Timeout_Event --
   ------------------------
   procedure Send_Timeout_Event (ST : in Task_Id);
   pragma Inline (Send_Timeout_Event);

   -----------------------
   -- Send_Signal_Event --
   -----------------------
   procedure Send_Signal_Event (ST      : in Task_Id; --  Scheduler task
                                Siginfo : in Signals.Siginfo_T);
   pragma Inline (Send_Signal_Event);

   ----------------------------------
   --  Send_Notification_Or_Ready  --
   ----------------------------------
   --
   --  To send events with code "TASK_NOTIFICATION" or "READY". Called
   --  from 'SCHD.Interrupt_Handler' or 'SCHD.Task_Gets_Ready'.
   procedure Send_Notification_Or_Ready
     (Event_Code : in K.Application_Scheduling_Data.Event_Code_T;
      ST         : in Task_Id; --  Scheduler task
      T          : in Task_Id);

   ----------------------------------------
   --  Send_Notification_Or_Ready_Event  --
   ----------------------------------------
   --
   --  To send events with code "TASK_NOTIFICATION" or "READY" that
   --  were queued in 'Mutexes.SRP_Ceiling.Pending_Task_Events_Q'
   --  waiting until ceiling go low enough. Called from
   --  'Send_Notification_Or_Ready' and
   --  'Mutexes.SRP_Ceiling.Del_Mutex_Lock' when ceiling has
   --  decreased.
   procedure Send_Notification_Or_Ready_Event
     (ST : in Task_Id; --  Scheduler task
      E  : in K.Application_Scheduling_Data.AppSched_Event_Ac);

   ------------------------------------------------------------
   --  Execute_Scheduling_Operation_In_Running_Task_Context  --
   ------------------------------------------------------------
   --
   --  Called from 'TO_APPSCHD.Invoke_Scheduler'
   procedure Execute_Scheduler_Operation_In_Running_Task_Context
     (Event_Code      : in APPSCHD_DATA.Event_Code_T;
      ST              : in Task_Id; --  Scheduler task
      T               : in Task_Id;
      Flags           : in out Integer;
      Actions         : in out APPSCHD_DATA.Sched_Actions_Set;
      Info            : in System.Address := System.Null_Address;
      Info_Size       : in Int := 0;
      User_Event_Code : in Int := 0);

end MaRTE.Kernel.Application_Scheduler;