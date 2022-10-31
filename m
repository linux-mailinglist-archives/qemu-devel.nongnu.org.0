Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E0B613EC9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:16:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbBs-0007bI-Ox; Mon, 31 Oct 2022 16:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBn-0007Xp-JP; Mon, 31 Oct 2022 16:15:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBk-0000eN-SV; Mon, 31 Oct 2022 16:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=guWU5Luib1m4GhydteaZuvSimSBJWGSheGMPNQi9ELw=; b=D3NbovFc7g9n4kgWzJSjIlVKLB
 DsE5yozhS1xu9B30AU3OBeuutdL5Adx+mIBmQReFOf8AG6+NnvjltEt6oX48dwdWiMihM+7EGKrZK
 x6wvFaGPIt2OAcXDiCeNuK0Qf4jJg4yg/XjGBBpr75/WUWZXQlC2y6RF/Z/oelJsIy1/fIKhDlgpJ
 ++/KsCCPQgREvQmLpZO6v3Jcnay+VSw29x6qyFXHS0DEwUzAD9G0yxU0kXQABKRCLyU06+/yb9AVs
 MyZnpmCgoP+t15MCxaF2WVBb4d3vrdcae3hgINlFEQajWznxUA1h1pwIDml95gXlZW/hpMTUnog1q
 u8pEZWrCHVRe1hhX6i/Yfr9T9vKpJN4Yl3nwO0pfXcK/5q5RA35rMeaKJSHeFC9+k8Nh2vZbNhYwU
 TYwxtVjAaO9la57i6/lM0xoy67Zfj20K8X/4r1T6jXU+lRoPGdCg28O619My0kB3GfUNHEEHy0PUM
 2z3aVSpHz2wqft2m1Sg8tGLXfmhnYJ7xblS94z8Jk0DvLi6UiXmp1Xgw3efeyFtzEkUaS8mKEcLw5
 FIR6z761eyP/SDzbfVvwxEsdq5A/oVIC7q23ibgCeWXMOJiC7nE3Pqpuih9xzf1Jrf6VeJxV9ZFN+
 uSHXaQ55iu0bs3q3fouovqQvdQITLhWBE9OmmJsb8=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBa-0003Dd-VV; Mon, 31 Oct 2022 20:15:11 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:22 +0000
Message-Id: <20221031201435.677168-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 01/14] mac_newworld: Drop some variables
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Values not used frequently enough may not worth putting in a local
variable, especially with names almost as long as the original value
because that does not improve readability, to the contrary it makes it
harder to see what value is used. Drop a few such variables. This is
the same clean up that was done for mac_oldworld in commit b8df32555ce5.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <a3ee09dea27af9685fd2ccd2f7ab40a813d6812f.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_newworld.c | 65 +++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index cf7eb72391..27e4e8d136 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -106,18 +106,13 @@ static void ppc_core99_reset(void *opaque)
 /* PowerPC Mac99 hardware initialisation */
 static void ppc_core99_init(MachineState *machine)
 {
-    ram_addr_t ram_size = machine->ram_size;
-    const char *bios_name = machine->firmware ?: PROM_FILENAME;
-    const char *kernel_filename = machine->kernel_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
-    const char *initrd_filename = machine->initrd_filename;
-    const char *boot_device = machine->boot_config.order;
     Core99MachineState *core99_machine = CORE99_MACHINE(machine);
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
     char *filename;
     IrqLines *openpic_irqs;
-    int linux_boot, i, j, k;
+    int i, j, k, ppc_boot_device, machine_arch, bios_size;
+    const char *bios_name = machine->firmware ?: PROM_FILENAME;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     hwaddr kernel_base, initrd_base, cmdline_base = 0;
     long kernel_size, initrd_size;
@@ -129,22 +124,16 @@ static void ppc_core99_init(MachineState *machine)
     MACIOIDEState *macio_ide;
     BusState *adb_bus;
     MacIONVRAMState *nvr;
-    int bios_size;
-    int ppc_boot_device;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     void *fw_cfg;
-    int machine_arch;
     SysBusDevice *s;
     DeviceState *dev, *pic_dev;
     DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = NULL;
     hwaddr nvram_addr = 0xFFF04000;
     uint64_t tbfreq;
-    unsigned int smp_cpus = machine->smp.cpus;
-
-    linux_boot = (kernel_filename != NULL);
 
     /* init CPUs */
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < machine->smp.cpus; i++) {
         cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
         env = &cpu->env;
 
@@ -184,7 +173,7 @@ static void ppc_core99_init(MachineState *machine)
         exit(1);
     }
 
