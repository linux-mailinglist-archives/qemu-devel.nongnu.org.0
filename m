Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD19155B94D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:55:14 +0200 (CEST)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mOf-0004lT-Rt
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltN-0002Nj-6h
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:54 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltL-0004ub-3R
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:52 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 t17-20020a1c7711000000b003a0434b0af7so2785118wmi.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uCqueGyB/e9yJmQM42J3hsPjGiFeEwWKUsOZsn3m4SQ=;
 b=dD3yBiwxqvDpwI6Ez7l4RdiRp1MnZNYG81+/CIMKu+e2ud8LtjqjUafS+xv1dq13Q5
 6PVVS0a69orS7LJ3rQWsdspXbnYoD7+SoHlIm8GUdC1+r+3r5HghmLKB0LH8/Odgbdge
 bYgukFCysgV8xnT+EchKwiUsWjlkErGFa4wdXancw5uK3Hay6lLIBWVqlEoFiNKlH1eD
 1j8jlQV61HQL13GL5v5Wpb0kHDQGNUR023QFLdzQ6NCkYk1nB8jTeBdjM9LfGTIJiX5p
 hZMlQreOdj1PnRn0RXhcl/+N/9WgHWhvDOXDWAzIjrFVZngZ8u4ZtQ9PMyp1/QFRfMJS
 1RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCqueGyB/e9yJmQM42J3hsPjGiFeEwWKUsOZsn3m4SQ=;
 b=s7ZZa+8J8M5B6iOBV6MbX6bKRAEc9eJSN2gc/oVl5Z1Bruko2mY+pQ3KBBnJxBDRwF
 ppQwpJ99DqgtxN46gtHJo6zTR4ZgTXmfaV7p6f28QfOF1sntwwgqpMcAgNalZBrJvYc0
 EAfk6JiDVILaCxSQNSX4yKSzeaoulJqq1D8pWdDQRxjVg+L7JNuCXwkBPlWytgUnDzDI
 pedNKcxlKoNv0cu2EY8ZfUEPsXiI+bbR21csXRphIcPcBLY+FaOhAbOufNNhC7ZOJelV
 2tkl1Gk70IGsfiYmzHsnu2G+MguW07PK6H6vqYVl37lb/OPmUvdmxZrA2iITVr30d3+6
 xSAw==
X-Gm-Message-State: AJIora+H0R5dZExi9LZxwTQcsIS/Hn/F/P7hfKulEi+6dGwc/qdRepaj
 UbAM6WIgHN7CbR7uTpg6/RdwDFPYYbpoVg==
X-Google-Smtp-Source: AGRyM1tblTTSFT5vNSUzkZEjFF+qdPsFcQHL8jxfB96kBGGbiTJIVdtfsHsjqBJMF+tljm7qcDFzGA==
X-Received: by 2002:a05:600c:3592:b0:3a0:4c17:5ec1 with SMTP id
 p18-20020a05600c359200b003a04c175ec1mr3175875wmq.4.1656325369671; 
 Mon, 27 Jun 2022 03:22:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/25] target/arm: Create ARMVQMap
