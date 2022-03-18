Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BC34DDAA6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:37:00 +0100 (CET)
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCmp-0003EV-RQ
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:36:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZm-0006w2-By
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:30 -0400
Received: from [2a00:1450:4864:20::432] (port=45983
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZk-0002DM-Nd
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:30 -0400
Received: by mail-wr1-x432.google.com with SMTP id p9so11694447wra.12
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HLJWVvq9CCKmxGDjWnVnU7AY6BAVBA1hCTJywpbZHwM=;
 b=UBVYksNgR3PMz3fawOf0gvcbMRIrZrrylzHREWsfJFQLSK5HJ1H2UQLuElJdbkltWo
 g7CsofrjmXQV1UAaIosXCULEHk+kJgGpvtkIUcSzPHGiCf75r6g2SksqhDwg8u3nl5pV
 vyU59dYsJ9G8bzlxNr6jdfTsBV8O/sqrh+OYKND/bi4dsC4XCRx5b0WhV/06uhrXpogh
 ESc1Pkzw+NEe0nCqfpgJ//5yqtLcTgAXiqEbjw8yY1N2lpYrAJL/wG39KDnyd0NXEeyP
 w73soOUGeEVJGQi+wRsArRq9t63IhqCTij6OYaBJH3qZQP1O4B2FVgFUOaIXp4/JuVdj
 bFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HLJWVvq9CCKmxGDjWnVnU7AY6BAVBA1hCTJywpbZHwM=;
 b=Hr4sIpJWvaEzSerrv8twXD5ECnQkrznVuYcNoLfl4LP8tkuWm+/liVYEowGCrZkr/T
 6+r6cRcEyD8Xk6aivHycvZTyvwJwSP5QrmgPn2dvvyDnIjbvEvsC7PX0iG8go2jnO8tR
 Nrswk0aX81vSkwjoaOVVShD/UOpApF3csQiBHMtYHnHmMKKQkSH5fo2FpajfVPrQR9FH
 ew1eH6ZniMs4fvNTwE68BW99RnU5Kg3QapcXS2mn//gk4Tjbz75p9pZtAPtO8+u8OCUz
 I3YbT8JsZxoW7al6ll01B+AfvmU6EyLmHx9KQ35vSkZ53EJHh0Ie9tG1nmuehq24YTjx
 apAA==
X-Gm-Message-State: AOAM533k5ICnkT7kgw/w19ACIqRZGZYio47/O1MrvMYfKhRFzDFq7ley
 VIwv2SzmaBfjACXf/N3KXBIUclu7SXzmeQ==
X-Google-Smtp-Source: ABdhPJyTnDyMUHWioZ2i1j7YNrkql9+2mDhls+/lzs5QG4vU3uxh/umm+tDrP1HZYeM48yzgF21L/w==
X-Received: by 2002:a5d:4245:0:b0:203:dc49:2604 with SMTP id
 s5-20020a5d4245000000b00203dc492604mr8259811wrr.32.1647609807367; 
 Fri, 18 Mar 2022 06:23:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control
Date: Fri, 18 Mar 2022 13:23:03 +0000
Message-Id: <20220318132306.3254960-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Connect the ZynqMP APU Control device.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20220316164645.2303510-7-edgar.iglesias@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h |  4 +++-
 hw/arm/xlnx-zynqmp.c         | 25 +++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 7938f223a4a..9d9a9d0bf9d 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -39,6 +39,7 @@
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-zynqmp-efuse.h"
 #include "hw/or-irq.h"
+#include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
 #include "hw/misc/xlnx-zynqmp-crf.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
@@ -86,7 +87,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 /*
  * Unimplemented mmio regions needed to boot some images.
  */
-#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 2
+#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
 
 struct XlnxZynqMPState {
     /*< private >*/
@@ -125,6 +126,7 @@ struct XlnxZynqMPState {
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
     XlnxCSUDMA qspi_dma;
     qemu_or_irq qspi_irq_orgate;
+    XlnxZynqMPAPUCtrl apu_ctrl;
     XlnxZynqMPCRF crf;
 
     char *boot_cpu;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index f4575eea7fa..5bfe285a191 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -66,7 +66,7 @@
 #define DPDMA_IRQ           116
 
 #define APU_ADDR            0xfd5c0000
-#define APU_SIZE            0x100
+#define APU_IRQ             153
 
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
@@ -283,6 +283,27 @@ static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
     sysbus_connect_irq(sbd, 0, gic[EFUSE_IRQ]);
 }
 
+static void xlnx_zynqmp_create_apu_ctrl(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    SysBusDevice *sbd;
+    int i;
+
+    object_initialize_child(OBJECT(s), "apu-ctrl", &s->apu_ctrl,
+                            TYPE_XLNX_ZYNQMP_APU_CTRL);
+    sbd = SYS_BUS_DEVICE(&s->apu_ctrl);
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
+        g_autofree gchar *name = g_strdup_printf("cpu%d", i);
+
+        object_property_set_link(OBJECT(&s->apu_ctrl), name,
+                                 OBJECT(&s->apu_cpu[i]), &error_abort);
+    }
+
+    sysbus_realize(sbd, &error_fatal);
+    sysbus_mmio_map(sbd, 0, APU_ADDR);
+    sysbus_connect_irq(sbd, 0, gic[APU_IRQ]);
+}
+
 static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
 {
     SysBusDevice *sbd;
@@ -302,7 +323,6 @@ static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
         hwaddr base;
         hwaddr size;
     } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
-        { .name = "apu", APU_ADDR, APU_SIZE },
         { .name = "serdes", SERDES_ADDR, SERDES_SIZE },
     };
     unsigned int nr;
@@ -699,6 +719,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
     xlnx_zynqmp_create_efuse(s, gic_spi);
+    xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
     xlnx_zynqmp_create_crf(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
-- 
2.25.1