-    if (linux_boot) {
+    if (machine->kernel_filename) {
         int bswap_needed;
 
 #ifdef BSWAP_NEEDED
@@ -194,29 +183,31 @@ static void ppc_core99_init(MachineState *machine)
 #endif
         kernel_base = KERNEL_LOAD_ADDR;
 
-        kernel_size = load_elf(kernel_filename, NULL,
+        kernel_size = load_elf(machine->kernel_filename, NULL,
                                translate_kernel_address, NULL, NULL, NULL,
                                NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
         if (kernel_size < 0)
-            kernel_size = load_aout(kernel_filename, kernel_base,
-                                    ram_size - kernel_base, bswap_needed,
-                                    TARGET_PAGE_SIZE);
+            kernel_size = load_aout(machine->kernel_filename, kernel_base,
+                                    machine->ram_size - kernel_base,
+                                    bswap_needed, TARGET_PAGE_SIZE);
         if (kernel_size < 0)
-            kernel_size = load_image_targphys(kernel_filename,
+            kernel_size = load_image_targphys(machine->kernel_filename,
                                               kernel_base,
-                                              ram_size - kernel_base);
+                                              machine->ram_size - kernel_base);
         if (kernel_size < 0) {
-            error_report("could not load kernel '%s'", kernel_filename);
+            error_report("could not load kernel '%s'",
+                         machine->kernel_filename);
             exit(1);
         }
         /* load initrd */
-        if (initrd_filename) {
+        if (machine->initrd_filename) {
             initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
-            initrd_size = load_image_targphys(initrd_filename, initrd_base,
-                                              ram_size - initrd_base);
+            initrd_size = load_image_targphys(machine->initrd_filename,
+                                              initrd_base,
+                                              machine->ram_size - initrd_base);
             if (initrd_size < 0) {
                 error_report("could not load initial ram disk '%s'",
-                             initrd_filename);
+                             machine->initrd_filename);
                 exit(1);
             }
             cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
@@ -235,9 +226,10 @@ static void ppc_core99_init(MachineState *machine)
         /* We consider that NewWorld PowerMac never have any floppy drive
          * For now, OHW cannot boot from the network.
          */
-        for (i = 0; boot_device[i] != '\0'; i++) {
-            if (boot_device[i] >= 'c' && boot_device[i] <= 'f') {
-                ppc_boot_device = boot_device[i];
+        for (i = 0; machine->boot_config.order[i] != '\0'; i++) {
+            if (machine->boot_config.order[i] >= 'c' &&
+                machine->boot_config.order[i] <= 'f') {
+                ppc_boot_device = machine->boot_config.order[i];
                 break;
             }
         }
@@ -254,8 +246,8 @@ static void ppc_core99_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), 0xf8000000,
                                 sysbus_mmio_get_region(s, 0));
 
-    openpic_irqs = g_new0(IrqLines, smp_cpus);
-    for (i = 0; i < smp_cpus; i++) {
+    openpic_irqs = g_new0(IrqLines, machine->smp.cpus);
+    for (i = 0; i < machine->smp.cpus; i++) {
         /* Mac99 IRQ connection between OpenPIC outputs pins
          * and PowerPC input pins
          */
@@ -398,7 +390,7 @@ static void ppc_core99_init(MachineState *machine)
     /* OpenPIC */
     s = SYS_BUS_DEVICE(pic_dev);
     k = 0;
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < machine->smp.cpus; i++) {
         for (j = 0; j < OPENPIC_OUTPUT_NB; j++) {
             sysbus_connect_irq(s, k++, openpic_irqs[i].irq[j]);
         }
@@ -480,15 +472,16 @@ static void ppc_core99_init(MachineState *machine)
     sysbus_mmio_map(s, 0, CFG_ADDR);
     sysbus_mmio_map(s, 1, CFG_ADDR + 2);
 
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
-    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, machine_arch);
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
2.30.2


