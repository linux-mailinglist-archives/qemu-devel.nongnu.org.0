Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1C36D974
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:20:07 +0200 (CEST)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbl2s-0001Nj-IJ
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbl09-0006dP-Fo
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:17:17 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbl01-0003Jv-BS
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:17:17 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m9so50510428wrx.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VXwJMgfTCzcmDZmdzUQlG/w+wYVj2e6Bgl1h2XHKQyk=;
 b=gWJd0NojUE6Ff/prtcHoxbqdHF6AMpDDPs+pZp2yHmuGrgRAZOhYOrBP0toC+FOzlQ
 KE5VSP5N9yOawhXBipyitM3vd3qTUCVJnKbYX3ZaWosA+KpZuifPiEyhvAbDQMFibfin
 n4L2shCRDK13xn+dXMvZL1e/wrRjGhv8LqBe+SQuajRsQyAs7V/P6Qn6bfx9RI+EI9Mj
 ZUTGmNZkUK91HyYpH3VP5zfO2OVIuUAsW0PK4upcJeKtL8xqkbncmBeqbPejYnh8Hbjo
 FJRxaPmFrgyMdtw9Ubf6xDzB9hGkllo6ZKr904Mn64/GPpEU67Otr1MU9b2BwoQOVxQ/
 uEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VXwJMgfTCzcmDZmdzUQlG/w+wYVj2e6Bgl1h2XHKQyk=;
 b=mdLHZoFjgKQ70teski3PMQeuGhUyEb4Je4IuSXqbpQtl/gZ5klcocFUS8UPL4Izlp+
 4ftWdT/Q+TUowrdBO62eHDValjTWs2tWL+QFYwb2LU6Ba/wQwtxcj5dxu7Phzye2mVef
 PFuQ3jgDG9859uNvP5aPPcj20hRbHIlz8yzu5BwLdKVZ9RTwSo8yDDac+ewHNYezFA5y
 TNCm+48pLqdZ3t4NmmTa5POFZ5KDxjkzIQlcRQLMy7YFFNSbkpPLBYzZXxjUnnMBs3RY
 oBlK5H/iTXHvDBLPxQRapHMQ1hsDQn3i2nKjKrahGyXFg2KAm4CNXr2qH9V9dFJHlfaN
 vyTw==
X-Gm-Message-State: AOAM530/dYzYKktG1maREldHX5RefA6VWwWr82EY2TceEzcUmU8JgQbV
 suW2B/qa3U80ek6orkKi1Hu+gTXWRpV4cA==
X-Google-Smtp-Source: ABdhPJyYla6o1vno5mXOdK79LrCSlzpfU+4DIsTEnz8X4OVWrD601kjIZXjd4vWOSZTT1mBQCxZqHg==
X-Received: by 2002:adf:f6c5:: with SMTP id y5mr37210090wrp.121.1619619427511; 
 Wed, 28 Apr 2021 07:17:07 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b15sm111735wrt.57.2021.04.28.07.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 07:17:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] hw/sparc: Allow building without the leon3 machine
Date: Wed, 28 Apr 2021 16:16:51 +0200
Message-Id: <20210428141655.387430-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428141655.387430-1-f4bug@amsat.org>
References: <20210428141655.387430-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building without the leon3 machine, we get this link failure:

  /usr/bin/ld: target_sparc_int32_helper.c.o: in function `leon3_irq_manager':
  target/sparc/int32_helper.c:172: undefined reference to `leon3_irq_ack'

This is because the leon3_irq_ack() is declared in hw/sparc/leon3.c,
which is only build when CONFIG_LEON3 is selected.

Fix by moving the leon3_cache_control_int() / leon3_irq_manager()
(which are specific to the leon3 machine) to hw/sparc/leon3.c.
Move the trace events along (but don't rename them).

leon3_irq_ack() is now locally used, declare it static to reduce
its scope.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Tested-by: KONRAD Frederic <frederic.konrad@adacore.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.h          |  6 ------
 hw/sparc/leon3.c            | 37 ++++++++++++++++++++++++++++++++++++-
 target/sparc/int32_helper.c | 37 -------------------------------------
 hw/sparc/trace-events       |  2 ++
 target/sparc/trace-events   |  4 ----
 5 files changed, 38 insertions(+), 48 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 4b2290650be..ff8ae73002a 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -615,15 +615,9 @@ int cpu_cwp_inc(CPUSPARCState *env1, int cwp);
 int cpu_cwp_dec(CPUSPARCState *env1, int cwp);
 void cpu_set_cwp(CPUSPARCState *env1, int new_cwp);
 
-/* int_helper.c */
-void leon3_irq_manager(CPUSPARCState *env, void *irq_manager, int intno);
-
 /* sun4m.c, sun4u.c */
 void cpu_check_irqs(CPUSPARCState *env);
 
-/* leon3.c */
-void leon3_irq_ack(void *irq_manager, int intno);
-
 #if defined (TARGET_SPARC64)
 
 static inline int compare_masked(uint64_t x, uint64_t y, uint64_t mask)
diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 7e16eea9e67..98e3789cf84 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -137,7 +137,36 @@ static void main_cpu_reset(void *opaque)
     env->regbase[6] = s->sp;
 }
 
