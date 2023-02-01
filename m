Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D616836B3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 20:39:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMwSt-0006sl-EI; Tue, 31 Jan 2023 14:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMwSq-0006rb-H8
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:38:44 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMwSn-0003Ih-Rb
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:38:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 38400746335;
 Tue, 31 Jan 2023 20:36:13 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F2A67745712; Tue, 31 Jan 2023 20:36:12 +0100 (CET)
Message-Id: <42bcdf2e60211557ec44f11a45d6b465654693b4.1675193329.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1675193329.git.balaton@eik.bme.hu>
References: <cover.1675193329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/6] usb/ohci: Code style fix white space errors
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Date: Tue, 31 Jan 2023 20:36:12 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
---
 hw/usb/hcd-ohci.c | 162 +++++++++++++++++++++++-----------------------
 1 file changed, 80 insertions(+), 82 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 9f138e7f25..b2a2de7964 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -60,46 +60,46 @@ struct ohci_hcca {
 
 /* Bitfields for the first word of an Endpoint Desciptor. */
 #define OHCI_ED_FA_SHIFT  0
-#define OHCI_ED_FA_MASK   (0x7f<<OHCI_ED_FA_SHIFT)
+#define OHCI_ED_FA_MASK   (0x7f << OHCI_ED_FA_SHIFT)
 #define OHCI_ED_EN_SHIFT  7
-#define OHCI_ED_EN_MASK   (0xf<<OHCI_ED_EN_SHIFT)
+#define OHCI_ED_EN_MASK   (0xf << OHCI_ED_EN_SHIFT)
 #define OHCI_ED_D_SHIFT   11
-#define OHCI_ED_D_MASK    (3<<OHCI_ED_D_SHIFT)
-#define OHCI_ED_S         (1<<13)
-#define OHCI_ED_K         (1<<14)
-#define OHCI_ED_F         (1<<15)
+#define OHCI_ED_D_MASK    (3 << OHCI_ED_D_SHIFT)
+#define OHCI_ED_S         (1 << 13)
+#define OHCI_ED_K         (1 << 14)
+#define OHCI_ED_F         (1 << 15)
 #define OHCI_ED_MPS_SHIFT 16
-#define OHCI_ED_MPS_MASK  (0x7ff<<OHCI_ED_MPS_SHIFT)
+#define OHCI_ED_MPS_MASK  (0x7ff << OHCI_ED_MPS_SHIFT)
 
 /* Flags in the head field of an Endpoint Desciptor. */
 #define OHCI_ED_H         1
 #define OHCI_ED_C         2
 
 /* Bitfields for the first word of a Transfer Desciptor. */
-#define OHCI_TD_R         (1<<18)
+#define OHCI_TD_R         (1 << 18)
 #define OHCI_TD_DP_SHIFT  19
-#define OHCI_TD_DP_MASK   (3<<OHCI_TD_DP_SHIFT)
+#define OHCI_TD_DP_MASK   (3 << OHCI_TD_DP_SHIFT)
 #define OHCI_TD_DI_SHIFT  21
-#define OHCI_TD_DI_MASK   (7<<OHCI_TD_DI_SHIFT)
-#define OHCI_TD_T0        (1<<24)
-#define OHCI_TD_T1        (1<<25)
+#define OHCI_TD_DI_MASK   (7 << OHCI_TD_DI_SHIFT)
+#define OHCI_TD_T0        (1 << 24)
+#define OHCI_TD_T1        (1 << 25)
 #define OHCI_TD_EC_SHIFT  26
-#define OHCI_TD_EC_MASK   (3<<OHCI_TD_EC_SHIFT)
+#define OHCI_TD_EC_MASK   (3 << OHCI_TD_EC_SHIFT)
 #define OHCI_TD_CC_SHIFT  28
-#define OHCI_TD_CC_MASK   (0xf<<OHCI_TD_CC_SHIFT)
+#define OHCI_TD_CC_MASK   (0xf << OHCI_TD_CC_SHIFT)
 
 /* Bitfields for the first word of an Isochronous Transfer Desciptor. */
 /* CC & DI - same as in the General Transfer Desciptor */
 #define OHCI_TD_SF_SHIFT  0
-#define OHCI_TD_SF_MASK   (0xffff<<OHCI_TD_SF_SHIFT)
+#define OHCI_TD_SF_MASK   (0xffff << OHCI_TD_SF_SHIFT)
 #define OHCI_TD_FC_SHIFT  24
-#define OHCI_TD_FC_MASK   (7<<OHCI_TD_FC_SHIFT)
+#define OHCI_TD_FC_MASK   (7 << OHCI_TD_FC_SHIFT)
 
 /* Isochronous Transfer Desciptor - Offset / PacketStatusWord */
 #define OHCI_TD_PSW_CC_SHIFT 12
-#define OHCI_TD_PSW_CC_MASK  (0xf<<OHCI_TD_PSW_CC_SHIFT)
+#define OHCI_TD_PSW_CC_MASK  (0xf << OHCI_TD_PSW_CC_SHIFT)
 #define OHCI_TD_PSW_SIZE_SHIFT 0
-#define OHCI_TD_PSW_SIZE_MASK  (0xfff<<OHCI_TD_PSW_SIZE_SHIFT)
+#define OHCI_TD_PSW_SIZE_MASK  (0xfff << OHCI_TD_PSW_SIZE_SHIFT)
 
 #define OHCI_PAGE_MASK    0xfffff000
 #define OHCI_OFFSET_MASK  0xfff
@@ -112,7 +112,7 @@ struct ohci_hcca {
 #define OHCI_SET_BM(val, field, newval) do { \
     val &= ~OHCI_##field##_MASK; \
     val |= ((newval) << OHCI_##field##_SHIFT) & OHCI_##field##_MASK; \
-    } while(0)
+    } while (0)
 
 /* endpoint descriptor */
 struct ohci_ed {
@@ -142,35 +142,35 @@ struct ohci_iso_td {
 #define USB_HZ                      12000000
 
 /* OHCI Local stuff */
-#define OHCI_CTL_CBSR         ((1<<0)|(1<<1))
-#define OHCI_CTL_PLE          (1<<2)
-#define OHCI_CTL_IE           (1<<3)
-#define OHCI_CTL_CLE          (1<<4)
-#define OHCI_CTL_BLE          (1<<5)
-#define OHCI_CTL_HCFS         ((1<<6)|(1<<7))
+#define OHCI_CTL_CBSR         ((1 << 0) | (1 << 1))
+#define OHCI_CTL_PLE          (1 << 2)
+#define OHCI_CTL_IE           (1 << 3)
+#define OHCI_CTL_CLE          (1 << 4)
+#define OHCI_CTL_BLE          (1 << 5)
+#define OHCI_CTL_HCFS         ((1 << 6) | (1 << 7))
 #define  OHCI_USB_RESET       0x00
 #define  OHCI_USB_RESUME      0x40
 #define  OHCI_USB_OPERATIONAL 0x80
 #define  OHCI_USB_SUSPEND     0xc0
-#define OHCI_CTL_IR           (1<<8)
-#define OHCI_CTL_RWC          (1<<9)
-#define OHCI_CTL_RWE          (1<<10)
-
-#define OHCI_STATUS_HCR       (1<<0)
-#define OHCI_STATUS_CLF       (1<<1)
-#define OHCI_STATUS_BLF       (1<<2)
-#define OHCI_STATUS_OCR       (1<<3)
-#define OHCI_STATUS_SOC       ((1<<6)|(1<<7))
-
-#define OHCI_INTR_SO          (1U<<0) /* Scheduling overrun */
-#define OHCI_INTR_WD          (1U<<1) /* HcDoneHead writeback */
-#define OHCI_INTR_SF          (1U<<2) /* Start of frame */
-#define OHCI_INTR_RD          (1U<<3) /* Resume detect */
-#define OHCI_INTR_UE          (1U<<4) /* Unrecoverable error */
-#define OHCI_INTR_FNO         (1U<<5) /* Frame number overflow */
-#define OHCI_INTR_RHSC        (1U<<6) /* Root hub status change */
-#define OHCI_INTR_OC          (1U<<30) /* Ownership change */
-#define OHCI_INTR_MIE         (1U<<31) /* Master Interrupt Enable */
+#define OHCI_CTL_IR           (1 << 8)
+#define OHCI_CTL_RWC          (1 << 9)
+#define OHCI_CTL_RWE          (1 << 10)
+
+#define OHCI_STATUS_HCR       (1 << 0)
+#define OHCI_STATUS_CLF       (1 << 1)
+#define OHCI_STATUS_BLF       (1 << 2)
+#define OHCI_STATUS_OCR       (1 << 3)
+#define OHCI_STATUS_SOC       ((1 << 6) | (1 << 7))
+
+#define OHCI_INTR_SO          (1U << 0) /* Scheduling overrun */
+#define OHCI_INTR_WD          (1U << 1) /* HcDoneHead writeback */
+#define OHCI_INTR_SF          (1U << 2) /* Start of frame */
+#define OHCI_INTR_RD          (1U << 3) /* Resume detect */
+#define OHCI_INTR_UE          (1U << 4) /* Unrecoverable error */
+#define OHCI_INTR_FNO         (1U << 5) /* Frame number overflow */
+#define OHCI_INTR_RHSC        (1U << 6) /* Root hub status change */
+#define OHCI_INTR_OC          (1U << 30) /* Ownership change */
+#define OHCI_INTR_MIE         (1U << 31) /* Master Interrupt Enable */
 
 #define OHCI_HCCA_SIZE        0x100
 #define OHCI_HCCA_MASK        0xffffff00
@@ -181,40 +181,40 @@ struct ohci_iso_td {
 #define OHCI_FMI_FSMPS        0xffff0000
 #define OHCI_FMI_FIT          0x80000000
 
-#define OHCI_FR_RT            (1U<<31)
+#define OHCI_FR_RT            (1U << 31)
 
 #define OHCI_LS_THRESH        0x628
 
 #define OHCI_RHA_RW_MASK      0x00000000 /* Mask of supported features.  */
-#define OHCI_RHA_PSM          (1<<8)
-#define OHCI_RHA_NPS          (1<<9)
-#define OHCI_RHA_DT           (1<<10)
-#define OHCI_RHA_OCPM         (1<<11)
-#define OHCI_RHA_NOCP         (1<<12)
+#define OHCI_RHA_PSM          (1 << 8)
+#define OHCI_RHA_NPS          (1 << 9)
+#define OHCI_RHA_DT           (1 << 10)
+#define OHCI_RHA_OCPM         (1 << 11)
+#define OHCI_RHA_NOCP         (1 << 12)
 #define OHCI_RHA_POTPGT_MASK  0xff000000
 
-#define OHCI_RHS_LPS          (1U<<0)
-#define OHCI_RHS_OCI          (1U<<1)
-#define OHCI_RHS_DRWE         (1U<<15)
-#define OHCI_RHS_LPSC         (1U<<16)
-#define OHCI_RHS_OCIC         (1U<<17)
-#define OHCI_RHS_CRWE         (1U<<31)
-
-#define OHCI_PORT_CCS         (1<<0)
-#define OHCI_PORT_PES         (1<<1)
-#define OHCI_PORT_PSS         (1<<2)
-#define OHCI_PORT_POCI        (1<<3)
-#define OHCI_PORT_PRS         (1<<4)
-#define OHCI_PORT_PPS         (1<<8)
-#define OHCI_PORT_LSDA        (1<<9)
-#define OHCI_PORT_CSC         (1<<16)
-#define OHCI_PORT_PESC        (1<<17)
-#define OHCI_PORT_PSSC        (1<<18)
-#define OHCI_PORT_OCIC        (1<<19)
-#define OHCI_PORT_PRSC        (1<<20)
-#define OHCI_PORT_WTC         (OHCI_PORT_CSC|OHCI_PORT_PESC|OHCI_PORT_PSSC \
-                               |OHCI_PORT_OCIC|OHCI_PORT_PRSC)
-
+#define OHCI_RHS_LPS          (1U << 0)
+#define OHCI_RHS_OCI          (1U << 1)
+#define OHCI_RHS_DRWE         (1U << 15)
+#define OHCI_RHS_LPSC         (1U << 16)
+#define OHCI_RHS_OCIC         (1U << 17)
+#define OHCI_RHS_CRWE         (1U << 31)
+
+#define OHCI_PORT_CCS         (1 << 0)
+#define OHCI_PORT_PES         (1 << 1)
+#define OHCI_PORT_PSS         (1 << 2)
+#define OHCI_PORT_POCI        (1 << 3)
+#define OHCI_PORT_PRS         (1 << 4)
+#define OHCI_PORT_PPS         (1 << 8)
+#define OHCI_PORT_LSDA        (1 << 9)
+#define OHCI_PORT_CSC         (1 << 16)
+#define OHCI_PORT_PESC        (1 << 17)
+#define OHCI_PORT_PSSC        (1 << 18)
+#define OHCI_PORT_OCIC        (1 << 19)
+#define OHCI_PORT_PRSC        (1 << 20)
+#define OHCI_PORT_WTC         (OHCI_PORT_CSC | OHCI_PORT_PESC | \
+                               OHCI_PORT_PSSC | OHCI_PORT_OCIC | \
+                               OHCI_PORT_PRSC)
 #define OHCI_TD_DIR_SETUP     0x0
 #define OHCI_TD_DIR_OUT       0x1
 #define OHCI_TD_DIR_IN        0x2
@@ -584,7 +584,7 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
 
     starting_frame = OHCI_BM(iso_td.flags, TD_SF);
     frame_count = OHCI_BM(iso_td.flags, TD_FC);
-    relative_frame_number = USUB(ohci->frame_number, starting_frame); 
+    relative_frame_number = USUB(ohci->frame_number, starting_frame);
 
     trace_usb_ohci_iso_td_head(
            ed->head & OHCI_DPTR_MASK, ed->tail & OHCI_DPTR_MASK,
@@ -657,8 +657,8 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
         next_offset = iso_td.be;
     }
 
-    if (!(OHCI_BM(start_offset, TD_PSW_CC) & 0xe) || 
-        ((relative_frame_number < frame_count) && 
+    if (!(OHCI_BM(start_offset, TD_PSW_CC) & 0xe) ||
+        ((relative_frame_number < frame_count) &&
          !(OHCI_BM(next_offset, TD_PSW_CC) & 0xe))) {
         trace_usb_ohci_iso_td_bad_cc_not_accessed(start_offset, next_offset);
         return 1;
@@ -1118,7 +1118,7 @@ static int ohci_service_ed_list(OHCIState *ohci, uint32_t head)
                     ed.tail & OHCI_DPTR_MASK, ed.next & OHCI_DPTR_MASK);
             trace_usb_ohci_ed_pkt_flags(
                     OHCI_BM(ed.flags, ED_FA), OHCI_BM(ed.flags, ED_EN),
-                    OHCI_BM(ed.flags, ED_D), (ed.flags & OHCI_ED_S)!= 0,
+                    OHCI_BM(ed.flags, ED_D), (ed.flags & OHCI_ED_S) != 0,
                     (ed.flags & OHCI_ED_K) != 0, (ed.flags & OHCI_ED_F) != 0,
                     OHCI_BM(ed.flags, ED_MPS));
 
@@ -1311,10 +1311,8 @@ static void ohci_port_power(OHCIState *ohci, int i, int p)
     if (p) {
         ohci->rhport[i].ctrl |= OHCI_PORT_PPS;
     } else {
-        ohci->rhport[i].ctrl &= ~(OHCI_PORT_PPS|
-                    OHCI_PORT_CCS|
-                    OHCI_PORT_PSS|
-                    OHCI_PORT_PRS);
+        ohci->rhport[i].ctrl &= ~(OHCI_PORT_PPS | OHCI_PORT_CCS |
+                                  OHCI_PORT_PSS | OHCI_PORT_PRS);
     }
 }
 
@@ -1858,7 +1856,7 @@ void usb_ohci_init(OHCIState *ohci, DeviceState *dev, uint32_t num_ports,
     ohci->num_ports = num_ports;
     if (masterbus) {
         USBPort *ports[OHCI_MAX_PORTS];
-        for(i = 0; i < num_ports; i++) {
+        for (i = 0; i < num_ports; i++) {
             ports[i] = &ohci->rhport[i].port;
         }
         usb_register_companion(masterbus, ports, num_ports,
@@ -1997,7 +1995,7 @@ const VMStateDescription vmstate_ohci_state = {
         VMSTATE_BOOL(async_complete, OHCIState),
         VMSTATE_END_OF_LIST()
     },
-    .subsections = (const VMStateDescription*[]) {
+    .subsections = (const VMStateDescription * []) {
         &vmstate_ohci_eof_timer,
         NULL
     }
-- 
2.30.6


