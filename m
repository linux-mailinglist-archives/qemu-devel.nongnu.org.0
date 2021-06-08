Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8014F39EAC5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:35:36 +0200 (CEST)
Received: from localhost ([::1]:46712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPiR-0000ff-G0
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdf-0000gO-1R
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:39 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdc-0004Fk-13
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112235; x=1654648235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WGir6MKGoCctjoZj12oSeeFfOW8g5QcMDxdjuZfdi3g=;
 b=GS4/J2Z2e5zRNObtzqb0XIRGVZgeNr3Pq7AJ/GmIcKCqkE8DKNiyMXnw
 hCpMYzJ7SUKtSEawB/sn7Y6JVyUn0HGarPPpFdsOBJvFxFgFvJUizDJgf
 g/kqipB3DJGCJDxZbHR2wUWUraY3Ykat2ueiksfU+vpUOc0id8soOJvH/
 d/3y6kEDDelymBwOjGH0wvIx4Wn3hnBRyCcT6oZPecEJ22qm+92UEMnDV
 p5wuLd3PsilEvnQEr6fnBde1WCn0zLEWVb9frKNS8IFgDQeTOjnyzwcRE
 9jGV3ThB1g/Zh9gmOdHWwMOqbg9QV9rZ4h0nRhmsFhw2dgDfO8rd42ThT Q==;
IronPort-SDR: 6Iuy0NfV2ojDvp5KgWc6H/rUvEWHQOrXftksuPotECZS/xiXSkrwAPFssVJ+wAp7XdgrAmuNGW
 IrUgFBHpXG0xHAC4hdfB04n6cpfzS0zo1tNBjVArVLPo4mFdgV/q1XarktZ8IyTrEzbLIsAsfF
 6lXS7Dt5PysM0sVN9cA/PliXpfpS+MfVjhAe2BiuXsJ3sal0W/GzEy+2kt7Ze3MING2nq+3TtV
 pKLiLMFrRBJ8CKvDNTIFHdeyEGnUYK7QKgYLbIFzeAB7N1NHdbJL8e/LL/7d2shV8Pjm93xiL1
 k8c=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087358"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:34 +0800
IronPort-SDR: gtLQAeDw5U8Sl79nTJV/qQtFWRjte364mMt042HzWGrhnyIr+eV3RkS8u3wxrd9u9vlVOJoPGP
 lAbH+bYi5RPzPP6op4VrDBKUayKQ4nC5z7kN/bKLaUr52ssEyiiRPAOVSSSVGsRrus0l4WAfAk
 OIj0cJuhWZ1ppcbN3CwcGQQnXdDaj5CZhg39+w/TvBMCFmy02+OlRUPkzIJ39cvxKQCs4Qpiwx
 6GLTt5N2UG46w7FLXZrsEs4TrLEIxTIt4oo47Mw9MLxV1qLtpQ1dT3BuVd/2cJ3ZZehqP2KEfY
 mwfqUNz44RiSkOThqdsLVU4b
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:41 -0700
IronPort-SDR: mtRYDjFZ1duKLCmSMrRe/396oEbzS7GVGkJ/wmx+UD4GI8/BTlX9fYZZw8koK/f+RVCqwdK8Ag
 HHDFBjrhNaZuxZuJcyc/trQ9nFeZlaYtZtI/SSAWyjmyYHoqk5X0RqIBg58LJzGLa9jfGjQQqY
 LipmlMXtcF+eV6K6OcAM+RdeJkzpZTiHBILcq/htSCZ4AZlF56a31r2YzLW8SJrP46TWYCCe61
 qjr5fnUkgfShdJKekX7hE4sF1qA3cPtzSyvzDINgE9FcaKnbUZq5EFXQ11O5A6B/fSkANneZCZ
 5EQ=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:32 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 08/32] hw/riscv: microchip_pfsoc: Support direct kernel boot
Date: Tue,  8 Jun 2021 10:29:23 +1000
Message-Id: <20210608002947.1649775-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the Microchip Icicle Kit machine only supports using
'-bios' to load the HSS, and does not support '-kernel' for direct
kernel booting just like other RISC-V machines do. One has to use
U-Boot which is chain-loaded by HSS, to load a kernel for testing.
This is not so convenient.

Adding '-kernel' support together with the existing '-bios', we
follow the following table to select which payload we execute:

  -bios |    -kernel | payload
  ------+------------+--------
      N |          N | HSS
      Y | don't care | HSS
      N |          Y | kernel

This ensures backwards compatibility with how we used to expose
'-bios' to users. When '-kernel' is used for direct boot, '-dtb'
must be present to provide a valid device tree for the board,
as we don't generate device tree.

When direct kernel boot is used, the OpenSBI fw_dynamic BIOS image
is used to boot a payload like U-Boot or OS kernel directly.

Documentation is updated to describe the direct kernel boot. Note
as of today there is still no PolarFire SoC support in the upstream
Linux kernel hence the document does not include instructions for
that. It will be updated in the future.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210430071302.1489082-8-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/microchip-icicle-kit.rst | 30 ++++++--
 hw/riscv/microchip_pfsoc.c                 | 81 +++++++++++++++++++++-
 2 files changed, 103 insertions(+), 8 deletions(-)

diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
index e803131763..54ced661e3 100644
--- a/docs/system/riscv/microchip-icicle-kit.rst
+++ b/docs/system/riscv/microchip-icicle-kit.rst
@@ -31,17 +31,37 @@ Boot options
 
 The ``microchip-icicle-kit`` machine can start using the standard -bios
 functionality for loading its BIOS image, aka Hart Software Services (HSS_).
-HSS loads the second stage bootloader U-Boot from an SD card. It does not
-support direct kernel loading via the -kernel option. One has to load kernel
-from U-Boot.
+HSS loads the second stage bootloader U-Boot from an SD card. Then a kernel
+can be loaded from U-Boot. It also supports direct kernel booting via the
+-kernel option along with the device tree blob via -dtb. When direct kernel
+boot is used, the OpenSBI fw_dynamic BIOS image is used to boot a payload
+like U-Boot or OS kernel directly.
+
+The user provided DTB should have the following requirements:
+
+* The /cpus node should contain at least one subnode for E51 and the number
+  of subnodes should match QEMU's ``-smp`` option
+* The /memory reg size should match QEMU’s selected ram_size via ``-m``
+* Should contain a node for the CLINT device with a compatible string
+  "riscv,clint0"
+
+QEMU follows below truth table to select which payload to execute:
+
+=====  ========== =======
+-bios     -kernel payload
+=====  ========== =======
+    N           N     HSS
+    Y  don't care     HSS
+    N           Y  kernel
+=====  ========== =======
 
 The memory is set to 1537 MiB by default which is the minimum required high
 memory size by HSS. A sanity check on ram size is performed in the machine
 init routine to prompt user to increase the RAM size to > 1537 MiB when less
 than 1537 MiB ram is detected.
 
-Boot the machine
-----------------
+Running HSS
+-----------
 
 HSS 2020.12 release is tested at the time of writing. To build an HSS image
 that can be booted by the ``microchip-icicle-kit`` machine, type the following
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 6cbd17ebf2..eb8e79e0a1 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -51,6 +51,7 @@
 #include "hw/riscv/microchip_pfsoc.h"
 #include "hw/intc/sifive_clint.h"
 #include "hw/intc/sifive_plic.h"
+#include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 
 /*
@@ -460,6 +461,12 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
     MemoryRegion *mem_high = g_new(MemoryRegion, 1);
     MemoryRegion *mem_high_alias = g_new(MemoryRegion, 1);
     uint64_t mem_high_size;
+    hwaddr firmware_load_addr;
+    const char *firmware_name;
+    bool kernel_as_payload = false;
+    target_ulong firmware_end_addr, kernel_start_addr;
+    uint64_t kernel_entry;
+    uint32_t fdt_load_addr;
     DriveInfo *dinfo = drive_get_next(IF_SD);
 
     /* Sanity check on RAM size */
@@ -504,9 +511,6 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                 memmap[MICROCHIP_PFSOC_DRAM_HI_ALIAS].base,
                                 mem_high_alias);
 
-    /* Load the firmware */
-    riscv_find_and_load_firmware(machine, BIOS_FILENAME, RESET_VECTOR, NULL);
-
     /* Attach an SD card */
     if (dinfo) {
         CadenceSDHCIState *sdhci = &(s->soc.sdhci);
@@ -516,6 +520,77 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                 &error_fatal);
         qdev_realize_and_unref(card, sdhci->bus, &error_fatal);
     }
+
+    /*
+     * We follow the following table to select which payload we execute.
+     *
+     *  -bios |    -kernel | payload
+     * -------+------------+--------
+     *      N |          N | HSS
+     *      Y | don't care | HSS
+     *      N |          Y | kernel
+     *
+     * This ensures backwards compatibility with how we used to expose -bios
+     * to users but allows them to run through direct kernel booting as well.
+     *
+     * When -kernel is used for direct boot, -dtb must be present to provide
+     * a valid device tree for the board, as we don't generate device tree.
+     */
+
+    if (machine->kernel_filename && machine->dtb) {
+        int fdt_size;
+        machine->fdt = load_device_tree(machine->dtb, &fdt_size);
+        if (!machine->fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+
+        firmware_name = RISCV64_BIOS_BIN;
+        firmware_load_addr = memmap[MICROCHIP_PFSOC_DRAM_LO].base;
+        kernel_as_payload = true;
+    }
+
+    if (!kernel_as_payload) {
+        firmware_name = BIOS_FILENAME;
+        firmware_load_addr = RESET_VECTOR;
+    }
+
+    /* Load the firmware */
+    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
+                                                     firmware_load_addr, NULL);
+
+    if (kernel_as_payload) {
+        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
+                                                         firmware_end_addr);
+
+        kernel_entry = riscv_load_kernel(machine->kernel_filename,
+                                         kernel_start_addr, NULL);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_entry,
+                                           &start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-end", end);
+        }
+
+        if (machine->kernel_cmdline) {
+            qemu_fdt_setprop_string(machine->fdt, "/chosen",
+                                    "bootargs", machine->kernel_cmdline);
+        }
+
+        /* Compute the fdt load address in dram */
+        fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
+                                       machine->ram_size, machine->fdt);
+        /* Load the reset vector */
+        riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load_addr,
+                                  memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
+                                  memmap[MICROCHIP_PFSOC_ENVM_DATA].size,
+                                  kernel_entry, fdt_load_addr, machine->fdt);
+    }
 }
 
 static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


