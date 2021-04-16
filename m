Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6AD3626A6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:22:29 +0200 (CEST)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSAm-0006zp-KZ
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLS-0004rv-IA
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:46188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLH-0001aK-Su
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DE7DB307;
 Fri, 16 Apr 2021 16:28:53 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v14 60/80] target/arm: cpu-sve: rename functions according to
 module prefix
Date: Fri, 16 Apr 2021 18:28:04 +0200
Message-Id: <20210416162824.25131-61-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210416162824.25131-1-cfontana@suse.de>
References: <20210416162824.25131-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

external functions have the cpu_sve prefix,
while for static functions it can be omitted.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
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
index 75a8041855..be5d857e65 100644
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
index 52188698d9..7d6e0b553f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -438,8 +438,8 @@ static void aarch64_max_initfn(Object *obj)
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
2.26.2


