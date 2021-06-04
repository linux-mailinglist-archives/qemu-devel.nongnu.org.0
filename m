Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE239BD1B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:29:03 +0200 (CEST)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCgw-0006c7-5C
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRI-0002x6-4v
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:52 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRC-0003pF-QP
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id z8so9831954wrp.12
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCSulBcboNnhY3ZaOpOOMESbDYWsZSCOIUDwjeQhgs4=;
 b=K+VlibPVepMujXzNtGQBh8v6ArVzXuqim/LVzd/SGYDgZ3mc7+iMaFoQDQXX3M4gGL
 aWVwCUi3SkYIRe1Z9lWGra7axoT6/IU6M2sADR8uUOPXeINsSaSvuXx32flCfe5Jsfjx
 FVF4tX662du1+bT1+ya8eb0NUpvTrqWlVdnIYz5LkLGs5HF9pmkegoV8gq4PwJWZ2QJv
 UDlvk66hlV5iDUzeCxAk79SNiRU8BUh0WlEsAlAEBdDiKCEQZ2N8kmDYrRaAeOF/SW/H
 PPJBb0dQH+xIeQ4LbRPz9fhyVdjHIqyDuFrC/VE/VoBtscSUXfJFjBVhUW788lYIhh+W
 fauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCSulBcboNnhY3ZaOpOOMESbDYWsZSCOIUDwjeQhgs4=;
 b=KxKJaoK6xJM4xWIDSR3Ou4GwQfrPqwM2heNqW057pOp0lfKPrupk8r4Exc+0awIGXX
 9xwb01qeJX3rND/W/dlhqxdIX0F9YzjOde3dPs3BNqx65Ea33UzFSPifrtnC9x9f9Zw+
 5ttA4y0lqZiOvR+MrVDI8LQ43f4/HiZxIUN5w248D2oQ6PYKX2qCdr42dFP3pbtekfVt
 MPxCxVBc8k5kT/o7ylxLSbaKdjkQUpGaouLNGVkKpsAoxuegehSSqbxrPc8i7Q5rp8GS
 WjcTse+QoCNpAYRh3MYfNC+cHXzntCQ11gXKRWaaWIDopzPyVofSP+NRCrHu4b5RHhpp
 jHlA==
X-Gm-Message-State: AOAM531obpmzttaupgYFs8knokcRfppXnlkzAjET9Jv0Kqd9qMMv7Ias
 K86xryKP6WF40wTmkWVDzjjDzA==
X-Google-Smtp-Source: ABdhPJxYSAESxB7xbZSoXwJlOSK7MnCMaJLqh0xi9M1nKIQeORgpSl0F1J8eshvzFMjr0tbVTWKNjQ==
X-Received: by 2002:adf:df02:: with SMTP id y2mr4641178wrl.120.1622823165406; 
 Fri, 04 Jun 2021 09:12:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm9299316wrf.0.2021.06.04.09.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1BDFF1FFAE;
 Fri,  4 Jun 2021 16:53:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 24/99] target/arm: split off cpu-sysemu.c
Date: Fri,  4 Jun 2021 16:51:57 +0100
Message-Id: <20210604155312.15902-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

move work is needed later on to split things into
tcg-specific portions and kvm-specific portions of this

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/internals.h  |   8 ++-
 target/arm/cpu-sysemu.c | 105 ++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.c        |  83 -------------------------------
 target/arm/meson.build  |   1 +
 4 files changed, 113 insertions(+), 84 deletions(-)
 create mode 100644 target/arm/cpu-sysemu.c

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 886db56b58..8809334228 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1202,4 +1202,10 @@ static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
     return ptr;
 }
 
