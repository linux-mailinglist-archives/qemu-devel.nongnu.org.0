Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC176A7C83
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:25:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeF4-00026O-Et; Thu, 02 Mar 2023 03:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeEz-00026E-NE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeEx-0001wu-K2
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fj0JjOh3EVaVcEff6iS06pouY7kJbuHeajzLUv4MEtw=;
 b=HLp2wSefH4caStLmaa2TZGm0lJZ2RAkNHf2gDm8+FbVrefzK/JO2ZLgPITujWUjgCIIwcm
 uI5KjBa5mdyl7dOMWVnv4m8UPvzm8DPTlpkJZvPhThk3fhf5mSPqX98WxZdgZHUzTBZzmv
 qLwrLxe96BNnUeNj2XJ4EwiiI8M0ukY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-6dPdk2YsM5mqh18t97q6vw-1; Thu, 02 Mar 2023 03:24:37 -0500
X-MC-Unique: 6dPdk2YsM5mqh18t97q6vw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so737341wms.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745475;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fj0JjOh3EVaVcEff6iS06pouY7kJbuHeajzLUv4MEtw=;
 b=JOKjSwfOJaxqYWFlSN7P7h/l9osVsGe0YPsZiiitx13IXOv/t8yLyW4RnGLyp7kZ/I
 2XYQSGZbgAoKfif3zde37IHLVpKBqfnpHIc8Wkhe5hGvaA16KOGMxtD+b1Tlm0h/wadN
 MlYzIP7Jy7ms5ChvE/5T9QDTQmXgWEiPqd2owfeSX7LXBFs3yX4UuJ4+QR1GCSAyZ7pP
 zm1rQ8IWzmLKSsAQLthVp0Answu9YK+RmitUQ8H1wf8r7mPlqVD+fRgCOAYFdbsVgIKh
 lUoNtixGV0/MBw4l7qucXMpkEeej8WE3+ebZ/Qs/MhftQslQWOuSTl7FSCJrQ489Je2n
 F3Ig==
X-Gm-Message-State: AO0yUKVUq6zCWiEGBXI+l8uo54Ue6pbhgRrCRcMlRCyNXq2aqnqERG9x
 pdYprrkgU4Shonze1UfTOoJ7LkSOpvPIK0BzaQRO40jtTzImCyilp4y1WwtRwtu0KtLk+yV6En1
 A22Hv5FOtU7PQwoWcwAFbVwr52GkfxpiX0dS/Tyc7iTI3QR1XyoV+R2vZL4Bgynj5Sg==
X-Received: by 2002:adf:ffcd:0:b0:2c5:5ff8:93e5 with SMTP id
 x13-20020adfffcd000000b002c55ff893e5mr6215423wrs.44.1677745475525; 
 Thu, 02 Mar 2023 00:24:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8T9xdi0GaOIIGTwJ/glmZxh4+3mXWLTewhuThwHQpWihUNp51fjO5hQyAkrS559z2Hy67Sgw==
X-Received: by 2002:adf:ffcd:0:b0:2c5:5ff8:93e5 with SMTP id
 x13-20020adfffcd000000b002c55ff893e5mr6215400wrs.44.1677745475278; 
 Thu, 02 Mar 2023 00:24:35 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 p2-20020adfe602000000b002c561805a4csm14923641wrm.45.2023.03.02.00.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:24:34 -0800 (PST)
Date: Thu, 2 Mar 2023 03:24:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>, Dov Murik <dovmurik@linux.ibm.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 02/53] Revert "x86: don't let decompressed kernel image
 clobber setup_data"
Message-ID: <20230302082343.560446-3-mst@redhat.com>
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

This reverts commit eac7a7791bb6d719233deed750034042318ffd56.

Fixes: eac7a7791b ("x86: don't let decompressed kernel image clobber setup_data")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/hw/i386/microvm.h |  5 ++--
 include/hw/nvram/fw_cfg.h |  9 -------
 hw/i386/microvm.c         | 15 ++++-------
 hw/i386/x86.c             | 52 ++++++++++++++++++---------------------
 hw/nvram/fw_cfg.c         |  9 -------
 5 files changed, 31 insertions(+), 59 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index e8af61f194..fad97a891d 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -50,9 +50,8 @@
  */
 
 /* Platform virtio definitions */
-#define VIRTIO_MMIO_BASE                0xfeb00000
-#define VIRTIO_CMDLINE_MAXLEN           64
-#define VIRTIO_CMDLINE_TOTAL_MAX_LEN    ((VIRTIO_CMDLINE_MAXLEN + 1) * 16)
+#define VIRTIO_MMIO_BASE      0xfeb00000
+#define VIRTIO_CMDLINE_MAXLEN 64
 
 #define GED_MMIO_BASE         0xfea00000
 #define GED_MMIO_BASE_MEMHP   (GED_MMIO_BASE + 0x100)
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 990dcdbb2e..2e503904dc 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -139,15 +139,6 @@ void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
                                void *data, size_t len,
                                bool read_only);
 
-/**
- * fw_cfg_read_bytes_ptr:
- * @s: fw_cfg device being modified
- * @key: selector key value for new fw_cfg item
- *
- * Reads an existing fw_cfg data pointer.
- */
-void *fw_cfg_read_bytes_ptr(FWCfgState *s, uint16_t key);
-
 /**
  * fw_cfg_add_string:
  * @s: fw_cfg device being modified
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 68c22016d2..6680530555 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -376,8 +376,7 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
     MicrovmMachineState *mms = MICROVM_MACHINE(machine);
     BusState *bus;
     BusChild *kid;
-    char *cmdline, *existing_cmdline;
-    size_t len;
+    char *cmdline;
 
     /*
      * Find MMIO transports with attached devices, and add them to the kernel
@@ -386,8 +385,7 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
      * Yes, this is a hack, but one that heavily improves the UX without
      * introducing any significant issues.
      */
