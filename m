Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E166B362832
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:03:18 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTkL-0005UW-KH
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThK-0003PC-Gs
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:10 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThF-0004E9-3N
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:09 -0400
Received: by mail-pg1-x52c.google.com with SMTP id y32so19807024pga.11
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pMgL2a+prtbBPdSaIs5ct/RTVDgGVnnynJ69Tr1rM+o=;
 b=NJ8l0cHRm5UHxiRi092lgHcoMuwyF2SZu569arSzfd6gfcf1Z/22kg9xqJcGe1nlfL
 sqPEsTj/hlQEz3vgRWZBL8vQPkyXgzpCxkA+dBz4/CLF7B71iTu1WOjw4w3+783i8trI
 ODvlYIDpv1J9gCEFVa5fCoiGBYta6iugewsh7lOCpXF9c26Z5lH/S+SCudemU0Tkgq/5
 jegPIndNjG1atOTGZ9+4K23n5Y58w8thTKUrpmtkmJmPqze4PJasYgrIdSTvlFghq2Ah
 rdPXahM95Pr3AUzfqntQ+gAJhCplSuOrzQyw2A5mpoanjBzxPle3bhGS+sFtGvKJuI3/
 lBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pMgL2a+prtbBPdSaIs5ct/RTVDgGVnnynJ69Tr1rM+o=;
 b=KsJPs3Z1kYi0Gab3udZJPs1CeNnHH10UIbVxNxJIsowPd6lABahWf+8LK/WlIUdYR5
 LM/ZAV7bLanOOxGn7fGPdePOElKG6sL4WMZrZcDvIwETWNBz6+QPdUzVzoC+PBySSyWT
 XBuwLNipvzhyPlTbs5TqPrxxRKJ/9NV0U8qZO3k4G7RFRf68bwBnk6tgojcDLknyTAkz
 34f42+hafHDG2n4FXfXC55z99ylFsG7/XcM2/Jxh2qw5QY/HvcdrlxOZq9mInJ+yReFF
 BnjRQEO6fR5WpY1YIPU90hLi0PgRpS/OGCXoEtsJO0yOjIQr6auWgy19nSRy23p1dXAl
 QIhg==
X-Gm-Message-State: AOAM530GSkXzhUSwhWDoquUzF0KKHz1vgBeg24YANWICFt0E66VwQ/n0
 u3F6ZkUI+xgkXiet6HiXwCwY+JhykExgGA==
X-Google-Smtp-Source: ABdhPJzJY8BUf54HVkCJRni9pSp5JSCfXkomnfKW5B4Tv+mw2o+ALIw1HWbNg87U5IsaVOiHmL1hGA==
X-Received: by 2002:a62:f210:0:b029:24a:c8f:c1bf with SMTP id
 m16-20020a62f2100000b029024a0c8fc1bfmr8927789pfh.47.1618599603497; 
 Fri, 16 Apr 2021 12:00:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/30] target/arm: Rename TBFLAG_ANY, PSTATE_SS
Date: Fri, 16 Apr 2021 11:59:32 -0700
Message-Id: <20210416185959.1520974-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to rearrange the macro expansion surrounding tbflags,
and this field name will be expanded using the bit definition of
the same name, resulting in a token pasting error.

So PSTATE_SS -> PSTATE__SS in the uses, and document it.

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
index 9feb572792..45e320f4b3 100644
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


