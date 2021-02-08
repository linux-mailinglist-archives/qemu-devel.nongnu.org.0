Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D63131C7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 13:06:22 +0100 (CET)
Received: from localhost ([::1]:57570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l95J5-0003IU-GY
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 07:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90Uw-0005CR-BM
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:58:20 -0500
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:35343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90UR-0003xg-Ox
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:58:02 -0500
Received: by mail-il1-x129.google.com with SMTP id o7so7282383ils.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 22:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qb40yI/NeM085UbMxmgujwgw1843nw7bVshyCKXfzbw=;
 b=hTmcpVM/9gtDYNq/qHRJJFfpjlHnT+7KgESKNtieG9QkoyuRC/gYS8jhoTJydDmtiT
 7+UMPLLZD6IuuLVcMtnPgNHQkWc9PxvJ8ucQP1nZ6b1151Tu2JVq7B/3VAikpiY7U9oc
 W+mm7NuSu1jKHGVuEMw6jJ9Nc9p7ITvv0Fu+YbFW+bxSMlkk0lOMmYbsCjgNqDmnrP/f
 qGsaOurUNyCwVfAHxljaOaj2ZEFn4DwUr5gmYF100Bli3vUtyf1hw4qGDYAyFri+CdYp
 m9pH2k4W4McWEft/Rj90TQtz3xmJC5fH9bIFcAZ+CE6x7n+0K6vWw52wto29vHZ3Zgwv
 JDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qb40yI/NeM085UbMxmgujwgw1843nw7bVshyCKXfzbw=;
 b=qc8dLoN0CiRxROpemN9Dw4xtCm3WZ/GNnkLDQW+0nDX943v9C0qjUlLDDZbyejYjFe
 2wFyjmDwAjhqKgQRYLjyaHGc8gUZnvLIqHqdvZgBB1rYO4izmLivba2ZlgFjKQ8KweWU
 W95LF/+r4q7PR3AuayBKmEq/NTQ19nJ23R70HeLLHNxUNEvPb3Z+J744gkiZT6r6RR0k
 601UZbXcbvuNIoG3Bhgd3q0mOc5zpSTvGVjH8gANSsEoOTvXt3weouM23OiVMpI+La+6
 OCO6c12QAkTo9YAMUkQzgM3m//YkiXRjjHMxuR4YkwLInuG+3KB0P1tWlzei6ICJbKg5
 RDtQ==
X-Gm-Message-State: AOAM532bf1jDBuL9SnGnd7njrSInPZyH7nVxd0R72dQoyeJvYGKxqHQM
 Msc/CqoC0+pSSxxGSJAZ41bqaA880PuJK6MsmU4ubJy/Nl9p9JK8hb7ZQyVVqbtKHWMCxgLJZrO
 Q0tFau8Xdy2vDJDWmWypBwrkgFv3MfMnT/zAdOa6gizq4CncsJggc04ctTw9LRFPq3xQ5XzY=
X-Google-Smtp-Source: ABdhPJw6Gp4PKMvyC371auM0rXFpMInPxi55CDICGVGrjisHQ2b5O1fKp89toKTEZHLh3E/m7Iyb2Q==
X-Received: by 2002:a92:bd06:: with SMTP id c6mr15487869ile.158.1612767425918; 
 Sun, 07 Feb 2021 22:57:05 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id c19sm8335904ile.17.2021.02.07.22.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 22:57:05 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/4] target/arm: Support AA32 DIT by moving PSTATE_SS from
 cpsr into env->pstate
Date: Sun,  7 Feb 2021 23:56:58 -0700
Message-Id: <20210208065700.19454-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208065700.19454-1-rebecca@nuviainc.com>
References: <20210208065700.19454-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpsr has been treated as being the same as spsr, but it isn't.
Since PSTATE_SS isn't in cpsr, remove it and move it into env->pstate.

This allows us to add support for CPSR_DIT, adding helper functions
to merge SPSR_ELx to and from CPSR.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/helper-a64.c | 27 +++++++++++++++++---
 target/arm/helper.c     | 24 ++++++++++++-----
 target/arm/op_helper.c  |  9 +------
 3 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index c426c23d2c4e..ae611d73c2c4 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -945,11 +945,31 @@ static int el_from_spsr(uint32_t spsr)
     }
 }
 
