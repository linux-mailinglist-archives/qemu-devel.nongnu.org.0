Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8C43F8CD8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:21:04 +0200 (CEST)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ3n-00007T-LR
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn9-0006JF-3o
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn7-0000FZ-9w
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:50 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u16so6174657wrn.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lAG2XJj76uSmzjh6rQO87dFXjpLvArf7j+9z5Kl9NHo=;
 b=fpp5uiHbBz/u/idCinI1YxoJgFDnDrxmJnCV3QvLUctR7aGkhEzfz7yNFGlyiLBISh
 FWOca3Cb8NbR9guI91Js2GVlIoESpdjLi2QA7i5++QK2sQ5qsZlUPkBG0dNc7DvYyh/W
 zq/7mK+Qu8eJiUa0pCATi+XknnAVBvTCY0jyRMnV+R09hqbr/B2Jurnv0T4pyHgtXlmS
 BVz26ssBt7lnApBI+nD+SbdI0TOsAcAd7ySqsvKZX9diZWAmlS85W1fXrQgCClcNXM1G
 UZ7JJnP1D+cXI2nJpRjyxiToFbWzACKxPuqIq0U3kW3AsMgznlYFEmCIwSq+33VpFzm6
 b0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lAG2XJj76uSmzjh6rQO87dFXjpLvArf7j+9z5Kl9NHo=;
 b=VIsmBpLUTiwGOOVRW+H5aZOjwVANzXMGDL4yM+Gwm8VhMwVOBA64vruvjfUW63X/tU
 LOwE9Rukc1y/QI30W0wH78ZUCtR+XX69FOh8/trVLSjJqJM9zC6jjyUrtU+/4+RsDvEd
 vHJ7xmTFe5XkKprWswCU6g527RlFjYs36iI6jKvNY4lfVW7I8xEidsABpXhUqWzLCglJ
 RvTtcpuf33xrbN67wTeNhWCCE45FkrGxsKrIq5zKNHybI6hErYOevUShSJx2fhELRVmj
 xscQA8v4aYtgtqhmT6rbX2vsMwI+uBvmWx6KoLZsTk17BpEdfNIBFlGmoMnYD2GX08j3
 jM1A==
X-Gm-Message-State: AOAM532N298MasKT2J8lAqeDpe086/h79XTJ9dvi0N8uzFE8+1Q1NfH4
 CFo11lvw2nwxu5tOa7GltHmb06y5Q9SYaA==
X-Google-Smtp-Source: ABdhPJy28dboOJLtTljsov52tk8SJliJ3lhloJ5opv0wZVdJZTzbjLX81egDdIUQSaFnYMoMPwAWtQ==
X-Received: by 2002:adf:e107:: with SMTP id t7mr5258990wrz.165.1629997427468; 
 Thu, 26 Aug 2021 10:03:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/37] hw/arm/xlnx-zynqmp: Add unimplemented APU mmio
Date: Thu, 26 Aug 2021 18:03:07 +0100
Message-Id: <20210826170307.27733-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Tong Ho <tong.ho@xilinx.com>

Add unimplemented APU mmio region to xlnx-zynqmp for booting
bare-metal guests built with standalone bsp, which access the
region from one of the following places:
  https://github.com/Xilinx/embeddedsw/blob/release-2020.2/lib/bsp/standalone/src/arm/ARMv8/64bit/armclang/boot.S#L139
  https://github.com/Xilinx/embeddedsw/blob/release-2020.2/lib/bsp/standalone/src/arm/ARMv8/64bit/gcc/boot.S#L183

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Tong Ho <tong.ho@xilinx.com>
Message-id: 20210823173818.201259-3-tong.ho@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h |  7 +++++++
 hw/arm/xlnx-zynqmp.c         | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index d3e2ef97f67..c84fe15996e 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -79,6 +79,11 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
                                   XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
 
+/*
+ * Unimplemented mmio regions needed to boot some images.
+ */
+#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
+
 struct XlnxZynqMPState {
     /*< private >*/
     DeviceState parent_obj;
@@ -96,6 +101,8 @@ struct XlnxZynqMPState {
     MemoryRegion *ddr_ram;
     MemoryRegion ddr_ram_low, ddr_ram_high;
 
+    MemoryRegion mr_unimp[XLNX_ZYNQMP_NUM_UNIMP_AREAS];
+
     CadenceGEMState gem[XLNX_ZYNQMP_NUM_GEMS];
     CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
     XlnxZynqMPCANState can[XLNX_ZYNQMP_NUM_CAN];
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 6cfce26210d..4e5a471e30b 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -20,6 +20,7 @@
 #include "qemu/module.h"
 #include "hw/arm/xlnx-zynqmp.h"
 #include "hw/intc/arm_gic_common.h"
+#include "hw/misc/unimp.h"
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
@@ -56,6 +57,9 @@
 #define DPDMA_ADDR          0xfd4c0000
 #define DPDMA_IRQ           116
 
+#define APU_ADDR            0xfd5c0000
+#define APU_SIZE            0x100
+
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
 
@@ -222,6 +226,32 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
     qdev_realize(DEVICE(&s->rpu_cluster), NULL, &error_fatal);
 }
 
+static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
+{
+    static const struct UnimpInfo {
+        const char *name;
+        hwaddr base;
+        hwaddr size;
+    } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
+        { .name = "apu", APU_ADDR, APU_SIZE },
+    };
+    unsigned int nr;
+
+    for (nr = 0; nr < ARRAY_SIZE(unimp_areas); nr++) {
+        const struct UnimpInfo *info = &unimp_areas[nr];
+        DeviceState *dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
+        SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+        assert(info->name && info->base && info->size > 0);
+        qdev_prop_set_string(dev, "name", info->name);
+        qdev_prop_set_uint64(dev, "size", info->size);
+        object_property_add_child(OBJECT(s), info->name, OBJECT(dev));
+
+        sysbus_realize_and_unref(sbd, &error_fatal);
+        sysbus_mmio_map(sbd, 0, info->base);
+    }
+}
+
 static void xlnx_zynqmp_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -596,6 +626,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, RTC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
 
+    xlnx_zynqmp_create_unimp_mmio(s);
+
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
         if (!object_property_set_uint(OBJECT(&s->gdma[i]), "bus-width", 128,
                                       errp)) {
-- 
2.20.1


