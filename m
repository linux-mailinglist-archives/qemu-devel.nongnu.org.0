Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93C439BD89
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:46:00 +0200 (CEST)
Received: from localhost ([::1]:38504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCxL-0007jQ-So
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRE-0002nr-D0
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCR9-0003nT-0j
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y7so5219503wrh.7
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+lRMEJ0Jroff3JWceP6oHhM/6tfNcxStzXU3u63x4aE=;
 b=Td5J72B76ZjB+Lvyb7YR0FE1MZCPDFVFdgMk9GQ6KdVCVasLJvy5GZDakMqID195rY
 pvjEOq8R+Y93fjTr38eUcUjnatgjuVZElFacOG844hadG+bPX9QKMmXeIHTziTq6OhQo
 UAr9U2XSuBlAAQ1KE5tOhIw+btsOK0tOZ30CpbosPqJuuap8UK4i6KCBVr3XLxOFHYkL
 a6mRDBg8Dysq4PD5VRudzoQoyP8d6/JkYj6pEalfdEQt02q7opnxgqinTr2jkKx9bagh
 tjdvPeu9cKRAV73w4zUKaYE0eQVBMdRoJuw6EIwpDXc7PdBMNaFsYf9Kob843T+mRU10
 ktuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+lRMEJ0Jroff3JWceP6oHhM/6tfNcxStzXU3u63x4aE=;
 b=DUiSGbuuB34akZjsja8zPBdhK27G8lapMi6BmC2IIxaCO/dkocnyef03E+nCn9Y2MV
 wSzKBxbRN0Kzx1LTKgRKXGyqFRaRpo4FJTLES31SdCNFDpAi9ggUeCVeVPUCG8L6gWjx
 E5ZoooBHfMVyGHXd0eoRIWUU//68Ju5wkjrz7P2teFE8Onok4DXbOYv0EvFeRSt7FYt2
 og2aj0xJKmEDGyf48GcZ17GMAK68cLRblunV4GCoHdgqWvzhm10in2dSYzwcOoy0DNst
 bIPB9R7GstL501Z34+yaZ+0LitN6ngY8zzOCzfRH8XVbS4+/ynLfYF52k4FvqOjr47Z4
 CkhA==
X-Gm-Message-State: AOAM531oGsdOp7J1VBqxHiioeCKXbVVowCw6hFin+6tdVeOoubh/D3Ze
 w/W3vFRiR66bx1csBxHhbXPZwg==
X-Google-Smtp-Source: ABdhPJx/U5roY0oaCGusPRGp7nMGXEUcG1DNyO2kX+xu55oCAG1dXs+8mPL2SaqtHGybwVcvlxqH+w==
X-Received: by 2002:adf:a401:: with SMTP id d1mr4646896wra.55.1622823161296;
 Fri, 04 Jun 2021 09:12:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a1sm8019703wrg.92.2021.06.04.09.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61CD91FFDF;
 Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 71/99] target/arm: cpu-sve: new module
Date: Fri,  4 Jun 2021 16:52:44 +0100
Message-Id: <20210604155312.15902-72-alex.bennee@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

extract the SVE-related cpu object properties and functions,
and move them to a separate module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sve.h     |  37 ++++
 target/arm/cpu.h         |  14 +-
 target/arm/cpu-sve.c     | 358 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.c         |   3 +
 target/arm/cpu64.c       | 329 +----------------------------------
 target/arm/kvm/kvm-cpu.c |   1 +
 target/arm/meson.build   |   1 +
 7 files changed, 408 insertions(+), 335 deletions(-)
 create mode 100644 target/arm/cpu-sve.h
 create mode 100644 target/arm/cpu-sve.c

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
new file mode 100644
index 0000000000..692509d419
--- /dev/null
+++ b/target/arm/cpu-sve.h
@@ -0,0 +1,37 @@
+/*
+ * QEMU AArch64 CPU SVE Extensions for TARGET_AARCH64
+ *
+ * Copyright (c) 2013 Linaro Ltd
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
+#ifndef CPU_SVE_H
+#define CPU_SVE_H
+
+/* note: SVE is an AARCH64-only option, only include this for TARGET_AARCH64 */
+
+#include "cpu.h"
+
+/* called by arm_cpu_finalize_features in realizefn */
+void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+
+/* add the CPU SVE properties */
+void aarch64_add_sve_properties(Object *obj);
+
+/* add the CPU SVE properties specific to the "MAX" CPU */
+void aarch64_add_sve_properties_max(Object *obj);
+
+#endif /* CPU_SVE_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f57fa9b9f5..b9b9bd8b01 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -173,7 +173,8 @@ typedef struct {
 #define VSTCR_SW VTCR_NSW
 #define VSTCR_SA VTCR_NSA
 
