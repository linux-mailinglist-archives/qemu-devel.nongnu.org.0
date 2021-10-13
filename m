Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883B442BB76
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:25:46 +0200 (CEST)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaW9-0004VI-Kq
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEm-0002G0-T4
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:48 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEj-0005nb-3v
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:48 -0400
Received: by mail-ed1-x533.google.com with SMTP id z20so7131176edc.13
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rZnb1x20O2Ui1ngIl9Od4LRZGQWROtAMwvlAfS3bJqM=;
 b=M34FVbeDm7n7U2svl3ZNJ15jLBYDPOLPvvDB9qB1jvfEK146gnY6F3IGN4qgt7Pty7
 t34eXl8sVGOIGsdIIp6QhABtr39fyBFukt3YkBnrFHCyDXqKUR4DRRcDzAvJJB+QSi1w
 fYr6gh9rPnDWF/DCgpHIpHGHxMURO30HGkQwcYowIoAWp1TTbJj012/o7tGR/3WAzi7j
 rdM7seRU/dgCDyUv+/5JXuDlLA68GMkXWNVxA6+bmiuuj2pDnX3ao8opBjwm7DVIfIkN
 6DBHgitFdc1kKeXtMyJyygk4ZkWHyDnkUH9bLHC41Q0HnaIA3twUIQ8dbbHpMVPGodL6
 JcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rZnb1x20O2Ui1ngIl9Od4LRZGQWROtAMwvlAfS3bJqM=;
 b=SVM9GJllwV++xUr0aXWmnBWcT6YSzdJsFIU5tKIdIrXhyfh3iSVM9MOhFbKzdKMHvc
 JrNx9pCWPM4+Esfv61EfKaFeUkTwn7lsqvUSQPEmIr+50TXqK5TOZ+Y+PFANRgqqWDAO
 9Gf0AjyW0kyZwqPHoVParZUTfbttmjokgHhDEKICjAjP7GuWSWU4IqR6YorePvkFkKj3
 vF87aAtxaju7fXKHX2I3k1IUwKpa2te5bGpr42d1lYHOlTK7g3mjoDOFhx+IX56uCnQ0
 A9kTdTgXNXvrvASdWAcxbd9cVrRoLNBMSJhOMkft4thYRyngsRu1Nqj9deWY3krTWb1l
 TNuw==
X-Gm-Message-State: AOAM533ZP5IrRP/U2UEVXJGtlAkw804IUMZgmjFFpOzvMmnS1r9CTkgO
 r1hPRpndpQj5t97M6eyFECrNicXV5So=
X-Google-Smtp-Source: ABdhPJxYXHhWqmlsTkX5Aiu4gHup4vkSni4kh3QCLZMGQQUdKh6U9BGXgmq3vvKKPI5PpHRFEFos5w==
X-Received: by 2002:a17:906:4f96:: with SMTP id
 o22mr39323428eju.169.1634116063831; 
 Wed, 13 Oct 2021 02:07:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/40] target/i386/sev: Declare system-specific functions in
 'sev.h'
Date: Wed, 13 Oct 2021 11:07:08 +0200
Message-Id: <20211013090728.309365-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

"sysemu/sev.h" is only used from x86-specific files. Let's move it
to include/hw/i386, and merge it with target/i386/sev.h.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-16-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc_sysfw.c         |  2 +-
 include/sysemu/sev.h       | 28 ----------------------------
 target/i386/kvm/kvm.c      |  1 -
 target/i386/kvm/sev-stub.c |  2 +-
 target/i386/monitor.c      |  1 -
 target/i386/sev.h          | 12 +++++++++++-
 6 files changed, 13 insertions(+), 33 deletions(-)
 delete mode 100644 include/sysemu/sev.h

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 68d6b1f783..c8b17af953 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -37,7 +37,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
-#include "sysemu/sev.h"
+#include "sev.h"
 
 #define FLASH_SECTOR_SIZE 4096
 
diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
deleted file mode 100644
index 94d821d737..0000000000
--- a/include/sysemu/sev.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- * QEMU Secure Encrypted Virutualization (SEV) support
- *
- * Copyright: Advanced Micro Devices, 2016-2018
- *
- * Authors:
- *  Brijesh Singh <brijesh.singh@amd.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#ifndef QEMU_SEV_H
-#define QEMU_SEV_H
-
-#include "sysemu/kvm.h"
-
-bool sev_enabled(void);
-int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
-int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
-int sev_inject_launch_secret(const char *hdr, const char *secret,
-                             uint64_t gpa, Error **errp);
-
-int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
-void sev_es_set_reset_vector(CPUState *cpu);
-
-#endif
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a5f6ff63c8..0eb7a0340c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -44,7 +44,6 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/i386/x86-iommu.h"
 #include "hw/i386/e820_memory_layout.h"
-#include "sysemu/sev.h"
 
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
diff --git a/target/i386/kvm/sev-stub.c b/target/i386/kvm/sev-stub.c
index 9587d1b2a3..6080c007a2 100644
--- a/target/i386/kvm/sev-stub.c
+++ b/target/i386/kvm/sev-stub.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
-#include "sysemu/sev.h"
+#include "sev.h"
 
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 109e4e61c0..935a8ee8ca 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -30,7 +30,6 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/kvm.h"
-#include "sysemu/sev.h"
 #include "qapi/error.h"
 #include "sev.h"
 #include "qapi/qapi-commands-misc-target.h"
diff --git a/target/i386/sev.h b/target/i386/sev.h
index d83428fa26..c96072bf78 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -14,7 +14,7 @@
 #ifndef QEMU_SEV_I386_H
 #define QEMU_SEV_I386_H
 
-#include "sysemu/sev.h"
+#include "exec/confidential-guest-support.h"
 #include "qapi/qapi-types-misc-target.h"
 
 #define SEV_POLICY_NODBG        0x1
@@ -35,6 +35,7 @@ typedef struct SevKernelLoaderContext {
     size_t cmdline_size;
 } SevKernelLoaderContext;
 
+bool sev_enabled(void);
 extern bool sev_es_enabled(void);
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
@@ -45,4 +46,13 @@ extern SevAttestationReport *
 sev_get_attestation_report(const char *mnonce, Error **errp);
 extern bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp);
 
+int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
+int sev_inject_launch_secret(const char *hdr, const char *secret,
+                             uint64_t gpa, Error **errp);
+
+int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
+void sev_es_set_reset_vector(CPUState *cpu);
+
+int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
+
 #endif
-- 
2.31.1



