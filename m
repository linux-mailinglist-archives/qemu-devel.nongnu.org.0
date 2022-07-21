Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424EB57D1FB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:51:38 +0200 (CEST)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZOj-0005lx-AA
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAK-00077G-Pg
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAI-0007h5-Vu
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o37c5iKXF9oD1uwTbUiDSCSU97u2DwwJin3hFWlrpsk=;
 b=CeeAHEBqusxOiNOoH4orDgleT3oyAYjbmBab+qLq6Yky2nyc2dZtIH1Fcujp1NHcLcgMMZ
 cpzfamDDqe31Kvgm5L4vGVG0+g+FA4ZCqRPA5RfmZA2k5t8WAZDDEoRuLSXQsHvFqwr1LA
 CZ4u3l8hnplWyZG4qlexAgGnoteo878=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-2xyqqzhIPtyJCprpOMRP6Q-1; Thu, 21 Jul 2022 12:36:41 -0400
X-MC-Unique: 2xyqqzhIPtyJCprpOMRP6Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 m13-20020a056402430d00b0043ac2f27d83so1447195edc.20
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o37c5iKXF9oD1uwTbUiDSCSU97u2DwwJin3hFWlrpsk=;
 b=jsolikFAqOcjmWLN85UhaBeV11Ejjx4y3+adM1a7iMNXhmrt36PrIXUzY6UGL1EeHa
 ZnGs6Qvjcuug7yqZL6UdKMn+R7dKG+uVtizWO1gGMZ5c3RSWthgWA9jvEByqDKhzKR1R
 c25DRywY50YlDySWiPeAo4RLwjKXQtXfq0NZsdBu1XQr7idT5CbGfXMzNtK1IsyL+82V
 Wy6rU4mayDIaALe94n6TxmsK/yAhFBfJI2dqcdJ3wpSU7woLnUl0niNF2A8GAuZRNKYF
 A98Wg3Pc5qvi4oLGYq3tDm/jtv1I/qR8eD8H0p3Psj/eTa/I/y93kUoFq7OU9Q3+pl74
 uxHA==
X-Gm-Message-State: AJIora/gJD1pdiC/9Q7gdDDeeIa8/golBF/veFyu+KpdBf3rwUgcMaI/
 FovElMUFSBgYpjhKf8djhGElprQu/wOagPGNi69t8mXz/LP6U7VwR0+36Va4lXJCywQlwZ9rSYL
 DrIjQPerGyj+Ol0LGVY/EmV20i8vZGKvFKbqDYmpLYzzUIXLfPSB8qGktDmH11LchdTQ=
X-Received: by 2002:a05:6402:510c:b0:43a:e041:a371 with SMTP id
 m12-20020a056402510c00b0043ae041a371mr56872096edd.424.1658421400097; 
 Thu, 21 Jul 2022 09:36:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDzMQHbAizCAt91N/nnX6dDTSlQnhGaLCowCfS/iUCzOL9eX4Qj/aUjCGKu5iH1QbHLzZBbg==
X-Received: by 2002:a05:6402:510c:b0:43a:e041:a371 with SMTP id
 m12-20020a056402510c00b0043ae041a371mr56872057edd.424.1658421399803; 
 Thu, 21 Jul 2022 09:36:39 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 l7-20020aa7d947000000b00437938c731fsm1265047eds.97.2022.07.21.09.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:36:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=83=C2=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Date: Thu, 21 Jul 2022 18:36:21 +0200
Message-Id: <20220721163621.761513-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721163621.761513-1-pbonzini@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Tiny machines optimized for fast boot time generally don't use EFI,
which means a random seed has to be supplied some other way. For this
purpose, Linux (â‰¥5.20) supports passing a seed in the setup_data table
with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
specialized bootloaders. The linked commit shows the upstream kernel
implementation.

At Paolo's request, we don't pass these to versioned machine types â‰¤7.0.

Link: https://git.kernel.org/tip/tip/c/68b8e9713c8
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220721125636.446842-1-Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/microvm.c                            |  2 +-
 hw/i386/pc.c                                 |  4 +--
 hw/i386/pc_piix.c                            |  2 ++
 hw/i386/pc_q35.c                             |  2 ++
 hw/i386/x86.c                                | 26 +++++++++++++++++---
 include/hw/i386/pc.h                         |  3 +++
 include/hw/i386/x86.h                        |  3 ++-
 include/standard-headers/asm-x86/bootparam.h |  1 +
 8 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index dc929727dc..7fe8cce03e 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -332,7 +332,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     rom_set_fw(fw_cfg);
 
     if (machine->kernel_filename != NULL) {
-        x86_load_linux(x86ms, fw_cfg, 0, true);
+        x86_load_linux(x86ms, fw_cfg, 0, true, false);
     }
 
     if (mms->option_roms) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 774cb2bf07..d2b5823ffb 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -796,7 +796,7 @@ void xen_load_linux(PCMachineState *pcms)
     rom_set_fw(fw_cfg);
 
     x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                   pcmc->pvh_enabled);