-/* Define a maximum sized vector register.
+/*
+ * Define a maximum sized vector register.
  * For 32-bit, this is a 128-bit NEON/AdvSIMD register.
  * For 64-bit, this is a 2048-bit SVE register.
  *
@@ -201,13 +202,9 @@ typedef struct {
 
 #ifdef TARGET_AARCH64
 # define ARM_MAX_VQ    16
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
-static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
-static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
-#endif
+#endif /* TARGET_AARCH64 */
 
 typedef struct ARMVectorReg {
     uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
@@ -219,10 +216,13 @@ typedef struct ARMPredicateReg {
     uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
 } ARMPredicateReg;
 
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 /* In AArch32 mode, PAC keys do not exist at all.  */
 typedef struct ARMPACKey {
     uint64_t lo, hi;
 } ARMPACKey;
+#else
+static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 /* See the commentary above the TBFLAG field definitions.  */
@@ -1059,7 +1059,6 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
-void aarch64_add_sve_properties(Object *obj);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
@@ -1090,7 +1089,6 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
-static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
 
 void aarch64_sync_32_to_64(CPUARMState *env);
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
new file mode 100644
index 0000000000..129fb9586e
--- /dev/null
+++ b/target/arm/cpu-sve.c
@@ -0,0 +1,358 @@
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
+#include "qapi/error.h"
+#include "cpu.h"
+#include "sysemu/tcg.h"
+#include "sysemu/kvm.h"
+#include "kvm/kvm_arm.h"
+#include "qapi/visitor.h"
+#include "cpu-sve.h"
+
+void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
+{
+    /*
+     * If any vector lengths are explicitly enabled with sve<N> properties,
+     * then all other lengths are implicitly disabled.  If sve-max-vq is
+     * specified then it is the same as explicitly enabling all lengths
+     * up to and including the specified maximum, which means all larger
+     * lengths will be implicitly disabled.  If no sve<N> properties
+     * are enabled and sve-max-vq is not specified, then all lengths not
+     * explicitly disabled will be enabled.  Additionally, all power-of-two
+     * vector lengths less than the maximum enabled length will be
+     * automatically enabled and all vector lengths larger than the largest
+     * disabled power-of-two vector length will be automatically disabled.
+     * Errors are generated if the user provided input that interferes with
+     * any of the above.  Finally, if SVE is not disabled, then at least one
+     * vector length must be enabled.
+     */
+    DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
+    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
+    uint32_t vq, max_vq = 0;
+
+    /* Collect the set of vector lengths supported by KVM. */
+    bitmap_zero(kvm_supported, ARM_MAX_VQ);
+    if (kvm_enabled() && kvm_arm_sve_supported()) {
+        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
+    } else if (kvm_enabled()) {
+        assert(!cpu_isar_feature(aa64_sve, cpu));
+    }
+
+    /*
+     * Process explicit sve<N> properties.
+     * From the properties, sve_vq_map<N> implies sve_vq_init<N>.
+     * Check first for any sve<N> enabled.
+     */
+    if (!bitmap_empty(cpu->sve_vq_map, ARM_MAX_VQ)) {
+        max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
+
+        if (cpu->sve_max_vq && max_vq > cpu->sve_max_vq) {
+            error_setg(errp, "cannot enable sve%d", max_vq * 128);
+            error_append_hint(errp, "sve%d is larger than the maximum vector "
+                              "length, sve-max-vq=%d (%d bits)\n",
+                              max_vq * 128, cpu->sve_max_vq,
+                              cpu->sve_max_vq * 128);
+            return;
+        }
+
+        if (kvm_enabled()) {
+            /*
+             * For KVM we have to automatically enable all supported unitialized
+             * lengths, even when the smaller lengths are not all powers-of-two.
+             */
+            bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
+            bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
+        } else if (tcg_enabled()) {
+            /* Propagate enabled bits down through required powers-of-two. */
+            for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
+                if (!test_bit(vq - 1, cpu->sve_vq_init)) {
+                    set_bit(vq - 1, cpu->sve_vq_map);
+                }
+            }
+        }
+    } else if (cpu->sve_max_vq == 0) {
+        /*
+         * No explicit bits enabled, and no implicit bits from sve-max-vq.
+         */
+        if (!cpu_isar_feature(aa64_sve, cpu)) {
+            /* SVE is disabled and so are all vector lengths.  Good. */
+            return;
+        }
+
+        if (kvm_enabled()) {
+            /* Disabling a supported length disables all larger lengths. */
+            for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+                if (test_bit(vq - 1, cpu->sve_vq_init) &&
+                    test_bit(vq - 1, kvm_supported)) {
+                    break;
+                }
+            }
+            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
+            bitmap_andnot(cpu->sve_vq_map, kvm_supported,
+                          cpu->sve_vq_init, max_vq);
+            if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
+                error_setg(errp, "cannot disable sve%d", vq * 128);
+                error_append_hint(errp, "Disabling sve%d results in all "
+                                  "vector lengths being disabled.\n",
+                                  vq * 128);
+                error_append_hint(errp, "With SVE enabled, at least one "
+                                  "vector length must be enabled.\n");
+                return;
+            }
+        } else if (tcg_enabled()) {
+            /* Disabling a power-of-two disables all larger lengths. */
+            if (test_bit(0, cpu->sve_vq_init)) {
+                error_setg(errp, "cannot disable sve128");
+                error_append_hint(errp, "Disabling sve128 results in all "
+                                  "vector lengths being disabled.\n");
+                error_append_hint(errp, "With SVE enabled, at least one "
+                                  "vector length must be enabled.\n");
+                return;
+            }
+            for (vq = 2; vq <= ARM_MAX_VQ; vq <<= 1) {
+                if (test_bit(vq - 1, cpu->sve_vq_init)) {
+                    break;
+                }
+            }
+            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
+            bitmap_complement(cpu->sve_vq_map, cpu->sve_vq_init, max_vq);
+        }
+
+        max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
+    }
+
+    /*
+     * Process the sve-max-vq property.
+     * Note that we know from the above that no bit above
+     * sve-max-vq is currently set.
+     */
+    if (cpu->sve_max_vq != 0) {
+        max_vq = cpu->sve_max_vq;
+
+        if (!test_bit(max_vq - 1, cpu->sve_vq_map) &&
+            test_bit(max_vq - 1, cpu->sve_vq_init)) {
+            error_setg(errp, "cannot disable sve%d", max_vq * 128);
+            error_append_hint(errp, "The maximum vector length must be "
+                              "enabled, sve-max-vq=%d (%d bits)\n",
+                              max_vq, max_vq * 128);
+            return;
+        }
+
+        /* Set all bits not explicitly set within sve-max-vq. */
+        bitmap_complement(tmp, cpu->sve_vq_init, max_vq);
+        bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
+    }
+
+    /*
+     * We should know what max-vq is now.  Also, as we're done
+     * manipulating sve-vq-map, we ensure any bits above max-vq
+     * are clear, just in case anybody looks.
+     */
+    assert(max_vq != 0);
+    bitmap_clear(cpu->sve_vq_map, max_vq, ARM_MAX_VQ - max_vq);
+
+    if (kvm_enabled()) {
+        /* Ensure the set of lengths matches what KVM supports. */
+        bitmap_xor(tmp, cpu->sve_vq_map, kvm_supported, max_vq);
+        if (!bitmap_empty(tmp, max_vq)) {
+            vq = find_last_bit(tmp, max_vq) + 1;
+            if (test_bit(vq - 1, cpu->sve_vq_map)) {
+                if (cpu->sve_max_vq) {
+                    error_setg(errp, "cannot set sve-max-vq=%d",
+                               cpu->sve_max_vq);
+                    error_append_hint(errp, "This KVM host does not support "
+                                      "the vector length %d-bits.\n",
+                                      vq * 128);
+                    error_append_hint(errp, "It may not be possible to use "
+                                      "sve-max-vq with this KVM host. Try "
+                                      "using only sve<N> properties.\n");
+                } else {
+                    error_setg(errp, "cannot enable sve%d", vq * 128);
+                    error_append_hint(errp, "This KVM host does not support "
+                                      "the vector length %d-bits.\n",
+                                      vq * 128);
+                }
+            } else {
+                error_setg(errp, "cannot disable sve%d", vq * 128);
+                error_append_hint(errp, "The KVM host requires all "
+                                  "supported vector lengths smaller "
+                                  "than %d bits to also be enabled.\n",
+                                  max_vq * 128);
+            }
+            return;
+        }
+    } else if (tcg_enabled()) {
+        /* Ensure all required powers-of-two are enabled. */
+        for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
+            if (!test_bit(vq - 1, cpu->sve_vq_map)) {
+                error_setg(errp, "cannot disable sve%d", vq * 128);
+                error_append_hint(errp, "sve%d is required as it "
+                                  "is a power-of-two length smaller than "
+                                  "the maximum, sve%d\n",
+                                  vq * 128, max_vq * 128);
+                return;
+            }
+        }
+    }
+
+    /*
+     * Now that we validated all our vector lengths, the only question
+     * left to answer is if we even want SVE at all.
+     */
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        error_setg(errp, "cannot enable sve%d", max_vq * 128);
+        error_append_hint(errp, "SVE must be enabled to enable vector "
+                          "lengths.\n");
+        error_append_hint(errp, "Add sve=on to the CPU property list.\n");
+        return;
+    }
+
+    /* From now on sve_max_vq is the actual maximum supported length. */
+    cpu->sve_max_vq = max_vq;
+}
+
+static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t value;
+
+    /* All vector lengths are disabled when SVE is off. */
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        value = 0;
+    } else {
+        value = cpu->sve_max_vq;
+    }
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t max_vq;
+
+    if (!visit_type_uint32(v, name, &max_vq, errp)) {
+        return;
+    }
+
+    if (kvm_enabled() && !kvm_arm_sve_supported()) {
+        error_setg(errp, "cannot set sve-max-vq");
+        error_append_hint(errp, "SVE not supported by KVM on this host\n");
+        return;
+    }
+
+    if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
+        error_setg(errp, "unsupported SVE vector length");
+        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
+                          ARM_MAX_VQ);
+        return;
+    }
+
+    cpu->sve_max_vq = max_vq;
+}
+
+/*
+ * Note that cpu_arm_get/set_sve_vq cannot use the simpler
+ * object_property_add_bool interface because they make use
+ * of the contents of "name" to determine which bit on which
+ * to operate.
+ */
+static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t vq = atoi(&name[3]) / 128;
+    bool value;
+
+    /* All vector lengths are disabled when SVE is off. */
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        value = false;
+    } else {
+        value = test_bit(vq - 1, cpu->sve_vq_map);
+    }
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t vq = atoi(&name[3]) / 128;
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
+        error_setg(errp, "cannot enable %s", name);
+        error_append_hint(errp, "SVE not supported by KVM on this host\n");
+        return;
+    }
+
+    if (value) {
+        set_bit(vq - 1, cpu->sve_vq_map);
+    } else {
+        clear_bit(vq - 1, cpu->sve_vq_map);
+    }
+    set_bit(vq - 1, cpu->sve_vq_init);
+}
+
+static bool cpu_arm_get_sve(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    return cpu_isar_feature(aa64_sve, cpu);
+}
+
+static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+
+    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
+        error_setg(errp, "'sve' feature not supported by KVM on this host");
+        return;
+    }
+
+    t = cpu->isar.id_aa64pfr0;
+    t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
+    cpu->isar.id_aa64pfr0 = t;
+}
+
+void aarch64_add_sve_properties(Object *obj)
+{
+    uint32_t vq;
+
+    object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
+
+    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+        char name[8];
+        sprintf(name, "sve%d", vq * 128);
+        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq, cpu_arm_set_sve_vq, NULL, NULL);
+    }
+}
+
+/* properties added for MAX CPU */
+void aarch64_add_sve_properties_max(Object *obj)
+{
+    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq, cpu_max_set_sve_max_vq, NULL, NULL);
+}
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2fef8ca471..6db37b42d1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,6 +23,7 @@
 #include "target/arm/idau.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "cpu-sve.h"
 #include "cpregs.h"
 
 #ifdef CONFIG_TCG