-#endif
+#ifndef CONFIG_USER_ONLY
+void arm_cpu_set_irq(void *opaque, int irq, int level);
+void arm_cpu_kvm_set_irq(void *opaque, int irq, int level);
+bool arm_cpu_virtio_is_big_endian(CPUState *cs);
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* TARGET_ARM_INTERNALS_H */
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
new file mode 100644
index 0000000000..db1c8cb245
--- /dev/null
+++ b/target/arm/cpu-sysemu.c
@@ -0,0 +1,105 @@
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
+#include "cpu.h"
+#include "internals.h"
+#include "sysemu/hw_accel.h"
+#include "kvm_arm.h"
+
+void arm_cpu_set_irq(void *opaque, int irq, int level)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    static const int mask[] = {
+        [ARM_CPU_IRQ] = CPU_INTERRUPT_HARD,
+        [ARM_CPU_FIQ] = CPU_INTERRUPT_FIQ,
+        [ARM_CPU_VIRQ] = CPU_INTERRUPT_VIRQ,
+        [ARM_CPU_VFIQ] = CPU_INTERRUPT_VFIQ
+    };
+
+    if (level) {
+        env->irq_line_state |= mask[irq];
+    } else {
+        env->irq_line_state &= ~mask[irq];
+    }
+
+    switch (irq) {
+    case ARM_CPU_VIRQ:
+        assert(arm_feature(env, ARM_FEATURE_EL2));
+        arm_cpu_update_virq(cpu);
+        break;
+    case ARM_CPU_VFIQ:
+        assert(arm_feature(env, ARM_FEATURE_EL2));
+        arm_cpu_update_vfiq(cpu);
+        break;
+    case ARM_CPU_IRQ:
+    case ARM_CPU_FIQ:
+        if (level) {
+            cpu_interrupt(cs, mask[irq]);
+        } else {
+            cpu_reset_interrupt(cs, mask[irq]);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
+{
+#ifdef CONFIG_KVM
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
+#endif
+}
+
+bool arm_cpu_virtio_is_big_endian(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    cpu_synchronize_state(cs);
+    return arm_cpu_data_is_big_endian(env);
+}
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ad65b60b04..bd8413c161 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -649,89 +649,6 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
     }
 }
 
-#ifndef CONFIG_USER_ONLY
-static void arm_cpu_set_irq(void *opaque, int irq, int level)
-{
-    ARMCPU *cpu = opaque;
-    CPUARMState *env = &cpu->env;
-    CPUState *cs = CPU(cpu);
-    static const int mask[] = {
-        [ARM_CPU_IRQ] = CPU_INTERRUPT_HARD,
-        [ARM_CPU_FIQ] = CPU_INTERRUPT_FIQ,
-        [ARM_CPU_VIRQ] = CPU_INTERRUPT_VIRQ,
-        [ARM_CPU_VFIQ] = CPU_INTERRUPT_VFIQ
-    };
-
-    if (level) {
-        env->irq_line_state |= mask[irq];
-    } else {
-        env->irq_line_state &= ~mask[irq];
-    }
-
-    switch (irq) {
-    case ARM_CPU_VIRQ:
-        assert(arm_feature(env, ARM_FEATURE_EL2));
-        arm_cpu_update_virq(cpu);
-        break;
-    case ARM_CPU_VFIQ:
-        assert(arm_feature(env, ARM_FEATURE_EL2));
-        arm_cpu_update_vfiq(cpu);
-        break;
-    case ARM_CPU_IRQ:
-    case ARM_CPU_FIQ:
-        if (level) {
-            cpu_interrupt(cs, mask[irq]);
-        } else {
-            cpu_reset_interrupt(cs, mask[irq]);
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
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
-static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    cpu_synchronize_state(cs);
-    return arm_cpu_data_is_big_endian(env);
-}
-
-#endif
-
 static int
 print_insn_thumb1(bfd_vma pc, disassemble_info *info)
 {
diff --git a/target/arm/meson.build b/target/arm/meson.build
index a9fdada0cc..b75392e3e9 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -17,6 +17,7 @@ arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
+  'cpu-sysemu.c',
   'machine.c',
   'monitor.c',
 ))
-- 
2.20.1


