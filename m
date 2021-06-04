Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5073239BF88
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:25:06 +0200 (CEST)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEVF-0007FT-9N
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpETB-0001PH-FP
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpET6-0000Re-89
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id a20so10249620wrc.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DaG++NcIdtxVqAad7Vs0R6dhTvromA2j7N2Qe9wv/vA=;
 b=HXw8oYR/a2DyitOFpiiPG/gdcoWC/t+xIkIbZ0ylTzKPhPm9QmR0jg9EW8i2O5K2zW
 FkKd/MB32M5KfDvXfvxTw/qh/6WQ7BigWQPeNfMrIRO9d+Ib/duYUJsec85WQOag037Q
 Dip7TqOPFqGMGotLh/rLAeJjYS+VJphopkfzLkczHq+Tpoc7GgMXjfS9WEbvo48UJiiu
 Cpkp1hyKinOKJXKx8NR9ppaSMZCvV0lq992Fk9ycPAFB15fmTPx7IPIX48Mi1/kkTz6Z
 iOkb2BMpDAZcPNxUUm9ux4xijMRRzhD05chi74Ai8+HYZKBRmkE6jATcZYFvzlcPJfkZ
 hQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DaG++NcIdtxVqAad7Vs0R6dhTvromA2j7N2Qe9wv/vA=;
 b=DHNPQxXJ7FwLBF5OSH5EKJhNJEVArjEnpkz1/pAuKo7N0L0nPjEsrIZzMr5skRBMCc
 rn25eIu4ZLw7N9gT2ZjefUew9qQO3N7y6CuxTwfqopiQw3s0sEjVu8d2/HenIkMWWCVu
 ZPjA77VGXy16y6t6HAwv7tNNFpelHuK25NhgwXdsHadqHULoiHWVDfOI5ZJKjCZuzUDa
 nYGRhApJeegeTV0bNtNYLsGCOJ+GIGUY/7Wjld9EHKET+z3jVegQ6VUAC+WUymkdyuFz
 EyovUDGdsHdEY6BOBJAf7wlMO2HNCrvhVeHOZfS9tunBVeLhBgZ++N1SXwDACxML++Dq
 7DSg==
X-Gm-Message-State: AOAM5311GauEKTINeu2eaDu+S0xPimmsSlAXeN5/g4ykt9ETTyO1mLsD
 XbybbzoR/7tANppV4YOBexidWg==
X-Google-Smtp-Source: ABdhPJzWNXkSK9ujF8WZ/+fbVOnSXE2A2qoO2aDdWwLcBiSQr42XMTJCq7HceWNzMuk+fu5rF1gLNg==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr5290785wru.77.1622830970818;
 Fri, 04 Jun 2021 11:22:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f8sm6094773wmg.43.2021.06.04.11.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:22:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B1411FFC1;
 Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 42/99] target/arm: split 32bit and 64bit arm dump state
Date: Fri,  4 Jun 2021 16:52:15 +0100
Message-Id: <20210604155312.15902-43-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu32.h |   2 +-
 target/arm/cpu.c   | 225 ---------------------------------------------
 target/arm/cpu32.c |  85 ++++++++++++++++-
 target/arm/cpu64.c | 142 ++++++++++++++++++++++++++++
 4 files changed, 227 insertions(+), 227 deletions(-)

diff --git a/target/arm/cpu32.h b/target/arm/cpu32.h
index 211fad6f55..128d0c9247 100644
--- a/target/arm/cpu32.h
+++ b/target/arm/cpu32.h
@@ -21,7 +21,7 @@
 #ifndef ARM_CPU32_H
 #define ARM_CPU32_H
 
-void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags);
+void arm32_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 void arm32_cpu_class_init(ObjectClass *oc, void *data);
 void arm32_cpu_register(const ARMCPUInfo *info);
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b9b300944d..97d562bbd5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/qemu-print.h"
 #include "qemu-common.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
@@ -716,230 +715,6 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #endif
 }
 
