Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E262613ECF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:16:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbBu-0007d1-LW; Mon, 31 Oct 2022 16:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBr-0007bM-EK; Mon, 31 Oct 2022 16:15:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBp-0000gY-Ic; Mon, 31 Oct 2022 16:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WmhDBcUW9WRacFuVqQ9e646FOZuBckQuO9Vj70jaVXA=; b=1QKh5YjdGMXYcM6tI0iMU95FB2
 2qi7I01EdA3CYteCZFjm2RWTgStIeXaET21EwS54n91dBe6lNM4QzNkav+ZluTO4g56AK/4RjWJPw
 +VJiQBV+vNgUGdBFnp9I142KfHdkGtvzeojyNKmcQxRYmxwaX4ebpOvjwlgkx5F6F6tftyrjUlpCe
 r9/KD90rblB4fUbrN0c+ci5uLDAtDUxybo9Qokd4NFysqufbOUW7nts1eRg9COZbP0VQvnFD00Z8v
 BLTkuuL5X6Cf2HpE3J2WUXBBWnQOT6UkuLynxWOmzR5dwF5VpEe/WK4CVwpHOmgn52Grmnjvv7wAm
 Tobp1NNjyTgW2UHnXuQCNyfHO3VgbQDua/Yc4b4o+jeHjdK25HBj9mYoCtJhhi4liaghoz7wWeXXY
 aK8YXDTPVzq0JEOOC81iw1aSeBgV0ixjhGAyrQ5dNBdd1YHQI0l3Vpvmfcakd2/lI854RJs0ii/3q
 WKx+zqGRVDgioEc/L8jehTs+/kJBGGP7eclLxK5cFyzYf1aG6pczannPpcpA71HgzM6b9ccGaxtUn
 3/VKvQV+42bDIsSQr5lt5flUrFSsQLy/KGyX33ki8uthLQ885TUUQYmXcLTi9HgsAg4eClWC8RMhI
 YITelzlJiy8l8xJNjvvY5yX9dBPKAqUCsjW4bUDaQ=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBf-0003Dd-4t; Mon, 31 Oct 2022 20:15:15 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:23 +0000
Message-Id: <20221031201435.677168-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 02/14] mac_oldworld: Drop some more variables
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

Drop some more local variables additionally to commit b8df32555ce5 to
match clean ups done to mac_newwold in previous patch.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <1b9a448431d9b1198432151af0511316cfc20d21.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_oldworld.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 03732ca7ed..86512d31ad 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -80,14 +80,13 @@ static void ppc_heathrow_reset(void *opaque)
 
 static void ppc_heathrow_init(MachineState *machine)
 {
-    ram_addr_t ram_size = machine->ram_size;
     const char *bios_name = machine->firmware ?: PROM_FILENAME;
-    const char *boot_device = machine->boot_config.order;
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
     char *filename;
-    int i;
+    int i, bios_size;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
+    uint64_t bios_addr;
     uint32_t kernel_base, initrd_base, cmdline_base = 0;
     int32_t kernel_size, initrd_size;
     PCIBus *pci_bus;
@@ -97,16 +96,13 @@ static void ppc_heathrow_init(MachineState *machine)
     SysBusDevice *s;
     DeviceState *dev, *pic_dev, *grackle_dev;
     BusState *adb_bus;
-    uint64_t bios_addr;
-    int bios_size;
-    unsigned int smp_cpus = machine->smp.cpus;
     uint16_t ppc_boot_device;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     void *fw_cfg;
     uint64_t tbfreq;
 
     /* init CPUs */
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < machine->smp.cpus; i++) {
         cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
         env = &cpu->env;
 
@@ -116,9 +112,9 @@ static void ppc_heathrow_init(MachineState *machine)
     }
 
     /* allocate RAM */
-    if (ram_size > 2047 * MiB) {
+    if (machine->ram_size > 2047 * MiB) {
         error_report("Too much memory for this machine: %" PRId64 " MB, "
-                     "maximum 2047 MB", ram_size / MiB);
+                     "maximum 2047 MB", machine->ram_size / MiB);
         exit(1);
     }
 
@@ -165,12 +161,12 @@ static void ppc_heathrow_init(MachineState *machine)
                                NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
         if (kernel_size < 0)
             kernel_size = load_aout(machine->kernel_filename, kernel_base,
-                                    ram_size - kernel_base, bswap_needed,
-                                    TARGET_PAGE_SIZE);
+                                    machine->ram_size - kernel_base,
+                                    bswap_needed, TARGET_PAGE_SIZE);
         if (kernel_size < 0)
             kernel_size = load_image_targphys(machine->kernel_filename,
                                               kernel_base,
-                                              ram_size - kernel_base);
+                                              machine->ram_size - kernel_base);
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'",
                          machine->kernel_filename);
@@ -182,7 +178,7 @@ static void ppc_heathrow_init(MachineState *machine)
                                             KERNEL_GAP);
             initrd_size = load_image_targphys(machine->initrd_filename,
                                               initrd_base,
-                                              ram_size - initrd_base);
+                                              machine->ram_size - initrd_base);
             if (initrd_size < 0) {
                 error_report("could not load initial ram disk '%s'",
                              machine->initrd_filename);
@@ -201,19 +197,22 @@ static void ppc_heathrow_init(MachineState *machine)
         initrd_base = 0;
         initrd_size = 0;
         ppc_boot_device = '\0';
-        for (i = 0; boot_device[i] != '\0'; i++) {
-            /* TOFIX: for now, the second IDE channel is not properly
+        for (i = 0; machine->boot_config.order[i] != '\0'; i++) {
+            /*
+             * TOFIX: for now, the second IDE channel is not properly
              *        used by OHW. The Mac floppy disk are not emulated.
              *        For now, OHW cannot boot from the network.
              */
 #if 0
-            if (boot_device[i] >= 'a' && boot_device[i] <= 'f') {
-                ppc_boot_device = boot_device[i];
+            if (machine->boot_config.order[i] >= 'a' &&
+                machine->boot_config.order[i] <= 'f') {
+                ppc_boot_device = machine->boot_config.order[i];
                 break;
             }
 #else
-            if (boot_device[i] >= 'c' && boot_device[i] <= 'd') {
-                ppc_boot_device = boot_device[i];
+            if (machine->boot_config.order[i] >= 'c' &&
+                machine->boot_config.order[i] <= 'd') {
+                ppc_boot_device = machine->boot_config.order[i];
                 break;
             }
 #endif
@@ -266,7 +265,7 @@ static void ppc_heathrow_init(MachineState *machine)
     }
 
     /* Connect the heathrow PIC outputs to the 6xx bus */
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < machine->smp.cpus; i++) {
         switch (PPC_INPUT(env)) {
         case PPC_FLAGS_INPUT_6xx:
             /* XXX: we register only 1 output pin for heathrow PIC */
@@ -323,9 +322,9 @@ static void ppc_heathrow_init(MachineState *machine)
     sysbus_mmio_map(s, 0, CFG_ADDR);
     sysbus_mmio_map(s, 1, CFG_ADDR + 2);
 
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
-    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, ARCH_HEATHROW);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_base);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-- 
2.30.2


