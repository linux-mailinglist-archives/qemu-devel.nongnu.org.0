Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D7039BE31
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:11:47 +0200 (CEST)
Received: from localhost ([::1]:47572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDMI-0004Ho-EJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkY-00084E-5o
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkV-00026j-2d
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f2so9882545wri.11
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VxtZzAI4CoksM/sdPCcSUcUhaEvNzz/ZBq2sF1VS0fg=;
 b=mmWyplAU8upfLswSrr+m05yMVAWbdOW3TAzzB6OOqRCpinTkj7rWSBHcX0TTPA85Qt
 qihUyS3q8WmsPwvmHceE15/Nm9NjJ6+aBTWBRYRNnteIwEB8QAcxwQj5Uv+36pG5NBHH
 g4g0Gd/9b5l8tgSDZUO8pCzMcJj7WC7fqHQ2Sfzn6Kdry1AMOvBWUYU7smdr67SJcbri
 raWrjfV8qAetNvuGeVSR2wUk5SHs5YBwuPp32RSDZ/ZdzPD52hbpWimak7z4iO651fly
 daGf5VCXVEU+sYqpSsjQajkeqoPd4OfMASmk8LN9ryl0xoWQliabbRcIzKprAOfjpxK0
 7G/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VxtZzAI4CoksM/sdPCcSUcUhaEvNzz/ZBq2sF1VS0fg=;
 b=KEe9hUW+yInCByo0hu5BT6Czb6CoVJSsSJ0ss1MpU2gXXujgCMpZycfn9MK420UMMQ
 HTvFe2qhmQhDjy5mXMx5Gomgrw9ur84yDtj+xpAcD59kY0gbOlm8q4wiU/mqS6SLT7b8
 hsigBwN/ctblzsEplKsCRQeFgrk6v5r8ncBi+UtuxS5Je/oH7p93K8JIRep7kNb6XyhE
 J0kELmBTObTC+MtKdKUdxTuCa0RWp9Jblou/Nvv0o9oZKfZNG6s4Oyo8xVva3UxfQPjx
 dE8hQ/zFhpNOu0RO52XQjOpAyBNK0UX4GKMsqQ4hRRro7A7DN5fZAK5DtgEnQkZtYD7B
 ujhg==
X-Gm-Message-State: AOAM532LbVzMqAcCFiQqzbHYnRGvzCXKxRZPzJzgzAGNe7m8y3ysiwDJ
 aSXcnH5eBuFZvPaEhvL5WO1aKg==
X-Google-Smtp-Source: ABdhPJzLSKYZwYVIi5dj2EnVUomz1ST+fL5MIYXzvpuOSYTJKoEnsFGvRsQNrFwzhxsdMXZc3tDaKg==
X-Received: by 2002:a5d:4287:: with SMTP id k7mr4947896wrq.98.1622824361505;
 Fri, 04 Jun 2021 09:32:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g21sm7987458wrb.46.2021.06.04.09.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DAD161FFD8;
 Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 67/99] target/arm: create kvm cpu accel class
Date: Fri,  4 Jun 2021 16:52:40 +0100
Message-Id: <20210604155312.15902-68-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

move init, realizefn and reset code into it.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/internals.h     |   1 -
 target/arm/cpu-sysemu.c    |  32 ----------
 target/arm/cpu.c           |  49 +++-----------
 target/arm/kvm/kvm-cpu.c   | 128 +++++++++++++++++++++++++++++++++++++
 target/arm/kvm/meson.build |   1 +
 5 files changed, 137 insertions(+), 74 deletions(-)
 create mode 100644 target/arm/kvm/kvm-cpu.c

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 227a80ec21..522596d15f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1165,7 +1165,6 @@ static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
 
 #ifndef CONFIG_USER_ONLY
 void arm_cpu_set_irq(void *opaque, int irq, int level);
-void arm_cpu_kvm_set_irq(void *opaque, int irq, int level);
 bool arm_cpu_virtio_is_big_endian(CPUState *cs);
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 26467c640b..fff55311f4 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -24,7 +24,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "sysemu/hw_accel.h"
-#include "kvm/kvm_arm.h"
 #include "sysemu/tcg.h"
 #include "tcg/tcg-cpu.h"
 
