Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187C739BF82
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:24:10 +0200 (CEST)
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEUK-0003HJ-KL
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpESw-0000b4-Us
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpESu-0000J7-Tw
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id n4so10210319wrw.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CUf/8kmWW8xLQQ+yY0pjmJPzJUFPuD+MEJ2WMvFClI=;
 b=I/eAYba+zTRXFyI/7v2n7HVFEJY4fpYSvErYW7LTPFPYdYjf57isXcijhX73Yseu2J
 S2PIY/tlsfwNRqfGgckJKhRksm/MTSVZnowDAQdCnEvUTvOfE1UjLKYaEyNRkqebFoI1
 OLn9szFJrexJTTnhwXHA7yrGd0bX4NckrOzcSINc/873ikNRFj8P5R12fZoipUKSRfko
 gUupIC57fsimPOyLX09wb2sx4jv3DNgMHoBK1vS7dOJUQ16fHh0FrWkWBjuFM5mcyzW4
 3a1Fwh0KlyUP9Gczy5++gAjV3kFZqmp4v2hlszSJcJphB6E6Lv0Un/cXvDpmO2v+/9wR
 lrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CUf/8kmWW8xLQQ+yY0pjmJPzJUFPuD+MEJ2WMvFClI=;
 b=IQzaEqLSKiNKIH+CCu4e4TprQr3xHuslpjIIW1EVEqRP8/jE9KDfsUFM7FdXuZTALg
 M9Vv0DqlGuY1Zfa+XpDqnrXkUXIsH+QRMRzlNhrB3wAmc75jJbwZyOW8YgH3e8ZmJtDh
 wNwAtkuyRWCP/zDrUtEq4WvpcHLgwZf+OPmNDnlV+p6mA5zzdJx92rQ0/WUaFVJsc4ps
 4vuRG8HkyNG9FYVfXTA2l0+iMbXhPEAJ8FPRRHLVM5uRBhO/Lt4MOTb2iXz3mUJ3DEpp
 HMU9rjczigerg+qHzkf4TlHqSQecFBRSkAPYy/H+zQgZyOO+PAjbBlWBbDFW6Jc6vHfi
 Q6Pg==
X-Gm-Message-State: AOAM531+/c9T6AXSDHDJXbZu5J5PWoyQ3kchJj9edzRA3gxzjDR9l9/c
 cuB9BQE8+cpvlNJdaqH33ayJsg==
X-Google-Smtp-Source: ABdhPJwW9wjHHzPnDVUErFzDjOcdqFa6ixphe68cedWjADpidCW5UOpVRTENixIu2w8Zq0x2Q1OA2g==
X-Received: by 2002:adf:a195:: with SMTP id u21mr5128992wru.367.1622830958710; 
 Fri, 04 Jun 2021 11:22:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b7sm7288622wri.83.2021.06.04.11.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:22:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 85BAB1FFE0;
 Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 72/99] target/arm: cpu-sve: rename functions according to
 module prefix
Date: Fri,  4 Jun 2021 16:52:45 +0100
Message-Id: <20210604155312.15902-73-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

external functions have the cpu_sve prefix,
while for static functions it can be omitted.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sve.h     |  6 +++---
 target/arm/cpu-sve.c     | 32 ++++++++++++++++----------------
 target/arm/cpu.c         |  2 +-
 target/arm/cpu64.c       |  4 ++--
 target/arm/kvm/kvm-cpu.c |  2 +-
 5 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index 692509d419..ece36d2a0c 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -26,12 +26,12 @@
 #include "cpu.h"
 
 /* called by arm_cpu_finalize_features in realizefn */
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
 
 /* add the CPU SVE properties */
-void aarch64_add_sve_properties(Object *obj);
+void cpu_sve_add_props(Object *obj);
 
 /* add the CPU SVE properties specific to the "MAX" CPU */
-void aarch64_add_sve_properties_max(Object *obj);
+void cpu_sve_add_props_max(Object *obj);
 
 #endif /* CPU_SVE_H */
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
index 129fb9586e..da60330cc2 100644
--- a/target/arm/cpu-sve.c
+++ b/target/arm/cpu-sve.c
@@ -27,7 +27,7 @@
 #include "qapi/visitor.h"
 #include "cpu-sve.h"
 
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
+void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
 {
     /*
      * If any vector lengths are explicitly enabled with sve<N> properties,
@@ -229,8 +229,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
     cpu->sve_max_vq = max_vq;
 }
 
-static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
+static void get_prop_max_vq(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t value;
@@ -244,8 +244,8 @@ static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
     visit_type_uint32(v, name, &value, errp);
 }
 
-static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
+static void set_prop_max_vq(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t max_vq;
@@ -276,8 +276,8 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
  * of the contents of "name" to determine which bit on which
  * to operate.
  */
-static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void get_prop_vq(Object *obj, Visitor *v, const char *name,
+                        void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq = atoi(&name[3]) / 128;
@@ -292,8 +292,8 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
     visit_type_bool(v, name, &value, errp);
 }
 
-static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void set_prop_vq(Object *obj, Visitor *v, const char *name,
+                        void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq = atoi(&name[3]) / 128;
@@ -317,13 +317,13 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
     set_bit(vq - 1, cpu->sve_vq_init);
 }
 
-static bool cpu_arm_get_sve(Object *obj, Error **errp)
+static bool get_prop_sve(Object *obj, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     return cpu_isar_feature(aa64_sve, cpu);
 }
 
-static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
+static void set_prop_sve(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
@@ -338,21 +338,21 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
     cpu->isar.id_aa64pfr0 = t;
 }
 
-void aarch64_add_sve_properties(Object *obj)
+void cpu_sve_add_props(Object *obj)
 {
     uint32_t vq;
 
-    object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
+    object_property_add_bool(obj, "sve", get_prop_sve, set_prop_sve);
 
     for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
         char name[8];
         sprintf(name, "sve%d", vq * 128);
-        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq, cpu_arm_set_sve_vq, NULL, NULL);
+        object_property_add(obj, name, "bool", get_prop_vq, set_prop_vq, NULL, NULL);
     }
 }
 
 /* properties added for MAX CPU */
-void aarch64_add_sve_properties_max(Object *obj)
+void cpu_sve_add_props_max(Object *obj)
 {
-    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq, cpu_max_set_sve_max_vq, NULL, NULL);
+    object_property_add(obj, "sve-max-vq", "uint32", get_prop_max_vq, set_prop_max_vq, NULL, NULL);
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6db37b42d1..e4ad92ffec 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -821,7 +821,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 
 #ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        arm_cpu_sve_finalize(cpu, &local_err);
+        cpu_sve_finalize_features(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
             return;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3a6b7cf5d1..03ed637bdb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -452,8 +452,8 @@ static void aarch64_max_initfn(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
     }
 
-    aarch64_add_sve_properties(obj);
-    aarch64_add_sve_properties_max(obj);
+    cpu_sve_add_props(obj);
+    cpu_sve_add_props_max(obj);
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
index a23831e3c6..09aede9319 100644
--- a/target/arm/kvm/kvm-cpu.c
+++ b/target/arm/kvm/kvm-cpu.c
@@ -89,7 +89,7 @@ static void host_cpu_instance_init(Object *obj)
 
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        aarch64_add_sve_properties(obj);
+        cpu_sve_add_props(obj);
     }
     arm_cpu_post_init(obj);
 }
-- 
2.20.1


