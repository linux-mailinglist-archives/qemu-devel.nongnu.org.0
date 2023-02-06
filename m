Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C15968CA9D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 00:36:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPB1E-0000h4-Iq; Mon, 06 Feb 2023 18:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3j47hYwgKClgMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1pPB0e-0000N5-CJ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:34:57 -0500
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3j47hYwgKClgMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com>)
 id 1pPB0U-0006F7-1G
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:34:50 -0500
Received: by mail-pf1-x449.google.com with SMTP id
 k14-20020aa7972e000000b00593a8232ac3so7226307pfg.22
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 15:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=e/piuFO7fKbYCx5pmj7hkpJxVFL+4/FWYiX0T7OuXxs=;
 b=IDNikXGq4ugSZZq4DsSzesM5eg6V5+M9s0xp6evQspzkbz1q4fwNH6yZCGjAwiXwPl
 eWE4gCQ5UMJ/w2Hkmce7UVhJFh3K9oRnQ3+Mn0fjEMGIdD9xyjQQf2NkosiUmx92qYr6
 hQBkSDbQ3cL6kCceWLoZ5lsgbJZvRVvCpvOvzluifVy8Fs63Pjij690m3e4agiNHlytS
 6ZSGRT3hhaP5DKus1+0zEL7l9aomOeJmNttbBBNJZqNprJN8qVjLZb6btajjire/2oW2
 5Qb1Wmt19bCXGCSzbVArZ6fg+bUJmcPPhVJDMO+mAqqNgL2iA7I/GuSHDXPEHEI7hQf8
 XAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e/piuFO7fKbYCx5pmj7hkpJxVFL+4/FWYiX0T7OuXxs=;
 b=xyom4dDgYf6RjrUWKWoZgrobsS61PQENVtyCSW19ikg0KNVdFeijIq1afyTmSUrolo
 8jXTVegCZzkzqVPyl70XupfsPwDK7pvvAaph04G6LTEew6FA0BeJgIbdFnOceMV8YDqk
 xL3FV8Ehnim6ccP6+mewen/INkiOLhHtkE6GaxpBTenK6GNR5QGr1kqL+BnsWuXtYrpI
 IjgJhhaHA/dC1pT4GKRSqL9lAt2nLWe0GFue9RJPzetiEdD4JlpHiadoVjXNxlc+sT/I
 POZugrPMLRoP/hJc8RLE/iFyH2uETW12ehOBlu/bkoMtsQ+5eiPt7OM8IBZR9XmZPf6s
 NTVA==
X-Gm-Message-State: AO0yUKV42MxIGZO/8SCyBi8SihLI4OdF23ebj9VF7pGeZMbZEIzNqO/W
 WMAkVrkn5ILmKGa7jx6+JUCxXrzLYviZjQ==
X-Google-Smtp-Source: AK7set8HPxyMdHDAAJHYoO0N2eBZvWMtwdtybdMiTZ/9itBROhxjNcl7ysqaYxTOc922rQWCSsTvDnLR9r+fFQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:1617:b0:22c:5a14:7e9c with SMTP
 id n23-20020a17090a161700b0022c5a147e9cmr317676pja.48.1675726479608; Mon, 06
 Feb 2023 15:34:39 -0800 (PST)
Date: Mon,  6 Feb 2023 15:34:27 -0800
In-Reply-To: <20230206233428.2772669-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230206233428.2772669-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230206233428.2772669-3-wuhaotsh@google.com>
Subject: [PATCH 2/3] hw/ssi: Add Nuvoton PSPI Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3j47hYwgKClgMK70EJI76EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Nuvoton's PSPI is a general purpose SPI module which enables
connections to SPI-based peripheral devices.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
---
 MAINTAINERS                |   6 +-
 hw/ssi/meson.build         |   2 +-
 hw/ssi/npcm_pspi.c         | 216 +++++++++++++++++++++++++++++++++++++
 hw/ssi/trace-events        |   5 +
 include/hw/ssi/npcm_pspi.h |  53 +++++++++
 5 files changed, 278 insertions(+), 4 deletions(-)
 create mode 100644 hw/ssi/npcm_pspi.c
 create mode 100644 include/hw/ssi/npcm_pspi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 347936e41c..1e2a711373 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -803,9 +803,9 @@ M: Tyrone Ting <kfting@nuvoton.com>
 M: Hao Wu <wuhaotsh@google.com>
 L: qemu-arm@nongnu.org
 S: Supported
