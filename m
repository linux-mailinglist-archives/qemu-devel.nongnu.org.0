Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B8884660
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 09:53:39 +0200 (CEST)
Received: from localhost ([::1]:37866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvGlO-0008UO-6O
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 03:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36893)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdz-0001LR-HF
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 03:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdx-0008En-Ib
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 03:45:59 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37596)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvGdx-0008EJ-85; Wed, 07 Aug 2019 03:45:57 -0400
Received: by mail-pl1-x642.google.com with SMTP id b3so39518151plr.4;
 Wed, 07 Aug 2019 00:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=k/MAfYxDy/xn/xAFZ7zsPvNNLeZK97yMtxrB45BQ/Ec=;
 b=P6fX2EFUGkiOAzoCuUJH9dlipjcjusg9prLzdbr+8Z4HtTYXMAfS6J2SWd5py7ljTZ
 XPrKxLvWM5BL+KkYGNMQL1BzAiBV8mz9X6cWfYxHI5iNVw4mhQJ8nRRIs8dnyAAtmi3d
 oGePygd0pJyh2FWFFnSyO+Nr+1dCAYh9gLOU/CMDcCzim3mjT6CcKpP4GqPs+8e80DK7
 bDggrC6CxJpe7lvifserLVbukZunWXAHYOnixbC8auWZYtIASR7fTr8nLdlmfXVM7RKy
 X5hsAkl4yGuIkrrNaTd/bA0O7u/+93R+mZEC0PLRtiTrSrB06mrhDcIyoV26+BpcKeJX
 z+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=k/MAfYxDy/xn/xAFZ7zsPvNNLeZK97yMtxrB45BQ/Ec=;
 b=a4FdpW9fDSuKPcyZWLiHNS++T5xNRRM6uk5ZuaGqtogStjT4ZiIRo5nrxROmdDpTNT
 mT2Ax/2GN3qMmvPKaU6lcZ9pzQCIex0mcYVdeiwtd9VqimKMCi1xM7NXnxTnIqub1sCy
 lz97oFAWG16uHNtwytR7kcACZqGn2OAHFMCMnJPxPIx5uuX1ttePWds0twMTa+wD4vIW
 GveUkXpebh8BGB68lf2IfSQX9kxfxezevJvEGw1zj+jj2GuXkKaJS4QV+TLon6dzM3hR
 Lk8CCCSi7KAEifBTu4K1cRSO7HLgNbK6xVHHMMgQ/ROyst5S/Fst5ZCC2xkFrjDyBbUp
 ipKw==
X-Gm-Message-State: APjAAAXpgGu729W53WISJx6BTWNp/hU3JbpA0Xfw1Lu8Nq/zg9YlM1yk
 LPjgGe3Mn07AiAd8Yt94SQ8=
X-Google-Smtp-Source: APXvYqyN9OrJcs/crx7jqvFRkUZZJKB/DfSZvPJqpZLaf6RuhtfFF1A7nhJgIn2E0/jHptdnxGe2Sw==
X-Received: by 2002:a17:902:204:: with SMTP id 4mr6824493plc.178.1565163956439; 
 Wed, 07 Aug 2019 00:45:56 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l44sm20154449pje.29.2019.08.07.00.45.55
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 00:45:55 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 00:45:19 -0700
Message-Id: <1565163924-18621-24-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-devel] [PATCH v2 23/28] riscv: sifive_u: Fix broken GEM
 support
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

At present the GEM support in sifive_u machine is seriously broken.

- The GEM block register base was set to a weird number (0x100900FC),
  which for no way could work with the cadence_gem model in QEMU.
- The generated DT node for GEM has a "clocks-names" which is an
  invalid property name.

Not like other GEM variants, the FU540-specific GEM has a management
block to control 10/100/1000Mbps link speed changes, that is mapped
to 0x100a0000. We can simply map it into MMIO space without special
handling using create_unimplemented_device().

Update the GEM node compatible string to use the official name used
by the upstream Linux kernel, and add the management block reg base
& size to the <reg> property encoding.

