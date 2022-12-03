Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F59641A02
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 00:22:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1bnK-00005I-9z; Sat, 03 Dec 2022 18:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnH-0008W1-Pr; Sat, 03 Dec 2022 18:19:39 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnC-0001ZW-IP; Sat, 03 Dec 2022 18:19:39 -0500
Received: by mail-lj1-x22c.google.com with SMTP id r8so9392201ljn.8;
 Sat, 03 Dec 2022 15:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+p336/FrmdEt68Ge++kBO0f32Z/grOM5cPoZ3ze/No=;
 b=CpKtfVYbOGLoJZOouvQj2VBeNpUZkVMGapzdfgQQ6UOpq01rXZ6BLC7GOSswpDkZVm
 AqBDmupQL2jWZUZ6Zs/IF+jEdw1Psi4OoCf+wq0fCAwfTKBc/SbqD3nfZZfoOE7R4AVm
 ubLoTdu6qSl4jRKW41d+VUWRe/VwbOepFdleA/h31MX3Z6UF0snDOGZV514WAos7pveT
 UOX2pGmPdw7oJq8l2EQDP/7AlidINaEpvLdXN0MKnsRSKMdktJDezXxKYDEveOinEjwU
 fKCXShRv0+37Nr+4vpw/cetlnJEndNwM3nLN0u5ZgSRXyhgA0WdYy1LOnxqoQuQVTi1n
 +g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+p336/FrmdEt68Ge++kBO0f32Z/grOM5cPoZ3ze/No=;
 b=CarZDceIFZL8wHf8t2PSPc0UklE8PFegz+JdedMLRmSYQTqQunrk5/n9/Yn96efpbs
 DIChJMisnZDdgyh4uVK4yMOLS+f/osDrxy3UprsE+dIxDLy/RDv+//J8NFeXJMAuFdBY
 sBpaN5w98WagDAORWRm1x6+p5t/dZIIpbi/vVcpK3vqLQmhGlPfw1pv12f41zcGRC+6h
 Voh5b6s8HAsnKJf0zEhU6fWjhHSD28dkoJre5STfbyBmMjc+ix0PeGtTtIiowq9NZQ+a
 Ynqjf1CaaQ3Omk+6Hb2g+TrCFu+0KUv3XevPeaQ3xZ2lIILXWCZUIHxyvVUIU4pK9jnC
 wqag==
X-Gm-Message-State: ANoB5pkt6mBle/hYw83koc36RjOf90coor6g6n+Cl/b6zdcbW5U17hrz
 wcYYN+8M/2i3TvJdfUbGKayU+LVxuSh0Rmud
X-Google-Smtp-Source: AA0mqf546EWF4vpuh9b3t3vQ916AMKUCaCk65A8WmWmbi7Uub0hjmth40Fj/ZnNO2F74IzTvOADSLw==
X-Received: by 2002:a05:651c:221a:b0:279:669e:999b with SMTP id
 y26-20020a05651c221a00b00279669e999bmr17301013ljq.225.1670109571884; 
 Sat, 03 Dec 2022 15:19:31 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 b27-20020a05651c033b00b002770e6c620bsm22623ljp.106.2022.12.03.15.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 15:19:31 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 1/6] hw/misc: Allwinner-A10 Clock Controller Module Emulation
Date: Sun,  4 Dec 2022 00:18:59 +0100
Message-Id: <20221203231904.25155-2-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

During SPL boot several Clock Controller Module (CCM) registers are
read, most important are PLL and Tuning, as well as divisor registers.

This patch adds these registers and initializes reset values from user's
guide.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 hw/arm/Kconfig                      |   1 +
 hw/arm/allwinner-a10.c              |   7 +
 hw/misc/Kconfig                     |   3 +
 hw/misc/allwinner-a10-ccm.c         | 224 ++++++++++++++++++++++++++++
 hw/misc/meson.build                 |   1 +
 include/hw/arm/allwinner-a10.h      |   2 +
 include/hw/misc/allwinner-a10-ccm.h |  67 +++++++++
 7 files changed, 305 insertions(+)
 create mode 100644 hw/misc/allwinner-a10-ccm.c
 create mode 100644 include/hw/misc/allwinner-a10-ccm.h

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 17fcde8e1c..14f52b41af 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -319,6 +319,7 @@ config ALLWINNER_A10
     select AHCI
     select ALLWINNER_A10_PIT
     select ALLWINNER_A10_PIC
