Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343432CB8C0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:26:40 +0100 (CET)
Received: from localhost ([::1]:34692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOPH-0005hO-5m
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNM5-0006cD-Nl
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNM1-0006wg-5x
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606897147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m1f6DdAT2v+ywJS2w/lHZHwG8I2CkIuiyqx6rrIAQjk=;
 b=XFMViasep+WYMNWI60ph/Thjl+Uqllga7HGpPAmNnLA1HS6WItcfrDqyObbGUfzmzeBUgr
 5k6AhXUtx39usPJaVZbSgARCi7tRzY1U+ofXDsJe8OCaHBlD65KaXl0IpO1UtIBZdA6YeT
 jkFhGtFW7HLeFHUQFb9HCNrcVhY7Tz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-6Atep95nMcGLLm9iHc595g-1; Wed, 02 Dec 2020 03:19:05 -0500
X-MC-Unique: 6Atep95nMcGLLm9iHc595g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E37B41084C82
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:19:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90DAB5D9C6;
 Wed,  2 Dec 2020 08:19:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/15] vl: make qemu_get_machine_opts static
Date: Wed,  2 Dec 2020 03:18:49 -0500
Message-Id: <20201202081854.4126071-11-pbonzini@redhat.com>
In-Reply-To: <20201202081854.4126071-1-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Machine options can be retrieved as properties of the machine object.
Encourage that by removing the "easy" accessor to machine options.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c     | 11 ++++-------
 hw/arm/boot.c           |  2 +-
 hw/microblaze/boot.c    |  9 ++++-----
 hw/nios2/boot.c         |  9 ++++-----
 hw/ppc/e500.c           |  5 ++---
 hw/ppc/spapr_nvdimm.c   |  4 ++--
 hw/ppc/virtex_ml507.c   |  2 +-
 hw/riscv/sifive_u.c     |  6 ++----
 hw/riscv/virt.c         |  6 ++----
 hw/xtensa/xtfpga.c      |  9 ++++-----
 include/sysemu/sysemu.h |  2 --
 softmmu/device_tree.c   |  2 +-
 softmmu/vl.c            |  2 +-
 13 files changed, 28 insertions(+), 41 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index baaa54249d..666b9ab96c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2013,7 +2013,6 @@ static int kvm_init(MachineState *ms)
     const KVMCapabilityInfo *missing_cap;
     int ret;
     int type = 0;
-    const char *kvm_type;
     uint64_t dirty_log_manual_caps;
 
     s = KVM_STATE(ms->accelerator);
@@ -2069,13 +2068,11 @@ static int kvm_init(MachineState *ms)
     }
     s->as = g_new0(struct KVMAs, s->nr_as);
 
