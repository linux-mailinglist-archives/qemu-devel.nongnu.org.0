Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20C357CACF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:43:08 +0200 (CEST)
Received: from localhost ([::1]:54544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVWE-0001Xc-V9
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEVJN-0004Mt-H0
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:29:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEVJL-0004qT-NY
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658406587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXiXFEEBa1mv6ZvamF/0ld902yL9HoMwAaQ7edK3ppo=;
 b=RBqbhBeqXS49OZeu/FZ+PnOW3nL3+N18JRKYHkOXNf4/5iXIdCgzn3Qt7+BTVecTbCtbom
 /3KmLtM0aTfRZJ/GSUdRbaRhmn1WLlBXURPpBv5vFmWLoAHaYOlrXIMlThr1LWYwV+vzYZ
 DA0IaQ+QxlnW2bj/1DMOD8wYAaq68FI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-ehGtWeJKMA6XgmvXaW9biQ-1; Thu, 21 Jul 2022 08:29:45 -0400
X-MC-Unique: ehGtWeJKMA6XgmvXaW9biQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 qw22-20020a1709066a1600b0072f43c1f59bso724446ejc.6
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 05:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RXiXFEEBa1mv6ZvamF/0ld902yL9HoMwAaQ7edK3ppo=;
 b=U0lUFXhd4Vy65tOF7oCsPb9AmPnka2qAN2ZUZ1RgEwTbT1Amua5Kyg7Qp0Cch2U87W
 fu/QUuHwZLJPxN5Y2fM8/CJep0Te73pEcvFvZncvYZ4M/LPiJ3+e42YzTBCP3XC5YVhu
 uOcgq+bHeWoARq7Ds/OFf3Pc90HemEhgWO19W0O+aC+NwRKCirDJfehUhOmBrLbehHTT
 5TQ3V3I4RYTGrBzfG1qesG+Sqsf6+iDz7xpQmD/bvMNBCXVJa/nvCuAxWuDbmAj5s0Rn
 RpUWekHdp5ETLKfcgF+I9ke6U9GXd29w4nwdGHTPG2BPMrC8j0XXNTFxpL7Bzu2dpJk5
 wCgA==
X-Gm-Message-State: AJIora8NOsdx8VjaNS2rP15yyPUSDEWbyGZOlLKgOgBrXN4CWdygQINU
 cyFlCwS3aHo1k9h1GUdv/kuZ22pdqpgIxsN4kn41cNvE4L1RTmxQzJyvS7lm3w4pkG1AXAhZgkz
 AGyk9kUkr6qzJS8wPHQzn8WDKpwmEKoI7KDqLGxR2sfTlYAiBGywRbYEpc20mNoapDAM=
X-Received: by 2002:aa7:da91:0:b0:43b:a4c1:6ec8 with SMTP id
 q17-20020aa7da91000000b0043ba4c16ec8mr13963551eds.425.1658406584207; 
 Thu, 21 Jul 2022 05:29:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uPRdiafp7fY6sNBrw+TA5r0cCn2itCIj+5He8c88PSut644noYjvmjrF56E0MeOKnm89Vtjg==
X-Received: by 2002:aa7:da91:0:b0:43b:a4c1:6ec8 with SMTP id
 q17-20020aa7da91000000b0043ba4c16ec8mr13963496eds.425.1658406583695; 
 Thu, 21 Jul 2022 05:29:43 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a170906304200b0072f42ca292bsm796426ejd.129.2022.07.21.05.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 05:29:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 3/4] hw/i386: extract handling of setup data linked list
Date: Thu, 21 Jul 2022 14:29:36 +0200
Message-Id: <20220721122937.729959-4-pbonzini@redhat.com>
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

In preparation for the introduction of a second setup data block,
manage the linked list and the reallocation of data.kernel in
a separate function.  Unlike the code that's being moved, the
function can be called more than once.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/x86.c | 47 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 253a6ff536..564bf3834b 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -828,6 +828,34 @@ typedef struct LinuxBootData {
     size_t setup_data_offset;
 } LinuxBootData;
 
+static void *add_setup_data(LinuxBootData *data, uint32_t size, uint32_t type)
+{
+    struct setup_data *setup_data;
+    size_t prev_setup_data_offset = data->setup_data_offset;
+
+    if (data->protocol < 0x209) {
+        fprintf(stderr, "qemu: Linux kernel too old to add setup data\n");
+        exit(1);
+    }
+
+    data->setup_data_offset = QEMU_ALIGN_UP(data->kernel_size, 16);
+    data->kernel_size = data->setup_data_offset + sizeof(struct setup_data) + size;
+    data->kernel = g_realloc(data->kernel, data->kernel_size);
+
+    if (prev_setup_data_offset) {
+        setup_data = (struct setup_data *)(data->kernel + prev_setup_data_offset);
+        setup_data->next = cpu_to_le64(data->prot_addr + data->setup_data_offset);
+    } else {
+        stq_p(data->header + 0x250, data->prot_addr + data->setup_data_offset);
+    }
+
+    setup_data = (struct setup_data *)(data->kernel + data->setup_data_offset);
+    setup_data->next = 0;
+    setup_data->type = cpu_to_le32(type);
+    setup_data->len = cpu_to_le32(size);
+    return setup_data->data;
+}
+
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
@@ -1062,11 +1090,6 @@ void x86_load_linux(X86MachineState *x86ms,
 
     /* append dtb to kernel */
     if (dtb_filename) {
-        if (data.protocol < 0x209) {
-            fprintf(stderr, "qemu: Linux kernel too old to load a dtb\n");
-            exit(1);
-        }
-
         dtb_size = get_image_size(dtb_filename);
         if (dtb_size <= 0) {
             fprintf(stderr, "qemu: error reading dtb %s: %s\n",
@@ -1074,18 +1097,8 @@ void x86_load_linux(X86MachineState *x86ms,
             exit(1);
         }
 
-        data.setup_data_offset = QEMU_ALIGN_UP(data.kernel_size, 16);
-        data.kernel_size = data.setup_data_offset + sizeof(struct setup_data) + dtb_size;
-        data.kernel = g_realloc(data.kernel, data.kernel_size);
-
-        stq_p(data.header + 0x250, data.prot_addr + data.setup_data_offset);
-
-        struct setup_data *setup_data = (struct setup_data *)(data.kernel + data.setup_data_offset);
-        setup_data->next = 0;
-        setup_data->type = cpu_to_le32(SETUP_DTB);
-        setup_data->len = cpu_to_le32(dtb_size);
-
-        load_image_size(dtb_filename, setup_data->data, dtb_size);
+        void *dtb = add_setup_data(&data, dtb_size, SETUP_DTB);
+        load_image_size(dtb_filename, dtb, dtb_size);
     }
 
     /*
-- 
2.36.1



