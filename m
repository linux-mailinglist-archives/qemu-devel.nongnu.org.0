Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB75F0CB3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:47:18 +0200 (CEST)
Received: from localhost ([::1]:47818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGMH-0005dK-9l
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAn-0000Bi-Mo
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAi-0006UR-9U
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id n10so6873169wrw.12
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=N8vtTQ3zUp3DG5L43ho2EWTv6EglyCyi6wXcYwDvg7k=;
 b=HqTz1bK8LmMkNYcls62PQCWGNuVOdKneH1qEBlLcHcHzlcd95H+WlL4MFBmxL+g+qY
 VAtxCCDZ0bFt15969MJQ+9f+bFkNeSSl2e1x0DJO/bzFSX1MDSbmRtFjLRCd5FQ0Rsw0
 G9Ks6iEBQnuXkH7x0+DOVOPSCZiQqyVMzpih6XDZ1ZwUt0PvrlR44vQysFszs+4mks4g
 eqOPf8IFaxn7cTQ1CIV3dfaKBkZ2Hu4G24p/S8e6MKL3E6Zz0+j5tHDIAnVh5k/N3eA1
 OOrHYq0TdowooFYR/D30qWuk7VBJ37xYd47NNEENfYrs4eryynsBtCvSddQ7Edsr8LxZ
 uNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N8vtTQ3zUp3DG5L43ho2EWTv6EglyCyi6wXcYwDvg7k=;
 b=OS8ZZaZAfM3KQ5Ycp4ixUCgGKe5pIdXP2OXBnBlk/6WsuCPIC1JTHZE8P8m0D9trPs
 ICFPYLykC5y8KTeVN345NjIj/nfGHOz2nARJjohbfOp1adpjwJcNaOixsYCpSyVWeuSp
 sb+7EKs/rctLe7MvW88hVOGcS594XbTENOkdHowChXSE4a9KwRBsSiupKCP/j/lsXGo7
 T2V0EJKFqKm/7WkFFRfjpLe8bFRpSDrtAtmMmBd8Oz5DkFlf+2M0sq7ZBMGiKARzkmaD
 Cvc1lPJVWKZ8A2PjeLGFpwyZSywr4J87ipXvD4W3bsaOYyJ0mn5/YPY8SvTay4Kkjipm
 fEJg==
X-Gm-Message-State: ACrzQf23bgg62vJDtRyzxL15N02k2V4A8I1vL+Kj+XwZUftOV+d5Efsk
 ZX029hvQPSatoaSrDofOILNvJ6PLSLiQEg==
X-Google-Smtp-Source: AMsMyM5HAU9Ob0GzFuWKQouZ5kHXpgs0oGH5tHKQmcTelmvXKYvTypsY1Fy+cgKZOxwVxMrRQlHi3w==
X-Received: by 2002:a5d:5611:0:b0:228:e1d2:81d with SMTP id
 l17-20020a5d5611000000b00228e1d2081dmr5979429wrv.210.1664544918499; 
 Fri, 30 Sep 2022 06:35:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b0021e4829d359sm1982551wrj.39.2022.09.30.06.35.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 06:35:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controllers
Date: Fri, 30 Sep 2022 14:35:06 +0100
Message-Id: <20220930133511.2112734-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930133511.2112734-1-peter.maydell@linaro.org>
References: <20220930133511.2112734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Francisco Iglesias <francisco.iglesias@amd.com>

Connect ZynqMP's USB controllers.

Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220920081517.25401-1-frasse.iglesias@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h |  3 +++
 hw/arm/xlnx-zynqmp.c         | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 85fd9f53daa..20bdf894aa0 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -42,6 +42,7 @@
 #include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
 #include "hw/misc/xlnx-zynqmp-crf.h"
 #include "hw/timer/cadence_ttc.h"
+#include "hw/usb/hcd-dwc3.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -56,6 +57,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 #define XLNX_ZYNQMP_NUM_SPIS 2
 #define XLNX_ZYNQMP_NUM_GDMA_CH 8
 #define XLNX_ZYNQMP_NUM_ADMA_CH 8
+#define XLNX_ZYNQMP_NUM_USB 2
 
 #define XLNX_ZYNQMP_NUM_QSPI_BUS 2
 #define XLNX_ZYNQMP_NUM_QSPI_BUS_CS 2
@@ -132,6 +134,7 @@ struct XlnxZynqMPState {
     XlnxZynqMPAPUCtrl apu_ctrl;
     XlnxZynqMPCRF crf;
     CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
+    USBDWC3 usb[XLNX_ZYNQMP_NUM_USB];
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 383e177a001..335cfc417d7 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -143,6 +143,14 @@ static const int adma_ch_intr[XLNX_ZYNQMP_NUM_ADMA_CH] = {
     77, 78, 79, 80, 81, 82, 83, 84
 };
 
+static const uint64_t usb_addr[XLNX_ZYNQMP_NUM_USB] = {
+    0xFE200000, 0xFE300000
+};
+
+static const int usb_intr[XLNX_ZYNQMP_NUM_USB] = {
+    65, 70
+};
+
 typedef struct XlnxZynqMPGICRegion {
     int region_index;
     uint32_t address;
@@ -428,6 +436,10 @@ static void xlnx_zynqmp_init(Object *obj)
     object_initialize_child(obj, "qspi-dma", &s->qspi_dma, TYPE_XLNX_CSU_DMA);
     object_initialize_child(obj, "qspi-irq-orgate",
                             &s->qspi_irq_orgate, TYPE_OR_IRQ);
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_USB; i++) {
+        object_initialize_child(obj, "usb[*]", &s->usb[i], TYPE_USB_DWC3);
+    }
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -814,6 +826,30 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         object_property_add_alias(OBJECT(s), bus_name,
                                   OBJECT(&s->qspi), target_bus);
     }
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_USB; i++) {
+        if (!object_property_set_link(OBJECT(&s->usb[i].sysbus_xhci), "dma",
+                                      OBJECT(system_memory), errp)) {
+            return;
+        }
+
+        qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "intrs", 4);
+        qdev_prop_set_uint32(DEVICE(&s->usb[i].sysbus_xhci), "slots", 2);
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->usb[i]), errp)) {
+            return;
+        }
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0, usb_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 0,
+                           gic_spi[usb_intr[i]]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 1,
+                           gic_spi[usb_intr[i] + 1]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 2,
+                           gic_spi[usb_intr[i] + 2]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i].sysbus_xhci), 3,
+                           gic_spi[usb_intr[i] + 3]);
+    }
 }
 
 static Property xlnx_zynqmp_props[] = {
-- 
2.25.1


