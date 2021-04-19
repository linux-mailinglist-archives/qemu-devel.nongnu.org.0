Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E23364B26
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:30:00 +0200 (CEST)
Received: from localhost ([::1]:39192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaWt-0005FF-A2
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQH-0006lB-9x
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:09 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:40686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQF-0002PJ-Gh
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:09 -0400
Received: by mail-qt1-x82b.google.com with SMTP id z15so19055185qtj.7
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S+96K5/eo9ZOKuEOLJap6NC5Im9DSZzOtXQbHb1hX9I=;
 b=p1IWm61ARq0Xp8o7mOLWWrZ9/IkPxjI5G2gqlCLZBT/SlF6LvirDzbyS+VLcXIstVZ
 Hv6AwIaSlQs1y0P1sDMGi4vNbm5isY1p2b+wOJH+R2K5HLjmHl8imwhpp/35YSq8mNON
 +Ayr3HJoTlYlpEOs/+rBYeTzSzo6wg3J+Y86aG6hE06cdbrDo1qq+zp/LTpmWqODiEQW
 KwtEnfAriRNyJBwBqyy8xDySn9sY97d3eu61xquTEqzVQapBrZKNqpZCApZ1lYom/rbH
 wO6LSThi0YabCCTE2Sc1i8R8esFzOnqwW7ym7Qz8S+xFDZkgux5menpgUmzTgtcmEVBC
 rIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+96K5/eo9ZOKuEOLJap6NC5Im9DSZzOtXQbHb1hX9I=;
 b=EU27cyLhx4u3ZjIY4GAkjnvYMsh6jZvCDq7J3qvQxFevtJEvp6UDnqa7hpBMe9DQKi
 UpG56Zf50CE4sN6PxsYaE8cQWZKfg6nux6S3mK3s5BKk/zmAKx5mGuyYfSiS+Rjieynb
 TzYhFZID74999G3etIG2A3q5ACxfDEzKtTe14oHYO5Ib/q+NHnlK+oLjrjHaVaYQ2fqM
 BjZrrdFiO+L2U2D8EICmN5l7VQFvFBA7/FzVoKC0ixE122BeYThu4+Iv0WNXvjAlL/HR
 A8JTKzjgAR6cVaR6DQ5Ye5ISUYc3LBCjGkQ3gIeQICoKWLKNTwZb/JeHJGl79tJYjARJ
 x1EQ==
X-Gm-Message-State: AOAM5314XtmUTRp/0Tx4UKnZ2nim8LHRI8e7kEW/m9xitVM/AV6LIzA8
 2H8209gqXtOT8Ii37PmqayEJ0+gK5eO0fNg4
X-Google-Smtp-Source: ABdhPJwCZEAZ6gKyV0pRPWcxkK8/MkvjdRvLWiM773GU+9XXRcBZPELCx3HrNGPwu4ET/VqFukoaHQ==
X-Received: by 2002:ac8:6f72:: with SMTP id u18mr13279562qtv.295.1618863786490; 
 Mon, 19 Apr 2021 13:23:06 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/31] target/arm: Rename TBFLAG_ANY, PSTATE_SS
Date: Mon, 19 Apr 2021 13:22:29 -0700
Message-Id: <20210419202257.161730-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to rearrange the macro expansion surrounding tbflags,
and this field name will be expanded using the bit definition of
the same name, resulting in a token pasting error.

So PSTATE_SS -> PSTATE__SS in the uses, and document it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 2 +-
 target/arm/helper.c        | 4 ++--
 target/arm/translate-a64.c | 2 +-
 target/arm/translate.c     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 304e0a6af3..4cbf2db3e3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3396,7 +3396,7 @@ typedef ARMCPU ArchCPU;
  */
 FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
 FIELD(TBFLAG_ANY, SS_ACTIVE, 30, 1)
-FIELD(TBFLAG_ANY, PSTATE_SS, 29, 1)     /* Not cached. */
+FIELD(TBFLAG_ANY, PSTATE__SS, 29, 1)    /* Not cached. */
 FIELD(TBFLAG_ANY, BE_DATA, 28, 1)
 FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
 /* Target EL if we take a floating-point-disabled exception */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 556b9d4f0a..cd8dec126f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13333,11 +13333,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      *     0            x       Inactive (the TB flag for SS is always 0)
      *     1            0       Active-pending
      *     1            1       Active-not-pending
-     * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
+     * SS_ACTIVE is set in hflags; PSTATE__SS is computed every TB.
      */
     if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE) &&
         (env->pstate & PSTATE_SS)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
+        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE__SS, 1);
     }
 
     *pflags = flags;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f35a5e8174..64b3a5200c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14733,7 +14733,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
      *   end the TB
      */
     dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
+    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
     dc->is_ldex = false;
     dc->debug_target_el = FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0b56e060a5..3c5ca9f7e5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8909,7 +8909,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
      *   end the TB
      */
     dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
+    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
     dc->is_ldex = false;
 
     dc->page_start = dc->base.pc_first & TARGET_PAGE_MASK;
-- 
2.25.1


