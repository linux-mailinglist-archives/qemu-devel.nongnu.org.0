Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F551FC7F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:18:35 +0200 (CEST)
Received: from localhost ([::1]:56540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2LS-00089s-P0
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22c-0007VR-Ka
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22a-0001JR-Le
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:06 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so8121506wme.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h2fvx2tQiDpuY8jz1XT17Zp34OPniFEINsNj/DI0Pqc=;
 b=S5WsTObh8gIUMIGjrBSg5/qN3xTcHAoUYuWnNiFBEcvGyDxPSn2EY5dJKoP8vZCGVp
 fp0TtNa07/kiYEiyZxdtlGTsM3oSus5GCOed6axJmlVu688lsh0JIz0+63BToBbCNYjc
 B9DT1uxNZSveASiNuf1B6T9hjjwRpeS0c0XirK2cQzklztm8pYBa0U/gtKpeol7f+g2m
 DbiBrlaLg0K0Q0JJtB+f2hoeZybmS/rT5d3VQtJcqQMkK8DD4eq5uU9mCWGP3/xt3apF
 7vPxVYnFfZ/+MNz8baau/iiDRQiNP1rpmSqcuizt7x586NHHNEmMaLpNtQvvNsuMlG33
 zeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2fvx2tQiDpuY8jz1XT17Zp34OPniFEINsNj/DI0Pqc=;
 b=4JNSrIi3hXk+UX4c+8eFM58rQ9OcqxYv/HwAISJQOkB8wRjuu8uYErLIxT7jeyYJsC
 gsVAiaYYCy6CMFj5LniTk9FVX0NTeAu5cnKe5MJTwFhE8QluzmIBV8ZncQYsDMegMD+k
 0Ap8sC5moGMJtE28FLemyYawdSu+lxGpFX6cwqi9WchhXI80LkMOu7ge0WlYCmNobpoX
 qf7w6B2cUD87UQld5N57j+OcWvxmW8UfMGlbDIX4APl+SBFagy4B61UiXgOukJ4EOgZQ
 LePAIFRBe/KS9euIeAykIzKOef76AxYZwSps0QoQbnXlawSIa5+DjdepAsTjYck0RYK0
 dE8g==
X-Gm-Message-State: AOAM5328W4jeDKsh9/yigOmPXz+ZLKBX7VmeghpyQfXdptpSICEojGcz
 MF8S48lh2rRRVoYfcWWb1hxkO/MXlEf5Tw==
X-Google-Smtp-Source: ABdhPJwCORZzch+UtI+TFWEX6NrLfCkcoT6jwsEoggDVmNTUK0fP5wPkJJBL/ZayOXnSiq+a72ImSg==
X-Received: by 2002:a05:600c:35cc:b0:394:7b56:ef38 with SMTP id
 r12-20020a05600c35cc00b003947b56ef38mr15199685wmq.34.1652097543234; 
 Mon, 09 May 2022 04:59:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/32] target/arm: Implement virtual SError exceptions
Date: Mon,  9 May 2022 12:58:32 +0100
Message-Id: <20220509115848.3521805-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Virtual SError exceptions are raised by setting HCR_EL2.VSE,
and are routed to EL1 just like other virtual exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  2 ++
 target/arm/internals.h |  8 ++++++++
 target/arm/syndrome.h  |  5 +++++
 target/arm/cpu.c       | 38 +++++++++++++++++++++++++++++++++++++-
 target/arm/helper.c    | 40 +++++++++++++++++++++++++++++++++++++++-
 5 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a55980d66da..aade9237bde 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -56,6 +56,7 @@
 #define EXCP_LSERR          21   /* v8M LSERR SecureFault */
 #define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault */
 #define EXCP_DIVBYZERO      23   /* v7M DIVBYZERO UsageFault */
+#define EXCP_VSERR          24
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
@@ -89,6 +90,7 @@ enum {
 #define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
 #define CPU_INTERRUPT_VIRQ  CPU_INTERRUPT_TGT_EXT_2
 #define CPU_INTERRUPT_VFIQ  CPU_INTERRUPT_TGT_EXT_3
+#define CPU_INTERRUPT_VSERR CPU_INTERRUPT_TGT_INT_0
 
 /* The usual mapping for an AArch64 system register to its AArch32
  * counterpart is for the 32 bit world to have access to the lower
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c563b3735f2..6ca0e957468 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -947,6 +947,14 @@ void arm_cpu_update_virq(ARMCPU *cpu);
  */
 void arm_cpu_update_vfiq(ARMCPU *cpu);
 
+/**
+ * arm_cpu_update_vserr: Update CPU_INTERRUPT_VSERR bit
+ *
+ * Update the CPU_INTERRUPT_VSERR bit in cs->interrupt_request,
+ * following a change to the HCR_EL2.VSE bit.
+ */
+void arm_cpu_update_vserr(ARMCPU *cpu);
+
 /**
  * arm_mmu_idx_el:
  * @env: The cpu environment
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 8cde8e7243a..0cb26dde7d8 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -287,4 +287,9 @@ static inline uint32_t syn_pcalignment(void)
     return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
+static inline uint32_t syn_serror(uint32_t extra)
+{
+    return (EC_SERROR << ARM_EL_EC_SHIFT) | ARM_EL_IL | extra;
+}
+
 #endif /* TARGET_ARM_SYNDROME_H */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2667aaf28bf..652a84cf849 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -85,7 +85,7 @@ static bool arm_cpu_has_work(CPUState *cs)
     return (cpu->power_state != PSCI_OFF)
         && cs->interrupt_request &
         (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
-         | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
+         | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
          | CPU_INTERRUPT_EXITTB);
 }
 
