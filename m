Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF433D397F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 13:30:24 +0200 (CEST)
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6tNi-0003MS-R6
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 07:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m6tLT-0001jA-Jc
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:27:59 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m6tLR-0001Fl-TV
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:27:59 -0400
Received: by mail-ej1-x634.google.com with SMTP id e19so3086168ejs.9
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 04:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dfMBATw7w9UeqJjgtNMeVbuCu2O4PoU9wbCqZASRcYY=;
 b=b9d6JyGBthaX92iCuK1T2yPI857GxTZwb0c78vqm6GdA3CvbedVGZfc8/xwf/ubNa/
 kv55vxD0QjZitMulcn6nbcge+sFdId509DgGQwoBizLSMPBvqB7UeddTotEQRsV1bSdv
 Sarluumo0U947Ufj+5MVsobLYFeF+oWI0qVOvvbfSeHylIybfbkYSp2TEmUGIGjTNXgt
 J6D2KDSH1i3nv5wnBAvcQPiOGraqpjJ/SLqPInaJ/mMhqtdDRPpQzP7RVKkZdB0y7Wpj
 HaquHnJ9oZboWu9zEdYYKjpLZOqoSDPwU5uzrW9P3sYq3M2LgOvEvk6ixoou6sqZ/XEB
 iMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dfMBATw7w9UeqJjgtNMeVbuCu2O4PoU9wbCqZASRcYY=;
 b=Nh73kp66k5fkVmaF9VckB8h2fQub/kw/lsxNujDtwAdBx3GntCF9kNRm/N+YDXtS6t
 JZB3FPxPfo995V5UvAwgzvmC9ib9VTFOL5zyfp3YGtt4Gwt2uWaWdGHWFdGPzLSTN8Sw
 ObOWqN9w4m9C5SjwZNDSmeO1t5nwHQBUl9KHq1ULSqE8z3W/AhhBt3o7+bIAPp0E6dyt
 sbAjUwVSrmz4oVpObmya7JOrICjmXqt74ZMnCiyXaZBlvpZIkqSVeMY6HzEHUWMdXWWQ
 bxAONj2ChNZPB0jDEbYy8ivncBnwZXyV/zwcytCkoqX92BPK8E20rARhed5g54HIh+DE
 Ph5A==
X-Gm-Message-State: AOAM530HDlIqm4TKydWO6zAzXAMj9P9hhsm9PLTEa9H1g1kBeR1kX8f5
 K9elgUMzmF31yM2Pf8VAOojLV0IkPir9kw==
X-Google-Smtp-Source: ABdhPJy9K4117WFb02X+Dim/ZYPolZm8odz9QFc1ktxvhxrI4Hhu7Qamtfbwsz4kpsdtjzVjr8gzNw==
X-Received: by 2002:a17:907:7887:: with SMTP id
 ku7mr4196674ejc.102.1627039676554; 
 Fri, 23 Jul 2021 04:27:56 -0700 (PDT)
Received: from localhost.localdomain ([151.68.138.167])
 by smtp.gmail.com with ESMTPSA id m15sm13729581edp.73.2021.07.23.04.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 04:27:56 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Added VGIF feature
Date: Fri, 23 Jul 2021 13:27:53 +0200
Message-Id: <20210723112753.46047-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=laramglazier@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGIF allows STGI and CLGI to execute in guest mode and control virtual
interrupts in guest mode.
When the VGIF feature is enabled then:
 * executing STGI in the guest sets bit 9 of the VMCB offset 60h.
 * executing CLGI in the guest clears bit 9 of the VMCB offset 60h.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.c                   |  3 ++-
 target/i386/svm.h                   |  6 +++++
 target/i386/tcg/sysemu/svm_helper.c | 36 +++++++++++++++++++++++++----
 3 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 48b55ebd0a..5e6d2b4294 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -631,7 +631,8 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_EXT3_FEATURES (CPUID_EXT3_LAHF_LM | CPUID_EXT3_SVM | \
           CPUID_EXT3_CR8LEG | CPUID_EXT3_ABM | CPUID_EXT3_SSE4A)
 #define TCG_EXT4_FEATURES 0