@@ -72,37 +71,6 @@ void arm_cpu_set_irq(void *opaque, int irq, int level)
     }
 }
 
-void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
-{
-#ifdef CONFIG_KVM
-    ARMCPU *cpu = opaque;
-    CPUARMState *env = &cpu->env;
-    CPUState *cs = CPU(cpu);
-    uint32_t linestate_bit;
-    int irq_id;
-
-    switch (irq) {
-    case ARM_CPU_IRQ:
-        irq_id = KVM_ARM_IRQ_CPU_IRQ;
-        linestate_bit = CPU_INTERRUPT_HARD;
-        break;
-    case ARM_CPU_FIQ:
-        irq_id = KVM_ARM_IRQ_CPU_FIQ;
-        linestate_bit = CPU_INTERRUPT_FIQ;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (level) {
-        env->irq_line_state |= linestate_bit;
-    } else {
-        env->irq_line_state &= ~linestate_bit;
-    }
-    kvm_arm_set_irq(cs->cpu_index, KVM_ARM_IRQ_TYPE_CPU, irq_id, !!level);
-#endif
-}
-
 bool arm_cpu_virtio_is_big_endian(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 57f975f5dc..0ecbfa060c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -42,6 +42,7 @@
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 #include "cpu-mmu.h"
+#include "qemu/accel.h"
 
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -409,11 +410,6 @@ static void arm_cpu_reset(DeviceState *dev)
                               &env->vfp.fp_status_f16);
     set_float_detect_tininess(float_tininess_before_rounding,
                               &env->vfp.standard_fp_status_f16);
-#ifndef CONFIG_USER_ONLY
-    if (kvm_enabled()) {
-        kvm_arm_reset_vcpu(cpu);
-    }
-#endif
 
     if (tcg_enabled()) {
         hw_breakpoint_update_all(cpu);
@@ -560,12 +556,7 @@ static void arm_cpu_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
     /* Our inbound IRQ and FIQ lines */
-    if (kvm_enabled()) {
-        /* VIRQ and VFIQ are unused with KVM but we add them to maintain
-         * the same interface as non-KVM CPUs.
-         */
-        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
-    } else if (tcg_enabled() || qtest_enabled()) {
+    if (tcg_enabled() || qtest_enabled()) {
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 4);
     }
 
@@ -809,6 +800,9 @@ void arm_cpu_post_init(Object *obj)
         }
     }
 #endif
+
+    /* if required, do accelerator-specific cpu initializations */
+    accel_cpu_instance_init(CPU(obj));
 }
 
 static void arm_cpu_finalizefn(Object *obj)
@@ -878,16 +872,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     bool no_aa32 = false;
 
-    /* If we needed to query the host kernel for the CPU features
+    /*
+     * If we needed to query the host kernel for the CPU features
      * then it's possible that might have failed in the initfn, but
      * this is the first point where we can report it.
      */
     if (cpu->host_cpu_probe_failed) {
-        if (!kvm_enabled()) {
-            error_setg(errp, "The 'host' CPU type can only be used with KVM");
-        } else {
-            error_setg(errp, "Failed to retrieve host CPU features");
-        }
+        error_setg(errp, "The 'host' CPU type can only be used with KVM");
         return;
     }
 
@@ -1486,26 +1477,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     arm32_cpu_class_init(oc, data);
 }
 
