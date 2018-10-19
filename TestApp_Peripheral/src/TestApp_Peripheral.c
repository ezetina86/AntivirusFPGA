/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * Xilinx EDK 8.2.02 EDK_Im_Sp2.4
 *
 * This file is a sample test application
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * XPS project when you run the "Generate Libraries" menu item
 * in XPS.
 *
 * Your XPS project directory is at:
 *    /home/proyecto/Proyecto/XUPV2P-MicheAngelo/
 */


// Located in: ppc405_0/include/xparameters.h
#include "xparameters.h"

#include "xcache_l.h"

#include "stdio.h"

#include "xintc.h"
#include "xexception_l.h"
#include "intc_header.h"
#include "xemaclite.h"
#include "emaclite_header.h"
#include "emaclite_intr_header.h"
#include "xsysace.h"
#include "sysace_header.h"

//====================================================

int main (void) {


   static XIntc intc;

   XCache_EnableICache(0x80000000);
   XCache_EnableDCache(0x80000000);
   static XEmacLite Ethernet_MAC_EmacLite;
   print("-- Entering main() --\r\n");


   {
      XStatus status;
      
      print("\r\n Runnning IntcSelfTestExample() for opb_intc_0...\r\n");
      
      status = IntcSelfTestExample(XPAR_OPB_INTC_0_DEVICE_ID);
      
      if (status == 0) {
         print("IntcSelfTestExample PASSED\r\n");
      }
      else {
         print("IntcSelfTestExample FAILED\r\n");
      }
   } 
	
   {
       XStatus Status;

       Status = IntcInterruptSetup(&intc, XPAR_OPB_INTC_0_DEVICE_ID);
       if (Status == 0) {
          print("Intc Interrupt Setup PASSED\r\n");
       } 
       else {
         print("Intc Interrupt Setup FAILED\r\n");
      } 
   }

   /*
    * Peripheral SelfTest will not be run for RS232_Uart_1
    * because it has been selected as the STDOUT device
    */



   {
      XStatus status;
      
      print("\r\nRunning EMACLiteSelfTestExample() for Ethernet_MAC...\r\n");
      status = EMACLiteSelfTestExample(XPAR_ETHERNET_MAC_DEVICE_ID);
      if (status == 0) {
         print("EMACLiteSelfTestExample PASSED\r\n");
      }
      else {
         print("EMACLiteSelfTestExample FAILED\r\n");
      }
   }
   {
      XStatus Status;

      print("\r\n Running Interrupt Test  for Ethernet_MAC...\r\n");
      
      Status = EmacLiteExample(&intc, &Ethernet_MAC_EmacLite, \
                               XPAR_ETHERNET_MAC_DEVICE_ID, \
                               XPAR_OPB_INTC_0_ETHERNET_MAC_IP2INTC_IRPT_INTR);
	
      if (Status == 0) {
         print("EmacLite Interrupt Test PASSED\r\n");
      } 
      else {
         print("EmacLite Interrupt Test FAILED\r\n");
      }

   }


   {
      XStatus status;
      
      print("\r\nRunning SysAceSelfTestExample() for SysACE_CompactFlash...\r\n");
      status = SysAceSelfTestExample(XPAR_SYSACE_COMPACTFLASH_DEVICE_ID);
      if (status == 0) {
         print("SysAceSelfTestExample PASSED\r\n");
      }
      else {
         print("SysAceSelfTestExample FAILED\r\n");
      }
   }

   print("-- Exiting main() --\r\n");
   XCache_DisableDCache();
   XCache_DisableICache();
   return 0;
}

