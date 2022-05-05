Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A038151BC9B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:59:11 +0200 (CEST)
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYGM-0007Bz-I4
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWf-0004s4-8b
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:11:57 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWd-0003C1-6x
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:11:56 -0400
Received: by mail-wr1-x436.google.com with SMTP id d5so5217645wrb.6
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bYZBKnLPYoT9NJwctlvQqMu7v1ZG2DSl8oWKZwkh4ng=;
 b=svJCPHV3XzdhTClsT94Dwp/Jgjc8ghTeQnCP00DWuuzNtkk0Whg1Ef48OHJWPgRAi7
 MX0f4worBZ8x2ltQ5Glbo94cGbVg0zh3wLCKQyancign4RRix3Zg9g+HYNGLt6yNR7qn
 hjUQLsGfbP7qnBZJ7j4xi61iuYevTtmkoMKPPoFKHz29TYSLSLZG3j+zZOW6GXIqfh5x
 7ALagO4PVsxNqP59wiKNXQGO6DbX8iJBReC461u2hAPYeGsLtc3tRXlpWC027NSo/4wv
 OuuuJjW6GXiKpuNgA/xklBkp18Jr7SgAx77ecKp+H09qnqJJF+GoSGZjko1iwKrifEE6
 Z2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYZBKnLPYoT9NJwctlvQqMu7v1ZG2DSl8oWKZwkh4ng=;
 b=S+2hoRubccV/4oouzWg2cvL+tQTj5WvLxY9wJahaxjysPtjSNTTphj90T3LLC8Kkt1
 jiaX9eVlz6YdeuWiw4P99GSwGHE+PVrLhP8OCN+X5R5pDgzIGVIRD+MrDLUkX6ZNxpOX
 QZ0Tk/XK0IlRpe0CisesuiYY2DeEn0pTGNGZn39aJWf7Lv9wXuHo+zvhRzwD2kqHX3DB
 I52bQiFx7mYCVZax96Wir41FT59anjLBc039120QMjEriqeWtwVB64DmwLYoVXgGtHHU
 dUtrx/Q4dQOKjCUVekWl2aqLr73Q8+IYl1ESapBrsJRCnHWNEPWheO4JlrcMMURfgqBj
 wMDw==
X-Gm-Message-State: AOAM532KrJCoP+1hJq1MVs5/nlIf1m8bzss2ylQwH5UIqHXAy3s40XTz
 f5CJd/U0WqaH1pcTGU2nnwMKHMaHRIr39w==
X-Google-Smtp-Source: ABdhPJz6F6DXXOuxRhpXRTQZC41RNXN5xllNA7QO/9CyTVXQky+sMB53rIWPBaRFlSf73+/HVOY01g==
X-Received: by 2002:adf:e3c1:0:b0:20a:aba9:9b38 with SMTP id
 k1-20020adfe3c1000000b0020aaba99b38mr19615869wrm.673.1651741913562; 
 Thu, 05 May 2022 02:11:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.11.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:11:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/23] target/arm: Reorg CPAccessResult and access_check_cp_reg
