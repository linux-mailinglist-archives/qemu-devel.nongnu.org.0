Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444CC325DE7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 08:05:14 +0100 (CET)
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFXBW-00019b-Vu
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 02:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lFX58-0004lA-9H; Fri, 26 Feb 2021 01:58:34 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:37727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lFX55-0007l8-Ls; Fri, 26 Feb 2021 01:58:34 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C562C5C00DD;
 Fri, 26 Feb 2021 01:58:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 26 Feb 2021 01:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=WLJ3OjtEENj+t
 0PzkJRKCTj3R2TzvPRM4ScifUfCWu8=; b=E+/ecSIOX8/gwtyC9uGQ6LjNgaXzS
 /wvl1vxbsCgAvYt08mfHgZRR4bq68EcEKvDKqoruT5ELS9O/neM8AIV3PFNi1PMd
 PZWoSTlkryI6b3dhx525FWh3hcQSOdDnY4MWpHZPHJZkC3xbRwTzDGLuVuMHAOKt
 uaDmRZ5t+aQiUAPd3kaXXr1qGuMJ4AYhjinAApCyH2NSkNGgnL6ohR3iflIsbbDq
 RcWciZcQFVefeQy0JEwf7wdTCFwGAc6zmN5z3sWXP26x6xgxCU1OmLtYqou5S1eo
 MBQL/jYKyE1f1zz9XhAfhRCMpPTCXWAsyRkIe0OgP8ruA+XflHbMG+HHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=WLJ3OjtEENj+t0PzkJRKCTj3R2TzvPRM4ScifUfCWu8=; b=hWRPA+E8
 5bmjW7gHt1JduaVYUsoUdF/xyzFVX7HjXOi+czs7bubXN1MEboq1IPK2yGRtzjKG
 N3O/O/bUZGEoGJbHcRRalsLAYZUaxo3758nqtlnbSxT++Aw+v/8S13eFzylLD88K
 PCvu9rv6w3KiKcBknF7WWsGl5YoPVJGU9J81T6AAozuwUXjKJnZq9gcYLgxU2t3z
 61DJlZTFRFMy4oYuOIaU/qf0DYa4onHTvZuPvir+bX+lsATo5KJ2kcbb3vDsLRMG
 /TE4uISTk+WM8qDGBwxPz+gxeZMFNO1lmyL+ZNVBXTktfzEOYv3PFLwW7uglXRZH
 g8fNFQIW8LK/YA==
X-ME-Sender: <xms:Fpw4YJooJPHXgXjc6PD1BJZsTsLBVTTMqlnLN8fpeyi9xaIq_2AOPQ>
 <xme:Fpw4YLrBzWqvEKBQ7wNpbxK7tsoRjxXrtFth2SI7D6AEjoDqKJPuHoR3QGOpD3ior
 bH1s4HbWFE1DuFE8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddrledurdefjeenucev
 lhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Fpw4YGPwgDCfpbTtgtxaSmFberiydr52STdVo-59rRkXcMH8DSOctA>
 <xmx:Fpw4YE64BjkRvA-WGoCOqqey3k9R4hjz-PwGhQTbKFEjW8HP2RVGCg>
 <xmx:Fpw4YI5RnhkcYBpEy8Mh9AbIgCVwIX_fJFrAcZKq8NUlmUNzTLoHag>
 <xmx:Fpw4YD3iqCHLOh9PU3m5FTYuGjFccn55GY2NjIPWbHI9dyqCpFuvDA>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF73324005D;
 Fri, 26 Feb 2021 01:58:26 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH 4/4] hw/misc: Model KCS devices in the Aspeed LPC controller
Date: Fri, 26 Feb 2021 17:27:58 +1030
Message-Id: <20210226065758.547824-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226065758.547824-1-andrew@aj.id.au>
References: <20210226065758.547824-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
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
 qemu-devel@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keyboard-Controller-Style devices for IPMI purposes are exposed via LPC
IO cycles from the BMC to the host.

Expose support on the BMC side by implementing the usual MMIO
behaviours, and expose the ability to inspect the KCS registers in
"host" style by accessing QOM properties associated with each register.

