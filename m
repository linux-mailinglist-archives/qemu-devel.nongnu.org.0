Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEAE35997F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:41:43 +0200 (CEST)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUne2-0004BI-Fb
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZP-0008JD-NH
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:55 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZN-0002rC-Rj
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:55 -0400
Received: by mail-ej1-x62b.google.com with SMTP id r12so7640019ejr.5
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 02:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QrsQ6titnvPEg2qiFo1iauoMBA2a+w2LknU0pG+NZbE=;
 b=fXONjXNCPPQSyIraE886aSBPxzjUEGunSCDwO6mVQpGddCchTHGvk/0fEMVzDGxQMT
 gYtJ/3Faxf8JH2FoEbPGy4cxlObv4ssGgsvNr7HTbV9mdHThzW4a/Lu8yyR6t+jwdmfD
 KI9dHfQ8MOP3TuovkfkBmv0l/cdxGB33JBIJkkBt7hgBtO5WGnN5uJMFJUudGsEHaX21
 fIvMJ8JTTK97/gukZinJO3hM7k9Ud6d1gQMB3xt2B63kHZXsNKhZjLAeC4uWke11kS3e
 /8lf4t5JEHywENwp4z6M/HV6ixkpUNEDJFRWQU+ROul/HCIiNrI0m1Z587c3c7q7InAd
 pAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QrsQ6titnvPEg2qiFo1iauoMBA2a+w2LknU0pG+NZbE=;
 b=jrrBCn4X0lXHm4Sr8/OY0m4RGDlS74dC10eFmFp7XCgaDhTOsvGIIrO9Y2bSwbCVvY
 sl0KmfM0MDsZuZdlICbjgaGhKEFYJIvd27z9AMJeDwRt2nanVNmmpORxkuOQ/GBHtZ+K
 3Vyeu9py/cn6FqG2zAd9I2ImJLvtUQvrBFCMzX9VSbr1y6eYGD2pkM0Lt4k616TyCr8M
 zC0htvxhBnJLtdTb2l0xDXS4l7qX8Nf5e0/lu79r0wj8oNHFL1QNoRFyjQXyprs6eRzx
 hLNFtyQtiECtorgLnYqHloq/FR3ZTl8jPoBzp2VbohGqC4PbXl0wyvkexY4h46eXNTex
 ktCw==
X-Gm-Message-State: AOAM530u6KmzlpUX15B9cJoRjc/0hvi4T6xEEYoaVK0rtbWE3ZURoBZ3
 PnBCTf3418PggfZwXJEBEDH8Eqa1gykJDQ==
X-Google-Smtp-Source: ABdhPJwS4mXF5NFBA8feO1iS6BvIiEHY+0Vj252uKymUJD3TG8EaerrH6W1Ji2c+J4aasEkqFVyBSw==
X-Received: by 2002:a17:906:c058:: with SMTP id
 bm24mr15478461ejb.335.1617961012244; 
 Fri, 09 Apr 2021 02:36:52 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y16sm1068851edc.62.2021.04.09.02.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 02:36:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 v2 5/6] target/mips/cp0_timer: Use new
 clock_ns_to_ticks()
Date: Fri,  9 Apr 2021 11:36:22 +0200
Message-Id: <20210409093623.2402750-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409093623.2402750-1-f4bug@amsat.org>
References: <20210409093623.2402750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hao Wu <wuhaotsh@google.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new clock_ns_to_ticks() function in cp0_timer where
appropriate. This allows us to remove CPUMIPSState::cp0_count_ns
and mips_cp0_period_set() and mips_cpu_clk_update().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h       |  1 -
 target/mips/cp0_timer.c | 41 ++++++++++++++++++++++++++++++-----------
 target/mips/cpu.c       | 18 +-----------------
 3 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 075c24abdad..10f10018b95 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1160,7 +1160,6 @@ struct CPUMIPSState {
     struct MIPSITUState *itu;
     MemoryRegion *itc_tag; /* ITC Configuration Tags */
     target_ulong exception_base; /* ExceptionBase input to the core */
-    uint64_t cp0_count_ns; /* CP0_Count clock period (in nanoseconds) */
 };
 
 /**
diff --git a/target/mips/cp0_timer.c b/target/mips/cp0_timer.c
index 85f2f85838d..3b76cc97f6a 100644
--- a/target/mips/cp0_timer.c
+++ b/target/mips/cp0_timer.c
@@ -27,26 +27,31 @@
 #include "sysemu/kvm.h"
 #include "internal.h"
 
-static uint32_t ns_to_count(CPUMIPSState *env, uint64_t ns)
+static uint32_t tick_to_count(MIPSCPU *cpu, uint64_t ticks)
 {
-    return ns / env->cp0_count_ns;
+    return ticks / cpu->cp0_count_rate;
 }
 
-static uint32_t ns_substract_to_count(CPUMIPSState *env,
-                                      uint32_t count, uint64_t ns)
+static uint32_t tick_substract_to_count(MIPSCPU *cpu,
+                                        uint32_t count, uint64_t ticks)
 {
-    return count - ns_to_count(env, ns);
+    return count - tick_to_count(cpu, ticks);
 }
 
 /* MIPS R4K timer */
 static void cpu_mips_timer_update(CPUMIPSState *env)
 {
+    MIPSCPU *cpu = env_archcpu(env);
     uint64_t now_ns, next_ns;
     uint32_t wait;
+    uint64_t now_ticks;
 
     now_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    wait = ns_substract_to_count(env, env->CP0_Compare - env->CP0_Count, now_ns);
-    next_ns = now_ns + (uint64_t)wait * env->cp0_count_ns;
+    now_ticks = clock_ns_to_ticks(cpu->clock, now_ns);
+    wait = tick_substract_to_count(cpu, env->CP0_Compare - env->CP0_Count,
+                                   now_ticks);
+    next_ns = now_ns + (uint64_t)wait * clock_ticks_to_ns(cpu->clock,
+                                                          cpu->cp0_count_rate);
     timer_mod(env->timer, next_ns);
 }
 
