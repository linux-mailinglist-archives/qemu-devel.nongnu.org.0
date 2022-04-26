Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7668D510760
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:46:30 +0200 (CEST)
Received: from localhost ([::1]:47128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQCh-0002YT-Qu
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmk-0002hH-K9
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:39 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmh-0004RW-TF
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:37 -0400
Received: by mail-pl1-x629.google.com with SMTP id h12so27287034plf.12
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5Zy2yCkq1/yGdzgbEGm15IgEb8bGe9eHlGj+1AyTDk=;
 b=hIv4NEOz4k4NY4oUeMPtlZpt/oL8FgJwz28WWXt4CkLexhCDWobVuKyeq23TIkHADy
 ba06cy/RPiZw9JBy/qpLX2IpCZIS6jmxEeH85TrKpJ03VaFXSbkfIj9DfK8/mBDACqq7
 2hoFkMfOQDD7XaPy7ycwCO++QHnh+UZtPgAM+s9U/9saVo7dqPJLRaLJ5JPZE1tCrMTf
 LeCFSbku+SjMafBv9L2Ko4+SjGTjE+x0nP/ycJp5+xdDl8WAcYEXQSW0lzRvMz/yh9X0
 p0TjIfKpOfsi7mEYMG+fn7BqNlz0EYWhSrAAYzHTugULGazBR5zWYEzjfmF45wWUWGQC
 fv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5Zy2yCkq1/yGdzgbEGm15IgEb8bGe9eHlGj+1AyTDk=;
 b=4FLFZ214Nvqz13+RSrM5mekmmpRnRhdHLhlzigOEel/whMcI4tXpUqQww1P1STOmdO
 iSAI23b1Z8zdytolr5Gfxt4B8oJtNhXW+7GjyeShesioA3Pjfldk+HxTc96lpOV/0yk6
 rMUNh0a3Nh69L4J9Fi2CWhbSzPNesTZxIb7QIdrSzzrddl9xvOnYSsk/cpoEA+Uqlilb
 bwYsr1lvfJx4o0c5prkeHBPIJhsCWVKknSr74/fsQ4B747zJiC5B472h8s1Hlr2ke+QN
 YruL/jp6+DM0tXOdPkBbngcGq/6kJ1S+o4Zh5d4NbjhPnRzVvhb4aBip3WQOr+0HpCR5
 ty8A==
X-Gm-Message-State: AOAM533MozHkpEVf8QcayUOgJSoDAW9YAoMACyC85qnbIlAhLasd/6he
 aTSdmNTGmBF2+HcopdIWpCdFlwK00X1dyA==
X-Google-Smtp-Source: ABdhPJw/1cqlC/zWruc1kTbTwVWnmM2C8UKKdYqd2G+WkOdEJzvWaQoSVEfJNR5oiBwPQLQMAVzgLA==
X-Received: by 2002:a17:90a:7e97:b0:1d2:7bcb:ee78 with SMTP id
 j23-20020a17090a7e9700b001d27bcbee78mr28545822pjl.40.1650997174134; 
 Tue, 26 Apr 2022 11:19:34 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/68] target/nios2: Rename CR_TLBMISC_WR to CR_TLBMISC_WE
Date: Tue, 26 Apr 2022 11:18:27 -0700
Message-Id: <20220426181907.103691-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

WE is the architectural name of the field, not WR.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-29-richard.henderson@linaro.org>
---
 target/nios2/cpu.h    | 2 +-
 target/nios2/helper.c | 4 ++--
 target/nios2/mmu.c    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index bfa86edd97..54bb6cd9be 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -134,7 +134,7 @@ FIELD(CR_TLBACC, IG, 25, 7)
 #define   CR_TLBMISC_WAY_SHIFT 20
 #define   CR_TLBMISC_WAY_MASK  (0xF << CR_TLBMISC_WAY_SHIFT)
 #define   CR_TLBMISC_RD        (1 << 19)
-#define   CR_TLBMISC_WR        (1 << 18)
+#define   CR_TLBMISC_WE        (1 << 18)
 #define   CR_TLBMISC_PID_SHIFT 4
 #define   CR_TLBMISC_PID_MASK  (0x3FFF << CR_TLBMISC_PID_SHIFT)
 #define   CR_TLBMISC_DBL       (1 << 3)
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index c2d0afe1b6..31d83e0291 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -69,7 +69,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
                                                  cs->exception_index);
 
             env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
-            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
+            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
 
             env->regs[R_EA] = env->pc + 4;
             env->pc = cpu->fast_tlb_miss_addr;
@@ -104,7 +104,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
                                              cs->exception_index);
 
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
+            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
         }
 
         env->regs[R_EA] = env->pc + 4;
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 826cd2afb4..0f33ea5e04 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -95,7 +95,7 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
                                  FIELD_EX32(v, CR_TLBACC, PFN));
 
     /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
-    if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WR) {
+    if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WE) {
         int way = (env->ctrl[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
         int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
@@ -133,7 +133,7 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
 
     trace_nios2_mmu_write_tlbmisc(v >> CR_TLBMISC_WAY_SHIFT,
                                   (v & CR_TLBMISC_RD) ? 'R' : '.',
-                                  (v & CR_TLBMISC_WR) ? 'W' : '.',
+                                  (v & CR_TLBMISC_WE) ? 'W' : '.',
                                   (v & CR_TLBMISC_DBL) ? '2' : '.',
                                   (v & CR_TLBMISC_BAD) ? 'B' : '.',
                                   (v & CR_TLBMISC_PERM) ? 'P' : '.',
-- 
2.34.1


