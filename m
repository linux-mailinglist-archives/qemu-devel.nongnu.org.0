Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B4157CABC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:38:45 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVRz-0004Q4-Ui
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEVJL-0004Jm-Oh
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:29:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEVJJ-0004pF-Oe
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658406583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewsIbER1SRBWS1JrbrcFLWG+2/3TGq+isiGbthcclPE=;
 b=Hen0wk3Hr8GWBGi1ZMjAg5UcpvnZGnpHJvZZPA/FsWu4sMlkFi+QhZFPHejU8M0sPwQc2c
 x4PpDnGIUgaBvaBfwachMjTL+DLi9WJYZtZYMO6ZTNsHs8hBc8Mi2wXDYpJYL4AdduoZuN
 Ju37Foweapj1GNypdwTPagrulWmH9UI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-2WFpAiUHMgiyE9HFIIbW-g-1; Thu, 21 Jul 2022 08:29:42 -0400
X-MC-Unique: 2WFpAiUHMgiyE9HFIIbW-g-1
Received: by mail-ed1-f70.google.com with SMTP id
 o13-20020a056402438d00b0043aa846b2d2so1027978edc.8
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 05:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ewsIbER1SRBWS1JrbrcFLWG+2/3TGq+isiGbthcclPE=;
 b=nyyxMo7UwzdMnt1KSK5ikax2Jmj6gSNRLVRHdeZy9oKBKAuk/lrG3+j4ya60d/wOmj
 ZmxH08QjZihIRYYJG57kexLC/dfwBchmuaXneLSc0t2AoqNUQYTDyTJU6JFsLTxmZqVY
 NW1fSwXtf+ZCzdT2nX6arQ000FZbPj9vk20g+444ot1wiF0ijG+ypg+VjjVfZvTSeI06
 Q7odEDEI6NFUbIBSmJMYJEK2qGPTdVvaXfaq04K38mS55f29uy7rwJ6NQcESQXNbqUkB
 okwrx7JRgpV1AzXYNDhUdnczH3ccDR1dFZJHbojaxUILLxoAvWLsRB6+12xAVDGIUbpR
 3Qrw==
X-Gm-Message-State: AJIora8wRe+j3MOjWw9K07hqmzfF+WAdw88XzYMAcHUkuXRQ1vX3hGAq
 EwYm0TnThlbjQROBxSPYcmUjH6KvAZ3OSkWMKJl/o7iGs3Kv0CnXF1irHc34M5knBMR97XwItFO
 p6l2yKkIEpeHGlPI9ZrnEoAVSbIq/ZPCTPDMEmiBGwIRH43DPYcKEUqMQN2alFSDunn8=
X-Received: by 2002:a05:6402:298a:b0:43a:76f8:a75c with SMTP id
 eq10-20020a056402298a00b0043a76f8a75cmr57480478edb.216.1658406581117; 
 Thu, 21 Jul 2022 05:29:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1soFEMbCX6i0FOnn8pjPd/ilMPIAt4W46t9+tl1AEDfquYVYy06fqhtcU3mYGxGyOsAxzuIEQ==
X-Received: by 2002:a05:6402:298a:b0:43a:76f8:a75c with SMTP id
 eq10-20020a056402298a00b0043a76f8a75cmr57480443edb.216.1658406580815; 
 Thu, 21 Jul 2022 05:29:40 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 l10-20020a170906938a00b006f3ef214daesm829380ejx.20.2022.07.21.05.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 05:29:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/4] hw/i386: extract PVH load to a separate function
Date: Thu, 21 Jul 2022 14:29:34 +0200
Message-Id: <20220721122937.729959-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721122937.729959-1-pbonzini@redhat.com>
References: <20220721122937.729959-1-pbonzini@redhat.com>
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

Only keep the code x86_load_linux the code that is relevant to the Linux
boot protocol.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/x86.c | 131 ++++++++++++++++++++++++++------------------------
 1 file changed, 69 insertions(+), 62 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6003b4b2df..449edb076e 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -763,6 +763,62 @@ static bool load_elfboot(const char *kernel_filename,
     return true;
 }
 