+    select ALLWINNER_A10_CCM
     select ALLWINNER_EMAC
     select SERIAL
     select UNIMP
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 79082289ea..86baeeeca2 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -26,6 +26,7 @@
 #include "hw/usb/hcd-ohci.h"
 
 #define AW_A10_MMC0_BASE        0x01c0f000
+#define AW_A10_CCM_BASE         0x01c20000
 #define AW_A10_PIC_REG_BASE     0x01c20400
 #define AW_A10_PIT_REG_BASE     0x01c20c00
 #define AW_A10_UART0_REG_BASE   0x01c28000
@@ -46,6 +47,8 @@ static void aw_a10_init(Object *obj)
 
     object_initialize_child(obj, "timer", &s->timer, TYPE_AW_A10_PIT);
 
+    object_initialize_child(obj, "ccm", &s->ccm, TYPE_AW_A10_CCM);
+
     object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
 
     object_initialize_child(obj, "sata", &s->sata, TYPE_ALLWINNER_AHCI);
@@ -103,6 +106,10 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), 0x00000000, &s->sram_a);
     create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
 
+    /* Clock Control Module */
+    sysbus_realize(SYS_BUS_DEVICE(&s->ccm), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccm), 0, AW_A10_CCM_BASE);
+
     /* FIXME use qdev NIC properties instead of nd_table[] */
     if (nd_table[0].used) {
         qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index cbabe9f78c..ed07bf4133 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -174,4 +174,7 @@ config VIRT_CTRL
 config LASI
     bool
 
+config ALLWINNER_A10_CCM
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/allwinner-a10-ccm.c b/hw/misc/allwinner-a10-ccm.c
new file mode 100644
index 0000000000..68146ee340
--- /dev/null
+++ b/hw/misc/allwinner-a10-ccm.c
@@ -0,0 +1,224 @@
+/*
+ * Allwinner A10 Clock Control Module emulation
+ *
+ * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
+ *
+ *  This file is derived from Allwinner H3 CCU,
+ *  by Niek Linnenbank.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/misc/allwinner-a10-ccm.h"
+
+/* CCM register offsets */
+enum {
+    REG_PLL1_CFG             = 0x0000, /* PLL1 Control */
+    REG_PLL1_TUN             = 0x0004, /* PLL1 Tuning */
+    REG_PLL2_CFG             = 0x0008, /* PLL2 Control */
+    REG_PLL2_TUN             = 0x000C, /* PLL2 Tuning */
+    REG_PLL3_CFG             = 0x0010, /* PLL3 Control */
+    REG_PLL4_CFG             = 0x0018, /* PLL4 Control */
+    REG_PLL5_CFG             = 0x0020, /* PLL5 Control */
+    REG_PLL5_TUN             = 0x0024, /* PLL5 Tuning */
+    REG_PLL6_CFG             = 0x0028, /* PLL6 Control */
+    REG_PLL6_TUN             = 0x002C, /* PLL6 Tuning */
+    REG_PLL7_CFG             = 0x0030, /* PLL7 Control */
+    REG_PLL1_TUN2            = 0x0038, /* PLL1 Tuning2 */
+    REG_PLL5_TUN2            = 0x003C, /* PLL5 Tuning2 */
+    REG_PLL8_CFG             = 0x0040, /* PLL8 Control */
+    REG_OSC24M_CFG           = 0x0050, /* OSC24M Control */
+    REG_CPU_AHB_APB0_CFG     = 0x0054, /* CPU, AHB and APB0 Divide Ratio */
+};
+
+#define REG_INDEX(offset)    (offset / sizeof(uint32_t))
+
+/* CCM register reset values */
+enum {
+    REG_PLL1_CFG_RST         = 0x21005000,
+    REG_PLL1_TUN_RST         = 0x0A101000,
+    REG_PLL2_CFG_RST         = 0x08100010,
+    REG_PLL2_TUN_RST         = 0x00000000,
+    REG_PLL3_CFG_RST         = 0x0010D063,
+    REG_PLL4_CFG_RST         = 0x21009911,
+    REG_PLL5_CFG_RST         = 0x11049280,
+    REG_PLL5_TUN_RST         = 0x14888000,
+    REG_PLL6_CFG_RST         = 0x21009911,
+    REG_PLL6_TUN_RST         = 0x00000000,
+    REG_PLL7_CFG_RST         = 0x0010D063,
+    REG_PLL1_TUN2_RST        = 0x00000000,
+    REG_PLL5_TUN2_RST        = 0x00000000,
+    REG_PLL8_CFG_RST         = 0x21009911,
+    REG_OSC24M_CFG_RST       = 0x00138013,
+    REG_CPU_AHB_APB0_CFG_RST = 0x00010010,
+};
+
+static uint64_t allwinner_a10_ccm_read(void *opaque, hwaddr offset,
+                                       unsigned size)
+{
+    const AwA10ClockCtlState *s = AW_A10_CCM(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    switch (offset) {
+    case REG_PLL1_CFG:
+    case REG_PLL1_TUN:
+    case REG_PLL2_CFG:
+    case REG_PLL2_TUN:
+    case REG_PLL3_CFG:
+    case REG_PLL4_CFG:
+    case REG_PLL5_CFG:
+    case REG_PLL5_TUN:
+    case REG_PLL6_CFG:
+    case REG_PLL6_TUN:
+    case REG_PLL7_CFG:
+    case REG_PLL1_TUN2:
+    case REG_PLL5_TUN2:
+    case REG_PLL8_CFG:
+    case REG_OSC24M_CFG:
+    case REG_CPU_AHB_APB0_CFG:
+        break;
+    case 0x158 ... AW_A10_CCM_IOSIZE:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return 0;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented read offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return 0;
+    }
+
+    return s->regs[idx];
+}
+
+static void allwinner_a10_ccm_write(void *opaque, hwaddr offset,
+                                   uint64_t val, unsigned size)
+{
+    AwA10ClockCtlState *s = AW_A10_CCM(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    switch (offset) {
+    case REG_PLL1_CFG:
+    case REG_PLL1_TUN:
+    case REG_PLL2_CFG:
+    case REG_PLL2_TUN:
+    case REG_PLL3_CFG:
+    case REG_PLL4_CFG:
+    case REG_PLL5_CFG:
+    case REG_PLL5_TUN:
+    case REG_PLL6_CFG:
+    case REG_PLL6_TUN:
+    case REG_PLL7_CFG:
+    case REG_PLL1_TUN2:
+    case REG_PLL5_TUN2:
+    case REG_PLL8_CFG:
+    case REG_OSC24M_CFG:
+    case REG_CPU_AHB_APB0_CFG:
+        break;
+    case 0x158 ... AW_A10_CCM_IOSIZE:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented write offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        break;
+    }
+
+    s->regs[idx] = (uint32_t) val;
+}
+
+static const MemoryRegionOps allwinner_a10_ccm_ops = {
+    .read = allwinner_a10_ccm_read,
+    .write = allwinner_a10_ccm_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl.min_access_size = 4,
+};
+
+static void allwinner_a10_ccm_reset_enter(Object *obj, ResetType type)
+{
+    AwA10ClockCtlState *s = AW_A10_CCM(obj);
+
+    /* Set default values for registers */
+    s->regs[REG_INDEX(REG_PLL1_CFG)] = REG_PLL1_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL1_TUN)] = REG_PLL1_TUN_RST;
+    s->regs[REG_INDEX(REG_PLL2_CFG)] = REG_PLL2_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL2_TUN)] = REG_PLL2_TUN_RST;
+    s->regs[REG_INDEX(REG_PLL3_CFG)] = REG_PLL3_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL4_CFG)] = REG_PLL4_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL5_CFG)] = REG_PLL5_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL5_TUN)] = REG_PLL5_TUN_RST;
+    s->regs[REG_INDEX(REG_PLL6_CFG)] = REG_PLL6_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL6_TUN)] = REG_PLL6_TUN_RST;
+    s->regs[REG_INDEX(REG_PLL7_CFG)] = REG_PLL7_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL1_TUN2)] = REG_PLL1_TUN2_RST;
+    s->regs[REG_INDEX(REG_PLL5_TUN2)] = REG_PLL5_TUN2_RST;
+    s->regs[REG_INDEX(REG_PLL8_CFG)] = REG_PLL8_CFG_RST;
+    s->regs[REG_INDEX(REG_OSC24M_CFG)] = REG_OSC24M_CFG_RST;
+    s->regs[REG_INDEX(REG_CPU_AHB_APB0_CFG)] = REG_CPU_AHB_APB0_CFG_RST;
+}
+
+static void allwinner_a10_ccm_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    AwA10ClockCtlState *s = AW_A10_CCM(obj);
+
+    /* Memory mapping */
+    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_a10_ccm_ops, s,
+                          TYPE_AW_A10_CCM, AW_A10_CCM_IOSIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription allwinner_a10_ccm_vmstate = {
+    .name = "allwinner-a10-ccm",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AwA10ClockCtlState, AW_A10_CCM_REGS_NUM),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void allwinner_a10_ccm_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    rc->phases.enter = allwinner_a10_ccm_reset_enter;
+    dc->vmsd = &allwinner_a10_ccm_vmstate;
+}
+
+static const TypeInfo allwinner_a10_ccm_info = {
+    .name          = TYPE_AW_A10_CCM,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = allwinner_a10_ccm_init,
+    .instance_size = sizeof(AwA10ClockCtlState),
+    .class_init    = allwinner_a10_ccm_class_init,
+};
+
+static void allwinner_a10_ccm_register(void)
+{
+    type_register_static(&allwinner_a10_ccm_info);
+}
+
+type_init(allwinner_a10_ccm_register)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..ebf216edbc 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -38,6 +38,7 @@ subdir('macio')
 
 softmmu_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
 
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_CCM', if_true: files('allwinner-a10-ccm.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-ccu.c'))
 specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-cpucfg.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-dramc.c'))
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index a76dc7b84d..45d0fc2f7e 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -12,6 +12,7 @@
 #include "hw/usb/hcd-ohci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/rtc/allwinner-rtc.h"