Tested with upstream U-Boot and Linux kernel MACB drivers.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- use create_unimplemented_device() to create the GEM management
  block instead of sifive_mmio_emulate()
- add "phy-handle" property to the ethernet node

 hw/riscv/sifive_u.c         | 23 ++++++++++++++++++-----
 include/hw/riscv/sifive_u.h |  3 ++-
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 8218cdd..ce6eba5 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -3,6 +3,7 @@
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017 SiFive, Inc.
+ * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
  *
  * Provides a board compatible with the SiFive Freedom U SDK:
  *
@@ -11,6 +12,7 @@
  * 2) PLIC (Platform Level Interrupt Controller)
  * 3) PRCI (Power, Reset, Clock, Interrupt)
  * 4) OTP (One-Time Programmable) memory with stored serial number
+ * 5) GEM (Gigabit Ethernet Controller) and management block
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -38,6 +40,7 @@
 #include "hw/loader.h"
 #include "hw/sysbus.h"
 #include "hw/char/serial.h"
+#include "hw/misc/unimp.h"
 #include "target/riscv/cpu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_plic.h"
@@ -69,7 +72,8 @@ static const struct MemmapEntry {
     [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
     [SIFIVE_U_OTP] =      { 0x10070000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
-    [SIFIVE_U_GEM] =      { 0x100900FC,     0x2000 },
+    [SIFIVE_U_GEM] =      { 0x10090000,     0x2000 },
+    [SIFIVE_U_GEM_MGMT] = { 0x100a0000,     0x1000 },
 };
 
 #define SIFIVE_OTP_SERIAL   1
@@ -84,7 +88,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     char *nodename;
     char ethclk_names[] = "pclk\0hclk";
     uint32_t plic_phandle, prci_phandle, phandle = 1;
-    uint32_t hfclk_phandle, rtcclk_phandle;
+    uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -242,20 +246,25 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     g_free(cells);
     g_free(nodename);
 
+    phy_phandle = phandle++;
     nodename = g_strdup_printf("/soc/ethernet@%lx",
         (long)memmap[SIFIVE_U_GEM].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "cdns,macb");
+    qemu_fdt_setprop_string(fdt, nodename, "compatible",
+        "sifive,fu540-c000-gem");
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_GEM].base,
-        0x0, memmap[SIFIVE_U_GEM].size);
+        0x0, memmap[SIFIVE_U_GEM].size,
+        0x0, memmap[SIFIVE_U_GEM_MGMT].base,
+        0x0, memmap[SIFIVE_U_GEM_MGMT].size);
     qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
     qemu_fdt_setprop_string(fdt, nodename, "phy-mode", "gmii");
+    qemu_fdt_setprop_cell(fdt, nodename, "phy-handle", phy_phandle);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
-    qemu_fdt_setprop(fdt, nodename, "clocks-names", ethclk_names,
+    qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
         sizeof(ethclk_names));
     qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
     qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
@@ -264,6 +273,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     nodename = g_strdup_printf("/soc/ethernet@%lx/ethernet-phy@0",
         (long)memmap[SIFIVE_U_GEM].base);
     qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", phy_phandle);
     qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
     g_free(nodename);
 
@@ -456,6 +466,9 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem), 0, memmap[SIFIVE_U_GEM].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem), 0,
                        plic_gpios[SIFIVE_U_GEM_IRQ]);
+
+    create_unimplemented_device("riscv.sifive.u.gem-mgmt",
+        memmap[SIFIVE_U_GEM_MGMT].base, memmap[SIFIVE_U_GEM_MGMT].size);
 }
 
 static void riscv_sifive_u_machine_init(MachineClass *mc)
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 0461331..e92f1aa 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -56,7 +56,8 @@ enum {
     SIFIVE_U_UART1,
     SIFIVE_U_OTP,
     SIFIVE_U_DRAM,
-    SIFIVE_U_GEM
+    SIFIVE_U_GEM,
+    SIFIVE_U_GEM_MGMT
 };
 
 enum {
-- 
2.7.4