The model caters to the IRQ style of both the AST2600 and the earlier
SoCs (AST2400 and AST2500). The AST2600 allocates an IRQ for each LPC
sub-device, while there is a single IRQ shared across all subdevices on
the AST2400 and AST2500.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_ast2600.c      |  28 ++-
 hw/arm/aspeed_soc.c          |  24 ++-
 hw/misc/aspeed_lpc.c         | 354 +++++++++++++++++++++++++++++++++++
 include/hw/arm/aspeed_soc.h  |   1 +
 include/hw/misc/aspeed_lpc.h |  17 +-
 5 files changed, 421 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 60152de001e6..fd463775d281 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -104,7 +104,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_ETH2]      = 3,
     [ASPEED_DEV_ETH3]      = 32,
     [ASPEED_DEV_ETH4]      = 33,
-
+    [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
 };
 
 static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
@@ -477,8 +477,34 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
+
+    /* Connect the LPC IRQ to the GIC. It is otherwise unused. */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
+
+    /*
+     * On the AST2600 LPC subdevice IRQs are connected straight to the GIC.
+     *
+     * LPC subdevice IRQ sources are offset from 1 because the LPC model caters
+     * to the AST2400 and AST2500. SoCs before the AST2600 have one LPC IRQ
+     * shared across the subdevices, and the shared IRQ output to the VIC is at
+     * offset 0.
+     */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_1,
+                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_1));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_2,
+                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_2));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_3,
+                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_3));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
+                       qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 4f098da437ac..057d053c8478 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -112,7 +112,6 @@ static const int aspeed_soc_ast2400_irqmap[] = {
     [ASPEED_DEV_WDT]    = 27,
     [ASPEED_DEV_PWM]    = 28,
     [ASPEED_DEV_LPC]    = 8,
-    [ASPEED_DEV_IBT]    = 8, /* LPC */
     [ASPEED_DEV_I2C]    = 12,
     [ASPEED_DEV_ETH1]   = 2,
     [ASPEED_DEV_ETH2]   = 3,
@@ -401,8 +400,31 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0, sc->memmap[ASPEED_DEV_LPC]);
+
+    /* Connect the LPC IRQ to the VIC */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_LPC));
+
+    /*
+     * On the AST2400 and AST2500 the one LPC IRQ is shared between all of the
+     * subdevices. Connect the LPC subdevice IRQs to the LPC controller IRQ (by
+     * contrast, on the AST2600, the subdevice IRQs are connected straight to
+     * the GIC).
+     *
+     * LPC subdevice IRQ sources are offset from 1 because the shared IRQ output
+     * to the VIC is at offset 0.
+     */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_1,
+                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_1));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_2,
+                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_2));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_3,
+                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_3));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
+                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_4));
 }
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
diff --git a/hw/misc/aspeed_lpc.c b/hw/misc/aspeed_lpc.c
index e668e985ff04..672131209dfa 100644
--- a/hw/misc/aspeed_lpc.c
+++ b/hw/misc/aspeed_lpc.c
@@ -12,20 +12,301 @@
 #include "qemu/error-report.h"
 #include "hw/misc/aspeed_lpc.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 
 #define TO_REG(offset) ((offset) >> 2)
 
 #define HICR0                TO_REG(0x00)
+#define   HICR0_LPC3E        BIT(7)
+#define   HICR0_LPC2E        BIT(6)
+#define   HICR0_LPC1E        BIT(5)
 #define HICR1                TO_REG(0x04)
 #define HICR2                TO_REG(0x08)
+#define   HICR2_IBFIE3       BIT(3)
+#define   HICR2_IBFIE2       BIT(2)
+#define   HICR2_IBFIE1       BIT(1)
 #define HICR3                TO_REG(0x0C)
 #define HICR4                TO_REG(0x10)
+#define   HICR4_KCSENBL      BIT(2)
+#define IDR1                 TO_REG(0x24)
+#define IDR2                 TO_REG(0x28)
+#define IDR3                 TO_REG(0x2C)
+#define ODR1                 TO_REG(0x30)
+#define ODR2                 TO_REG(0x34)
+#define ODR3                 TO_REG(0x38)
+#define STR1                 TO_REG(0x3C)
+#define   STR_OBF            BIT(0)
+#define   STR_IBF            BIT(1)
+#define   STR_CMD_DATA       BIT(3)
+#define STR2                 TO_REG(0x40)
+#define STR3                 TO_REG(0x44)
 #define HICR5                TO_REG(0x80)
 #define HICR6                TO_REG(0x84)
 #define HICR7                TO_REG(0x88)
 #define HICR8                TO_REG(0x8C)
