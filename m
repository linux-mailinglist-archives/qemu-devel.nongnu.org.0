Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2816539BD2D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:32:16 +0200 (CEST)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCk3-00047W-1o
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCI5-0008R1-1R
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:22 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHh-0005s9-Bi
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id z8so9801975wrp.12
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wuU8nDRdcW3/99gtEo5hPanI3MwrgtDEgaxIpfRRswM=;
 b=cUSanbjgU5p4C6tM8P66vDYmES/myvA0uhdkylnzBblqyHRqW9b0GNZmBQIqPbsa5r
 QHbpV/SzLedy8MGN9106VvzbIMxCWeSwNr8sQh0NWoEZzKA1Zrx4lSS+Xz41SWT8gHuv
 3+shnUcvZLEwJ17aqehc0nul4DIUDcFN/E448E1uVg5QBnBD4Vk/G8RZAfpyDZScPzB+
 k2gKGuaQF534bvGO31tmEfgY++6ZS/rSXDfzDwBCoy3GTVO1r+yTaKC+a44Kga7MA3Qg
 pJhDKskd/ngQMLLh77rBAi92pPNcfszJyVgS3IrfLZVPIzQlczb1FtXl9dgWNzJ51SBG
 TAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wuU8nDRdcW3/99gtEo5hPanI3MwrgtDEgaxIpfRRswM=;
 b=ZPtS8SWCfKVbSZwBZmwKi//tQ+j2wLjYo6VBZxZBafF6W89NDX5m1ezxP/vbkUriCJ
 wbP/8y72UnoiPPqdMQPRwWbgcGL+XBO/xi/9TE/WYTn1eWgqiuibktQwWBIp7FkEXQkU
 5DE87Agi2LPgC35MyYLaQ41u05tbPHh725y86GoUDaraMofeAGTllpyjbqA5IcCcMqmw
 aZ35PSTwfDRFFefLDpRaTPigr+Bu91V8zQektJTBjcpxkWMwHXthEzwvMt0XH9gk9X6D
 aDk/+TZ8KbSx63u+xQ8TEk+x5fCLwESryQYmeYt8a2aFsImfQvPQriNzPvTDvVivxU16
 8jCw==
X-Gm-Message-State: AOAM530h2UiRYqdkVocaOkxetmC87/UGuMsS4x7O4F4wjg9dhcu1pMPZ
 1glW7PkJkcAEA9X/9R3xc1z+Yg==
X-Google-Smtp-Source: ABdhPJxi821IHVetIh0prBnip7xTPC84KXgBTIX651edRhvxydKIdws+VxmgsMLQZuMe0gOcHAjiqg==
X-Received: by 2002:a5d:4c48:: with SMTP id n8mr4493694wrt.327.1622822575116; 
 Fri, 04 Jun 2021 09:02:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b8sm5400497wmd.35.2021.06.04.09.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 378FA1FFDE;
 Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 70/99] target/arm: move TCG gt timer creation code in tcg/
Date: Fri,  4 Jun 2021 16:52:43 +0100
Message-Id: <20210604155312.15902-71-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

we need to be careful not to use

if (tcg_enabled())

here, because of the VMSTATE definitions in machine.c,
which are only protected by CONFIG_TCG, and thus
it would break the --enable-tcg --enable-kvm build.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tcg-cpu.h        |  1 +
 target/arm/cpu.c                | 30 ++++---------------------
 target/arm/tcg/sysemu/tcg-cpu.c | 40 +++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
index dd08587949..3e4ce2c355 100644
--- a/target/arm/tcg/tcg-cpu.h
+++ b/target/arm/tcg/tcg-cpu.h
@@ -33,6 +33,7 @@ void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc);
 /* Do semihosting call and set the appropriate return value. */
 void tcg_handle_semihosting(CPUState *cs);
 bool tcg_cpu_realizefn(CPUState *cs, Error **errp);
+bool tcg_cpu_realize_gt_timers(CPUState *cs, Error **errp);
 
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 945dfbbe9d..2fef8ca471 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -859,32 +859,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     bool no_aa32 = false;
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
-    {
-        uint64_t scale;
-
-        if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
-            if (!cpu->gt_cntfrq_hz) {
-                error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz",
-                           cpu->gt_cntfrq_hz);
-                return;
-            }
-            scale = gt_cntfrq_period_ns(cpu);
-        } else {
-            scale = GTIMER_SCALE;
-        }
-
-        cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                               arm_gt_ptimer_cb, cpu);
-        cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                               arm_gt_vtimer_cb, cpu);
-        cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                              arm_gt_htimer_cb, cpu);
-        cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                              arm_gt_stimer_cb, cpu);
-        cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                                  arm_gt_hvtimer_cb, cpu);
-    }
-#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
+    if (!tcg_cpu_realize_gt_timers(cs, errp)) {
+        return;
+    }
+#endif
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index 115ac523dc..1c6df15092 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -54,6 +54,46 @@ void tcg_handle_semihosting(CPUState *cs)
     }
 }
 
+/*
+ * we cannot use tcg_enabled() to condition the call to this function,
+ * due to the fields VMSTATE definitions in machine.c : it would break
+ * the --enable-tcg --enable-kvm build. We need to run this code whenever
+ * CONFIG_TCG is true, regardless of the chosen accelerator.
+ *
+ * So we cannot call this from tcg_cpu_realizefn, as this needs to
+ * be called whenever TCG is built-in, regardless of whether it is
+ * enabled or not.
+ */
+bool tcg_cpu_realize_gt_timers(CPUState *cs, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint64_t scale;
+
+    if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
+        if (!cpu->gt_cntfrq_hz) {
+            error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz",
+                       cpu->gt_cntfrq_hz);
+            return false;
+        }
+        scale = gt_cntfrq_period_ns(cpu);
+    } else {
+        scale = GTIMER_SCALE;
+    }
+
+    cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                           arm_gt_ptimer_cb, cpu);
+    cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                           arm_gt_vtimer_cb, cpu);
+    cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                          arm_gt_htimer_cb, cpu);
+    cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                          arm_gt_stimer_cb, cpu);
+    cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                              arm_gt_hvtimer_cb, cpu);
+    return true;
+}
+
 bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.20.1


