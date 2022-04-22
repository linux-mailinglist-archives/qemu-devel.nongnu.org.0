Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A8450B627
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:29:16 +0200 (CEST)
Received: from localhost ([::1]:57624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrTO-0005Mc-S0
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAE-0005M1-1v
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:22 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAC-0002tu-49
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:21 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso7650896wma.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gKRci0cpIs4ADQf7JfcVVwdBVmU79gOg4J5HNz/ZQik=;
 b=Ei799HtUxox5oTeG4xLGDhhbg0jjio6IJGF5qjPxQqFqPBhVLO6U19UbrqZZz8cyUX
 F7AbasH96/lAzQlzNjQ4ni3o15ZMfBvXir27OLQXJwzDRGDiY+kVUm3b3EwO/pDpsMMW
 AM6KHvAq8XNqsgwLP4vwu2giCc33b5x0r63A5FIbnGk3GT7R/Uv06+JodmZGF7lWfRRS
 DYnLXYZnLKB9NTUUvq4uzEnA63jh73TSCxA+NCrpEDicpF5pRykCLz2yqMWkLbqeS1MX
 ye50Ah0s5c3XmEEgZKmQSOJXs8Zz5SWuRqGL2nAp6Y7HZCLMkFCZFQGQVLAnybr91cF5
 qLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gKRci0cpIs4ADQf7JfcVVwdBVmU79gOg4J5HNz/ZQik=;
 b=sAWcRMWygu9Lr/y8cKpjImReyuPLf0sQNVEa4whHj0Y9/hbUqoY/FF4RmgaO4hQPnG
 mrKgIFQh6gdSM9TKx02nar091hUMe9o5Rl12+9NtZ56zP0BNw7J0MMY1gt6axtNXg7jE
 AQ0xan7RpwDWLswpYpXWSadKgWN5ESTjoVjcAOBm1il2BImG/iHPMhYUacpvO2X8lxpj
 uzFzIvWN5iTsCGKJc28NOyze1T1tgCQ2Ufz3QaRrjjGaaBeHvNHgxTgCmsYKHbWSY0IV
 ZFfKyZk+eHLtKDkq++2M2B+Cwb95fQ5gFwf8mbT4lMDdL43cyiJkGzFoFcA5vQr8//eb
 aKmQ==
X-Gm-Message-State: AOAM531Av/uL4W6r9caBQwiM1tLojDXrsKdeZEX721JElUwXW8I/PNfH
 5b/GgG4LcZKye59DYpm+PIo59mUV6d9iZw==
X-Google-Smtp-Source: ABdhPJzUhlSgIKwHXTwKB6llbExbDSjWcpJn9Qkx5YtoebPiAAmnEUxlgP6I3rKwh9aMgoxifHRKVw==
X-Received: by 2002:a05:600c:a06:b0:392:a4f2:2097 with SMTP id
 z6-20020a05600c0a0600b00392a4f22097mr12708019wmp.97.1650621918071; 
 Fri, 22 Apr 2022 03:05:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/61] target/arm: Change CPUArchState.aarch64 to bool
Date: Fri, 22 Apr 2022 11:04:17 +0100
Message-Id: <20220422100432.2288247-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Bool is a more appropriate type for this value.
Adjust the assignments to use true/false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h        | 2 +-
 target/arm/cpu.c        | 2 +-
 target/arm/helper-a64.c | 4 ++--
 target/arm/helper.c     | 2 +-
 target/arm/hvf/hvf.c    | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bee1cf4653a..31e46709277 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -259,7 +259,7 @@ typedef struct CPUArchState {
      *  all other bits are stored in their correct places in env->pstate
      */
     uint32_t pstate;
-    uint32_t aarch64; /* 1 if CPU is in aarch64 state; inverse of PSTATE.nRW */
+    bool aarch64; /* True if CPU is in aarch64 state; inverse of PSTATE.nRW */
 
     /* Cached TBFLAGS state.  See below for which bits are included.  */
     CPUARMTBFlags hflags;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index fa13fce355a..7e9f7d146df 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -189,7 +189,7 @@ static void arm_cpu_reset(DeviceState *dev)
 
     if (arm_feature(env, ARM_FEATURE_AARCH64)) {
         /* 64 bit CPUs always start in 64 bit mode */
-        env->aarch64 = 1;
+        env->aarch64 = true;
 #if defined(CONFIG_USER_ONLY)
         env->pstate = PSTATE_MODE_EL0t;
         /* Userspace expects access to DC ZVA, CTL_EL0 and the cache ops */
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 7cf953b1e64..77a8502b6b6 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -952,7 +952,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
     qemu_mutex_unlock_iothread();
 
     if (!return_to_aa64) {
-        env->aarch64 = 0;
+        env->aarch64 = false;
         /* We do a raw CPSR write because aarch64_sync_64_to_32()
          * will sort the register banks out for us, and we've already
          * caught all the bad-mode cases in el_from_spsr().
@@ -975,7 +975,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
     } else {
         int tbii;
 
-        env->aarch64 = 1;
+        env->aarch64 = true;
         spsr &= aarch64_pstate_valid_mask(&env_archcpu(env)->isar);
         pstate_write(env, spsr);
         if (!arm_singlestep_active(env)) {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7715c911a1..f1e91b197e2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10181,7 +10181,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     }
 
     pstate_write(env, PSTATE_DAIF | new_mode);
-    env->aarch64 = 1;
+    env->aarch64 = true;
     aarch64_restore_sp(env, new_el);
     helper_rebuild_hflags_a64(env, new_el);
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 567e296b21c..b11a8b9a189 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -564,7 +564,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     hv_return_t ret;
     int i;
 
-    env->aarch64 = 1;
+    env->aarch64 = true;
     asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
 
     /* Allocate enough space for our sysreg sync */
-- 
2.25.1