-#ifdef TARGET_AARCH64
-
-static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    uint32_t psr = pstate_read(env);
-    int i;
-    int el = arm_current_el(env);
-    const char *ns_status;
-
-    qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
-    for (i = 0; i < 32; i++) {
-        if (i == 31) {
-            qemu_fprintf(f, " SP=%016" PRIx64 "\n", env->xregs[i]);
-        } else {
-            qemu_fprintf(f, "X%02d=%016" PRIx64 "%s", i, env->xregs[i],
-                         (i + 2) % 3 ? " " : "\n");
-        }
-    }
-
-    if (arm_feature(env, ARM_FEATURE_EL3) && el != 3) {
-        ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
-    } else {
-        ns_status = "";
-    }
-    qemu_fprintf(f, "PSTATE=%08x %c%c%c%c %sEL%d%c",
-                 psr,
-                 psr & PSTATE_N ? 'N' : '-',
-                 psr & PSTATE_Z ? 'Z' : '-',
-                 psr & PSTATE_C ? 'C' : '-',
-                 psr & PSTATE_V ? 'V' : '-',
-                 ns_status,
-                 el,
-                 psr & PSTATE_SP ? 'h' : 't');
-
-    if (cpu_isar_feature(aa64_bti, cpu)) {
-        qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
-    }
-    if (!(flags & CPU_DUMP_FPU)) {
-        qemu_fprintf(f, "\n");
-        return;
-    }
-    if (fp_exception_el(env, el) != 0) {
-        qemu_fprintf(f, "    FPU disabled\n");
-        return;
-    }
-    qemu_fprintf(f, "     FPCR=%08x FPSR=%08x\n",
-                 vfp_get_fpcr(env), vfp_get_fpsr(env));
-
-    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
-        int j, zcr_len = sve_zcr_len_for_el(env, el);
-
-        for (i = 0; i <= FFR_PRED_NUM; i++) {
-            bool eol;
-            if (i == FFR_PRED_NUM) {
-                qemu_fprintf(f, "FFR=");
-                /* It's last, so end the line.  */
-                eol = true;
-            } else {
-                qemu_fprintf(f, "P%02d=", i);
-                switch (zcr_len) {
-                case 0:
-                    eol = i % 8 == 7;
-                    break;
-                case 1:
-                    eol = i % 6 == 5;
-                    break;
-                case 2:
-                case 3:
-                    eol = i % 3 == 2;
-                    break;
-                default:
-                    /* More than one quadword per predicate.  */
-                    eol = true;
-                    break;
-                }
-            }
-            for (j = zcr_len / 4; j >= 0; j--) {
-                int digits;
-                if (j * 4 + 4 <= zcr_len + 1) {
-                    digits = 16;
-                } else {
-                    digits = (zcr_len % 4 + 1) * 4;
-                }
-                qemu_fprintf(f, "%0*" PRIx64 "%s", digits,
-                             env->vfp.pregs[i].p[j],
-                             j ? ":" : eol ? "\n" : " ");
-            }
-        }
-
-        for (i = 0; i < 32; i++) {
-            if (zcr_len == 0) {
-                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64 "%s",
-                             i, env->vfp.zregs[i].d[1],
-                             env->vfp.zregs[i].d[0], i & 1 ? "\n" : " ");
-            } else if (zcr_len == 1) {
-                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64
-                             ":%016" PRIx64 ":%016" PRIx64 "\n",
-                             i, env->vfp.zregs[i].d[3], env->vfp.zregs[i].d[2],
-                             env->vfp.zregs[i].d[1], env->vfp.zregs[i].d[0]);
-            } else {
-                for (j = zcr_len; j >= 0; j--) {
-                    bool odd = (zcr_len - j) % 2 != 0;
-                    if (j == zcr_len) {
-                        qemu_fprintf(f, "Z%02d[%x-%x]=", i, j, j - 1);
-                    } else if (!odd) {
-                        if (j > 0) {
-                            qemu_fprintf(f, "   [%x-%x]=", j, j - 1);
-                        } else {
-                            qemu_fprintf(f, "     [%x]=", j);
-                        }
-                    }
-                    qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%s",
-                                 env->vfp.zregs[i].d[j * 2 + 1],
-                                 env->vfp.zregs[i].d[j * 2],
-                                 odd || j == 0 ? "\n" : ":");
-                }
-            }
-        }
-    } else {
-        for (i = 0; i < 32; i++) {
-            uint64_t *q = aa64_vfp_qreg(env, i);
-            qemu_fprintf(f, "Q%02d=%016" PRIx64 ":%016" PRIx64 "%s",
-                         i, q[1], q[0], (i & 1 ? "\n" : " "));
-        }
-    }
-}
-
-#else
-
-static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    g_assert_not_reached();
-}
-
-#endif
-
-void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    int i;
-
-    if (is_a64(env)) {
-        aarch64_cpu_dump_state(cs, f, flags);
-        return;
-    }
-
-    for (i = 0; i < 16; i++) {
-        qemu_fprintf(f, "R%02d=%08x", i, env->regs[i]);
-        if ((i % 4) == 3) {
-            qemu_fprintf(f, "\n");
-        } else {
-            qemu_fprintf(f, " ");
-        }
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        uint32_t xpsr = xpsr_read(env);
-        const char *mode;
-        const char *ns_status = "";
-
-        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            ns_status = env->v7m.secure ? "S " : "NS ";
-        }
-
-        if (xpsr & XPSR_EXCP) {
-            mode = "handler";
-        } else {
-            if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_NPRIV_MASK) {
-                mode = "unpriv-thread";
-            } else {
-                mode = "priv-thread";
-            }
-        }
-
-        qemu_fprintf(f, "XPSR=%08x %c%c%c%c %c %s%s\n",
-                     xpsr,
-                     xpsr & XPSR_N ? 'N' : '-',
-                     xpsr & XPSR_Z ? 'Z' : '-',
-                     xpsr & XPSR_C ? 'C' : '-',
-                     xpsr & XPSR_V ? 'V' : '-',
-                     xpsr & XPSR_T ? 'T' : 'A',
-                     ns_status,
-                     mode);
-    } else {
-        uint32_t psr = cpsr_read(env);
-        const char *ns_status = "";
-
-        if (arm_feature(env, ARM_FEATURE_EL3) &&
-            (psr & CPSR_M) != ARM_CPU_MODE_MON) {
-            ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
-        }
-
-        qemu_fprintf(f, "PSR=%08x %c%c%c%c %c %s%s%d\n",
-                     psr,
-                     psr & CPSR_N ? 'N' : '-',
-                     psr & CPSR_Z ? 'Z' : '-',
-                     psr & CPSR_C ? 'C' : '-',
-                     psr & CPSR_V ? 'V' : '-',
-                     psr & CPSR_T ? 'T' : 'A',
-                     ns_status,
-                     aarch32_mode_name(psr), (psr & 0x10) ? 32 : 26);
-    }
-
-    if (flags & CPU_DUMP_FPU) {
-        int numvfpregs = 0;
-        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
-            numvfpregs = 32;
-        } else if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
-            numvfpregs = 16;
-        }
-        for (i = 0; i < numvfpregs; i++) {
-            uint64_t v = *aa32_vfp_dreg(env, i);
-            qemu_fprintf(f, "s%02d=%08x s%02d=%08x d%02d=%016" PRIx64 "\n",
-                         i * 2, (uint32_t)v,
-                         i * 2 + 1, (uint32_t)(v >> 32),
-                         i, v);
-        }
-        qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
-    }
-}
-
 uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
 {
     uint32_t Aff1 = idx / clustersz;
diff --git a/target/arm/cpu32.c b/target/arm/cpu32.c
index 39fb112a04..c03f420ba2 100644
--- a/target/arm/cpu32.c
+++ b/target/arm/cpu32.c
@@ -58,6 +58,89 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
     return g_strdup("arm");
 }
 
