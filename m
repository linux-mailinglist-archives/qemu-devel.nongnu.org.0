Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5C36CBB6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 21:32:30 +0200 (CEST)
Received: from localhost ([::1]:34156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbTRd-0005vx-M6
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 15:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTMY-0002vv-JZ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:27:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTMW-00006p-Q0
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:27:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id q9so6436023wrs.6
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 12:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zejWrx5whd529kSVIv21rXOnhEDRYb09IbWdv8XWcM0=;
 b=rganQD5ImbiEvkmGcs3L9IAYBBLHbN4arFaHeoxNVZhdfYw/Sgg9h2AVBjwQaANb+X
 JVUisjCChwcyujkAhFnThmnW5ngW/gykumjm1ErMYmyhKSqqFTndhNBRnHMghLXKGh43
 gNk9Jrr38/oD1YLcVYWQPJukTBlim0jNbI65lYxX/6m0Ebzqbc4LhDpAgU4Qthj29pb1
 vTceCd/LFnNvcWEXEWFzbAiLHmZBrQ2AM/wvDqPG9WNyo6Sw6Vtm0Cf36xvnsBFYLQgS
 PKEzhqF9+h6uZLUr7TpfHKWjxOVQ71NPgO0Zy5mQOnW12G93lTQYSQAHKrZfVvopqe5L
 FrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zejWrx5whd529kSVIv21rXOnhEDRYb09IbWdv8XWcM0=;
 b=sBTG91kFnjXCeFnsCo5am333w+VbJD+RkW8ddiY3cEBS3TPFm5+hW6hpRePzsXYP/V
 ddaPWV8GqbjNuT2Z1R8FZHskfXAj1h94E/ldJMS7d+LuyBLvHDY6ZN0R3jajUkQJ7hw4
 9ik0Rjh+W+ao4Eb9L1CSdbjnUHfVFK38jgc6cbpa06nsa0pr3/RTQehLTl3Mtumiavgp
 KNjD7klp/S8dJ8VoZYRfjQKqifTKmgm4ZeH0DFDOORnMHHAG7yR/YzLa8eR5Y1r1Ad4/
 2sCgvKh7Kj8qTNvoMwXjRnyKKR81giIJuADHcakL08FieyCJLei1scFhG5FUaQCh9Sll
 xHZg==
X-Gm-Message-State: AOAM530j5t8XIYTOd1CKIvIg3X8pzrEpROtP5QG76zYNURMv/M5DmkJD
 uWaQhiX7ti63RO1c5AdABatAA76iWFp1mw==
X-Google-Smtp-Source: ABdhPJw7PFDZuK6kYKWtuJzBxTUOB64H88dzL/uC4EtGEuxk8nNhIx4g6AaPH7D1oV1Fdx6uoVHPTw==
X-Received: by 2002:adf:ea06:: with SMTP id q6mr7348474wrm.34.1619551631222;
 Tue, 27 Apr 2021 12:27:11 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y5sm5287409wrm.61.2021.04.27.12.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 12:27:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] hw/sparc: Allow building without the leon3 machine
Date: Tue, 27 Apr 2021 21:26:58 +0200
Message-Id: <20210427192658.266933-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210427192658.266933-1-f4bug@amsat.org>
References: <20210427192658.266933-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC: The problem is we have hardware specific code in the
architectural translation code. I wish there was a better
alternative rather than moving this code to hw/sparc/.
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


