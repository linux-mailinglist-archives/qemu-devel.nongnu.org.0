Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584547CEF4
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 22:43:00 +0200 (CEST)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsvR5-0004lM-II
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 16:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60791)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hsvMh-0004IW-Oq
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 16:38:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hsvMg-0003OU-J2
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 16:38:27 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46530)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hsvMg-0003NW-DL
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 16:38:26 -0400
Received: by mail-pf1-x444.google.com with SMTP id c3so9373544pfa.13
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 13:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BmJBoz3ocCwfjPIQpLnVRF2wr3dk36b5G/HujhxQoNg=;
 b=Dq6i1Hs91zq16uGduehbgnzKRhAalaBIaKorKOpFS3H0qN/HcGntn1JbQwgg+s7Ew1
 GqApdJQUGjWAxY/aMF00+P9eOlfn99eKYnNQ0sCAQ0KpVVUDXlWA5m/3TwR6jsxqt0Xj
 IQM7HjUKo8dWTW3mgc0mkxqQmTYr+yZ4jfBsGljgZ8K5KPvfyXP6ZhUc6k6uWgCKT3l0
 /d6q2IGejlSyIrwYMz3R13QENJgCD3q2nwCdiFPhusW/aFArl8lIjzL/OHZv3PmlXN4N
 7VRzrHfFj9fKlr/q3Y5cdzxzuJFL1Bnfu1bLTgWtjP6F/GhXJEJ32mGhFYUPXAPidLVz
 O+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BmJBoz3ocCwfjPIQpLnVRF2wr3dk36b5G/HujhxQoNg=;
 b=H+V5UoRJhd5BX7ZrJPG5PhKL/fewUe+ENqtos0vVltNWUS6NTt6i5gwndr+qPuLQHL
 jJfqDAS35IzhJ74M6iWWnV0ieGANo1/Zls+lxRlpIzXBO3l7V+bzSyxV3GRaejwv1HOE
 jjPV5ggapY383TvnvVWOMJVJKCQ9fnhHJW+uZ+q3Fbgs2MnjpstLPEK9Adbhy9g1S/hY
 k5BPajgh81EIrjxgAlFEMD/oNuefiPHgpgB2Qaq8FzhoVpSoNJvqSfuQK2ygTxC8j2wQ
 /xh3zkwMszyiSK67jQrDUSdH0Yl5tlHzKORQxutL4TlB6dtxSLCoi51vf4JL+dzG4qUp
 0WjA==
X-Gm-Message-State: APjAAAUI/GTfbZB4SdBoojiRuvIY25LdskqOMRolVlr/N1LUvhnuoAmR
 XA29GUjLpgafJ9WvFwHmqE/7PPiWV2A=
X-Google-Smtp-Source: APXvYqyCL2CMqPxgwL8CQNGuInvavMSrrVdR9gHFBtMu2xxN/27T3RG46re5lp2XLkfCb17S0cH4zA==
X-Received: by 2002:a62:3895:: with SMTP id
 f143mr48675062pfa.116.1564605505099; 
 Wed, 31 Jul 2019 13:38:25 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 13:38:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 13:37:49 -0700
Message-Id: <20190731203813.30765-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v2 08/32] target/arm: Add CONTEXTIDR_EL2
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not all of the breakpoint types are supported, but those that
only examine contextidr are extended to support the new register.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 50 +++++++++++++++++++++++++++++----------
 target/arm/helper.c       | 11 +++++++++
 2 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index dde80273ff..2e3e90c6a5 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -20,6 +20,7 @@ static bool linked_bp_matches(ARMCPU *cpu, int lbn)
     int ctx_cmps = extract32(cpu->dbgdidr, 20, 4);
     int bt;
     uint32_t contextidr;
+    uint64_t hcr_el2;
 
     /*
      * Links to unimplemented or non-context aware breakpoints are
@@ -40,24 +41,44 @@ static bool linked_bp_matches(ARMCPU *cpu, int lbn)
     }
 
     bt = extract64(bcr, 20, 4);
-
-    /*
-     * We match the whole register even if this is AArch32 using the
-     * short descriptor format (in which case it holds both PROCID and ASID),
-     * since we don't implement the optional v7 context ID masking.
-     */
-    contextidr = extract64(env->cp15.contextidr_el[1], 0, 32);
+    hcr_el2 = arm_hcr_el2_eff(env);
 
     switch (bt) {
     case 3: /* linked context ID match */
-        if (arm_current_el(env) > 1) {
-            /* Context matches never fire in EL2 or (AArch64) EL3 */
+        switch (arm_current_el(env)) {
+        default:
+            /* Context matches never fire in AArch64 EL3 */
             return false;
+        case 2:
+            if (!(hcr_el2 & HCR_E2H)) {
+                /* Context matches never fire in EL2 without E2H enabled. */
+                return false;
+            }
+            contextidr = env->cp15.contextidr_el[2];
+            break;
+        case 1:
+            contextidr = env->cp15.contextidr_el[1];
+            break;
+        case 0:
+            if ((hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+                contextidr = env->cp15.contextidr_el[2];
+            } else {
+                contextidr = env->cp15.contextidr_el[1];
+            }
+            break;
         }
-        return (contextidr == extract64(env->cp15.dbgbvr[lbn], 0, 32));
-    case 5: /* linked address mismatch (reserved in AArch64) */
+        break;
+
+    case 7:  /* linked contextidr_el1 match */
+        contextidr = env->cp15.contextidr_el[1];
+        break;
+    case 13: /* linked contextidr_el2 match */
+        contextidr = env->cp15.contextidr_el[2];
+        break;
+
     case 9: /* linked VMID match (reserved if no EL2) */
     case 11: /* linked context ID and VMID match (reserved if no EL2) */
+    case 15: /* linked full context ID match */
     default:
         /*
          * Links to Unlinked context breakpoints must generate no
@@ -66,7 +87,12 @@ static bool linked_bp_matches(ARMCPU *cpu, int lbn)
         return false;
     }
 
-    return false;
+    /*
+     * We match the whole register even if this is AArch32 using the
+     * short descriptor format (in which case it holds both PROCID and ASID),
+     * since we don't implement the optional v7 context ID masking.
+     */
+    return contextidr == (uint32_t)env->cp15.dbgbvr[lbn];
 }
 
 static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9a18ecf8f6..8baeb3f319 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6801,6 +6801,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, lor_reginfo);
     }
 
+    if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
+        static const ARMCPRegInfo vhe_reginfo[] = {
+            { .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
+              .access = PL2_RW,
+              .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2]) },
+            REGINFO_SENTINEL
+        };
+        define_arm_cp_regs(cpu, vhe_reginfo);
+    }
+
     if (cpu_isar_feature(aa64_sve, cpu)) {
         define_one_arm_cp_reg(cpu, &zcr_el1_reginfo);
         if (arm_feature(env, ARM_FEATURE_EL2)) {
-- 
2.17.1


