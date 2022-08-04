Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116BF589C6E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:17:34 +0200 (CEST)
Received: from localhost ([::1]:51920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJajD-0001yd-IW
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oJafI-0004Vs-1d
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oJafG-0001WU-26
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659618805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FlffSXGTH1Q1zeQCCvzm7FRGMN4S0vjWeT8Znbnk3TA=;
 b=OF1HjiNlPIpPH3jRYhC1Ej4or+y0jbmKaW93MWuL4MtC7paUXYcKnTpMWL1Mnzo9ZMs+lp
 bQtBwO+PTi+1170pn6vt+TPboAAK7LzaExD06MZtq0TI0+Tss+euB6ysbNw5pdXyUrqgqd
 fIm592q86//rR5GdC3AQQUlDHQY/+vA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-fLgXuJNcPwWxkDEvcE7Dew-1; Thu, 04 Aug 2022 09:13:24 -0400
X-MC-Unique: fLgXuJNcPwWxkDEvcE7Dew-1
Received: by mail-wr1-f70.google.com with SMTP id
 i16-20020adfaad0000000b002207af3c7b2so997014wrc.14
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 06:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=FlffSXGTH1Q1zeQCCvzm7FRGMN4S0vjWeT8Znbnk3TA=;
 b=H4BcoVO9MLEi5rfSJzlw0kE+/BCgt3RdeGgho+qyePplpT1c9NFREUE0Q0D+Z1oNLf
 xdqTcaeQyYJIdNy5Bea9QdRaF/TE4yOHl9aJ9ounWOAKvkrAD2rf01+Q2bVQFuI+SMYY
 0cdo5tI2oqzXheSiOshavkvutdDk8WAR6Gon9Mxw5etjEsrtE1zmAF950dwDtTM81QFu
 JYbFAA/qD7T3UGuSckVIFH94pGCfc/5P1ky+eRBYz5y/qjgUYMv+I+qfOwCi+lZjLM47
 HqUnQlhgJmfwQcnZ7vA/l2qbsmv/qzffVTJPfpkk+aDCI5EUF8CXaDKCwzXpmX53r7na
 VRcw==
X-Gm-Message-State: ACgBeo1Woo6h+7Go4ixap6QMc8ro3pldyb607i2vqq0vlfUfn2vXG6B/
 6UMRyJCoEOxjP6hSla1/Kwau1uqoiDjDwNpv4hDdCSCo3iZiXGXDeu4E4fSwnOoyOIEOjL6GuOG
 JpTa6MlSHYif25gkmfiJdwsrl8UzHE1JEgszb+ftv6iC28N6GER2mEGEHDvFQO9/vBfA=
X-Received: by 2002:a05:6000:1c11:b0:21f:5abc:e777 with SMTP id
 ba17-20020a0560001c1100b0021f5abce777mr1358176wrb.221.1659618802433; 
 Thu, 04 Aug 2022 06:13:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4XEyV68RDdREyt182mnbs7ellGsdMEoLmLrLVe5W7x3NzYCzFmCv4aWSVmUnoweOmsrWKA8w==
X-Received: by 2002:a05:6000:1c11:b0:21f:5abc:e777 with SMTP id
 ba17-20020a0560001c1100b0021f5abce777mr1358156wrb.221.1659618802045; 
 Thu, 04 Aug 2022 06:13:22 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 be8-20020a05600c1e8800b003a3270735besm1343214wmb.28.2022.08.04.06.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 06:13:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH] pc: add property for Linux setup_data seed
Date: Thu,  4 Aug 2022 15:13:20 +0200
Message-Id: <20220804131320.395015-1-pbonzini@redhat.com>
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

Using a property makes it possible to use the normal compat property
mechanism instead of ad hoc code; it avoids parameter proliferation
in x86_load_linux; and allows shipping the code even if it is
disabled by default.

Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/microvm.c     |  2 +-
 hw/i386/pc.c          |  5 +++--
 hw/i386/pc_piix.c     |  2 --
 hw/i386/pc_q35.c      |  2 --
 hw/i386/x86.c         | 31 +++++++++++++++++++++++++++----
 include/hw/i386/pc.h  |  3 ---
 include/hw/i386/x86.h |  5 +++--
 7 files changed, 34 insertions(+), 16 deletions(-)

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
index 7280c02ce3..1a77f5f0f0 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -112,6 +112,7 @@ const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
 
 GlobalProperty pc_compat_6_2[] = {
     { "virtio-mem", "unplugged-inaccessible", "off" },
+    { TYPE_X86_MACHINE, "linuxboot-seed", "off" },
 };
 const size_t pc_compat_6_2_len = G_N_ELEMENTS(pc_compat_6_2);
 
