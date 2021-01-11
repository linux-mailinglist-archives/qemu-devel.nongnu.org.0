Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF62F1EB7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:13:03 +0100 (CET)
Received: from localhost ([::1]:41076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2cg-0006tI-Ue
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RQ-0005iJ-SC
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:25 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RP-0006NU-AR
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:24 -0500
Received: by mail-pl1-x62e.google.com with SMTP id x12so324243plr.10
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5o6p1C7v9u1rYVGcSBwWhWoi7b3iNDgzQwEbf6mExPY=;
 b=ZkjMUq72RsfIIrpUdML+UKLNv5NwNmGxQvCuyAlukFVQ8NpAJWOE5ckZe+teWrTRzn
 v3fWS6WnVvW/Ov0j9fa5bdD8gm62oCrytk5cKbG8z6pFX+EXgTtNhTDBYObfXYUr1y2H
 xEFKw79OYrPiCkeejIWm4dwOvP5plL5oE597qssLIl1squKzQFvobY29nVpgnEPLjZW1
 h2jjH+oBsef/73LyyxImZZvojQPceexHat+m3dSAWiOjlyxshAaAu7lZCKRe3uVONpEi
 mBei9Gbr6DIHID7Vkv+s/KpYsTQYCGLe3hliLw2NZSFmxtz2C8UTSN3lDVPSbU1WMv+Z
 IIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5o6p1C7v9u1rYVGcSBwWhWoi7b3iNDgzQwEbf6mExPY=;
 b=rrayfWHxCkYWksovJCZyqd/7Wi+EUDfAk9Hoy4JqVkK1lMFjXexSwJbxby7ozUBWIz
 GIzxcTDhmSOaYgCPU6Gt08BsfZfbTGrKYWZpER3rPOT0bXSkNPcIjE+OA1M9avNOqOOx
 k3h6/JsSitJeIPwkZZzEia7KnGUIabS5EVEdmrRGig/92Hcyn1wnXlgxudtwj9FOhc0v
 yUqPckGCrdzpyMiQMus6QudoP0A2F2AaiwwVDPQs1nKibBp6MNxdD9Try1h81GXW/Nl7
 2HYdZsT8hV2ml+HRtYP5d3eUfz6PL19r/qXEDDYUpC0v+Dk6MdkHn2MI/lqlwVnFeo0j
 ixUQ==
X-Gm-Message-State: AOAM531Bk74a9yfq+rBDIopHU+uOyOXQwdjgpAtxNvpV0XzM2jIg4PB3
 rFQxQ7lVtUywzw5z+J8RWG2bejAX/pFwMg==
X-Google-Smtp-Source: ABdhPJyi1/U4qXgPXXUhxMNhe9yJiad7JjSKnvX1Ajzqv+rmfOysc9WkSY1RMR161Wxns+SexO3XkQ==
X-Received: by 2002:a17:90a:658c:: with SMTP id
 k12mr283372pjj.31.1610391681404; 
 Mon, 11 Jan 2021 11:01:21 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/30] target/arm: Rename TBFLAG_ANY, PSTATE_SS
Date: Mon, 11 Jan 2021 09:00:46 -1000
Message-Id: <20210111190113.303726-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
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
index aa0bc6e281..89d69cbcd1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3266,7 +3266,7 @@ typedef ARMCPU ArchCPU;
  */
 FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
 FIELD(TBFLAG_ANY, SS_ACTIVE, 30, 1)
-FIELD(TBFLAG_ANY, PSTATE_SS, 29, 1)     /* Not cached. */
+FIELD(TBFLAG_ANY, PSTATE__SS, 29, 1)    /* Not cached. */
 FIELD(TBFLAG_ANY, BE_DATA, 28, 1)
 FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
 /* Target EL if we take a floating-point-disabled exception */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0d70b37adc..7a7e4c3ad4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13094,11 +13094,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      *     0            x       Inactive (the TB flag for SS is always 0)
      *     1            0       Active-pending
      *     1            1       Active-not-pending
-     * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
+     * SS_ACTIVE is set in hflags; PSTATE__SS is computed every TB.
      */
     if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE) &&
         (pstate_for_ss & PSTATE_SS)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
+        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE__SS, 1);
     }
 
     *pflags = flags;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ef63edfc68..80a3a5f5fb 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14748,7 +14748,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
      *   end the TB
      */
     dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
+    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
     dc->is_ldex = false;
     dc->debug_target_el = FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 460476384c..67d509d29c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8872,7 +8872,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
      *   end the TB
      */
     dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
+    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
     dc->is_ldex = false;
 
     dc->page_start = dc->base.pc_first & TARGET_PAGE_MASK;
-- 
2.25.1


