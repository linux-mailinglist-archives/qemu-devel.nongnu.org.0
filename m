Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA7051C9A1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:50:04 +0200 (CEST)
Received: from localhost ([::1]:58150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhUB-0003wL-In
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZM-0003lc-F3; Thu, 05 May 2022 14:51:20 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:41648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZK-0004ph-Pb; Thu, 05 May 2022 14:51:20 -0400
Received: by mail-oi1-x230.google.com with SMTP id e189so5247309oia.8;
 Thu, 05 May 2022 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/x1aF0z1ehstGW5JiUUCt9PevsZu893oCeFaCZnerLQ=;
 b=GC1cO4T3G4xUQgEejK+iWATay242csi/HNKc9y8/Zx2uych8d2HhnpNG0zu/R8Swaq
 F0sAOGcBJI2ai673j5/oZI8kwiZ5HigEwZoSa+h4bbFcAbjruVgfMJ92IU8/CInRVSH+
 JdhFGsDeB5eEoX/ihPr+KVrLuc9aNanXt+NX0h/0hZRnrtmsCzjsSL3TP76UW8tWbq5k
 vpApN1eEUF7saPUYe5wx5Cb4imzv3N78aWPQX1tyg50f92gFJdjYpgRexsvcKPdT482R
 O2epSwyy3cDA7MoFuSn++8H7Y+TfHEOOUyCwYXkA+TpPTfAY+JJJd9Pnxrfu1HBBG+k+
 mwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/x1aF0z1ehstGW5JiUUCt9PevsZu893oCeFaCZnerLQ=;
 b=XsFQ+1xrJ+OF/oTLhI0NdomRv2SwUyNdDkhN7EdKG9VtrkFcxk/I2vkGHVybWPsC+h
 zkz86HXTJq59ATGayV6niCHofsrKPHHfcPbDhQNYyfx8u8EWeaNzvEXQXqgTm/Hy0tK2
 4i5AZIDZISsevN0AoNO85Dqz8u1+vx2fVdzOuRMZIV3OnVAWKYENBJTSSs1VHLveZixb
 Ng9/lOYs1Bs8C2ZcIPMjVc9BfauxkRJ8YpQfDvXIYSoeu2Cj++7zWZ9P/n1eCPl3dBvc
 GsfXqBk/UfoPcOnPKjQoseOte8HMS6lC2NdtmLfhfYiWsa7ILg/FZVAC0p7Mzv1Nge2Z
 noew==
X-Gm-Message-State: AOAM532Pm8ZOomwarcJoAI2K7+4hQl3sedUaVk1rlneay2VhMNV1aWDw
 Q6WDoUSMyKikUGzLz5efYEwZv1Dg77Y=
X-Google-Smtp-Source: ABdhPJyiTHMb7aB4HmT6lsOjp1Lx2Aox9dYfMSS4jKaOeQUi/rUeFWmkHuo2hXLtv9D2I8HmkHZkdw==
X-Received: by 2002:a05:6808:18a4:b0:326:c33:316d with SMTP id
 bi36-20020a05680818a400b003260c33316dmr3077874oib.59.1651776677333; 
 Thu, 05 May 2022 11:51:17 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 23/30] target/ppc: Remove msr_dr macro
Date: Thu,  5 May 2022 15:49:31 -0300
Message-Id: <20220505184938.351866-24-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

msr_dr macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-16-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/helper_regs.c |  3 +--
 target/ppc/mmu_common.c  | 10 ++++++----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6cfbec26a1..cd672dec93 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -364,6 +364,7 @@ FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
 FIELD(MSR, IR, MSR_IR, 1)
+FIELD(MSR, DR, MSR_DR, 1)
 FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
 
@@ -486,7 +487,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
 #define msr_ep   ((env->msr >> MSR_EP)   & 1)
-#define msr_dr   ((env->msr >> MSR_DR)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index e40078c001..b150b78182 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -227,8 +227,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
         value &= ~MSR_HVB;
         value |= env->msr & MSR_HVB;
     }
-    if (((value ^ env->msr) & R_MSR_IR_MASK) ||
-        ((value >> MSR_DR) & 1) != msr_dr) {
+    if ((value ^ env->msr) & (R_MSR_IR_MASK | R_MSR_DR_MASK)) {
         cpu_interrupt_exittb(cs);
     }
     if ((env->mmu_model == POWERPC_MMU_BOOKE ||
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 30deca0425..89107a6af2 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -388,7 +388,8 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                   " nip=" TARGET_FMT_lx " lr=" TARGET_FMT_lx
                   " ir=%d dr=%d pr=%d %d t=%d\n",
                   eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr,
-                  (int)FIELD_EX64(env->msr, MSR, IR), (int)msr_dr, pr ? 1 : 0,
+                  (int)FIELD_EX64(env->msr, MSR, IR),
+                  (int)FIELD_EX64(env->msr, MSR, DR), pr ? 1 : 0,
                   access_type == MMU_DATA_STORE, type);
     pgidx = (eaddr & ~SEGMENT_MASK_256M) >> target_page_bits;
     hash = vsid ^ pgidx;
@@ -627,7 +628,8 @@ found_tlb:
 
     /* Check the address space */
     if ((access_type == MMU_INST_FETCH ?
-        FIELD_EX64(env->msr, MSR, IR) : msr_dr) != (tlb->attr & 1)) {
+        FIELD_EX64(env->msr, MSR, IR) :
+        FIELD_EX64(env->msr, MSR, DR)) != (tlb->attr & 1)) {
         qemu_log_mask(CPU_LOG_MMU, "%s: AS doesn't match\n", __func__);
         return -1;
     }
@@ -1170,8 +1172,8 @@ int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
                                      int mmu_idx)
 {
     int ret = -1;
-    bool real_mode = (type == ACCESS_CODE && !FIELD_EX64(env->msr, MSR, IR))
-        || (type != ACCESS_CODE && msr_dr == 0);
+    bool real_mode = (type == ACCESS_CODE && !FIELD_EX64(env->msr, MSR, IR)) ||
+                     (type != ACCESS_CODE && !FIELD_EX64(env->msr, MSR, DR));
 
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_6xx:
-- 
2.32.0


