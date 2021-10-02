Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC5041FC21
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:14:36 +0200 (CEST)
Received: from localhost ([::1]:44410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWeqZ-0006b7-Mc
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXb-0002ke-Ax
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:55:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXZ-00014Z-3w
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQMlJLpBHn2fUxB+2/XhMlNl1C9ZrEw/LRArmGOAdEM=;
 b=JqroPGK+b3ioFC5fJzYNbHwIwD0gjhLgTD8WchAMjScyouB1rBAxelXXe2icXsJ09DtPgZ
 BdQdo32fUJs1LNKmklypCQULdR7sN3arFJrpM/BI7ahqwG8fZcuIrxhXLNykGBTiLEI91U
 MHS85HtztsRAE6FEw2sw6iRupV5acg8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-SBQ_6eL1N0KDblFf7RCEeg-1; Sat, 02 Oct 2021 08:54:55 -0400
X-MC-Unique: SBQ_6eL1N0KDblFf7RCEeg-1
Received: by mail-wm1-f69.google.com with SMTP id
 10-20020a05600c240a00b0030d403f24e2so3205761wmp.9
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HQMlJLpBHn2fUxB+2/XhMlNl1C9ZrEw/LRArmGOAdEM=;
 b=K+kURhgVjWhmqiVol6yKx2pcPyMs+2b97ta9GMtaKFmUr12LXR6AHdd+FyXR3ytTt+
 QrCFKQlMlLhru9pJV33EmQ7AI6AEjqYC7HJljmwvUd3dKnK22JVVRn+RrfvjBuzZPiKi
 h1ecz6jjqYy5rwhEqmwldWE6qMLSYyHfu7R9Dm2mZOm8fXKM8IUrn+nAinDTBgEO4nDH
 3xJ/5/tbYNJSVueAz4ltbLmDHGZrbumKNFRvdPgATgz7/jXCqa/4q5JsJY5xWEFVNzVk
 wHLyuzMobMr1Wggi0tnTvAzNj/rBgW5FvY/FCty6lYVG3eEvdb2Qrh1ouJXHFEINtoPr
 CaGA==
X-Gm-Message-State: AOAM531LznDqmGWrgNiWYiUP2izLy+CQr0W54mpyoa+tn1EczVEq8Fon
 LckCLR0j/QZv1/ptrblmLKjgTU4q67as71vbq3O5UdHQVJPQ7eHppu724frPwKF16t1EB0gM8og
 bCy4Q4yKDjzu3W/SiGRH0/PXxWbqmWm0p388f1euC3vqp04J8J/X1MU4QXWSy+4Wa
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr9289033wmp.73.1633179294265; 
 Sat, 02 Oct 2021 05:54:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZjFxaIEu9svYHDueJWKUmqvnq/eSj6AVK+xBQ/cs0mjHbQ9g0Mh2BXrylFwcs1VzcJPeV+Q==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr9289016wmp.73.1633179294045; 
 Sat, 02 Oct 2021 05:54:54 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 m4sm10915060wml.28.2021.10.02.05.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/22] x86/sev: generate SEV kernel loader hashes in
 x86_load_linux
Date: Sat,  2 Oct 2021 14:53:16 +0200
Message-Id: <20211002125317.3418648-22-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

If SEV is enabled and a kernel is passed via -kernel, pass the hashes of
kernel/initrd/cmdline in an encrypted guest page to OVMF for SEV
measured boot.

Co-developed-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210930054915.13252-3-dovmurik@linux.ibm.com>
[PMD: Rebased on top of 0021c4765a6]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/x86.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 41ef9a84a9f..0c7c054e3a0 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -47,6 +47,7 @@
 #include "hw/i386/fw_cfg.h"
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "target/i386/sev_i386.h"
 
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/irq.h"
@@ -780,6 +781,7 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
+    SevKernelLoaderContext sev_load_ctx = {};
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -926,6 +928,8 @@ void x86_load_linux(X86MachineState *x86ms,
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
     fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
+    sev_load_ctx.cmdline_data = (char *)kernel_cmdline;
+    sev_load_ctx.cmdline_size = strlen(kernel_cmdline) + 1;
 
     if (protocol >= 0x202) {
         stl_p(header + 0x228, cmdline_addr);
@@ -1007,6 +1011,8 @@ void x86_load_linux(X86MachineState *x86ms,
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
         fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data, initrd_size);
+        sev_load_ctx.initrd_data = initrd_data;
+        sev_load_ctx.initrd_size = initrd_size;
 
         stl_p(header + 0x218, initrd_addr);
         stl_p(header + 0x21c, initrd_size);
@@ -1065,15 +1071,32 @@ void x86_load_linux(X86MachineState *x86ms,
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    memcpy(setup, header, MIN(sizeof(header), setup_size));
+    /*
+     * If we're starting an encrypted VM, it will be OVMF based, which uses the
+     * efi stub for booting and doesn't require any values to be placed in the
+     * kernel header.  We therefore don't update the header so the hash of the
+     * kernel on the other side of the fw_cfg interface matches the hash of the
+     * file the user passed in.
+     */
+    if (!sev_enabled()) {
+        memcpy(setup, header, MIN(sizeof(header), setup_size));
+    }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
+    sev_load_ctx.kernel_data = (char *)kernel;
+    sev_load_ctx.kernel_size = kernel_size;
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
+    sev_load_ctx.setup_data = (char *)setup;
+    sev_load_ctx.setup_size = setup_size;
+
+    if (sev_enabled()) {
+        sev_add_kernel_loader_hashes(&sev_load_ctx, &error_fatal);
+    }
 
     option_rom[nb_option_roms].bootindex = 0;
     option_rom[nb_option_roms].name = "linuxboot.bin";
-- 
2.31.1


