Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3B8250CDA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 02:20:49 +0200 (CEST)
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAMhk-0001Eh-LA
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 20:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3pFhEXwsKCmcMXPNSSJRTJSLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--hskinnemoen.bounces.google.com>)
 id 1kAMen-0004Qt-82
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 20:17:46 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:42020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3pFhEXwsKCmcMXPNSSJRTJSLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--hskinnemoen.bounces.google.com>)
 id 1kAMek-000692-2K
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 20:17:44 -0400
Received: by mail-pg1-x54a.google.com with SMTP id c3so6422902pgq.9
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 17:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc:content-transfer-encoding;
 bh=c1MZF2ezr3ddIvAR3zY02pisuLxj7we9YNIhvsAAxTo=;
 b=au7K1lCf2h7YZ7QSZVLHoVFNyZL9oquTT+Uut1ltAC/pYGAtw2RSZaeiAXOl07V+C3
 kgSzQ+uZsIcJdVzf0Wrw1eBmSAo9S6u2ZlYjcLLLC3/eI3aPxNLZj71TAlUNO39utK2u
 b10zFzaIAakGEhyZKOUoSm6Y7LdA1DqcuLJSqunBSeqACmr6xd7DfX+wOuQMynakdsju
 31UnZQxBFMcbmJ+R4bHZlTIr12VGpsickt8fBWJplxqUwMyhlTyw7/f5x/DM14xxFpgI
 QN+7RoLcusv/GeU2QKuVlkWfGC7hl5cotCZm4AV8CUIOSCp1S3Np5sJ8YEmKvJ2zFE1H
 kIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=c1MZF2ezr3ddIvAR3zY02pisuLxj7we9YNIhvsAAxTo=;
 b=WIgAld2Lw+bl950gydwrAGbwwyoXjKnjD8QJyKeInaAwh+/ex7zG5/xZX31DsKz2uF
 hlCjWEBoKKWJH+FoqnMbsbl6Jp1ayePasZzj0LwvQPKoY+ewBpDSQvqUFaH0fPNgduHb
 BKO+/yXxTErUwIjYYSqNutiNInIJYrdIA700m7lUagsjuOy4LvYnsiGQG4N40Gp2zCni
 vPj3mYr7EiVybl2DEbDSIlLkkparVaDzirXMCP6E9vX0laJetWKsSpa8k9zr2R4rGNE6
 BwpGFpbWyU2/pSYIBGQrugTg2r7clhxJB6+t9dZtKA36y/PYe+grm+zEOsTLzda/bHg7
 FYeg==
X-Gm-Message-State: AOAM5324wBmnWsCthM3J44/246mp/SDnjsPOWxeSAsvljbDUaOHJUiRX
 MgqZChoFXEQJJPSaQeokpwSpWStN+gC7K4avuw==
X-Google-Smtp-Source: ABdhPJy3tD+YEoPNOnWglSXxLlCZHw5D5L+ka2/cbeS4LTH/d7GdO5BFiGQFqCftVbJnUI/k1JiIuzAawLdiy8n5EA==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a17:902:ee02:: with SMTP id
 z2mr5492140plb.291.1598314660153;
 Mon, 24 Aug 2020 17:17:40 -0700 (PDT)
Date: Mon, 24 Aug 2020 17:17:07 -0700
In-Reply-To: <20200825001711.1340443-1-hskinnemoen@google.com>
Message-Id: <20200825001711.1340443-11-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200825001711.1340443-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v8 10/14] hw/ssi: NPCM7xx Flash Interface Unit device model
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>, 
 "=?UTF-8?q?C=C3=A9dric=20Le=20Goater?=" <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3pFhEXwsKCmcMXPNSSJRTJSLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--hskinnemoen.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This implements a device model for the NPCM7xx SPI flash controller.

Direct reads and writes, and user-mode transactions have been tested in
various modes. Protection features are not implemented yet.

All the FIU instances are available in the SoC's address space,
regardless of whether or not they're connected to actual flash chips.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 include/hw/arm/npcm7xx.h     |   2 +
 include/hw/ssi/npcm7xx_fiu.h |  73 +++++
 hw/arm/npcm7xx.c             |  58 ++++
 hw/ssi/npcm7xx_fiu.c         | 572 +++++++++++++++++++++++++++++++++++
 hw/arm/Kconfig               |   1 +
 hw/ssi/meson.build           |   1 +
 hw/ssi/trace-events          |  11 +
 7 files changed, 718 insertions(+)
 create mode 100644 include/hw/ssi/npcm7xx_fiu.h
 create mode 100644 hw/ssi/npcm7xx_fiu.c

diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 9fa84a0702..78d0d78c52 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -23,6 +23,7 @@
 #include "hw/misc/npcm7xx_gcr.h"
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
+#include "hw/ssi/npcm7xx_fiu.h"
 #include "target/arm/cpu.h"
