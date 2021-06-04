Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AE539BDEC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:02:41 +0200 (CEST)
Received: from localhost ([::1]:45398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDDU-0008Tr-25
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRF-0002po-01
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRB-0003oJ-6b
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:48 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a20so9911559wrc.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IZcluuGH+rF7DI3dlOPWDCggxxQXhI+T0BM1IJZ8hik=;
 b=jgqtgZh3OkQoHx0aooR74gfohMyDUIGBlhGfkcwgAMkkNJWJAM+Qbrhk/l4EJ7joac
 HzlOGrjNH9/ybbzz+R9UAZhrKF/QQXKqJGb+ndXZ5sVnDpBgI8modGF61owNzr0Cv6e8
 i1dSPVU/yjBgYsvjQLVwVr04OpKNPMILH4bhlWgCn/45VVzf5IqTzoCGoiBEazJCINto
 PtNRCb4VIN0vo7aDxsL+xFb1Xw7uQhFVYqpS0L9x8piJn7m7E5HA3T8oMVgc2XOsQp/7
 bHiJBnlh7J2RGoCllYVV56py6G71L+/44TBT94mo1R5yWp2OPyeQt/gSI9Hnrr7LEPV1
 VliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IZcluuGH+rF7DI3dlOPWDCggxxQXhI+T0BM1IJZ8hik=;
 b=KHEEBdmV8Ytzz28pRtpWqK06bKjDay2xy1PzCE+5jpWhLq9rv3qGjbtqtws74sJSq3
 S3jMOm29OoWFtIBgRwtAzxC/g/hU0vmfRW+2cMT41c50KxMrpnS5YL8OKlp1TRCLrpdN
 y49pevxuJwMmdyOcXxbdN8GfXKkUW8t8pe/Vg7Y63D9r/laPBn6tSd/iN1KDt5MdwnAh
 mLM4SAM30odQYWTMHqrglX3XRmbICfLYovupyztDMP6MjS6heEckJlzL4GzfmSpuBgXM
 11HteumgXJFzU65usG5/11HRSiZmFaNK9BZ+O/OTfgcPQXRt+mUs5OlFykpqT1B4s3Va
 XBOw==
X-Gm-Message-State: AOAM533g8OdqMvk8/ADjjTqGC25MYbyi4bvFyCVO/WvxL3i4LFEJfJdf
 67d3pkTI/HxBs6Y1GHgqoF2mKw==
X-Google-Smtp-Source: ABdhPJyjKr3qnZ31tbvNc+dxjrynGFBWIjUPam75haAAiE3X/lqNbb88GowAOUpMB6S4aYiKp5vuKA==
X-Received: by 2002:adf:eeca:: with SMTP id a10mr4651107wrp.184.1622823163871; 
 Fri, 04 Jun 2021 09:12:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l10sm7144801wrm.2.2021.06.04.09.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1DE7B1FFDD;
 Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 69/99] target/arm: add tcg cpu accel class
Date: Fri,  4 Jun 2021 16:52:42 +0100
Message-Id: <20210604155312.15902-70-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

move init, realizefn and reset code into it.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tcg-cpu.h        |  4 ++-
 target/arm/cpu.c                | 44 ++------------------------
 target/arm/tcg/sysemu/tcg-cpu.c | 27 ++++++++++++++++
 target/arm/tcg/tcg-cpu-models.c | 10 +++---
 target/arm/tcg/tcg-cpu.c        | 55 +++++++++++++++++++++++++++++++--
 5 files changed, 92 insertions(+), 48 deletions(-)

diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
index d93c6a6749..dd08587949 100644
--- a/target/arm/tcg/tcg-cpu.h
+++ b/target/arm/tcg/tcg-cpu.h
@@ -22,15 +22,17 @@
 
 #include "cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
+#include "hw/core/accel-cpu.h"
 
 void arm_cpu_synchronize_from_tb(CPUState *cs,
                                  const TranslationBlock *tb);
 
-extern struct TCGCPUOps arm_tcg_ops;
+void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc);
 
 #ifndef CONFIG_USER_ONLY
 /* Do semihosting call and set the appropriate return value. */
 void tcg_handle_semihosting(CPUState *cs);
+bool tcg_cpu_realizefn(CPUState *cs, Error **errp);
 
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 003e58d8ee..945dfbbe9d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -410,12 +410,6 @@ static void arm_cpu_reset(DeviceState *dev)
                               &env->vfp.fp_status_f16);
     set_float_detect_tininess(float_tininess_before_rounding,
                               &env->vfp.standard_fp_status_f16);
-
-    if (tcg_enabled()) {
-        hw_breakpoint_update_all(cpu);
-        hw_watchpoint_update_all(cpu);
-        arm_rebuild_hflags(env);
-    }
 }
 
 void arm_cpu_update_virq(ARMCPU *cpu)
@@ -576,10 +570,6 @@ static void arm_cpu_initfn(Object *obj)
     cpu->dtb_compatible = "qemu,unknown";
     cpu->psci_version = 1; /* By default assume PSCI v0.1 */
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
-
-    if (tcg_enabled()) {
-        cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
-    }
 }
 
 static Property arm_cpu_gt_cntfrq_property =
