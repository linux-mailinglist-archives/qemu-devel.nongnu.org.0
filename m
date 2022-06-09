Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ABA544963
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:42:28 +0200 (CEST)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFcM-0000A6-H7
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7d-0001gU-SN
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:47100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7b-00061B-0P
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso12264463wmr.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ln4NarpB9GXHE3SSoQy0ZUBfyqzyJv95N2jOXflbDEs=;
 b=EWhynYWPJGb3hPXk6/XiW86PShAFbDRSonRdil7h/KJulzf3n5xajMNv53PEghwhkt
 dRdoIRJ3sguC+yM90+usvvuEVq5U+DTx2ocWe1d40gye0vruVZjEcQ0R9Z1jfaKo/ib5
 KWokqu8v4tm0mjmz9ag+9xtqn3zXncCU68EuqDX4RfmseW5QXeh76HswJCQSB/PQCWXQ
 VjmGThLOM27jEaYTs6fHqXxUPgkjMp1e559531OqscmuHMdtc2qts5JIaydoogrTKLUY
 4e31FtyZzgw3swherBq0jjOVJzDp8LzUs1ntwlmiUYesaXihwM88PZhG89NE00Y5wdRI
 lPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ln4NarpB9GXHE3SSoQy0ZUBfyqzyJv95N2jOXflbDEs=;
 b=Zeb3ERLV9o2CH3wPOry2sn5UXTv+WSJhWjTiC0ivXe2DPr5ERUpxdQhjW8eq/nxmu3
 IGU+ZdoSLFXAchdp/LCiTiuBfZlor/0h9l2Ia5c2dnQvVnl+uhyT6TVIMDx+gCzu8/+n
 Rxxzl2SBojWxxp9o9u8yI9olYXOETMRCq44RAx/ID0O+reoy+wQKUScbjkQXPC4bBQSQ
 h9FHRKwLhpbeuBcjBu0ufUxrjvZMwKBx3ptHyhm0mRX+9226Cq8Eros95I/MPoBAXIAG
 Ob5+Trs2vK46WoBvMS+iQATOmW8sPHjBIvRoRUz/m1W2/fyQoUHJncUuBVkjEMl7J6XR
 FDkw==
X-Gm-Message-State: AOAM531HZcXhUim1h/8BV7MqUPkg4LfT3XAKz0YmN1Eq3eZd8HUhCtcj
 K1Ms4lvuvp2KYapw1YHFZxJm/f0jZOQYBg==
X-Google-Smtp-Source: ABdhPJzJcGK9QZuiBfEMECR5cG7J7BCVTEjZ4zrOWeuTNRu8GXA01ZhMThN8v/6uU/Y2UyKw/CBU0g==
X-Received: by 2002:a05:600c:4fd2:b0:39b:893e:ff79 with SMTP id
 o18-20020a05600c4fd200b0039b893eff79mr2295531wmq.73.1654765590191; 
 Thu, 09 Jun 2022 02:06:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 47/55] target/arm: Rename sve_zcr_len_for_el to sve_vqm1_for_el
Date: Thu,  9 Jun 2022 10:05:29 +0100
Message-Id: <20220609090537.1971756-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

This will be used for both Normal and Streaming SVE, and the value
does not necessarily come from ZCR_ELx.  While we're at it, emphasize
the units in which the value is returned.

Patch produced by
    git grep -l sve_zcr_len_for_el | \
    xargs -n1 sed -i 's/sve_zcr_len_for_el/sve_vqm1_for_el/g'

and then adding a function comment.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 11 ++++++++++-
 target/arm/arch_dump.c |  2 +-
 target/arm/cpu.c       |  2 +-
 target/arm/gdbstub64.c |  2 +-
 target/arm/helper.c    | 12 ++++++------
 5 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 73f24a57603..e45b5cb7fe1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1132,7 +1132,16 @@ void aarch64_sync_64_to_32(CPUARMState *env);
 
 int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
+
+/**
+ * sve_vqm1_for_el:
+ * @env: CPUARMState
+ * @el: exception level
+ *
+ * Compute the current SVE vector length for @el, in units of
+ * Quadwords Minus 1 -- the same scale used for ZCR_ELx.LEN.
+ */
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el);
 
 static inline bool is_a64(CPUARMState *env)
 {
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 01848453109..b1f040e69f2 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -166,7 +166,7 @@ static off_t sve_fpcr_offset(uint32_t vq)
 
 static uint32_t sve_current_vq(CPUARMState *env)
 {
-    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+    return sve_vqm1_for_el(env, arm_current_el(env)) + 1;
 }
 
 static size_t sve_size_vq(uint32_t vq)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 06219441674..1b5d5357880 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -925,7 +925,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  vfp_get_fpcr(env), vfp_get_fpsr(env));
 
     if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
-        int j, zcr_len = sve_zcr_len_for_el(env, el);
+        int j, zcr_len = sve_vqm1_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
             bool eol;
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 596878666d7..07a6746944d 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -152,7 +152,7 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
          * We report in Vector Granules (VG) which is 64bit in a Z reg
          * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
          */
-        int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+        int vq = sve_vqm1_for_el(env, arm_current_el(env)) + 1;
         return gdb_get_reg64(buf, vq * 2);
     }
     default:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 90aac6bc12d..400f7cd1dba 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6215,7 +6215,7 @@ int sve_exception_el(CPUARMState *env, int el)
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
     uint32_t len = cpu->sve_max_vq - 1;
@@ -6238,7 +6238,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
     int cur_el = arm_current_el(env);
-    int old_len = sve_zcr_len_for_el(env, cur_el);
+    int old_len = sve_vqm1_for_el(env, cur_el);
     int new_len;
 
     /* Bits other than [3:0] are RAZ/WI.  */
@@ -6249,7 +6249,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * Because we arrived here, we know both FP and SVE are enabled;
      * otherwise we would have trapped access to the ZCR_ELn register.
      */
-    new_len = sve_zcr_len_for_el(env, cur_el);
+    new_len = sve_vqm1_for_el(env, cur_el);
     if (new_len < old_len) {
         aarch64_sve_narrow_vq(env, new_len + 1);
     }
@@ -11168,7 +11168,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                 sve_el = 0;
             }
         } else if (sve_el == 0) {
-            DP_TBFLAG_A64(flags, VL, sve_zcr_len_for_el(env, el));
+            DP_TBFLAG_A64(flags, VL, sve_vqm1_for_el(env, el));
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
@@ -11534,10 +11534,10 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      */
     old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
-               ? sve_zcr_len_for_el(env, old_el) : 0);
+               ? sve_vqm1_for_el(env, old_el) : 0);
     new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
-               ? sve_zcr_len_for_el(env, new_el) : 0);
+               ? sve_vqm1_for_el(env, new_el) : 0);
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-- 
2.25.1


