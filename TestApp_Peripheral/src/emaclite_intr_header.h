#define TESTAPP_GEN

/* $Id: emaclite_intr_header.h,v 1.1 2006/07/07 23:17:04 somn Exp $ */


#include "xbasic_types.h"
#include "xstatus.h"

XStatus EmacLiteExample(XIntc* IntcInstancePtr,
                        XEmacLite* EmacLiteInstPtr,
                        Xuint16 EmacLiteDeviceId,
                        Xuint16 EmacLiteIntrId);


