Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBD150BDF0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:06:37 +0200 (CEST)
Received: from localhost ([::1]:50234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwjs-0005bq-Ej
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXG-0001ar-CB
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:34 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXE-0007Ko-K1
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:34 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d15so12084344pll.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5Zy2yCkq1/yGdzgbEGm15IgEb8bGe9eHlGj+1AyTDk=;
 b=KD/SclmNbkBEhfOrE43dgXSI5msKluTLVbbcstgk7NAbLNCuZ5fKYdw7UJeIO8jgTd
 RTqDCD3w5NM+pC2M8sNwSogZ20UMroY+f0ScMfXGJNbwn8GUVE48BuwOZijEINRjdWrN
 4phj+zhbVpIdkCKHa4EKa8Rd+tFdzXqDGsMaOP6kO0NL/fGef9ws6zyD6HKbb6tDt3IN
 yTbzZgL0+5y8N0dxl3DBcq2upAaH4lPheBptWTgc4eA4yt1QRHI2rRvMNquN1awfaK23
 nbCqt2d63qqshCM4ZwfhgprMOhijKCaPy6iu0ogWOEHblQjBCjczTWbTpp/3uHt1Njwd
 Q40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5Zy2yCkq1/yGdzgbEGm15IgEb8bGe9eHlGj+1AyTDk=;
 b=KLLDon9KehJ2B3og7jKdFxQNZ60tOR2QV7qgIav8gdaGtq7OQ2WlBmpouROibfDivU
 iaolDpPipKE3Rj9MHktM1jyrJ7jncOqVzf3PmV7yN6eUS5bNDlVImq9CmMq1JXj9q1Va
 LRLdVnddOa0BxvKaCsheNZCgZAgAQuxzr9OwDJ12PYr8NSi5PF/BiHL6Keu2gX8C27UA
 CEvDJ65gDHQf/kGc4Sva6CRA1dugtf2VYK45+D/gL+XY9YeRr/NZBMYziBiwu8U2Z8AO
 hj5mGU9FZSKGfckX3dBBPprFHGI4sfnXuS+8Tk79dJaHMjtVyNpGDu4jxBkxvRJKoIc3
 26SA==
X-Gm-Message-State: AOAM532cWGL673HN67psJ88QN/P0ggbd2oYaPdV83e1QAlLzEqdk3Iur
 VSFKY0x+ei7DjXC/0As5D2TAfKSMfNmPIWqk
X-Google-Smtp-Source: ABdhPJx5tL7v4k4LCbEi273bSSvbTQqvPOikeaLVZwvEQbyg46ElwlAj7jny6akQsf512JwHjUIBYg==
X-Received: by 2002:a17:902:7244:b0:158:41d3:b79b with SMTP id
 c4-20020a170902724400b0015841d3b79bmr5564324pll.50.1650646411382; 
 Fri, 22 Apr 2022 09:53:31 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 28/68] target/nios2: Rename CR_TLBMISC_WR to CR_TLBMISC_WE
Date: Fri, 22 Apr 2022 09:51:58 -0700
Message-Id: <20220422165238.1971496-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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