@@ -65,6 +70,7 @@ uint32_t cpu_mips_get_count(CPUMIPSState *env)
     if (env->CP0_Cause & (1 << CP0Ca_DC)) {
         return env->CP0_Count;
     } else {
+        MIPSCPU *cpu = env_archcpu(env);
         uint64_t now_ns;
 
         now_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -74,12 +80,16 @@ uint32_t cpu_mips_get_count(CPUMIPSState *env)
             cpu_mips_timer_expire(env);
         }
 
-        return env->CP0_Count + ns_to_count(env, now_ns);
+        return env->CP0_Count + tick_to_count(cpu,
+                                              clock_ns_to_ticks(cpu->clock,
+                                                                now_ns));
     }
 }
 
 void cpu_mips_store_count(CPUMIPSState *env, uint32_t count)
 {
+    MIPSCPU *cpu = env_archcpu(env);
+
     /*
      * This gets called from cpu_state_reset(), potentially before timer init.
      * So env->timer may be NULL, which is also the case with KVM enabled so
@@ -88,9 +98,13 @@ void cpu_mips_store_count(CPUMIPSState *env, uint32_t count)
     if (env->CP0_Cause & (1 << CP0Ca_DC) || !env->timer) {
         env->CP0_Count = count;
     } else {
+        uint64_t cp0_count_ticks;
+
+        cp0_count_ticks = clock_ns_to_ticks(cpu->clock,
+                                            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         /* Store new count register */
-        env->CP0_Count = ns_substract_to_count(env, count,
-                                               qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        env->CP0_Count = tick_substract_to_count(cpu, count, cp0_count_ticks);
+
         /* Update timer timer */
         cpu_mips_timer_update(env);
     }
@@ -115,8 +129,13 @@ void cpu_mips_start_count(CPUMIPSState *env)
 
 void cpu_mips_stop_count(CPUMIPSState *env)
 {
+    MIPSCPU *cpu = env_archcpu(env);
+    uint64_t cp0_count_ticks;
+
+    cp0_count_ticks = clock_ns_to_ticks(cpu->clock,
+                                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
     /* Store the current value */
-    env->CP0_Count += ns_to_count(env, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+    env->CP0_Count += tick_to_count(cpu, cp0_count_ticks);
 }
 
 static void mips_timer_cb(void *opaque)
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index db93d19c49a..a66caa44bee 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -595,22 +595,6 @@ static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 #define CPU_FREQ_HZ_DEFAULT     200000000
 #define CP0_COUNT_RATE_DEFAULT  2
 
-static void mips_cp0_period_set(MIPSCPU *cpu)
-{
-    CPUMIPSState *env = &cpu->env;
-
-    env->cp0_count_ns = clock_ticks_to_ns(MIPS_CPU(cpu)->clock,
-                                          cpu->cp0_count_rate);
-    assert(env->cp0_count_ns);
-}
-
-static void mips_cpu_clk_update(void *opaque, ClockEvent event)
-{
-    MIPSCPU *cpu = opaque;
-
-    mips_cp0_period_set(cpu);
-}
-
 static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -660,7 +644,7 @@ static void mips_cpu_initfn(Object *obj)
 
     cpu_set_cpustate_pointers(cpu);
     cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk-in",
-                                    mips_cpu_clk_update, cpu, ClockUpdate);
+                                    NULL, NULL, ClockUpdate);
     env->cpu_model = mcc->cpu_def;
 }
 
-- 
2.26.3


