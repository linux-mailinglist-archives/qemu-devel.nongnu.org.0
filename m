Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A6758F145
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 19:11:31 +0200 (CEST)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLpEw-000570-Ef
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 13:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oLp3h-00069P-D8
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 12:59:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oLp3d-0007vE-Hl
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 12:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660150788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vWfja9cBaxq2zh5yzUV3fURlY02ZNUp4UAajDVn6azI=;
 b=c/8IN8nqlRPiTYoUCwttiN0bgp7RdBfBlPjNmJykvnq1Hg4izbQhW2R4RdIYpGiSTKeAUn
 Cu+4MJcYcVhjpuJGX/kAlPdx+uWRM+AIb2nV1WcmCwMvIEjiIRtj44H+Gum4VHxAtiHHUU
 HYIGCFdgPk+BIK/KGevXMzuUJgt8Byg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-x0B5d8RZPNWDjIrkj8e0hw-1; Wed, 10 Aug 2022 12:59:46 -0400
X-MC-Unique: x0B5d8RZPNWDjIrkj8e0hw-1
Received: by mail-ed1-f72.google.com with SMTP id
 n8-20020a05640205c800b00434fb0c150cso9522506edx.19
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 09:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=vWfja9cBaxq2zh5yzUV3fURlY02ZNUp4UAajDVn6azI=;
 b=pD4GiT6UdcV89SQXJdVdwUlGG5jtNuMGd11YXfzt+mDuDldNTUXI0fiYpJPnAo7djq
 qHTvBz3cyQ4Jdx9v6Eo+ZaTE+f/ABqIhbzue3EF4mOf2wYomx438sXitFsR2iFyEXlRN
 HH7s1qkwjRyHwK716UPbveG5qk9/nO2CWcuEG03w2Ns5R+H/px/TtkCTWK5csgYSyC6w
 rFuo95IiZXXEM5rbfceNyi9SgZeagptjqXLZydP2oZYxzSSMPyPqMzHtxzBIMyYiSzEP
 97fLpkKHBE4eXU4Niaer+b59VsJUwXYnRJ6pDJ/brDJuX1CGKNzNaYyKIB2N0Tb59P9V
 hplw==
X-Gm-Message-State: ACgBeo0teYeqTZBdwpQ/e00aIZVk8WwQdct8C313JXhoKWfuAOQjHzR/
 9NUJD9luCO/fvAQKbXTwpNCKDT+93og2vyDtWRnq7EXjG6n6QNvX0qAoYvcGM/6Pb4c9TMcMU9Y
 mDgKZeZwT9XOYHVgHv2leoF6PctY7MRhi+jq9jVVAKa8w7cqHsv7SdVrWXDQ2JcTTLOA=
X-Received: by 2002:a17:907:6e17:b0:731:2426:f606 with SMTP id
 sd23-20020a1709076e1700b007312426f606mr15127220ejc.162.1660150784429; 
 Wed, 10 Aug 2022 09:59:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ObVQqwqjJfdnsQsb2+0Iaa06ruxR6HHGyPwAcXqI4hQF3PPfQw2lEByukgMNn1yZlWazEuA==
X-Received: by 2002:a17:907:6e17:b0:731:2426:f606 with SMTP id
 sd23-20020a1709076e1700b007312426f606mr15127199ejc.162.1660150784039; 
 Wed, 10 Aug 2022 09:59:44 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a1709061ba200b0072f441a04a6sm2544951ejg.5.2022.08.10.09.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 09:59:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v3] pc: hide linuxboot RNG seed behind a machine property
Date: Wed, 10 Aug 2022 18:59:42 +0200
Message-Id: <20220810165942.104545-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OVMF does not support Linux setup_data and it is not clear how to
fix this, so disable the support for the random number seed for the
7.1 release.  Using a property allows shipping the code even if it is
disabled by default.  The property name has "x-" prepended because the
implementation might change in the future; migration from future versions
to QEMU 7.1 is only guaranteed to work if the property is left to its
default of "off".  At the time the property is enabled by default, the
"x-" can be removed.

Using a property has other advantages in general: it makes it possible
to use the normal compat property mechanism instead of ad hoc code, and
it avoids parameter proliferation in x86_load_linux.

Cc: Michael S. Tsirkin <mst@redhat.com>
Co-developed-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/microvm.c     |  2 +-
 hw/i386/pc.c          |  4 ++--
 hw/i386/pc_piix.c     |  2 +-
 hw/i386/pc_q35.c      |  2 +-
 hw/i386/x86.c         | 33 +++++++++++++++++++++++++++++----
 include/hw/i386/pc.h  |  3 ---
 include/hw/i386/x86.h |  5 +++--
 7 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 7fe8cce03e..dc929727dc 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -332,7 +332,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     rom_set_fw(fw_cfg);
 
     if (machine->kernel_filename != NULL) {
-        x86_load_linux(x86ms, fw_cfg, 0, true, false);
+        x86_load_linux(x86ms, fw_cfg, 0, true);
     }
 
     if (mms->option_roms) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7280c02ce3..4518f3c546 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -796,7 +796,7 @@ void xen_load_linux(PCMachineState *pcms)
     rom_set_fw(fw_cfg);
 
     x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                   pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
