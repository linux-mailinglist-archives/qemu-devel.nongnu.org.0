Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED3E39BE6C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:18:59 +0200 (CEST)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDTG-0005rv-Oq
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkn-0008T8-E0
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCke-0002BW-3y
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:01 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so8275642wmd.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofbUZYQxVSTX2zCLFpcrYT6uJV2+s+AkgpY/MjopHLY=;
 b=TwV39QrtePGMEnp/LpXVEHnxUiUIMF823KJph6yhqs+h9TAfkvJGfBg+4XncSu5WcQ
 WyuSJ5YG+ye2Y/rGJgPAHgUqYAYJuORrx0VaR1p16/FpPK38oOlrSsfw397Sr8dNa0WE
 YRUwsHLLpHeJZdXoCbsa1gEnU9sMdAhZe+CPmNLTKLWPI9qCc6SUBWbzRF+V1p7HswM/
 5osonvrjTZuDDgP5XZxKtJectD0A0vMYVwPJojAF6ea85psbV7NtxuMPLhtktoRBP5N2
 Pk5TuQcPlHc9WJTZQ9bykUjQcDCJTSTPArI5jmh7HZDiBFQVu4N52y/bNYHSRtjFNvUK
 jhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofbUZYQxVSTX2zCLFpcrYT6uJV2+s+AkgpY/MjopHLY=;
 b=sFaDA3cG5QdmGzpaGXdJkt7xrR2VW+kY+GhRcm7hsnq38q6kjMVrXd5cYLZHvG5GL1
 D4RvPV8eryOsLSz7tNgZeU0mRnMbcMtdKteppVOk9y9vnUbVzwF6FAKEnkOSm4yUUfj6
 gLP6pfUCjKm10yrvj+dARwh7ahi4dDApgT9qKVYbn5N0iH6x1mL4GmHZ/9+7yaaOEWOz
 Wsekdi5kbdjw3xloUBu9Bp9Brkg+Ud6OvGGKDYPlm1lg0a8C3oxHeXuyJOyGKV37mAl+
 IUqbBlhnil50OVv+BpiYRXFceGHAi01eFOj0fxiLhFpAA+9Ugr5z9MWPjvGHO4b8sFe/
 tFBw==
X-Gm-Message-State: AOAM531rDk00aaW/tcfLh/ANGQm9DjcNPkynGvpLg/HXco/bM9hqGeHj
 uGJO/XaDeYT0kYkt49ePbanqI30BncRtWQ==
X-Google-Smtp-Source: ABdhPJysFNdNUT5eeehi2/j3hjLBnxewGfxBtvyhXg3lUKPSCN3LRnEmETuU6peZ9usylYLlutagbA==
X-Received: by 2002:a1c:4d09:: with SMTP id o9mr4612477wmh.149.1622824369449; 
 Fri, 04 Jun 2021 09:32:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 32sm8072606wrs.5.2021.06.04.09.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AB3721FFE1;
 Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 73/99] target/arm: cpu-sve: split TCG and KVM functionality
Date: Fri,  4 Jun 2021 16:52:46 +0100
Message-Id: <20210604155312.15902-74-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

put the KVM-specific and TCG-specific functionality
in the respective subdirectories kvm/ and tcg/

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm/kvm-sve.h   |  28 +++++++
 target/arm/tcg/tcg-sve.h   |  24 ++++++
 target/arm/cpu-sve.c       | 155 ++++++++++---------------------------
 target/arm/kvm/kvm-sve.c   | 118 ++++++++++++++++++++++++++++
 target/arm/tcg/tcg-sve.c   |  81 +++++++++++++++++++
 target/arm/kvm/meson.build |   1 +
 target/arm/tcg/meson.build |   1 +
 7 files changed, 296 insertions(+), 112 deletions(-)
 create mode 100644 target/arm/kvm/kvm-sve.h
 create mode 100644 target/arm/tcg/tcg-sve.h
 create mode 100644 target/arm/kvm/kvm-sve.c
 create mode 100644 target/arm/tcg/tcg-sve.c

