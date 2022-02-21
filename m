Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B14BD896
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:38:43 +0100 (CET)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM59W-0008JK-LA
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:38:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zL-0007yx-JT
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:11 -0500
Received: from [2a00:1450:4864:20::32c] (port=33763
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zJ-0000zw-Ox
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:11 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso8057347wmi.0
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8fBYS41UsWbP0oQzjFohWFoqIxyMIMGF5D+riPpbPJY=;
 b=LK6rDyEb/8JWAHEbe9Z9HC5mXc2Acvxs1fcIZplzHjSK2e1qCPFClELjrHZyhAhamf
 49aSh3yWoOot04rJZkeI0fAoOaWUCutIehE6G+esWPqodf9dDrcR1jUAwUjpXCr8gOBD
 B2B3m+M42+W7fRPKo4qaiIfYs4baconlNcw2tx4oVarUbH9zkJ1N8j2ILpcH8AiMSsL7
 N+qNt3j2uMuogV4Wy9PzJvfZi9RNvO0vS+yXf4NSfsIpfdOGJGMssO31Ws224yqvAehw
 MZxRS9pk/oyuehp6Va0g+1qlIfPEabXcbt8cOn0CpBSbYkKLdVwQfJ7lqWb66UAJZg2o
 zJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8fBYS41UsWbP0oQzjFohWFoqIxyMIMGF5D+riPpbPJY=;
 b=G322HU4x2Kjnh/w6sjV+9WJxV0TtDdnVtiWPdklsEx3Y0q8FoFxR3pcdv2rJFKC0og
 h5IRLaT91ZmDVPNVNNfiUydGxD8b0/T0qVEOG8uZIlfmx8feUm1lWWXCAsF+zwVCM7SF
 BLx/VNke0sFlloTBnq1q9r2xqeW7io4z3chK4rjG2yNz7bTiacTxgSftVjqbwP4GguP7
 w736lgcLbVdPCl3ry9kWGeRTMyj4YprFgEtNpSdRFoy2VoBuZLliyD3lvdvzpheh3iL6
 hN+w0EbensidM2gOnDcQ2TuPYx9VaGld6oMordN36bV9hQCn0U2ljl27RDNOTqdDjKeI
 OeUA==
X-Gm-Message-State: AOAM533a4fF+/fSrIk5DZdjCemA/IuoFY4RuHhvx1OoDnb4FBk5RU7cZ
 ENlXPDv/bVphFJximtqwO0xY6jh1gUoDUQ==
X-Google-Smtp-Source: ABdhPJxoxJUlbgI8aLoO/bCISEi+x3qSU1NBr/WayGOGDYkE3CT3KCKQ3k5fL1tCHaYX5HcpFBVD7Q==
X-Received: by 2002:a05:600c:ad0:b0:37b:b989:faaf with SMTP id
 c16-20020a05600c0ad000b0037bb989faafmr20324035wmr.167.1645435688411; 
 Mon, 21 Feb 2022 01:28:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/26] target/arm: Move '-cpu host' code to cpu64.c
Date: Mon, 21 Feb 2022 09:27:41 +0000
Message-Id: <20220221092800.404870-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Now that KVM has dropped AArch32 host support, the 'host' CPU type is
always AArch64, and we can move it to cpu64.c.  This move will allow
us to share code between it and '-cpu max', which should behave
the same as '-cpu host' when using KVM or HVF.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220204165506.2846058-2-peter.maydell@linaro.org
---
 target/arm/cpu.c   | 30 ------------------------------
 target/arm/cpu64.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5a9c02a2561..a4a229a65be 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,7 +39,6 @@
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
-#include "hvf_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 
@@ -2079,31 +2078,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #endif /* CONFIG_TCG */
 }
 
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-static void arm_host_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-#ifdef CONFIG_KVM
-    kvm_arm_set_cpu_features_from_host(cpu);
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        aarch64_add_sve_properties(obj);
-        aarch64_add_pauth_properties(obj);
-    }
-#else
-    hvf_arm_set_cpu_features_from_host(cpu);
-#endif
-    arm_cpu_post_init(obj);
-}
-
-static const TypeInfo host_arm_cpu_type_info = {
-    .name = TYPE_ARM_HOST_CPU,
-    .parent = TYPE_AARCH64_CPU,
-    .instance_init = arm_host_initfn,
-};
-
-#endif
-
 static void arm_cpu_instance_init(Object *obj)
 {
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
@@ -2151,10 +2125,6 @@ static const TypeInfo arm_cpu_type_info = {
 static void arm_cpu_register_types(void)
 {
     type_register_static(&arm_cpu_type_info);
-
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    type_register_static(&host_arm_cpu_type_info);
-#endif
 }
 
 type_init(arm_cpu_register_types)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 8786be7783e..052666b819e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -30,6 +30,7 @@
 #endif
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
+#include "hvf_arm.h"
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
 
@@ -681,6 +682,31 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+static void arm_host_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+#ifdef CONFIG_KVM
+    kvm_arm_set_cpu_features_from_host(cpu);
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        aarch64_add_sve_properties(obj);
+        aarch64_add_pauth_properties(obj);
+    }
+#else
+    hvf_arm_set_cpu_features_from_host(cpu);
+#endif
+    arm_cpu_post_init(obj);
+}
+
+static const TypeInfo host_arm_cpu_type_info = {
+    .name = TYPE_ARM_HOST_CPU,
+    .parent = TYPE_AARCH64_CPU,
+    .instance_init = arm_host_initfn,
+};
+
+#endif
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -1023,6 +1049,10 @@ static void aarch64_cpu_register_types(void)
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
         aarch64_cpu_register(&aarch64_cpus[i]);
     }
+
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+    type_register_static(&host_arm_cpu_type_info);
+#endif
 }
 
 type_init(aarch64_cpu_register_types)
-- 
2.25.1


