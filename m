Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D653C0A1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:09:37 +0200 (CEST)
Received: from localhost ([::1]:57510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwt0a-00088P-KP
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh2-0004wp-Nw
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:24 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgz-0000D8-VL
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:24 -0400
Received: by mail-pg1-x52f.google.com with SMTP id y187so5807471pgd.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f4EFi0X8pC0ZHJX0LpV/2RPhRHjmGcoeXQX/e/CTo/k=;
 b=w+WMTH86vRXjCFIru5pdgadHYsK3I/Qzd5WBxZy70NVn4EPMuYJQqcWiyvxfP5TrWJ
 uE0nCwUfowzEk9j0ujnzWEnq1t+E/9ka+MWzvKHdEiNblYw7wIH6NzCD6QhBZZ8C5gGC
 Y3E6k/Nc8bP5gwKzrkXgo0SZy8fsWsOhPcYS3t2Ppwc9lWGRH5kTjpWcumTX4QV2J7iq
 APPMDG2SLkUeTW+lLTsmZTQbUGIgb61SlbjMuGpqMeMokcV47/l9U7INul/TdOovwdMM
 YJnI/v/AR/4T4Wh9uMjx0qdZU1JELe/rRkVHXymB7FXKylooLA8sH79+RZntkwUluFAt
 zkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f4EFi0X8pC0ZHJX0LpV/2RPhRHjmGcoeXQX/e/CTo/k=;
 b=dm3ikUHqq0bVD576yM3r5NBc4D8A1PrD0GfSubTrhjUR8/sqWKw71Pc6Mjw1+5gZyQ
 pJ9xIzq3bs9JIyjiI3e3hxTOUqHkYvy8vhL/GpiSoUPN5zQPFyatcr5LPRZ67h8Y1Bso
 embpjftFPThDVP1MFsOJQ/VgGVsySKJec9sDH+rRDzVPQfv9mVnVZNmQErZPnurC0+vx
 uIxNTImN88xtz10QeOpxB1PPkGpB56ZqkO0kTJnedcrYQbWWGEITuzi9W5NHLztvj2tH
 TRLOuowgfC0lWlJfXMt3CexVXKtlGpQIU6y05VNGMKH7XQ8gKU+QyvLAxKjLBq2qEgHU
 S7NA==
X-Gm-Message-State: AOAM5319Gz+xJc+amjA0hLxpNeqF97fpdGcObab2l1h06Fk34UtWMtsS
 c3AquJz6p/M5NokPhZdmitHrULRR9hejZw==
X-Google-Smtp-Source: ABdhPJytYulq18Bf0EbQO7dZqJgfo1qVwPoHgRgCJqJ83CB6LuUkvrjRNNs6VAO26ADjkOcBxVARoA==
X-Received: by 2002:a05:6a00:2289:b0:51b:d392:1f46 with SMTP id
 f9-20020a056a00228900b0051bd3921f46mr3391260pfe.20.1654206560683; 
 Thu, 02 Jun 2022 14:49:20 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 30/71] target/arm: Implement SMSTART, SMSTOP
Date: Thu,  2 Jun 2022 14:48:12 -0700
Message-Id: <20220602214853.496211-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

These two instructions are aliases of MSR (immediate).
Use the two helpers to properly implement svcr_write.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  1 +
 target/arm/helper-sme.h    | 21 +++++++++++++
 target/arm/helper.h        |  1 +
 target/arm/helper.c        |  6 ++--
 target/arm/sme_helper.c    | 60 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 24 +++++++++++++++
 target/arm/meson.build     |  1 +
 7 files changed, 111 insertions(+), 3 deletions(-)
 create mode 100644 target/arm/helper-sme.h
 create mode 100644 target/arm/sme_helper.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1bc7de1da1..b65e370b70 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1106,6 +1106,7 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_pauth_properties(Object *obj);
+void arm_reset_sve_state(CPUARMState *env);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
new file mode 100644
index 0000000000..3bd48c235f
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
index b1334e0c42..5bca7255f1 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1020,6 +1020,7 @@ DEF_HELPER_FLAGS_6(gvec_bfmlal_idx, TCG_CALL_NO_RWG,
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
+#include "helper-sme.h"
 #endif
 
 #include "helper-mve.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3edecb56b6..5328676deb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6370,9 +6370,9 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
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
index 0000000000..c34d1b2e6b
--- /dev/null
+++ b/target/arm/sme_helper.c
@@ -0,0 +1,60 @@
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
+     * SetPSTATE_ZA zeros on enable and disable.  It would appear that we
+     * can zero this only on enable: while disabled, the storage is
+     * inaccessible and the value does not matter.  We're not saving the
+     * storage in vmstate when disabled either.
+     */
+    if (i) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fdc035ad9a..40f2e53983 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1761,6 +1761,30 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
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
index 50f152214a..02c91f72bb 100644
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
2.34.1


