Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C444DDAA0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:36:00 +0100 (CET)
Received: from localhost ([::1]:50056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVClr-0001L4-4V
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:35:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZi-0006ho-O2
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:26 -0400
Received: from [2a00:1450:4864:20::332] (port=39574
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZh-0002Ci-22
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:26 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so4037667wmb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zbF++87+DFHxQnZv6iADOqjq+cHo8qKgkOCe675Yq1U=;
 b=n8goMrk5BryY8Q9sUvU6rxO2OYEmhAsMHpd/DnQRKqsW3tLpIc+O1fnBUg0eEB+KUS
 Yi7FYxchSKCJ+/SguHqU5pyjF/ccGOnUDRjee8a8ZF0ur/Oq9hFWWCM8Mde2BlQGDG/X
 LYpF8nCg6+3qFKz8YJ6l4EtsDVegCYvhmoHSy3qWG/WN83gRKrE1oBeBJdBxtAyDmmH5
 d6YYvTYmzB4cnfaDhknz8obZggYpBnEBQyP+ANZvxJqgvdU4vygEjnYSJU5mfNTKQ8ay
 bh9qSvfF+WjH5re7LJv5V6MZNahzPj+EjzeB3o1Po2x5jOmQy7Q+U4zAkETp/Adhftbv
 P5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zbF++87+DFHxQnZv6iADOqjq+cHo8qKgkOCe675Yq1U=;
 b=20NdXNvMXI9IzvjxvKqvdkAV+ANChxXoFAPXLwOvp8EUpHjUKtBNDhwp6ebz0nUhTD
 fZerbywVWJ8roMPuMvq8nU03lXRo+MyUSJVZETYpu9leWnUcKM2M7osXKYEyU/BQmvPS
 NcZrn57lfhR90wcrGtgciNOQ8RBZAWMsK22v3MDBo3oxWZ+2CFI1YjDMJ/q4wyQ4cQc6
 Wfn4geCDPO3Ke6z+SnUqXqCi5GcYQ+HetLMx3TTSNLCbqXItdhwDTZb8Z8Nh8Bh0eKt6
 kZdqlxCNocSD1WePnxGh1q0uzf9aZiXN3pJxktHfKW5B4oSvH4n56aXCKH5JqEIPFc0w
 A/kQ==
X-Gm-Message-State: AOAM530B+W/kVX8Nkk3mcnjxF/B9V3u7yFuQDQdSzYPmFgVHXfZGzYdt
 Znnz6jF+JcBWwqh4e2k6Y7MUnjDOYzQGJg==
X-Google-Smtp-Source: ABdhPJxNt669Tjr6bP7J0FuwqkmCVDGHJZ0/gjHVWDGn07eUbMmMzfLxVb+Jx0XLGj97708GOIwmSQ==
X-Received: by 2002:a05:600c:3584:b0:38a:258:1d6c with SMTP id
 p4-20020a05600c358400b0038a02581d6cmr16084019wmq.126.1647609803665; 
 Fri, 18 Mar 2022 06:23:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] target/arm: Make rvbar settable after realize
Date: Fri, 18 Mar 2022 13:22:59 +0000
Message-Id: <20220318132306.3254960-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Make the rvbar property settable after realize. This is done
in preparation to model the ZynqMP's runtime configurable rvbar.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20220316164645.2303510-3-edgar.iglesias@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  3 ++-
 target/arm/cpu.c    | 12 +++++++-----
 target/arm/helper.c | 10 +++++++---
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 157f214cce1..23879de5fa7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -447,6 +447,7 @@ typedef struct CPUArchState {
             uint64_t vbar_el[4];
         };
         uint32_t mvbar; /* (monitor) vector base address register */
+        uint64_t rvbar; /* rvbar sampled from rvbar property at reset */
         struct { /* FCSE PID. */
             uint32_t fcseidr_ns;
             uint32_t fcseidr_s;
@@ -985,7 +986,7 @@ struct ArchCPU {
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
-    uint64_t rvbar;
+    uint64_t rvbar_prop; /* Property/input signals.  */
 
     /* Configurable aspects of GIC cpu interface (which is part of the CPU) */
     int gic_num_lrs; /* number of list registers */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 498fb9f71b3..5d4ca7a2270 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -236,7 +236,10 @@ static void arm_cpu_reset(DeviceState *dev)
         } else {
             env->pstate = PSTATE_MODE_EL1h;
         }
-        env->pc = cpu->rvbar;
+
+        /* Sample rvbar at reset.  */
+        env->cp15.rvbar = cpu->rvbar_prop;
+        env->pc = env->cp15.rvbar;
 #endif
     } else {
 #if defined(CONFIG_USER_ONLY)
@@ -1135,9 +1138,6 @@ static Property arm_cpu_reset_cbar_property =
 static Property arm_cpu_reset_hivecs_property =
             DEFINE_PROP_BOOL("reset-hivecs", ARMCPU, reset_hivecs, false);
 
-static Property arm_cpu_rvbar_property =
-            DEFINE_PROP_UINT64("rvbar", ARMCPU, rvbar, 0);
-
 #ifndef CONFIG_USER_ONLY
 static Property arm_cpu_has_el2_property =
             DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
@@ -1240,7 +1240,9 @@ void arm_cpu_post_init(Object *obj)
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_rvbar_property);
+        object_property_add_uint64_ptr(obj, "rvbar",
+                                       &cpu->rvbar_prop,
+                                       OBJ_PROP_FLAG_READWRITE);
     }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b5c8caafe84..812ca591f4e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7967,7 +7967,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo rvbar = {
                 .name = "RVBAR_EL1", .state = ARM_CP_STATE_AA64,
                 .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
-                .type = ARM_CP_CONST, .access = PL1_R, .resetvalue = cpu->rvbar
+                .access = PL1_R,
+                .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
             };
             define_one_arm_cp_reg(cpu, &rvbar);
         }
@@ -8011,7 +8012,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo rvbar = {
                 .name = "RVBAR_EL2", .state = ARM_CP_STATE_AA64,
                 .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 1,
-                .type = ARM_CP_CONST, .access = PL2_R, .resetvalue = cpu->rvbar
+                .access = PL2_R,
+                .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
             };
             define_one_arm_cp_reg(cpu, &rvbar);
         }
@@ -8048,7 +8050,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo el3_regs[] = {
             { .name = "RVBAR_EL3", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 1,
-              .type = ARM_CP_CONST, .access = PL3_R, .resetvalue = cpu->rvbar },
+              .access = PL3_R,
+              .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+            },
             { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 0,
               .access = PL3_RW,
-- 
2.25.1


