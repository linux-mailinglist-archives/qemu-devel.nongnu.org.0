Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7326A7CA2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:29:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFx-0003Uj-N4; Thu, 02 Mar 2023 03:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFN-0002CI-Ot
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFK-0001zd-S7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BtzFadEwzXaromacvlD/2WEbU0qUeJEQQVk3445Qx0=;
 b=fUzhLUaa2D4DoWGi4XAPXAlCFFaQIgQwEno/HavhU8D+bL39bcnmds0pwc4QOik43AcadL
 ESglgVAwE2ptbav1oqyuKW4AJTTdpnp6ukVFgFSg3BVWUR/MHmG6spWCMLE99VCJhZtba/
 zKL1Bw6QWxyHSHXZgCToG7OU8zZNMaw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-P0qeczfnPVOzAafQs7M-VA-1; Thu, 02 Mar 2023 03:25:01 -0500
X-MC-Unique: P0qeczfnPVOzAafQs7M-VA-1
Received: by mail-wm1-f69.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so5482389wmj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745497;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2BtzFadEwzXaromacvlD/2WEbU0qUeJEQQVk3445Qx0=;
 b=UBHobzWMAtcTstMKQdQ6sOylebVu2fN0q05VLQWy81HsxWjyt7g4+VaFo0glOHzeiB
 EcQg4qfAoRNhYYzhcj2JHUVp7020ml9UxnrJzXWdA7tSVbN+4pyOhCmrRp31VrfaHTNN
 GfW05NRXla3h6V2zdpkG+50FSzG05cOPxznlb9wHxka8ddZVDm8Rg+VBnjV0OhiymqAw
 i62cP/5ujDaMLcFUTywEXsJp3z9S93szeXveWR9+P0lYOohW9yr/2gRmZunzNqDsIu6X
 YT9o9E6kQmz+Cc7IEsuQPvQ9Yrqred+nIx260dGgeCMjWZ9m3k5/5O9uU/LUFZhmZmy8
 ITdg==
X-Gm-Message-State: AO0yUKWbA4oYN4xhS4o1aAUpU5WfFiymjaN2ye8OHLBESCCw7VuaA5Qd
 MIQVgPO/yr76NtPM9/YbVXqNE3RoOKpRLAMH6hfCBeIAoaz8ZDvyKfMHTRAbbCTOFGm1+bzepJe
 8OY5FHHh9kXUFD9xM4CkDI/G5h/wibFCCeacEWr/LoObAOoOjJgeBbGxkGCmKGVAEPA==
X-Received: by 2002:a05:600c:538b:b0:3eb:2b88:8682 with SMTP id
 hg11-20020a05600c538b00b003eb2b888682mr7764266wmb.17.1677745497511; 
 Thu, 02 Mar 2023 00:24:57 -0800 (PST)
X-Google-Smtp-Source: AK7set8bYxYzSCJBY9VuU3cDsYCbY5QwIRb6tIvuqV4DkCd++JKR9yvoNvPMoRolSNCJl392yklWIw==
X-Received: by 2002:a05:600c:538b:b0:3eb:2b88:8682 with SMTP id
 hg11-20020a05600c538b00b003eb2b888682mr7764245wmb.17.1677745497239; 
 Thu, 02 Mar 2023 00:24:57 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 d6-20020a05600c3ac600b003e6efc0f91csm2026930wms.42.2023.03.02.00.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:24:56 -0800 (PST)
Date: Thu, 2 Mar 2023 03:24:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>, Dov Murik <dovmurik@linux.ibm.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 08/53] Revert "hw/i386: pass RNG seed via setup_data entry"
Message-ID: <20230302082343.560446-9-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This reverts commit 67f7e426e53833a5db75b0d813e8d537b8a75bd2.

Additionally to the automatic revert, I went over the code
and dropped all mentions of legacy_no_rng_seed manually,
effectively reverting a combination of 2 additional commits:

    commit ffe2d2382e5f1aae1abc4081af407905ef380311
    Author: Jason A. Donenfeld <Jason@zx2c4.com>
    Date:   Wed Sep 21 11:31:34 2022 +0200

        x86: re-enable rng seeding via SetupData

    commit 3824e25db1a84fadc50b88dfbe27047aa2f7f85d
    Author: Gerd Hoffmann <kraxel@redhat.com>
    Date:   Wed Aug 17 10:39:40 2022 +0200

        x86: disable rng seeding via setup_data

