Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E050B5FD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:15:00 +0200 (CEST)
Received: from localhost ([::1]:58180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrFb-0002Cu-4L
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAJ-0005aF-45
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:30 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAH-0002ux-5E
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id b19so10282073wrh.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eR7NYfDsDp0GzWfno2vjeiAO+oaOfi4kY26EnfhTTNM=;
 b=qcUYVdtvDpexnRzsdu6RSVZCwmGH9zIscqLuCSbFWZ0+ZAtlBfmHMQpASWQ2AqdGIh
 qpFSrCXhhfTImz/ISjI4dkq6vnGj10JlLRasnVPpjQ00EZqo7X6scssNeGu3TuHYjyqR
 7Zzf/gx24CKBKNlmOCoB6iKu2vbYVNy4O+TYLfvQP8+ZsTH6SMkgYdnZgueBrW1l+rvH
 H1TGzpxN07/xxvyJ1WyLZh8lDJybOuHRcZlPoPvAQ5S3Qo61gCyDk5AS6p3W3sLOaibY
 CTPtfXG4p6zdhXfZmVPT0R0xSoj2N7Sn34ooMMZQy8+US6JxVYsRfNPXsPPA3EUnRpw9
 TgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eR7NYfDsDp0GzWfno2vjeiAO+oaOfi4kY26EnfhTTNM=;
 b=Iewx36SJbP3gbm0/yNe6dTX1XH4MmDUpG41fd4AP6dAJoNveotppHkjEWqB3MsjbZG
 f6R307wAa5GN4+RKW6RK3skUGHgoVAKkU8GHbK9fwyi3blhUKDJsqgsqZxGkUgC/K5sp
 0NjFg7hjCCRbQ6xxColNcdVDljOA0dDasOB318FUZTFlf0Oxh77L0yLE0BJEg5V41Pfw
 Jo0KN5SlNzR9Z4RrPUvNbcoS5A6SRrRDHptcNtX1n9TGOaX/pgIuajM6fynQzwE1VFh2
 2MaJ/TUfnaZXXU1x7U5DLMNPVNBqFMOXnyFaJsQ0aR2OOT3VHQvEM1bNLMcRVL7xqaRI
 oJTg==
X-Gm-Message-State: AOAM53107g2txLpbWVhSqmW8mCBAbwDU960ljxaRJINRHVnk02WlpM8E
 3Ne/yzzeeY/A2tFrk3eCGPBBNb8sXtKkQQ==
X-Google-Smtp-Source: ABdhPJw9FriSHJFeRWPz8UrcdYPSjKSwUdIMs/UpNDHE3wV8/Q5hZ3crd3PJToMkFXiYSbIx59einA==
X-Received: by 2002:adf:fb48:0:b0:203:f986:874a with SMTP id
 c8-20020adffb48000000b00203f986874amr3092370wrs.614.1650621923733; 
 Fri, 22 Apr 2022 03:05:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 52/61] target/arm: Split out gen_rebuild_hflags
Date: Fri, 22 Apr 2022 11:04:23 +0100
Message-Id: <20220422100432.2288247-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

For aa32, the function has a parameter to use the new el.
For aa64, that never happens.
Use tcg_constant_i32 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 21 +++++++++-----------
 target/arm/translate.c     | 40 +++++++++++++++++++++++---------------
 2 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 13a3527345f..adbcd999415 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -341,6 +341,11 @@ static void a64_free_cc(DisasCompare64 *c64)
     tcg_temp_free_i64(c64->value);
 }
 
+static void gen_rebuild_hflags(DisasContext *s)
+{
+    gen_helper_rebuild_hflags_a64(cpu_env, tcg_constant_i32(s->current_el));
+}
+
 static void gen_exception_internal(int excp)
 {
     TCGv_i32 tcg_excp = tcg_const_i32(excp);
@@ -1667,9 +1672,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         } else {
             clear_pstate_bits(PSTATE_UAO);
         }