-F: hw/*/npcm7xx*
-F: include/hw/*/npcm7xx*
-F: tests/qtest/npcm7xx*
+F: hw/*/npcm*
+F: include/hw/*/npcm*
+F: tests/qtest/npcm*
 F: pc-bios/npcm7xx_bootrom.bin
 F: roms/vbootrom
 F: docs/system/arm/nuvoton.rst
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
index 702aa5e4df..904a47161a 100644
--- a/hw/ssi/meson.build
+++ b/hw/ssi/meson.build
@@ -1,6 +1,6 @@
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_smc.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-spi.c'))
-softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_fiu.c'))
+softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_fiu.c', 'npcm_pspi.c'))
 softmmu_ss.add(when: 'CONFIG_PL022', if_true: files('pl022.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_SPI', if_true: files('sifive_spi.c'))
 softmmu_ss.add(when: 'CONFIG_SSI', if_true: files('ssi.c'))
diff --git a/hw/ssi/npcm_pspi.c b/hw/ssi/npcm_pspi.c
new file mode 100644
index 0000000000..565bba5282
--- /dev/null
+++ b/hw/ssi/npcm_pspi.c
@@ -0,0 +1,216 @@
+/*
+ * Nuvoton NPCM Peripheral SPI Module (PSPI)
+ *
+ * Copyright 2023 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/irq.h"
+#include "hw/registerfields.h"
+#include "hw/ssi/npcm_pspi.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+
+#include "trace.h"
+
+REG16(PSPI_DATA, 0x0)
+REG16(PSPI_CTL1, 0x2)
+    FIELD(PSPI_CTL1, SPIEN, 0,  1)
+    FIELD(PSPI_CTL1, MOD,   2,  1)
+    FIELD(PSPI_CTL1, EIR,   5,  1)
+    FIELD(PSPI_CTL1, EIW,   6,  1)
+    FIELD(PSPI_CTL1, SCM,   7,  1)
+    FIELD(PSPI_CTL1, SCIDL, 8,  1)
+    FIELD(PSPI_CTL1, SCDV,  9,  7)
+REG16(PSPI_STAT, 0x4)
+    FIELD(PSPI_STAT, BSY,  0,  1)
+    FIELD(PSPI_STAT, RBF,  1,  1)
+
+static void npcm_pspi_update_irq(NPCMPSPIState *s)
+{
+    int level = 0;
+
+    /* Only fire IRQ when the module is enabled. */
+    if (FIELD_EX16(s->regs[R_PSPI_CTL1], PSPI_CTL1, SPIEN)) {
+        /* Update interrupt as BSY is cleared. */
+        if ((!FIELD_EX16(s->regs[R_PSPI_STAT], PSPI_STAT, BSY)) &&
+            FIELD_EX16(s->regs[R_PSPI_CTL1], PSPI_CTL1, EIW)) {
+            level = 1;
+        }
+
+        /* Update interrupt as RBF is set. */
+        if (FIELD_EX16(s->regs[R_PSPI_STAT], PSPI_STAT, RBF) &&
+            FIELD_EX16(s->regs[R_PSPI_CTL1], PSPI_CTL1, EIR)) {
+            level = 1;
+        }
+    }
+    qemu_set_irq(s->irq, level);
+}
+
+static uint16_t npcm_pspi_read_data(NPCMPSPIState *s)
+{
+    uint16_t value = s->regs[R_PSPI_DATA];
+
+    /* Clear stat bits as the value are read out. */
+    s->regs[R_PSPI_STAT] = 0;
+
+    return value;
+}
+
+static void npcm_pspi_write_data(NPCMPSPIState *s, uint16_t data)
+{
+    uint16_t value = 0;
+
+    if (FIELD_EX16(s->regs[R_PSPI_CTL1], PSPI_CTL1, MOD)) {
+        value = ssi_transfer(s->spi, extract16(data, 8, 8)) << 8;
+    }
+    value |= ssi_transfer(s->spi, extract16(data, 0, 8));
+    s->regs[R_PSPI_DATA] = value;
+
+    /* Mark data as available */
+    s->regs[R_PSPI_STAT] = R_PSPI_STAT_BSY_MASK | R_PSPI_STAT_RBF_MASK;
+}
+
+/* Control register read handler. */
+static uint64_t npcm_pspi_ctrl_read(void *opaque, hwaddr addr,
+                                    unsigned int size)
+{
+    NPCMPSPIState *s = opaque;
+    uint16_t value;
+
+    switch (addr) {
+    case A_PSPI_DATA:
+        value = npcm_pspi_read_data(s);
+        break;
+
+    case A_PSPI_CTL1:
+        value = s->regs[R_PSPI_CTL1];
+        break;
+
+    case A_PSPI_STAT:
+        value = s->regs[R_PSPI_STAT];
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to invalid offset 0x%" PRIx64 "\n",
+                      DEVICE(s)->canonical_path, addr);
+        return 0;
+    }
+    trace_npcm_pspi_ctrl_read(DEVICE(s)->canonical_path, addr, value);
+    npcm_pspi_update_irq(s);
+
+    return value;
+}
+
+/* Control register write handler. */
+static void npcm_pspi_ctrl_write(void *opaque, hwaddr addr, uint64_t v,
+                                 unsigned int size)
+{
+    NPCMPSPIState *s = opaque;
+    uint16_t value = v;
+
+    trace_npcm_pspi_ctrl_write(DEVICE(s)->canonical_path, addr, value);
+
+    switch (addr) {
+    case A_PSPI_DATA:
+        npcm_pspi_write_data(s, value);
+        break;
+
+    case A_PSPI_CTL1:
+        s->regs[R_PSPI_CTL1] = value;
+        break;
+
+    case A_PSPI_STAT:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to read-only register PSPI_STAT: 0x%08"
+                      PRIx64 "\n", DEVICE(s)->canonical_path, v);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to invalid offset 0x%" PRIx64 "\n",
+                      DEVICE(s)->canonical_path, addr);
+        return;
+    }
+    npcm_pspi_update_irq(s);
+}
+
+static const MemoryRegionOps npcm_pspi_ctrl_ops = {
+    .read = npcm_pspi_ctrl_read,
+    .write = npcm_pspi_ctrl_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 2,
+        .unaligned = false,
+    },
+};
+
+static void npcm_pspi_enter_reset(Object *obj, ResetType type)
+{
+    NPCMPSPIState *s = NPCM_PSPI(obj);
+
+    trace_npcm_pspi_enter_reset(DEVICE(obj)->canonical_path, type);
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void npcm_pspi_realize(DeviceState *dev, Error **errp)
+{
+    NPCMPSPIState *s = NPCM_PSPI(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    Object *obj = OBJECT(dev);
+
+    s->spi = ssi_create_bus(dev, "pspi");
+    memory_region_init_io(&s->mmio, obj, &npcm_pspi_ctrl_ops, s,
+                          "mmio", 4 * KiB);
+    sysbus_init_mmio(sbd, &s->mmio);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static const VMStateDescription vmstate_npcm_pspi = {
+    .name = "npcm-pspi",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT16_ARRAY(regs, NPCMPSPIState, NPCM_PSPI_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+
+static void npcm_pspi_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM Peripheral SPI Module";
+    dc->realize = npcm_pspi_realize;
+    dc->vmsd = &vmstate_npcm_pspi;
+    rc->phases.enter = npcm_pspi_enter_reset;
+}
+
+static const TypeInfo npcm_pspi_types[] = {
+    {
+        .name = TYPE_NPCM_PSPI,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(NPCMPSPIState),
+        .class_init = npcm_pspi_class_init,
+    },
+};
+DEFINE_TYPES(npcm_pspi_types);
diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
index c707d4aaba..16ea9954c4 100644
--- a/hw/ssi/trace-events
+++ b/hw/ssi/trace-events
@@ -21,6 +21,11 @@ npcm7xx_fiu_ctrl_write(const char *id, uint64_t addr, uint32_t data) "%s offset:
 npcm7xx_fiu_flash_read(const char *id, int cs, uint64_t addr, unsigned int size, uint64_t value) "%s[%d] offset: 0x%08" PRIx64 " size: %u value: 0x%" PRIx64
 npcm7xx_fiu_flash_write(const char *id, unsigned cs, uint64_t addr, unsigned int size, uint64_t value) "%s[%d] offset: 0x%08" PRIx64 " size: %u value: 0x%" PRIx64
 
+# npcm_pspi.c
+npcm_pspi_enter_reset(const char *id, int reset_type) "%s reset type: %d"
+npcm_pspi_ctrl_read(const char *id, uint64_t addr, uint16_t data) "%s offset: 0x%04" PRIx64 " value: 0x%08" PRIx16
+npcm_pspi_ctrl_write(const char *id, uint64_t addr, uint16_t data) "%s offset: 0x%04" PRIx64 " value: 0x%08" PRIx16
+
 # ibex_spi_host.c
 
 ibex_spi_host_reset(const char *msg) "%s"
diff --git a/include/hw/ssi/npcm_pspi.h b/include/hw/ssi/npcm_pspi.h
new file mode 100644
index 0000000000..37cc784d96
--- /dev/null
+++ b/include/hw/ssi/npcm_pspi.h
@@ -0,0 +1,53 @@
+/*
+ * Nuvoton Peripheral SPI Module
+ *
+ * Copyright 2023 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+#ifndef NPCM_PSPI_H
+#define NPCM_PSPI_H
+
+#include "hw/ssi/ssi.h"
+#include "hw/sysbus.h"
+
+/*
+ * Number of registers in our device state structure. Don't change this without
+ * incrementing the version_id in the vmstate.
+ */
+#define NPCM_PSPI_NR_REGS 3
+
+/**
+ * NPCMPSPIState - Device state for one Flash Interface Unit.
+ * @parent: System bus device.
+ * @mmio: Memory region for register access.
+ * @spi: The SPI bus mastered by this controller.
+ * @regs: Register contents.
+ * @irq: The interrupt request queue for this module.
+ *
+ * Each PSPI has a shared bank of registers, and controls up to four chip
+ * selects. Each chip select has a dedicated memory region which may be used to
+ * read and write the flash connected to that chip select as if it were memory.
+ */
+typedef struct NPCMPSPIState {
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+
+    SSIBus *spi;
+    uint16_t regs[NPCM_PSPI_NR_REGS];
+    qemu_irq irq;
+} NPCMPSPIState;
+
+#define TYPE_NPCM_PSPI "npcm-pspi"
+OBJECT_DECLARE_SIMPLE_TYPE(NPCMPSPIState, NPCM_PSPI)
+
+#endif /* NPCM_PSPI_H */
-- 
2.39.1.519.gcb327c4b5f-goog


