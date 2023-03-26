Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D836C928F
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 07:23:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgIqU-0007Vn-Hd; Sun, 26 Mar 2023 01:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pgIqS-0007Tv-OE
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 01:23:08 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pgIqQ-0008D9-RI
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 01:23:08 -0400
Received: by mail-pl1-x630.google.com with SMTP id o11so5618652ple.1
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 22:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679808184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JuyIydhgpL8UArypX6xMRbypFd9wnnNS+58Gghs84yU=;
 b=d46tvM0v3RZt1eyh4OJHFx2V8jiRbhn/CgAUy1ED7Xlytt6fe7F5y4lk7VV1x45PMW
 RcmVNtYF3iibnt8I2+XnCHZwSirhLfHXp9i2t9dMxW9etJRx9gFS9/GU+9TJn4qYXZQ3
 wgdHt/UOcfgo2i5op2XO+0b6HTatD50xpBAAz3WyTLLHv001ZI+9+nGz5xZLS4HzO9DC
 POQ076a+uWrJ6WLgQPbnpvkUr1TubnJwfJjJfeQvH3jINbNgejp6R5LCgOZ7NvYI47z0
 N6NUkukYnVnrYl4CHoXXIWK0UJqCTSqSxkpXb0jyIbe+mSroCEAarygdNkUgfrMc7foG
 mppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679808184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JuyIydhgpL8UArypX6xMRbypFd9wnnNS+58Gghs84yU=;
 b=y+reulNpncHUSuD4SnFz6IxsOGCrqJ6tNpBKfOtZmnWAe9oZP/lz6NqvPKsWpT3AGg
 QPQyluizpSeGapoFiwOjb3hgsDnta4CtqB/hqliLJunltX+EqMdo4OgruLPUYjK17h0h
 /yzyeLmJ5m2Kx/IQc400D9KN8u0jiyWk6Zp/KwhiTKguHoV1RfIjXNi1dECY3QmK8WK/
 9hO4TQyplsx4V+2h/BGk4QojS+xOb0zuI6niJsA6J0ZaWawgqt8+RTv/x9ORQR75pkUM
 CjfT/wydevh8LMzCtimJ+5L/Bvx/DzGMb6DdT1an/bmRJ68T7Thuo7ZXn5Up0JFX7iW+
 C9Ag==
X-Gm-Message-State: AAQBX9d76pF1mUafe5ZGTIC1A/IopxfreUqhfpJPnMTO3dBvfLEtjDeS
 0T5wNMzOLv2p51BZv8g+xclPbNokFPOmwg==
X-Google-Smtp-Source: AKy350bM1nDRGnHiQ1Vr6to0T6cg11Nv1fVhmIO91Vgq6g9DSwmtz24FiOPTHGydFwxi6LTU94vRRw==
X-Received: by 2002:a17:902:c3c3:b0:19e:baa6:5860 with SMTP id
 j3-20020a170902c3c300b0019ebaa65860mr7234484plj.2.1679808184584; 
 Sat, 25 Mar 2023 22:23:04 -0700 (PDT)
Received: from localhost.localdomain ([113.173.97.170])
 by smtp.googlemail.com with ESMTPSA id
 bc9-20020a170902930900b001a20b31a23fsm5020258plb.293.2023.03.25.22.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 22:23:04 -0700 (PDT)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [PATCH v2 3/5] apic, i386/tcg: add x2apic transitions
Date: Sun, 26 Mar 2023 12:20:37 +0700
Message-Id: <20230326052039.33717-4-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230326052039.33717-1-minhquangbui99@gmail.com>
References: <20230326052039.33717-1-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This commit adds support for x2APIC transitions when writing to
MSR_IA32_APICBASE register and finally adds CPUID_EXT_X2APIC to
TCG_EXT_FEATURES.

Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
---
 hw/intc/apic.c                       | 50 ++++++++++++++++++++++++++++
 hw/intc/apic_common.c                |  7 ++--
 target/i386/cpu-sysemu.c             | 10 ++++++
 target/i386/cpu.c                    |  5 +--
 target/i386/cpu.h                    |  6 ++++
 target/i386/tcg/sysemu/misc_helper.c |  4 +++
 6 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 159527af30..735412274d 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -308,8 +308,41 @@ bool is_x2apic_mode(DeviceState *dev)
     return s->apicbase & MSR_IA32_APICBASE_EXTD;
 }
 
+static void apic_set_base_check(APICCommonState *s, uint64_t val)
+{
+    /* Enable x2apic when x2apic is not supported by CPU */
+    if (!cpu_has_x2apic_feature(&s->cpu->env) &&
+        val & MSR_IA32_APICBASE_EXTD)
+        raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+
+    /*
+     * Transition into invalid state
+     * (s->apicbase & MSR_IA32_APICBASE_ENABLE == 0) &&
+     * (s->apicbase & MSR_IA32_APICBASE_EXTD) == 1
+     */
+    if (!(val & MSR_IA32_APICBASE_ENABLE) &&
+        (val & MSR_IA32_APICBASE_EXTD))
+        raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+
+    /* Invalid transition from disabled mode to x2APIC */
+    if (!(s->apicbase & MSR_IA32_APICBASE_ENABLE) &&
+        !(s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_ENABLE) &&
+        (val & MSR_IA32_APICBASE_EXTD))
+        raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+
+    /* Invalid transition from x2APIC to xAPIC */
+    if ((s->apicbase & MSR_IA32_APICBASE_ENABLE) &&
+        (s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_ENABLE) &&
+        !(val & MSR_IA32_APICBASE_EXTD))
+        raise_exception_ra(&s->cpu->env, EXCP0D_GPF, GETPC());
+}
+
 static void apic_set_base(APICCommonState *s, uint64_t val)
 {
+    apic_set_base_check(s, val);
+
     s->apicbase = (val & 0xfffff000) |
         (s->apicbase & (MSR_IA32_APICBASE_BSP | MSR_IA32_APICBASE_ENABLE));
     /* if disabled, cannot be enabled again */
@@ -318,6 +351,23 @@ static void apic_set_base(APICCommonState *s, uint64_t val)
         cpu_clear_apic_feature(&s->cpu->env);
         s->spurious_vec &= ~APIC_SV_ENABLE;
     }
