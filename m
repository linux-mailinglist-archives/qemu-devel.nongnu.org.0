Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C9A3EFD8E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 09:12:43 +0200 (CEST)
Received: from localhost ([::1]:36768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGFkh-0000gh-17
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 03:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mGFhD-0006HD-Pn
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:09:07 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mGFhC-0008De-24
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:09:07 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso3647363wmg.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IGArX2IrQtjF8xMsXRaWuGTG5yGCdBd/S4BPB2HvfpE=;
 b=vJ9Tc+il4vJc9TNFvMsRvhyXDKnhAnHxwupRwtegXN6S4aIvq0mw49y29RcsnlGgJp
 CYNfMYPeWo2zENSSQw+hoFm8KfNW1PpLfbu9nZxqkxqbrWfCbBJT7rXShgPNVHdc7ogY
 0bGShLz1kMDh0+Zt69mTBUL+q4dqXnLC/1xB3hL/NBLbEMbo14+21ilqjJNUjliKlwjy
 /7BNzVtlhnZ/hjNLhu9whitvNdZ4+QjWQ0njP8B6JFQSJ1AeeWWRJxf7/1z7+AZvuAY/
 x/LHM7HILKdo93FSSldEW06y7dPA3rteSRyJK7mcfwqJJ6F75ROAN+ycxEVPUzzyaErk
 kJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IGArX2IrQtjF8xMsXRaWuGTG5yGCdBd/S4BPB2HvfpE=;
 b=SNChgT1kN+Psr3k1ib18I1uh0zvdLqgsGdv8hKQvt3TgVbtxoC+WmSxG0mO6pYp+E3
 przKHqM+LSZA726rrFy+HPdHjb36St/H6POGJSEE86TtpzGUGwGKuH9h8aI/d6u/eE1D
 FpSguJFBYDYhabTBg842ze3+tbaNrDxnwhF7n7mJCVjfqgiOu1jtSzRs31fdjNOxsaYa
 meexwN3lVEiO/n16Ol7Y/R5jG57WvbWadRxiSSkLPfyTUwebJ5fjFhg66HjFg2ThsjZ9
 2SE+V8qDSvMx5J6/F6BA3c88FMDuQFCADlBeqBKsdpNBYQM/0D+AwmoD1LlO5fziNmk8
 6dMA==
X-Gm-Message-State: AOAM532iK0ZhJgHz3sRtGXW264oheX9sr/Cg52+lTQIdprQvk6RgbmW0
 goY0MVSYKFzJTSEGpGHdm/kCkSuUK9M=
X-Google-Smtp-Source: ABdhPJwhKq16nzdzOy/aSIocdv8kRwRTDqayYT3mOIpmaM4a0DUZRiBSRfGITrYKgUYuFILvIDYgyg==
X-Received: by 2002:a1c:1b4b:: with SMTP id b72mr7113849wmb.168.1629270544024; 
 Wed, 18 Aug 2021 00:09:04 -0700 (PDT)
Received: from laral.fritz.box
 (200116b82b53c5004989ea3bb9da8dea.dip.versatel-1u1.de.
 [2001:16b8:2b53:c500:4989:ea3b:b9da:8dea])
 by smtp.gmail.com with ESMTPSA id w18sm4902609wrg.68.2021.08.18.00.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:09:03 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Added vVMLOAD and vVMSAVE feature
Date: Wed, 18 Aug 2021 09:08:34 +0200
Message-Id: <20210818070838.44344-2-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818070838.44344-1-laramglazier@gmail.com>
References: <20210818070838.44344-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x32c.google.com
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

The feature allows the VMSAVE and VMLOAD instructions to execute in guest mode without
causing a VMEXIT. (APM2 15.33.1)

This is currently untested; I sent it out as part of my GSoC project.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.h                    |  2 ++
 target/i386/svm.h                    |  2 ++
 target/i386/tcg/sysemu/excp_helper.c |  2 +-
 target/i386/tcg/sysemu/svm_helper.c  | 29 ++++++++++++++++++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 69e722253d..573adc8c22 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2260,6 +2260,8 @@ static inline bool ctl_has_irq(CPUX86State *env)
     return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
+hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
+                        int *prot);
 #if defined(TARGET_X86_64) && \
     defined(CONFIG_USER_ONLY) && \
     defined(CONFIG_LINUX)