+static void cpsr_write_from_spsr_elx(CPUARMState *env,
+                                     uint32_t val)
+{
+    uint32_t mask;
+
+    /* Save SPSR_ELx.SS into PSTATE. */
+    env->pstate = (env->pstate & ~PSTATE_SS) | (val & PSTATE_SS);
+    val &= ~PSTATE_SS;
+
+    /* Move DIT to the correct location for CPSR */
+    if (val & PSTATE_DIT) {
+        val &= ~PSTATE_DIT;
+        val |= CPSR_DIT;
+    }
+
+    mask = aarch32_cpsr_valid_mask(env->features, \
+        &env_archcpu(env)->isar);
+    cpsr_write(env, val, mask, CPSRWriteRaw);
+}
+
 void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
 {
     int cur_el = arm_current_el(env);
     unsigned int spsr_idx = aarch64_banked_spsr_index(cur_el);
-    uint32_t mask, spsr = env->banked_spsr[spsr_idx];
+    uint32_t spsr = env->banked_spsr[spsr_idx];
     int new_el;
     bool return_to_aa64 = (spsr & PSTATE_nRW) == 0;
 
@@ -998,10 +1018,9 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
          * will sort the register banks out for us, and we've already
          * caught all the bad-mode cases in el_from_spsr().
          */
-        mask = aarch32_cpsr_valid_mask(env->features, &env_archcpu(env)->isar);
-        cpsr_write(env, spsr, mask, CPSRWriteRaw);
+        cpsr_write_from_spsr_elx(env, spsr);
         if (!arm_singlestep_active(env)) {
-            env->uncached_cpsr &= ~PSTATE_SS;
+            env->pstate &= ~PSTATE_SS;
         }
         aarch64_sync_64_to_32(env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ce6965b50d42..fd6902c890f5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9433,7 +9433,7 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
      * For exceptions taken to AArch32 we must clear the SS bit in both
      * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
      */
-    env->uncached_cpsr &= ~PSTATE_SS;
+    env->pstate &= ~PSTATE_SS;
     env->spsr = cpsr_read(env);
     /* Clear IT bits.  */
     env->condexec_bits = 0;
@@ -9789,6 +9789,21 @@ static int aarch64_regnum(CPUARMState *env, int aarch32_reg)
     }
 }
 
+static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
+{
+    uint32_t ret = cpsr_read(env);
+
+    /* Move DIT to the correct location for SPSR_ELx */
+    if (ret & CPSR_DIT) {
+        ret &= ~CPSR_DIT;
+        ret |= PSTATE_DIT;
+    }
+    /* Merge PSTATE.SS into SPSR_ELx */
+    ret |= env->pstate & PSTATE_SS;
+
+    return ret;
+}
+
 /* Handle exception entry to a target EL which is using AArch64 */
 static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 {
@@ -9911,7 +9926,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         aarch64_save_sp(env, arm_current_el(env));
         env->elr_el[new_el] = env->pc;
     } else {
-        old_mode = cpsr_read(env);
+        old_mode = cpsr_read_for_spsr_elx(env);
         env->elr_el[new_el] = env->regs[15];
 
         aarch64_sync_32_to_64(env);
@@ -13205,7 +13220,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
     uint32_t flags = env->hflags;
-    uint32_t pstate_for_ss;
 
     *cs_base = 0;
     assert_hflags_rebuild_correctly(env);
@@ -13215,7 +13229,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
         }
-        pstate_for_ss = env->pstate;
     } else {
         *pc = env->regs[15];
 
@@ -13263,7 +13276,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
         flags = FIELD_DP32(flags, TBFLAG_AM32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_AM32, CONDEXEC, env->condexec_bits);
-        pstate_for_ss = env->uncached_cpsr;
     }
 
     /*
@@ -13276,7 +13288,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
      */
     if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE) &&
-        (pstate_for_ss & PSTATE_SS)) {
+        (env->pstate & PSTATE_SS)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
     }
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 5e0f123043b5..65cb37d088f8 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -389,14 +389,7 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
 
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
 {
-    /*
-     * We store the ARMv8 PSTATE.SS bit in env->uncached_cpsr.
-     * This is convenient for populating SPSR_ELx, but must be
-     * hidden from aarch32 mode, where it is not visible.
-     *
-     * TODO: ARMv8.4-DIT -- need to move SS somewhere else.
-     */
-    return cpsr_read(env) & ~(CPSR_EXEC | PSTATE_SS);
+    return cpsr_read(env) & ~CPSR_EXEC;
 }
 
 void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
-- 
2.26.2