+void arm32_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    int i;
+
+    assert(!is_a64(env));
+
+    for (i = 0; i < 16; i++) {
+        qemu_fprintf(f, "R%02d=%08x", i, env->regs[i]);
+        if ((i % 4) == 3) {
+            qemu_fprintf(f, "\n");
+        } else {
+            qemu_fprintf(f, " ");
+        }
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        uint32_t xpsr = xpsr_read(env);
+        const char *mode;
+        const char *ns_status = "";
+
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            ns_status = env->v7m.secure ? "S " : "NS ";
+        }
+
+        if (xpsr & XPSR_EXCP) {
+            mode = "handler";
+        } else {
+            if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_NPRIV_MASK) {
+                mode = "unpriv-thread";
+            } else {
+                mode = "priv-thread";
+            }
+        }
+
+        qemu_fprintf(f, "XPSR=%08x %c%c%c%c %c %s%s\n",
+                     xpsr,
+                     xpsr & XPSR_N ? 'N' : '-',
+                     xpsr & XPSR_Z ? 'Z' : '-',
+                     xpsr & XPSR_C ? 'C' : '-',
+                     xpsr & XPSR_V ? 'V' : '-',
+                     xpsr & XPSR_T ? 'T' : 'A',
+                     ns_status,
+                     mode);
+    } else {
+        uint32_t psr = cpsr_read(env);
+        const char *ns_status = "";
+
+        if (arm_feature(env, ARM_FEATURE_EL3) &&
+            (psr & CPSR_M) != ARM_CPU_MODE_MON) {
+            ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
+        }
+
+        qemu_fprintf(f, "PSR=%08x %c%c%c%c %c %s%s%d\n",
+                     psr,
+                     psr & CPSR_N ? 'N' : '-',
+                     psr & CPSR_Z ? 'Z' : '-',
+                     psr & CPSR_C ? 'C' : '-',
+                     psr & CPSR_V ? 'V' : '-',
+                     psr & CPSR_T ? 'T' : 'A',
+                     ns_status,
+                     aarch32_mode_name(psr), (psr & 0x10) ? 32 : 26);
+    }
+
+    if (flags & CPU_DUMP_FPU) {
+        int numvfpregs = 0;
+        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
+            numvfpregs = 32;
+        } else if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
+            numvfpregs = 16;
+        }
+        for (i = 0; i < numvfpregs; i++) {
+            uint64_t v = *aa32_vfp_dreg(env, i);
+            qemu_fprintf(f, "s%02d=%08x s%02d=%08x d%02d=%016" PRIx64 "\n",
+                         i * 2, (uint32_t)v,
+                         i * 2 + 1, (uint32_t)(v >> 32),
+                         i, v);
+        }
+        qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
+    }
+}
+
 void arm32_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
