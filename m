Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D72C250CD9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 02:20:22 +0200 (CEST)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAMhJ-0000X3-4b
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 20:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3llhEXwsKClk8JB9EE5DF5E7FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--hskinnemoen.bounces.google.com>)
 id 1kAMeZ-0003qQ-6V
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 20:17:31 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:37950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3llhEXwsKClk8JB9EE5DF5E7FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--hskinnemoen.bounces.google.com>)
 id 1kAMeW-00066f-Ql
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 20:17:30 -0400
Received: by mail-pg1-x54a.google.com with SMTP id 78so1429160pgf.5
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 17:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc:content-transfer-encoding;
 bh=m/ayDG00qMRIUpleuYo4aKp7Q1JphS2n6/ujInOccCs=;
 b=R/P2v5Q9O7jwD4krZnLhn1MXF2KRh3jYd0eHuU+msIBtTDr27ocXdnIx39GWTOq5XP
 Ze+Z2QyPx7AzpMj7ygG/Yz/X2CzIGyr8NlpVZetKMqfjqZGNIYmPBJG3ShpiLgDczFmf
 e7HqTDeoBb2MLmHxbGZb6LBVadKWCOT4T0bFCSi4xjHocHh24RlVRWNFZl8BH8bkyF8N
 rK1D7mC96b6R96C8637M2TPcGOWT5f6v3qCoYnlMZhM3fpKV2wvhkE12xzMbmxywDc6C
 6QjAJJqOp6rtpFVzl8tYzubQ7+hbiPKiRjAgwv4rBlnZ70VSDmQ97fsBwSzGHruOyjkw
 X7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=m/ayDG00qMRIUpleuYo4aKp7Q1JphS2n6/ujInOccCs=;
 b=tmIUK+ZzNEYzLoFvlGJIyFQ4gd+ZDvwGwOcyqxfI81qtiMl+H+tS9za5AoqKWKguRO
 JXpTiAvvpLmFK6ZqtYlj9fR65fVlb6VA/0d1JxW6cznBEgnFnfb7aI+WlN7/IXFTSr0B
 i4Hkp5BHtHx7MGgpa0L/3bQSzyYx0Kw+SVGdWrxKARy+tgKXltb97rcqZft1/XeK/hzS
 6zWkdaOZG4cpSo8GRd1DIxujt6ljC5etZk2cW6zTiuIn7ZcGjWSa/N5mdc0c6IrlYXY4
 9cR+FEuSXCH+R4U40Aa0yRg/f0dojc0JrS48QgmZt0WgyFo4FCaHoq4KDkhd5ystajCH
 cyEw==
X-Gm-Message-State: AOAM530oJ2yCerCaGrjhVI6XHuzhGy64lNgusfi1dGKWwYevYutnOzg4
 NybcueOEO9okPCBFxLfVg1tgH6Lu83oQaRpa4w==
X-Google-Smtp-Source: ABdhPJzt4nIx+iM7SVj6mliAA0zC1GBGufIJtGAlUN8h/VVgRn7awzzgUqIvhvYxnVSfJc6GriysdR+D+bURGlZkSg==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a17:90a:5b:: with SMTP id
 27mr1326455pjb.188.1598314646036; Mon, 24 Aug 2020 17:17:26 -0700 (PDT)
Date: Mon, 24 Aug 2020 17:16:59 -0700
In-Reply-To: <20200825001711.1340443-1-hskinnemoen@google.com>
Message-Id: <20200825001711.1340443-3-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200825001711.1340443-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v8 02/14] hw/misc: Add NPCM7xx Clock Controller device model
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>,
 Joel Stanley <joel@jms.id.au>, 
 "=?UTF-8?q?C=C3=A9dric=20Le=20Goater?=" <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3llhEXwsKClk8JB9EE5DF5E7FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--hskinnemoen.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-devel@nongnu.org>

Enough functionality to boot the Linux kernel has been implemented. This
includes:

  - Correct power-on reset values so the various clock rates can be
    accurately calculated.
  - Clock enables stick around when written.

In addition, a best effort attempt to implement SECCNT and CNTR25M was
made even though I don't think the kernel needs them.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 include/hw/misc/npcm7xx_clk.h |  48 ++++++
 hw/misc/npcm7xx_clk.c         | 266 ++++++++++++++++++++++++++++++++++
 hw/misc/meson.build           |   1 +
 hw/misc/trace-events          |   4 +
 4 files changed, 319 insertions(+)
 create mode 100644 include/hw/misc/npcm7xx_clk.h
 create mode 100644 hw/misc/npcm7xx_clk.c

diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
new file mode 100644
index 0000000000..cdcc9e8534
--- /dev/null
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -0,0 +1,48 @@
+/*
+ * Nuvoton NPCM7xx Clock Control Registers.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+#ifndef NPCM7XX_CLK_H
+#define NPCM7XX_CLK_H
+
+#include "exec/memory.h"
+#include "hw/sysbus.h"
+
+/*
+ * The reference clock frequency for the timer modules, and the SECCNT and
+ * CNTR25M registers in this module, is always 25 MHz.
+ */
+#define NPCM7XX_TIMER_REF_HZ            (25000000)
+
+/*
+ * Number of registers in our device state structure. Don't change this wi=
thout
+ * incrementing the version_id in the vmstate.
+ */
+#define NPCM7XX_CLK_NR_REGS             (0x70 / sizeof(uint32_t))
+
+typedef struct NPCM7xxCLKState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    uint32_t regs[NPCM7XX_CLK_NR_REGS];
+
+    /* Time reference for SECCNT and CNTR25M, initialized by power on rese=
t */
+    int64_t ref_ns;
+} NPCM7xxCLKState;
+
+#define TYPE_NPCM7XX_CLK "npcm7xx-clk"
+#define NPCM7XX_CLK(obj) OBJECT_CHECK(NPCM7xxCLKState, (obj), TYPE_NPCM7XX=
_CLK)
+
+#endif /* NPCM7XX_CLK_H */
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
new file mode 100644
index 0000000000..21ab4200d1
--- /dev/null
+++ b/hw/misc/npcm7xx_clk.c
@@ -0,0 +1,266 @@
+/*
+ * Nuvoton NPCM7xx Clock Control Registers.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/misc/npcm7xx_clk.h"
+#include "migration/vmstate.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/timer.h"
+#include "qemu/units.h"
+#include "trace.h"
+
+#define PLLCON_LOKI     BIT(31)
+#define PLLCON_LOKS     BIT(30)
+#define PLLCON_PWDEN    BIT(12)
+
+enum NPCM7xxCLKRegisters {
+    NPCM7XX_CLK_CLKEN1,
+    NPCM7XX_CLK_CLKSEL,
+    NPCM7XX_CLK_CLKDIV1,
+    NPCM7XX_CLK_PLLCON0,
+    NPCM7XX_CLK_PLLCON1,
+    NPCM7XX_CLK_SWRSTR,
+    NPCM7XX_CLK_IPSRST1         =3D 0x20 / sizeof(uint32_t),
+    NPCM7XX_CLK_IPSRST2,
+    NPCM7XX_CLK_CLKEN2,
+    NPCM7XX_CLK_CLKDIV2,
+    NPCM7XX_CLK_CLKEN3,
+    NPCM7XX_CLK_IPSRST3,
+    NPCM7XX_CLK_WD0RCR,
+    NPCM7XX_CLK_WD1RCR,
+    NPCM7XX_CLK_WD2RCR,
+    NPCM7XX_CLK_SWRSTC1,
+    NPCM7XX_CLK_SWRSTC2,
+    NPCM7XX_CLK_SWRSTC3,
+    NPCM7XX_CLK_SWRSTC4,
+    NPCM7XX_CLK_PLLCON2,
+    NPCM7XX_CLK_CLKDIV3,
+    NPCM7XX_CLK_CORSTC,
+    NPCM7XX_CLK_PLLCONG,
+    NPCM7XX_CLK_AHBCKFI,
+    NPCM7XX_CLK_SECCNT,
+    NPCM7XX_CLK_CNTR25M,
+    NPCM7XX_CLK_REGS_END,
+};
+
+/*
+ * These reset values were taken from version 0.91 of the NPCM750R data sh=
eet.
+ *
+ * All are loaded on power-up reset. CLKENx and SWRSTR should also be load=
ed on
+ * core domain reset, but this reset type is not yet supported by QEMU.
+ */
+static const uint32_t cold_reset_values[NPCM7XX_CLK_NR_REGS] =3D {
+    [NPCM7XX_CLK_CLKEN1]        =3D 0xffffffff,
+    [NPCM7XX_CLK_CLKSEL]        =3D 0x004aaaaa,
+    [NPCM7XX_CLK_CLKDIV1]       =3D 0x5413f855,
+    [NPCM7XX_CLK_PLLCON0]       =3D 0x00222101 | PLLCON_LOKI,
+    [NPCM7XX_CLK_PLLCON1]       =3D 0x00202101 | PLLCON_LOKI,
+    [NPCM7XX_CLK_IPSRST1]       =3D 0x00001000,
+    [NPCM7XX_CLK_IPSRST2]       =3D 0x80000000,
+    [NPCM7XX_CLK_CLKEN2]        =3D 0xffffffff,
+    [NPCM7XX_CLK_CLKDIV2]       =3D 0xaa4f8f9f,
+    [NPCM7XX_CLK_CLKEN3]        =3D 0xffffffff,
+    [NPCM7XX_CLK_IPSRST3]       =3D 0x03000000,
+    [NPCM7XX_CLK_WD0RCR]        =3D 0xffffffff,
+    [NPCM7XX_CLK_WD1RCR]        =3D 0xffffffff,
+    [NPCM7XX_CLK_WD2RCR]        =3D 0xffffffff,
+    [NPCM7XX_CLK_SWRSTC1]       =3D 0x00000003,
+    [NPCM7XX_CLK_PLLCON2]       =3D 0x00c02105 | PLLCON_LOKI,
+    [NPCM7XX_CLK_CORSTC]        =3D 0x04000003,
+    [NPCM7XX_CLK_PLLCONG]       =3D 0x01228606 | PLLCON_LOKI,
+    [NPCM7XX_CLK_AHBCKFI]       =3D 0x000000c8,
+};
+
+static uint64_t npcm7xx_clk_read(void *opaque, hwaddr offset, unsigned siz=
e)
+{
+    uint32_t reg =3D offset / sizeof(uint32_t);
+    NPCM7xxCLKState *s =3D opaque;
+    int64_t now_ns;
+    uint32_t value =3D 0;
+
+    if (reg >=3D NPCM7XX_CLK_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    switch (reg) {
+    case NPCM7XX_CLK_SWRSTR:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: register @ 0x%04" HWADDR_PRIx " is write-only\n=
",
+                      __func__, offset);
+        break;
+
+    case NPCM7XX_CLK_SECCNT:
+        now_ns =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        value =3D (now_ns - s->ref_ns) / NANOSECONDS_PER_SECOND;
+        break;
+
+    case NPCM7XX_CLK_CNTR25M:
+        now_ns =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        /*
+         * This register counts 25 MHz cycles, updating every 640 ns. It r=
olls
+         * over to zero every second.
+         *
+         * The 4 LSBs are always zero: (1e9 / 640) << 4 =3D 25000000.
+         */
+        value =3D (((now_ns - s->ref_ns) / 640) << 4) % NPCM7XX_TIMER_REF_=
HZ;
+        break;
+
+    default:
+        value =3D s->regs[reg];
+        break;
+    };
+
+    trace_npcm7xx_clk_read(offset, value);
+
+    return value;
+}
+
+static void npcm7xx_clk_write(void *opaque, hwaddr offset,
+                              uint64_t v, unsigned size)
+{
+    uint32_t reg =3D offset / sizeof(uint32_t);
+    NPCM7xxCLKState *s =3D opaque;
+    uint32_t value =3D v;
+
+    trace_npcm7xx_clk_write(offset, value);
+
+    if (reg >=3D NPCM7XX_CLK_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
+                      __func__, offset);
+        return;
+    }
+
+    switch (reg) {
+    case NPCM7XX_CLK_SWRSTR:
+        qemu_log_mask(LOG_UNIMP, "%s: SW reset not implemented: 0x%02x\n",
+                      __func__, value);
+        value =3D 0;
+        break;
+
+    case NPCM7XX_CLK_PLLCON0:
+    case NPCM7XX_CLK_PLLCON1:
+    case NPCM7XX_CLK_PLLCON2:
+    case NPCM7XX_CLK_PLLCONG:
+        if (value & PLLCON_PWDEN) {
+            /* Power down -- clear lock and indicate loss of lock */
+            value &=3D ~PLLCON_LOKI;
+            value |=3D PLLCON_LOKS;
+        } else {
+            /* Normal mode -- assume always locked */
+            value |=3D PLLCON_LOKI;
+            /* Keep LOKS unchanged unless cleared by writing 1 */
+            if (value & PLLCON_LOKS) {
+                value &=3D ~PLLCON_LOKS;
+            } else {
+                value |=3D (value & PLLCON_LOKS);
+            }
+        }
+        break;
+
+    case NPCM7XX_CLK_CNTR25M:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n"=
,
+                      __func__, offset);
+        return;
+    }
+
+    s->regs[reg] =3D value;
+}
+
+static const struct MemoryRegionOps npcm7xx_clk_ops =3D {
+    .read       =3D npcm7xx_clk_read,
+    .write      =3D npcm7xx_clk_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid      =3D {
+        .min_access_size        =3D 4,
+        .max_access_size        =3D 4,
+        .unaligned              =3D false,
+    },
+};
+
+static void npcm7xx_clk_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxCLKState *s =3D NPCM7XX_CLK(obj);
+
+    QEMU_BUILD_BUG_ON(sizeof(s->regs) !=3D sizeof(cold_reset_values));
+
+    switch (type) {
+    case RESET_TYPE_COLD:
+        memcpy(s->regs, cold_reset_values, sizeof(cold_reset_values));
+        s->ref_ns =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        return;
+    }
+
+    /*
+     * A small number of registers need to be reset on a core domain reset=
,
+     * but no such reset type exists yet.
+     */
+    qemu_log_mask(LOG_UNIMP, "%s: reset type %d not implemented.",
+                  __func__, type);
+}
+
+static void npcm7xx_clk_init(Object *obj)
+{
+    NPCM7xxCLKState *s =3D NPCM7XX_CLK(obj);
+
+    memory_region_init_io(&s->iomem, obj, &npcm7xx_clk_ops, s,
+                          TYPE_NPCM7XX_CLK, 4 * KiB);
+    sysbus_init_mmio(&s->parent, &s->iomem);
+}
+
+static const VMStateDescription vmstate_npcm7xx_clk =3D {
+    .name =3D "npcm7xx-clk",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, NPCM7xxCLKState, NPCM7XX_CLK_NR_REGS),
+        VMSTATE_INT64(ref_ns, NPCM7xxCLKState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END > NPCM7XX_CLK_NR_REGS);
+
+    dc->desc =3D "NPCM7xx Clock Control Registers";
+    dc->vmsd =3D &vmstate_npcm7xx_clk;
+    rc->phases.enter =3D npcm7xx_clk_enter_reset;
+}
+
+static const TypeInfo npcm7xx_clk_info =3D {
+    .name               =3D TYPE_NPCM7XX_CLK,
+    .parent             =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size      =3D sizeof(NPCM7xxCLKState),
+    .instance_init      =3D npcm7xx_clk_init,
+    .class_init         =3D npcm7xx_clk_class_init,
+};
+
+static void npcm7xx_clk_register_type(void)
+{
+    type_register_static(&npcm7xx_clk_info);
+}
+type_init(npcm7xx_clk_register_type);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 99ffb9f9e8..531cc31dcc 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -51,6 +51,7 @@ softmmu_ss.add(when: 'CONFIG_IMX', if_true: files(
 softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-hpdmc.c=
', 'milkymist-pfpu.c'))
 softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mst_fpga.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
+  'npcm7xx_clk.c',
   'npcm7xx_gcr.c',
 ))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files(
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index dbf90db8ed..a010699b4f 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -111,6 +111,10 @@ mos6522_set_sr_int(void) "set sr_int"
 mos6522_write(uint64_t addr, uint64_t val) "reg=3D0x%"PRIx64 " val=3D0x%"P=
RIx64
 mos6522_read(uint64_t addr, unsigned val) "reg=3D0x%"PRIx64 " val=3D0x%x"
=20
+# npcm7xx_clk.c
+npcm7xx_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 =
" value: 0x%08" PRIx32
+npcm7xx_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 =
" value: 0x%08" PRIx32
+
 # npcm7xx_gcr.c
 npcm7xx_gcr_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 =
" value: 0x%08" PRIx32
 npcm7xx_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 =
" value: 0x%08" PRIx32
--=20
2.28.0.297.g1956fa8f8d-goog


