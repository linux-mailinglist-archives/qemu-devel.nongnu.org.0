Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBCE31FFC0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 21:19:42 +0100 (CET)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDCFZ-0008Tz-8E
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 15:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GB0wYAMKChsG337FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--pcc.bounces.google.com>)
 id 1lDCEW-000847-Sk
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 15:18:37 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:39578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GB0wYAMKChsG337FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--pcc.bounces.google.com>)
 id 1lDCEV-0001pB-6s
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 15:18:36 -0500
Received: by mail-yb1-xb49.google.com with SMTP id l10so8066446ybt.6
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 12:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=u7NCeV5nCr4O2aBN9HVAWgiqsXWYPxoJWN2yWilaZhs=;
 b=WRRxlWqZiCZcXZQOk7oF7PYVkFW0mCYFC3vVdpSN7OBp6kc3eMuK2J7OU3D8BOS77F
 vFL+/u0A6vyGn9V1t0WwxQ95FI9CMz/If+LjzAC3eH0iT6cAKbAxzKkTVJSg4CHICUyK
 OOFbzEn8wm49j54UiO3Nf6cede6wyAdHaJTQsV+v7DATZ08tFSLHM7hId8sL7+xGCqca
 bMvWBrapvFx3Dsu/eIgjs5z5j1Nbw9mNjLW/qXhlXgoHA/GloEkj3in/50s+4HDDZ3Fe
 10CkMovQC/JkRNzyBD2jnZf7Knx7HgKf3n3/N4VxA7P4ztWUVt7DdKz8qHPYurJNxt23
 sZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=u7NCeV5nCr4O2aBN9HVAWgiqsXWYPxoJWN2yWilaZhs=;
 b=o/ApJ3UO3eXW481fiMwOxCpDj987b24l27BXt221rmwu/5efWuQ47dyvvvzMaa8rPu
 5PMFCtuQS8J7DGxEDQRaGNuZZWsuBGd2rQbhetY1X91MpcjQQ6NwL+jDXpxDW/RQUQqS
 TmCP3BwcE1Jz8Qw1/v5S8M8EeAP8a50k89tdj1PLemZPEZeeHo2QLBbtchAVWWYQK+eo
 LZggTVkylVybT8fAhPtMCVcr6A2xUbwNd1aPS2jzQiXLW+pcXv94VfCUm0wqX8QohyoJ
 23vQ9nVrd9hU1vOsyegHHUtLlxJPxTaTBOaIYAUa/w/B7KWrMCUyG9DW0jwC6l3WBLUD
 TbNQ==
X-Gm-Message-State: AOAM533kgZKRkhRKvrsNgbtzltVx+WX/7JVLevTq9/UVM4HWKYQGIAz6
 KA6ZaxVJ3F32y/jAJz0AxKTRTE0=
X-Google-Smtp-Source: ABdhPJw6sv0h+PVlJvBIGgIIUCCYrnGLLT0Z6nS49GI0Vg8PqxnEJQn0s0YPXVunEnfJxlBa/Gt0DYc=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:0:7db9:6ae9:983e:1061])
 (user=pcc job=sendgmr) by 2002:a25:e0d7:: with SMTP id
 x206mr16861631ybg.159.1613765912551; 
 Fri, 19 Feb 2021 12:18:32 -0800 (PST)
Date: Fri, 19 Feb 2021 12:18:20 -0800
Message-Id: <20210219201820.2672077-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH] target/arm: Use TCF0 and TFSRE0 for unprivileged tag checks
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Peter Collingbourne <pcc@google.com>, qemu-devel@nongnu.org, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, eugenis@google.com,
 mitchp@google.com, serbanc@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3GB0wYAMKChsG337FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--pcc.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Peter Collingbourne <pcc@google.com>
From:  Peter Collingbourne via <qemu-devel@nongnu.org>

Section D6.7 of the ARM ARM states:

For the purpose of determining Tag Check Fault handling, unprivileged
load and store instructions are treated as if executed at EL0 when
executed at either:
- EL1, when the Effective value of PSTATE.UAO is 0.
- EL2, when both the Effective value of HCR_EL2.{E2H, TGE} is {1, 1}
  and the Effective value of PSTATE.UAO is 0.

ARM has confirmed a defect in the pseudocode function
AArch64.TagCheckFault that makes it inconsistent with the above
wording. The remedy is to adjust references to PSTATE.EL in that
function to instead refer to AArch64.AccessUsesEL(acctype), so
that unprivileged instructions use SCTLR_EL1.TCF0 and TFSRE0_EL1.
The exception type for synchronous tag check faults remains unchanged.

This patch implements the described change by partially reverting
commits 50244cc76abc and cc97b0019bb5.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 target/arm/helper.c     |  2 +-
 target/arm/mte_helper.c | 13 +++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e1a3b9421..b0223bda4c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13133,7 +13133,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         if (FIELD_EX32(flags, TBFLAG_A64, UNPRIV)
             && tbid
             && !(env->pstate & PSTATE_TCO)
-            && (sctlr & SCTLR_TCF)
+            && (sctlr & SCTLR_TCF0)
             && allocation_tag_access_enabled(env, 0, sctlr)) {
             flags = FIELD_DP32(flags, TBFLAG_A64, MTE0_ACTIVE, 1);
         }
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 1c569336ea..0bbb9ec346 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -550,10 +550,14 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
     reg_el = regime_el(env, arm_mmu_idx);
     sctlr = env->cp15.sctlr_el[reg_el];
 
-    el = arm_current_el(env);
-    if (el == 0) {
+    switch (arm_mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E20_0:
+        el = 0;
         tcf = extract64(sctlr, 38, 2);
-    } else {
+        break;
+    default:
+        el = reg_el;
         tcf = extract64(sctlr, 40, 2);
     }
 
@@ -570,7 +574,8 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
         env->exception.vaddress = dirty_ptr;
 
         is_write = FIELD_EX32(desc, MTEDESC, WRITE);
-        syn = syn_data_abort_no_iss(el != 0, 0, 0, 0, 0, is_write, 0x11);
+        syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0,
+                                    is_write, 0x11);
         raise_exception(env, EXCP_DATA_ABORT, syn, exception_target_el(env));
         /* noreturn, but fall through to the assert anyway */
 
-- 
2.30.0.617.g56c4b15f3c-goog


