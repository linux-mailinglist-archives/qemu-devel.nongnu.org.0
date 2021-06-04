Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C9939BE46
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:14:45 +0200 (CEST)
Received: from localhost ([::1]:55912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDPA-0001Yc-RH
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkb-00089e-4O
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkY-00028Z-6F
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a11so8036049wrt.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PhGU2QFq4twF/mv+HlJpA4XPpT43a+FIEkesYvvyBBs=;
 b=h9SfbPu3XAsH6gTS4+glqg4BVSYXE3ystjWl5UfeVBGIR7c0nvlHUXLPBR58jRfz4G
 9ydX21jUr+FtU/Bmpyn2DhonFzPpKhvyOzi5UqpFDsU+54nzoDLzfOInMdSAWIWYsWXZ
 2U5/3D3Osjpia3iFEQuNNC/yvlwGeYaRrwPKIhTPfjzsVA91xop7f/4VkypNSlSj+Y0a
 mdQkMBP2Y9oCnqsdhNBuUiP8LqntVRLCBO2issiELmxV1HNwxgPiZ7xgq/NqBfkY7gZ+
 xcJ8RqAFZHpyk9Cksv1lRGmklHilMXwFhxNlaYokwWQpxhQWa6lJ5Cp9wSMKw7x8wk5i
 7/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhGU2QFq4twF/mv+HlJpA4XPpT43a+FIEkesYvvyBBs=;
 b=Pp5Wcs5F6B19noLxwnzoFZPBlRMvlKjM6cdcwjHUffcyK/45OnM4x+VTV8BUNnVw5d
 GSoCGk9ktUiJbtyeE0I1/tQ5TS4p96lvm0l39RHEHZpnQoPN/ZR2IFVT4kwN66LCxqaw
 KpbFN2X8scRQbTu/q3MRIyou/leCWtTmNGcJnQf0jx1xkUtDKx20kbBT8MOUhm0BGkGw
 hhe2bcesLyz2hG08QVaI33yKos7+8StFEh3hOdOY8XKWzZpC0/dYy6ehoG60CJ/qwnAZ
 rucNRLC137/NqJLHHwWyh4rVh1pD0ADgUdeNie89J4W/AnTrXvnLGkVlR5GBx0RAhHDc
 APFA==
X-Gm-Message-State: AOAM531klN4CSZRNKqwUqmytGXX7GRHFPEirCLi+AFZwdYryYC9cYPQ2
 oUTt9p5CkiJY6H2W1Ebk9Daq6g==
X-Google-Smtp-Source: ABdhPJyAPNd40ouHkfmsLaYOhJcoMcXHosmRWbUmwQLxSIIGk+lntH54mAtX58C4+ZvrYx/zMsblpg==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr4647776wro.375.1622824364849; 
 Fri, 04 Jun 2021 09:32:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k8sm4338274wrp.3.2021.06.04.09.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AEA5F1FFB5;
 Fri,  4 Jun 2021 16:53:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 30/99] target/arm: only perform TCG cpu and machine inits
 if TCG enabled
Date: Fri,  4 Jun 2021 16:52:03 +0100
Message-Id: <20210604155312.15902-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

of note, cpreg lists were previously initialized by TCG first,
and then thrown away and replaced with the data coming from KVM.

Now we just initialize once, either for TCG or for KVM.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c     | 32 ++++++++++++++++++--------------
 target/arm/kvm.c     | 18 +++++++++---------
 target/arm/machine.c | 20 +++++++++++++-------
 3 files changed, 40 insertions(+), 30 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9e616a15e1..7bb406efd2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -435,9 +435,11 @@ static void arm_cpu_reset(DeviceState *dev)
     }
 #endif
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
-    arm_rebuild_hflags(env);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+        arm_rebuild_hflags(env);
+    }
 }
 
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
@@ -1318,6 +1320,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+#ifdef CONFIG_TCG
     {
         uint64_t scale;
 
@@ -1343,7 +1346,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                   arm_gt_hvtimer_cb, cpu);
     }
