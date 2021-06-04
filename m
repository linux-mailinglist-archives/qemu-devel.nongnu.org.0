Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4FB39BE6F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:19:29 +0200 (CEST)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDTk-0006fV-GD
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNJ-00086u-Lu
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNC-00021m-AS
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:49 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l2so10038036wrw.6
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0qK3PtK1ZJ0cptr2WVdMdlRn0V00pOzTguQ/XpJv0Nw=;
 b=WOjKAbtaYFNBmEFh1M3XN+TY7WR2aqCgcVLpDVHxXUhaCzd27M2HH848aV1XyL/XDW
 AmHZMagjIFUZuz0nT9LTUVm5OLZDWiUV4m/qDk2ReDfP6yFVsPqypVLIZmjfTKOSbnvC
 2+Rl7ubJHcfF1U34Ess78woUEKrPogtxwFHAhd3kX8/BMJdE+qilgxav1+lcYWRs84db
 vRUYg3+oHhotH3p5gvle/B7MhlVYtupYPliOVC4zrydyHGnBO11QRYR3cXPYXnYarYQN
 N2bNXmGWbLXnquDq1TsG61jB08krHwffBEH4w4NJLmz15bWihIXTU4+IefOa1q/OlTQe
 4cVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0qK3PtK1ZJ0cptr2WVdMdlRn0V00pOzTguQ/XpJv0Nw=;
 b=QgnIV8uhYv6bEC47AF/FLbL/EjxqcfnwNorH6ryqoTKOPFYzCiE+9w2M+Tu/W9a3+K
 y03Mh4GXxCfAnPZg5Gdy6yTxmabMUg0QdfoZexxFT6nQdx9HA0FV5J2ozeGF4nXQKuB4
 P3HDGM3GeLtXeXBwLpy45qQM0+StEzhQFcmG35BZAjghWsEXXcVuJJ+a46nUMRJb/PW4
 GY4DU71OEMIEaJWU+BHPlTMhqlPqytw4hJiBb6k09CTa0fo0xPgMN4f84kkKYU03S2S4
 iQKgpsp3iEboTyO6z94IGW14KDWOFCkw2fDA8aW0pAcifmW1scjADl4p/Zepdo9+/gRd
 qzQg==
X-Gm-Message-State: AOAM532hkoPyCmXFCGbq94CCCq1a1UAt2wBgiIYxCRjP4lcV5coH9pCU
 LODcaqllVgYZ4rtfzySGrV0uXA==
X-Google-Smtp-Source: ABdhPJzSOvopO0cd+MEhvR1zsEEWKzvT9HTOJinmq+Ys5Nkqor5ZEJ8qjUqDXMhSsQjnv8zbDmSbRA==
X-Received: by 2002:adf:f78d:: with SMTP id q13mr4878148wrp.191.1622826760625; 
 Fri, 04 Jun 2021 10:12:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q3sm7211868wrr.43.2021.06.04.10.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:12:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C96491FF9D;
 Fri,  4 Jun 2021 16:53:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 14/99] accel: add cpu_reset
Date: Fri,  4 Jun 2021 16:51:47 +0100
Message-Id: <20210604155312.15902-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:X86 KVM CPUs" <kvm@vger.kernel.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

in cpu_reset(), implemented in the common cpu.c,
add a call to a new accel_cpu_reset(), which ensures that the CPU accel
interface is also reset when the CPU is reset.

Use this first for x86/kvm, simply moving the kvm_arch_reset_vcpu() call.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/accel-cpu.h | 2 ++
 include/qemu/accel.h        | 6 ++++++
 accel/accel-common.c        | 9 +++++++++
 hw/core/cpu-common.c        | 3 ++-
 target/i386/cpu.c           | 4 ----
 target/i386/kvm/kvm-cpu.c   | 6 ++++++
 6 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
index 5dbfd79955..700a5bd266 100644
--- a/include/hw/core/accel-cpu.h
+++ b/include/hw/core/accel-cpu.h
@@ -33,6 +33,8 @@ typedef struct AccelCPUClass {
     void (*cpu_class_init)(CPUClass *cc);
     void (*cpu_instance_init)(CPUState *cpu);
     bool (*cpu_realizefn)(CPUState *cpu, Error **errp);
+    void (*cpu_reset)(CPUState *cpu);
+
 } AccelCPUClass;
 
 #endif /* ACCEL_CPU_H */
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 4f4c283f6f..8d3a15b916 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -91,4 +91,10 @@ void accel_cpu_instance_init(CPUState *cpu);
  */
 bool accel_cpu_realizefn(CPUState *cpu, Error **errp);
 
+/**
+ * accel_cpu_reset:
+ * @cpu: The CPU that needs to call accel-specific reset.
+ */
+void accel_cpu_reset(CPUState *cpu);
+
 #endif /* QEMU_ACCEL_H */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index cf07f78421..3331a9dcfd 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -121,6 +121,15 @@ bool accel_cpu_realizefn(CPUState *cpu, Error **errp)
     return true;
 }
 
+void accel_cpu_reset(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->accel_cpu && cc->accel_cpu->cpu_reset) {
+        cc->accel_cpu->cpu_reset(cpu);
+    }
+}
+
 static const TypeInfo accel_cpu_type = {
     .name = TYPE_ACCEL_CPU,
     .parent = TYPE_OBJECT,
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e2f5a64604..ab258ad4f2 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -34,6 +34,7 @@
 #include "hw/qdev-properties.h"
 #include "trace/trace-root.h"
 #include "qemu/plugin.h"
+#include "qemu/accel.h"
 
 CPUState *cpu_by_arch_id(int64_t id)
 {
@@ -112,7 +113,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 void cpu_reset(CPUState *cpu)
 {
     device_cold_reset(DEVICE(cpu));
-
+    accel_cpu_reset(cpu);
     trace_guest_cpu_reset(cpu);
 }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e0ba36cc23..0c22324daf 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5749,10 +5749,6 @@ static void x86_cpu_reset(DeviceState *dev)
     apic_designate_bsp(cpu->apic_state, s->cpu_index == 0);
 
     s->halted = !cpu_is_bsp(cpu);
-
-    if (kvm_enabled()) {
-        kvm_arch_reset_vcpu(cpu);
-    }
 #endif
 }
 
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 5235bce8dc..63410d3f18 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -135,12 +135,18 @@ static void kvm_cpu_instance_init(CPUState *cs)
     }
 }
 
+static void kvm_cpu_reset(CPUState *cpu)
+{
+    kvm_arch_reset_vcpu(X86_CPU(cpu));
+}
+
 static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
     acc->cpu_realizefn = kvm_cpu_realizefn;
     acc->cpu_instance_init = kvm_cpu_instance_init;
+    acc->cpu_reset = kvm_cpu_reset;
 }
 static const TypeInfo kvm_cpu_accel_type_info = {
     .name = ACCEL_CPU_NAME("kvm"),
-- 
2.20.1


