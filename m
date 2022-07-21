Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C76957CAD2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:43:27 +0200 (CEST)
Received: from localhost ([::1]:55558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVWY-0002Ey-3e
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEVJN-0004Mb-FP
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:29:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEVJK-0004pd-7h
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658406585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nug0Z3uObNETTTT5YBKRKiT3PKhNyxP+xiqNdaE6mko=;
 b=MMnJ8NaefWECB6MCDubTnFuZy3l87ueOMmIyfsGoAAaSV1s5nxMe+YIj+PN/VsOf4RqcsS
 gY+Yp8y07hhMSJkD+hpnQhB3f+r1xbGG4rtjSsLiPi2i3Oa1jU9weG7MEkc78gkeG4SHnA
 0x8g7+JQ5yIhjaAI9IEI+ChGRKUFXnc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-Y9y2kbzJPfiakWLozGO6QA-1; Thu, 21 Jul 2022 08:29:44 -0400
X-MC-Unique: Y9y2kbzJPfiakWLozGO6QA-1
Received: by mail-ed1-f71.google.com with SMTP id
 x21-20020a05640226d500b0043abb7ac086so1019034edd.14
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 05:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nug0Z3uObNETTTT5YBKRKiT3PKhNyxP+xiqNdaE6mko=;
 b=fCf5IWsSRALPRXgHmYwegEuqwnTUuZZi2uE64/rgXR5jbx0Fo794PJah6+I6ShXWMP
 ioKCWMa16yRLJDyL/LopzrSEJqGag3lDfyvlNXT399BVh5oc/ZYY+Fpj6R+Cx0vuyXV0
 ApoJgU+sIB1KkJ8HXajTiMZ9wP/qaHxhrTb7cxyJSsWjMm6eK2JgKjcJv0Hh62Dn3nmX
 evaTdTdNCBdirrKpJKwZ/GiqFFIgG4WfSaUa9O2BHLj5Xn3pmL+qq0uBMYozcvm++AdT
 fNTdHbrzN5t9li9Im821CW9r+XYi1KXXtZpzF6qDbE+5sLls/8tVipZUQz4zf6iNRCnu
 Wfrw==
X-Gm-Message-State: AJIora/u7h+MhIFps3UzBKIfHbwFNHoNbm305bMzFN3oxIAps7aFXr9d
 ycQm6ZAD6mQ7hvCRwS6m0jkGu7IvA8+wq8VgHYbrcxRw+yIzQLa8bRnWFkAwaq131AS+CA+kOX3
 HzftbNwzZj+2u0Ax8JMdZwsyUcoVAOgwgkB+Ja1zPR900MzsXU5CNDO7oayhRABX2Ulk=
X-Received: by 2002:a17:907:7394:b0:72b:44ff:5cec with SMTP id
 er20-20020a170907739400b0072b44ff5cecmr42185982ejc.670.1658406582649; 
 Thu, 21 Jul 2022 05:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u7Sw7+S+1g33emtvfwu3W9S3QjvZAW5yq02oFVXSBZsrEdU/uJkpepb4z2yzwJk8JrETrtjA==
X-Received: by 2002:a17:907:7394:b0:72b:44ff:5cec with SMTP id
 er20-20020a170907739400b0072b44ff5cecmr42185942ejc.670.1658406582301; 
 Thu, 21 Jul 2022 05:29:42 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a50fa84000000b0043586bee560sm919681edr.68.2022.07.21.05.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 05:29:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/4] hw/i386: define a struct for Linux boot protocol data
Date: Thu, 21 Jul 2022 14:29:35 +0200
Message-Id: <20220721122937.729959-3-pbonzini@redhat.com>
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

In preparation for moving parts of x86_load_linux to separate function,
define a struct with the data that needs to be passed back and forth.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/x86.c | 116 +++++++++++++++++++++++++++-----------------------
 1 file changed, 62 insertions(+), 54 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 449edb076e..253a6ff536 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -819,22 +819,30 @@ static bool load_pvh(X86MachineState *x86ms, FWCfgState *fw_cfg, const char *ker
     return true;
 }
 