+
+    /* Transition from disabled mode to xAPIC */
+    if (!(s->apicbase & MSR_IA32_APICBASE_ENABLE) &&
+        (val & MSR_IA32_APICBASE_ENABLE)) {
+        s->apicbase |= MSR_IA32_APICBASE_ENABLE;
+        cpu_set_apic_feature(&s->cpu->env);
+    }
+
+    /* Transition from xAPIC to x2APIC */
+    if (cpu_has_x2apic_feature(&s->cpu->env) &&
+        !(s->apicbase & MSR_IA32_APICBASE_EXTD) &&
+        (val & MSR_IA32_APICBASE_EXTD)) {
+        s->apicbase |= MSR_IA32_APICBASE_EXTD;
+
+        s->log_dest = ((s->initial_apic_id & 0xffff0) << 16) |
+                      (1 << (s->initial_apic_id & 0xf));
+    }
 }
 
 static void apic_set_tpr(APICCommonState *s, uint8_t val)
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 39c207bd21..3d249838fc 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -43,11 +43,8 @@ void cpu_set_apic_base(DeviceState *dev, uint64_t val)
     if (dev) {
         APICCommonState *s = APIC_COMMON(dev);
         APICCommonClass *info = APIC_COMMON_GET_CLASS(s);
-        /* switching to x2APIC, reset possibly modified xAPIC ID */
-        if (!(s->apicbase & MSR_IA32_APICBASE_EXTD) &&
-            (val & MSR_IA32_APICBASE_EXTD)) {
-            s->id = s->initial_apic_id;
-        }
+        /* Reset possibly modified xAPIC ID */
+        s->id = s->initial_apic_id;
         info->set_base(s, val);
     }
 }
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 28115edf44..de57892c25 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -235,6 +235,16 @@ void cpu_clear_apic_feature(CPUX86State *env)
     env->features[FEAT_1_EDX] &= ~CPUID_APIC;
 }
 
+void cpu_set_apic_feature(CPUX86State *env)
+{
+    env->features[FEAT_1_EDX] |= CPUID_APIC;
+}
+
+bool cpu_has_x2apic_feature(CPUX86State *env)
+{
+    return env->features[FEAT_1_ECX] & CPUID_EXT_X2APIC;
+}
+
 bool cpu_is_bsp(X86CPU *cpu)
 {
     return cpu_get_apic_base(cpu->apic_state) & MSR_IA32_APICBASE_BSP;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6576287e5b..6847b2ae02 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -627,12 +627,13 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
           CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
           CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C | \
-          CPUID_EXT_FMA)
+          CPUID_EXT_FMA | CPUID_EXT_X2APIC)
           /* missing:
           CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, CPUID_EXT_SMX,
           CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID,
           CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, CPUID_EXT_DCA,
-          CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER */
+          CPUID_EXT_TSC_DEADLINE_TIMER
+          */
 
 #ifdef TARGET_X86_64
 #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 02165a5ad2..53cd8f01dd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -379,6 +379,10 @@ typedef enum X86Seg {
 #define MSR_IA32_APICBASE_ENABLE        (1<<11)
 #define MSR_IA32_APICBASE_EXTD          (1 << 10)
 #define MSR_IA32_APICBASE_BASE          (0xfffffU<<12)
+#define MSR_IA32_APICBASE_RESERVED \
+        (~(uint64_t)(MSR_IA32_APICBASE_BSP | MSR_IA32_APICBASE_ENABLE \
+                     | MSR_IA32_APICBASE_EXTD | MSR_IA32_APICBASE_BASE))
+
 #define MSR_IA32_FEATURE_CONTROL        0x0000003a
 #define MSR_TSC_ADJUST                  0x0000003b
 #define MSR_IA32_SPEC_CTRL              0x48
@@ -2158,8 +2162,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                    uint32_t *eax, uint32_t *ebx,
                    uint32_t *ecx, uint32_t *edx);
 void cpu_clear_apic_feature(CPUX86State *env);
+void cpu_set_apic_feature(CPUX86State *env);
 void host_cpuid(uint32_t function, uint32_t count,
                 uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx);
+bool cpu_has_x2apic_feature(CPUX86State *env);
 
 /* helper.c */
 void x86_cpu_set_a20(X86CPU *cpu, int a20_state);
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 1fce2076a3..91a58d4d97 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -159,6 +159,10 @@ void helper_wrmsr(CPUX86State *env)
         env->sysenter_eip = val;
         break;
     case MSR_IA32_APICBASE:
+        if (val & MSR_IA32_APICBASE_RESERVED) {
+            goto error;
+        }
+
         cpu_set_apic_base(env_archcpu(env)->apic_state, val);
         break;
     case MSR_EFER:
-- 
2.25.1


