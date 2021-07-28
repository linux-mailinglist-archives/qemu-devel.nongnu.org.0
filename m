Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B453D8CEB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 13:41:20 +0200 (CEST)
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8hw8-00066t-33
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 07:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m8hsu-0004ay-GX
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:38:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:42797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m8hss-0001dm-Rn
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:38:00 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso1451271wmp.1
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YK1oraDF+K+LRj3HvSogXzUUaicUMAuka076YjjFQjQ=;
 b=Y3f1zYmY9siS9Z91Y/xIM0Q3MJZLDPfm2JnzWb/F8u1sB7BfhjZ0MOg0CY2RTx1Fut
 rJb/UT5XarWMcDMnhT1Mh3BaoM9oKTFOpVu3/d2il8Y/IrWnUX2ijlp92l2gGRasGmX4
 PnG5F807GnnVGqvRAy8CapG30JP89O7aJgq6/2saBjojTOZR+vVAYdIEUyztFC/+xZE5
 STO61dF+UMLglVQnwYuIH+NbMSd+7bG89k8nWlqrEYkXrIW5XphYPosgrHzeGi50ATz2
 Tk4E7iLWbv+xHzm0lIuEXV27jCBjouLOve6ItVlCCotuv3nQ5Cd0gnkVoAneNAmFIsTi
 TKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YK1oraDF+K+LRj3HvSogXzUUaicUMAuka076YjjFQjQ=;
 b=TtzQKtFRWF9kzTGhH/CZwL+FrdjK584Dp8JQRWjftvRzWrWmPg4spT/hQZQoHmUzeM
 GLRuU5/syoggJR22W6UO9MaB3zR5s0q8NRibUBgh88HGBWaRt2qBiWQtiUGSCROGxd3B
 Y6+xwhi4PqEhhU97JjlIaYsBKkVZqHD+G0cTGaQMbUBsVmiuozz/bciYHEJ3ZLDs48gd
 v8zRdz6ctiKaS9XV8Xblb/tak2oPLljrf8cH61K8WUO5HRVzegIcZOVZ842Fq+EnkfaO
 GPOdebWL33XnqRYYQoDQjn7Obh3M5wXBfdgxVK/IuZTp50UIbkaKaO0wbDaI9BneS39L
 UjNQ==
X-Gm-Message-State: AOAM530348kgnRbgeP8gCqLiTrZlutBdbgqhCqWrdxppqsLgl8ySo/6m
 TbZg3JZNz5dVh/tSTfYp+wsi8RiLeUnE7w==
X-Google-Smtp-Source: ABdhPJyY4oeKVXzCLwU3Z9jvBrqPSdB3dOnAEnS7lgUyhFtEBmlcWU+zIBkHtd/WI+t51PkLKhre6g==
X-Received: by 2002:a1c:a74f:: with SMTP id q76mr24089509wme.112.1627472277219; 
 Wed, 28 Jul 2021 04:37:57 -0700 (PDT)
Received: from localhost.localdomain ([93.55.23.75])
 by smtp.gmail.com with ESMTPSA id c15sm6444600wrx.70.2021.07.28.04.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 04:37:56 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/i386: Added VGIF feature
Date: Wed, 28 Jul 2021 13:37:42 +0200
Message-Id: <20210728113742.41464-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
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
 target/i386/svm.h                   |  6 ++++++
 target/i386/tcg/sysemu/svm_helper.c | 27 +++++++++++++++++++++++++--
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index edb97ebbbe..71d26cf1bd 100644
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
index 7b80f7bc85..72ea7c9a08 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -120,6 +120,11 @@ static inline void svm_vmload_canonicalization(CPUX86State *env)
     env->segs[R_GS].base = (long) (env->segs[R_GS].base & mask);
 }
 
+static inline bool virtual_gif_enabled(CPUX86State *env, uint32_t int_ctl)
+{
+    return (int_ctl & V_GIF_ENABLED_MASK) && (env->features[FEAT_SVM] & CPUID_SVM_VGIF);
+}
+
 void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
@@ -517,13 +522,31 @@ void helper_vmsave(CPUX86State *env, int aflag)
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
+                        int_ctl | V_GIF_MASK);
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
+                        int_ctl & ~V_GIF_MASK);
+    } else {
+        env->hflags2 &= ~HF2_GIF_MASK;
+    }
 }
 
 bool cpu_svm_has_intercept(CPUX86State *env, uint32_t type)
-- 
2.25.1


