Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B49D41FC20
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:14:36 +0200 (CEST)
Received: from localhost ([::1]:44400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWeqZ-0006as-18
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeX1-0001qh-W7
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWz-0000r8-OI
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ORMXV0Tst1vudHF4i8O0+oN0mxRTrnSBxDsiV4I1LIw=;
 b=azVNXQT2y436HHjbImIHn3ngYWBz9otD9N8CRYxbul52vLOnwcBFxACikJN7XaBjBOk8Ct
 KCZvMka0+lWCufzg2AEMa/DO/nNUk0kcWborQX0tfujR6JjnrkIP6WxvQ1bINuYwtZj5Yf
 9Pz6lT69SLeSvth/9Rz3CeAkt+yOj/k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-DN_0jU3qOdWsRWe6A4tJsg-1; Sat, 02 Oct 2021 08:54:19 -0400
X-MC-Unique: DN_0jU3qOdWsRWe6A4tJsg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m2-20020a05600c3b0200b0030cd1310631so3791437wms.7
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORMXV0Tst1vudHF4i8O0+oN0mxRTrnSBxDsiV4I1LIw=;
 b=fv/nPtddzN9hYPOXdSKG+kdxmjaqNUH6khCoS1NlixOaP9yOl53L41CMPCwTSErvGX
 sp2ZW3T8Y3LOlH6MoHxPNN9NrN/lGBmfSIeeVciw4ZKE3iuNlIScr9zrSBzOzYojBKL6
 ec2lIHVuyBXxVyIwdyDgt2iqyoASQwzq5O0e/bZDEy4tb5utbGxDo+D1R+cG7lFmRc84
 WeAaS4pLE50eQQFN0xRvjKiSUKTCTl8hnMas91V3/qkZCz8rR3U9QbVLwJsBZYEk1m5J
 uicaTCDcHHoD/PwruHG/Fma6Fn9aaQoRr33uXD5t2uea01t2cmnolTD1wjWzWsjpsWVx
 QN8w==
X-Gm-Message-State: AOAM533C9kCn1cYfXPGiCxE0mcInt6txzMn36Rcc0rjgqXuSmoY8IGap
 yjlhaPnZbmo6PuVMpoIO2t5//iPc/Y0uGueCz4d3fJr67i07rUkUnr25b3mqK9bI8M4N/+a/+HA
 v0/wcU4Uq5N2LfWTc99Obeqhf+9++RZeT5RVUfEfPEhKQyxSj08gKqlst2uZ9fEXh
X-Received: by 2002:adf:a18d:: with SMTP id u13mr3368099wru.275.1633179258259; 
 Sat, 02 Oct 2021 05:54:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuWjXvREy5i/oGIVOiC0tBm2gnRbqZb/64Psa7EoqmzOxcl6FWYaAG1lUh/i/7mWLZCmUUqw==
X-Received: by 2002:adf:a18d:: with SMTP id u13mr3368069wru.275.1633179258011; 
 Sat, 02 Oct 2021 05:54:18 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i2sm8381097wrq.78.2021.10.02.05.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/22] target/i386/sev: Remove stubs by using code elision
Date: Sat,  2 Oct 2021 14:53:08 +0200
Message-Id: <20211002125317.3418648-14-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

Only declare sev_enabled() and sev_es_enabled() when CONFIG_SEV is
set, to allow the compiler to elide unused code. Remove unnecessary
stubs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/sev.h    | 14 +++++++++++++-
 target/i386/sev_i386.h  |  3 ---
 target/i386/cpu.c       | 16 +++++++++-------
 target/i386/sev-stub.c  | 36 ------------------------------------
 target/i386/meson.build |  2 +-
 5 files changed, 23 insertions(+), 48 deletions(-)
 delete mode 100644 target/i386/sev-stub.c

diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index a329ed75c1c..f5c625bb3b3 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -14,9 +14,21 @@
 #ifndef QEMU_SEV_H
 #define QEMU_SEV_H
 
-#include "sysemu/kvm.h"
+#ifndef CONFIG_USER_ONLY
+#include CONFIG_DEVICES /* CONFIG_SEV */
+#endif
 
+#ifdef CONFIG_SEV
 bool sev_enabled(void);
+bool sev_es_enabled(void);
+#else
+#define sev_enabled() 0
+#define sev_es_enabled() 0
+#endif
+
+uint32_t sev_get_cbit_position(void);
+uint32_t sev_get_reduced_phys_bits(void);
+
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
 
 #endif
diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 0798ab3519a..2d9a1a0112e 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -24,10 +24,7 @@
 #define SEV_POLICY_DOMAIN       0x10
 #define SEV_POLICY_SEV          0x20
 
-extern bool sev_es_enabled(void);
 extern SevInfo *sev_get_info(void);
-extern uint32_t sev_get_cbit_position(void);
-extern uint32_t sev_get_reduced_phys_bits(void);
 extern char *sev_get_launch_measurement(void);
 extern SevCapability *sev_get_capabilities(Error **errp);
 extern SevAttestationReport *
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e169a01713d..27992bdc9f8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -25,8 +25,8 @@
 #include "tcg/helper-tcg.h"
 #include "sysemu/reset.h"
 #include "sysemu/hvf.h"
+#include "sysemu/sev.h"
 #include "kvm/kvm_i386.h"
-#include "sev_i386.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qmp/qerror.h"
@@ -38,6 +38,7 @@
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/i386/sgx-epc.h"
+#include "sev_i386.h"
 #endif
 
 #include "disas/capstone.h"
@@ -5764,12 +5765,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         *edx = 0;
         break;
     case 0x8000001F:
-        *eax = sev_enabled() ? 0x2 : 0;
-        *eax |= sev_es_enabled() ? 0x8 : 0;
-        *ebx = sev_get_cbit_position();
-        *ebx |= sev_get_reduced_phys_bits() << 6;
-        *ecx = 0;
-        *edx = 0;
+        *eax = *ebx = *ecx = *edx = 0;
+        if (sev_enabled()) {
+            *eax = 0x2;
+            *eax |= sev_es_enabled() ? 0x8 : 0;
+            *ebx = sev_get_cbit_position();
+            *ebx |= sev_get_reduced_phys_bits() << 6;
+        }
         break;
     default:
         /* reserved values: zero */
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
deleted file mode 100644
index 8eae5d2fa8d..00000000000
--- a/target/i386/sev-stub.c
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * QEMU SEV stub
- *
- * Copyright Advanced Micro Devices 2018
- *
- * Authors:
- *      Brijesh Singh <brijesh.singh@amd.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "sev_i386.h"
-
-bool sev_enabled(void)
-{
-    return false;
-}
-
-uint32_t sev_get_cbit_position(void)
-{
-    return 0;
-}
-
-uint32_t sev_get_reduced_phys_bits(void)
-{
-    return 0;
-}
-
-bool sev_es_enabled(void)
-{
-    return false;
-}
diff --git a/target/i386/meson.build b/target/i386/meson.build
index a4f45c3ec1d..ae38dc95635 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -6,7 +6,7 @@
   'xsave_helper.c',
   'cpu-dump.c',
 ))
-i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'), if_false: files('sev-stub.c'))
+i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'))
 
 # x86 cpu type
 i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
-- 
2.31.1