+#define HICRB                TO_REG(0x100)
+#define   HICRB_IBFIE4       BIT(1)
+#define   HICRB_LPC4E        BIT(0)
+#define IDR4                 TO_REG(0x114)
+#define ODR4                 TO_REG(0x118)
+#define STR4                 TO_REG(0x11C)
+
+enum aspeed_kcs_channel_id {
+    kcs_channel_1 = 0,
+    kcs_channel_2,
+    kcs_channel_3,
+    kcs_channel_4,
+};
+
+static const enum aspeed_lpc_subdevice aspeed_kcs_subdevice_map[] = {
+    [kcs_channel_1] = aspeed_lpc_kcs_1,
+    [kcs_channel_2] = aspeed_lpc_kcs_2,
+    [kcs_channel_3] = aspeed_lpc_kcs_3,
+    [kcs_channel_4] = aspeed_lpc_kcs_4,
+};
+
+struct aspeed_kcs_channel {
+    enum aspeed_kcs_channel_id id;
+
+    int idr;
+    int odr;
+    int str;
+};
+
+static const struct aspeed_kcs_channel aspeed_kcs_channel_map[] = {
+    [kcs_channel_1] = {
+        .id = kcs_channel_1,
+        .idr = IDR1,
+        .odr = ODR1,
+        .str = STR1
+    },
+
+    [kcs_channel_2] = {
+        .id = kcs_channel_2,
+        .idr = IDR2,
+        .odr = ODR2,
+        .str = STR2
+    },
+
+    [kcs_channel_3] = {
+        .id = kcs_channel_3,
+        .idr = IDR3,
+        .odr = ODR3,
+        .str = STR3
+    },
+
+    [kcs_channel_4] = {
+        .id = kcs_channel_4,
+        .idr = IDR4,
+        .odr = ODR4,
+        .str = STR4
+    },
+};
+
+struct aspeed_kcs_register_data {
+    const char *name;
+    int reg;
+    const struct aspeed_kcs_channel *chan;
+};
+
+static const struct aspeed_kcs_register_data aspeed_kcs_registers[] = {
+    {
+        .name = "idr1",
+        .reg = IDR1,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_1],
+    },
+    {
+        .name = "odr1",
+        .reg = ODR1,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_1],
+    },
+    {
+        .name = "str1",
+        .reg = STR1,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_1],
+    },
+    {
+        .name = "idr2",
+        .reg = IDR2,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_2],
+    },
+    {
+        .name = "odr2",
+        .reg = ODR2,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_2],
+    },
+    {
+        .name = "str2",
+        .reg = STR2,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_2],
+    },
+    {
+        .name = "idr3",
+        .reg = IDR3,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_3],
+    },
+    {
+        .name = "odr3",
+        .reg = ODR3,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_3],
+    },
+    {
+        .name = "str3",
+        .reg = STR3,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_3],
+    },
+    {
+        .name = "idr4",
+        .reg = IDR4,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_4],
+    },
+    {
+        .name = "odr4",
+        .reg = ODR4,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_4],
+    },
+    {
+        .name = "str4",
+        .reg = STR4,
+        .chan = &aspeed_kcs_channel_map[kcs_channel_4],
+    },
+    { },
+};
+
+static const struct aspeed_kcs_register_data *
+aspeed_kcs_get_register_data_by_name(const char *name)
+{
+    const struct aspeed_kcs_register_data *pos = aspeed_kcs_registers;
+
+    while (pos->name) {
+        if (!strcmp(pos->name, name)) {
+            return pos;
+        }
+        pos++;
+    }
+
+    return NULL;
+}
+
+static const struct aspeed_kcs_channel *
+aspeed_kcs_get_channel_by_register(int reg)
+{
+    const struct aspeed_kcs_register_data *pos = aspeed_kcs_registers;
+
+    while (pos->name) {
+        if (pos->reg == reg) {
+            return pos->chan;
+        }
+        pos++;
+    }
+
+    return NULL;
+}
+
+static void aspeed_kcs_get_register_property(Object *obj,
+                                             Visitor *v,
+                                             const char *name,
+                                             void *opaque,
+                                             Error **errp)
+{
+    const struct aspeed_kcs_register_data *data;
+    AspeedLPCState *s = ASPEED_LPC(obj);
+    uint32_t val;
+
+    data = aspeed_kcs_get_register_data_by_name(name);
+    if (!data) {
+        return;
+    }
+
+    if (!strncmp("odr", name, 3)) {
+        s->regs[data->chan->str] &= ~STR_OBF;
+    }
+
+    val = s->regs[data->reg];
+
+    visit_type_uint32(v, name, &val, errp);
+}
+
+static bool aspeed_kcs_channel_enabled(AspeedLPCState *s,
+                                       const struct aspeed_kcs_channel *channel)
+{
+    switch (channel->id) {
+    case kcs_channel_1: return s->regs[HICR0] & HICR0_LPC1E;
+    case kcs_channel_2: return s->regs[HICR0] & HICR0_LPC2E;
+    case kcs_channel_3:
+        return (s->regs[HICR0] & HICR0_LPC3E) &&
+                    (s->regs[HICR4] & HICR4_KCSENBL);
+    case kcs_channel_4: return s->regs[HICRB] & HICRB_LPC4E;
+    default: return false;
+    }
+}
+
+static bool
+aspeed_kcs_channel_ibf_irq_enabled(AspeedLPCState *s,
+                                   const struct aspeed_kcs_channel *channel)
+{
+    if (!aspeed_kcs_channel_enabled(s, channel)) {
+            return false;
+    }
+
+    switch (channel->id) {
+    case kcs_channel_1: return s->regs[HICR2] & HICR2_IBFIE1;
+    case kcs_channel_2: return s->regs[HICR2] & HICR2_IBFIE2;
+    case kcs_channel_3: return s->regs[HICR2] & HICR2_IBFIE3;
+    case kcs_channel_4: return s->regs[HICRB] & HICRB_IBFIE4;
+    default: return false;
+    }
+}
+
+static void aspeed_kcs_set_register_property(Object *obj,
+                                             Visitor *v,
+                                             const char *name,
+                                             void *opaque,
+                                             Error **errp)
+{
+    const struct aspeed_kcs_register_data *data;
+    AspeedLPCState *s = ASPEED_LPC(obj);
+    uint32_t val;
+
+    data = aspeed_kcs_get_register_data_by_name(name);
+    if (!data) {
+        return;
+    }
+
+    if (!visit_type_uint32(v, name, &val, errp)) {
+        return;
+    }
+
+    if (strncmp("str", name, 3)) {
+        s->regs[data->reg] = val;
+    }
+
+    if (!strncmp("idr", name, 3)) {
+        s->regs[data->chan->str] |= STR_IBF;
+        if (aspeed_kcs_channel_ibf_irq_enabled(s, data->chan)) {
+            enum aspeed_lpc_subdevice subdev;
+
+            subdev = aspeed_kcs_subdevice_map[data->chan->id];
+            qemu_irq_raise(s->subdevice_irqs[subdev]);
+        }
+    }
+}
+
+static void aspeed_lpc_set_irq(void *opaque, int irq, int level)
+{
+    AspeedLPCState *s = (AspeedLPCState *)opaque;
+
+    if (level) {
+        s->subdevice_irqs_pending |= BIT(irq);
+    } else {
+        s->subdevice_irqs_pending &= ~BIT(irq);
+    }
+
+    qemu_set_irq(s->irq, !!s->subdevice_irqs_pending);
+}
 
 static uint64_t aspeed_lpc_read(void *opaque, hwaddr offset, unsigned size)
 {
@@ -39,6 +320,29 @@ static uint64_t aspeed_lpc_read(void *opaque, hwaddr offset, unsigned size)
         return 0;
     }
 