Date: Mon, 27 Jun 2022 11:22:26 +0100
Message-Id: <20220627102236.3097629-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Pull the three sve_vq_* values into a structure.
This will be reused for SME.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 29 ++++++++++++++---------------
 target/arm/cpu64.c  | 22 +++++++++++-----------
 target/arm/helper.c |  2 +-
 target/arm/kvm64.c  |  2 +-
 4 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5877d76c9f3..2ce47f8d29f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -807,6 +807,19 @@ typedef enum ARMPSCIState {
 
 typedef struct ARMISARegisters ARMISARegisters;
 
+/*
+ * In map, each set bit is a supported vector length of (bit-number + 1) * 16
+ * bytes, i.e. each bit number + 1 is the vector length in quadwords.
+ *
+ * While processing properties during initialization, corresponding init bits
+ * are set for bits in sve_vq_map that have been set by properties.
+ *
+ * Bits set in supported represent valid vector lengths for the CPU type.
+ */
+typedef struct {
+    uint32_t map, init, supported;
+} ARMVQMap;
+
 /**
  * ARMCPU:
  * @env: #CPUARMState
@@ -1055,21 +1068,7 @@ struct ArchCPU {
     uint32_t sve_default_vq;
 #endif
 
-    /*
-     * In sve_vq_map each set bit is a supported vector length of
-     * (bit-number + 1) * 16 bytes, i.e. each bit number + 1 is the vector
-     * length in quadwords.
-     *
-     * While processing properties during initialization, corresponding
-     * sve_vq_init bits are set for bits in sve_vq_map that have been
-     * set by properties.
-     *
-     * Bits set in sve_vq_supported represent valid vector lengths for
-     * the CPU type.
-     */
-    uint32_t sve_vq_map;
-    uint32_t sve_vq_init;
-    uint32_t sve_vq_supported;
+    ARMVQMap sve_vq;
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a46e40f4f2f..cadc401c7e0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -355,8 +355,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * any of the above.  Finally, if SVE is not disabled, then at least one
      * vector length must be enabled.
      */
-    uint32_t vq_map = cpu->sve_vq_map;
-    uint32_t vq_init = cpu->sve_vq_init;
+    uint32_t vq_map = cpu->sve_vq.map;
+    uint32_t vq_init = cpu->sve_vq.init;
     uint32_t vq_supported;
     uint32_t vq_mask = 0;
     uint32_t tmp, vq, max_vq = 0;
@@ -369,14 +369,14 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      */
     if (kvm_enabled()) {
         if (kvm_arm_sve_supported()) {
-            cpu->sve_vq_supported = kvm_arm_sve_get_vls(CPU(cpu));
-            vq_supported = cpu->sve_vq_supported;
+            cpu->sve_vq.supported = kvm_arm_sve_get_vls(CPU(cpu));
+            vq_supported = cpu->sve_vq.supported;
         } else {
             assert(!cpu_isar_feature(aa64_sve, cpu));
             vq_supported = 0;
         }
     } else {
-        vq_supported = cpu->sve_vq_supported;
+        vq_supported = cpu->sve_vq.supported;
     }
 
     /*
@@ -534,7 +534,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 
     /* From now on sve_max_vq is the actual maximum supported length. */
     cpu->sve_max_vq = max_vq;
-    cpu->sve_vq_map = vq_map;
+    cpu->sve_vq.map = vq_map;
 }
 
 static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
@@ -595,7 +595,7 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
     if (!cpu_isar_feature(aa64_sve, cpu)) {
         value = false;
     } else {
-        value = extract32(cpu->sve_vq_map, vq - 1, 1);
+        value = extract32(cpu->sve_vq.map, vq - 1, 1);
     }
     visit_type_bool(v, name, &value, errp);
 }
@@ -611,8 +611,8 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    cpu->sve_vq_map = deposit32(cpu->sve_vq_map, vq - 1, 1, value);
-    cpu->sve_vq_init |= 1 << (vq - 1);
+    cpu->sve_vq.map = deposit32(cpu->sve_vq.map, vq - 1, 1, value);
+    cpu->sve_vq.init |= 1 << (vq - 1);
 }
 
 static bool cpu_arm_get_sve(Object *obj, Error **errp)
@@ -974,7 +974,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-    cpu->sve_vq_supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
+    cpu->sve_vq.supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
 
     aarch64_add_pauth_properties(obj);
     aarch64_add_sve_properties(obj);
@@ -1023,7 +1023,7 @@ static void aarch64_a64fx_initfn(Object *obj)
 
     /* The A64FX supports only 128, 256 and 512 bit vector lengths */
     aarch64_add_sve_properties(obj);
-    cpu->sve_vq_supported = (1 << 0)  /* 128bit */
+    cpu->sve_vq.supported = (1 << 0)  /* 128bit */
                           | (1 << 1)  /* 256bit */
                           | (1 << 3); /* 512bit */
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 88d96f7991f..a80ca461e53 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6287,7 +6287,7 @@ uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
         len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    len = 31 - clz32(cpu->sve_vq_map & MAKE_64BIT_MASK(0, len + 1));
+    len = 31 - clz32(cpu->sve_vq.map & MAKE_64BIT_MASK(0, len + 1));
     return len;
 }
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index ff8f65da22f..d16d4ea2500 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -820,7 +820,7 @@ uint32_t kvm_arm_sve_get_vls(CPUState *cs)
 static int kvm_arm_sve_set_vls(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = { cpu->sve_vq_map };
+    uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = { cpu->sve_vq.map };
     struct kvm_one_reg reg = {
         .id = KVM_REG_ARM64_SVE_VLS,
         .addr = (uint64_t)&vls[0],
-- 
2.25.1


