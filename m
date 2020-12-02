Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EC02CB74A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:35:42 +0100 (CET)
Received: from localhost ([::1]:53012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNbx-00085J-TC
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCJ-0002sW-VX
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCC-0003eg-6w
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQI7I0gG34Imiu7c+rei9Y5Qe+vOFaa9RX5lIPuz5dI=;
 b=Wd8e7CP0gS3htkrLk4MoL8N6dnNh2g/0+TZUizBlKxEvBpCK7h6DFaWWtdnaWsv9JyihBj
 gTSevwcwwgTSbTzn7FzhL3HVyXCmg0cMBLSrDLbGzHRhDX9myLt0bguP8K5MbZzShoNOUv
 TCxKFjo9WIamaESuOMWuwTPPCtHIaOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-crFlWO-cMnaRRChFucTegQ-1; Wed, 02 Dec 2020 03:09:01 -0500
X-MC-Unique: crFlWO-cMnaRRChFucTegQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7ACA803650
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B680F5C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 029/113] ppc: remove bios_name
Date: Wed,  2 Dec 2020 03:07:25 -0500
Message-Id: <20201202080849.4125477-30-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201026143028.3034018-11-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ppc/e500.c          | 4 ++--
 hw/ppc/mac_newworld.c  | 4 +---
 hw/ppc/mac_oldworld.c  | 4 +---
 hw/ppc/pnv.c           | 5 +----
 hw/ppc/ppc405_boards.c | 6 ++----
 hw/ppc/prep.c          | 4 +---
 hw/ppc/spapr.c         | 4 +---
 7 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index ae39b9358e..153a74c98c 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1035,7 +1035,7 @@ void ppce500_init(MachineState *machine)
      * -kernel to users but allows them to run through u-boot as well.
      */
     kernel_as_payload = false;
-    if (bios_name == NULL) {
+    if (machine->firmware == NULL) {
         if (machine->kernel_filename) {
             payload_name = machine->kernel_filename;
             kernel_as_payload = true;
@@ -1043,7 +1043,7 @@ void ppce500_init(MachineState *machine)
             payload_name = "u-boot.e500";
         }
     } else {
-        payload_name = bios_name;
+        payload_name = machine->firmware;
     }
 
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, payload_name);
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index f9a1cc8944..61c63819df 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -109,6 +109,7 @@ static void ppc_core99_reset(void *opaque)
 static void ppc_core99_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
+    const char *bios_name = machine->firmware ?: PROM_FILENAME;
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
@@ -161,9 +162,6 @@ static void ppc_core99_init(MachineState *machine)
                            &error_fatal);
     memory_region_add_subregion(get_system_memory(), PROM_BASE, bios);
 
-    if (!bios_name) {
-        bios_name = PROM_FILENAME;
-    }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
     if (filename) {
         /* Load OpenBIOS (ELF) */
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 6c59aa5601..11623e8e67 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -83,6 +83,7 @@ static void ppc_heathrow_reset(void *opaque)
 static void ppc_heathrow_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
+    const char *bios_name = machine->firmware ?: PROM_FILENAME;
     const char *boot_device = machine->boot_order;
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
@@ -130,9 +131,6 @@ static void ppc_heathrow_init(MachineState *machine)
                            &error_fatal);
     memory_region_add_subregion(get_system_memory(), PROM_BASE, bios);
 
-    if (!bios_name) {
-        bios_name = PROM_FILENAME;
-    }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
     if (filename) {
         /* Load OpenBIOS (ELF) */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 50ebd4a484..53a5121cab 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -713,6 +713,7 @@ static void pnv_chip_power10_pic_print_info(PnvChip *chip, Monitor *mon)
 
 static void pnv_init(MachineState *machine)
 {
+    const char *bios_name = machine->firmware ?: FW_FILE_NAME;
     PnvMachineState *pnv = PNV_MACHINE(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     char *fw_filename;
@@ -739,10 +740,6 @@ static void pnv_init(MachineState *machine)
     pnv->pnor = PNV_PNOR(dev);
 
     /* load skiboot firmware  */
-    if (bios_name == NULL) {
-        bios_name = FW_FILE_NAME;
-    }
-
     fw_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
     if (!fw_filename) {
         error_report("Could not find OPAL firmware '%s'", bios_name);
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 4687715b15..c867e46330 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -141,6 +141,7 @@ static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
 static void ref405ep_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    const char *bios_name = machine->firmware ?: BIOS_FILENAME;
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
@@ -206,8 +207,6 @@ static void ref405ep_init(MachineState *machine)
         memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
                                &error_fatal);
 
-        if (bios_name == NULL)
-            bios_name = BIOS_FILENAME;
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
         if (filename) {
             bios_size = load_image_size(filename,
@@ -425,6 +424,7 @@ static void taihu_cpld_init(MemoryRegion *sysmem, uint32_t base)
 static void taihu_405ep_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    const char *bios_name = machine->firmware ?: BIOS_FILENAME;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     char *filename;
@@ -475,8 +475,6 @@ static void taihu_405ep_init(MachineState *machine)
     } else
 #endif
     {
-        if (bios_name == NULL)
-            bios_name = BIOS_FILENAME;
         bios = g_new(MemoryRegion, 1);
         memory_region_init_rom(bios, NULL, "taihu_405ep.bios", BIOS_SIZE,
                                &error_fatal);
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 4a0cb434a6..c6b9d1ddcb 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -237,6 +237,7 @@ static int prep_set_cmos_checksum(DeviceState *dev, void *opaque)
 
 static void ibm_40p_init(MachineState *machine)
 {
+    const char *bios_name = machine->firmware ?: "openbios-ppc";
     CPUPPCState *env = NULL;
     uint16_t cmos_checksum;
     PowerPCCPU *cpu;
@@ -271,9 +272,6 @@ static void ibm_40p_init(MachineState *machine)
 
     /* PCI host */
     dev = qdev_new("raven-pcihost");
-    if (!bios_name) {
-        bios_name = "openbios-ppc";
-    }
     qdev_prop_set_string(dev, "bios-name", bios_name);
     qdev_prop_set_uint32(dev, "elf-machine", PPC_ELF_MACHINE);
     pcihost = SYS_BUS_DEVICE(dev);
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 12a012d9dd..cd8be98caf 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2657,6 +2657,7 @@ static void spapr_machine_init(MachineState *machine)
     SpaprMachineState *spapr = SPAPR_MACHINE(machine);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    const char *bios_name = machine->firmware ?: FW_FILE_NAME;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     PCIHostState *phb;
@@ -2980,9 +2981,6 @@ static void spapr_machine_init(MachineState *machine)
         }
     }
 
-    if (bios_name == NULL) {
-        bios_name = FW_FILE_NAME;
-    }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
     if (!filename) {
         error_report("Could not find LPAR firmware '%s'", bios_name);
-- 
2.26.2



