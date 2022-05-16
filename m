Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE82528AB7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:39:38 +0200 (CEST)
Received: from localhost ([::1]:44704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdkw-0004wA-1K
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd58-0002Ce-RE
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd56-0003NK-IN
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBY2Yaa9/to//lKYZJQkzKis14F+XL3MYM7L7NaHTxc=;
 b=X8ZxvPpz2PgU9IqzjTniH2r2d+AIxzc7eODIlnS3ntzMXcqyHGsYsjPlpz2Bixk0PSYv8t
 cPXfD0jMw2TfVaEAx5as8xGLzTvHoZ9LSe8iJ+9WEEQMFhujCy7gsSza7ak+DlR1RAtCQU
 xMwRARQ+guRFQc5HegMA0LP3w50BrIg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-CTH3zTNmOJGIxIjuJ0gy8w-1; Mon, 16 May 2022 11:56:19 -0400
X-MC-Unique: CTH3zTNmOJGIxIjuJ0gy8w-1
Received: by mail-ed1-f69.google.com with SMTP id
 s9-20020aa7c549000000b0042ab6ab62f0so1556063edr.14
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBY2Yaa9/to//lKYZJQkzKis14F+XL3MYM7L7NaHTxc=;
 b=1dTu6VLrpn0N/yR7yuFCErH4/YyvLqddoYnElzHxzcG+j6mgqtlrDZ6EfBZCjicyp9
 v7YFLoF/D/7WxC4S5RZC19ndolgiBQNSCwKostbYm3rRB+Y7w8wIqaHrlgsoGxofqQ8u
 nEg3+43Br98Zcj+wpAxQX2SVoomyGdEdRIvdnrxN0iVy00xTz4N6Rum0SsrdKjV0DzE3
 9MzXMBRmPrXiIRScIuDr1PTF+VYn/FymwikfeBPQle5CGGj40kI6ib4vLu03IEunVqVY
 7n8k7nXAviATaS0YEdpQEUvUtTpY2e0Vg4nE76bj5VpDAVG61R7QcsHDdvaouMKnTqp/
 0kMQ==
X-Gm-Message-State: AOAM533rIK3X+WWOfjqIec4LeROLLzs4O4qolNi7Pa3aRamWdXYaIJs4
 rcBv6w2qsPyl08VcBUNs5kUvvBY95PEzUP6Tm9SyHb3fge/L4f5Y9mhR+yujWaaB3p2gasi0H42
 yCrd3z5aV94ZXnOMh2uSCjpPzS0RupINCE5tCs79IiIl+84XSMbgaaQTlG/IxKDfhKOg=
X-Received: by 2002:aa7:cdcd:0:b0:42a:ada8:a03f with SMTP id
 h13-20020aa7cdcd000000b0042aada8a03fmr7464268edw.322.1652716578425; 
 Mon, 16 May 2022 08:56:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGEepJrOg0FBlLXdydpmdzuOrxxK1eNWS41nirJe2PCjhhFkN27d8hncw9KFvlaNZNRgxajg==
X-Received: by 2002:aa7:cdcd:0:b0:42a:ada8:a03f with SMTP id
 h13-20020aa7cdcd000000b0042aada8a03fmr7464244edw.322.1652716578102; 
 Mon, 16 May 2022 08:56:18 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 14-20020a17090601ce00b006f3ef214e0dsm42361ejj.115.2022.05.16.08.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Weijiang <weijiang.yang@intel.com>
Subject: [PULL 08/23] target/i386: Enable support for XSAVES based features
Date: Mon, 16 May 2022 17:55:48 +0200
Message-Id: <20220516155603.1234712-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Yang Weijiang <weijiang.yang@intel.com>

There're some new features, including Arch LBR, depending
on XSAVES/XRSTORS support, the new instructions will
save/restore data based on feature bits enabled in XCR0 | XSS.
This patch adds the basic support for related CPUID enumeration
and meanwhile changes the name from FEAT_XSAVE_COMP_{LO|HI} to
FEAT_XSAVE_XCR0_{LO|HI} to differentiate clearly the feature
bits in XCR0 and those in XSS.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
Message-Id: <20220215195258.29149-5-weijiang.yang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 104 +++++++++++++++++++++++++++++++++++-----------
 target/i386/cpu.h |  14 ++++++-
 2 files changed, 92 insertions(+), 26 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 856a8659e8..643536d05d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -937,6 +937,34 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .tcg_features = TCG_XSAVE_FEATURES,
     },
