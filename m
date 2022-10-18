Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0522602E19
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:14:28 +0200 (CEST)
Received: from localhost ([::1]:57112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknMR-00020c-8p
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiS-0004RU-4E
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhx-0005Gu-1y
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAEjY/xNyqTgeKzJy6YzPoD6VgrDN6sxMKJZyZYomuc=;
 b=Q+pNxZz/mrlZ9qpZgEjaaiTSNZe6pXrhz6pCNWzR8lkqr9ECeL+mxDB0yNm3utuu4USKPY
 GMAdRYLIZL/L7v18Jug/J83KNBAMfDeJ+DvUf0axYwJLlg64D9DsbCnE0UClVQ1/J9NBw7
 VW7+ZmVe6WlTruGI2nIboUQoJW2Q9Uw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170-tqoMIHVYO4yEpDfOm4zQpg-1; Tue, 18 Oct 2022 09:32:34 -0400
X-MC-Unique: tqoMIHVYO4yEpDfOm4zQpg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hd11-20020a170907968b00b0078df60485fdso6464759ejc.17
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LAEjY/xNyqTgeKzJy6YzPoD6VgrDN6sxMKJZyZYomuc=;
 b=IFV7pZH7BA5penKEI118ebFlszk74ovFZmzchTxAvsrYerqkb1wFVaGad5iVjXqu/1
 uU2VUBqiSiGMN6+va1BIgytkGvLsaRRZOzFLXrAOfhyUMgX5yJKd2Be2tRaH19h17HN5
 rDgbdVBsOA/LWjQaXOT/F3gCj7Nc1v/L7oTGJX0Rx/cgEbinL6yJGLKut4kvxdv6FkI0
 2Mteibn8awnkN20GbiQrwybMnvEwbu7mSGkQaLVXP655FpgqBqKmSGy5j7RBpyWI7s0B
 9yPw3QjkITLeh5mGXe2Rey2HAJ+qIC5bP9ce1Qd73nfHtAcNYT8VqtgxIB2HsXwLcS24
 FSHg==
X-Gm-Message-State: ACrzQf39a7TmEcN7mA84+ewXhKBYYTE+kQcM7qj6prXIYD7fIInIvNTT
 OscH/vOK2p9YEz77ET3s6e3DOhoZC4b80vrrpxbW6JFem3UFfM+5FWydFi/NOhJeAZwdc6F5/Et
 7clHWcSyLgiBuMVtS69xtAgwc5n+L2ovBv2XiIYnEG+Mn+au8crWl1vGfh1tR4Wt7q4E=
X-Received: by 2002:a17:907:3f27:b0:78d:ad42:f733 with SMTP id
 hq39-20020a1709073f2700b0078dad42f733mr2533677ejc.320.1666099950742; 
 Tue, 18 Oct 2022 06:32:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM64vxyiOVRxYG7Z1DAvAYQeTdbRALwp/nXOKYE8enHg4FxmpVW77TImaIHTnv3di2DdcnwrDw==
X-Received: by 2002:a17:907:3f27:b0:78d:ad42:f733 with SMTP id
 hq39-20020a1709073f2700b0078dad42f733mr2533656ejc.320.1666099950317; 
 Tue, 18 Oct 2022 06:32:30 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a056402524500b0045726e8a22bsm9117088edd.46.2022.10.18.06.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 32/53] target/i386: provide 3-operand versions of unary scalar
 helpers
Date: Tue, 18 Oct 2022 15:30:21 +0200
Message-Id: <20221018133042.856368-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Compared to Paul's implementation, the new decoder will use a different approach
to implement AVX's merging of dst with src1 on scalar operations.  Adjust the
old SSE decoder to be compatible with new-style helpers.

The affected instructions are CVTSx2Sx, ROUNDSx, RSQRTSx, SQRTSx, RCPSx.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 48 ++++++++++++++++++++++++++++++------
 target/i386/ops_sse_header.h | 16 ++++++------
 target/i386/tcg/translate.c  | 22 ++++++++++-------
 3 files changed, 61 insertions(+), 25 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index ddedc46f36..8bb7293975 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -617,14 +617,22 @@ void glue(helper_sqrtpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 }
 
 #if SHIFT == 1
-void helper_sqrtss(CPUX86State *env, Reg *d, Reg *s)
+void helper_sqrtss(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
+    int i;
     d->ZMM_S(0) = float32_sqrt(s->ZMM_S(0), &env->sse_status);
+    for (i = 1; i < 2 << SHIFT; i++) {
+        d->ZMM_L(i) = v->ZMM_L(i);
+    }
 }
 
-void helper_sqrtsd(CPUX86State *env, Reg *d, Reg *s)
+void helper_sqrtsd(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
+    int i;
     d->ZMM_D(0) = float64_sqrt(s->ZMM_D(0), &env->sse_status);
+    for (i = 1; i < 1 << SHIFT; i++) {
+        d->ZMM_Q(i) = v->ZMM_Q(i);
+    }
 }
 #endif
 
@@ -649,14 +657,22 @@ void glue(helper_cvtpd2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 }
 
 #if SHIFT == 1
