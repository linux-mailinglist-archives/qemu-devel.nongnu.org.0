Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8126A448D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:36:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeBW-0003hO-FD; Mon, 27 Feb 2023 09:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBJ-0003Kx-I1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:47 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBH-0000RN-2P
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:45 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v16so3558519wrn.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/4kgSE2+HxM+MyjPD9/wKQdYRNr954dTXEePh8cVcfc=;
 b=L6n1DOx7pALKiVXYUoeDPStjd51rc+v0eSD3CWjx1DTmOhqhH14RsfSIrP92Iw5AC6
 QzZGIxyU35vuCr7jYsGlKSB1cEb097HRtKCVt4uKhnioDXGG5Orvnd6fnbPc7MVA7dU0
 lEbeBSqaO8jm7SLJCAEKS+JkdYB3NXkw4eMEhc2Z8naGUvitVhHChKXPUdmBahpROo2f
 CDcPkU0A2NEWSavukFq8fvwzMCayCPA/cIn6PkiRFz+FUpg+sKiLvwldJcRhaYS8F9CG
 mKNPv/znqHe1V6DZGLfwGpaIxJsteb8e5hcfQxQBjmU04vCrvegvwhTIqLHv3AoFe7px
 eOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/4kgSE2+HxM+MyjPD9/wKQdYRNr954dTXEePh8cVcfc=;
 b=4ABbjP6hPExkDNW34QrpYMPfoFGt1kDgD2d6gvNzafFh7paJAUAtl5m6Dt2ZIoqtyL
 fg/DEqhrF99CU8eVOtMcuz5Tf3yS/ohK7n5MEItsBRbSt+pU5iAAMSi9OdwRY3SBHu3k
 nUkbGrC2uHuV9l4cr9J+mD0DCxMFWM9RUL8Jj8YwVjg9Nh2mDMW5b8z0FZ5ieWHEBzEl
 7T2YehBVOuaTFYT+zRaCJm8BiG5vUjkjbr2rEImA6xtexgFnmlSvy0DcFrJU2QLth1/S
 sBmH2P/bBDt1WLg0E08SlIWYsEPK7bQn6Dl9wLUAaLvvwk1q82FS4C9Ljn5Kj/eH7l4D
 i6Bg==
X-Gm-Message-State: AO0yUKVKGqyrSaRYMNdTn2bzXO1UaRYCsswnn5eq67wstPychmFaKkGk
 4WjZOqIFY5S12qHgBwInlQ5qFtDy2qzLi1Fv
X-Google-Smtp-Source: AK7set+fSdcHbgM5Qai0jTV5aqkeTWd+Jpprmxm506go4Q4rx4yr8NtQ932uSPoBtGCAuHczpDsDNw==
X-Received: by 2002:a5d:42c4:0:b0:2c7:1c44:5aae with SMTP id
 t4-20020a5d42c4000000b002c71c445aaemr9468120wrr.12.1677506920085; 
 Mon, 27 Feb 2023 06:08:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adfdec2000000b002c71dd1109fsm7170449wrn.47.2023.02.27.06.08.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:08:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 080/126] hw/usb/ohci: Code style fix white space errors
Date: Mon, 27 Feb 2023 15:01:27 +0100
Message-Id: <20230227140213.35084-71-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <c9b99b3555dcd03194a8950b810f5e1b4b4bd5d3.1676916640.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci.c | 154 +++++++++++++++++++++++-----------------------
 1 file changed, 76 insertions(+), 78 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 93fc592161..9d6bb8312e 100644
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
+#define OHCI_CTL_IR           (1 << 8)
+#define OHCI_CTL_RWC          (1 << 9)
+#define OHCI_CTL_RWE          (1 << 10)
 
-#define OHCI_STATUS_HCR       (1<<0)
-#define OHCI_STATUS_CLF       (1<<1)
-#define OHCI_STATUS_BLF       (1<<2)
-#define OHCI_STATUS_OCR       (1<<3)
-#define OHCI_STATUS_SOC       ((1<<6)|(1<<7))
+#define OHCI_STATUS_HCR       (1 << 0)
+#define OHCI_STATUS_CLF       (1 << 1)
+#define OHCI_STATUS_BLF       (1 << 2)
+#define OHCI_STATUS_OCR       (1 << 3)
+#define OHCI_STATUS_SOC       ((1 << 6) | (1 << 7))
 
-#define OHCI_INTR_SO          (1U<<0) /* Scheduling overrun */
-#define OHCI_INTR_WD          (1U<<1) /* HcDoneHead writeback */
-#define OHCI_INTR_SF          (1U<<2) /* Start of frame */
-#define OHCI_INTR_RD          (1U<<3) /* Resume detect */
-#define OHCI_INTR_UE          (1U<<4) /* Unrecoverable error */
-#define OHCI_INTR_FNO         (1U<<5) /* Frame number overflow */
-#define OHCI_INTR_RHSC        (1U<<6) /* Root hub status change */
-#define OHCI_INTR_OC          (1U<<30) /* Ownership change */
-#define OHCI_INTR_MIE         (1U<<31) /* Master Interrupt Enable */
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
+#define OHCI_RHS_LPS          (1U << 0)
+#define OHCI_RHS_OCI          (1U << 1)
+#define OHCI_RHS_DRWE         (1U << 15)
+#define OHCI_RHS_LPSC         (1U << 16)
+#define OHCI_RHS_OCIC         (1U << 17)
+#define OHCI_RHS_CRWE         (1U << 31)
 
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
-- 
2.38.1