=20
 #define NPCM7XX_MAX_NUM_CPUS    (2)
@@ -73,6 +74,7 @@ typedef struct NPCM7xxState {
     NPCM7xxOTPState     key_storage;
     NPCM7xxOTPState     fuse_array;
     NPCM7xxMCState      mc;
+    NPCM7xxFIUState     fiu[2];
 } NPCM7xxState;
=20
 #define TYPE_NPCM7XX    "npcm7xx"
diff --git a/include/hw/ssi/npcm7xx_fiu.h b/include/hw/ssi/npcm7xx_fiu.h
new file mode 100644
index 0000000000..a3a1704289
--- /dev/null
+++ b/include/hw/ssi/npcm7xx_fiu.h
@@ -0,0 +1,73 @@
+/*
+ * Nuvoton NPCM7xx Flash Interface Unit (FIU)
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
+#ifndef NPCM7XX_FIU_H
+#define NPCM7XX_FIU_H
+
+#include "hw/ssi/ssi.h"
+#include "hw/sysbus.h"
+
+/*
+ * Number of registers in our device state structure. Don't change this wi=
thout
+ * incrementing the version_id in the vmstate.
+ */
+#define NPCM7XX_FIU_NR_REGS (0x7c / sizeof(uint32_t))
+
+typedef struct NPCM7xxFIUState NPCM7xxFIUState;
+
+/**
+ * struct NPCM7xxFIUFlash - Per-chipselect flash controller state.
+ * @direct_access: Memory region for direct flash access.
+ * @fiu: Pointer to flash controller shared state.
+ */
+typedef struct NPCM7xxFIUFlash {
+    MemoryRegion direct_access;
+    NPCM7xxFIUState *fiu;
+} NPCM7xxFIUFlash;
+
+/**
+ * NPCM7xxFIUState - Device state for one Flash Interface Unit.
+ * @parent: System bus device.
+ * @mmio: Memory region for register access.
+ * @cs_count: Number of flash chips that may be connected to this module.
+ * @active_cs: Currently active chip select, or -1 if no chip is selected.
+ * @cs_lines: GPIO lines that may be wired to flash chips.
+ * @flash: Array of @cs_count per-flash-chip state objects.
+ * @spi: The SPI bus mastered by this controller.
+ * @regs: Register contents.
+ *
+ * Each FIU has a shared bank of registers, and controls up to four chip
+ * selects. Each chip select has a dedicated memory region which may be us=
ed to
+ * read and write the flash connected to that chip select as if it were me=
mory.
+ */
+struct NPCM7xxFIUState {
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+
+    int32_t cs_count;
+    int32_t active_cs;
+    qemu_irq *cs_lines;
+    NPCM7xxFIUFlash *flash;
+
+    SSIBus *spi;
+
+    uint32_t regs[NPCM7XX_FIU_NR_REGS];
+};
+
+#define TYPE_NPCM7XX_FIU "npcm7xx-fiu"
+#define NPCM7XX_FIU(obj) OBJECT_CHECK(NPCM7xxFIUState, (obj), TYPE_NPCM7XX=
_FIU)
+
+#endif /* NPCM7XX_FIU_H */
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 6bb1693833..7884b2b03d 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -99,6 +99,39 @@ static const hwaddr npcm7xx_uart_addr[] =3D {
     0xf0004000,
 };
=20
+/* Direct memory-mapped access to SPI0 CS0-1. */
+static const hwaddr npcm7xx_fiu0_flash_addr[] =3D {
+    0x80000000, /* CS0 */
+    0x88000000, /* CS1 */
+};
+
+/* Direct memory-mapped access to SPI3 CS0-3. */
+static const hwaddr npcm7xx_fiu3_flash_addr[] =3D {
+    0xa0000000, /* CS0 */
+    0xa8000000, /* CS1 */
+    0xb0000000, /* CS2 */
+    0xb8000000, /* CS3 */
+};
+
+static const struct {
+    const char *name;
+    hwaddr regs_addr;
+    int cs_count;
+    const hwaddr *flash_addr;
+} npcm7xx_fiu[] =3D {
+    {
+        .name =3D "fiu0",
+        .regs_addr =3D 0xfb000000,
+        .cs_count =3D ARRAY_SIZE(npcm7xx_fiu0_flash_addr),
+        .flash_addr =3D npcm7xx_fiu0_flash_addr,
+    }, {
+        .name =3D "fiu3",
+        .regs_addr =3D 0xc0000000,
+        .cs_count =3D ARRAY_SIZE(npcm7xx_fiu3_flash_addr),
+        .flash_addr =3D npcm7xx_fiu3_flash_addr,
+    },
+};
+
 static void npcm7xx_write_secondary_boot(ARMCPU *cpu,
                                          const struct arm_boot_info *info)
 {
@@ -192,6 +225,12 @@ static void npcm7xx_init(Object *obj)
     for (i =3D 0; i < ARRAY_SIZE(s->tim); i++) {
         object_initialize_child(obj, "tim[*]", &s->tim[i], TYPE_NPCM7XX_TI=
MER);
     }
+
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_fiu) !=3D ARRAY_SIZE(s->fiu));
+    for (i =3D 0; i < ARRAY_SIZE(s->fiu); i++) {
+        object_initialize_child(obj, npcm7xx_fiu[i].name, &s->fiu[i],
+                                TYPE_NPCM7XX_FIU);
+    }
 }
