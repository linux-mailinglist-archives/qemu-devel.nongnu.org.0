Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C9020BD4C
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 01:58:39 +0200 (CEST)
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joyEw-00047H-Uw
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 19:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3AYv2XgsKCu4XiaYddUceUdWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--hskinnemoen.bounces.google.com>)
 id 1joyCD-0007bz-KD
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 19:55:49 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:37604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3AYv2XgsKCu4XiaYddUceUdWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--hskinnemoen.bounces.google.com>)
 id 1joyCB-00023D-8W
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 19:55:49 -0400
Received: by mail-pj1-x1049.google.com with SMTP id h93so8170079pjb.2
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 16:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=d9qEFHsws40abeBFRLl6VG6IK3LMy9Zid4Rqu9Ytxx8=;
 b=L0a3Pkk6+u7AAE5a3coGx3k1yyavY6URxHfu5HqSMkSo3AME3GbB2pxw8XOjfSnYFy
 7HNTi82Ebgi3ka13sce2vc9P5KPUva0hQe/gZmVh8z14d3FyzgO+jcMiHmhbiUrjRsJs
 VOATJ5gXtsWrMQ5uLgv2nKlxX0ziee0INLAyuuPCB3uiA1XufNaRsBHXEC3ZGyj9Q5Pz
 M6qotMIBfmOkZkG6IyfaRJkbJNEUfxt1TTfL3XFIcdmVjn67jc9iNpFdvX/PIblrlpVM
 KeKlpb130EbctlciKnDUXUJmwSz5PNAgMSm23ymYDo2rMBcoGlJ+zjYUk8IcF5LLY3JC
 Z4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=d9qEFHsws40abeBFRLl6VG6IK3LMy9Zid4Rqu9Ytxx8=;
 b=PD9PwHZF/SKqyjFAsGngtr5ITqRTKEvJg93cJuPL0fLXuwPMEIjVn1cw55Re7wQ+yM
 SqowcGHdNkmzmbDqFlX2pDc0xtPOyJTVKn5QFQIfjWdZp++JUy/WrdThYenODpDVQId9
 3f+a4rmz5pTwk/wBazQt+HuuDvE9qe40g3r5+/wzb0oOzY74NZu6Q2m4wtNyyYNmhx6h
 bYJ00gaV2ZVQflLoPxHgkx88r4xSlxICw8DcE7PzZhiMFV/lv+rf4LIrspwuOal5Eh6X
 bKGsUFERfosUwKxigqJtlPW+2sq+XrDS5DgJYpRtYJftBs5A1WRufSLdyikXVL3sY4dZ
 gUUw==
X-Gm-Message-State: AOAM532mpFZNfVW+3G/i4rNhZY9Wb9By+C3t13js2QHjf+F9T6qfEkzO
 CcQ8jllw0WR/J9vwJVO62T3vINANmV9JewKNbQ==
X-Google-Smtp-Source: ABdhPJz6aw/nrZMehjJfXLx0HMwfebLu65OtxgriqIWQdhwv4qPBVdTMIUDHMns1bjd7qCtRUrHsp8+XFg82e7XvZw==
X-Received: by 2002:a17:90a:a47:: with SMTP id
 o65mr6272214pjo.70.1593215745473; 
 Fri, 26 Jun 2020 16:55:45 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:55:10 -0700
In-Reply-To: <20200626235519.591734-1-hskinnemoen@google.com>
Message-Id: <20200626235519.591734-4-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v3 03/12] hw/misc: Add NPCM7xx Clock Controller device model
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3AYv2XgsKCu4XiaYddUceUdWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--hskinnemoen.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
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
 hw/misc/Makefile.objs         |   1 +
 hw/misc/npcm7xx_clk.c         | 216 ++++++++++++++++++++++++++++++++++
 hw/misc/trace-events          |   4 +
 include/hw/misc/npcm7xx_clk.h |  65 ++++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 hw/misc/npcm7xx_clk.c
 create mode 100644 include/hw/misc/npcm7xx_clk.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 40a9d1c01e..2e74803005 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -51,6 +51,7 @@ common-obj-$(CONFIG_IMX) +=3D imx_rngc.o
 common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-hpdmc.o
 common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-pfpu.o
 common-obj-$(CONFIG_MAINSTONE) +=3D mst_fpga.o
+common-obj-$(CONFIG_NPCM7XX) +=3D npcm7xx_clk.o
 common-obj-$(CONFIG_NPCM7XX) +=3D npcm7xx_gcr.o
 common-obj-$(CONFIG_OMAP) +=3D omap_clk.o
 common-obj-$(CONFIG_OMAP) +=3D omap_gpmc.o
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
new file mode 100644
index 0000000000..2348683305
--- /dev/null
+++ b/hw/misc/npcm7xx_clk.c
@@ -0,0 +1,216 @@
+/*
+ * Nuvoton NPCM7xx Clock Control Registers.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/misc/npcm7xx_clk.h"
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
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: offset 0x%04x out of range\n",
+                      __func__, (unsigned int)offset);
+        return 0;
+    }
+
+    switch (reg) {
+    case NPCM7XX_CLK_SWRSTR:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: register @ 0x%04x is write-onl=
y\n",
+                      __func__, (unsigned int)offset);
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
+        value =3D (((now_ns - s->ref_ns) / 640) << 4) % 25000000;
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
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: offset 0x%04x out of range\n",
+                      __func__, (unsigned int)offset);
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
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: register @ 0x%04x is read-only=
\n",
+                      __func__, (unsigned int)offset);
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
+static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->desc =3D "NPCM7xx Clock Control Registers";
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
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 1a20ce659a..cdc41fe391 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -107,6 +107,10 @@ mos6522_set_sr_int(void) "set sr_int"
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
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
new file mode 100644
index 0000000000..a678b50ede
--- /dev/null
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -0,0 +1,65 @@
+/*
+ * Nuvoton NPCM7xx Clock Control Registers.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+#ifndef NPCM7XX_CLK_H
+#define NPCM7XX_CLK_H
+
+#include "exec/memory.h"
+#include "hw/sysbus.h"
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
+    NPCM7XX_CLK_NR_REGS,
+};
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
--=20
2.27.0.212.ge8ba1cc988-goog