@@ -796,7 +797,7 @@ void xen_load_linux(PCMachineState *pcms)
     rom_set_fw(fw_cfg);
 
     x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                   pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
+                   pcmc->pvh_enabled);
     for (i = 0; i < nb_option_roms; i++) {
         assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
                !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
@@ -1118,7 +1119,7 @@ void pc_memory_init(PCMachineState *pcms,
 
     if (linux_boot) {
         x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                       pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
+                       pcmc->pvh_enabled);
     }
 
     for (i = 0; i < nb_option_roms; i++) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a5c65c1c35..00c21f6e4d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -446,11 +446,9 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
 
 static void pc_i440fx_7_0_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_1_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
-    pcmc->legacy_no_rng_seed = true;
     pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 3a35193ff7..5bcf100b35 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -383,10 +383,8 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
 
 static void pc_q35_7_0_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_1_machine_options(m);
     m->alias = NULL;
-    pcmc->legacy_no_rng_seed = true;
     pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 050eedc0c8..3fbab258a9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -767,8 +767,7 @@ static bool load_elfboot(const char *kernel_filename,
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
-                    bool pvh_enabled,
-                    bool legacy_no_rng_seed)
+                    bool pvh_enabled)
 {
     bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
     uint16_t protocol;
@@ -786,7 +785,6 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
     SevKernelLoaderContext sev_load_ctx = {};
-    enum { RNG_SEED_LENGTH = 32 };
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -1076,7 +1074,8 @@ void x86_load_linux(X86MachineState *x86ms,
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    if (!legacy_no_rng_seed) {
+    if (x86ms->linuxboot_seed != ON_OFF_AUTO_OFF &&
+        (data.protocol >= 0x209 || x86ms->linuxboot_seed == ON_OFF_AUTO_ON)) {
         setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
         kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
         kernel = g_realloc(kernel, kernel_size);
@@ -1237,6 +1236,23 @@ static void x86_machine_set_smm(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
 }
 
+static void x86_machine_get_linuxboot_seed(Object *obj, Visitor *v, const char *name,
+                                           void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    OnOffAuto linuxboot_seed = x86ms->linuxboot_seed;
+
+    visit_type_OnOffAuto(v, name, &linuxboot_seed, errp);
+}
+
+static void x86_machine_set_linuxboot_seed(Object *obj, Visitor *v, const char *name,
+                                           void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &x86ms->linuxboot_seed, errp);
+}
+
 bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms)
 {
     if (x86ms->acpi == ON_OFF_AUTO_OFF) {
@@ -1387,6 +1403,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->acpi = ON_OFF_AUTO_AUTO;
     x86ms->pit = ON_OFF_AUTO_AUTO;
     x86ms->pic = ON_OFF_AUTO_AUTO;
+    x86ms->linuxboot_seed = ON_OFF_AUTO_AUTO;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
@@ -1426,6 +1443,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, X86_MACHINE_PIT,
         "Enable i8254 PIT");
 
+    object_class_property_add(oc, X86_MACHINE_LINUXBOOT_SEED, "OnOffAuto",
+        x86_machine_get_linuxboot_seed, x86_machine_set_linuxboot_seed,
+        NULL, NULL);
+    object_class_property_set_description(oc, X86_MACHINE_LINUXBOOT_SEED,
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
index 62fa5774f8..a27f4adbf8 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -70,6 +70,7 @@ struct X86MachineState {
     OnOffAuto acpi;
     OnOffAuto pit;
     OnOffAuto pic;
+    OnOffAuto linuxboot_seed;
 
     char *oem_id;
     char *oem_table_id;
@@ -94,6 +95,7 @@ struct X86MachineState {
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
+#define X86_MACHINE_LINUXBOOT_SEED      "linuxboot-seed"
 
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