diff --git a/target/i386/svm.h b/target/i386/svm.h
index 036597a2ff..f9a785489d 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -24,6 +24,8 @@
 #define V_INTR_MASKING_SHIFT 24
 #define V_INTR_MASKING_MASK (1 << V_INTR_MASKING_SHIFT)
 
+#define V_VMLOAD_VMSAVE_ENABLED_MASK (1 << 1)
+
 #define SVM_INTERRUPT_SHADOW_MASK 1
 
 #define SVM_IOIO_STR_SHIFT 2
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index b6d940e04e..7af887be4d 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -358,7 +358,7 @@ do_check_protect_pse36:
     return error_code;
 }
 
-static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
+hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
                         int *prot)
 {
     CPUX86State *env = &X86_CPU(cs)->env;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 312f10f1e4..94dd2083ce 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -120,6 +120,25 @@ static inline bool virtual_gif_enabled(CPUX86State *env)
     return false;
 }
 
+static inline bool virtual_vm_load_save_enabled(CPUX86State *env, uint32_t exit_code, uintptr_t retaddr)
+{
+    uint64_t lbr_ctl;
+
+    if (likely(env->hflags & HF_GUEST_MASK)) {
+        if (likely(!(env->hflags2 & HF2_NPT_MASK)) || !(env->efer & MSR_EFER_LMA)) {
+            cpu_vmexit(env, exit_code, 0, retaddr);
+        }
+
+        lbr_ctl = x86_ldl_phys(env_cpu(env), env->vm_vmcb + offsetof(struct vmcb,
+                                                  control.lbr_ctl));
+        return (env->features[FEAT_SVM] & CPUID_SVM_V_VMSAVE_VMLOAD)
+                && (lbr_ctl & V_VMLOAD_VMSAVE_ENABLED_MASK);
+
+    }
+
+    return false;
+}
+
 static inline bool virtual_gif_set(CPUX86State *env)
 {
     return !virtual_gif_enabled(env) || (env->int_ctl & V_GIF_MASK);
@@ -430,6 +449,7 @@ void helper_vmload(CPUX86State *env, int aflag)
 {
     CPUState *cs = env_cpu(env);
     target_ulong addr;
+    int prot;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMLOAD, 0, GETPC());
 
@@ -439,6 +459,10 @@ void helper_vmload(CPUX86State *env, int aflag)
         addr = (uint32_t)env->regs[R_EAX];
     }
 
+    if (virtual_vm_load_save_enabled(env, SVM_EXIT_VMLOAD, GETPC())) {
+        addr = get_hphys(cs, addr, MMU_DATA_LOAD, &prot);
+    }
+
     qemu_log_mask(CPU_LOG_TB_IN_ASM, "vmload! " TARGET_FMT_lx
                   "\nFS: %016" PRIx64 " | " TARGET_FMT_lx "\n",
                   addr, x86_ldq_phys(cs, addr + offsetof(struct vmcb,
@@ -472,6 +496,7 @@ void helper_vmsave(CPUX86State *env, int aflag)
 {
     CPUState *cs = env_cpu(env);
     target_ulong addr;
+    int prot;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMSAVE, 0, GETPC());
 
@@ -481,6 +506,10 @@ void helper_vmsave(CPUX86State *env, int aflag)
         addr = (uint32_t)env->regs[R_EAX];
     }
 
+    if (virtual_vm_load_save_enabled(env, SVM_EXIT_VMSAVE, GETPC())) {
+        addr = get_hphys(cs, addr, MMU_DATA_STORE, &prot);
+    }
+
     qemu_log_mask(CPU_LOG_TB_IN_ASM, "vmsave! " TARGET_FMT_lx
                   "\nFS: %016" PRIx64 " | " TARGET_FMT_lx "\n",
                   addr, x86_ldq_phys(cs,
-- 
2.25.1


