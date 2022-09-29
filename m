Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90425EFB7D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:04:23 +0200 (CEST)
Received: from localhost ([::1]:44824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwxS-0007t3-Cq
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQg-0003eg-F4
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQf-00035Z-0y
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WiZVMx9Rx+fIhof5xKOzfVzLvULj1mS05oyWMAyb/1E=;
 b=KTStdQchwG01oU56u/k9ZrCE5LSZ7EgPAbzxlIzTsMz6p+uilAGec3ZGwWRFFyIInHbBg9
 10X1bUMA6L1kpfsrUJ3kXj515D6sePmwlXsxP6NJi4B1ZwERcslxUnMHSF+G2HaVnSP/1c
 W1U2bQsDLExwCfC6VDAAoaYT26hZWCQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-482-Qeg7UofoNGO0ILRJYGbK3g-1; Thu, 29 Sep 2022 12:30:25 -0400
X-MC-Unique: Qeg7UofoNGO0ILRJYGbK3g-1
Received: by mail-ej1-f69.google.com with SMTP id
 qk10-20020a1709077f8a00b0078297c303afso976826ejc.20
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WiZVMx9Rx+fIhof5xKOzfVzLvULj1mS05oyWMAyb/1E=;
 b=LY5tkAH4GRbuDggS3aXQNWQ9d7OtoASEUY+2OSTNruwNCFbhoUN20saa1VsZz4fQqj
 NlDeY57VBCPjP/0+vWt0KkgS4RseN7M55h3GxktwuUvRIlntzKTfwS6lZw86BaMlwi9G
 11TokC7V88uX6+Wdue5F71lSbTbAhw4gL+PVeJei6ha/zJinvRxfnjNz2Rcv38DUaIQ4
 BXEyLxrb9s0P21iPWUXv4Lksr36gstUv/0HShS2FRHVfGVpEq5fckjvLFOsNM52b3SMW
 RYoOctLIiziFxylpkdaokuxfsfUTe/9v0semXj2MedfAZ4mEP8Oc8pWpncAXhNdX5Nnu
 N2FA==
X-Gm-Message-State: ACrzQf0FaIeUy6XcXN5xAnV34SYCmrMepXwTxI2kgS0w3YsSG19qvRNX
 xGQrHPuYZ/1mZwcM7V5thLaZuCTpMMqEmZqYrAn39uLhxiGPF+7nupEySmpkoZwja4BogGIRxr9
 q1KODKREANjTnIEvpNn/h/peHEEm1MOrg0r+BZd3IVHBi0NC/RlTe6EYpbQOADTXESQQ=
X-Received: by 2002:a05:6402:1cc1:b0:453:1517:94e4 with SMTP id
 ds1-20020a0564021cc100b00453151794e4mr4022182edb.399.1664469023707; 
 Thu, 29 Sep 2022 09:30:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7+86PMYGMQWY3ouCc4jfQ7VQxmjQ6Pe52RY6Tdntx0s5+JIQjxh2nKCrOvePb2qYCir5GMdQ==
X-Received: by 2002:a05:6402:1cc1:b0:453:1517:94e4 with SMTP id
 ds1-20020a0564021cc100b00453151794e4mr4022159edb.399.1664469023448; 
 Thu, 29 Sep 2022 09:30:23 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1709064ec300b007712444e98csm4176296ejv.43.2022.09.29.09.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 02/14] x86: use typedef for SetupData struct
Date: Thu, 29 Sep 2022 18:30:02 +0200
Message-Id: <20220929163014.16950-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The preferred style is SetupData as a typedef, not setup_data as a plain
struct.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220921093134.2936487-2-Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/x86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 96d205927e..1ee0b1b413 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -653,12 +653,12 @@ DeviceState *ioapic_init_secondary(GSIState *gsi_state)
     return dev;
 }
 
-struct setup_data {
+typedef struct SetupData {
     uint64_t next;
     uint32_t type;
     uint32_t len;
     uint8_t data[];
-} __attribute__((packed));
+} __attribute__((packed)) SetupData;
 
 
 /*
@@ -799,7 +799,7 @@ void x86_load_linux(X86MachineState *x86ms,
     FILE *f;
     char *vmode;
     MachineState *machine = MACHINE(x86ms);
-    struct setup_data *setup_data;
+    SetupData *setup_data;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
@@ -1082,11 +1082,11 @@ void x86_load_linux(X86MachineState *x86ms,
         }
 
         setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
+        kernel_size = setup_data_offset + sizeof(SetupData) + dtb_size;
         kernel = g_realloc(kernel, kernel_size);
 
 
-        setup_data = (struct setup_data *)(kernel + setup_data_offset);
+        setup_data = (SetupData *)(kernel + setup_data_offset);
         setup_data->next = cpu_to_le64(first_setup_data);
         first_setup_data = prot_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_DTB);
@@ -1097,9 +1097,9 @@ void x86_load_linux(X86MachineState *x86ms,
 
     if (!legacy_no_rng_seed) {
         setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
+        kernel_size = setup_data_offset + sizeof(SetupData) + RNG_SEED_LENGTH;
         kernel = g_realloc(kernel, kernel_size);
-        setup_data = (struct setup_data *)(kernel + setup_data_offset);
+        setup_data = (SetupData *)(kernel + setup_data_offset);
         setup_data->next = cpu_to_le64(first_setup_data);
         first_setup_data = prot_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
-- 
2.37.3


