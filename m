Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDB94CB066
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:58:45 +0100 (CET)
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPW3Y-0006Jv-RX
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:58:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxh-0005e3-B1
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:41 -0500
Received: from [2a00:1450:4864:20::434] (port=37881
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxf-000869-9c
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:40 -0500
Received: by mail-wr1-x434.google.com with SMTP id bk29so4689376wrb.4
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9/1gVGYDHfIM2iOzA0/RLao08BBx/4vLNzoqpMeDyBE=;
 b=K8otbdbvdz7/Na+jzlcM7OMpDJvFm5/dm7HAprhLtKwQWir/tWaesLq7wW8D+XJZ6N
 mKcqoTRl0TJEOIFa3f+3nKCjytbxUd0TnDGPloYscw0/StdI82mxM7UotEFGSyS8ikuk
 rl382AqbXlfD1HORILKfg5hJKwN3sJeGwI3Llo0IeVCLR892yX7cEL017VewCDQb8Qaq
 KSgc0EnEBtNYAlmVpvCV561ki+Gqnnuyd9/AZ+RtB9WHMSiFwfC+IsnUGf6OBxjpp0T2
 sajVVsS9vDpVV+XJDq+P3eI2R/yAFQlHdbpbTe8wVGRY2ZyPieJ5CTEf+F8YdpMXtN7L
 rfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9/1gVGYDHfIM2iOzA0/RLao08BBx/4vLNzoqpMeDyBE=;
 b=SmzMcw4JNGlr2V2zHrDVlLyVZPN3GnKmUK7WtFo0yOxWDoYsNKE/6mriENM4Im5jH7
 9klEytIVAt+/PdAkHM9jdpfVuFUrM5v3xXpFmyXC02HZxvxD/q5zDBXSVq7Jn9aD/i8D
 jqFNEvRAAPxOwhgQCWPZoKKV9wfPe6v6sc+QKyHeNulbrfkZq/KA7sNyDyN0MnSunT3z
 S4oAwU8abNvxFD1qv5mUGKNrfRUVxO40Q4/pOIq74RbAvedCQwb73lu8ro7iJ9R8umef
 /YTMjUIl76B5nT/GRwM9rHgglzzAhQ3jYYvmFn7XHIWizXPEEzavgthhFepralV7RVS4
 JjWA==
X-Gm-Message-State: AOAM530EV7H3mO3CgEcNTUStWWsq1Dy6Xvl44mTZDxbbgr5JQgr/tCRV
 ccT2X6F+Yya9zyJTYAnE8yB2f2vzEJGbqw==
X-Google-Smtp-Source: ABdhPJzNOqmldfvtmHZcHCej2jSArxeilf+wOp/yVrymwmf6d7AyHQZb+iwSxoBb2LDYm9dK9gpyZg==
X-Received: by 2002:a5d:4982:0:b0:1ef:5b5d:3164 with SMTP id
 r2-20020a5d4982000000b001ef5b5d3164mr21851991wrq.303.1646254357340; 
 Wed, 02 Mar 2022 12:52:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/26] target/arm: Support PSCI 1.1 and SMCCC 1.0
Date: Wed,  2 Mar 2022 20:52:09 +0000
Message-Id: <20220302205230.2122390-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Support the latest PSCI on TCG and HVF. A 64-bit function called from
AArch32 now returns NOT_SUPPORTED, which is necessary to adhere to SMC
Calling Convention 1.0. It is still not compliant with SMCCC 1.3 since
they do not implement mandatory functions.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-id: 20220213035753.34577-1-akihiko.odaki@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: update MISMATCH_CHECK checks on PSCI_VERSION macros to match]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm-consts.h | 13 +++++++++----
 hw/arm/boot.c           | 12 +++++++++---
 target/arm/cpu.c        |  5 +++--
 target/arm/hvf/hvf.c    | 27 ++++++++++++++++++++++++++-
 target/arm/kvm64.c      |  2 +-
 target/arm/psci.c       | 35 ++++++++++++++++++++++++++++++++---
 6 files changed, 80 insertions(+), 14 deletions(-)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index 580f1c1fee0..e770921ddc2 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -77,6 +77,8 @@ MISMATCH_CHECK(QEMU_PSCI_0_1_FN_MIGRATE, KVM_PSCI_FN_MIGRATE);
 #define QEMU_PSCI_0_2_FN64_AFFINITY_INFO QEMU_PSCI_0_2_FN64(4)
 #define QEMU_PSCI_0_2_FN64_MIGRATE QEMU_PSCI_0_2_FN64(5)
 