-void helper_cvtss2sd(CPUX86State *env, Reg *d, Reg *s)
+void helper_cvtss2sd(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
+    int i;
     d->ZMM_D(0) = float32_to_float64(s->ZMM_S(0), &env->sse_status);
+    for (i = 1; i < 1 << SHIFT; i++) {
+        d->ZMM_Q(i) = v->ZMM_Q(i);
+    }
 }
 
-void helper_cvtsd2ss(CPUX86State *env, Reg *d, Reg *s)
+void helper_cvtsd2ss(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
+    int i;
     d->ZMM_S(0) = float64_to_float32(s->ZMM_D(0), &env->sse_status);
+    for (i = 1; i < 2 << SHIFT; i++) {
+        d->ZMM_L(i) = v->ZMM_L(i);
+    }
 }
 #endif
 
@@ -876,13 +892,17 @@ void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 }
 
 #if SHIFT == 1
-void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *v, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
+    int i;
     d->ZMM_S(0) = float32_div(float32_one,
                               float32_sqrt(s->ZMM_S(0), &env->sse_status),
                               &env->sse_status);
     set_float_exception_flags(old_flags, &env->sse_status);
+    for (i = 1; i < 2 << SHIFT; i++) {
+        d->ZMM_L(i) = v->ZMM_L(i);
+    }
 }
 #endif
 
@@ -897,10 +917,14 @@ void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 }
 
 #if SHIFT == 1
