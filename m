Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74A43F2DE2
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:20:47 +0200 (CEST)
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5O2-0003Cx-ND
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mH5Jp-00056I-8g
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:16:25 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mH5Jl-0000qP-56
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:16:24 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1442748wmh.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I4d5/jylUJng8gB+j35WYKKGet2c3NfEVZGEKd+aN0I=;
 b=ucxwkQDU5l8vNrTWZSauZKjmSlwHX2JC8Sc2upIXxyRpi4GX5+H5VoIpTzSnT5+Idf
 f7udUzVW/5a4viBItgM/AiJ6ZqBrWnebKvXSjTbYJJOBAzSyST+bHv5iAn08AMBArnFm
 EhaScw5q4Pu+J2sgS3Y0XBg71+PkqTRpZE1dfB6ictiDtWi4u+X/otprddaYQqThGYFj
 4F+FN85sL6rfEIFW+fKabFrRTAPWJmueYY3io73e1Yc0HgE7mIVcJlhB4Q6IGvdhv+Z6
 1HPTJBF/xx5duZi+8INXhvliiWIGiddKtyrq6StxYvSr5e0cQs5ht1IIpYkn0xL9XpDE
 iQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I4d5/jylUJng8gB+j35WYKKGet2c3NfEVZGEKd+aN0I=;
 b=ZqEVtccPHYdOcoT+9giexKzwkp/IWGzMNN+o8nJPsqzNjXbc4j8eKLH8rwIHjVZaeU
 1ODkbgf912Rt50w/H/Zz/rmatQN6cBczFMmCSCu8Weq3AVXbPaq2OYMtLrg87R51dbSa
 5Jg3KIU9fDRHBG2/5bQ+YAjzR8WuT7hEedC7jjzwxEMzPCd28qBCzXjaRzCONSLhTblq
 HQIFRtFbYkDBzDOZ0lvtm3s9r55g0x63IfMzHEd+D0ElUJ3ZSoEeu96YMS7Jq/FGipE6
 shPMUZw9o6OxRVHXvDO3drJw+PfEGPDQ2vJDeAb2oLJgJXiFIK3PB1gCS1iM+5MMuAzU
 PVrg==
X-Gm-Message-State: AOAM532UH8bv4RcSP1vCB4ldG4kbELm3E9FE8kQXsd1eQX/gDbX0cxVw
 0bFmAuTcFDT3xdcSdpud+RCMTO5qNi9RgQ==
X-Google-Smtp-Source: ABdhPJx1S8aWzvoSwoKxNCwGhuYXTIk6lWrRx86D85prg64MYamtzZzXmtlaTvHHr4Gsvx3WY8+nSA==
X-Received: by 2002:a7b:c856:: with SMTP id c22mr4105116wml.108.1629468979294; 
 Fri, 20 Aug 2021 07:16:19 -0700 (PDT)
Received: from laral.fritz.box
 (dslb-088-066-221-248.088.066.pools.vodafone-ip.de. [88.66.221.248])
 by smtp.gmail.com with ESMTPSA id a133sm10578968wme.5.2021.08.20.07.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 07:16:19 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/i386: Added VGIF V_IRQ masking capability
Date: Fri, 20 Aug 2021 16:15:56 +0200
Message-Id: <20210820141558.9031-3-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820141558.9031-1-laramglazier@gmail.com>
References: <20210820141558.9031-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

VGIF provides masking capability for when virtual interrupts
are taken. (APM2)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.c                   |  7 +++++--
 target/i386/cpu.h                   |  2 ++
 target/i386/tcg/sysemu/svm_helper.c | 12 ++++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5dcdab3b80..b2094175d9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5649,6 +5649,7 @@ static void x86_cpu_reset(DeviceState *dev)
     /* init to reset state */
     env->int_ctl = 0;
     env->hflags2 |= HF2_GIF_MASK;