@@ -868,34 +858,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     bool no_aa32 = false;
 
-    /*
-     * If we needed to query the host kernel for the CPU features
-     * then it's possible that might have failed in the initfn, but
-     * this is the first point where we can report it.
-     */
-    if (cpu->host_cpu_probe_failed) {
-        error_setg(errp, "The 'host' CPU type can only be used with KVM");
-        return;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    /* The NVIC and M-profile CPU are two halves of a single piece of
-     * hardware; trying to use one without the other is a command line
-     * error and will result in segfaults if not caught here.
-     */
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        if (!env->nvic) {
-            error_setg(errp, "This board cannot be used with Cortex-M CPUs");
-            return;
-        }
-    } else {
-        if (env->nvic) {
-            error_setg(errp, "This board can only be used with Cortex-M CPUs");
-            return;
-        }
-    }
-
-#ifdef CONFIG_TCG
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     {
         uint64_t scale;
 
@@ -921,8 +884,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                   arm_gt_hvtimer_cb, cpu);
     }
-#endif /* CONFIG_TCG */
-#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -1467,7 +1429,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = arm_disas_set_info;
 
 #ifdef CONFIG_TCG
-    cc->tcg_ops = &arm_tcg_ops;
+    cc->init_accel_cpu = tcg_arm_init_accel_cpu;
 #endif /* CONFIG_TCG */
 
     arm32_cpu_class_init(oc, data);
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index 327b2a5073..115ac523dc 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -19,10 +19,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/timer.h"
 #include "cpu.h"
 #include "semihosting/common-semi.h"
 #include "qemu/log.h"
 #include "tcg/tcg-cpu.h"
+#include "internals.h"
 
 /*
  * Do semihosting call and set the appropriate return value. All the
@@ -50,3 +53,27 @@ void tcg_handle_semihosting(CPUState *cs)
         env->regs[15] += env->thumb ? 2 : 4;
     }
 }
+
+bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * The NVIC and M-profile CPU are two halves of a single piece of
+     * hardware; trying to use one without the other is a command line
+     * error and will result in segfaults if not caught here.
+     */
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        if (!env->nvic) {
+            error_setg(errp, "This board cannot be used with Cortex-M CPUs");
+            return false;
+        }
+    } else {
+        if (env->nvic) {
+            error_setg(errp, "This board can only be used with Cortex-M CPUs");
+            return false;
+        }
+    }
+    return true;
+}
diff --git a/target/arm/tcg/tcg-cpu-models.c b/target/arm/tcg/tcg-cpu-models.c
index 91af2174a1..975869f276 100644
--- a/target/arm/tcg/tcg-cpu-models.c
+++ b/target/arm/tcg/tcg-cpu-models.c
@@ -846,16 +846,18 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
 };
 #endif /* CONFIG_TCG */
 
+static void arm_v7m_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc)
+{
+    cc->tcg_ops = &arm_v7m_tcg_ops;
+}
+
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
 
     acc->info = data;
-#ifdef CONFIG_TCG
-    cc->tcg_ops = &arm_v7m_tcg_ops;
-#endif /* CONFIG_TCG */
-
+    cc->init_accel_cpu = arm_v7m_init_accel_cpu;
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
diff --git a/target/arm/tcg/tcg-cpu.c b/target/arm/tcg/tcg-cpu.c
index 9fd996d908..db677bc71c 100644
--- a/target/arm/tcg/tcg-cpu.c
+++ b/target/arm/tcg/tcg-cpu.c
@@ -20,8 +20,8 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "qapi/error.h"
 #include "tcg-cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
 #include "cpregs.h"
 #include "internals.h"
 #include "exec/exec-all.h"
@@ -212,7 +212,7 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return true;
 }
 
-struct TCGCPUOps arm_tcg_ops = {
+static struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
@@ -227,3 +227,54 @@ struct TCGCPUOps arm_tcg_ops = {
     .debug_check_watchpoint = arm_debug_check_watchpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
+
+static void tcg_cpu_instance_init(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    /*
+     * this would be the place to move TCG-specific props
+     * in future refactoring of cpu properties.
+     */
+
+    cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
+}
+
+static void tcg_cpu_reset(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    hw_breakpoint_update_all(cpu);
+    hw_watchpoint_update_all(cpu);
+    arm_rebuild_hflags(env);
+}
+
+void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc)
+{
+    cc->tcg_ops = &arm_tcg_ops;
+}
+
+static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+
+#ifndef CONFIG_USER_ONLY
+    acc->cpu_realizefn = tcg_cpu_realizefn;
+#endif /* CONFIG_USER_ONLY */
+
+    acc->cpu_instance_init = tcg_cpu_instance_init;
+    acc->cpu_reset = tcg_cpu_reset;
+}
+static const TypeInfo tcg_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("tcg"),
+
+    .parent = TYPE_ACCEL_CPU,
+    .class_init = tcg_cpu_accel_class_init,
+    .abstract = true,
+};
+static void tcg_cpu_accel_register_types(void)
+{
+    type_register_static(&tcg_cpu_accel_type_info);
+}
+type_init(tcg_cpu_accel_register_types);
-- 
2.20.1