diff --git a/target/arm/kvm/kvm-sve.h b/target/arm/kvm/kvm-sve.h
new file mode 100644
index 0000000000..9a9556b916
--- /dev/null
+++ b/target/arm/kvm/kvm-sve.h
@@ -0,0 +1,28 @@
+/*
+ * QEMU AArch64 CPU SVE KVM interface
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef KVM_SVE_H
+#define KVM_SVE_H
+
+void kvm_sve_get_supported_lens(ARMCPU *cpu,
+                                unsigned long *kvm_supported);
+
+void kvm_sve_enable_lens(unsigned long *sve_vq_map,
+                         unsigned long *sve_vq_init, uint32_t max_vq,
+                         unsigned long *kvm_supported);
+
+uint32_t kvm_sve_disable_lens(unsigned long *sve_vq_map,
+                              unsigned long *sve_vq_init,
+                              unsigned long *kvm_supported, Error **errp);
+
+bool kvm_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
+                           unsigned long *kvm_supported, Error **errp,
+                           uint32_t sve_max_vq);
+
+#endif /* KVM_SVE_H */
diff --git a/target/arm/tcg/tcg-sve.h b/target/arm/tcg/tcg-sve.h
new file mode 100644
index 0000000000..4bed809b9a
--- /dev/null
+++ b/target/arm/tcg/tcg-sve.h
@@ -0,0 +1,24 @@
+/*
+ * QEMU AArch64 CPU SVE TCG interface
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef TCG_SVE_H
+#define TCG_SVE_H
+
+/* note: SVE is an AARCH64-only option, only include this for TARGET_AARCH64 */
+
+void tcg_sve_enable_lens(unsigned long *sve_vq_map,
+                         unsigned long *sve_vq_init, uint32_t max_vq);
+
+uint32_t tcg_sve_disable_lens(unsigned long *sve_vq_map,
+                              unsigned long *sve_vq_init, Error **errp);
+
+bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
+                           Error **errp);
+
+#endif /* TCG_SVE_H */
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
index da60330cc2..5190e4a639 100644
--- a/target/arm/cpu-sve.c
+++ b/target/arm/cpu-sve.c
@@ -27,6 +27,28 @@
 #include "qapi/visitor.h"
 #include "cpu-sve.h"
 
+#include "tcg/tcg-sve.h"
+#include "kvm/kvm-sve.h"
+
+static bool apply_max_vq(unsigned long *sve_vq_map, unsigned long *sve_vq_init,
+                         uint32_t max_vq, Error **errp)
+{
+    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
+
+    if (!test_bit(max_vq - 1, sve_vq_map) &&
+        test_bit(max_vq - 1, sve_vq_init)) {
+        error_setg(errp, "cannot disable sve%d", max_vq * 128);
+        error_append_hint(errp, "The maximum vector length must be "
+                          "enabled, sve-max-vq=%d (%d bits)\n",
+                          max_vq, max_vq * 128);
+        return false;
+    }
+    /* Set all bits not explicitly set within sve-max-vq. */
+    bitmap_complement(tmp, sve_vq_init, max_vq);
+    bitmap_or(sve_vq_map, sve_vq_map, tmp, max_vq);
+    return true;
+}
+
 void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
 {
     /*
@@ -45,17 +67,11 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
      * vector length must be enabled.
      */
     DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
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
+    uint32_t max_vq = 0;
 
+    if (kvm_enabled()) {
+        kvm_sve_get_supported_lens(cpu, kvm_supported);
+    }
     /*
      * Process explicit sve<N> properties.
      * From the properties, sve_vq_map<N> implies sve_vq_init<N>.
@@ -72,70 +88,28 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
                               cpu->sve_max_vq * 128);
             return;
         }
-
         if (kvm_enabled()) {
-            /*
-             * For KVM we have to automatically enable all supported unitialized
-             * lengths, even when the smaller lengths are not all powers-of-two.
-             */
-            bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
-            bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
+            kvm_sve_enable_lens(cpu->sve_vq_map, cpu->sve_vq_init, max_vq,
+                                kvm_supported);
         } else if (tcg_enabled()) {
-            /* Propagate enabled bits down through required powers-of-two. */
-            for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
-                if (!test_bit(vq - 1, cpu->sve_vq_init)) {
-                    set_bit(vq - 1, cpu->sve_vq_map);
-                }
-            }
+            tcg_sve_enable_lens(cpu->sve_vq_map, cpu->sve_vq_init, max_vq);
         }
     } else if (cpu->sve_max_vq == 0) {
-        /*
-         * No explicit bits enabled, and no implicit bits from sve-max-vq.
-         */
+        /* No explicit bits enabled, and no implicit bits from sve-max-vq. */
         if (!cpu_isar_feature(aa64_sve, cpu)) {
             /* SVE is disabled and so are all vector lengths.  Good. */
             return;
         }
-
         if (kvm_enabled()) {
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
+            max_vq = kvm_sve_disable_lens(cpu->sve_vq_map, cpu->sve_vq_init,
+                                          kvm_supported, errp);
         } else if (tcg_enabled()) {
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
+            max_vq = tcg_sve_disable_lens(cpu->sve_vq_map, cpu->sve_vq_init,
+                                          errp);
+        }
+        if (!max_vq) {
+            return;
         }
-
         max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
     }
 