+#include "hw/misc/allwinner-a10-ccm.h"
 
 #include "target/arm/cpu.h"
 #include "qom/object.h"
@@ -30,6 +31,7 @@ struct AwA10State {
     /*< public >*/
 
     ARMCPU cpu;
+    AwA10ClockCtlState ccm;
     AwA10PITState timer;
     AwA10PICState intc;
     AwEmacState emac;
diff --git a/include/hw/misc/allwinner-a10-ccm.h b/include/hw/misc/allwinner-a10-ccm.h
new file mode 100644
index 0000000000..7f22532efa
--- /dev/null
+++ b/include/hw/misc/allwinner-a10-ccm.h
@@ -0,0 +1,67 @@
+/*
+ * Allwinner A10 Clock Control Module emulation
+ *
+ * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
+ *
+ *  This file is derived from Allwinner H3 CCU,
+ *  by Niek Linnenbank.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_MISC_ALLWINNER_A10_CCM_H
+#define HW_MISC_ALLWINNER_A10_CCM_H
+
+#include "qom/object.h"
+#include "hw/sysbus.h"
+
+/**
+ * @name Constants
+ * @{
+ */
+
+/** Size of register I/O address space used by CCM device */
+#define AW_A10_CCM_IOSIZE        (0x400)
+
+/** Total number of known registers */
+#define AW_A10_CCM_REGS_NUM      (AW_A10_CCM_IOSIZE / sizeof(uint32_t))
+
+/** @} */
+
+/**
+ * @name Object model
+ * @{
+ */
+
+#define TYPE_AW_A10_CCM    "allwinner-a10-ccm"
+OBJECT_DECLARE_SIMPLE_TYPE(AwA10ClockCtlState, AW_A10_CCM)
+
+/** @} */
+
+/**
+ * Allwinner A10 CCM object instance state.
+ */
+struct AwA10ClockCtlState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    /** Maps I/O registers in physical memory */
+    MemoryRegion iomem;
+
+    /** Array of hardware registers */
+    uint32_t regs[AW_A10_CCM_REGS_NUM];
+};
+
+#endif /* HW_MISC_ALLWINNER_H3_CCU_H */
-- 
2.30.2