@@ -818,6 +819,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
+#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         arm_cpu_sve_finalize(cpu, &local_err);
         if (local_err != NULL) {
@@ -838,6 +840,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             }
         }
     }
+#endif /* TARGET_AARCH64 */
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e3d818275c..3a6b7cf5d1 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -23,6 +23,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "cpu32.h"
+#include "cpu-sve.h"
 #include "qemu/module.h"
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
@@ -245,331 +246,6 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
-{
-    /*
-     * If any vector lengths are explicitly enabled with sve<N> properties,
-     * then all other lengths are implicitly disabled.  If sve-max-vq is
-     * specified then it is the same as explicitly enabling all lengths
-     * up to and including the specified maximum, which means all larger
-     * lengths will be implicitly disabled.  If no sve<N> properties
-     * are enabled and sve-max-vq is not specified, then all lengths not
-     * explicitly disabled will be enabled.  Additionally, all power-of-two
-     * vector lengths less than the maximum enabled length will be
-     * automatically enabled and all vector lengths larger than the largest
-     * disabled power-of-two vector length will be automatically disabled.
-     * Errors are generated if the user provided input that interferes with
-     * any of the above.  Finally, if SVE is not disabled, then at least one
-     * vector length must be enabled.
-     */
-    DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
-    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
-    uint32_t vq, max_vq = 0;
-
-    /* Collect the set of vector lengths supported by KVM. */
-    bitmap_zero(kvm_supported, ARM_MAX_VQ);
-    if (kvm_enabled() && kvm_arm_sve_supported()) {
-        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
-    } else if (kvm_enabled()) {
-        assert(!cpu_isar_feature(aa64_sve, cpu));
-    }
-
-    /*
-     * Process explicit sve<N> properties.
-     * From the properties, sve_vq_map<N> implies sve_vq_init<N>.
-     * Check first for any sve<N> enabled.
-     */
-    if (!bitmap_empty(cpu->sve_vq_map, ARM_MAX_VQ)) {
-        max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
-
-        if (cpu->sve_max_vq && max_vq > cpu->sve_max_vq) {
-            error_setg(errp, "cannot enable sve%d", max_vq * 128);
-            error_append_hint(errp, "sve%d is larger than the maximum vector "
-                              "length, sve-max-vq=%d (%d bits)\n",
-                              max_vq * 128, cpu->sve_max_vq,
-                              cpu->sve_max_vq * 128);
-            return;
-        }
-
-        if (kvm_enabled()) {
-            /*
-             * For KVM we have to automatically enable all supported unitialized
-             * lengths, even when the smaller lengths are not all powers-of-two.
-             */
-            bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
-            bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
-        } else if (tcg_enabled()) {
-            /* Propagate enabled bits down through required powers-of-two. */
-            for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
-                if (!test_bit(vq - 1, cpu->sve_vq_init)) {
-                    set_bit(vq - 1, cpu->sve_vq_map);
-                }
-            }
-        }
-    } else if (cpu->sve_max_vq == 0) {
-        /*
-         * No explicit bits enabled, and no implicit bits from sve-max-vq.
-         */
-        if (!cpu_isar_feature(aa64_sve, cpu)) {
-            /* SVE is disabled and so are all vector lengths.  Good. */
-            return;
-        }
-
-        if (kvm_enabled()) {
-            /* Disabling a supported length disables all larger lengths. */
-            for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-                if (test_bit(vq - 1, cpu->sve_vq_init) &&
-                    test_bit(vq - 1, kvm_supported)) {
-                    break;
-                }
-            }
-            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-            bitmap_andnot(cpu->sve_vq_map, kvm_supported,
-                          cpu->sve_vq_init, max_vq);
-            if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
-                error_setg(errp, "cannot disable sve%d", vq * 128);
-                error_append_hint(errp, "Disabling sve%d results in all "
-                                  "vector lengths being disabled.\n",
-                                  vq * 128);
-                error_append_hint(errp, "With SVE enabled, at least one "
-                                  "vector length must be enabled.\n");
-                return;
-            }
-        } else if (tcg_enabled()) {
-            /* Disabling a power-of-two disables all larger lengths. */
-            if (test_bit(0, cpu->sve_vq_init)) {
-                error_setg(errp, "cannot disable sve128");
-                error_append_hint(errp, "Disabling sve128 results in all "
-                                  "vector lengths being disabled.\n");
-                error_append_hint(errp, "With SVE enabled, at least one "
-                                  "vector length must be enabled.\n");
-                return;
-            }
-            for (vq = 2; vq <= ARM_MAX_VQ; vq <<= 1) {
-                if (test_bit(vq - 1, cpu->sve_vq_init)) {
-                    break;
-                }
-            }
-            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-            bitmap_complement(cpu->sve_vq_map, cpu->sve_vq_init, max_vq);
-        }
-
-        max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
-    }
-
-    /*
-     * Process the sve-max-vq property.
-     * Note that we know from the above that no bit above
-     * sve-max-vq is currently set.
-     */
-    if (cpu->sve_max_vq != 0) {
-        max_vq = cpu->sve_max_vq;
-
-        if (!test_bit(max_vq - 1, cpu->sve_vq_map) &&
-            test_bit(max_vq - 1, cpu->sve_vq_init)) {
-            error_setg(errp, "cannot disable sve%d", max_vq * 128);
-            error_append_hint(errp, "The maximum vector length must be "
-                              "enabled, sve-max-vq=%d (%d bits)\n",
-                              max_vq, max_vq * 128);
-            return;
-        }
-
-        /* Set all bits not explicitly set within sve-max-vq. */
-        bitmap_complement(tmp, cpu->sve_vq_init, max_vq);
-        bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
-    }
-
-    /*
-     * We should know what max-vq is now.  Also, as we're done
-     * manipulating sve-vq-map, we ensure any bits above max-vq
-     * are clear, just in case anybody looks.
-     */
-    assert(max_vq != 0);
-    bitmap_clear(cpu->sve_vq_map, max_vq, ARM_MAX_VQ - max_vq);
-
-    if (kvm_enabled()) {
-        /* Ensure the set of lengths matches what KVM supports. */
-        bitmap_xor(tmp, cpu->sve_vq_map, kvm_supported, max_vq);
-        if (!bitmap_empty(tmp, max_vq)) {
-            vq = find_last_bit(tmp, max_vq) + 1;
-            if (test_bit(vq - 1, cpu->sve_vq_map)) {
-                if (cpu->sve_max_vq) {
-                    error_setg(errp, "cannot set sve-max-vq=%d",
-                               cpu->sve_max_vq);
-                    error_append_hint(errp, "This KVM host does not support "
-                                      "the vector length %d-bits.\n",
-                                      vq * 128);
-                    error_append_hint(errp, "It may not be possible to use "
-                                      "sve-max-vq with this KVM host. Try "
-                                      "using only sve<N> properties.\n");
-                } else {
-                    error_setg(errp, "cannot enable sve%d", vq * 128);
-                    error_append_hint(errp, "This KVM host does not support "
-                                      "the vector length %d-bits.\n",
-                                      vq * 128);
-                }
-            } else {
-                error_setg(errp, "cannot disable sve%d", vq * 128);
-                error_append_hint(errp, "The KVM host requires all "
-                                  "supported vector lengths smaller "
-                                  "than %d bits to also be enabled.\n",
-                                  max_vq * 128);
-            }
-            return;
-        }
-    } else if (tcg_enabled()) {
-        /* Ensure all required powers-of-two are enabled. */
-        for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
-            if (!test_bit(vq - 1, cpu->sve_vq_map)) {
-                error_setg(errp, "cannot disable sve%d", vq * 128);
-                error_append_hint(errp, "sve%d is required as it "
-                                  "is a power-of-two length smaller than "
-                                  "the maximum, sve%d\n",
-                                  vq * 128, max_vq * 128);
-                return;
-            }
-        }
-    }
-
-    /*
-     * Now that we validated all our vector lengths, the only question
-     * left to answer is if we even want SVE at all.
-     */
-    if (!cpu_isar_feature(aa64_sve, cpu)) {
-        error_setg(errp, "cannot enable sve%d", max_vq * 128);
-        error_append_hint(errp, "SVE must be enabled to enable vector "
-                          "lengths.\n");
-        error_append_hint(errp, "Add sve=on to the CPU property list.\n");
-        return;
-    }
-
-    /* From now on sve_max_vq is the actual maximum supported length. */
-    cpu->sve_max_vq = max_vq;
-}
-
-static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t value;
-
-    /* All vector lengths are disabled when SVE is off. */
-    if (!cpu_isar_feature(aa64_sve, cpu)) {
-        value = 0;
-    } else {
-        value = cpu->sve_max_vq;
-    }
-    visit_type_uint32(v, name, &value, errp);
-}
-
-static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t max_vq;
-
-    if (!visit_type_uint32(v, name, &max_vq, errp)) {
-        return;
-    }
-
-    if (kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot set sve-max-vq");
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
-        return;
-    }
-
-    if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
-        error_setg(errp, "unsupported SVE vector length");
-        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
-                          ARM_MAX_VQ);
-        return;
-    }
-
-    cpu->sve_max_vq = max_vq;
-}
-
-/*
- * Note that cpu_arm_get/set_sve_vq cannot use the simpler
- * object_property_add_bool interface because they make use
- * of the contents of "name" to determine which bit on which
- * to operate.
- */
-static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t vq = atoi(&name[3]) / 128;
-    bool value;
-
-    /* All vector lengths are disabled when SVE is off. */
-    if (!cpu_isar_feature(aa64_sve, cpu)) {
-        value = false;
-    } else {
-        value = test_bit(vq - 1, cpu->sve_vq_map);
-    }
-    visit_type_bool(v, name, &value, errp);
-}
-
-static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t vq = atoi(&name[3]) / 128;
-    bool value;
-
-    if (!visit_type_bool(v, name, &value, errp)) {
-        return;
-    }
-
-    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot enable %s", name);
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
-        return;
-    }
-
-    if (value) {
-        set_bit(vq - 1, cpu->sve_vq_map);
-    } else {
-        clear_bit(vq - 1, cpu->sve_vq_map);
-    }
-    set_bit(vq - 1, cpu->sve_vq_init);
-}
-
-static bool cpu_arm_get_sve(Object *obj, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    return cpu_isar_feature(aa64_sve, cpu);
-}
-
-static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    uint64_t t;
-
-    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "'sve' feature not supported by KVM on this host");
-        return;
-    }
-
-    t = cpu->isar.id_aa64pfr0;
-    t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
-    cpu->isar.id_aa64pfr0 = t;
-}
-
-void aarch64_add_sve_properties(Object *obj)
-{
-    uint32_t vq;
-
-    object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
-
-    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-        char name[8];
-        sprintf(name, "sve%d", vq * 128);
-        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
-                            cpu_arm_set_sve_vq, NULL, NULL);
-    }
-}
-
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
     int arch_val = 0, impdef_val = 0;
@@ -777,8 +453,7 @@ static void aarch64_max_initfn(Object *obj)
     }
 
     aarch64_add_sve_properties(obj);
-    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
-                        cpu_max_set_sve_max_vq, NULL, NULL);
+    aarch64_add_sve_properties_max(obj);
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
index 9f65010c0c..a23831e3c6 100644
--- a/target/arm/kvm/kvm-cpu.c
+++ b/target/arm/kvm/kvm-cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "cpu.h"
+#include "cpu-sve.h"
 #include "hw/core/accel-cpu.h"
 #include "qapi/error.h"
 
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 448e94861f..bad5a659a7 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -13,6 +13,7 @@ arm_ss.add(zlib)
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
+  'cpu-sve.c',
   'gdbstub64.c',
 ))
 
-- 
2.20.1