-    kvm_type = qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
-    if (mc->kvm_type) {
+    if (object_property_find(OBJECT(current_machine), "kvm-type")) {
+        g_autofree char *kvm_type = object_property_get_str(OBJECT(current_machine),
+                                                            "kvm-type",
+                                                            &error_abort);
         type = mc->kvm_type(ms, kvm_type);
-    } else if (kvm_type) {
-        ret = -EINVAL;
-        fprintf(stderr, "Invalid argument kvm-type=%s\n", kvm_type);
-        goto err;
     }
 
     do {
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 4d9d47ba1c..e56c42ac22 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1299,7 +1299,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
     info->kernel_filename = ms->kernel_filename;
     info->kernel_cmdline = ms->kernel_cmdline;
     info->initrd_filename = ms->initrd_filename;
-    info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
+    info->dtb_filename = ms->dtb;
     info->dtb_limit = 0;
 
     /* Load the kernel.  */
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 6715ba2ff9..caaba1aa4c 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -34,6 +34,7 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
+#include "hw/boards.h"
 #include "hw/loader.h"
 #include "elf.h"
 #include "qemu/cutils.h"
@@ -116,16 +117,14 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
                             const char *dtb_filename,
                             void (*machine_cpu_reset)(MicroBlazeCPU *))
 {
-    QemuOpts *machine_opts;
     const char *kernel_filename;
     const char *kernel_cmdline;
     const char *dtb_arg;
     char *filename = NULL;
 
-    machine_opts = qemu_get_machine_opts();
-    kernel_filename = qemu_opt_get(machine_opts, "kernel");
-    kernel_cmdline = qemu_opt_get(machine_opts, "append");
-    dtb_arg = qemu_opt_get(machine_opts, "dtb");
+    kernel_filename = current_machine->kernel_filename;
+    kernel_cmdline = current_machine->kernel_cmdline;
+    dtb_arg = current_machine->dtb;
     /* default to pcbios dtb as passed by machine_init */
     if (!dtb_arg && dtb_filename) {
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 95a8697906..d9969ac148 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -39,6 +39,7 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
+#include "hw/boards.h"
 #include "hw/loader.h"
 #include "elf.h"
 
@@ -120,16 +121,14 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
                             const char *dtb_filename,
                             void (*machine_cpu_reset)(Nios2CPU *))
 {
-    QemuOpts *machine_opts;
     const char *kernel_filename;
     const char *kernel_cmdline;
     const char *dtb_arg;
     char *filename = NULL;
 
-    machine_opts = qemu_get_machine_opts();
-    kernel_filename = qemu_opt_get(machine_opts, "kernel");
-    kernel_cmdline = qemu_opt_get(machine_opts, "append");
-    dtb_arg = qemu_opt_get(machine_opts, "dtb");
+    kernel_filename = current_machine->kernel_filename;
+    kernel_cmdline = current_machine->kernel_cmdline;
+    dtb_arg = current_machine->dtb;
     /* default to pcbios dtb as passed by machine_init */
     if (!dtb_arg) {
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 6a64eb31ab..41dad2e583 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -343,9 +343,8 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
             pmc->pci_pio_base >> 32, pmc->pci_pio_base,
             0x0, 0x10000,
         };
-    QemuOpts *machine_opts = qemu_get_machine_opts();
-    const char *dtb_file = qemu_opt_get(machine_opts, "dtb");
-    const char *toplevel_compat = qemu_opt_get(machine_opts, "dt_compatible");
+    const char *dtb_file = machine->dtb;
+    const char *toplevel_compat = machine->dt_compatible;
 
     if (dtb_file) {
         char *filename;
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index a833a63b5e..84715a4d78 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -38,7 +38,6 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
 {
     const MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
     const MachineState *ms = MACHINE(hotplug_dev);
-    const char *nvdimm_opt = qemu_opt_get(qemu_get_machine_opts(), "nvdimm");
     g_autofree char *uuidstr = NULL;
     QemuUUID uuid;
     int ret;
@@ -57,10 +56,11 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
      * ensure that, if the user sets nvdimm=off, we error out
      * regardless of being 5.1 or newer.
      */
-    if (!ms->nvdimms_state->is_enabled && nvdimm_opt) {
+    if (!ms->nvdimms_state->is_enabled && ms->nvdimms_state->has_is_enabled) {
         error_setg(errp, "nvdimm device found but 'nvdimm=off' was set");
         return false;
     }
+    ms->nvdimms_state->is_enabled = true;
 
     if (object_property_get_int(OBJECT(nvdimm), NVDIMM_LABEL_SIZE_PROP,
                                 &error_abort) == 0) {
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 7f1bca928c..07fe49da0d 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -152,7 +152,7 @@ static int xilinx_load_device_tree(hwaddr addr,
     int r;
     const char *dtb_filename;
 
-    dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
+    dtb_filename = current_machine->dtb;
     if (dtb_filename) {
         fdt = load_device_tree(dtb_filename, &fdt_size);
         if (!fdt) {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2f19a9cda2..e7f6dc5fb3 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -100,14 +100,12 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     int cpu;
     uint32_t *cells;
     char *nodename;
-    const char *dtb_filename;
     char ethclk_names[] = "pclk\0hclk";
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
 
-    dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
-    if (dtb_filename) {
-        fdt = s->fdt = load_device_tree(dtb_filename, &s->fdt_size);
+    if (ms->dtb) {
+        fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
         if (!fdt) {
             error_report("load_device_tree() failed");
             exit(1);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 25cea7aa67..3cc18a76e7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -181,7 +181,6 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
 {
     void *fdt;
     int i, cpu, socket;
-    const char *dtb_filename;
     MachineState *mc = MACHINE(s);
     uint64_t addr, size;
     uint32_t *clint_cells, *plic_cells;
@@ -195,9 +194,8 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
-    dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
-    if (dtb_filename) {
-        fdt = s->fdt = load_device_tree(dtb_filename, &s->fdt_size);
+    if (mc->dtb) {
+        fdt = s->fdt = load_device_tree(mc->dtb, &s->fdt_size);
         if (!fdt) {
             error_report("load_device_tree() failed");
             exit(1);
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index b1470b88e6..7be53f1895 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -233,11 +233,10 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
     qemu_irq *extints;
     DriveInfo *dinfo;
     PFlashCFI01 *flash = NULL;
-    QemuOpts *machine_opts = qemu_get_machine_opts();
-    const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
-    const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
-    const char *dtb_filename = qemu_opt_get(machine_opts, "dtb");
-    const char *initrd_filename = qemu_opt_get(machine_opts, "initrd");
+    const char *kernel_filename = machine->kernel_filename;
+    const char *kernel_cmdline = machine->kernel_cmdline;
+    const char *dtb_filename = machine->dtb;
+    const char *initrd_filename = machine->initrd_filename;
     const unsigned system_io_size = 224 * MiB;
     uint32_t freq = 10000000;
     int n;
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 9b47cdca55..e8f463ff30 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -104,8 +104,6 @@ typedef void QEMUBootSetHandler(void *opaque, const char *boot_order,
 void qemu_register_boot_set(QEMUBootSetHandler *func, void *opaque);
 void qemu_boot_set(const char *boot_order, Error **errp);
 
-QemuOpts *qemu_get_machine_opts(void);
-
 bool defaults_enabled(void);
 
 void qemu_init(int argc, char **argv, char **envp);
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index b335dae707..b9a3ddc518 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -526,7 +526,7 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
 
 void qemu_fdt_dumpdtb(void *fdt, int size)
 {
-    const char *dumpdtb = qemu_opt_get(qemu_get_machine_opts(), "dumpdtb");
+    const char *dumpdtb = current_machine->dumpdtb;
 
     if (dumpdtb) {
         /* Dump the dtb to a file and quit */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4fece1b9db..0f7222af31 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -481,7 +481,7 @@ static QemuOptsList qemu_fw_cfg_opts = {
  *
  * Returns: machine options (never null).
  */
-QemuOpts *qemu_get_machine_opts(void)
+static QemuOpts *qemu_get_machine_opts(void)
 {
     return qemu_find_opts_singleton("machine");
 }
-- 
2.26.2



