Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0136E5EFBF5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:26:43 +0200 (CEST)
Received: from localhost ([::1]:39922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxJ3-0004bU-Ib
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQc-0003W1-7e
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQa-00033R-Ab
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXJPV458KsoAQpYLOg9NuX3miw29N/Vem+vkqg1lI8o=;
 b=AOPTv39SHzDg9WNvyx2wxPu/VMuBfmwJZLeWW3yuDx36OCm0PFIjQZtWW7c66LXr9riYZ0
 5X6lQ2iwRNB2SINrbE4AYBFqohWG1Uojnj3voeFwplHt+ocmb2rcFnkAfNGhWVNDV3UmLY
 dQSgV9ZlgJX2zH0s1BuUXDgOuIBjnV0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-N0lhw8JON_KNPQQi8iYCtQ-1; Thu, 29 Sep 2022 12:30:22 -0400
X-MC-Unique: N0lhw8JON_KNPQQi8iYCtQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 hr29-20020a1709073f9d00b0078333782c48so957192ejc.10
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GXJPV458KsoAQpYLOg9NuX3miw29N/Vem+vkqg1lI8o=;
 b=BQVb4dJ28yQolcKirzHQRh8bZpgQ62YFs4M04utkaa/YipP++Clqro0dohtKyiGhNd
 kpb80lcupsBYLDkUO3pPjkTRVGl8bd7sAMMj7hFaoxwSR7iOGREGhGLxxgMgC9ZufliA
 PqTYPX+yA3g9vgpPxiBlsdgaB0b6XdZ3yjjrucXHLRxkWBh7YI5Wydcmv2ezEWBUWi28
 OUtU4yyUe0MPsMa48cxTNIVqjBqDOmJYT0bBf7TKJpTq2oo0ypE8QvuwGXKqyEX3FJhe
 VPkFSUzd3+07WOzjt3/kP0wJ9tsQqPLhnF+VEEO1N/WlCWqgcJcJoKWmbOqsKoG1NBKD
 x7uw==
X-Gm-Message-State: ACrzQf2l/uh557cxt+WxLWN07f+SS3jOXc4fsdaTET/EazpECoDT7iDA
 i11JDdLhvd+ZIJqY+yKRwxtEcHNaan59ADhTk3xddaNDto9nJpAi/vgkYY5MSI3dKddjNPiLLCp
 8rcbyReoTQNpAD4NNGCjqJmJTHlsgZjNuVHkzBBPpXzUk6m7/fOLYp50jCD/kluBAC/o=
X-Received: by 2002:a17:906:730b:b0:782:2eaf:a4ad with SMTP id
 di11-20020a170906730b00b007822eafa4admr3534208ejc.27.1664469020711; 
 Thu, 29 Sep 2022 09:30:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM41cLHwyEicQ6la1cofzshj7UpArI71wKni2uD/g4cZQLypkaD6VIMaupBEZKcf+zNH10qUMQ==
X-Received: by 2002:a17:906:730b:b0:782:2eaf:a4ad with SMTP id
 di11-20020a170906730b00b007822eafa4admr3534180ejc.27.1664469020400; 
 Thu, 29 Sep 2022 09:30:20 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo5-20020a0564020b2500b0045546aa0a95sm4166996edb.52.2022.09.29.09.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [PULL 01/14] x86: return modified setup_data only if read as memory,
 not as file
Date: Thu, 29 Sep 2022 18:30:01 +0200
Message-Id: <20220929163014.16950-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

If setup_data is being read into a specific memory location, then
generally the setup_data address parameter is read first, so that the
caller knows where to read it into. In that case, we should return
setup_data containing the absolute addresses that are hard coded and
determined a priori. This is the case when kernels are loaded by BIOS,
for example. In contrast, when setup_data is read as a file, then we
shouldn't modify setup_data, since the absolute address will be wrong by
definition. This is the case when OVMF loads the image.

This allows setup_data to be used like normal, without crashing when EFI
tries to use it.

(As a small development note, strangely, fw_cfg_add_file_callback() was
exported but fw_cfg_add_bytes_callback() wasn't, so this makes that
consistent.)

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220921093134.2936487-1-Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/x86.c             | 46 ++++++++++++++++++++++++++++++---------
 hw/nvram/fw_cfg.c         | 12 +++++-----
 include/hw/nvram/fw_cfg.h | 22 +++++++++++++++++++
 3 files changed, 64 insertions(+), 16 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 050eedc0c8..96d205927e 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -37,6 +37,7 @@
 #include "sysemu/whpx.h"
 #include "sysemu/numa.h"
 #include "sysemu/replay.h"
+#include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/xen.h"
@@ -764,6 +765,24 @@ static bool load_elfboot(const char *kernel_filename,
     return true;
 }
 
+typedef struct SetupDataFixup {
+    void *pos;
+    hwaddr orig_val, new_val;
+    uint32_t addr;
+} SetupDataFixup;
+
+static void fixup_setup_data(void *opaque)
+{
+    SetupDataFixup *fixup = opaque;
+    stq_p(fixup->pos, fixup->new_val);
+}
+
+static void reset_setup_data(void *opaque)
+{
+    SetupDataFixup *fixup = opaque;
+    stq_p(fixup->pos, fixup->orig_val);
+}
+
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
@@ -1088,8 +1107,11 @@ void x86_load_linux(X86MachineState *x86ms,
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
     }
 
-    /* Offset 0x250 is a pointer to the first setup_data link. */
-    stq_p(header + 0x250, first_setup_data);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
+    sev_load_ctx.kernel_data = (char *)kernel;
+    sev_load_ctx.kernel_size = kernel_size;
 
     /*
      * If we're starting an encrypted VM, it will be OVMF based, which uses the
@@ -1099,16 +1121,20 @@ void x86_load_linux(X86MachineState *x86ms,
      * file the user passed in.
      */
     if (!sev_enabled()) {
+        SetupDataFixup *fixup = g_malloc(sizeof(*fixup));
+
         memcpy(setup, header, MIN(sizeof(header), setup_size));
+        /* Offset 0x250 is a pointer to the first setup_data link. */
+        fixup->pos = setup + 0x250;
+        fixup->orig_val = ldq_p(fixup->pos);
+        fixup->new_val = first_setup_data;
+        fixup->addr = cpu_to_le32(real_addr);
+        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_SETUP_ADDR, fixup_setup_data, NULL,
+                                  fixup, &fixup->addr, sizeof(fixup->addr), true);
+        qemu_register_reset(reset_setup_data, fixup);
+    } else {
+        fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
     }