Date: Thu,  5 May 2022 10:11:27 +0100
Message-Id: <20220505091147.2657652-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Rearrange the values of the enumerators of CPAccessResult
so that we may directly extract the target el. For the two
special cases in access_check_cp_reg, use CPAccessResult.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220501055028.646596-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h    | 26 ++++++++++++--------
 target/arm/op_helper.c | 56 +++++++++++++++++++++---------------------
 2 files changed, 44 insertions(+), 38 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 8064c0763e2..7f2c30eab1c 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -167,26 +167,32 @@ static inline bool cptype_valid(int cptype)
 typedef enum CPAccessResult {
     /* Access is permitted */
     CP_ACCESS_OK = 0,
+
+    /*
+     * Combined with one of the following, the low 2 bits indicate the
+     * target exception level.  If 0, the exception is taken to the usual
+     * target EL (EL1 or PL1 if in EL0, otherwise to the current EL).
+     */
+    CP_ACCESS_EL_MASK = 3,
+
     /*
      * Access fails due to a configurable trap or enable which would
      * result in a categorized exception syndrome giving information about
      * the failing instruction (ie syndrome category 0x3, 0x4, 0x5, 0x6,
-     * 0xc or 0x18). The exception is taken to the usual target EL (EL1 or
-     * PL1 if in EL0, otherwise to the current EL).
+     * 0xc or 0x18).
      */
-    CP_ACCESS_TRAP = 1,
+    CP_ACCESS_TRAP = (1 << 2),
+    CP_ACCESS_TRAP_EL2 = CP_ACCESS_TRAP | 2,
+    CP_ACCESS_TRAP_EL3 = CP_ACCESS_TRAP | 3,
+
     /*
      * Access fails and results in an exception syndrome 0x0 ("uncategorized").
      * Note that this is not a catch-all case -- the set of cases which may
      * result in this failure is specifically defined by the architecture.
      */
-    CP_ACCESS_TRAP_UNCATEGORIZED = 2,
-    /* As CP_ACCESS_TRAP, but for traps directly to EL2 or EL3 */
-    CP_ACCESS_TRAP_EL2 = 3,
-    CP_ACCESS_TRAP_EL3 = 4,
-    /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 */
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = 5,
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = 6,
+    CP_ACCESS_TRAP_UNCATEGORIZED = (2 << 2),
+    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = CP_ACCESS_TRAP_UNCATEGORIZED | 2,
+    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = CP_ACCESS_TRAP_UNCATEGORIZED | 3,
 } CPAccessResult;
 
 typedef struct ARMCPRegInfo ARMCPRegInfo;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 67be91c7323..76499ffa149 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -632,11 +632,13 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
                                  uint32_t isread)
 {
     const ARMCPRegInfo *ri = rip;
+    CPAccessResult res = CP_ACCESS_OK;
     int target_el;
 
     if (arm_feature(env, ARM_FEATURE_XSCALE) && ri->cp < 14
         && extract32(env->cp15.c15_cpar, ri->cp, 1) == 0) {
-        raise_exception(env, EXCP_UDEF, syndrome, exception_target_el(env));
+        res = CP_ACCESS_TRAP;
+        goto fail;
     }
 
     /*
@@ -655,48 +657,46 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
         mask &= ~((1 << 4) | (1 << 14));
 
         if (env->cp15.hstr_el2 & mask) {
-            target_el = 2;
-            goto exept;
+            res = CP_ACCESS_TRAP_EL2;
+            goto fail;
         }
     }
 
-    if (!ri->accessfn) {
+    if (ri->accessfn) {
+        res = ri->accessfn(env, ri, isread);
+    }
+    if (likely(res == CP_ACCESS_OK)) {
         return;
     }
 
-    switch (ri->accessfn(env, ri, isread)) {
-    case CP_ACCESS_OK:
-        return;
+ fail:
+    switch (res & ~CP_ACCESS_EL_MASK) {
     case CP_ACCESS_TRAP:
-        target_el = exception_target_el(env);
-        break;
-    case CP_ACCESS_TRAP_EL2:
-        /* Requesting a trap to EL2 when we're in EL3 is
-         * a bug in the access function.
-         */
-        assert(arm_current_el(env) != 3);
-        target_el = 2;
-        break;
-    case CP_ACCESS_TRAP_EL3:
-        target_el = 3;
         break;
     case CP_ACCESS_TRAP_UNCATEGORIZED:
-        target_el = exception_target_el(env);
-        syndrome = syn_uncategorized();
-        break;
-    case CP_ACCESS_TRAP_UNCATEGORIZED_EL2:
-        target_el = 2;
-        syndrome = syn_uncategorized();
-        break;
-    case CP_ACCESS_TRAP_UNCATEGORIZED_EL3:
-        target_el = 3;
         syndrome = syn_uncategorized();
         break;
     default:
         g_assert_not_reached();
     }
 
-exept:
+    target_el = res & CP_ACCESS_EL_MASK;
+    switch (target_el) {
+    case 0:
+        target_el = exception_target_el(env);
+        break;
+    case 2:
+        assert(arm_current_el(env) != 3);
+        assert(arm_is_el2_enabled(env));
+        break;
+    case 3:
+        assert(arm_feature(env, ARM_FEATURE_EL3));
+        break;
+    default:
+        /* No "direct" traps to EL1 */
+        g_assert_not_reached();
+    }
+
     raise_exception(env, EXCP_UDEF, syndrome, target_el);
 }
 
-- 
2.25.1


