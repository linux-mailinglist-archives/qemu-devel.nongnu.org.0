Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E320439BE91
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:22:25 +0200 (CEST)
Received: from localhost ([::1]:55848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDWa-00052h-S3
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNN-0008NF-HE
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNK-00024l-8b
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:53 -0400
Received: by mail-wr1-x432.google.com with SMTP id l2so10038347wrw.6
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 10:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mjzS7rj1kweufgd0g3lBR+KBKwJLQAXc4Hnok/aBO4c=;
 b=m+OG1jD3er5DoGVh6n5An8FjIQSgCK2ZHONXOzHjAEQAdYg/xighy0WgtT6+cWr7y6
 /HXEOXnxbQWVo/0Ny9Ejk23ggbTMVqx3Od24w9xXZFsuEf5T8PkvX4+UNtY8WYGQ5EC7
 YKVy7zbHZr0S0NG1/i/GRaq5xJT+hnUcFkY7D+5xL9NaqOFtTuQ2rWJ94og9n4VgNZH3
 cybkqigSVvx67ymJU8nMRLvZAcboWRwUNSceK3j9SYowuqh7hdxyopm+jazgE8Zxyebb
 jV7T1TRP4Dn2Mnfru0nKvInur1VnfXQFSJUocMIhxARhVqMU33bvY78Y1TZR4XAYx/lW
 GnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mjzS7rj1kweufgd0g3lBR+KBKwJLQAXc4Hnok/aBO4c=;
 b=URE++Eb1XoNNYduZ4gopnmscVo6ROW8RdA2OXWHMhmjYXxNBZQIHDtHj+2FaWZC4T5
 7Uu24s0moiAgb75VM2YFI0UGfWUQGzBmssV7YcCsCAoPYuOVZUOpToSGLCOYYprBohlw
 ZZ6b5Mtlr0vux07VEsyQcMU4gLjy4MeB2xx8Ni2VHGv51oO4k5ejblCEwLBi+ScTnIc+
 o4ToU/2bT12h6ox5T7G1juMrlyxtzwEmlnmVZmqY2N+LDMD1E6KkTo9dpAmEGjrPgiMO
 FXSa/WUL8NY5pgUd7jT2iCXimbuTc6qSXcOlFHntcMUbT3owfzqLtXs2yVtRBLeH6fNo
 ZCpw==
X-Gm-Message-State: AOAM5308q/Uwlfg8vlfJee1XdqkUbtxVWXDh3EXx5lhh4y10b0yQ201k
 R9YUc0A/hFtNQUpHVmRedzJsqg==
X-Google-Smtp-Source: ABdhPJxvRMYt3LOwSK4GtYWdpSmfnq6rEyTqjm8e2iJuXeKmGd/Zc8j8NgClAiz93F9FdaP/reBa7g==
X-Received: by 2002:a5d:4304:: with SMTP id h4mr5051852wrq.210.1622826768904; 
 Fri, 04 Jun 2021 10:12:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c7sm7120966wrs.23.2021.06.04.10.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E742A1FFC9;
 Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 50/99] target/arm: fix style of arm_cpu_do_interrupt
 functions before move
Date: Fri,  4 Jun 2021 16:52:23 +0100
Message-Id: <20210604155312.15902-51-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

before refactoring the exception code, fix the style of the
functions being moved.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 7a9eaec5cb..5b32329895 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -896,10 +896,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         new_mode = ARM_CPU_MODE_UND;
         addr = 0x04;
         mask = CPSR_I;
-        if (env->thumb)
+        if (env->thumb) {
             offset = 2;
-        else
+        } else {
             offset = 4;
+        }
         break;
     case EXCP_SWI:
         new_mode = ARM_CPU_MODE_SVC;
@@ -985,7 +986,8 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         /* High vectors. When enabled, base address cannot be remapped. */
         addr += 0xffff0000;
     } else {
-        /* ARM v7 architectures provide a vector base address register to remap
+        /*
+         * ARM v7 architectures provide a vector base address register to remap
          * the interrupt vector table.
          * This register is only followed in non-monitor mode, and is banked.
          * Note: only bits 31:5 are valid.
@@ -1094,7 +1096,8 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
 
     if (cur_el < new_el) {
-        /* Entry vector offset depends on whether the implemented EL
+        /*
+         * Entry vector offset depends on whether the implemented EL
          * immediately lower than the target level is using AArch32 or AArch64
          */
         bool is_aa64;
@@ -1285,7 +1288,8 @@ static void handle_semihosting(CPUState *cs)
 }
 #endif
 
-/* Handle a CPU exception for A and R profile CPUs.
+/*
+ * Handle a CPU exception for A and R profile CPUs.
  * Do any appropriate logging, handle PSCI calls, and then hand off
  * to the AArch64-entry or AArch32-entry function depending on the
  * target exception level's register width.
@@ -1330,7 +1334,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
     }
 #endif
 
-    /* Hooks may change global state so BQL should be held, also the
+    /*
+     * Hooks may change global state so BQL should be held, also the
      * BQL needs to be held for any modification of
      * cs->interrupt_request.
      */
-- 
2.20.1