Fixes: 67f7e426e5 ("hw/i386: pass RNG seed via setup_data entry")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/hw/i386/pc.h  |  3 ---
 include/hw/i386/x86.h |  3 +--
 hw/i386/microvm.c     |  2 +-
 hw/i386/pc.c          |  4 ++--
 hw/i386/pc_piix.c     |  2 --
 hw/i386/pc_q35.c      |  2 --
 hw/i386/x86.c         | 26 ++++----------------------
 7 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 66e3d059ef..44b08554fa 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -127,9 +127,6 @@ struct PCMachineClass {
 
     /* create kvmclock device even when KVM PV features are not exposed */
     bool kvmclock_create_always;
-
-    /* skip passing an rng seed for legacy machines */
-    bool legacy_no_rng_seed;
 };
 
 #define TYPE_PC_MACHINE "generic-pc-machine"
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 890dfad23e..0b337a036c 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -123,8 +123,7 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
-                    bool pvh_enabled,
-                    bool legacy_no_rng_seed);
+                    bool pvh_enabled);
 
 bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
 bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 6680530555..3d606a20b4 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -328,7 +328,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     rom_set_fw(fw_cfg);
 
     if (machine->kernel_filename != NULL) {
-        x86_load_linux(x86ms, fw_cfg, 0, true, false);
+        x86_load_linux(x86ms, fw_cfg, 0, true);
     }
 
     if (mms->option_roms) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 992951c107..8b1ddc8d99 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -806,7 +806,7 @@ void xen_load_linux(PCMachineState *pcms)
     rom_set_fw(fw_cfg);
 
     x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                   pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
+                   pcmc->pvh_enabled);
     for (i = 0; i < nb_option_roms; i++) {
         assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
                !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
@@ -1126,7 +1126,7 @@ void pc_memory_init(PCMachineState *pcms,
 
     if (linux_boot) {
         x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                       pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
+                       pcmc->pvh_enabled);
     }
 
     for (i = 0; i < nb_option_roms; i++) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 126b6c11df..2f16011bab 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -477,9 +477,7 @@ DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
 
 static void pc_i440fx_7_1_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_2_machine_options(m);
-    pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 09004f3f1f..797ba347fd 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -395,9 +395,7 @@ DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
 
 static void pc_q35_7_1_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_2_machine_options(m);
-    pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
 }
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index ed161a3409..a33c879598 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -26,7 +26,6 @@
 #include "qemu/cutils.h"
 #include "qemu/units.h"
 #include "qemu/datadir.h"
-#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
 #include "qapi/clone-visitor.h"
@@ -772,8 +771,7 @@ static bool load_elfboot(const char *kernel_filename,
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
-                    bool pvh_enabled,
-                    bool legacy_no_rng_seed)
+                    bool pvh_enabled)
 {
     bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
     uint16_t protocol;
@@ -781,7 +779,7 @@ void x86_load_linux(X86MachineState *x86ms,
     int dtb_size, setup_data_offset;
     uint32_t initrd_max;
     uint8_t header[8192], *setup, *kernel;
-    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0, first_setup_data = 0;
+    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0;
     FILE *f;
     char *vmode;
     MachineState *machine = MACHINE(x86ms);
@@ -791,7 +789,6 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
     SevKernelLoaderContext sev_load_ctx = {};
-    enum { RNG_SEED_LENGTH = 32 };
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -1071,31 +1068,16 @@ void x86_load_linux(X86MachineState *x86ms,
         kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
         kernel = g_realloc(kernel, kernel_size);
 
+        stq_p(header + 0x250, prot_addr + setup_data_offset);
 
         setup_data = (struct setup_data *)(kernel + setup_data_offset);
-        setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = prot_addr + setup_data_offset;
+        setup_data->next = 0;
         setup_data->type = cpu_to_le32(SETUP_DTB);
         setup_data->len = cpu_to_le32(dtb_size);
 
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    if (!legacy_no_rng_seed) {
-        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
-        kernel = g_realloc(kernel, kernel_size);
-        setup_data = (struct setup_data *)(kernel + setup_data_offset);
-        setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = prot_addr + setup_data_offset;
-        setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
-        setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
-        qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
-    }
-
-    /* Offset 0x250 is a pointer to the first setup_data link. */
-    stq_p(header + 0x250, first_setup_data);
-
     /*
      * If we're starting an encrypted VM, it will be OVMF based, which uses the
      * efi stub for booting and doesn't require any values to be placed in the
-- 
MST