+    switch (reg) {
+    case IDR1:
+    case IDR2:
+    case IDR3:
+    case IDR4:
+    {
+        const struct aspeed_kcs_channel *channel;
+
+        channel = aspeed_kcs_get_channel_by_register(reg);
+        if (s->regs[channel->str] & STR_IBF) {
+            enum aspeed_lpc_subdevice subdev;
+
+            subdev = aspeed_kcs_subdevice_map[channel->id];
+            qemu_irq_lower(s->subdevice_irqs[subdev]);
+        }
+
+        s->regs[channel->str] &= ~STR_IBF;
+        break;
+    }
+    default:
+        break;
+    }
+
     return s->regs[reg];
 }
 
@@ -55,6 +359,18 @@ static void aspeed_lpc_write(void *opaque, hwaddr offset, uint64_t data,
         return;
     }
 
+
+    switch (reg) {
+    case ODR1:
+    case ODR2:
+    case ODR3:
+    case ODR4:
+        s->regs[aspeed_kcs_get_channel_by_register(reg)->str] |= STR_OBF;
+        break;
+    default:
+        break;
+    }
+
     s->regs[reg] = data;
 }
 
@@ -72,6 +388,8 @@ static void aspeed_lpc_reset(DeviceState *dev)
 {
     struct AspeedLPCState *s = ASPEED_LPC(dev);
 
+    s->subdevice_irqs_pending = 0;
+
     memset(s->regs, 0, sizeof(s->regs));
 
     s->regs[HICR7] = s->hicr7;
@@ -83,11 +401,46 @@ static void aspeed_lpc_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     sysbus_init_irq(sbd, &s->irq);
+    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_1]);
+    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_2]);
+    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_3]);
+    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_kcs_4]);
+    sysbus_init_irq(sbd, &s->subdevice_irqs[aspeed_lpc_ibt]);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_lpc_ops, s,
             TYPE_ASPEED_LPC, 0x1000);
 
     sysbus_init_mmio(sbd, &s->iomem);
