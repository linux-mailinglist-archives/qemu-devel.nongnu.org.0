Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3811C50A4B2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:51:37 +0200 (CEST)
Received: from localhost ([::1]:51924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ5k-0007fv-BA
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZd-0007uG-2H
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:25 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZb-0006Kk-Co
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:24 -0400
Received: by mail-pl1-x631.google.com with SMTP id q3so5180610plg.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=68QqpgbiFenP+bCAvimHsM0XhqPvZSmZ1iVcz6k5Kxg=;
 b=T1EmAdPR2gQScWXq9frBCwn6rhPgVxo3sUIT3OEjsQskWL8NKizEetCJhJ38EOvKeY
 pJVT5evIV87anRuaB/BPeJfqjExMGhEmhHeCgU23POFZCJ08+yjOy7qnq9Dl9/GxXt5Z
 cP3d3a48FYrdSFiMhHQyPQKvwM24j3MjRxzWKkNnHAUDbqT0rlonJkJPAiUW8k7SxAva
 jpzA0bLwGtvDIq9m9lq3tw52Ra0y9GW5Rp3BcnW2AVIvSJ6z8VJIBhJ7VhSk6lZfDbne
 Cav7ucApOJn89+wnMtmAzgq4cgTDE2Oxmvrg9906Ikl4G0MtHBSZmeSwvaSVu+imv/NI
 unpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=68QqpgbiFenP+bCAvimHsM0XhqPvZSmZ1iVcz6k5Kxg=;
 b=n/IgG+fpMA+WQHVAcyCporON1j+db8FuOJohG0FCymWC1wGlN1s/U/HlCxixbeZO0J
 dIRGnX2rjGCQuZX9je3gVG6Ebp84wMtAxphZieZ9lWbtR+9qwwBy6tfAeIqUWT08wvi2
 /WelTersaImYCZFZKyv9TTw0XCGFKN7wZYF5eFbrJBOgiVpPfqaaDCsahgd6L3EHu5rz
 3dLN/JfqoxkNHhPCUsgHVwamy7wQcz3nes+ls8bGV+C93iS0/ILoiCTNE//wxo4FWhEe
 faAYlDaASczldQzObmY1vTOI6n/rOKxw+Lm8yxtVaP+YDzsa/6TilDL8+19LHM77FQ27
 YZFA==
X-Gm-Message-State: AOAM530bR4eH3KwyBfVDZSnM4wF2UI+QuZTlWUUkp2cEMSmiH30SXtvB
 lahUErAIDZM8dpeQ8PIhxcxY5fT1dTXAqw==
X-Google-Smtp-Source: ABdhPJw9nm3e2tvBPqZjt6svHUW5YM2LrNaJVn5xdYA1OUMrFBB8ZI9amtT7SBtXgOJQLRaeXb3rww==
X-Received: by 2002:a17:902:6ac9:b0:156:a6ae:8806 with SMTP id
 i9-20020a1709026ac900b00156a6ae8806mr26075992plt.148.1650554301664; 
 Thu, 21 Apr 2022 08:18:21 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 28/64] target/nios2: Rename CR_TLBMISC_WR to CR_TLBMISC_WE
Date: Thu, 21 Apr 2022 08:16:59 -0700
Message-Id: <20220421151735.31996-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
---
 target/nios2/cpu.h    | 2 +-
 target/nios2/helper.c | 4 ++--
 target/nios2/mmu.c    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 11e9ed0063..54b592c422 100644
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