+    [FEAT_XSAVE_XSS_LO] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .cpuid = {
+            .eax = 0xD,
+            .needs_ecx = true,
+            .ecx = 1,
+            .reg = R_ECX,
+        },
+    },
+    [FEAT_XSAVE_XSS_HI] = {
+        .type = CPUID_FEATURE_WORD,
+        .cpuid = {
+            .eax = 0xD,
+            .needs_ecx = true,
+            .ecx = 1,
+            .reg = R_EDX
+        },
+    },
     [FEAT_6_EAX] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
@@ -952,7 +980,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .cpuid = { .eax = 6, .reg = R_EAX, },
         .tcg_features = TCG_6_EAX_FEATURES,
     },
-    [FEAT_XSAVE_COMP_LO] = {
+    [FEAT_XSAVE_XCR0_LO] = {
         .type = CPUID_FEATURE_WORD,
         .cpuid = {
             .eax = 0xD,
@@ -965,7 +993,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             XSTATE_OPMASK_MASK | XSTATE_ZMM_Hi256_MASK | XSTATE_Hi16_ZMM_MASK |
             XSTATE_PKRU_MASK,
     },
-    [FEAT_XSAVE_COMP_HI] = {
+    [FEAT_XSAVE_XCR0_HI] = {
         .type = CPUID_FEATURE_WORD,
         .cpuid = {
             .eax = 0xD,
@@ -1382,6 +1410,9 @@ static const X86RegisterInfo32 x86_reg_info_32[CPU_NB_REGS32] = {
 };
 #undef REGISTER
 
+/* CPUID feature bits available in XSS */
+#define CPUID_XSTATE_XSS_MASK    (0)
+
 ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_FP_BIT] = {
         /* x87 FP state component is always enabled if XSAVE is supported */
@@ -1424,15 +1455,18 @@ ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     },
 };
 
-static uint32_t xsave_area_size(uint64_t mask)
+static uint32_t xsave_area_size(uint64_t mask, bool compacted)
 {
+    uint64_t ret = x86_ext_save_areas[0].size;
+    const ExtSaveArea *esa;
+    uint32_t offset = 0;
     int i;
-    uint64_t ret = 0;
 
-    for (i = 0; i < ARRAY_SIZE(x86_ext_save_areas); i++) {
-        const ExtSaveArea *esa = &x86_ext_save_areas[i];
+    for (i = 2; i < ARRAY_SIZE(x86_ext_save_areas); i++) {
+        esa = &x86_ext_save_areas[i];
         if ((mask >> i) & 1) {
-            ret = MAX(ret, esa->offset + esa->size);
+            offset = compacted ? ret : esa->offset;
+            ret = MAX(ret, offset + esa->size);
         }
     }
     return ret;
@@ -1443,10 +1477,10 @@ static inline bool accel_uses_host_cpuid(void)
     return kvm_enabled() || hvf_enabled();
 }
 
-static inline uint64_t x86_cpu_xsave_components(X86CPU *cpu)
+static inline uint64_t x86_cpu_xsave_xcr0_components(X86CPU *cpu)
 {
-    return ((uint64_t)cpu->env.features[FEAT_XSAVE_COMP_HI]) << 32 |
-           cpu->env.features[FEAT_XSAVE_COMP_LO];
+    return ((uint64_t)cpu->env.features[FEAT_XSAVE_XCR0_HI]) << 32 |
+           cpu->env.features[FEAT_XSAVE_XCR0_LO];
 }
 
 /* Return name of 32-bit register, from a R_* constant */
@@ -1458,6 +1492,12 @@ static const char *get_register_name_32(unsigned int reg)
     return x86_reg_info_32[reg].name;
 }
 
+static inline uint64_t x86_cpu_xsave_xss_components(X86CPU *cpu)
+{
+    return ((uint64_t)cpu->env.features[FEAT_XSAVE_XSS_HI]) << 32 |
+           cpu->env.features[FEAT_XSAVE_XSS_LO];
+}
+
 /*
  * Returns the set of feature flags that are supported and migratable by
  * QEMU, for a given FeatureWord.
@@ -4511,8 +4551,8 @@ static const char *x86_cpu_feature_name(FeatureWord w, int bitnr)
     /* XSAVE components are automatically enabled by other features,
      * so return the original feature name instead
      */
-    if (w == FEAT_XSAVE_COMP_LO || w == FEAT_XSAVE_COMP_HI) {
-        int comp = (w == FEAT_XSAVE_COMP_HI) ? bitnr + 32 : bitnr;
+    if (w == FEAT_XSAVE_XCR0_LO || w == FEAT_XSAVE_XCR0_HI) {
+        int comp = (w == FEAT_XSAVE_XCR0_HI) ? bitnr + 32 : bitnr;
 
         if (comp < ARRAY_SIZE(x86_ext_save_areas) &&
             x86_ext_save_areas[comp].bits) {
@@ -5408,25 +5448,36 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         }
 
         if (count == 0) {
-            *ecx = xsave_area_size(x86_cpu_xsave_components(cpu));
-            *eax = env->features[FEAT_XSAVE_COMP_LO];
-            *edx = env->features[FEAT_XSAVE_COMP_HI];
+            *ecx = xsave_area_size(x86_cpu_xsave_xcr0_components(cpu), false);
+            *eax = env->features[FEAT_XSAVE_XCR0_LO];
+            *edx = env->features[FEAT_XSAVE_XCR0_HI];
             /*
              * The initial value of xcr0 and ebx == 0, On host without kvm
              * commit 412a3c41(e.g., CentOS 6), the ebx's value always == 0
              * even through guest update xcr0, this will crash some legacy guest
              * (e.g., CentOS 6), So set ebx == ecx to workaroud it.
              */
-            *ebx = kvm_enabled() ? *ecx : xsave_area_size(env->xcr0);
+            *ebx = kvm_enabled() ? *ecx : xsave_area_size(env->xcr0, false);
         } else if (count == 1) {
+            uint64_t xstate = x86_cpu_xsave_xcr0_components(cpu) |
+                              x86_cpu_xsave_xss_components(cpu);
+
             *eax = env->features[FEAT_XSAVE];
+            *ebx = xsave_area_size(xstate, true);
+            *ecx = env->features[FEAT_XSAVE_XSS_LO];
+            *edx = env->features[FEAT_XSAVE_XSS_HI];
         } else if (count < ARRAY_SIZE(x86_ext_save_areas)) {
-            if ((x86_cpu_xsave_components(cpu) >> count) & 1) {
-                const ExtSaveArea *esa = &x86_ext_save_areas[count];
+            const ExtSaveArea *esa = &x86_ext_save_areas[count];
+
+            if (x86_cpu_xsave_xcr0_components(cpu) & (1ULL << count)) {
                 *eax = esa->size;
                 *ebx = esa->offset;
                 *ecx = esa->ecx &
                        (ESA_FEATURE_ALIGN64_MASK | ESA_FEATURE_XFD_MASK);
+            } else if (x86_cpu_xsave_xss_components(cpu) & (1ULL << count)) {
+                *eax = esa->size;
+                *ebx = 0;
+                *ecx = 1;
             }
         }
         break;
@@ -5477,8 +5528,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         } else {
             *eax &= env->features[FEAT_SGX_12_1_EAX];
             *ebx &= 0; /* ebx reserve */
-            *ecx &= env->features[FEAT_XSAVE_COMP_LO];
-            *edx &= env->features[FEAT_XSAVE_COMP_HI];
+            *ecx &= env->features[FEAT_XSAVE_XSS_LO];
+            *edx &= env->features[FEAT_XSAVE_XSS_HI];
 
             /* FP and SSE are always allowed regardless of XSAVE/XCR0. */
             *ecx |= XSTATE_FP_MASK | XSTATE_SSE_MASK;
@@ -5874,6 +5925,9 @@ static void x86_cpu_reset(DeviceState *dev)
     }
     for (i = 2; i < ARRAY_SIZE(x86_ext_save_areas); i++) {
         const ExtSaveArea *esa = &x86_ext_save_areas[i];
+        if (!((1 << i) & CPUID_XSTATE_XCR0_MASK)) {
+            continue;
+        }
         if (env->features[esa->feature] & esa->bits) {
             xcr0 |= 1ull << i;
         }
@@ -5988,8 +6042,8 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
     static bool request_perm;
 
     if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
-        env->features[FEAT_XSAVE_COMP_LO] = 0;
-        env->features[FEAT_XSAVE_COMP_HI] = 0;
+        env->features[FEAT_XSAVE_XCR0_LO] = 0;
+        env->features[FEAT_XSAVE_XCR0_HI] = 0;
         return;
     }
 
@@ -6007,8 +6061,10 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
         request_perm = true;
     }
 
-    env->features[FEAT_XSAVE_COMP_LO] = mask;
-    env->features[FEAT_XSAVE_COMP_HI] = mask >> 32;
+    env->features[FEAT_XSAVE_XCR0_LO] = mask & CPUID_XSTATE_XCR0_MASK;
+    env->features[FEAT_XSAVE_XCR0_HI] = mask >> 32;
+    env->features[FEAT_XSAVE_XSS_LO] = mask & CPUID_XSTATE_XSS_MASK;
+    env->features[FEAT_XSAVE_XSS_HI] = mask >> 32;
 }
 
 /***** Steps involved on loading and filtering CPUID data
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6730df5dbf..453b80eae2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -568,6 +568,14 @@ typedef enum X86Seg {
 #define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
 
 
+/* CPUID feature bits available in XCR0 */
+#define CPUID_XSTATE_XCR0_MASK  (XSTATE_FP_MASK | XSTATE_SSE_MASK | \
+                                 XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK | \
+                                 XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK | \
+                                 XSTATE_ZMM_Hi256_MASK | \
+                                 XSTATE_Hi16_ZMM_MASK | XSTATE_PKRU_MASK | \
+                                 XSTATE_XTILE_CFG_MASK | XSTATE_XTILE_DATA_MASK)
+
 /* CPUID feature words */
 typedef enum FeatureWord {
     FEAT_1_EDX,         /* CPUID[1].EDX */
@@ -586,8 +594,8 @@ typedef enum FeatureWord {
     FEAT_SVM,           /* CPUID[8000_000A].EDX */
     FEAT_XSAVE,         /* CPUID[EAX=0xd,ECX=1].EAX */
     FEAT_6_EAX,         /* CPUID[6].EAX */
-    FEAT_XSAVE_COMP_LO, /* CPUID[EAX=0xd,ECX=0].EAX */
-    FEAT_XSAVE_COMP_HI, /* CPUID[EAX=0xd,ECX=0].EDX */
+    FEAT_XSAVE_XCR0_LO, /* CPUID[EAX=0xd,ECX=0].EAX */
+    FEAT_XSAVE_XCR0_HI, /* CPUID[EAX=0xd,ECX=0].EDX */
     FEAT_ARCH_CAPABILITIES,
     FEAT_CORE_CAPABILITY,
     FEAT_PERF_CAPABILITIES,
@@ -604,6 +612,8 @@ typedef enum FeatureWord {
     FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
     FEAT_SGX_12_0_EBX,  /* CPUID[EAX=0x12,ECX=0].EBX (SGX MISCSELECT[31:0]) */
     FEAT_SGX_12_1_EAX,  /* CPUID[EAX=0x12,ECX=1].EAX (SGX ATTRIBUTES[31:0]) */
+    FEAT_XSAVE_XSS_LO,     /* CPUID[EAX=0xd,ECX=1].ECX */
+    FEAT_XSAVE_XSS_HI,     /* CPUID[EAX=0xd,ECX=1].EDX */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.36.0