+    env->hflags2 |= HF2_VGIF_MASK;
     env->hflags &= ~HF_GUEST_MASK;
 
     cpu_x86_update_cr0(env, 0x60000010);
@@ -6532,10 +6533,12 @@ int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
                       !(env->hflags & HF_INHIBIT_IRQ_MASK))))) {
             return CPU_INTERRUPT_HARD;
 #if !defined(CONFIG_USER_ONLY)
-        } else if ((interrupt_request & CPU_INTERRUPT_VIRQ) &&
+        } else if (env->hflags2 & HF2_VGIF_MASK) {
+            if((interrupt_request & CPU_INTERRUPT_VIRQ) &&
                    (env->eflags & IF_MASK) &&
                    !(env->hflags & HF_INHIBIT_IRQ_MASK)) {
-            return CPU_INTERRUPT_VIRQ;
+                        return CPU_INTERRUPT_VIRQ;
+            }
 #endif
         }
     }
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e27a1aab99..d26df6de6b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -203,6 +203,7 @@ typedef enum X86Seg {
 #define HF2_MPX_PR_SHIFT         5 /* BNDCFGx.BNDPRESERVE */
 #define HF2_NPT_SHIFT            6 /* Nested Paging enabled */
 #define HF2_IGNNE_SHIFT          7 /* Ignore CR0.NE=0 */
+#define HF2_VGIF_SHIFT           8 /* Can take VIRQ*/
 
 #define HF2_GIF_MASK            (1 << HF2_GIF_SHIFT)
 #define HF2_HIF_MASK            (1 << HF2_HIF_SHIFT)
@@ -212,6 +213,7 @@ typedef enum X86Seg {
 #define HF2_MPX_PR_MASK         (1 << HF2_MPX_PR_SHIFT)
 #define HF2_NPT_MASK            (1 << HF2_NPT_SHIFT)
 #define HF2_IGNNE_MASK          (1 << HF2_IGNNE_SHIFT)
+#define HF2_VGIF_MASK           (1 << HF2_VGIF_SHIFT)
 
 #define CR0_PE_SHIFT 0
 #define CR0_MP_SHIFT 1
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 9ef2454779..2c44bdb243 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -130,6 +130,11 @@ static inline bool virtual_gif_enabled(CPUX86State *env)
     return false;
 }
 
+static inline bool virtual_gif_set(CPUX86State *env)
+{
+    return !virtual_gif_enabled(env) || (env->int_ctl & V_GIF_MASK);
+}
+
 void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
@@ -363,6 +368,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
         cs->interrupt_request |= CPU_INTERRUPT_VIRQ;
     }
 
+    if (virtual_gif_set(env)) {
+        env->hflags2 |= HF2_VGIF_MASK;
+    }
+
     /* maybe we need to inject an event */
     event_inj = x86_ldl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
                                                  control.event_inj));
@@ -519,6 +528,7 @@ void helper_stgi(CPUX86State *env)
 
     if (virtual_gif_enabled(env)) {
         env->int_ctl |= V_GIF_MASK;
+        env->hflags2 |= HF2_VGIF_MASK;
     } else {
         env->hflags2 |= HF2_GIF_MASK;
     }
@@ -530,6 +540,7 @@ void helper_clgi(CPUX86State *env)
 
     if (virtual_gif_enabled(env)) {
         env->int_ctl &= ~V_GIF_MASK;
+        env->hflags2 &= ~HF2_VGIF_MASK;
     } else {
         env->hflags2 &= ~HF2_GIF_MASK;
     }
@@ -811,6 +822,7 @@ void do_vmexit(CPUX86State *env)
              env->vm_vmcb + offsetof(struct vmcb, control.event_inj), 0);
 
     env->hflags2 &= ~HF2_GIF_MASK;
+    env->hflags2 &= ~HF2_VGIF_MASK;
     /* FIXME: Resets the current ASID register to zero (host ASID). */
 
     /* Clears the V_IRQ and V_INTR_MASKING bits inside the processor. */
-- 
2.25.1