-void helper_rcpss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void helper_rcpss(CPUX86State *env, ZMMReg *d, ZMMReg *v, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
+    int i;
     d->ZMM_S(0) = float32_div(float32_one, s->ZMM_S(0), &env->sse_status);
+    for (i = 1; i < 2 << SHIFT; i++) {
+        d->ZMM_L(i) = v->ZMM_L(i);
+    }
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 #endif
@@ -1798,11 +1822,12 @@ void glue(helper_roundpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 }
 
 #if SHIFT == 1
-void glue(helper_roundss, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_roundss, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                   uint32_t mode)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     signed char prev_rounding_mode;
+    int i;
 
     prev_rounding_mode = env->sse_status.float_rounding_mode;
     if (!(mode & (1 << 2))) {
@@ -1823,6 +1848,9 @@ void glue(helper_roundss, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     }
 
     d->ZMM_S(0) = float32_round_to_int(s->ZMM_S(0), &env->sse_status);
+    for (i = 1; i < 2 << SHIFT; i++) {
+        d->ZMM_L(i) = v->ZMM_L(i);
+    }
 
     if (mode & (1 << 3) && !(old_flags & float_flag_inexact)) {
         set_float_exception_flags(get_float_exception_flags(&env->sse_status) &
@@ -1832,11 +1860,12 @@ void glue(helper_roundss, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     env->sse_status.float_rounding_mode = prev_rounding_mode;
 }
 
-void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                   uint32_t mode)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     signed char prev_rounding_mode;
+    int i;
 
     prev_rounding_mode = env->sse_status.float_rounding_mode;
     if (!(mode & (1 << 2))) {
@@ -1857,6 +1886,9 @@ void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     }
 
     d->ZMM_D(0) = float64_round_to_int(s->ZMM_D(0), &env->sse_status);
+    for (i = 1; i < 1 << SHIFT; i++) {
+        d->ZMM_Q(i) = v->ZMM_Q(i);
+    }
 
     if (mode & (1 << 3) && !(old_flags & float_flag_inexact)) {
         set_float_exception_flags(get_float_exception_flags(&env->sse_status) &
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index b60fe2f0d4..32ffa8445b 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -148,8 +148,8 @@ DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
     DEF_HELPER_4(name ## sd, void, env, Reg, Reg, Reg)
 #define SSE_HELPER_S3(name)                                             \
     SSE_HELPER_P3(name)                                                 \
-    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)                       \
-    DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
+    DEF_HELPER_4(name ## ss, void, env, Reg, Reg, Reg)                  \
+    DEF_HELPER_4(name ## sd, void, env, Reg, Reg, Reg)
 #else
 #define SSE_HELPER_S4(name, ...) SSE_HELPER_P4(name)
 #define SSE_HELPER_S3(name, ...) SSE_HELPER_P3(name)
@@ -179,8 +179,8 @@ DEF_HELPER_3(glue(cvttps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(cvttpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
 
 #if SHIFT == 1
-DEF_HELPER_3(cvtss2sd, void, env, Reg, Reg)
-DEF_HELPER_3(cvtsd2ss, void, env, Reg, Reg)
+DEF_HELPER_4(cvtss2sd, void, env, Reg, Reg, Reg)
+DEF_HELPER_4(cvtsd2ss, void, env, Reg, Reg, Reg)
 DEF_HELPER_3(cvtpi2ps, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtpi2pd, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtsi2ss, void, env, ZMMReg, i32)
@@ -214,8 +214,8 @@ DEF_HELPER_3(glue(rsqrtps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(rcpps, SUFFIX), void, env, ZMMReg, ZMMReg)
 
 #if SHIFT == 1
-DEF_HELPER_3(rsqrtss, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(rcpss, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_4(rsqrtss, void, env, ZMMReg, ZMMReg, ZMMReg)
+DEF_HELPER_4(rcpss, void, env, ZMMReg, ZMMReg, ZMMReg)
 DEF_HELPER_3(extrq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(extrq_i, void, env, ZMMReg, int, int)
 DEF_HELPER_3(insertq_r, void, env, ZMMReg, ZMMReg)
@@ -342,8 +342,8 @@ DEF_HELPER_3(glue(phminposuw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(roundps, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(roundpd, SUFFIX), void, env, Reg, Reg, i32)
 #if SHIFT == 1
-DEF_HELPER_4(roundss_xmm, void, env, Reg, Reg, i32)
-DEF_HELPER_4(roundsd_xmm, void, env, Reg, Reg, i32)
+DEF_HELPER_5(roundss_xmm, void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_5(roundsd_xmm, void, env, Reg, Reg, Reg, i32)
 #endif
 DEF_HELPER_5(glue(blendps, SUFFIX), void, env, Reg, Reg, Reg, i32)
 DEF_HELPER_5(glue(blendpd, SUFFIX), void, env, Reg, Reg, Reg, i32)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 8e3066d70a..e2c01af02d 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3011,6 +3011,9 @@ static bool first = true; static unsigned long limit;
 #define SSE_OP(sname, dname, op, flags) OP(op, flags, \
         gen_helper_##sname##_xmm, gen_helper_##dname##_xmm, NULL, NULL)
 
+#define SSE_OP_UNARY(a, b, c, d)       \
+    {SSE_OPF_SCALAR | SSE_OPF_V0, {{.op1 = a}, {.op1 = b}, {.op2 = c}, {.op2 = d} } }
+
 typedef union SSEFuncs {
     SSEFunc_0_epp op1;
     SSEFunc_0_ppi op1i;
@@ -3053,12 +3056,12 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x2f] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR | SSE_OPF_V0,
             gen_helper_comiss, gen_helper_comisd, NULL, NULL),
     [0x50] = SSE_SPECIAL, /* movmskps, movmskpd */
-    [0x51] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
+    [0x51] = SSE_OP_UNARY(
                 gen_helper_sqrtps_xmm, gen_helper_sqrtpd_xmm,
                 gen_helper_sqrtss, gen_helper_sqrtsd),
-    [0x52] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
+    [0x52] = SSE_OP_UNARY(
                 gen_helper_rsqrtps_xmm, NULL, gen_helper_rsqrtss, NULL),
-    [0x53] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
+    [0x53] = SSE_OP_UNARY(
                 gen_helper_rcpps_xmm, NULL, gen_helper_rcpss, NULL),
     [0x54] = SSE_OP(pand, pand, op2, 0), /* andps, andpd */
     [0x55] = SSE_OP(pandn, pandn, op2, 0), /* andnps, andnpd */
@@ -3066,9 +3069,9 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x57] = SSE_OP(pxor, pxor, op2, 0), /* xorps, xorpd */
     [0x58] = SSE_FOP(add),
     [0x59] = SSE_FOP(mul),
-    [0x5a] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
-                gen_helper_cvtps2pd_xmm, gen_helper_cvtpd2ps_xmm,
-                gen_helper_cvtss2sd, gen_helper_cvtsd2ss),
+    [0x5a] = SSE_OP_UNARY(
+                 gen_helper_cvtps2pd_xmm, gen_helper_cvtpd2ps_xmm,
+                 gen_helper_cvtss2sd, gen_helper_cvtsd2ss),
     [0x5b] = OP(op1, SSE_OPF_V0,
                 gen_helper_cvtdq2ps_xmm, gen_helper_cvtps2dq_xmm,
                 gen_helper_cvttps2dq_xmm, NULL),
@@ -3364,8 +3367,8 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
 static const struct SSEOpHelper_table7 sse_op_table7[256] = {
     [0x08] = UNARY_OP(roundps, SSE41, 0),
     [0x09] = UNARY_OP(roundpd, SSE41, 0),
-    [0x0a] = UNARY_OP(roundss, SSE41, SSE_OPF_SCALAR),
-    [0x0b] = UNARY_OP(roundsd, SSE41, SSE_OPF_SCALAR),
+    [0x0a] = BINARY_OP(roundss, SSE41, SSE_OPF_SCALAR),
+    [0x0b] = BINARY_OP(roundsd, SSE41, SSE_OPF_SCALAR),
     [0x0c] = BINARY_OP(blendps, SSE41, 0),
     [0x0d] = BINARY_OP(blendpd, SSE41, 0),
     [0x0e] = BINARY_OP(pblendw, SSE41, SSE_OPF_MMX),
@@ -4640,7 +4643,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 
         tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
         tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-        if (sse_op_flags & SSE_OPF_V0) {
+        if ((sse_op_flags & SSE_OPF_V0) &&
+            !((sse_op_flags & SSE_OPF_SCALAR) && b1 >= 2)) {
             if (sse_op_flags & SSE_OPF_SHUF) {
                 val = x86_ldub_code(env, s);
                 sse_op_fn.op1i(s->ptr0, s->ptr1, tcg_const_i32(val));
-- 
2.37.3