=20
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -291,6 +330,25 @@ static void npcm7xx_realize(DeviceState *dev, Error **=
errp)
                        serial_hd(i), DEVICE_LITTLE_ENDIAN);
     }
=20
+    /*
+     * Flash Interface Unit (FIU). Can fail if incorrect number of chip se=
lects
+     * specified, but this is a programming error.
+     */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_fiu) !=3D ARRAY_SIZE(s->fiu));
+    for (i =3D 0; i < ARRAY_SIZE(s->fiu); i++) {
+        SysBusDevice *sbd =3D SYS_BUS_DEVICE(&s->fiu[i]);
+        int j;
+
+        object_property_set_int(OBJECT(sbd), "cs-count",
+                                npcm7xx_fiu[i].cs_count, &error_abort);
+        sysbus_realize(sbd, &error_abort);
+
+        sysbus_mmio_map(sbd, 0, npcm7xx_fiu[i].regs_addr);
+        for (j =3D 0; j < npcm7xx_fiu[i].cs_count; j++) {
+            sysbus_mmio_map(sbd, j + 1, npcm7xx_fiu[i].flash_addr[j]);
+        }
+    }
+
     /* RAM2 (SRAM) */
     memory_region_init_ram(&s->sram, OBJECT(dev), "ram2",
                            NPCM7XX_RAM2_SZ, &error_abort);
diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
new file mode 100644
index 0000000000..104e8f2b96
--- /dev/null
+++ b/hw/ssi/npcm7xx_fiu.c
@@ -0,0 +1,572 @@
+/*
+ * Nuvoton NPCM7xx Flash Interface Unit (FIU)
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
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/ssi/npcm7xx_fiu.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+
+#include "trace.h"
+
+/* Up to 128 MiB of flash may be accessed directly as memory. */
+#define NPCM7XX_FIU_FLASH_WINDOW_SIZE (128 * MiB)
+
+/* Each module has 4 KiB of register space. Only a fraction of it is used.=
 */
