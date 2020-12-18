Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2292DDE99
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:29:23 +0100 (CET)
Received: from localhost ([::1]:43444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq9GU-0004Fy-Dc
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8q3-0005dp-RF
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:03 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8q0-0002G4-3k
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271646; x=1639807646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y4LoVyuGcHBUO7rS4R6vtkpvvACOE/5MROLra+otT+A=;
 b=lr+qk8L2VT+lyJOWPNN04YvptNNYrbBpa99UvWY5+ZMluRDPeGDNtDN3
 vK7a4igx40nMDo15MWg0TG6AMngkVvwnHAl3pn1t+C+S67n4a/0d+GIwM
 5P3uLjzGznS+fYGwjn4iRm7dqTZaUgUmwUOuVqkwg5RH4XSqj1x/ZG4oh
 VSxdIBdqtql/LAPThsKcsbW18PlUTqd3xPqKpdZHmd97tkqLVP1UtNQH5
 dumVZaYNlkTTK2yCYBCPZHGNKJjszVobd+RJ1E2kjbXOmgQtB4Xts48SW
 +1vrBmo7i29yXKUSTEO0/vKM8jNrPEs6bxRTJf46tYiWumBWFqSilq4XW Q==;
IronPort-SDR: U3qbfjQIq7pPKQcTMtmKJJ5kzYppr9DBLgqPxSXmwTF+oel/uB9/TQU/+vKUPQJTwxLgwgM0dN
 26tOGJnfmRK4Im2uYtf9/ah+GG/mA71ErrGQ+qEfq0GfCnSxDtD/ePW7ITUjbqAUVRgp3LT0bz
 mfxxq7XmmjD/pcehtYGLgLF3rYK3APeOa023tSe8M+NRSFlBm7LCCejzfKkqWGn51PL6Yt0A+z
 qmozB6PYYLBnRiZzvIYxnrYrwxwXQdwrGsUPaF+iQ+BzkmPcd9QPr3RTxVMoUKJSkWPbwq5RDp
 AWU=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237060"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:30 +0800
IronPort-SDR: S1W/SFieIbKUHK81cFyzAsc3qnPTHI1HR6pOt5xlYbvBktj8aVnAVSLaxuz1fZUa+A/sg4nNVf
 u3GT8l0o9DQ07q8h2LPJnnadQ6tIDZXzvjC4K2RZ3F1t+uDmCa4tlAtiS6mRDlHruPXKNY8OlG
 98vKbM1G+UXpuIxOog7iBP5fu7/GiJgrE2fTx+uXAMc2NCue0IY/VNiLQ4PuFjXY4wQV7AFk6p
 LqYWhBmvSjZfL2xSVeuBVN7gLb483Pt2+sLWfKzIkqZ9MCYd90tgDcKjR2lag973uNQn8TKV/Y
 XVbvXLVPasFzn3MeNZgEaBJ0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:39 -0800
IronPort-SDR: +wKU6tLd6P5kbRAgw1hlHercz/jLiZJsOJoUDPpXMxOLiq5nb88XIZXdX7m4txUITuCBBQNwip
 RLymNlWqXPfpnkb5oT/mH/ZyaNj3uWfQhDhjN1lWStpJ7jMZ3bCiLdH9X9NR+umjybCRxXyFwD
 dkmJUV0gGxsVCsu394i9lut47jbBCZSu/okAiIHwir3wiUzbQsb51cuGQ2cvmMrzz0fLveRURE
 sw/kwj34MHM0pGPfY7s59qPIPafqSW+Go9U2H93GdELOHbDZ6IqDboNBB2jhwiWdCeViUP9O1y
 mlg=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:23 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 13/23] hw/riscv: spike: Remove compile time XLEN checks
Date: Thu, 17 Dec 2020 22:01:04 -0800
Message-Id: <20201218060114.3591217-14-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: ac75037dd58061486de421a0fcd9ac8a92014607.1608142916.git.alistair.francis@wdc.com
---
 hw/riscv/spike.c | 45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 875f371f0f..3e47e4579d 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -43,17 +43,6 @@
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
 
-/*
- * Not like other RISC-V machines that use plain binary bios images,
- * keeping ELF files here was intentional because BIN files don't work
- * for the Spike machine as HTIF emulation depends on ELF parsing.
- */
-#if defined(TARGET_RISCV32)
-# define BIOS_FILENAME "opensbi-riscv32-generic-fw_dynamic.elf"
-#else
-# define BIOS_FILENAME "opensbi-riscv64-generic-fw_dynamic.elf"
-#endif
-
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -64,7 +53,7 @@ static const struct MemmapEntry {
 };
 
 static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
-    uint64_t mem_size, const char *cmdline)
+                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     void *fdt;
     uint64_t addr, size;
@@ -115,11 +104,11 @@ static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
             cpu_name = g_strdup_printf("/cpus/cpu@%d",
                 s->soc[socket].hartid_base + cpu);
             qemu_fdt_add_subnode(fdt, cpu_name);
-#if defined(TARGET_RISCV32)
-            qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv32");
-#else
-            qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
-#endif
+            if (is_32_bit) {
+                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv32");
+            } else {
+                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
+            }
             name = riscv_isa_string(&s->soc[socket].harts[cpu]);
             qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
             g_free(name);
@@ -254,7 +243,8 @@ static void spike_board_init(MachineState *machine)
         main_mem);
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32_bit(machine));
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
@@ -262,9 +252,22 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
                                 mask_rom);
 
-    firmware_end_addr = riscv_find_and_load_firmware(machine, BIOS_FILENAME,
-                                                     memmap[SPIKE_DRAM].base,
-                                                     htif_symbol_callback);
+    /*
+     * Not like other RISC-V machines that use plain binary bios images,
+     * keeping ELF files here was intentional because BIN files don't work
+     * for the Spike machine as HTIF emulation depends on ELF parsing.
+     */
+    if (riscv_is_32_bit(machine)) {
+        firmware_end_addr = riscv_find_and_load_firmware(machine,
+                                    "opensbi-riscv32-generic-fw_dynamic.elf",
+                                    memmap[SPIKE_DRAM].base,
+                                    htif_symbol_callback);
+    } else {
+        firmware_end_addr = riscv_find_and_load_firmware(machine,
+                                    "opensbi-riscv64-generic-fw_dynamic.elf",
+                                    memmap[SPIKE_DRAM].base,
+                                    htif_symbol_callback);
+    }
 
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(machine,
-- 
2.29.2