+#define QEMU_PSCI_1_0_FN_PSCI_FEATURES QEMU_PSCI_0_2_FN(10)
+
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN_CPU_SUSPEND, PSCI_0_2_FN_CPU_SUSPEND);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN_CPU_OFF, PSCI_0_2_FN_CPU_OFF);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN_CPU_ON, PSCI_0_2_FN_CPU_ON);
@@ -84,18 +86,21 @@ MISMATCH_CHECK(QEMU_PSCI_0_2_FN_MIGRATE, PSCI_0_2_FN_MIGRATE);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_CPU_SUSPEND, PSCI_0_2_FN64_CPU_SUSPEND);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_CPU_ON, PSCI_0_2_FN64_CPU_ON);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_MIGRATE, PSCI_0_2_FN64_MIGRATE);
+MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES, PSCI_1_0_FN_PSCI_FEATURES);
 
 /* PSCI v0.2 return values used by TCG emulation of PSCI */
 
 /* No Trusted OS migration to worry about when offlining CPUs */
 #define QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED        2
 
-/* We implement version 0.2 only */
-#define QEMU_PSCI_0_2_RET_VERSION_0_2                       2
+#define QEMU_PSCI_VERSION_0_1                     0x00001
+#define QEMU_PSCI_VERSION_0_2                     0x00002
+#define QEMU_PSCI_VERSION_1_1                     0x10001
 
 MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
-MISMATCH_CHECK(QEMU_PSCI_0_2_RET_VERSION_0_2,
-               (PSCI_VERSION_MAJOR(0) | PSCI_VERSION_MINOR(2)));
+/* We don't bother to check every possible version value */
+MISMATCH_CHECK(QEMU_PSCI_VERSION_0_2, PSCI_VERSION(0, 2));
+MISMATCH_CHECK(QEMU_PSCI_VERSION_1_1, PSCI_VERSION(1, 1));
 
 /* PSCI return values (inclusive of all PSCI versions) */
 #define QEMU_PSCI_RET_SUCCESS                     0
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b1e95978f26..0eeef94ceb5 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -488,9 +488,15 @@ static void fdt_add_psci_node(void *fdt)
     }
 
     qemu_fdt_add_subnode(fdt, "/psci");
-    if (armcpu->psci_version == 2) {
-        const char comp[] = "arm,psci-0.2\0arm,psci";
-        qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
+    if (armcpu->psci_version == QEMU_PSCI_VERSION_0_2 ||
+        armcpu->psci_version == QEMU_PSCI_VERSION_1_1) {
+        if (armcpu->psci_version == QEMU_PSCI_VERSION_0_2) {
+            const char comp[] = "arm,psci-0.2\0arm,psci";
+            qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
+        } else {
+            const char comp[] = "arm,psci-1.0\0arm,psci-0.2\0arm,psci";
+            qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
+        }
 
         cpu_off_fn = QEMU_PSCI_0_2_FN_CPU_OFF;
         if (arm_feature(&armcpu->env, ARM_FEATURE_AARCH64)) {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c085dc10ee7..dd64d178e2e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1110,11 +1110,12 @@ static void arm_cpu_initfn(Object *obj)
      * picky DTB consumer will also provide a helpful error message.
      */
     cpu->dtb_compatible = "qemu,unknown";
-    cpu->psci_version = 1; /* By default assume PSCI v0.1 */
+    cpu->psci_version = QEMU_PSCI_VERSION_0_1; /* By default assume PSCI v0.1 */
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
 
     if (tcg_enabled() || hvf_enabled()) {
-        cpu->psci_version = 2; /* TCG and HVF implement PSCI 0.2 */
+        /* TCG and HVF implement PSCI 1.1 */
+        cpu->psci_version = QEMU_PSCI_VERSION_1_1;
     }
 }
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 4d4ddab348a..8c34f86792e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -678,7 +678,7 @@ static bool hvf_handle_psci_call(CPUState *cpu)
 
     switch (param[0]) {
     case QEMU_PSCI_0_2_FN_PSCI_VERSION:
-        ret = QEMU_PSCI_0_2_RET_VERSION_0_2;
+        ret = QEMU_PSCI_VERSION_1_1;
         break;
     case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
         ret = QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED; /* No trusted OS */
@@ -746,6 +746,31 @@ static bool hvf_handle_psci_call(CPUState *cpu)
     case QEMU_PSCI_0_2_FN_MIGRATE:
         ret = QEMU_PSCI_RET_NOT_SUPPORTED;
         break;
+    case QEMU_PSCI_1_0_FN_PSCI_FEATURES:
+        switch (param[1]) {
+        case QEMU_PSCI_0_2_FN_PSCI_VERSION:
+        case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
+        case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
+        case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
+        case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
+        case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
+        case QEMU_PSCI_0_1_FN_CPU_ON:
+        case QEMU_PSCI_0_2_FN_CPU_ON:
+        case QEMU_PSCI_0_2_FN64_CPU_ON:
+        case QEMU_PSCI_0_1_FN_CPU_OFF:
+        case QEMU_PSCI_0_2_FN_CPU_OFF:
+        case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
+        case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
+        case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
+        case QEMU_PSCI_1_0_FN_PSCI_FEATURES:
+            ret = 0;
+            break;
+        case QEMU_PSCI_0_1_FN_MIGRATE:
+        case QEMU_PSCI_0_2_FN_MIGRATE:
+        default:
+            ret = QEMU_PSCI_RET_NOT_SUPPORTED;
+        }
+        break;
     default:
         return false;
     }
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 71c3ca69717..64d48bfb19d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -864,7 +864,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
     }
     if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
-        cpu->psci_version = 2;
+        cpu->psci_version = QEMU_PSCI_VERSION_0_2;
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
     }
     if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