+#define NPCM7XX_FIU_CTRL_REGS_SIZE (4 * KiB)
+
+/* 32-bit FIU register indices. */
+enum NPCM7xxFIURegister {
+    NPCM7XX_FIU_DRD_CFG,
+    NPCM7XX_FIU_DWR_CFG,
+    NPCM7XX_FIU_UMA_CFG,
+    NPCM7XX_FIU_UMA_CTS,
+    NPCM7XX_FIU_UMA_CMD,
+    NPCM7XX_FIU_UMA_ADDR,
+    NPCM7XX_FIU_PRT_CFG,
+    NPCM7XX_FIU_UMA_DW0 =3D 0x0020 / sizeof(uint32_t),
+    NPCM7XX_FIU_UMA_DW1,
+    NPCM7XX_FIU_UMA_DW2,
+    NPCM7XX_FIU_UMA_DW3,
+    NPCM7XX_FIU_UMA_DR0,
+    NPCM7XX_FIU_UMA_DR1,
+    NPCM7XX_FIU_UMA_DR2,
+    NPCM7XX_FIU_UMA_DR3,
+    NPCM7XX_FIU_PRT_CMD0,
+    NPCM7XX_FIU_PRT_CMD1,
+    NPCM7XX_FIU_PRT_CMD2,
+    NPCM7XX_FIU_PRT_CMD3,
+    NPCM7XX_FIU_PRT_CMD4,
+    NPCM7XX_FIU_PRT_CMD5,
+    NPCM7XX_FIU_PRT_CMD6,
+    NPCM7XX_FIU_PRT_CMD7,
+    NPCM7XX_FIU_PRT_CMD8,
+    NPCM7XX_FIU_PRT_CMD9,
+    NPCM7XX_FIU_CFG =3D 0x78 / sizeof(uint32_t),
+    NPCM7XX_FIU_REGS_END,
+};
+
+/* FIU_{DRD,DWR,UMA,PTR}_CFG cannot be written when this bit is set. */
+#define NPCM7XX_FIU_CFG_LCK BIT(31)
+
+/* Direct Read configuration register fields. */
+#define FIU_DRD_CFG_ADDSIZ(rv) extract32(rv, 16, 2)
+#define FIU_ADDSIZ_3BYTES 0
+#define FIU_ADDSIZ_4BYTES 1
+#define FIU_DRD_CFG_DBW(rv) extract32(rv, 12, 2)
+#define FIU_DRD_CFG_ACCTYPE(rv) extract32(rv, 8, 2)
+#define FIU_DRD_CFG_RDCMD(rv) extract32(rv, 0, 8)
+
+/* Direct Write configuration register fields. */
+#define FIU_DWR_CFG_ADDSIZ(rv) extract32(rv, 16, 2)
+#define FIU_DWR_CFG_WRCMD(rv) extract32(rv, 0, 8)
+
+/* User-Mode Access register fields. */
+
+/* Command Mode Lock and the bits protected by it. */
+#define FIU_UMA_CFG_CMMLCK BIT(30)
+#define FIU_UMA_CFG_CMMLCK_MASK 0x00000403
+
+#define FIU_UMA_CFG_RDATSIZ(rv) extract32(rv, 24, 5)
+#define FIU_UMA_CFG_DBSIZ(rv) extract32(rv, 21, 3)
+#define FIU_UMA_CFG_WDATSIZ(rv) extract32(rv, 16, 5)
+#define FIU_UMA_CFG_ADDSIZ(rv) extract32(rv, 11, 3)
+#define FIU_UMA_CFG_CMDSIZ(rv) extract32(rv, 10, 1)
+#define FIU_UMA_CFG_DBPCK(rv) extract32(rv, 6, 2)
+
+#define FIU_UMA_CTS_RDYIE BIT(25)
+#define FIU_UMA_CTS_RDYST BIT(24)
+#define FIU_UMA_CTS_SW_CS BIT(16)
+#define FIU_UMA_CTS_DEV_NUM(rv) extract32(rv, 8, 2)
+#define FIU_UMA_CTS_EXEC_DONE BIT(0)
+
+/*
+ * Returns the index of flash in the fiu->flash array. This corresponds to=
 the
+ * chip select ID of the flash.
+ */
+static int npcm7xx_fiu_cs_index(NPCM7xxFIUState *fiu, NPCM7xxFIUFlash *fla=
sh)
+{
+    int index =3D flash - fiu->flash;
+
+    g_assert(index >=3D 0 && index < fiu->cs_count);
+
+    return index;
+}
+
+/* Assert the chip select specified in the UMA Control/Status Register. */
+static void npcm7xx_fiu_select(NPCM7xxFIUState *s, int cs_id)
+{
+    trace_npcm7xx_fiu_select(DEVICE(s)->canonical_path, cs_id);
+
+    if (cs_id < s->cs_count) {
+        qemu_irq_lower(s->cs_lines[cs_id]);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: UMA to CS%d; this module has only %d chip selec=
ts",
+                      DEVICE(s)->canonical_path, cs_id, s->cs_count);
+        cs_id =3D -1;
+    }
+
+    s->active_cs =3D cs_id;
+}
+
+/* Deassert the currently active chip select. */
+static void npcm7xx_fiu_deselect(NPCM7xxFIUState *s)
+{
+    if (s->active_cs < 0) {
+        return;
+    }
+
+    trace_npcm7xx_fiu_deselect(DEVICE(s)->canonical_path, s->active_cs);
+
+    qemu_irq_raise(s->cs_lines[s->active_cs]);
+    s->active_cs =3D -1;
+}
+
+/* Direct flash memory read handler. */
+static uint64_t npcm7xx_fiu_flash_read(void *opaque, hwaddr addr,
+                                       unsigned int size)
+{
+    NPCM7xxFIUFlash *f =3D opaque;
+    NPCM7xxFIUState *fiu =3D f->fiu;
+    uint64_t value =3D 0;
+    uint32_t drd_cfg;
+    int dummy_cycles;
+    int i;
+
+    if (fiu->active_cs !=3D -1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: direct flash read with CS%d already active",
+                      DEVICE(fiu)->canonical_path, fiu->active_cs);
+    }
+
+    npcm7xx_fiu_select(fiu, npcm7xx_fiu_cs_index(fiu, f));
+
+    drd_cfg =3D fiu->regs[NPCM7XX_FIU_DRD_CFG];
+    ssi_transfer(fiu->spi, FIU_DRD_CFG_RDCMD(drd_cfg));
+
+    switch (FIU_DRD_CFG_ADDSIZ(drd_cfg)) {
+    case FIU_ADDSIZ_4BYTES:
+        ssi_transfer(fiu->spi, extract32(addr, 24, 8));
+        /* fall through */
+    case FIU_ADDSIZ_3BYTES:
+        ssi_transfer(fiu->spi, extract32(addr, 16, 8));
+        ssi_transfer(fiu->spi, extract32(addr, 8, 8));
+        ssi_transfer(fiu->spi, extract32(addr, 0, 8));
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad address size %d\n",
+                      DEVICE(fiu)->canonical_path, FIU_DRD_CFG_ADDSIZ(drd_=
cfg));
+        break;
+    }
+
+    /* Flash chip model expects one transfer per dummy bit, not byte */
+    dummy_cycles =3D
+        (FIU_DRD_CFG_DBW(drd_cfg) * 8) >> FIU_DRD_CFG_ACCTYPE(drd_cfg);
+    for (i =3D 0; i < dummy_cycles; i++) {
+        ssi_transfer(fiu->spi, 0);
+    }
+
+    for (i =3D 0; i < size; i++) {
+        value =3D deposit64(value, 8 * i, 8, ssi_transfer(fiu->spi, 0));
+    }
+
+    trace_npcm7xx_fiu_flash_read(DEVICE(fiu)->canonical_path, fiu->active_=
cs,
+                                 addr, size, value);
+
+    npcm7xx_fiu_deselect(fiu);
+
+    return value;
+}
+
+/* Direct flash memory write handler. */
+static void npcm7xx_fiu_flash_write(void *opaque, hwaddr addr, uint64_t v,
+                                    unsigned int size)
+{
+    NPCM7xxFIUFlash *f =3D opaque;
+    NPCM7xxFIUState *fiu =3D f->fiu;
+    uint32_t dwr_cfg;
+    int cs_id;
+    int i;
+
+    if (fiu->active_cs !=3D -1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: direct flash write with CS%d already active",
+                      DEVICE(fiu)->canonical_path, fiu->active_cs);
+    }
+
+    cs_id =3D npcm7xx_fiu_cs_index(fiu, f);
+    trace_npcm7xx_fiu_flash_write(DEVICE(fiu)->canonical_path, cs_id, addr=
,
+                                  size, v);
+    npcm7xx_fiu_select(fiu, cs_id);
+
+    dwr_cfg =3D fiu->regs[NPCM7XX_FIU_DWR_CFG];
+    ssi_transfer(fiu->spi, FIU_DWR_CFG_WRCMD(dwr_cfg));
+
+    switch (FIU_DWR_CFG_ADDSIZ(dwr_cfg)) {
+    case FIU_ADDSIZ_4BYTES:
+        ssi_transfer(fiu->spi, extract32(addr, 24, 8));
+        /* fall through */
+    case FIU_ADDSIZ_3BYTES:
+        ssi_transfer(fiu->spi, extract32(addr, 16, 8));
+        ssi_transfer(fiu->spi, extract32(addr, 8, 8));
+        ssi_transfer(fiu->spi, extract32(addr, 0, 8));
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad address size %d\n",
+                      DEVICE(fiu)->canonical_path, FIU_DWR_CFG_ADDSIZ(dwr_=
cfg));
+        break;
+    }
+
+    for (i =3D 0; i < size; i++) {
+        ssi_transfer(fiu->spi, extract64(v, i * 8, 8));
+    }
+
+    npcm7xx_fiu_deselect(fiu);
+}
+
+static const MemoryRegionOps npcm7xx_fiu_flash_ops =3D {
+    .read =3D npcm7xx_fiu_flash_read,
+    .write =3D npcm7xx_fiu_flash_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 8,
+        .unaligned =3D true,
+    },
+};
+
+/* Control register read handler. */
+static uint64_t npcm7xx_fiu_ctrl_read(void *opaque, hwaddr addr,
+                                      unsigned int size)
+{
+    hwaddr reg =3D addr / sizeof(uint32_t);
+    NPCM7xxFIUState *s =3D opaque;
+    uint32_t value;
+
+    if (reg < NPCM7XX_FIU_NR_REGS) {
+        value =3D s->regs[reg];
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: read from invalid offset 0x%" PRIx64 "\n",
+                      DEVICE(s)->canonical_path, addr);
+        value =3D 0;
+    }
+
+    trace_npcm7xx_fiu_ctrl_read(DEVICE(s)->canonical_path, addr, value);
+
+    return value;
+}
+
+/* Send the specified number of address bytes from the UMA address registe=
r. */
+static void send_address(SSIBus *spi, unsigned int addsiz, uint32_t addr)
+{
+    switch (addsiz) {
+    case 4:
+        ssi_transfer(spi, extract32(addr, 24, 8));
+        /* fall through */
+    case 3:
+        ssi_transfer(spi, extract32(addr, 16, 8));
+        /* fall through */
+    case 2:
+        ssi_transfer(spi, extract32(addr, 8, 8));
+        /* fall through */
+    case 1:
+        ssi_transfer(spi, extract32(addr, 0, 8));
+        /* fall through */
+    case 0:
+        break;
+    }
+}
+
+/* Send the number of dummy bits specified in the UMA config register. */
+static void send_dummy_bits(SSIBus *spi, uint32_t uma_cfg, uint32_t uma_cm=
d)
+{
+    unsigned int bits_per_clock =3D 1U << FIU_UMA_CFG_DBPCK(uma_cfg);
+    unsigned int i;
+
+    for (i =3D 0; i < FIU_UMA_CFG_DBSIZ(uma_cfg); i++) {
+        /* Use bytes 0 and 1 first, then keep repeating byte 2 */
+        unsigned int field =3D (i < 2) ? ((i + 1) * 8) : 24;
+        unsigned int j;
+
+        for (j =3D 0; j < 8; j +=3D bits_per_clock) {
+            ssi_transfer(spi, extract32(uma_cmd, field + j, bits_per_clock=
));
+        }
+    }
+}
+
+/* Perform a User-Mode Access transaction. */
+static void npcm7xx_fiu_uma_transaction(NPCM7xxFIUState *s)
+{
+    uint32_t uma_cts =3D s->regs[NPCM7XX_FIU_UMA_CTS];
+    uint32_t uma_cfg;
+    unsigned int i;
+
+    /* SW_CS means the CS is already forced low, so don't touch it. */
+    if (uma_cts & FIU_UMA_CTS_SW_CS) {
+        int cs_id =3D FIU_UMA_CTS_DEV_NUM(s->regs[NPCM7XX_FIU_UMA_CTS]);
+        npcm7xx_fiu_select(s, cs_id);
+    }
+
+    /* Send command, if present. */
+    uma_cfg =3D s->regs[NPCM7XX_FIU_UMA_CFG];
+    if (FIU_UMA_CFG_CMDSIZ(uma_cfg) > 0) {
+        ssi_transfer(s->spi, extract32(s->regs[NPCM7XX_FIU_UMA_CMD], 0, 8)=
);
+    }
+
+    /* Send address, if present. */
+    send_address(s->spi, FIU_UMA_CFG_ADDSIZ(uma_cfg),
+                 s->regs[NPCM7XX_FIU_UMA_ADDR]);
+
+    /* Write data, if present. */
+    for (i =3D 0; i < FIU_UMA_CFG_WDATSIZ(uma_cfg); i++) {
+        unsigned int reg =3D
+            (i < 16) ? (NPCM7XX_FIU_UMA_DW0 + i / 4) : NPCM7XX_FIU_UMA_DW3=
;
+        unsigned int field =3D (i % 4) * 8;
+
+        ssi_transfer(s->spi, extract32(s->regs[reg], field, 8));
+    }
+
+    /* Send dummy bits, if present. */
+    send_dummy_bits(s->spi, uma_cfg, s->regs[NPCM7XX_FIU_UMA_CMD]);
+
+    /* Read data, if present. */
+    for (i =3D 0; i < FIU_UMA_CFG_RDATSIZ(uma_cfg); i++) {
+        unsigned int reg =3D NPCM7XX_FIU_UMA_DR0 + i / 4;
+        unsigned int field =3D (i % 4) * 8;
+        uint8_t c;
+
+        c =3D ssi_transfer(s->spi, 0);
+        if (reg <=3D NPCM7XX_FIU_UMA_DR3) {
+            s->regs[reg] =3D deposit32(s->regs[reg], field, 8, c);
+        }
+    }
+
+    /* Again, don't touch CS if the user is forcing it low. */
+    if (uma_cts & FIU_UMA_CTS_SW_CS) {
+        npcm7xx_fiu_deselect(s);
+    }
+
+    /* RDYST means a command has completed since it was cleared. */
+    s->regs[NPCM7XX_FIU_UMA_CTS] |=3D FIU_UMA_CTS_RDYST;
+    /* EXEC_DONE means Execute Command / Not Done, so clear it here. */
+    s->regs[NPCM7XX_FIU_UMA_CTS] &=3D ~FIU_UMA_CTS_EXEC_DONE;
+}
+
+/* Control register write handler. */
+static void npcm7xx_fiu_ctrl_write(void *opaque, hwaddr addr, uint64_t v,
+                                   unsigned int size)
+{
+    hwaddr reg =3D addr / sizeof(uint32_t);
+    NPCM7xxFIUState *s =3D opaque;
+    uint32_t value =3D v;
+
+    trace_npcm7xx_fiu_ctrl_write(DEVICE(s)->canonical_path, addr, value);
+
+    switch (reg) {
+    case NPCM7XX_FIU_UMA_CFG:
+        if (s->regs[reg] & FIU_UMA_CFG_CMMLCK) {
+            value &=3D ~FIU_UMA_CFG_CMMLCK_MASK;
+            value |=3D (s->regs[reg] & FIU_UMA_CFG_CMMLCK_MASK);
+        }
+        /* fall through */
+    case NPCM7XX_FIU_DRD_CFG:
+    case NPCM7XX_FIU_DWR_CFG:
+        if (s->regs[reg] & NPCM7XX_FIU_CFG_LCK) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to locked register @ 0x%" PRIx64 "\n"=
,
+                          DEVICE(s)->canonical_path, addr);
+            return;
+        }
+        s->regs[reg] =3D value;
+        break;
+
+    case NPCM7XX_FIU_UMA_CTS:
+        if (value & FIU_UMA_CTS_RDYST) {
+            value &=3D ~FIU_UMA_CTS_RDYST;
+        } else {
+            value |=3D s->regs[reg] & FIU_UMA_CTS_RDYST;
+        }
+        if ((s->regs[reg] ^ value) & FIU_UMA_CTS_SW_CS) {
+            if (value & FIU_UMA_CTS_SW_CS) {
+                /*
+                 * Don't drop CS if there's a transfer in progress, or we'=
re
+                 * about to start one.
+                 */
+                if (!((value | s->regs[reg]) & FIU_UMA_CTS_EXEC_DONE)) {
+                    npcm7xx_fiu_deselect(s);
+                }
+            } else {
+                int cs_id =3D FIU_UMA_CTS_DEV_NUM(s->regs[NPCM7XX_FIU_UMA_=
CTS]);
+                npcm7xx_fiu_select(s, cs_id);
+            }
+        }
+        s->regs[reg] =3D value | (s->regs[reg] & FIU_UMA_CTS_EXEC_DONE);
+        if (value & FIU_UMA_CTS_EXEC_DONE) {
+            npcm7xx_fiu_uma_transaction(s);
+        }
+        break;
+
+    case NPCM7XX_FIU_UMA_DR0 ... NPCM7XX_FIU_UMA_DR3:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to read-only register @ 0x%" PRIx64 "\n",
+                      DEVICE(s)->canonical_path, addr);
+        return;
+
+    case NPCM7XX_FIU_PRT_CFG:
+    case NPCM7XX_FIU_PRT_CMD0 ... NPCM7XX_FIU_PRT_CMD9:
+        qemu_log_mask(LOG_UNIMP, "%s: PRT is not implemented\n", __func__)=
;
+        break;
+
+    case NPCM7XX_FIU_UMA_CMD:
+    case NPCM7XX_FIU_UMA_ADDR:
+    case NPCM7XX_FIU_UMA_DW0 ... NPCM7XX_FIU_UMA_DW3:
+    case NPCM7XX_FIU_CFG:
+        s->regs[reg] =3D value;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to invalid offset 0x%" PRIx64 "\n",
+                      DEVICE(s)->canonical_path, addr);
+        return;
+    }
+}
+
+static const MemoryRegionOps npcm7xx_fiu_ctrl_ops =3D {
+    .read =3D npcm7xx_fiu_ctrl_read,
+    .write =3D npcm7xx_fiu_ctrl_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4,
+        .unaligned =3D false,
+    },
+};
+
+static void npcm7xx_fiu_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxFIUState *s =3D NPCM7XX_FIU(obj);
+
+    trace_npcm7xx_fiu_enter_reset(DEVICE(obj)->canonical_path, type);
+
+    memset(s->regs, 0, sizeof(s->regs));
+
+    s->regs[NPCM7XX_FIU_DRD_CFG] =3D 0x0300100b;
+    s->regs[NPCM7XX_FIU_DWR_CFG] =3D 0x03000002;
+    s->regs[NPCM7XX_FIU_UMA_CFG] =3D 0x00000400;
+    s->regs[NPCM7XX_FIU_UMA_CTS] =3D 0x00010000;
+    s->regs[NPCM7XX_FIU_UMA_CMD] =3D 0x0000000b;
+    s->regs[NPCM7XX_FIU_PRT_CFG] =3D 0x00000400;
+    s->regs[NPCM7XX_FIU_CFG] =3D 0x0000000b;
+}
+
+static void npcm7xx_fiu_hold_reset(Object *obj)
+{
+    NPCM7xxFIUState *s =3D NPCM7XX_FIU(obj);
+    int i;
+
+    trace_npcm7xx_fiu_hold_reset(DEVICE(obj)->canonical_path);
+
+    for (i =3D 0; i < s->cs_count; i++) {
+        qemu_irq_raise(s->cs_lines[i]);
+    }
+}
+
+static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxFIUState *s =3D NPCM7XX_FIU(dev);
+    SysBusDevice *sbd =3D &s->parent;
+    int i;
+
+    if (s->cs_count <=3D 0) {
+        error_setg(errp, "%s: %d chip selects specified, need at least one=
",
+                   dev->canonical_path, s->cs_count);
+        return;
+    }
+
+    s->spi =3D ssi_create_bus(dev, "spi");
+    s->cs_lines =3D g_new0(qemu_irq, s->cs_count);
+    qdev_init_gpio_out_named(DEVICE(s), s->cs_lines, "cs", s->cs_count);
+    s->flash =3D g_new0(NPCM7xxFIUFlash, s->cs_count);
+
+    /*
+     * Register the control registers region first. It may be followed by =
one
+     * or more direct flash access regions.
+     */
+    memory_region_init_io(&s->mmio, OBJECT(s), &npcm7xx_fiu_ctrl_ops, s, "=
ctrl",
+                          NPCM7XX_FIU_CTRL_REGS_SIZE);
+    sysbus_init_mmio(sbd, &s->mmio);
+
+    for (i =3D 0; i < s->cs_count; i++) {
+        NPCM7xxFIUFlash *flash =3D &s->flash[i];
+        flash->fiu =3D s;
+        memory_region_init_io(&flash->direct_access, OBJECT(s),
+                              &npcm7xx_fiu_flash_ops, &s->flash[i], "flash=
",
+                              NPCM7XX_FIU_FLASH_WINDOW_SIZE);
+        sysbus_init_mmio(sbd, &flash->direct_access);
+    }
+}
+
+static const VMStateDescription vmstate_npcm7xx_fiu =3D {
+    .name =3D "npcm7xx-fiu",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_INT32(active_cs, NPCM7xxFIUState),
+        VMSTATE_UINT32_ARRAY(regs, NPCM7xxFIUState, NPCM7XX_FIU_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static Property npcm7xx_fiu_properties[] =3D {
+    DEFINE_PROP_INT32("cs-count", NPCM7xxFIUState, cs_count, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void npcm7xx_fiu_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    QEMU_BUILD_BUG_ON(NPCM7XX_FIU_REGS_END > NPCM7XX_FIU_NR_REGS);
+
+    dc->desc =3D "NPCM7xx Flash Interface Unit";
+    dc->realize =3D npcm7xx_fiu_realize;
+    dc->vmsd =3D &vmstate_npcm7xx_fiu;
+    rc->phases.enter =3D npcm7xx_fiu_enter_reset;
+    rc->phases.hold =3D npcm7xx_fiu_hold_reset;
+    device_class_set_props(dc, npcm7xx_fiu_properties);
+}
+
+static const TypeInfo npcm7xx_fiu_types[] =3D {
+    {
+        .name =3D TYPE_NPCM7XX_FIU,
+        .parent =3D TYPE_SYS_BUS_DEVICE,
+        .instance_size =3D sizeof(NPCM7xxFIUState),
+        .class_init =3D npcm7xx_fiu_class_init,
+    },
+};
+DEFINE_TYPES(npcm7xx_fiu_types);
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index cd74642034..f303c6bead 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -361,6 +361,7 @@ config NPCM7XX
     select ARM_GIC
     select PL310  # cache controller
     select SERIAL
+    select SSI
     select UNIMP
=20
 config FSL_IMX25
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
index f1f5c287d0..dee00c0da6 100644
--- a/hw/ssi/meson.build
+++ b/hw/ssi/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_smc.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-spi.c'))
+softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_fiu.c'))
 softmmu_ss.add(when: 'CONFIG_PL022', if_true: files('pl022.c'))
 softmmu_ss.add(when: 'CONFIG_SSI', if_true: files('ssi.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_SPI', if_true: files('stm32f2xx_spi=
.c'))
diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
index 0ea498de91..2f83ef833f 100644
--- a/hw/ssi/trace-events
+++ b/hw/ssi/trace-events
@@ -9,3 +9,14 @@ aspeed_smc_dma_checksum(uint32_t addr, uint32_t data) "0x%=
08x: 0x%08x"
 aspeed_smc_dma_rw(const char *dir, uint32_t flash_addr, uint32_t dram_addr=
, uint32_t size) "%s flash:@0x%08x dram:@0x%08x size:0x%08x"
 aspeed_smc_write(uint64_t addr,  uint32_t size, uint64_t data) "@0x%" PRIx=
64 " size %u: 0x%" PRIx64
 aspeed_smc_flash_select(int cs, const char *prefix) "CS%d %sselect"
+
+# npcm7xx_fiu.c
+
+npcm7xx_fiu_enter_reset(const char *id, int reset_type) "%s reset type: %d=
"
+npcm7xx_fiu_hold_reset(const char *id) "%s"
+npcm7xx_fiu_select(const char *id, int cs) "%s select CS%d"
+npcm7xx_fiu_deselect(const char *id, int cs) "%s deselect CS%d"
+npcm7xx_fiu_ctrl_read(const char *id, uint64_t addr, uint32_t data) "%s of=
fset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm7xx_fiu_ctrl_write(const char *id, uint64_t addr, uint32_t data) "%s o=
ffset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm7xx_fiu_flash_read(const char *id, int cs, uint64_t addr, unsigned int=
 size, uint64_t value) "%s[%d] offset: 0x%08" PRIx64 " size: %u value: 0x%"=
 PRIx64
+npcm7xx_fiu_flash_write(const char *id, int cs, uint64_t addr, unsigned in=
t size, uint64_t value) "%s[%d] offset: 0x%08" PRIx64 " size: %u value: 0x%=
" PRIx64
--=20
2.28.0.297.g1956fa8f8d-goog