-
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
-    sev_load_ctx.kernel_data = (char *)kernel;
-    sev_load_ctx.kernel_size = kernel_size;
-
-    fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
     sev_load_ctx.setup_data = (char *)setup;
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index d605f3f45a..564bda3395 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -692,12 +692,12 @@ static const VMStateDescription vmstate_fw_cfg = {
     }
 };
 
-static void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
-                                      FWCfgCallback select_cb,
-                                      FWCfgWriteCallback write_cb,
-                                      void *callback_opaque,
-                                      void *data, size_t len,
-                                      bool read_only)
+void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
+                               FWCfgCallback select_cb,
+                               FWCfgWriteCallback write_cb,
+                               void *callback_opaque,
+                               void *data, size_t len,
+                               bool read_only)
 {
     int arch = !!(key & FW_CFG_ARCH_LOCAL);
 
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 0e7a8bc7af..e4fef393be 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -117,6 +117,28 @@ struct FWCfgMemState {
  */
 void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t len);
 
+/**
+ * fw_cfg_add_bytes_callback:
+ * @s: fw_cfg device being modified
+ * @key: selector key value for new fw_cfg item
+ * @select_cb: callback function when selecting
+ * @write_cb: callback function after a write
+ * @callback_opaque: argument to be passed into callback function
+ * @data: pointer to start of item data
+ * @len: size of item data
+ * @read_only: is file read only
+ *
+ * Add a new fw_cfg item, available by selecting the given key, as a raw
+ * "blob" of the given size. The data referenced by the starting pointer
+ * is only linked, NOT copied, into the data structure of the fw_cfg device.
+ */
+void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
+                               FWCfgCallback select_cb,
+                               FWCfgWriteCallback write_cb,
+                               void *callback_opaque,
+                               void *data, size_t len,
+                               bool read_only);
+
 /**
  * fw_cfg_add_string:
  * @s: fw_cfg device being modified
-- 
2.37.3


