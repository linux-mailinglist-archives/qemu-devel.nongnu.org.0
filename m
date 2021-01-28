Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DF1306C63
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 05:47:10 +0100 (CET)
Received: from localhost ([::1]:48400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4zD3-0006Wq-Hu
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 23:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l4zBg-0004qY-Kp
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:45:44 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:41178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l4zBc-00074r-7Q
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:45:44 -0500
Received: by mail-ot1-x335.google.com with SMTP id k8so4028861otr.8
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 20:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jdfP1OZLKr2wpke6vhuzCzIdZHjNZfMVraYOyMkae3E=;
 b=nVea3eY1IZJsQ4YFNL8kMxQYpmOm3wx85Fpaz7QYGQhr/QqsSzRf0uXIpHEOnx0gmM
 vJzxa3lgAm9fHLDX9RlzQDZsftDG084ozwZIi1Lu5b3TUiSLsLMlIrK/R5v7LQCRN6Y3
 pyw9F9/jJtQe5+FLn3+ZCm9sQeSr5vaWIG4+U9D15c56ahXB8nluRHpHmbGimh/yHxf1
 S3kLFctSsXvKMw3I0yohVoDTPHZ4gjzLMCJZ5dNyg0IxAha04bo+nTM0OSz6cTzt1Jn5
 6IdFNix4QsZ/4E6cmdY5Aoip9vUAM+5NlAyxttP0kcLeZnk73lGhKIj1zFUXqfhbyxyy
 Ojvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jdfP1OZLKr2wpke6vhuzCzIdZHjNZfMVraYOyMkae3E=;
 b=eQsGSJR3pA/u0FpZoW3dDDu4dgaOkGwlOsxRAyVdytT1U7LC7pgwm+VxuZKb0WEsuq
 HFYEcJVZ48ZpX/0GQbV8JeDUr5OSkLx4aNQ4Vj3ubAv5mPx+beAE8QlDjefUr1huZ2Wx
 hROpjWll1pTBd4nOA29lWXlHcDPjWiZOfWzMo3gzKgbmQjzdIZX7YNLmy16I2MPwEzr+
 r93rPB6PKLAbmp5UsP3wbE6FQQu2WY290LOx3aR2rVVfFcUk0dB/3b19L1IXiPEdF2cJ
 W5PfHnnZEpSCcBA1pUMZLpexcMfDNZfpx1Nt/gyWuB0M+e2kkuHxrv+wNjEUckjnQe8s
 8Z3g==
X-Gm-Message-State: AOAM531ctV2778Aocrx1cSFbpy1Yi3nVvAk/1+QeJzgVS/+GPBjfn9bq
 a4pnR4Qd5pLWWivDgFoXXT6r4+wzd3c68GmQi/zByek8X++ciKhkpya70jZfK4aCWtLfimIaFoD
 1nzbc50PIJEdmZgqJF6ZNhY0FdPv2kNhiR9KplrwbSFAqIr4/0m1J7sLMxkuzlMNHzTRYsUY=
X-Google-Smtp-Source: ABdhPJzp5fLF4bl1+xmR+Ha0ds16h/ByemT6rIU3me3mXDpyC45rrXmrK2Avg+QnsGW/SSMpkhh9Kw==
X-Received: by 2002:a9d:774b:: with SMTP id t11mr10194215otl.337.1611809138326; 
 Wed, 27 Jan 2021 20:45:38 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k198sm887399oih.33.2021.01.27.20.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 20:45:37 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] target/arm: Remove PSTATE_SS from cpsr and move it
 into env->pstate.
Date: Wed, 27 Jan 2021 21:45:26 -0700
Message-Id: <20210128044529.1403-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128044529.1403-1-rebecca@nuviainc.com>
References: <20210128044529.1403-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=rebecca@nuviainc.com; helo=mail-ot1-x335.google.com
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
 target/arm/helper-a64.c | 2 +-
 target/arm/helper.c     | 2 +-
 target/arm/op_helper.c  | 9 +--------
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index c426c23d2c4e..a6b162049806 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1001,7 +1001,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         mask = aarch32_cpsr_valid_mask(env->features, &env_archcpu(env)->isar);
         cpsr_write(env, spsr, mask, CPSRWriteRaw);
         if (!arm_singlestep_active(env)) {
-            env->uncached_cpsr &= ~PSTATE_SS;
+            env->pstate &= ~PSTATE_SS;
         }
         aarch64_sync_64_to_32(env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2ead3fcbdbd..7b7e72ba878c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9402,7 +9402,7 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
      * For exceptions taken to AArch32 we must clear the SS bit in both
      * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
      */
-    env->uncached_cpsr &= ~PSTATE_SS;
+    env->pstate &= ~PSTATE_SS;
     env->spsr = cpsr_read(env);
     /* Clear IT bits.  */
     env->condexec_bits = 0;
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