@@ -511,6 +511,12 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
             return false;
         }
         return !(env->daif & PSTATE_I);
+    case EXCP_VSERR:
+        if (!(hcr_el2 & HCR_AMO) || (hcr_el2 & HCR_TGE)) {
+            /* VIRQs are only taken when hypervized.  */
+            return false;
+        }
+        return !(env->daif & PSTATE_A);
     default:
         g_assert_not_reached();
     }
@@ -632,6 +638,17 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             goto found;
         }
     }
+    if (interrupt_request & CPU_INTERRUPT_VSERR) {
+        excp_idx = EXCP_VSERR;
+        target_el = 1;
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
+            /* Taking a virtual abort clears HCR_EL2.VSE */
+            env->cp15.hcr_el2 &= ~HCR_VSE;
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_VSERR);
+            goto found;
+        }
+    }
     return false;
 
  found:
@@ -684,6 +701,25 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
     }
 }
 
+void arm_cpu_update_vserr(ARMCPU *cpu)
+{
+    /*
+     * Update the interrupt level for VSERR, which is the HCR_EL2.VSE bit.
+     */
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    bool new_state = env->cp15.hcr_el2 & HCR_VSE;
+
+    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VSERR) != 0)) {
+        if (new_state) {
+            cpu_interrupt(cs, CPU_INTERRUPT_VSERR);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_VSERR);
+        }
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static void arm_cpu_set_irq(void *opaque, int irq, int level)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b6faebf4a75..4857d2dbb80 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1863,7 +1863,12 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         }
     }
 
-    /* External aborts are not possible in QEMU so A bit is always clear */
+    if (hcr_el2 & HCR_AMO) {
+        if (cs->interrupt_request & CPU_INTERRUPT_VSERR) {
+            ret |= CPSR_A;
+        }
+    }
+
     return ret;
 }
 
@@ -5175,6 +5180,7 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
     g_assert(qemu_mutex_iothread_locked());
     arm_cpu_update_virq(cpu);
     arm_cpu_update_vfiq(cpu);
+    arm_cpu_update_vserr(cpu);
 }
 
 static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
@@ -9331,6 +9337,7 @@ void arm_log_exception(CPUState *cs)
             [EXCP_LSERR] = "v8M LSERR UsageFault",
             [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
             [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
+            [EXCP_VSERR] = "Virtual SERR",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
@@ -9843,6 +9850,31 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         mask = CPSR_A | CPSR_I | CPSR_F;
         offset = 4;
         break;
+    case EXCP_VSERR:
+        {
+            /*
+             * Note that this is reported as a data abort, but the DFAR
+             * has an UNKNOWN value.  Construct the SError syndrome from
+             * AET and ExT fields.
+             */
+            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal, };
+
+            if (extended_addresses_enabled(env)) {
+                env->exception.fsr = arm_fi_to_lfsc(&fi);
+            } else {
+                env->exception.fsr = arm_fi_to_sfsc(&fi);
+            }
+            env->exception.fsr |= env->cp15.vsesr_el2 & 0xd000;
+            A32_BANKED_CURRENT_REG_SET(env, dfsr, env->exception.fsr);
+            qemu_log_mask(CPU_LOG_INT, "...with IFSR 0x%x\n",
+                          env->exception.fsr);
+
+            new_mode = ARM_CPU_MODE_ABT;
+            addr = 0x10;
+            mask = CPSR_A | CPSR_I;
+            offset = 8;
+        }
+        break;
     case EXCP_SMC:
         new_mode = ARM_CPU_MODE_MON;
         addr = 0x08;
@@ -10063,6 +10095,12 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     case EXCP_VFIQ:
         addr += 0x100;
         break;
+    case EXCP_VSERR:
+        addr += 0x180;
+        /* Construct the SError syndrome from IDS and ISS fields. */
+        env->exception.syndrome = syn_serror(env->cp15.vsesr_el2 & 0x1ffffff);
+        env->cp15.esr_el[new_el] = env->exception.syndrome;
+        break;
     default:
         cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
     }
-- 
2.25.1


