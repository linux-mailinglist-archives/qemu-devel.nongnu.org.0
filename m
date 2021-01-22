Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFAC2FFBEF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 05:47:31 +0100 (CET)
Received: from localhost ([::1]:43354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2oM6-00072y-AD
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 23:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l2oKX-0005RH-TO
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 23:45:53 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l2oKV-0000hW-VG
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 23:45:53 -0500
Received: by mail-pj1-x102f.google.com with SMTP id kx7so3014036pjb.2
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 20:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UqZ8UhKAARsMaNumLlP53he0mq/0Zh4f5MBCpErsUgA=;
 b=YKbIN/uEc1iLe37low8Kf8kHb9z/62zixr+ClK5bneSY3s6YqlmvI4YTA4PAsGGGOa
 tilK2sjUU0yLWUfX5wlynrcqKa2AD7BCV4MPdZPC4EAJCGivRBtoKBS43frJlcvPGm5h
 yggqDYKsnrG0evE6JmkafFfN1XsCZkjb1Ey/CD0P0J74+4XsRWuoGAuqELGTvtytMTDJ
 e6ROZZzv6AZqXx+dizJmkTQo5MOXmEMtf5xaO459gdSb92YosUr39RwXBQR9VeWm2obz
 9ZzJWftvp3HqIz3Saww/NK6c6slM2CH1oNon8pDGpNGqmB/VQJQSkVccmMYMUmE5Bc3F
 uOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UqZ8UhKAARsMaNumLlP53he0mq/0Zh4f5MBCpErsUgA=;
 b=b8rCqMAH8hS+bref0UzLvzKPWfOH7SwsY2CvFWcO2pu0I7tuqZfIVcGlhZ5gQMN98G
 YDxkysx6hMlQf0azlp4T5B25TnVyrwCBt80cY/4ZkW66O1MsgWrzNUC5H8WpSf3z8ZiF
 Qc0jzuXIWd/DAyq55lnfn2QrjAs27XqKIXLZaGNCgBaw86gmBgkbP5lRIa93kKnl4rpq
 qctSh7PCObLYMPhVb0dM8mGagt5hHoADmLsDGkNVBMnx5W03c0UNGoyqy4UzChsdk01S
 g9yCzz5qM11XOPAp7WQKEreMM95zi60JkD1f+iem8ecw/9eB4MyvT2YUfwxTJoMCfxfM
 CngA==
X-Gm-Message-State: AOAM5314/4S5VXOsy/KmLIQZlXz6QcOsFmchxJJRQIa8HNrpJ958PJPI
 AjrbFm/p4L96vkz2qv5oP2Val6J9ugyvZaVXelTyK9aVEniJqOHSLs7oLOG4WLfjbjBWx9NXn59
 S8JlG01Xsx4YYJvU/8PIAdtA0YirmWWHUATBxeL3jGKb1q7NlV0r7eYtztdbBEQ40TLwMzC0idQ
 ==
X-Google-Smtp-Source: ABdhPJzPO9qIxPJ99owOwj3bLW7ObR1Iz7gmnTwiECnZriZMjA4gJcpvmI/SO27GY5tIzVD7t7dvtw==
X-Received: by 2002:a17:90a:520e:: with SMTP id
 v14mr3177394pjh.233.1611290750253; 
 Thu, 21 Jan 2021 20:45:50 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b10sm7050494pgh.15.2021.01.21.20.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 20:45:49 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] target/arm: Remove PSTATE_SS from cpsr and move it
 into env->pstate.
Date: Thu, 21 Jan 2021 21:45:35 -0700
Message-Id: <20210122044537.1823-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122044537.1823-1-rebecca@nuviainc.com>
References: <20210122044537.1823-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=rebecca@nuviainc.com; helo=mail-pj1-x102f.google.com
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

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/helper-a64.c | 4 +---
 target/arm/helper.c     | 4 ++--
 target/arm/op_helper.c  | 9 +--------
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index c426c23d2c4e..0d2ac7bb7ee3 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1000,9 +1000,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
          */
         mask = aarch32_cpsr_valid_mask(env->features, &env_archcpu(env)->isar);
         cpsr_write(env, spsr, mask, CPSRWriteRaw);
-        if (!arm_singlestep_active(env)) {
-            env->uncached_cpsr &= ~PSTATE_SS;
-        }
+        env->pstate &= ~PSTATE_SS;
         aarch64_sync_64_to_32(env);
 
         if (spsr & CPSR_T) {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2ead3fcbdbd..01b50316046b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9402,8 +9402,8 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
      * For exceptions taken to AArch32 we must clear the SS bit in both
      * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
      */
-    env->uncached_cpsr &= ~PSTATE_SS;
-    env->spsr = cpsr_read(env);
+    env->pstate &= ~PSTATE_SS;
+    env->spsr &= ~PSTATE_SS;
     /* Clear IT bits.  */
     env->condexec_bits = 0;
     /* Switch to the new mode, and to the correct instruction set.  */
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


