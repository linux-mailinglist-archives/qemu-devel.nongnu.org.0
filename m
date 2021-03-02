Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F3B329591
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 02:51:31 +0100 (CET)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGuCA-0007k1-F1
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 20:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4s-0002Lt-9C; Mon, 01 Mar 2021 20:43:58 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4e-00023x-UV; Mon, 01 Mar 2021 20:43:58 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 279045C00F8;
 Mon,  1 Mar 2021 20:43:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 01 Mar 2021 20:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 GvVLz9Ew2z/x3kAzwBKi2Krr2lhTc1EirivJxoMp6Yc=; b=ixVZcrRL+h5thZq/
 k661zsX6KZ8Ljj00Ma+cNJwlT9+mJ61hJA5Q0G7T7KtjMBn+Mfk45LPuoTKd15Rz
 3AHVsV0h/0S8rgP5ZyWovfNFEC9XtuY0n29Tve11ah1K90QGh3HE0K7h+KmMgx/2
 rwzwYJRD+Ke4bFwSqpeykRG5kLmfMnsowQEsBfAlNeiwDAjZBYSD2uY1JyjMnKZJ
 7qHhcVF/HdLmc4nlJdu19QmS1p0PKrdRlwLmx72fYTpM84f9A/3Gbm7yDMXWqm9o
 8XVtlWW4JYZzZnHV4RcbcdidAPtKRj+cjUW8EB79NozD5+X8WClgMvIQQs1TcBed
 eOtLIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=GvVLz9Ew2z/x3kAzwBKi2Krr2lhTc1EirivJxoMp6
 Yc=; b=MNe3oSOCd4lqH6xxCRJtcg4o9L22c695ykyo9FlqB9/Fyqf9MvWs1PUDg
 hgy+H142XrFXBtpt3XKFE8A/5oqqMt9AmuaqOfSLGjr7NpqMUU3J0Vc3s5tdKhFd
 7GuNe1NJenzJmxO9HFc4ltRczKNn/DAGkkHR/UiIDK79u9SL09lm91pp0+5iVs0L
 DDoFvVjvhpTZM5S7N3/rbOUNlqEKlLDr2hRz8ARlQ4PqY4tkPKECCggylTRdcQ3r
 adqxKTOpjXOcoIMG2is/asYbtcHeydnq5iCV40Qg6CvH1mStecsB4f+dRJcgiWvO
 qsuSBg9Qr66S6l08I/gOPtCk1KRPg==
X-ME-Sender: <xms:UJg9YHaXACl5LCE1iyav56AH1EsNLFcs-qICgObjsNGsg0nVw5dliA>
 <xme:UJg9YGadEjoE2qmgURlKkF-gLtVo-H3K7I4moxu_VH4aFnUkG6an_FGEtUSBt8VRc
 9jMzFxf-qnYASenyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleelgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesthekre
 dtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnheptefhvdethedtgffgvefftedvkeelvd
 fhvddtjeeukeevvdekjefgtdeifeelgfegnecukfhppedugedrvddrledurdefjeenucev
 lhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:UJg9YJ8Av_iH-GwM0gFelipajuoMVonYXiKYeQrhQ-DsYlog97DXlw>
 <xmx:UJg9YNqJWT2LXv5yoPgKy2XzlKcjheSNOEjifSngGrdyH7H5sGJxjA>
 <xmx:UJg9YCpSNe6BDMUPicim0TQnHQHghEIyFL5FDGoHHjGxt7O5Nm04Mg>
 <xmx:UJg9YPDza09LDvNC5ZA4T34ZNH_RFMqu4hNFqOQTAj4BBFtD25CpBg>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFF3224005A;
 Mon,  1 Mar 2021 20:43:40 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 4/5] hw/misc: Add a basic Aspeed LPC controller model
Date: Tue,  2 Mar 2021 12:13:16 +1030
Message-Id: <20210302014317.915120-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302014317.915120-1-andrew@aj.id.au>
References: <20210302014317.915120-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=andrew@aj.id.au;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, f4bug@amsat.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

This is a very minimal framework to access registers which are used to
configure the AHB memory mapping of the flash chips on the LPC HC
Firmware address space.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 docs/system/arm/aspeed.rst   |   2 +-
 hw/arm/aspeed_ast2600.c      |  10 +++
 hw/arm/aspeed_soc.c          |  10 +++
 hw/misc/aspeed_lpc.c         | 131 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   7 +-
 include/hw/arm/aspeed_soc.h  |   2 +
 include/hw/misc/aspeed_lpc.h |  32 +++++++++
 7 files changed, 192 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/aspeed_lpc.c
 create mode 100644 include/hw/misc/aspeed_lpc.h

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 690bada7842b..2f6fa8938d02 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -48,6 +48,7 @@ Supported devices
  * UART
  * Ethernet controllers
  * Front LEDs (PCA9552 on I2C bus)
+ * LPC Peripheral Controller (a subset of subdevices are supported)
 
 
 Missing devices
@@ -56,7 +57,6 @@ Missing devices
  * Coprocessor support
  * ADC (out of tree implementation)
  * PWM and Fan Controller
- * LPC Bus Controller
  * Slave GPIO Controller
  * Super I/O Controller
  * Hash/Crypto Engine
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 2125a96ef317..5a7b8ba81c92 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -211,6 +211,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     object_initialize_child(obj, "emmc-controller.sdhci", &s->emmc.slots[0],
                             TYPE_SYSBUS_SDHCI);