-    existing_cmdline = fw_cfg_read_bytes_ptr(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA);
-    cmdline = g_strdup(existing_cmdline);
+    cmdline = g_strdup(machine->kernel_cmdline);
     bus = sysbus_get_default();
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
         DeviceState *dev = kid->child;
@@ -411,12 +409,9 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
         }
     }
 
-    len = strlen(cmdline);
-    if (len > VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(existing_cmdline)) {
-        fprintf(stderr, "qemu: virtio mmio cmdline too large, skipping\n");
-    } else {
-        memcpy(existing_cmdline, cmdline, len + 1);
-    }
+    fw_cfg_modify_i32(x86ms->fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(cmdline) + 1);
+    fw_cfg_modify_string(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA, cmdline);
+
     g_free(cmdline);
 }
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index c44846f47b..9b7476158c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -49,7 +49,6 @@
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "target/i386/sev.h"
-#include "hw/i386/microvm.h"
 
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/irq.h"
@@ -815,18 +814,12 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
-    char *kernel_cmdline;
+    const char *kernel_cmdline = machine->kernel_cmdline;
     SevKernelLoaderContext sev_load_ctx = {};
     enum { RNG_SEED_LENGTH = 32 };
 
-    /*
-     * Add the NUL terminator, some padding for the microvm cmdline fiddling
-     * hack, and then align to 16 bytes as a paranoia measure
-     */
-    cmdline_size = (strlen(machine->kernel_cmdline) + 1 +
-                    VIRTIO_CMDLINE_TOTAL_MAX_LEN + 16) & ~15;
-    /* Make a copy, since we might append arbitrary bytes to it later. */
-    kernel_cmdline = g_strndup(machine->kernel_cmdline, cmdline_size);
+    /* Align to 16 bytes as a paranoia measure */
+    cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
 
     /* load the kernel header */
     f = fopen(kernel_filename, "rb");
@@ -967,6 +960,12 @@ void x86_load_linux(X86MachineState *x86ms,
         initrd_max = x86ms->below_4g_mem_size - acpi_data_size - 1;
     }
 
+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
+    fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
+    sev_load_ctx.cmdline_data = (char *)kernel_cmdline;
+    sev_load_ctx.cmdline_size = strlen(kernel_cmdline) + 1;
+
     if (protocol >= 0x202) {
         stl_p(header + 0x228, cmdline_addr);
     } else {
@@ -1093,24 +1092,27 @@ void x86_load_linux(X86MachineState *x86ms,
             exit(1);
         }
 
-        setup_data_offset = cmdline_size;
-        cmdline_size += sizeof(SetupData) + dtb_size;
-        kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
-        setup_data = (void *)kernel_cmdline + setup_data_offset;
+        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
+        kernel_size = setup_data_offset + sizeof(SetupData) + dtb_size;
+        kernel = g_realloc(kernel, kernel_size);
+
+
+        setup_data = (SetupData *)(kernel + setup_data_offset);
         setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = cmdline_addr + setup_data_offset;
+        first_setup_data = prot_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_DTB);
         setup_data->len = cpu_to_le32(dtb_size);
+
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    if (!legacy_no_rng_seed && protocol >= 0x209) {
-        setup_data_offset = cmdline_size;
-        cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
-        kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
-        setup_data = (void *)kernel_cmdline + setup_data_offset;
+    if (!legacy_no_rng_seed) {
+        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
+        kernel_size = setup_data_offset + sizeof(SetupData) + RNG_SEED_LENGTH;
+        kernel = g_realloc(kernel, kernel_size);
+        setup_data = (SetupData *)(kernel + setup_data_offset);
         setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = cmdline_addr + setup_data_offset;
+        first_setup_data = prot_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
@@ -1121,12 +1123,6 @@ void x86_load_linux(X86MachineState *x86ms,
         fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     }
 
-    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, cmdline_size);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline, cmdline_size);
-    sev_load_ctx.cmdline_data = (char *)kernel_cmdline;
-    sev_load_ctx.cmdline_size = cmdline_size;
-
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
     sev_load_ctx.kernel_data = (char *)kernel;
@@ -1139,7 +1135,7 @@ void x86_load_linux(X86MachineState *x86ms,
      * kernel on the other side of the fw_cfg interface matches the hash of the
      * file the user passed in.
      */
-    if (!sev_enabled() && first_setup_data) {
+    if (!sev_enabled()) {
         SetupDataFixup *fixup = g_malloc(sizeof(*fixup));
 
         memcpy(setup, header, MIN(sizeof(header), setup_size));
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 432754eda4..a00881bc64 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -741,15 +741,6 @@ void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t len)
     fw_cfg_add_bytes_callback(s, key, NULL, NULL, NULL, data, len, true);
 }
 
-void *fw_cfg_read_bytes_ptr(FWCfgState *s, uint16_t key)
-{
-    int arch = !!(key & FW_CFG_ARCH_LOCAL);
-
-    key &= FW_CFG_ENTRY_MASK;
-    assert(key < fw_cfg_max_entry(s));
-    return s->entries[arch][key].data;
-}
-
 void fw_cfg_add_string(FWCfgState *s, uint16_t key, const char *value)
 {
     size_t sz = strlen(value) + 1;
-- 
MST