+typedef struct LinuxBootData {
+    uint16_t protocol;
+    uint8_t header[8192];
+    hwaddr prot_addr;
+    size_t kernel_size;
+    uint8_t *kernel;
+    size_t setup_data_offset;
+} LinuxBootData;
+
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
                     bool pvh_enabled)
 {
     bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
-    uint16_t protocol;
-    int setup_size, kernel_size, cmdline_size;
-    int dtb_size, setup_data_offset;
+    int setup_size, cmdline_size;
+    int dtb_size;
     uint32_t initrd_max;
-    uint8_t header[8192], *setup, *kernel;
-    hwaddr real_addr, prot_addr, cmdline_addr;
+    uint8_t *setup;
+    hwaddr real_addr, cmdline_addr;
     FILE *f;
     char *vmode;
     MachineState *machine = MACHINE(x86ms);
-    struct setup_data *setup_data;
+    LinuxBootData data = { 0 };
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
@@ -854,17 +862,17 @@ void x86_load_linux(X86MachineState *x86ms,
         exit(1);
     }
 
-    kernel_size = get_file_size(f);
-    if (!kernel_size ||
-        fread(header, 1, MIN(ARRAY_SIZE(header), kernel_size), f) !=
-        MIN(ARRAY_SIZE(header), kernel_size)) {
+    data.kernel_size = get_file_size(f);
+    if (!data.kernel_size ||
+        fread(data.header, 1, MIN(ARRAY_SIZE(data.header), data.kernel_size), f) !=
+        MIN(ARRAY_SIZE(data.header), data.kernel_size)) {
         fprintf(stderr, "qemu: could not load kernel '%s': %s\n",
                 kernel_filename, strerror(errno));
         exit(1);
     }
 
     /* kernel protocol version */
-    if (ldl_p(header + 0x202) != 0x53726448) {
+    if (ldl_p(data.header + 0x202) != 0x53726448) {
         /*
          * This could be a multiboot kernel. If it is, let's stop treating it
          * like a Linux kernel.
@@ -873,7 +881,7 @@ void x86_load_linux(X86MachineState *x86ms,
          * header before to load it.
          */
         if (load_multiboot(x86ms, fw_cfg, f, kernel_filename, initrd_filename,
-                           kernel_cmdline, kernel_size, header)) {
+                           kernel_cmdline, data.kernel_size, data.header)) {
             return;
         }
         /*
@@ -883,35 +891,35 @@ void x86_load_linux(X86MachineState *x86ms,
          */
         if (pvh_enabled &&
             load_pvh(x86ms, fw_cfg, kernel_filename, initrd_filename,
-                     initrd_max, kernel_cmdline, kernel_size, header)) {
+                     initrd_max, kernel_cmdline, data.kernel_size, data.header)) {
             fclose(f);
             return;
             }
-        protocol = 0;
+        data.protocol = 0;
     } else  {
-        protocol = lduw_p(header + 0x206);
+        data.protocol = lduw_p(data.header + 0x206);
     }
 
-    if (protocol < 0x200 || !(header[0x211] & 0x01)) {
+    if (data.protocol < 0x200 || !(data.header[0x211] & 0x01)) {
         /* Low kernel */
         real_addr    = 0x90000;
         cmdline_addr = 0x9a000 - cmdline_size;
-        prot_addr    = 0x10000;
-    } else if (protocol < 0x202) {
+        data.prot_addr = 0x10000;
+    } else if (data.protocol < 0x202) {
         /* High but ancient kernel */
         real_addr    = 0x90000;
         cmdline_addr = 0x9a000 - cmdline_size;
-        prot_addr    = 0x100000;
+        data.prot_addr = 0x100000;
     } else {
         /* High and recent kernel */
         real_addr    = 0x10000;
         cmdline_addr = 0x20000;
-        prot_addr    = 0x100000;
+        data.prot_addr = 0x100000;
     }
 
     /* highest address for loading the initrd */
-    if (protocol >= 0x20c &&
-        lduw_p(header + 0x236) & XLF_CAN_BE_LOADED_ABOVE_4G) {
+    if (data.protocol >= 0x20c &&
+        lduw_p(data.header + 0x236) & XLF_CAN_BE_LOADED_ABOVE_4G) {
         /*
          * Linux has supported initrd up to 4 GB for a very long time (2007,
          * long before XLF_CAN_BE_LOADED_ABOVE_4G which was added in 2013),
@@ -928,8 +936,8 @@ void x86_load_linux(X86MachineState *x86ms,
          *
          * Therefore here just limit initrd_max to the available memory below 4G.
          */
-    } else if (protocol >= 0x203) {
-        initrd_max = MIN(initrd_max, ldl_p(header + 0x22c));
+    } else if (data.protocol >= 0x203) {
+        initrd_max = MIN(initrd_max, ldl_p(data.header + 0x22c));
     } else {
         initrd_max = MIN(initrd_max, 0x37ffffff);
     }
@@ -940,11 +948,11 @@ void x86_load_linux(X86MachineState *x86ms,
     sev_load_ctx.cmdline_data = (char *)kernel_cmdline;
     sev_load_ctx.cmdline_size = strlen(kernel_cmdline) + 1;
 
-    if (protocol >= 0x202) {
-        stl_p(header + 0x228, cmdline_addr);
+    if (data.protocol >= 0x202) {
+        stl_p(data.header + 0x228, cmdline_addr);
     } else {
-        stw_p(header + 0x20, 0xA33F);
-        stw_p(header + 0x22, cmdline_addr - real_addr);
+        stw_p(data.header + 0x20, 0xA33F);
+        stw_p(data.header + 0x22, cmdline_addr - real_addr);
     }
 
     /* handle vga= parameter */
@@ -968,7 +976,7 @@ void x86_load_linux(X86MachineState *x86ms,
                 exit(1);
             }
         }
-        stw_p(header + 0x1fa, video_mode);
+        stw_p(data.header + 0x1fa, video_mode);
     }
 
     /* loader type */
@@ -977,13 +985,13 @@ void x86_load_linux(X86MachineState *x86ms,
      * If this code is substantially changed, you may want to consider
      * incrementing the revision.
      */
-    if (protocol >= 0x200) {
-        header[0x210] = 0xB0;
+    if (data.protocol >= 0x200) {
+        data.header[0x210] = 0xB0;
     }
     /* heap */
-    if (protocol >= 0x201) {
-        header[0x211] |= 0x80; /* CAN_USE_HEAP */
-        stw_p(header + 0x224, cmdline_addr - real_addr - 0x200);
+    if (data.protocol >= 0x201) {
+        data.header[0x211] |= 0x80; /* CAN_USE_HEAP */
+        stw_p(data.header + 0x224, cmdline_addr - real_addr - 0x200);
     }
 
     /* load initrd */
@@ -993,7 +1001,7 @@ void x86_load_linux(X86MachineState *x86ms,
         gchar *initrd_data;
         GError *gerr = NULL;
 
-        if (protocol < 0x200) {
+        if (data.protocol < 0x200) {
             fprintf(stderr, "qemu: linux kernel too old to load a ram disk\n");
             exit(1);
         }
@@ -1023,30 +1031,30 @@ void x86_load_linux(X86MachineState *x86ms,
         sev_load_ctx.initrd_data = initrd_data;
         sev_load_ctx.initrd_size = initrd_size;
 
-        stl_p(header + 0x218, initrd_addr);
-        stl_p(header + 0x21c, initrd_size);
+        stl_p(data.header + 0x218, initrd_addr);
+        stl_p(data.header + 0x21c, initrd_size);
     }
 
     /* load kernel and setup */
-    setup_size = header[0x1f1];
+    setup_size = data.header[0x1f1];
     if (setup_size == 0) {
         setup_size = 4;
     }
     setup_size = (setup_size + 1) * 512;
-    if (setup_size > kernel_size) {
+    if (setup_size > data.kernel_size) {
         fprintf(stderr, "qemu: invalid kernel header\n");
         exit(1);
     }
-    kernel_size -= setup_size;
+    data.kernel_size -= setup_size;
 
     setup  = g_malloc(setup_size);
-    kernel = g_malloc(kernel_size);
+    data.kernel = g_malloc(data.kernel_size);
     fseek(f, 0, SEEK_SET);
     if (fread(setup, 1, setup_size, f) != setup_size) {
         fprintf(stderr, "fread() failed\n");
         exit(1);
     }
-    if (fread(kernel, 1, kernel_size, f) != kernel_size) {
+    if (fread(data.kernel, 1, data.kernel_size, f) != data.kernel_size) {
         fprintf(stderr, "fread() failed\n");
         exit(1);
     }
@@ -1054,7 +1062,7 @@ void x86_load_linux(X86MachineState *x86ms,
 
     /* append dtb to kernel */
     if (dtb_filename) {
-        if (protocol < 0x209) {
+        if (data.protocol < 0x209) {
             fprintf(stderr, "qemu: Linux kernel too old to load a dtb\n");
             exit(1);
         }
@@ -1066,13 +1074,13 @@ void x86_load_linux(X86MachineState *x86ms,
             exit(1);
         }
 
-        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
-        kernel = g_realloc(kernel, kernel_size);
+        data.setup_data_offset = QEMU_ALIGN_UP(data.kernel_size, 16);
+        data.kernel_size = data.setup_data_offset + sizeof(struct setup_data) + dtb_size;
+        data.kernel = g_realloc(data.kernel, data.kernel_size);
 
-        stq_p(header + 0x250, prot_addr + setup_data_offset);
+        stq_p(data.header + 0x250, data.prot_addr + data.setup_data_offset);
 
-        setup_data = (struct setup_data *)(kernel + setup_data_offset);
+        struct setup_data *setup_data = (struct setup_data *)(data.kernel + data.setup_data_offset);
         setup_data->next = 0;
         setup_data->type = cpu_to_le32(SETUP_DTB);
         setup_data->len = cpu_to_le32(dtb_size);
@@ -1088,14 +1096,14 @@ void x86_load_linux(X86MachineState *x86ms,
      * file the user passed in.
      */
     if (!sev_enabled()) {
-        memcpy(setup, header, MIN(sizeof(header), setup_size));
+        memcpy(setup, data.header, MIN(sizeof(data.header), setup_size));
     }
 
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
-    sev_load_ctx.kernel_data = (char *)kernel;
-    sev_load_ctx.kernel_size = kernel_size;
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, data.prot_addr);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, data.kernel_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, data.kernel, data.kernel_size);
+    sev_load_ctx.kernel_data = (char *)data.kernel;
+    sev_load_ctx.kernel_size = data.kernel_size;
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
-- 
2.36.1