@@ -146,21 +120,11 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
      */
     if (cpu->sve_max_vq != 0) {
         max_vq = cpu->sve_max_vq;
-
-        if (!test_bit(max_vq - 1, cpu->sve_vq_map) &&
-            test_bit(max_vq - 1, cpu->sve_vq_init)) {
-            error_setg(errp, "cannot disable sve%d", max_vq * 128);
-            error_append_hint(errp, "The maximum vector length must be "
-                              "enabled, sve-max-vq=%d (%d bits)\n",
-                              max_vq, max_vq * 128);
+        if (!apply_max_vq(cpu->sve_vq_map, cpu->sve_vq_init, max_vq,
+                          errp)) {
             return;
         }
-
-        /* Set all bits not explicitly set within sve-max-vq. */
-        bitmap_complement(tmp, cpu->sve_vq_init, max_vq);
-        bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
     }
-
     /*
      * We should know what max-vq is now.  Also, as we're done
      * manipulating sve-vq-map, we ensure any bits above max-vq
@@ -170,46 +134,13 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
     bitmap_clear(cpu->sve_vq_map, max_vq, ARM_MAX_VQ - max_vq);
 
     if (kvm_enabled()) {
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
+        if (!kvm_sve_validate_lens(cpu->sve_vq_map, max_vq, kvm_supported,
+                                   errp, cpu->sve_max_vq)) {
             return;
         }
     } else if (tcg_enabled()) {
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
+        if (!tcg_sve_validate_lens(cpu->sve_vq_map, max_vq, errp)) {
+            return;
         }
     }
 
diff --git a/target/arm/kvm/kvm-sve.c b/target/arm/kvm/kvm-sve.c
new file mode 100644
index 0000000000..21dfee5b5c
--- /dev/null
+++ b/target/arm/kvm/kvm-sve.c
@@ -0,0 +1,118 @@
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
+#include "sysemu/kvm.h"
+#include "kvm/kvm_arm.h"
+#include "kvm/kvm-sve.h"
+
+void kvm_sve_get_supported_lens(ARMCPU *cpu, unsigned long *kvm_supported)
+{
+    /* Collect the set of vector lengths supported by KVM. */
+    bitmap_zero(kvm_supported, ARM_MAX_VQ);
+
+    if (kvm_arm_sve_supported()) {
+        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
+    } else {
+        assert(!cpu_isar_feature(aa64_sve, cpu));
+    }
+}
+
+void kvm_sve_enable_lens(unsigned long *sve_vq_map,
+                         unsigned long *sve_vq_init, uint32_t max_vq,
+                         unsigned long *kvm_supported)
+{
+    /*
+     * For KVM we have to automatically enable all supported unitialized
+     * lengths, even when the smaller lengths are not all powers-of-two.
+     */
+    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
+
+    bitmap_andnot(tmp, kvm_supported, sve_vq_init, max_vq);
+    bitmap_or(sve_vq_map, sve_vq_map, tmp, max_vq);
+}
+
+uint32_t kvm_sve_disable_lens(unsigned long *sve_vq_map,
+                              unsigned long *sve_vq_init,
+                              unsigned long *kvm_supported, Error **errp)
+{
+    uint32_t max_vq, vq;
+
+    /* Disabling a supported length disables all larger lengths. */
+    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+        if (test_bit(vq - 1, sve_vq_init) &&
+            test_bit(vq - 1, kvm_supported)) {
+            break;
+        }
+    }
+
+    max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
+    bitmap_andnot(sve_vq_map, kvm_supported, sve_vq_init, max_vq);
+
+    if (max_vq == 0 || bitmap_empty(sve_vq_map, max_vq)) {
+        error_setg(errp, "cannot disable sve%d", vq * 128);
+        error_append_hint(errp, "Disabling sve%d results in all "
+                          "vector lengths being disabled.\n",
+                          vq * 128);
+        error_append_hint(errp, "With SVE enabled, at least one "
+                          "vector length must be enabled.\n");
+        return 0;
+    }
+
+    return max_vq;
+}
+
+bool kvm_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
+                           unsigned long *kvm_supported, Error **errp,
+                           uint32_t sve_max_vq)
+{
+    /* Ensure the set of lengths matches what KVM supports. */
+    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
+    uint32_t vq;
+
+    bitmap_xor(tmp, sve_vq_map, kvm_supported, max_vq);
+    if (bitmap_empty(tmp, max_vq)) {
+        return true;
+    }
+
+    vq = find_last_bit(tmp, max_vq) + 1;
+    if (test_bit(vq - 1, sve_vq_map)) {
+        if (sve_max_vq) {
+            error_setg(errp, "cannot set sve-max-vq=%d", sve_max_vq);
+            error_append_hint(errp, "This KVM host does not support "
+                              "the vector length %d-bits.\n", vq * 128);
+            error_append_hint(errp, "It may not be possible to use "
+                              "sve-max-vq with this KVM host. Try "
+                              "using only sve<N> properties.\n");
+        } else {
+            error_setg(errp, "cannot enable sve%d", vq * 128);
+            error_append_hint(errp, "This KVM host does not support "
+                              "the vector length %d-bits.\n", vq * 128);
+        }
+    } else {
+        error_setg(errp, "cannot disable sve%d", vq * 128);
+        error_append_hint(errp, "The KVM host requires all "
+                          "supported vector lengths smaller "
+                          "than %d bits to also be enabled.\n", max_vq * 128);
+    }
+    return false;
+}
diff --git a/target/arm/tcg/tcg-sve.c b/target/arm/tcg/tcg-sve.c
new file mode 100644
index 0000000000..99cfde1f41
--- /dev/null
+++ b/target/arm/tcg/tcg-sve.c
@@ -0,0 +1,81 @@
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
+#include "cpu-sve.h"
+#include "tcg-sve.h"
+
+void tcg_sve_enable_lens(unsigned long *sve_vq_map,
+                         unsigned long *sve_vq_init, uint32_t max_vq)
+{
+    /* Propagate enabled bits down through required powers-of-two. */
+    uint32_t vq;
+
+    for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
+        if (!test_bit(vq - 1, sve_vq_init)) {
+            set_bit(vq - 1, sve_vq_map);
+        }
+    }
+}
+
+uint32_t tcg_sve_disable_lens(unsigned long *sve_vq_map,
+                              unsigned long *sve_vq_init, Error **errp)
+{
+    /* Disabling a power-of-two disables all larger lengths. */
+    uint32_t max_vq, vq;
+
+    if (test_bit(0, sve_vq_init)) {
+        error_setg(errp, "cannot disable sve128");
+        error_append_hint(errp, "Disabling sve128 results in all "
+                          "vector lengths being disabled.\n");
+        error_append_hint(errp, "With SVE enabled, at least one "
+                          "vector length must be enabled.\n");
+        return 0;
+    }
+    for (vq = 2; vq <= ARM_MAX_VQ; vq <<= 1) {
+        if (test_bit(vq - 1, sve_vq_init)) {
+            break;
+        }
+    }
+    max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
+    bitmap_complement(sve_vq_map, sve_vq_init, max_vq);
+    return max_vq;
+}
+
+bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
+                           Error **errp)
+{
+    /* Ensure all required powers-of-two are enabled. */
+    uint32_t vq;
+
+    for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
+        if (!test_bit(vq - 1, sve_vq_map)) {
+            error_setg(errp, "cannot disable sve%d", vq * 128);
+            error_append_hint(errp, "sve%d is required as it "
+                              "is a power-of-two length smaller than "
+                              "the maximum, sve%d\n", vq * 128, max_vq * 128);
+            return false;
+        }
+    }
+    return true;
+}
diff --git a/target/arm/kvm/meson.build b/target/arm/kvm/meson.build
index ef58a29dd7..1ae62bd65c 100644
--- a/target/arm/kvm/meson.build
+++ b/target/arm/kvm/meson.build
@@ -2,4 +2,5 @@ arm_ss.add(when: 'CONFIG_KVM', if_true: files(
   'kvm.c',
   'kvm64.c',
   'kvm-cpu.c',
+  'kvm-sve.c',
 ))
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 5b36a13a24..c289771e97 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -45,6 +45,7 @@ arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
   'mte_helper.c',
   'pauth_helper.c',
   'sve_helper.c',
+  'tcg-sve.c',
 ))
 
 subdir('user')
-- 
2.20.1


