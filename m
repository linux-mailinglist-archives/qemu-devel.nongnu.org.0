Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E675BEF7A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:58:23 +0200 (CEST)
Received: from localhost ([::1]:38810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalG2-0006TS-5q
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0i-0006z1-Ny
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0S-0002GD-Ti
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lYlCi4izgJ/t/0gMaR1REf/PoK52S5TGaB1ccYyMtxI=;
 b=V+RZb3BkS8S3Jd7ef/nwG1cFrrgxE2dE2xi05+oWvvGM+GfGL+rBO8W7YWM0lsHXqF1N20
 Uouv3SvADsFfnBFTXdt/nrGbbjAlTEhaiIYnfFvSwr+HR71Y1cAI+tfcgGz4V0mXUe8Z6l
 +AQIAVn1ISiWarIADKPIlg1iiYhKzk8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-466-m8nkar4QNtGv6yeNI4nt4A-1; Tue, 20 Sep 2022 13:25:59 -0400
X-MC-Unique: m8nkar4QNtGv6yeNI4nt4A-1
Received: by mail-ej1-f71.google.com with SMTP id
 jg32-20020a170907972000b0077ce313a8f0so1781959ejc.15
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lYlCi4izgJ/t/0gMaR1REf/PoK52S5TGaB1ccYyMtxI=;
 b=5V57vGl53DxmS/xS6GL8biZcI74KqC/cqhlM6o2/kBE1r7Gu0QeSgWzP4F6dbCy8+g
 Fu03xp41Wn6/e4IcPNYsO7iKiW5oePOzynDa3NS/JUxecYNTgcYsjKXel975xwvRWW+w
 XK4WxwjqCxYCdVxtxs4L/lktgUJacSm5naja78dGc9aPZR7gdCPFuVzb0JdLVZ0UJ4TG
 ORCX9wcMazLLDo4t+3pdbgDWp6WZGzbK/Mht1rD55whFQY8vuq33UkX02Un1JqINq/5Z
 99/wbl6dW2k3JuWPUIzbRdwTb4pgXrvjD/cQhpFF07R++QGkps73va9BwfwSzdjpEpoH
 oMPw==
X-Gm-Message-State: ACrzQf15Ei1R+seXHbngWKvY0eL+KTX1iqHowEpInkWfEaXiRK+TplOL
 hkHBUZ4BfpV5H0l3R7o4fua1UOZQbg/sCVtR51yVnG/nwoFajgS3ird0NIInr7eQ4Daw94qNQPV
 9Gj1W2VDt9yrK0m9W9O6ORBt0VGL6vgOvMDZ0I4P9H4zBa9eHn7geCEB62PT5c86ma0c=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr18304917ejt.526.1663694757694; 
 Tue, 20 Sep 2022 10:25:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4nIfs0H61xsoAPFs3W1BDsrzZfyYQJy5cH2gFMfc3Gx6a6HKEQ6rlSaJqEq0PHU7oXYSVCEQ==
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr18304895ejt.526.1663694757376; 
 Tue, 20 Sep 2022 10:25:57 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a1709061dc300b007336c3f05bdsm135812ejh.178.2022.09.20.10.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 32/37] target/i386: implement XSAVE and XRSTOR of AVX
 registers
Date: Tue, 20 Sep 2022 19:25:02 +0200
Message-Id: <20220920172507.95568-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/fpu_helper.c | 78 ++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 819e920ec6..c1e3d74c84 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2571,6 +2571,22 @@ static void do_xsave_sse(CPUX86State *env, target_ulong ptr, uintptr_t ra)
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
@@ -2663,6 +2679,9 @@ static void do_xsave(CPUX86State *env, target_ulong ptr, uint64_t rfbm,
     if (opt & XSTATE_SSE_MASK) {
         do_xsave_sse(env, ptr, ra);
     }
+    if (opt & XSTATE_YMM_MASK) {
+        do_xsave_ymmh(env, ptr + XO(avx_state), ra);
+    }
     if (opt & XSTATE_BNDREGS_MASK) {
         do_xsave_bndregs(env, ptr + XO(bndreg_state), ra);
     }
@@ -2737,6 +2756,54 @@ static void do_xrstor_sse(CPUX86State *env, target_ulong ptr, uintptr_t ra)
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
@@ -2856,9 +2923,14 @@ void helper_xrstor(CPUX86State *env, target_ulong ptr, uint64_t rfbm)
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
2.37.2


