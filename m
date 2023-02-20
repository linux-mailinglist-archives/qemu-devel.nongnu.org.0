Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2569D2AE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:20:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUAlV-0004B8-R3; Mon, 20 Feb 2023 13:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUAlA-0003t0-2k
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:19:32 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUAl2-0008Dm-RS
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:19:29 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 78EF47470AE;
 Mon, 20 Feb 2023 19:19:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 32B897470AB; Mon, 20 Feb 2023 19:19:05 +0100 (CET)
Message-Id: <9b0aadedc7c4780fefdc27f14f72ac9003032fbf.1676916639.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1676916639.git.balaton@eik.bme.hu>
References: <cover.1676916639.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 1/7] usb/ohci: Code style fix comments
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org
Date: Mon, 20 Feb 2023 19:19:05 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/usb/hcd-ohci.c | 99 +++++++++++++++++++++++------------------------
 1 file changed, 49 insertions(+), 50 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 9d68036d23..9f138e7f25 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -23,7 +23,7 @@
  *  o Disable timers when nothing needs to be done, or remove timer usage
  *    all together.
  *  o BIOS work to boot from USB storage
-*/
+ */
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
@@ -39,7 +39,7 @@
 #include "hcd-ohci.h"
 
 /* This causes frames to occur 1000x slower */
-//#define OHCI_TIME_WARP 1
+/*#define OHCI_TIME_WARP 1*/
 
 #define ED_LINK_LIMIT 32
 
