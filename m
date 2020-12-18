Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ED22DDE6C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:11:31 +0100 (CET)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8zC-0006Dt-W0
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8po-0005A7-W9
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:49 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pm-0002GJ-VX
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271626; x=1639807626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NRom57mWy/1ehb9v0plLMKp/sVJWe1c7hvvP+FK6PF4=;
 b=eNnvzpmFY3xS+LjbvbTJOmAvsYntzkoLyiC2JZ/pouUZHbAC5f9xP2Nh
 ZmdpaAvJtA4HSJlEw66wWqa0YQwNISNMIW2lAtw7/OqasWs6BwwBQdnZK
 tLvzFseWBsDGl9PDyGpZ9Jd2wjTeP9ih8PQjWPvZveLsRc7JubtTdreUb
 Pry2YnmQ4RGedKCWAHOz1T2mSnI6G2hA4FWlwAOzAQpdjy+foyQO5jr0V
 cDWsGXhus2s/+DJly6qdlz5bqZF8A298XYCaLuJ1Yz9Eq4tvib2KCcokf
 is23Qg7MxOPKQZ7uY0hLPtcOK/RdZqymZIaXFJSd+wik/TzgdHs2me5P1 g==;
IronPort-SDR: ze1HTAioctzqVrI8guYzaDp5E7hnNjHZaaG0pGHjcccFXobcsBkg7zGaFM+MnXB0ZYh4pTqvla
 ZiobCZbJh32OWrcnuF1CPlY1yslP2+OXgv/EGkEnTMdEeLFJMADr54trSYKobRpjfXshxLU6CF
 L220hl8Xu42U2/krHrH0X4qbeygl7gqZIrGUBQOJ0YLLI/RAblUfp5RaRAN7ax3Skim6hjEEj9
 a0I2bjNC9cXwFpvZg9oCqL3dJaFu3PEY0zdRDppHb2sKZFcq+s8K9uVzOY/i+5LUneIDTCAp22
 ePI=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237059"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:30 +0800
IronPort-SDR: fAfDTXVjrLnj4b/1MExhQkPYEUbPTo9XadzqGIVSzxPghOu5urbIGmMZRu3/PSl+DfIqcENdAT
 IDFVMNrLPVDYHPqadfv2emoeI0PdpTANT1I2m51QUWx4xeuy77qdEzdtcuiuWd+QQE7xICOXLL
 NU1xPtoNcSGPPCTRbGa2pm5b+cDjR3HfV9CzLUBEUk8KiKi2DaPhj2BYS2znIWyDm8GDKlhR7a
 L15t8R+2D9xytVYEGv7GxF7OShcRbQGoJPzPCMTyPm09tmqrb9SR+Hce4cGOdm9/1ywC9au0NG
 17BB+x6xANQT98+1ppGvyn+G
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:38 -0800
IronPort-SDR: oX0CGK2HJbMkOApiZQPmsOBAy0K+3zybLTlRW45QngRg1DkNNT54v285U+tIb3ZL8JgqNhBnAx
 qRDvNiKjHGjsAVr2Bu3Lj01qLZfyDS0LX4QbGVJ30t0R8jvzM2N/CUcfISrimc31XAK+8iU/O/
 2HXMpKraQVAZY/sFrE179GDVcPNtYFULCNC/ybcSw/SqQzfpqV96j8nwAfKCiMGYaSY4NhZ/cg
 wr2EQeS0sS82vmrNZaXcAG0yUo1BHAKuX4YHY8k4JpflAmuiiV8a6g5dZkm53CJl9o8azqEb9A
 tx0=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:22 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 12/23] hw/riscv: virt: Remove compile time XLEN checks
Date: Thu, 17 Dec 2020 22:01:03 -0800
Message-Id: <20201218060114.3591217-13-alistair.francis@wdc.com>
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
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: d7ca1aca672515e6a4aa0d41716238b055f3f25c.1608142916.git.alistair.francis@wdc.com
---
 hw/riscv/virt.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5377075869..9321d8eda5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -43,12 +43,6 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 
-#if defined(TARGET_RISCV32)
-# define BIOS_FILENAME "opensbi-riscv32-generic-fw_dynamic.bin"
-#else
-# define BIOS_FILENAME "opensbi-riscv64-generic-fw_dynamic.bin"
-#endif
-
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -177,7 +171,7 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
 }
 
 static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
-    uint64_t mem_size, const char *cmdline)
+                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     void *fdt;
     int i, cpu, socket;
@@ -240,11 +234,11 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
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
@@ -606,7 +600,8 @@ static void virt_machine_init(MachineState *machine)
         main_mem);
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32_bit(machine));
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
@@ -614,8 +609,15 @@ static void virt_machine_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
 
-    firmware_end_addr = riscv_find_and_load_firmware(machine, BIOS_FILENAME,
-                                                     start_addr, NULL);
+    if (riscv_is_32_bit(machine)) {
+        firmware_end_addr = riscv_find_and_load_firmware(machine,
+                                    "opensbi-riscv32-generic-fw_dynamic.bin",
+                                    start_addr, NULL);
+    } else {
+        firmware_end_addr = riscv_find_and_load_firmware(machine,
+                                    "opensbi-riscv64-generic-fw_dynamic.bin",
+                                    start_addr, NULL);
+    }
 
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(machine,
-- 
2.29.2


