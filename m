Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E9F5FE538
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:27:21 +0200 (CEST)
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6ff-0003As-Hj
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj641-0002sP-RC
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj640-0005Li-87
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/RkhR7opaZ4IzoG7vXtx6p3CuSbT28royjK2MZw64A=;
 b=L0hVklkPt66Oz0h6eG55FE6fHLS1sOi79Etr/c7bL741Bg7rk8jGqCLq6lpl81aO3Im5Ca
 1uJWIaWJpcEo/zHM8Y1mPIpye6Df+bG9AcAf0ZVapyBPV6/+gNuOkSqs00FpTJ2ELW7vVa
 GAVtYO2bn7xMiU+Q5y5vCJeiLsw1HtU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-394-JYaMg5VkNZaJjMg9vxU5cA-1; Thu, 13 Oct 2022 17:48:22 -0400
X-MC-Unique: JYaMg5VkNZaJjMg9vxU5cA-1
Received: by mail-ed1-f69.google.com with SMTP id
 h9-20020a05640250c900b0045cfb639f56so1603282edb.13
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y/RkhR7opaZ4IzoG7vXtx6p3CuSbT28royjK2MZw64A=;
 b=IFYre4d0AuxtcSCq5tvlRDvmiyYKu+NG3NqTQzVVsTY83or9Pixt7BJ8bKIbu9rY5d
 awQYTQya2xi1lqVTRjkvjQOeFg57VtJm8YGRIsb1AM6t7AHIJI5C1pT1mmqFFNkpPSmk
 zsLRjC/yO+GwJWdtbN/FuIrvw6fvQqJFoRelW5xgAuOLZ0FUi6GfTimmMrwDFnfyH+sU
 NbNF7hYypNT1ZVlQ/YOm+SmSj5RtPGSSABcXKssv+slZT6HH5rgvKZqKzeGGyFxY/aDn
 u+1e8ybesaTwqV8oARwfCeCPi9Xf5Yq/xUSAshHBJcgrXVnnQEGB3vTkQxhnVaA5yRla
 BZCg==
X-Gm-Message-State: ACrzQf0ABeLGIIMcpJaN4AtKfOUXzCED+h2Bfl4o5rSr28pOdVF0kd6A
 t7GZyxmYS31pcmNQQdSRIDiWYgCXqIB1hBCf7v06DhMrTib4apizhPJaKGBGnmQyse3AB+ak1hR
 KY5eSilq71kCFB1Zq3pwc1wLgz9NxVzpnlSFsCsR0DfW/9btFDQSrYyjRN6kDUXWjwJA=
X-Received: by 2002:a17:907:2d91:b0:78d:8747:71b4 with SMTP id
 gt17-20020a1709072d9100b0078d874771b4mr1290340ejc.545.1665697700918; 
 Thu, 13 Oct 2022 14:48:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM46e2ATR3OD/NECYptzjTeN/j+dQfmBg0j+Wo7vRJvm/zdSUiEyh20A4eEd3y47V/soiN+zJA==
X-Received: by 2002:a17:907:2d91:b0:78d:8747:71b4 with SMTP id
 gt17-20020a1709072d9100b0078d874771b4mr1290327ejc.545.1665697700612; 
 Thu, 13 Oct 2022 14:48:20 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a170906538700b00782539a02absm420692ejo.194.2022.10.13.14.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:48:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 30/35] target/i386: implement XSAVE and XRSTOR of AVX registers
Date: Thu, 13 Oct 2022 23:46:46 +0200
Message-Id: <20221013214651.672114-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/fpu_helper.c | 78 ++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 5f3f7a1085..7670739abe 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2559,6 +2559,22 @@ static void do_xsave_sse(CPUX86State *env, target_ulong ptr, uintptr_t ra)
     }
 }
 
+static void do_xsave_ymmh(CPUX86State *env, target_ulong ptr, uintptr_t ra)
+{
+    int i, nb_xmm_regs;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    for (i = 0; i < nb_xmm_regs; i++, ptr += 16) {
+        cpu_stq_data_ra(env, ptr, env->xmm_regs[i].ZMM_Q(2), ra);
+        cpu_stq_data_ra(env, ptr + 8, env->xmm_regs[i].ZMM_Q(3), ra);
+    }
+}
+
 static void do_xsave_bndregs(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 {
     target_ulong addr = ptr + offsetof(XSaveBNDREG, bnd_regs);
@@ -2651,6 +2667,9 @@ static void do_xsave(CPUX86State *env, target_ulong ptr, uint64_t rfbm,
     if (opt & XSTATE_SSE_MASK) {
         do_xsave_sse(env, ptr, ra);
     }
+    if (opt & XSTATE_YMM_MASK) {
+        do_xsave_ymmh(env, ptr + XO(avx_state), ra);
+    }
     if (opt & XSTATE_BNDREGS_MASK) {
         do_xsave_bndregs(env, ptr + XO(bndreg_state), ra);
     }
@@ -2725,6 +2744,54 @@ static void do_xrstor_sse(CPUX86State *env, target_ulong ptr, uintptr_t ra)
     }
 }
 
+static void do_clear_sse(CPUX86State *env)
+{
+    int i, nb_xmm_regs;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    for (i = 0; i < nb_xmm_regs; i++) {
+        env->xmm_regs[i].ZMM_Q(0) = 0;
+        env->xmm_regs[i].ZMM_Q(1) = 0;
+    }
+}
+
+static void do_xrstor_ymmh(CPUX86State *env, target_ulong ptr, uintptr_t ra)
+{
+    int i, nb_xmm_regs;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    for (i = 0; i < nb_xmm_regs; i++, ptr += 16) {
+        env->xmm_regs[i].ZMM_Q(2) = cpu_ldq_data_ra(env, ptr, ra);
+        env->xmm_regs[i].ZMM_Q(3) = cpu_ldq_data_ra(env, ptr + 8, ra);
+    }
+}
+
+static void do_clear_ymmh(CPUX86State *env)
+{
+    int i, nb_xmm_regs;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    for (i = 0; i < nb_xmm_regs; i++) {
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
 static void do_xrstor_bndregs(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 {
     target_ulong addr = ptr + offsetof(XSaveBNDREG, bnd_regs);
@@ -2831,9 +2898,14 @@ static void do_xrstor(CPUX86State *env, target_ulong ptr, uint64_t rfbm, uintptr
         if (xstate_bv & XSTATE_SSE_MASK) {
             do_xrstor_sse(env, ptr, ra);
         } else {
-            /* ??? When AVX is implemented, we may have to be more
-               selective in the clearing.  */
-            memset(env->xmm_regs, 0, sizeof(env->xmm_regs));
+            do_clear_sse(env);
+        }
+    }
+    if (rfbm & XSTATE_YMM_MASK) {
+        if (xstate_bv & XSTATE_YMM_MASK) {
+            do_xrstor_ymmh(env, ptr + XO(avx_state), ra);
+        } else {
+            do_clear_ymmh(env);
         }
     }
     if (rfbm & XSTATE_BNDREGS_MASK) {
-- 
2.37.3