diff --git a/target/arm/psci.c b/target/arm/psci.c
index b279c0b9a45..6c1239bb968 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -57,7 +57,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
 {
     /*
      * This function partially implements the logic for dispatching Power State
-     * Coordination Interface (PSCI) calls (as described in ARM DEN 0022B.b),
+     * Coordination Interface (PSCI) calls (as described in ARM DEN 0022D.b),
      * to the extent required for bringing up and taking down secondary cores,
      * and for handling reset and poweroff requests.
      * Additional information about the calling convention used is available in
@@ -80,7 +80,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
     }
 
     if ((param[0] & QEMU_PSCI_0_2_64BIT) && !is_a64(env)) {
-        ret = QEMU_PSCI_RET_INVALID_PARAMS;
+        ret = QEMU_PSCI_RET_NOT_SUPPORTED;
         goto err;
     }
 
@@ -89,7 +89,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
         ARMCPU *target_cpu;
 
     case QEMU_PSCI_0_2_FN_PSCI_VERSION:
-        ret = QEMU_PSCI_0_2_RET_VERSION_0_2;
+        ret = QEMU_PSCI_VERSION_1_1;
         break;
     case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
         ret = QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED; /* No trusted OS */
@@ -170,6 +170,35 @@ void arm_handle_psci_call(ARMCPU *cpu)
         }
         helper_wfi(env, 4);
         break;
+    case QEMU_PSCI_1_0_FN_PSCI_FEATURES:
+        switch (param[1]) {
+        case QEMU_PSCI_0_2_FN_PSCI_VERSION:
+        case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
+        case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
+        case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
+        case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
+        case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
+        case QEMU_PSCI_0_1_FN_CPU_ON:
+        case QEMU_PSCI_0_2_FN_CPU_ON:
+        case QEMU_PSCI_0_2_FN64_CPU_ON:
+        case QEMU_PSCI_0_1_FN_CPU_OFF:
+        case QEMU_PSCI_0_2_FN_CPU_OFF:
+        case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
+        case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
+        case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
+        case QEMU_PSCI_1_0_FN_PSCI_FEATURES:
+            if (!(param[1] & QEMU_PSCI_0_2_64BIT) || is_a64(env)) {
+                ret = 0;
+                break;
+            }
+            /* fallthrough */
+        case QEMU_PSCI_0_1_FN_MIGRATE:
+        case QEMU_PSCI_0_2_FN_MIGRATE:
+        default:
+            ret = QEMU_PSCI_RET_NOT_SUPPORTED;
+            break;
+        }
+        break;
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
     default:
-- 
2.25.1