-#endif
+#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -1646,17 +1650,16 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         unset_feature(env, ARM_FEATURE_PMU);
     }
     if (arm_feature(env, ARM_FEATURE_PMU)) {
-        pmu_init(cpu);
-
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
+            pmu_init(cpu);
             arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
             arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
-        }
 
 #ifndef CONFIG_USER_ONLY
-        cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
-                cpu);
+            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
+                                          cpu);
 #endif
+        }
     } else {
         cpu->isar.id_aa64dfr0 =
             FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
@@ -1739,10 +1742,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, ARM_FEATURE_VBAR);
     }
 
-    register_cp_regs_for_features(cpu);
-    arm_cpu_register_gdb_regs_for_features(cpu);
-
-    init_cpreg_list(cpu);
+    if (tcg_enabled()) {
+        register_cp_regs_for_features(cpu);
+        arm_cpu_register_gdb_regs_for_features(cpu);
+        init_cpreg_list(cpu);
+    }
 
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8381ba224..1b093cc52f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -431,9 +431,11 @@ static uint64_t *kvm_arm_get_cpreg_ptr(ARMCPU *cpu, uint64_t regidx)
     return &cpu->cpreg_values[res - cpu->cpreg_indexes];
 }
 
-/* Initialize the ARMCPU cpreg list according to the kernel's
- * definition of what CPU registers it knows about (and throw away
- * the previous TCG-created cpreg list).
+/*
+ * Initialize the ARMCPU cpreg list according to the kernel's
+ * definition of what CPU registers it knows about.
+ *
+ * The parallel for TCG is init_cpreg_list() in tcg/
  */
 int kvm_arm_init_cpreg_list(ARMCPU *cpu)
 {
@@ -475,12 +477,10 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
         arraylen++;
     }
 
-    cpu->cpreg_indexes = g_renew(uint64_t, cpu->cpreg_indexes, arraylen);
-    cpu->cpreg_values = g_renew(uint64_t, cpu->cpreg_values, arraylen);
-    cpu->cpreg_vmstate_indexes = g_renew(uint64_t, cpu->cpreg_vmstate_indexes,
-                                         arraylen);
-    cpu->cpreg_vmstate_values = g_renew(uint64_t, cpu->cpreg_vmstate_values,
-                                        arraylen);
+    cpu->cpreg_indexes = g_new(uint64_t, arraylen);
+    cpu->cpreg_values = g_new(uint64_t, arraylen);
+    cpu->cpreg_vmstate_indexes = g_new(uint64_t, arraylen);
+    cpu->cpreg_vmstate_values = g_new(uint64_t, arraylen);
     cpu->cpreg_array_len = arraylen;
     cpu->cpreg_vmstate_array_len = arraylen;
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index e568662cca..2982e8d7f4 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -2,6 +2,7 @@
 #include "cpu.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "kvm_arm.h"
 #include "internals.h"
 #include "migration/cpu.h"
@@ -635,7 +636,7 @@ static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_start(&cpu->env);
     }
 
@@ -670,7 +671,7 @@ static int cpu_post_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_finish(&cpu->env);
     }
 
@@ -689,7 +690,7 @@ static int cpu_pre_load(void *opaque)
      */
     env->irq_line_state = UINT32_MAX;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_start(&cpu->env);
     }
 
@@ -759,13 +760,13 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
 
-    if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
+        arm_rebuild_hflags(&cpu->env);
     }
-    arm_rebuild_hflags(&cpu->env);
 
     return 0;
 }
@@ -815,8 +816,13 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
         VMSTATE_UINT32(env.exception.fsr, ARMCPU),
         VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
+#ifdef CONFIG_TCG
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
+#else
+        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
+        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
+#endif /* CONFIG_TCG */
         {
             .name = "power_state",
             .version_id = 0,
-- 
2.20.1