-        t1 = tcg_const_i32(s->current_el);
-        gen_helper_rebuild_hflags_a64(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_rebuild_hflags(s);
         break;
 
     case 0x04: /* PAN */
@@ -1681,9 +1684,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         } else {
             clear_pstate_bits(PSTATE_PAN);
         }
-        t1 = tcg_const_i32(s->current_el);
-        gen_helper_rebuild_hflags_a64(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_rebuild_hflags(s);
         break;
 
     case 0x05: /* SPSel */
@@ -1741,9 +1742,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
             } else {
                 clear_pstate_bits(PSTATE_TCO);
             }
-            t1 = tcg_const_i32(s->current_el);
-            gen_helper_rebuild_hflags_a64(cpu_env, t1);
-            tcg_temp_free_i32(t1);
+            gen_rebuild_hflags(s);
             /* Many factors, including TCO, go into MTE_ACTIVE. */
             s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
         } else if (dc_isar_feature(aa64_mte_insn_reg, s)) {
@@ -1990,9 +1989,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
          * A write to any coprocessor regiser that ends a TB
          * must rebuild the hflags for the next TB.
          */
-        TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
-        gen_helper_rebuild_hflags_a64(cpu_env, tcg_el);
-        tcg_temp_free_i32(tcg_el);
+        gen_rebuild_hflags(s);
         /*
          * We default to ending the TB on a coprocessor register write,
          * but allow this to be suppressed by the register definition
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1314406b193..4d7886fa853 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -351,6 +351,26 @@ void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
     tcg_temp_free_i32(tmp_mask);
 }
 
+static void gen_rebuild_hflags(DisasContext *s, bool new_el)
+{
+    bool m_profile = arm_dc_feature(s, ARM_FEATURE_M);
+
+    if (new_el) {
+        if (m_profile) {
+            gen_helper_rebuild_hflags_m32_newel(cpu_env);
+        } else {
+            gen_helper_rebuild_hflags_a32_newel(cpu_env);
+        }
+    } else {
+        TCGv_i32 tcg_el = tcg_constant_i32(s->current_el);
+        if (m_profile) {
+            gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
+        } else {
+            gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
+        }
+    }
+}
+
 static void gen_exception_internal(int excp)
 {
     TCGv_i32 tcg_excp = tcg_const_i32(excp);
@@ -4885,17 +4905,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
              * A write to any coprocessor register that ends a TB
              * must rebuild the hflags for the next TB.
              */
-            TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
-            if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
-            } else {
-                if (ri->type & ARM_CP_NEWEL) {
-                    gen_helper_rebuild_hflags_a32_newel(cpu_env);
-                } else {
-                    gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
-                }
-            }
-            tcg_temp_free_i32(tcg_el);
+            gen_rebuild_hflags(s, ri->type & ARM_CP_NEWEL);
             /*
              * We default to ending the TB on a coprocessor register write,
              * but allow this to be suppressed by the register definition
@@ -6445,7 +6455,7 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     tcg_temp_free_i32(addr);
     tcg_temp_free_i32(reg);
     /* If we wrote to CONTROL, the EL might have changed */
-    gen_helper_rebuild_hflags_m32_newel(cpu_env);
+    gen_rebuild_hflags(s, true);
     gen_lookup_tb(s);
     return true;
 }
@@ -8897,7 +8907,7 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
 
 static bool trans_CPS_v7m(DisasContext *s, arg_CPS_v7m *a)
 {
-    TCGv_i32 tmp, addr, el;
+    TCGv_i32 tmp, addr;
 
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
@@ -8920,9 +8930,7 @@ static bool trans_CPS_v7m(DisasContext *s, arg_CPS_v7m *a)
         gen_helper_v7m_msr(cpu_env, addr, tmp);
         tcg_temp_free_i32(addr);
     }
-    el = tcg_const_i32(s->current_el);
-    gen_helper_rebuild_hflags_m32(cpu_env, el);
-    tcg_temp_free_i32(el);
+    gen_rebuild_hflags(s, false);
     tcg_temp_free_i32(tmp);
     gen_lookup_tb(s);
     return true;
-- 
2.25.1