+
+    qdev_init_gpio_in(dev, aspeed_lpc_set_irq, ASPEED_LPC_NR_SUBDEVS);
+}
+
+static void aspeed_lpc_init(Object *obj)
+{
+    object_property_add(obj, "idr1", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "odr1", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "str1", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "idr2", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "odr2", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "str2", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "idr3", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "odr3", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "str3", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "idr4", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "odr4", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
+    object_property_add(obj, "str4", "uint32", aspeed_kcs_get_register_property,
+                        aspeed_kcs_set_register_property, NULL, NULL);
 }
 
 static const VMStateDescription vmstate_aspeed_lpc = {
@@ -121,6 +474,7 @@ static const TypeInfo aspeed_lpc_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(AspeedLPCState),
     .class_init = aspeed_lpc_class_init,
+    .instance_init = aspeed_lpc_init,
 };
 
 static void aspeed_lpc_register_types(void)
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 42c64bd28ba2..9359d6da336d 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -132,6 +132,7 @@ enum {
     ASPEED_DEV_SDRAM,
     ASPEED_DEV_XDMA,
     ASPEED_DEV_EMMC,
+    ASPEED_DEV_KCS,
 };
 
 #endif /* ASPEED_SOC_H */
diff --git a/include/hw/misc/aspeed_lpc.h b/include/hw/misc/aspeed_lpc.h
index 0fbb7f68bed2..df418cfcd36c 100644
--- a/include/hw/misc/aspeed_lpc.h
+++ b/include/hw/misc/aspeed_lpc.h
@@ -12,10 +12,22 @@
 
 #include "hw/sysbus.h"
 
+#include <stdint.h>
+
 #define TYPE_ASPEED_LPC "aspeed.lpc"
 #define ASPEED_LPC(obj) OBJECT_CHECK(AspeedLPCState, (obj), TYPE_ASPEED_LPC)
 
-#define ASPEED_LPC_NR_REGS (0x260 >> 2)
+#define ASPEED_LPC_NR_REGS      (0x260 >> 2)
+
+enum aspeed_lpc_subdevice {
+    aspeed_lpc_kcs_1 = 0,
+    aspeed_lpc_kcs_2,
+    aspeed_lpc_kcs_3,
+    aspeed_lpc_kcs_4,
+    aspeed_lpc_ibt,
+};
+
+#define ASPEED_LPC_NR_SUBDEVS   5
 
 typedef struct AspeedLPCState {
     /* <private> */
@@ -25,6 +37,9 @@ typedef struct AspeedLPCState {
     MemoryRegion iomem;
     qemu_irq irq;
 
+    qemu_irq subdevice_irqs[ASPEED_LPC_NR_SUBDEVS];
+    uint32_t subdevice_irqs_pending;
+
     uint32_t regs[ASPEED_LPC_NR_REGS];
     uint32_t hicr7;
 } AspeedLPCState;
-- 
2.27.0