+                   pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
     for (i = 0; i < nb_option_roms; i++) {
         assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
                !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
@@ -992,7 +992,7 @@ void pc_memory_init(PCMachineState *pcms,
 
     if (linux_boot) {
         x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                       pcmc->pvh_enabled);
+                       pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
     }
 
     for (i = 0; i < nb_option_roms; i++) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a234989ac3..fbf9465318 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -438,9 +438,11 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
 
 static void pc_i440fx_7_0_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_1_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
+    pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index f96cbd04e2..12cc76aaf8 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -375,8 +375,10 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
 
 static void pc_q35_7_0_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_1_machine_options(m);
     m->alias = NULL;
+    pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
 }
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6003b4b2df..ecea25d249 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -26,6 +26,7 @@
 #include "qemu/cutils.h"
 #include "qemu/units.h"
 #include "qemu/datadir.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-visit-common.h"
@@ -766,7 +767,8 @@ static bool load_elfboot(const char *kernel_filename,
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
-                    bool pvh_enabled)
+                    bool pvh_enabled,
+                    bool legacy_no_rng_seed)
 {
     bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
     uint16_t protocol;
@@ -774,7 +776,7 @@ void x86_load_linux(X86MachineState *x86ms,
     int dtb_size, setup_data_offset;
     uint32_t initrd_max;
     uint8_t header[8192], *setup, *kernel;
-    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0;
+    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0, first_setup_data = 0;
     FILE *f;
     char *vmode;
     MachineState *machine = MACHINE(x86ms);
@@ -784,6 +786,7 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
     SevKernelLoaderContext sev_load_ctx = {};
+    enum { RNG_SEED_LENGTH = 32 };
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -1063,16 +1066,31 @@ void x86_load_linux(X86MachineState *x86ms,
         kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
         kernel = g_realloc(kernel, kernel_size);
 
-        stq_p(header + 0x250, prot_addr + setup_data_offset);
 
         setup_data = (struct setup_data *)(kernel + setup_data_offset);
-        setup_data->next = 0;
+        setup_data->next = cpu_to_le64(first_setup_data);
+        first_setup_data = prot_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_DTB);
         setup_data->len = cpu_to_le32(dtb_size);
 
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
+    if (!legacy_no_rng_seed) {
+        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
+        kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
+        kernel = g_realloc(kernel, kernel_size);
+        setup_data = (struct setup_data *)(kernel + setup_data_offset);
+        setup_data->next = cpu_to_le64(first_setup_data);
+        first_setup_data = prot_addr + setup_data_offset;
+        setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
+        setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
+        qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
+    }
+
+    /* Offset 0x250 is a pointer to the first setup_data link. */
+    stq_p(header + 0x250, first_setup_data);
+
     /*
      * If we're starting an encrypted VM, it will be OVMF based, which uses the
      * efi stub for booting and doesn't require any values to be placed in the
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b7735dccfc..2a8ffbcfa8 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -127,6 +127,9 @@ struct PCMachineClass {
 
     /* create kvmclock device even when KVM PV features are not exposed */
     bool kvmclock_create_always;
+
+    /* skip passing an rng seed for legacy machines */
+    bool legacy_no_rng_seed;
 };
 
 #define TYPE_PC_MACHINE "generic-pc-machine"
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 9089bdd99c..6bdf1f6ab2 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -123,7 +123,8 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
-                    bool pvh_enabled);
+                    bool pvh_enabled,
+                    bool legacy_no_rng_seed);
 
 bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
 bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
diff --git a/include/standard-headers/asm-x86/bootparam.h b/include/standard-headers/asm-x86/bootparam.h
index 072e2ed546..b2aaad10e5 100644
--- a/include/standard-headers/asm-x86/bootparam.h
+++ b/include/standard-headers/asm-x86/bootparam.h
@@ -10,6 +10,7 @@
 #define SETUP_EFI			4
 #define SETUP_APPLE_PROPERTIES		5
 #define SETUP_JAILHOUSE			6
+#define SETUP_RNG_SEED			9
 
 #define SETUP_INDIRECT			(1<<31)
 
-- 
2.36.1