-#define TCG_SVM_FEATURES CPUID_SVM_NPT
+#define TCG_SVM_FEATURES (CPUID_SVM_NPT | CPUID_SVM_VGIF | \
+          CPUID_SVM_SVME_ADDR_CHK)
 #define TCG_KVM_FEATURES 0
 #define TCG_7_0_EBX_FEATURES (CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_SMAP | \
           CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ADX | \
diff --git a/target/i386/svm.h b/target/i386/svm.h
index e54670ef12..dab2f90925 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -9,6 +9,12 @@
 #define V_IRQ_SHIFT 8
 #define V_IRQ_MASK (1 << V_IRQ_SHIFT)
 
+#define V_GIF_ENABLED_SHIFT 25
+#define V_GIF_ENABLED_MASK (1 << V_GIF_ENABLED_SHIFT)
+
+#define V_GIF_SHIFT 9
+#define V_GIF_MASK (1 << V_GIF_SHIFT)
+
 #define V_INTR_PRIO_SHIFT 16
 #define V_INTR_PRIO_MASK (0x0f << V_INTR_PRIO_SHIFT)
 
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 6118f6f587..ea85e3cae8 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -118,6 +118,11 @@ static inline void svm_vmrun_canonicalization(CPUX86State *env)
     env->tr.base = (long) ((uint32_t) env->tr.base);
 }
 
+static inline bool virtual_gif_enabled(CPUX86State *env, uint32_t int_ctl)
+{
+    return (int_ctl & V_GIF_ENABLED_MASK) && (env->features[FEAT_SVM] & CPUID_SVM_VGIF);
+}
+
 void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
@@ -353,9 +358,12 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
         tlb_flush(cs);
         break;
     }
-
-    env->hflags2 |= HF2_GIF_MASK;
-
+    if (virtual_gif_enabled(env, int_ctl)) {
+        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
+                        int_ctl |= V_GIF_MASK);
+    } else {
+        env->hflags2 |= HF2_GIF_MASK;
+    }
     if (int_ctl & V_IRQ_MASK) {
         CPUState *cs = env_cpu(env);
 
@@ -513,13 +521,31 @@ void helper_vmsave(CPUX86State *env, int aflag)
 void helper_stgi(CPUX86State *env)
 {
     cpu_svm_check_intercept_param(env, SVM_EXIT_STGI, 0, GETPC());
-    env->hflags2 |= HF2_GIF_MASK;
+
+    CPUState *cs = env_cpu(env);
+    uint32_t int_ctl = x86_ldl_phys(cs,
+                       env->vm_vmcb + offsetof(struct vmcb, control.int_ctl));
+    if (virtual_gif_enabled(env, int_ctl) && likely(env->hflags & HF_GUEST_MASK)) {
+        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
+                        int_ctl |= V_GIF_MASK);
+    } else {
+        env->hflags2 |= HF2_GIF_MASK;
+    }
 }
 
 void helper_clgi(CPUX86State *env)
 {
     cpu_svm_check_intercept_param(env, SVM_EXIT_CLGI, 0, GETPC());
-    env->hflags2 &= ~HF2_GIF_MASK;
+
+    CPUState *cs = env_cpu(env);
+    uint32_t int_ctl = x86_ldl_phys(cs,
+                       env->vm_vmcb + offsetof(struct vmcb, control.int_ctl));
+    if (virtual_gif_enabled(env, int_ctl) && likely(env->hflags & HF_GUEST_MASK)) {
+        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
+                        int_ctl &= ~V_GIF_MASK);
+    } else {
+        env->hflags2 &= ~HF2_GIF_MASK;
+    }
 }
 
 bool cpu_svm_has_intercept(CPUX86State *env, uint32_t type)
-- 
2.25.1


