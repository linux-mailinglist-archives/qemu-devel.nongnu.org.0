Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CCC5FE49E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:58:30 +0200 (CEST)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6Dl-0003Ms-6w
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62y-0002VZ-Qg
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62x-0005DO-6d
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ds+oyezvjsvQGyPBBqDdCHyAyAoEkuJZ5PMWpBjju5g=;
 b=HR23JbjFCo4fe6MiQd897i55N+gnSAIrBsMBW+4+6zQegIg9emL9YiSLMcm5Qy0vF/TNKk
 6v151T5L7PBakjEDsHz6mC0O7x0GG0F9mdcaT53CEpIA+zugGarOfi3Frk5twMmnLHV1He
 FpnISUFnTZXRH2WAOfPM6HC2xB/fkoo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-UeNYLA28MWmv84OHS6SlDA-1; Thu, 13 Oct 2022 17:47:17 -0400
X-MC-Unique: UeNYLA28MWmv84OHS6SlDA-1
Received: by mail-ed1-f69.google.com with SMTP id
 m13-20020a056402510d00b0045c1a055ee7so2355007edd.22
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ds+oyezvjsvQGyPBBqDdCHyAyAoEkuJZ5PMWpBjju5g=;
 b=wVEnDturfGRZMtesfqe1nmnKc18abIZgpqycmfKFCAS1Q49noCnbP9VLSclbV0YyjU
 6Lij3oWBluDbcLEaKeDC4+mymtFr8P0j/piI8NqLDoodr1jy7CGqaMhIHMBDoZ2o9Cik
 X0yEcuh6BRgFCq1iQju8GD5hUuJ7YZufA8jYjyF0SVbF8AVRJ+1jPeD4Dmb8j4YrYj2I
 rNozlFWukxpwaYINhb0JNL9oCasKS4sYqaiYr2pnBocFFunZcW7D0r7F4XZduwkpTI52
 qA0B5XsHBSAyCqj/Rx1SfQ9hACh4JBR5lJm31MYrc8XzN1abCKXNcl5C1cIcO6inNWfr
 3jRg==
X-Gm-Message-State: ACrzQf04A88YqiEJ3L29BSUwJDC8FWEUy414YPy0VMfN4TU+evHHVOQN
 Iubxy6wuWXtAHrSkFRQ5n2tvi5q92TPSNt4Y4xKH3goiM6YMlT4C8FuVD2uQSiNQytPuz0yEZ9u
 FdjqL48cwbac2cXwHsWsjPGjPypRYJ2ulkjWT5bL31/BrqFP6r1VhvLiz3OBkIEy1aTA=
X-Received: by 2002:a17:906:8479:b0:78d:cf17:2d70 with SMTP id
 hx25-20020a170906847900b0078dcf172d70mr1274643ejc.319.1665697635437; 
 Thu, 13 Oct 2022 14:47:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4P7DUL9wWTu9Pyx/NmmwxgeFfb+CD0VNLj7I/h5BaT/kpp2CLcXRnGao0QlalmBFRSjMcFCg==
X-Received: by 2002:a17:906:8479:b0:78d:cf17:2d70 with SMTP id
 hx25-20020a170906847900b0078dcf172d70mr1274627ejc.319.1665697635139; 
 Thu, 13 Oct 2022 14:47:15 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170906474c00b0076f0ab9591esm429625ejs.125.2022.10.13.14.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 07/35] target/i386: add AVX_EN hflag
Date: Thu, 13 Oct 2022 23:46:23 +0200
Message-Id: <20221013214651.672114-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paul Brook <paul@nowt.org>

Add a new hflag bit to determine whether AVX instructions are allowed

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-4-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h            |  3 +++
 target/i386/helper.c         | 12 ++++++++++++
 target/i386/tcg/fpu_helper.c |  1 +
 3 files changed, 16 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 63bb500d07..2687f3ba50 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -169,6 +169,7 @@ typedef enum X86Seg {
 #define HF_MPX_EN_SHIFT     25 /* MPX Enabled (CR4+XCR0+BNDCFGx) */
 #define HF_MPX_IU_SHIFT     26 /* BND registers in-use */
 #define HF_UMIP_SHIFT       27 /* CR4.UMIP */
+#define HF_AVX_EN_SHIFT     28 /* AVX Enabled (CR4+XCR0) */
 
 #define HF_CPL_MASK          (3 << HF_CPL_SHIFT)
 #define HF_INHIBIT_IRQ_MASK  (1 << HF_INHIBIT_IRQ_SHIFT)
@@ -195,6 +196,7 @@ typedef enum X86Seg {
 #define HF_MPX_EN_MASK       (1 << HF_MPX_EN_SHIFT)
 #define HF_MPX_IU_MASK       (1 << HF_MPX_IU_SHIFT)
 #define HF_UMIP_MASK         (1 << HF_UMIP_SHIFT)
+#define HF_AVX_EN_MASK       (1 << HF_AVX_EN_SHIFT)
 
 /* hflags2 */
 
@@ -2124,6 +2126,7 @@ void host_cpuid(uint32_t function, uint32_t count,
 
 /* helper.c */
 void x86_cpu_set_a20(X86CPU *cpu, int a20_state);
+void cpu_sync_avx_hflag(CPUX86State *env);
 
 #ifndef CONFIG_USER_ONLY
 static inline int x86_asidx_from_attrs(CPUState *cs, MemTxAttrs attrs)
diff --git a/target/i386/helper.c b/target/i386/helper.c
index b954ccda50..b62a1e48e2 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -29,6 +29,17 @@
 #endif
 #include "qemu/log.h"
 
+void cpu_sync_avx_hflag(CPUX86State *env)
+{
+    if ((env->cr[4] & CR4_OSXSAVE_MASK)
+        && (env->xcr0 & (XSTATE_SSE_MASK | XSTATE_YMM_MASK))
+            == (XSTATE_SSE_MASK | XSTATE_YMM_MASK)) {
+        env->hflags |= HF_AVX_EN_MASK;
+    } else{
+        env->hflags &= ~HF_AVX_EN_MASK;
+    }
+}
+
 void cpu_sync_bndcs_hflags(CPUX86State *env)
 {
     uint32_t hflags = env->hflags;
@@ -209,6 +220,7 @@ void cpu_x86_update_cr4(CPUX86State *env, uint32_t new_cr4)
     env->hflags = hflags;
 
     cpu_sync_bndcs_hflags(env);
+    cpu_sync_avx_hflag(env);
 }
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index ad58931751..9b59026e37 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2955,6 +2955,7 @@ void helper_xsetbv(CPUX86State *env, uint32_t ecx, uint64_t mask)
 
     env->xcr0 = mask;
     cpu_sync_bndcs_hflags(env);
+    cpu_sync_avx_hflag(env);
     return;
 
  do_gpf:
-- 
2.37.3


