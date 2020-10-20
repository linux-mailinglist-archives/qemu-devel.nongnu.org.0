Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749C6291850
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Oct 2020 18:17:12 +0200 (CEST)
Received: from localhost ([::1]:50102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUBMt-0005ZP-IC
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 12:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUB6p-0002yT-Jt; Sun, 18 Oct 2020 12:00:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:60434
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUB6m-0004Y0-2N; Sun, 18 Oct 2020 12:00:35 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUB6j-0001FH-FR; Sun, 18 Oct 2020 17:00:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au, atar4qemu@gmail.com
Date: Sun, 18 Oct 2020 16:59:18 +0100
Message-Id: <20201018155919.21200-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201018155919.21200-1-mark.cave-ayland@ilande.co.uk>
References: <20201018155919.21200-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 12/13] mac_oldworld: Drop some variables
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Values not used frequently enough may not worth putting in a local
variable, especially with names almost as long as the original value
because that does not improve readability, to the contrary it makes it
harder to see what value is used. Drop a few such variables.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <d67bc8d914a366ca6822b5190c1308d31af5c9b3.1602805637.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_oldworld.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 1abf26b5b4..e34680f980 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -83,14 +83,11 @@ static void ppc_heathrow_reset(void *opaque)
 static void ppc_heathrow_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
-    const char *kernel_filename = machine->kernel_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
-    const char *initrd_filename = machine->initrd_filename;
     const char *boot_device = machine->boot_order;
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
     char *filename;
-    int linux_boot, i;
+    int i;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     uint32_t kernel_base, initrd_base, cmdline_base = 0;
     int32_t kernel_size, initrd_size;
@@ -109,8 +106,6 @@ static void ppc_heathrow_init(MachineState *machine)
     void *fw_cfg;
     uint64_t tbfreq;
 
-    linux_boot = (kernel_filename != NULL);
-
     /* init CPUs */
     for (i = 0; i < smp_cpus; i++) {
         cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
@@ -147,7 +142,7 @@ static void ppc_heathrow_init(MachineState *machine)
         bios_addr = (uint32_t)bios_addr;
 
         if (bios_size <= 0) {
-            /* or load binary ROM image */
+            /* or if could not load ELF try loading a binary ROM image */
             bios_size = load_image_targphys(filename, PROM_BASE, PROM_SIZE);
             bios_addr = PROM_BASE;
         }
@@ -160,7 +155,7 @@ static void ppc_heathrow_init(MachineState *machine)
         exit(1);
     }
 
-    if (linux_boot) {
+    if (machine->kernel_filename) {
         int bswap_needed;
 
 #ifdef BSWAP_NEEDED
@@ -169,29 +164,32 @@ static void ppc_heathrow_init(MachineState *machine)
         bswap_needed = 0;
 #endif
         kernel_base = KERNEL_LOAD_ADDR;
-        kernel_size = load_elf(kernel_filename, NULL,
+        kernel_size = load_elf(machine->kernel_filename, NULL,
                                translate_kernel_address, NULL, NULL, NULL,
                                NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
         if (kernel_size < 0)
-            kernel_size = load_aout(kernel_filename, kernel_base,
+            kernel_size = load_aout(machine->kernel_filename, kernel_base,
                                     ram_size - kernel_base, bswap_needed,
                                     TARGET_PAGE_SIZE);
         if (kernel_size < 0)
-            kernel_size = load_image_targphys(kernel_filename,
+            kernel_size = load_image_targphys(machine->kernel_filename,
                                               kernel_base,
                                               ram_size - kernel_base);
         if (kernel_size < 0) {
-            error_report("could not load kernel '%s'", kernel_filename);
+            error_report("could not load kernel '%s'",
+                         machine->kernel_filename);
             exit(1);
         }
         /* load initrd */
-        if (initrd_filename) {
-            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
-            initrd_size = load_image_targphys(initrd_filename, initrd_base,
+        if (machine->initrd_filename) {
+            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
+                                            KERNEL_GAP);
+            initrd_size = load_image_targphys(machine->initrd_filename,
+                                              initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
                 error_report("could not load initial ram disk '%s'",
-                             initrd_filename);
+                             machine->initrd_filename);
                 exit(1);
             }
             cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
@@ -343,9 +341,10 @@ static void ppc_heathrow_init(MachineState *machine)
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, ARCH_HEATHROW);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_base);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-    if (kernel_cmdline) {
+    if (machine->kernel_cmdline) {
         fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_CMDLINE, cmdline_base);
-        pstrcpy_targphys("cmdline", cmdline_base, TARGET_PAGE_SIZE, kernel_cmdline);
+        pstrcpy_targphys("cmdline", cmdline_base, TARGET_PAGE_SIZE,
+                         machine->kernel_cmdline);
     } else {
         fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_CMDLINE, 0);
     }
-- 
2.20.1