+                   pcmc->pvh_enabled);
     for (i = 0; i < nb_option_roms; i++) {
         assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
                !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
@@ -1118,7 +1118,7 @@ void pc_memory_init(PCMachineState *pcms,
 
     if (linux_boot) {
         x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                       pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
+                       pcmc->pvh_enabled);
     }
 
     for (i = 0; i < nb_option_roms; i++) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a5c65c1c35..1526b7e3fd 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -447,10 +447,10 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
 static void pc_i440fx_7_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
+
     pc_i440fx_7_1_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
-    pcmc->legacy_no_rng_seed = true;
     pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 3a35193ff7..c5b38edc65 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -384,9 +384,9 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
 static void pc_q35_7_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
+
     pc_q35_7_1_machine_options(m);
     m->alias = NULL;
-    pcmc->legacy_no_rng_seed = true;
     pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 050eedc0c8..01bad1972b 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -60,6 +60,8 @@
 #include CONFIG_DEVICES
 #include "kvm/kvm_i386.h"
 
+#define RNG_SEED_LENGTH 32
+
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
@@ -767,8 +769,7 @@ static bool load_elfboot(const char *kernel_filename,
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
-                    bool pvh_enabled,
-                    bool legacy_no_rng_seed)
+                    bool pvh_enabled)
 {
     bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
     uint16_t protocol;
@@ -786,7 +787,6 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
     SevKernelLoaderContext sev_load_ctx = {};
-    enum { RNG_SEED_LENGTH = 32 };
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -1076,7 +1076,8 @@ void x86_load_linux(X86MachineState *x86ms,
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    if (!legacy_no_rng_seed) {
+    if (x86ms->linuxboot_randomness != ON_OFF_AUTO_OFF &&
+        (protocol >= 0x209 || x86ms->linuxboot_randomness == ON_OFF_AUTO_ON)) {
         setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
         kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
         kernel = g_realloc(kernel, kernel_size);
@@ -1237,6 +1238,23 @@ static void x86_machine_set_smm(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
 }
 
+static void x86_machine_get_linuxboot_randomness(Object *obj, Visitor *v, const char *name,
+                                           void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    OnOffAuto linuxboot_randomness = x86ms->linuxboot_randomness;
+
+    visit_type_OnOffAuto(v, name, &linuxboot_randomness, errp);
+}
+
+static void x86_machine_set_linuxboot_randomness(Object *obj, Visitor *v, const char *name,
+                                           void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &x86ms->linuxboot_randomness, errp);
+}
+
 bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms)
 {
     if (x86ms->acpi == ON_OFF_AUTO_OFF) {
@@ -1387,6 +1405,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->acpi = ON_OFF_AUTO_AUTO;
     x86ms->pit = ON_OFF_AUTO_AUTO;
     x86ms->pic = ON_OFF_AUTO_AUTO;
+    x86ms->linuxboot_randomness = ON_OFF_AUTO_OFF;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
@@ -1426,6 +1445,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, X86_MACHINE_PIT,
         "Enable i8254 PIT");
 
+    object_class_property_add(oc, X86_MACHINE_LINUXBOOT_RANDOMNESS, "OnOffAuto",
+        x86_machine_get_linuxboot_randomness, x86_machine_set_linuxboot_randomness,
+        NULL, NULL);
+    object_class_property_set_description(oc, X86_MACHINE_LINUXBOOT_RANDOMNESS,
+        "Pass random number seed to -kernel Linux image");
+
     object_class_property_add(oc, X86_MACHINE_PIC, "OnOffAuto",
                               x86_machine_get_pic,
                               x86_machine_set_pic,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 8435733bd6..9cc3f5d338 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -128,9 +128,6 @@ struct PCMachineClass {
 
     /* create kvmclock device even when KVM PV features are not exposed */
     bool kvmclock_create_always;
-
-    /* skip passing an rng seed for legacy machines */
-    bool legacy_no_rng_seed;
 };
 
 #define TYPE_PC_MACHINE "generic-pc-machine"
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 62fa5774f8..d7a2eb6f1c 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -70,6 +70,7 @@ struct X86MachineState {
     OnOffAuto acpi;
     OnOffAuto pit;
     OnOffAuto pic;
+    OnOffAuto linuxboot_randomness;
 
     char *oem_id;
     char *oem_table_id;
@@ -94,6 +95,7 @@ struct X86MachineState {
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
+#define X86_MACHINE_LINUXBOOT_RANDOMNESS "x-linuxboot-randomness"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
@@ -126,8 +128,7 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
-                    bool pvh_enabled,
-                    bool legacy_no_rng_seed);
+                    bool pvh_enabled);
 
 bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
 bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
-- 
2.37.1


