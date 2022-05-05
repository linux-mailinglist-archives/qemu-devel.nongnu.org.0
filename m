Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2779A51C9D6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 22:01:20 +0200 (CEST)
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhf5-0006Ct-1J
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 16:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZJ-0003fc-RS; Thu, 05 May 2022 14:51:17 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:33776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZH-0004or-Ve; Thu, 05 May 2022 14:51:17 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 c5-20020a9d75c5000000b00605ff3b9997so3534087otl.0; 
 Thu, 05 May 2022 11:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U1z8vMIfOXAZ4PuirGgfmdCyJQ9770ek9XusFJNQJkI=;
 b=d1Gby2Zy79mLjS+AnO9c6ZKmSlD3rTpx6grsJ/ih6qr+kystM0u3q858a+7D/OUj/8
 Q5O1XJoR/Xby8jTQhyl/NmL9B66OsGTT31lPYOzcU+Y1YDxsqNsFr5/Rk9aiHDKkFVtP
 ZV8BecuLIHRLYTK/RaR9LQVX4nmLPAEFGU4/GY98u//Q6C5GVbhcPs9oOtffud0sIKkD
 mZw/LmJJx6bWp6EN9C1e1s7/Hv1ORyZ0Uq90B3wNeZOoD67VMrvPOwANUMfzh/m+Y+qE
 /5yGLu0DRgB46jzzYx8z9tj1/JMgkkEyBsiyfwyxwtkUtWUWTY/LMwSc7BQfYSEIsc+l
 caZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U1z8vMIfOXAZ4PuirGgfmdCyJQ9770ek9XusFJNQJkI=;
 b=qM6hX9xPhCLYxsdOULJ5GkKmyQg7vgPuSni5zpeW6uwKOG5PIDs/W6yc6glQLyIofM
 HCTr5RbeX3NSWCxCWcM3G9oZqtXscZhJzTaQD6KqL7rsRYKt9/Dmkf5unLJuguRyPoOS
 +qQ9q9l4C1MyG7TqDcQ1DuRVtGfV84a6/bJJVPbBp1EOxUR5CaZbB+fAMS82I63Y4RmR
 axte2k/xL70cFKG1n7t02Zy9/4vZZWR/jgTbWQ1MH2BszwBKXi9U0pSDlWvmR+HkjfN0
 Qr39iR+gKMYZl50epTlCLyl9ZauuGnPB+u8f95rVN2+NH00zDYhAh8mxuPeGGNUk4naZ
 S58w==
X-Gm-Message-State: AOAM532C7k/fUSvJHnoWMn/uPgFotShq8Vp8e185QicdD3iiyva29hcE
 HQD10V1poDG7j/bPLVOPm+io6rTOmdY=
X-Google-Smtp-Source: ABdhPJyWMdO/pksQc2QxJPIUomp6W35YHmR7VF30pz8SNumrFdpDjjXrnggYg10V28NSjeNXQeVIeg==
X-Received: by 2002:a9d:27a9:0:b0:605:efee:1a4e with SMTP id
 c38-20020a9d27a9000000b00605efee1a4emr9812998otb.287.1651776674494; 
 Thu, 05 May 2022 11:51:14 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 22/30] target/ppc: Remove msr_ir macro
Date: Thu,  5 May 2022 15:49:30 -0300
Message-Id: <20220505184938.351866-23-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
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

msr_ir macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-15-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/helper_regs.c |  2 +-
 target/ppc/mmu_common.c  | 11 ++++++-----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 75a81d4304..6cfbec26a1 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -363,6 +363,7 @@ FIELD(MSR, EE, MSR_EE, 1)
 FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
+FIELD(MSR, IR, MSR_IR, 1)
 FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
 
@@ -485,7 +486,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
 #define msr_ep   ((env->msr >> MSR_EP)   & 1)
-#define msr_ir   ((env->msr >> MSR_IR)   & 1)
 #define msr_dr   ((env->msr >> MSR_DR)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 4e649d8b0e..e40078c001 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -227,7 +227,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
         value &= ~MSR_HVB;
         value |= env->msr & MSR_HVB;
     }
-    if (((value >> MSR_IR) & 1) != msr_ir ||
+    if (((value ^ env->msr) & R_MSR_IR_MASK) ||
         ((value >> MSR_DR) & 1) != msr_dr) {
         cpu_interrupt_exittb(cs);
     }
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 031bb4493b..30deca0425 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -388,7 +388,7 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                   " nip=" TARGET_FMT_lx " lr=" TARGET_FMT_lx
                   " ir=%d dr=%d pr=%d %d t=%d\n",
                   eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr,
-                  (int)msr_ir, (int)msr_dr, pr ? 1 : 0,
+                  (int)FIELD_EX64(env->msr, MSR, IR), (int)msr_dr, pr ? 1 : 0,
                   access_type == MMU_DATA_STORE, type);
     pgidx = (eaddr & ~SEGMENT_MASK_256M) >> target_page_bits;
     hash = vsid ^ pgidx;
@@ -626,7 +626,8 @@ found_tlb:
     }
 
     /* Check the address space */
-    if ((access_type == MMU_INST_FETCH ? msr_ir : msr_dr) != (tlb->attr & 1)) {
+    if ((access_type == MMU_INST_FETCH ?
+        FIELD_EX64(env->msr, MSR, IR) : msr_dr) != (tlb->attr & 1)) {
         qemu_log_mask(CPU_LOG_MMU, "%s: AS doesn't match\n", __func__);
         return -1;
     }
@@ -839,7 +840,7 @@ found_tlb:
     if (access_type == MMU_INST_FETCH) {
         /* There is no way to fetch code using epid load */
         assert(!use_epid);
-        as = msr_ir;
+        as = FIELD_EX64(env->msr, MSR, IR);
     }
 
     if (as != ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
@@ -1169,7 +1170,7 @@ int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
                                      int mmu_idx)
 {
     int ret = -1;
-    bool real_mode = (type == ACCESS_CODE && msr_ir == 0)
+    bool real_mode = (type == ACCESS_CODE && !FIELD_EX64(env->msr, MSR, IR))
         || (type != ACCESS_CODE && msr_dr == 0);
 
     switch (env->mmu_model) {
@@ -1231,7 +1232,7 @@ static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
     bool use_epid = mmubooke206_get_as(env, mmu_idx, &epid, &as, &pr);
 
     if (access_type == MMU_INST_FETCH) {
-        as = msr_ir;
+        as = FIELD_EX64(env->msr, MSR, IR);
     }
     env->spr[SPR_BOOKE_MAS0] = env->spr[SPR_BOOKE_MAS4] & MAS4_TLBSELD_MASK;
     env->spr[SPR_BOOKE_MAS1] = env->spr[SPR_BOOKE_MAS4] & MAS4_TSIZED_MASK;
-- 
2.32.0