+
+    object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
 }
 
 /*
@@ -469,6 +471,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_DEV_EMMC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
+
+    /* LPC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7eefd54ac07a..4f098da437ac 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -211,6 +211,8 @@ static void aspeed_soc_init(Object *obj)
         object_initialize_child(obj, "sdhci[*]", &s->sdhci.slots[i],
                                 TYPE_SYSBUS_SDHCI);
     }
+
+    object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
 }
 
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -393,6 +395,14 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                     sc->memmap[ASPEED_DEV_SDHCI]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
+
+    /* LPC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
 }
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
diff --git a/hw/misc/aspeed_lpc.c b/hw/misc/aspeed_lpc.c
new file mode 100644
index 000000000000..e668e985ff04
--- /dev/null
+++ b/hw/misc/aspeed_lpc.c
@@ -0,0 +1,131 @@
+/*
+ *  ASPEED LPC Controller
+ *
+ *  Copyright (C) 2017-2018 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "hw/misc/aspeed_lpc.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+
+#define TO_REG(offset) ((offset) >> 2)
+
+#define HICR0                TO_REG(0x00)
+#define HICR1                TO_REG(0x04)
+#define HICR2                TO_REG(0x08)
+#define HICR3                TO_REG(0x0C)
+#define HICR4                TO_REG(0x10)
+#define HICR5                TO_REG(0x80)
+#define HICR6                TO_REG(0x84)
+#define HICR7                TO_REG(0x88)
+#define HICR8                TO_REG(0x8C)
+
+static uint64_t aspeed_lpc_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AspeedLPCState *s = ASPEED_LPC(opaque);
+    int reg = TO_REG(offset);
+
+    if (reg >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    return s->regs[reg];
+}
+
+static void aspeed_lpc_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned int size)
+{
+    AspeedLPCState *s = ASPEED_LPC(opaque);
+    int reg = TO_REG(offset);
+
+    if (reg >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    s->regs[reg] = data;
+}
+
+static const MemoryRegionOps aspeed_lpc_ops = {
+    .read = aspeed_lpc_read,
+    .write = aspeed_lpc_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+};
+
+static void aspeed_lpc_reset(DeviceState *dev)
+{
+    struct AspeedLPCState *s = ASPEED_LPC(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+
+    s->regs[HICR7] = s->hicr7;
+}
+
+static void aspeed_lpc_realize(DeviceState *dev, Error **errp)
+{
+    AspeedLPCState *s = ASPEED_LPC(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_lpc_ops, s,
+            TYPE_ASPEED_LPC, 0x1000);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_aspeed_lpc = {
+    .name = TYPE_ASPEED_LPC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedLPCState, ASPEED_LPC_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static Property aspeed_lpc_properties[] = {
+    DEFINE_PROP_UINT32("hicr7", AspeedLPCState, hicr7, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_lpc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aspeed_lpc_realize;
+    dc->reset = aspeed_lpc_reset;
+    dc->desc = "Aspeed LPC Controller",
+    dc->vmsd = &vmstate_aspeed_lpc;
+    device_class_set_props(dc, aspeed_lpc_properties);
+}
+
+static const TypeInfo aspeed_lpc_info = {
+    .name = TYPE_ASPEED_LPC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedLPCState),
+    .class_init = aspeed_lpc_class_init,
+};
+
+static void aspeed_lpc_register_types(void)
+{
+    type_register_static(&aspeed_lpc_info);
+}
+
+type_init(aspeed_lpc_register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 629283957fcc..e3263383cd59 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -102,7 +102,12 @@ softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
-softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c', 'aspeed_sdmc.c', 'aspeed_xdma.c'))
+softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
+  'aspeed_lpc.c',
+  'aspeed_scu.c',
+  'aspeed_sdmc.c',
+  'aspeed_xdma.c'))
+
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
 
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 11cfe6e3585b..42c64bd28ba2 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -28,6 +28,7 @@
 #include "hw/sd/aspeed_sdhci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "qom/object.h"
+#include "hw/misc/aspeed_lpc.h"
 
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
@@ -61,6 +62,7 @@ struct AspeedSoCState {
     AspeedGPIOState gpio_1_8v;
     AspeedSDHCIState sdhci;
     AspeedSDHCIState emmc;
+    AspeedLPCState lpc;
 };
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
diff --git a/include/hw/misc/aspeed_lpc.h b/include/hw/misc/aspeed_lpc.h
new file mode 100644
index 000000000000..0fbb7f68bed2
--- /dev/null
+++ b/include/hw/misc/aspeed_lpc.h
@@ -0,0 +1,32 @@
+/*
+ *  ASPEED LPC Controller
+ *
+ *  Copyright (C) 2017-2018 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef ASPEED_LPC_H
+#define ASPEED_LPC_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_LPC "aspeed.lpc"
+#define ASPEED_LPC(obj) OBJECT_CHECK(AspeedLPCState, (obj), TYPE_ASPEED_LPC)
+
+#define ASPEED_LPC_NR_REGS (0x260 >> 2)
+
+typedef struct AspeedLPCState {
+    /* <private> */
+    SysBusDevice parent;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t regs[ASPEED_LPC_NR_REGS];
+    uint32_t hicr7;
+} AspeedLPCState;
+
+#endif /* _ASPEED_LPC_H_ */
-- 
2.27.0


