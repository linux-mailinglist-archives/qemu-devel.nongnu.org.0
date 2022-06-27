Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9C955B93B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:44:27 +0200 (CEST)
Received: from localhost ([::1]:38860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mEE-0006Sk-NE
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltL-0002M1-Fp
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:51 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltJ-0004tn-Fi
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so5301557wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QsvjWMzgsdTwwngS2VVn55eZ7SqtlCnLDP2YP9slkkg=;
 b=bzr1+Xx1wurrDhFdJ9L9DWiEFefUF/jXINFuoj4hodQjk6jW4vf8Walb7gS8OY2309
 ucEFqNwVBcwYZlZrExu0XSeV3gMmNrjk0i7vLRYtkfA8Avn5YEaR/p9OFeUAwhittWfi
 vZniXfCF0E6joDIxYfUs8EtGDZZLdzE/OpIa830pAqf5VEkmM68bS6nimq/sqwjOKkll
 NjKgLGCguD3jbD+lc61o3xJtkCcoUg8uHD3X65hRbnQl5GueK4Xd6XPN1weo3uR5LF23
 CTbI0ZY6ZJwmYpjpHq3IS9o9oDdY1EUzMWe8itg+QOtqux25ho0qrtGCcxrgAiP4hAsP
 RiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QsvjWMzgsdTwwngS2VVn55eZ7SqtlCnLDP2YP9slkkg=;
 b=qc3yvv9Vq91etsA0Q+Ou9/XSoKxF1LYSUUIPbUqtptPN637cCW6cCa/mL3Ghs01i3p
 0rJosZzBVJuAX2fPA2oUlWiXm42JdzcRoAzJs0vZUp02h7h3J19+S7t5ZiyxZ5sh1c5t
 pKaGm3MHCdKKZ3ctMW+21YMPdVFyqakaVZomBUGVNzXQQVS6ADZyXH28dnx0nIHgor0N
 Sn5ZDXmsQB4p0tOwV9F44b4cMixzOZK06pshFiPF2xobAnh/TGu7TM4uwX4J4rdzOF/3
 cxQwsmkbk/9kfFFhxxupujbNl2mGSavt/DkTs5bqKN6g2mugHOFHNEu/T5jkfT13eRV8
 BcWA==
X-Gm-Message-State: AJIora8Z+5+2r/TV3SMbrvC/IfIn6FVH967sBhNfQYmpY2WnU2lcob1k
 iyfUmUQcXqoSZobS2UoOvc9rBJlDxMm8CA==
X-Google-Smtp-Source: AGRyM1s9rMcLAxDvbiel2uQtLUAUynZePHWJhr7bGwo4DLIUiaXYyyMOtlhi1t7kv9oUjPWKGBTa1w==
X-Received: by 2002:a05:600c:1c8d:b0:39c:4db1:5595 with SMTP id
 k13-20020a05600c1c8d00b0039c4db15595mr18820972wms.175.1656325368097; 
 Mon, 27 Jun 2022 03:22:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/25] target/arm: Implement SMSTART, SMSTOP
Date: Mon, 27 Jun 2022 11:22:24 +0100
Message-Id: <20220627102236.3097629-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

These two instructions are aliases of MSR (immediate).
Use the two helpers to properly implement svcr_write.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  1 +
 target/arm/helper-sme.h    | 21 +++++++++++++
 target/arm/helper.h        |  1 +
 target/arm/helper.c        |  6 ++--
 target/arm/sme_helper.c    | 61 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 24 +++++++++++++++
 target/arm/meson.build     |  1 +
 7 files changed, 112 insertions(+), 3 deletions(-)
 create mode 100644 target/arm/helper-sme.h
 create mode 100644 target/arm/sme_helper.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 52ab6f9bb99..5877d76c9f3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1120,6 +1120,7 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_pauth_properties(Object *obj);
+void arm_reset_sve_state(CPUARMState *env);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
new file mode 100644
index 00000000000..3bd48c235f0
--- /dev/null
+++ b/target/arm/helper-sme.h
@@ -0,0 +1,21 @@
+/*
+ *  AArch64 SME specific helper definitions
+ *
+ *  Copyright (c) 2022 Linaro, Ltd
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 07d45faf495..3a8ce42ab01 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1022,6 +1022,7 @@ DEF_HELPER_FLAGS_6(gvec_bfmlal_idx, TCG_CALL_NO_RWG,
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
+#include "helper-sme.h"
 #endif
 
 #include "helper-mve.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e06c054c3d7..88d96f7991f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6366,9 +6366,9 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    value &= R_SVCR_SM_MASK | R_SVCR_ZA_MASK;
-    /* TODO: Side effects. */
-    env->svcr = value;
+    helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
+    helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
+    arm_rebuild_hflags(env);
 }
 
 static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
new file mode 100644
index 00000000000..b2157255943
--- /dev/null
+++ b/target/arm/sme_helper.c
@@ -0,0 +1,61 @@
+/*
+ * ARM SME Operations
+ *
+ * Copyright (c) 2022 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/helper-proto.h"
+
+/* ResetSVEState */
+void arm_reset_sve_state(CPUARMState *env)
+{
+    memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
+    /* Recall that FFR is stored as pregs[16]. */
+    memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
+    vfp_set_fpcr(env, 0x0800009f);
+}
+
+void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_SM_MASK;
+    arm_reset_sve_state(env);
+}
+
+void helper_set_pstate_za(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_ZA_MASK;
+
+    /*
+     * ResetSMEState.
+     *
+     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
+     * on enable: while disabled, the storage is inaccessible and the
+     * value does not matter.  We're not saving the storage in vmstate
+     * when disabled either.
+     */
+    if (i) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5cf4a283bac..c050ebe0053 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1762,6 +1762,30 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         }
         break;
 
+    case 0x1b: /* SVCR* */
+        if (!dc_isar_feature(aa64_sme, s) || crm < 2 || crm > 7) {
+            goto do_unallocated;
+        }
+        if (sme_access_check(s)) {
+            bool i = crm & 1;
+            bool changed = false;
+
+            if ((crm & 2) && i != s->pstate_sm) {
+                gen_helper_set_pstate_sm(cpu_env, tcg_constant_i32(i));
+                changed = true;
+            }
+            if ((crm & 4) && i != s->pstate_za) {
+                gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
+                changed = true;
+            }
+            if (changed) {
+                gen_rebuild_hflags(s);
+            } else {
+                s->base.is_jmp = DISAS_NEXT;
+            }
+        }
+        break;
+
     default:
     do_unallocated:
         unallocated_encoding(s);
diff --git a/target/arm/meson.build b/target/arm/meson.build
index ac571fc45db..43dc6005478 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -47,6 +47,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'mte_helper.c',
   'pauth_helper.c',
   'sve_helper.c',
+  'sme_helper.c',
   'translate-a64.c',
   'translate-sve.c',
 ))
-- 
2.25.1