-void leon3_irq_ack(void *irq_manager, int intno)
+static void leon3_cache_control_int(CPUSPARCState *env)
+{
+    uint32_t state = 0;
+
+    if (env->cache_control & CACHE_CTRL_IF) {
+        /* Instruction cache state */
+        state = env->cache_control & CACHE_STATE_MASK;
+        if (state == CACHE_ENABLED) {
+            state = CACHE_FROZEN;
+            trace_int_helper_icache_freeze();
+        }
+
+        env->cache_control &= ~CACHE_STATE_MASK;
+        env->cache_control |= state;
+    }
+
+    if (env->cache_control & CACHE_CTRL_DF) {
+        /* Data cache state */
+        state = (env->cache_control >> 2) & CACHE_STATE_MASK;
+        if (state == CACHE_ENABLED) {
+            state = CACHE_FROZEN;
+            trace_int_helper_dcache_freeze();
+        }
+
+        env->cache_control &= ~(CACHE_STATE_MASK << 2);
+        env->cache_control |= (state << 2);
+    }
+}
+
+static void leon3_irq_ack(void *irq_manager, int intno)
 {
     grlib_irqmp_ack((DeviceState *)irq_manager, intno);
 }
@@ -181,6 +210,12 @@ static void leon3_set_pil_in(void *opaque, int n, int level)
     }
 }
 
+static void leon3_irq_manager(CPUSPARCState *env, void *irq_manager, int intno)
+{
+    leon3_irq_ack(irq_manager, intno);
+    leon3_cache_control_int(env);
+}
+
 static void leon3_generic_hw_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
index 817a463a179..d008dbdb65c 100644
--- a/target/sparc/int32_helper.c
+++ b/target/sparc/int32_helper.c
@@ -136,40 +136,3 @@ void sparc_cpu_do_interrupt(CPUState *cs)
     }
 #endif
 }
-
-#if !defined(CONFIG_USER_ONLY)
-static void leon3_cache_control_int(CPUSPARCState *env)
-{
-    uint32_t state = 0;
-
-    if (env->cache_control & CACHE_CTRL_IF) {
-        /* Instruction cache state */
-        state = env->cache_control & CACHE_STATE_MASK;
-        if (state == CACHE_ENABLED) {
-            state = CACHE_FROZEN;
-            trace_int_helper_icache_freeze();
-        }
-
-        env->cache_control &= ~CACHE_STATE_MASK;
-        env->cache_control |= state;
-    }
-
-    if (env->cache_control & CACHE_CTRL_DF) {
-        /* Data cache state */
-        state = (env->cache_control >> 2) & CACHE_STATE_MASK;
-        if (state == CACHE_ENABLED) {
-            state = CACHE_FROZEN;
-            trace_int_helper_dcache_freeze();
-        }
-
-        env->cache_control &= ~(CACHE_STATE_MASK << 2);
-        env->cache_control |= (state << 2);
-    }
-}
-
-void leon3_irq_manager(CPUSPARCState *env, void *irq_manager, int intno)
-{
-    leon3_irq_ack(irq_manager, intno);
-    leon3_cache_control_int(env);
-}
-#endif
diff --git a/hw/sparc/trace-events b/hw/sparc/trace-events
index 355b07ae057..dfb53dc1a24 100644
--- a/hw/sparc/trace-events
+++ b/hw/sparc/trace-events
@@ -19,3 +19,5 @@ sun4m_iommu_bad_addr(uint64_t addr) "bad addr 0x%"PRIx64
 # leon3.c
 leon3_set_irq(int intno) "Set CPU IRQ %d"
 leon3_reset_irq(int intno) "Reset CPU IRQ %d"
+int_helper_icache_freeze(void) "Instruction cache: freeze"
+int_helper_dcache_freeze(void) "Data cache: freeze"
diff --git a/target/sparc/trace-events b/target/sparc/trace-events
index 6a064e23275..e925ddd1cc0 100644
--- a/target/sparc/trace-events
+++ b/target/sparc/trace-events
@@ -15,10 +15,6 @@ int_helper_set_softint(uint32_t softint) "new 0x%08x"
 int_helper_clear_softint(uint32_t softint) "new 0x%08x"
 int_helper_write_softint(uint32_t softint) "new 0x%08x"
 
-# int32_helper.c
-int_helper_icache_freeze(void) "Instruction cache: freeze"
-int_helper_dcache_freeze(void) "Data cache: freeze"
-
 # win_helper.c
 win_helper_gregset_error(uint32_t pstate) "ERROR in get_gregset: active pstate bits=0x%x"
 win_helper_switch_pstate(uint32_t pstate_regs, uint32_t new_pstate_regs) "change_pstate: switching regs old=0x%x new=0x%x"
-- 
2.26.3