@@ -67,7 +150,7 @@ void arm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
-    cc->dump_state = arm_cpu_dump_state;
+    cc->dump_state = arm32_cpu_dump_state;
 }
 
 static void arm32_cpu_instance_init(Object *obj)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4ff55fb0f0..7cd73ae0b6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -20,7 +20,9 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/qemu-print.h"
 #include "cpu.h"
+#include "cpu32.h"
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 #endif /* CONFIG_TCG */
@@ -828,6 +830,145 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
     return g_strdup("aarch64");
 }
 
+static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint32_t psr = pstate_read(env);
+    int i;
+    int el = arm_current_el(env);
+    const char *ns_status;
+
+    qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
+    for (i = 0; i < 32; i++) {
+        if (i == 31) {
+            qemu_fprintf(f, " SP=%016" PRIx64 "\n", env->xregs[i]);
+        } else {
+            qemu_fprintf(f, "X%02d=%016" PRIx64 "%s", i, env->xregs[i],
+                         (i + 2) % 3 ? " " : "\n");
+        }
+    }
+
+    if (arm_feature(env, ARM_FEATURE_EL3) && el != 3) {
+        ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
+    } else {
+        ns_status = "";
+    }
+    qemu_fprintf(f, "PSTATE=%08x %c%c%c%c %sEL%d%c",
+                 psr,
+                 psr & PSTATE_N ? 'N' : '-',
+                 psr & PSTATE_Z ? 'Z' : '-',
+                 psr & PSTATE_C ? 'C' : '-',
+                 psr & PSTATE_V ? 'V' : '-',
+                 ns_status,
+                 el,
+                 psr & PSTATE_SP ? 'h' : 't');
+
+    if (cpu_isar_feature(aa64_bti, cpu)) {
+        qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
+    }
+    if (!(flags & CPU_DUMP_FPU)) {
+        qemu_fprintf(f, "\n");
+        return;
+    }
+    if (fp_exception_el(env, el) != 0) {
+        qemu_fprintf(f, "    FPU disabled\n");
+        return;
+    }
+    qemu_fprintf(f, "     FPCR=%08x FPSR=%08x\n",
+                 vfp_get_fpcr(env), vfp_get_fpsr(env));
+
+    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
+        int j, zcr_len = sve_zcr_len_for_el(env, el);
+
+        for (i = 0; i <= FFR_PRED_NUM; i++) {
+            bool eol;
+            if (i == FFR_PRED_NUM) {
+                qemu_fprintf(f, "FFR=");
+                /* It's last, so end the line.  */
+                eol = true;
+            } else {
+                qemu_fprintf(f, "P%02d=", i);
+                switch (zcr_len) {
+                case 0:
+                    eol = i % 8 == 7;
+                    break;
+                case 1:
+                    eol = i % 6 == 5;
+                    break;
+                case 2:
+                case 3:
+                    eol = i % 3 == 2;
+                    break;
+                default:
+                    /* More than one quadword per predicate.  */
+                    eol = true;
+                    break;
+                }
+            }
+            for (j = zcr_len / 4; j >= 0; j--) {
+                int digits;
+                if (j * 4 + 4 <= zcr_len + 1) {
+                    digits = 16;
+                } else {
+                    digits = (zcr_len % 4 + 1) * 4;
+                }
+                qemu_fprintf(f, "%0*" PRIx64 "%s", digits,
+                             env->vfp.pregs[i].p[j],
+                             j ? ":" : eol ? "\n" : " ");
+            }
+        }
+
+        for (i = 0; i < 32; i++) {
+            if (zcr_len == 0) {
+                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64 "%s",
+                             i, env->vfp.zregs[i].d[1],
+                             env->vfp.zregs[i].d[0], i & 1 ? "\n" : " ");
+            } else if (zcr_len == 1) {
+                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64
+                             ":%016" PRIx64 ":%016" PRIx64 "\n",
+                             i, env->vfp.zregs[i].d[3], env->vfp.zregs[i].d[2],
+                             env->vfp.zregs[i].d[1], env->vfp.zregs[i].d[0]);
+            } else {
+                for (j = zcr_len; j >= 0; j--) {
+                    bool odd = (zcr_len - j) % 2 != 0;
+                    if (j == zcr_len) {
+                        qemu_fprintf(f, "Z%02d[%x-%x]=", i, j, j - 1);
+                    } else if (!odd) {
+                        if (j > 0) {
+                            qemu_fprintf(f, "   [%x-%x]=", j, j - 1);
+                        } else {
+                            qemu_fprintf(f, "     [%x]=", j);
+                        }
+                    }
+                    qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%s",
+                                 env->vfp.zregs[i].d[j * 2 + 1],
+                                 env->vfp.zregs[i].d[j * 2],
+                                 odd || j == 0 ? "\n" : ":");
+                }
+            }
+        }
+    } else {
+        for (i = 0; i < 32; i++) {
+            uint64_t *q = aa64_vfp_qreg(env, i);
+            qemu_fprintf(f, "Q%02d=%016" PRIx64 ":%016" PRIx64 "%s",
+                         i, q[1], q[0], (i & 1 ? "\n" : " "));
+        }
+    }
+}
+
+static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    if (is_a64(env)) {
+        aarch64_cpu_dump_state(cs, f, flags);
+    } else {
+        arm32_cpu_dump_state(cs, f, flags);
+    }
+}
+
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
@@ -837,6 +978,7 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 34;
     cc->gdb_core_xml_file = "aarch64-core.xml";
     cc->gdb_arch_name = aarch64_gdb_arch_name;
+    cc->dump_state = arm_cpu_dump_state;
 
     object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
                                    aarch64_cpu_set_aarch64);
-- 
2.20.1