+static bool load_pvh(X86MachineState *x86ms, FWCfgState *fw_cfg, const char *kernel_filename,
+                     const char *initrd_filename, uint32_t initrd_max, const char *kernel_cmdline,
+                     size_t kernel_size, uint8_t *header)
+{
+    if (!load_elfboot(kernel_filename, kernel_size,
+                      header, pvh_start_addr, fw_cfg)) {
+        return false;
+    }
+
+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
+        strlen(kernel_cmdline) + 1);
+    fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
+
+    fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, sizeof(header));
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA,
+                     header, sizeof(header));
+
+    /* load initrd */
+    if (initrd_filename) {
+        GMappedFile *mapped_file;
+        gsize initrd_size;
+        gchar *initrd_data;
+        GError *gerr = NULL;
+
+        mapped_file = g_mapped_file_new(initrd_filename, false, &gerr);
+        if (!mapped_file) {
+            fprintf(stderr, "qemu: error reading initrd %s: %s\n",
+                    initrd_filename, gerr->message);
+            exit(1);
+        }
+        x86ms->initrd_mapped_file = mapped_file;
+
+        initrd_data = g_mapped_file_get_contents(mapped_file);
+        initrd_size = g_mapped_file_get_length(mapped_file);
+        if (initrd_size >= initrd_max) {
+            fprintf(stderr, "qemu: initrd is too large, cannot support."
+                    "(max: %"PRIu32", need %"PRId64")\n",
+                    initrd_max, (uint64_t)initrd_size);
+            exit(1);
+        }
+
+        hwaddr initrd_addr = (initrd_max - initrd_size) & ~4095;
+
+        fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
+        fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
+        fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data,
+                         initrd_size);
+    }
+
+    option_rom[nb_option_roms].bootindex = 0;
+    option_rom[nb_option_roms].name = "pvh.bin";
+    nb_option_roms++;
+
+    return true;
+}
+
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
@@ -774,7 +830,7 @@ void x86_load_linux(X86MachineState *x86ms,
     int dtb_size, setup_data_offset;
     uint32_t initrd_max;
     uint8_t header[8192], *setup, *kernel;
-    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0;
+    hwaddr real_addr, prot_addr, cmdline_addr;
     FILE *f;
     char *vmode;
     MachineState *machine = MACHINE(x86ms);
@@ -785,6 +841,8 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *kernel_cmdline = machine->kernel_cmdline;
     SevKernelLoaderContext sev_load_ctx = {};
 
+    initrd_max = x86ms->below_4g_mem_size - acpi_data_size - 1;
+
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
 
@@ -806,9 +864,7 @@ void x86_load_linux(X86MachineState *x86ms,
     }
 
     /* kernel protocol version */
-    if (ldl_p(header + 0x202) == 0x53726448) {
-        protocol = lduw_p(header + 0x206);
-    } else {
+    if (ldl_p(header + 0x202) != 0x53726448) {
         /*
          * This could be a multiboot kernel. If it is, let's stop treating it
          * like a Linux kernel.
@@ -826,58 +882,14 @@ void x86_load_linux(X86MachineState *x86ms,
          * If load_elfboot() is successful, populate the fw_cfg info.
          */
         if (pvh_enabled &&
-            load_elfboot(kernel_filename, kernel_size,
-                         header, pvh_start_addr, fw_cfg)) {
+            load_pvh(x86ms, fw_cfg, kernel_filename, initrd_filename,
+                     initrd_max, kernel_cmdline, kernel_size, header)) {
             fclose(f);
-
-            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
-                strlen(kernel_cmdline) + 1);
-            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
-
-            fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, sizeof(header));
-            fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA,
-                             header, sizeof(header));
-
-            /* load initrd */
-            if (initrd_filename) {
-                GMappedFile *mapped_file;
-                gsize initrd_size;
-                gchar *initrd_data;
-                GError *gerr = NULL;
-
-                mapped_file = g_mapped_file_new(initrd_filename, false, &gerr);
-                if (!mapped_file) {
-                    fprintf(stderr, "qemu: error reading initrd %s: %s\n",
-                            initrd_filename, gerr->message);
-                    exit(1);
-                }
-                x86ms->initrd_mapped_file = mapped_file;
-
-                initrd_data = g_mapped_file_get_contents(mapped_file);
-                initrd_size = g_mapped_file_get_length(mapped_file);
-                initrd_max = x86ms->below_4g_mem_size - acpi_data_size - 1;
-                if (initrd_size >= initrd_max) {
-                    fprintf(stderr, "qemu: initrd is too large, cannot support."
-                            "(max: %"PRIu32", need %"PRId64")\n",
-                            initrd_max, (uint64_t)initrd_size);
-                    exit(1);
-                }
-
-                initrd_addr = (initrd_max - initrd_size) & ~4095;
-
-                fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
-                fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
-                fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data,
-                                 initrd_size);
-            }
-
-            option_rom[nb_option_roms].bootindex = 0;
-            option_rom[nb_option_roms].name = "pvh.bin";
-            nb_option_roms++;
-
             return;
-        }
+            }
         protocol = 0;
+    } else  {
+        protocol = lduw_p(header + 0x206);
     }
 
     if (protocol < 0x200 || !(header[0x211] & 0x01)) {
@@ -914,17 +926,12 @@ void x86_load_linux(X86MachineState *x86ms,
          * support the 64-bit boot protocol (specifically the ext_ramdisk_image
          * field).
          *
-         * Therefore here just limit initrd_max to UINT32_MAX simply as well.
+         * Therefore here just limit initrd_max to the available memory below 4G.
          */
-        initrd_max = UINT32_MAX;
     } else if (protocol >= 0x203) {
-        initrd_max = ldl_p(header + 0x22c);
+        initrd_max = MIN(initrd_max, ldl_p(header + 0x22c));
     } else {
-        initrd_max = 0x37ffffff;
-    }
-
-    if (initrd_max >= x86ms->below_4g_mem_size - acpi_data_size) {
-        initrd_max = x86ms->below_4g_mem_size - acpi_data_size - 1;
+        initrd_max = MIN(initrd_max, 0x37ffffff);
     }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
@@ -1008,7 +1015,7 @@ void x86_load_linux(X86MachineState *x86ms,
             exit(1);
         }
 
-        initrd_addr = (initrd_max - initrd_size) & ~4095;
+        hwaddr initrd_addr = (initrd_max - initrd_size) & ~4095;
 
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
-- 
2.36.1