-#ifdef CONFIG_KVM
-static void arm_host_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    kvm_arm_set_cpu_features_from_host(cpu);
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        aarch64_add_sve_properties(obj);
-    }
-    arm_cpu_post_init(obj);
-}
-
-static const TypeInfo host_arm_cpu_type_info = {
-    .name = TYPE_ARM_HOST_CPU,
-    .parent = TYPE_AARCH64_CPU,
-    .instance_init = arm_host_initfn,
-};
-
-#endif
-
 static const TypeInfo arm_cpu_type_info = {
     .name = TYPE_ARM_CPU,
     .parent = TYPE_CPU,
@@ -1521,10 +1492,6 @@ static const TypeInfo arm_cpu_type_info = {
 static void arm_cpu_register_types(void)
 {
     type_register_static(&arm_cpu_type_info);
-
-#ifdef CONFIG_KVM
-    type_register_static(&host_arm_cpu_type_info);
-#endif
 }
 
 type_init(arm_cpu_register_types)
diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
new file mode 100644
index 0000000000..5fbb127e61
--- /dev/null
+++ b/target/arm/kvm/kvm-cpu.c
@@ -0,0 +1,128 @@
+/*
+ * QEMU ARM CPU
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "hw/core/accel-cpu.h"
+#include "qapi/error.h"
+
+#include "kvm/kvm_arm.h"
+#include "internals.h"
+
+static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    uint32_t linestate_bit;
+    int irq_id;
+
+    switch (irq) {
+    case ARM_CPU_IRQ:
+        irq_id = KVM_ARM_IRQ_CPU_IRQ;
+        linestate_bit = CPU_INTERRUPT_HARD;
+        break;
+    case ARM_CPU_FIQ:
+        irq_id = KVM_ARM_IRQ_CPU_FIQ;
+        linestate_bit = CPU_INTERRUPT_FIQ;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (level) {
+        env->irq_line_state |= linestate_bit;
+    } else {
+        env->irq_line_state &= ~linestate_bit;
+    }
+    kvm_arm_set_irq(cs->cpu_index, KVM_ARM_IRQ_TYPE_CPU, irq_id, !!level);
+}
+
+static void kvm_cpu_instance_init(CPUState *cs)
+{
+    /*
+     * VIRQ and VFIQ are unused with KVM but we add them to maintain
+     * the same interface as non-KVM CPUs.
+     */
+    qdev_init_gpio_in(DEVICE(cs), arm_cpu_kvm_set_irq, 4);
+}
+
+static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    /*
+     * If we needed to query the host kernel for the CPU features
+     * then it's possible that might have failed in the initfn, but
+     * this is the first point where we can report it.
+     */
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    if (cpu->host_cpu_probe_failed) {
+        error_setg(errp, "Failed to retrieve host CPU features");
+        return false;
+    }
+    return true;
+}
+
+static void host_cpu_instance_init(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    kvm_arm_set_cpu_features_from_host(cpu);
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        aarch64_add_sve_properties(obj);
+    }
+    arm_cpu_post_init(obj);
+}
+
+static void kvm_cpu_reset(CPUState *cs)
+{
+    kvm_arm_reset_vcpu(ARM_CPU(cs));
+}
+
+static const TypeInfo host_cpu_type_info = {
+    .name = ARM_CPU_TYPE_NAME("host"),
+    .parent = TYPE_AARCH64_CPU,
+    .instance_init = host_cpu_instance_init,
+};
+
+static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+
+    acc->cpu_realizefn = kvm_cpu_realizefn;
+    acc->cpu_instance_init = kvm_cpu_instance_init;
+    acc->cpu_reset = kvm_cpu_reset;
+}
+
+static const TypeInfo kvm_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("kvm"),
+    .parent = TYPE_ACCEL_CPU,
+    .class_init = kvm_cpu_accel_class_init,
+    .abstract = true,
+};
+
+static void kvm_cpu_accel_register_types(void)
+{
+    type_register_static(&host_cpu_type_info);
+    type_register_static(&kvm_cpu_accel_type_info);
+}
+
+type_init(kvm_cpu_accel_register_types);
diff --git a/target/arm/kvm/meson.build b/target/arm/kvm/meson.build
index e92010fa3f..ef58a29dd7 100644
--- a/target/arm/kvm/meson.build
+++ b/target/arm/kvm/meson.build
@@ -1,4 +1,5 @@
 arm_ss.add(when: 'CONFIG_KVM', if_true: files(
   'kvm.c',
   'kvm64.c',
+  'kvm-cpu.c',
 ))
-- 
2.20.1