@@ -58,7 +58,7 @@ struct ohci_hcca {
 #define ED_WBACK_OFFSET offsetof(struct ohci_ed, head)
 #define ED_WBACK_SIZE   4
 
-/* Bitfields for the first word of an Endpoint Desciptor.  */
+/* Bitfields for the first word of an Endpoint Desciptor. */
 #define OHCI_ED_FA_SHIFT  0
 #define OHCI_ED_FA_MASK   (0x7f<<OHCI_ED_FA_SHIFT)
 #define OHCI_ED_EN_SHIFT  7
@@ -71,11 +71,11 @@ struct ohci_hcca {
 #define OHCI_ED_MPS_SHIFT 16
 #define OHCI_ED_MPS_MASK  (0x7ff<<OHCI_ED_MPS_SHIFT)
 
-/* Flags in the head field of an Endpoint Desciptor.  */
+/* Flags in the head field of an Endpoint Desciptor. */
 #define OHCI_ED_H         1
 #define OHCI_ED_C         2
 
-/* Bitfields for the first word of a Transfer Desciptor.  */
+/* Bitfields for the first word of a Transfer Desciptor. */
 #define OHCI_TD_R         (1<<18)
 #define OHCI_TD_DP_SHIFT  19
 #define OHCI_TD_DP_MASK   (3<<OHCI_TD_DP_SHIFT)
@@ -88,7 +88,7 @@ struct ohci_hcca {
 #define OHCI_TD_CC_SHIFT  28
 #define OHCI_TD_CC_MASK   (0xf<<OHCI_TD_CC_SHIFT)
 
-/* Bitfields for the first word of an Isochronous Transfer Desciptor.  */
+/* Bitfields for the first word of an Isochronous Transfer Desciptor. */
 /* CC & DI - same as in the General Transfer Desciptor */
 #define OHCI_TD_SF_SHIFT  0
 #define OHCI_TD_SF_MASK   (0xffff<<OHCI_TD_SF_SHIFT)
@@ -335,8 +335,8 @@ static void ohci_soft_reset(OHCIState *ohci)
     ohci->per_cur = 0;
     ohci->done = 0;
     ohci->done_count = 7;
-
-    /* FSMPS is marked TBD in OCHI 1.0, what gives ffs?
+    /*
+     * FSMPS is marked TBD in OCHI 1.0, what gives ffs?
      * I took the value linux sets ...
      */
     ohci->fsmps = 0x2778;
@@ -460,10 +460,10 @@ static inline int ohci_read_hcca(OHCIState *ohci,
 static inline int ohci_put_ed(OHCIState *ohci,
                               dma_addr_t addr, struct ohci_ed *ed)
 {
-    /* ed->tail is under control of the HCD.
+    /*
+     * ed->tail is under control of the HCD.
      * Since just ed->head is changed by HC, just write back this
      */
-
     return put_dwords(ohci, addr + ED_WBACK_OFFSET,
                       (uint32_t *)((char *)ed + ED_WBACK_OFFSET),
                       ED_WBACK_SIZE >> 2);
@@ -601,8 +601,10 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
         trace_usb_ohci_iso_td_relative_frame_number_neg(relative_frame_number);
         return 1;
     } else if (relative_frame_number > frame_count) {
-        /* ISO TD expired - retire the TD to the Done Queue and continue with
-           the next ISO TD of the same ED */
+        /*
+         * ISO TD expired - retire the TD to the Done Queue and continue with
+         * the next ISO TD of the same ED
+         */
         trace_usb_ohci_iso_td_relative_frame_number_big(relative_frame_number,
                                                         frame_count);
         if (OHCI_CC_DATAOVERRUN == OHCI_BM(iso_td.flags, TD_CC)) {
@@ -845,9 +847,10 @@ static void ohci_td_pkt(const char *msg, const uint8_t *buf, size_t len)
     }
 }
 
-/* Service a transport descriptor.
-   Returns nonzero to terminate processing of this endpoint.  */
-
+/*
+ * Service a transport descriptor.
+ * Returns nonzero to terminate processing of this endpoint.
+ */
 static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
 {
     int dir;
@@ -869,7 +872,7 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
         return 1;
     }
 
-    /* See if this TD has already been submitted to the device.  */
+    /* See if this TD has already been submitted to the device. */
     completion = (addr == ohci->async_td);
     if (completion && !ohci->async_complete) {
         trace_usb_ohci_td_skip_async();
@@ -885,7 +888,7 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
     switch (dir) {
     case OHCI_TD_DIR_OUT:
     case OHCI_TD_DIR_IN:
-        /* Same value.  */
+        /* Same value. */
         break;
     default:
         dir = OHCI_BM(td.flags, TD_DP);
@@ -956,11 +959,12 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
         }
         ep = usb_ep_get(dev, pid, OHCI_BM(ed->flags, ED_EN));
         if (ohci->async_td) {
-            /* ??? The hardware should allow one active packet per
-               endpoint.  We only allow one active packet per controller.
-               This should be sufficient as long as devices respond in a
-               timely manner.
-            */
+            /*
+             * ??? The hardware should allow one active packet per
+             * endpoint.  We only allow one active packet per controller.
+             * This should be sufficient as long as devices respond in a
+             * timely manner.
+             */
             trace_usb_ohci_td_too_many_pending(ep->nr);
             return 1;
         }
@@ -996,7 +1000,7 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
 
     /* Writeback */
     if (ret == pktlen || (dir == OHCI_TD_DIR_IN && ret >= 0 && flag_r)) {
-        /* Transmission succeeded.  */
+        /* Transmission succeeded. */
         if (ret == len) {
             td.cbp = 0;
         } else {
@@ -1048,8 +1052,10 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
                 OHCI_SET_BM(td.flags, TD_EC, 3);
                 break;
             }
-            /* An error occurred so we have to clear the interrupt counter. See
-             * spec at 6.4.4 on page 104 */
+            /*
+             * An error occurred so we have to clear the interrupt counter.
+             * See spec at 6.4.4 on page 104
+             */
             ohci->done_count = 0;
         }
         ed->head |= OHCI_ED_H;
@@ -1071,7 +1077,7 @@ exit_no_retire:
     return OHCI_BM(td.flags, TD_CC) != OHCI_CC_NOERROR;
 }
 
-/* Service an endpoint list.  Returns nonzero if active TD were found.  */
+/* Service an endpoint list.  Returns nonzero if active TD were found. */
 static int ohci_service_ed_list(OHCIState *ohci, uint32_t head)
 {
     struct ohci_ed ed;
@@ -1095,7 +1101,7 @@ static int ohci_service_ed_list(OHCIState *ohci, uint32_t head)
 
         if ((ed.head & OHCI_ED_H) || (ed.flags & OHCI_ED_K)) {
             uint32_t addr;
-            /* Cancel pending packets for ED that have been paused.  */
+            /* Cancel pending packets for ED that have been paused. */
             addr = ed.head & OHCI_DPTR_MASK;
             if (ohci->async_td && addr == ohci->async_td) {
                 usb_cancel_packet(&ohci->usb_packet);
@@ -1151,7 +1157,7 @@ static void ohci_sof(OHCIState *ohci)
     ohci_set_interrupt(ohci, OHCI_INTR_SF);
 }
 
-/* Process Control and Bulk lists.  */
+/* Process Control and Bulk lists. */
 static void ohci_process_lists(OHCIState *ohci)
 {
     if ((ohci->ctl & OHCI_CTL_CLE) && (ohci->status & OHCI_STATUS_CLF)) {
@@ -1192,7 +1198,7 @@ static void ohci_frame_boundary(void *opaque)
         ohci_service_ed_list(ohci, le32_to_cpu(hcca.intr[n]));
     }
 
-    /* Cancel all pending packets if either of the lists has been disabled.  */
+    /* Cancel all pending packets if either of the lists has been disabled. */
     if (ohci->old_ctl & (~ohci->ctl) & (OHCI_CTL_BLE | OHCI_CTL_CLE)) {
         ohci_stop_endpoints(ohci);
     }
@@ -1234,18 +1240,17 @@ static void ohci_frame_boundary(void *opaque)
     }
 }
 
-/* Start sending SOF tokens across the USB bus, lists are processed in
+/*
+ * Start sending SOF tokens across the USB bus, lists are processed in
  * next frame
  */
 static int ohci_bus_start(OHCIState *ohci)
 {
     trace_usb_ohci_start(ohci->name);
-
-    /* Delay the first SOF event by one frame time as
-     * linux driver is not ready to receive it and
-     * can meet some race conditions
+    /*
+     * Delay the first SOF event by one frame time as linux driver is
+     * not ready to receive it and can meet some race conditions
      */
-
     ohci->sof_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     ohci_eof_timer(ohci);
 
@@ -1259,9 +1264,9 @@ void ohci_bus_stop(OHCIState *ohci)
     timer_del(ohci->eof_timer);
 }
 
-/* Sets a flag in a port status register but only set it if the port is
- * connected, if not set ConnectStatusChange flag. If flag is enabled
- * return 1.
+/*
+ * Sets a flag in a port status reg but only set it if the port is connected.
+ * If not set ConnectStatusChange flag. If flag is enabled return 1.
  */
 static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
 {
@@ -1271,9 +1276,7 @@ static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
     if (val == 0)
         return 0;
 
-    /* If CurrentConnectStatus is cleared we set
-     * ConnectStatusChange
-     */
+    /* If CurrentConnectStatus is cleared we set ConnectStatusChange */
     if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
         ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
         if (ohci->rhstatus & OHCI_RHS_DRWE) {
@@ -1291,7 +1294,7 @@ static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
     return ret;
 }
 
-/* Set the frame interval - frame interval toggle is manipulated by the hcd only */
+/* Frame interval toggle is manipulated by the hcd only */
 static void ohci_set_frame_interval(OHCIState *ohci, uint16_t val)
 {
     val &= OHCI_FMI_FI;
@@ -1357,9 +1360,7 @@ static uint32_t ohci_get_frame_remaining(OHCIState *ohci)
     if ((ohci->ctl & OHCI_CTL_HCFS) != OHCI_USB_OPERATIONAL)
         return (ohci->frt << 31);
 
-    /* Being in USB operational state guarnatees sof_time was
-     * set already.
-     */
+    /* Being in USB operational state guarnatees sof_time was set already. */
     tks = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ohci->sof_time;
     if (tks < 0) {
         tks = 0;
@@ -1439,13 +1440,11 @@ static void ohci_port_set_status(OHCIState *ohci, int portnum, uint32_t val)
         trace_usb_ohci_port_reset(portnum);
         usb_device_reset(port->port.dev);
         port->ctrl &= ~OHCI_PORT_PRS;
-        /* ??? Should this also set OHCI_PORT_PESC.  */
+        /* ??? Should this also set OHCI_PORT_PESC. */
         port->ctrl |= OHCI_PORT_PES | OHCI_PORT_PRSC;
     }
 
-    /* Invert order here to ensure in ambiguous case, device is
-     * powered up...
-     */
+    /* Invert order here to ensure in ambiguous case, device is powered up. */
     if (val & OHCI_PORT_LSDA)
         ohci_port_power(ohci, portnum, 0);
     if (val & OHCI_PORT_PPS)
@@ -1892,7 +1891,7 @@ void usb_ohci_init(OHCIState *ohci, DeviceState *dev, uint32_t num_ports,
                                    ohci_frame_boundary, ohci);
 }
 
-/**
+/*
  * A typical OHCI will stop operating and set itself into error state
  * (which can be queried by MMIO) to signal that it got an error.
  */
-- 
2.30.7


