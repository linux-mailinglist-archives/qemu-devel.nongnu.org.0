Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671595A91F1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:19:13 +0200 (CEST)
Received: from localhost ([::1]:58604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfPs-00050q-0U
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewn-0001Da-HE
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewk-00037L-QN
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k72TV+K/Thufd/Yx3ENU8lvxqNGUdXWu8n5j7+Wfsxc=;
 b=ERmQhVcUx2soxs6YbOlJ7WAsG55nUK669qF2JeFomFk3ly1Y+gznWIXi8oN41R3Asbcp0g
 lS0HB8XJwsvLF3wWHMDkCnBZxEvjdWuflgTzIMuyqEg8iU53Fft0nLFBEeuq5QWZ/kVamn
 fYAq+19guBl6pWLiYIzP2fYWoNi+VsI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-bjGepFA2MLW4HabLHA2lxA-1; Thu, 01 Sep 2022 03:49:05 -0400
X-MC-Unique: bjGepFA2MLW4HabLHA2lxA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h133-20020a1c218b000000b003a5fa79008bso887091wmh.5
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=k72TV+K/Thufd/Yx3ENU8lvxqNGUdXWu8n5j7+Wfsxc=;
 b=qg6ckKkoc9mvO/4z045ULIqbcrp2XockQjkNFvQ1zUwLLADW2VSw1PRbb2KSA5SEtc
 xSo8J8ydnkuCREdJB5mwrqzv9GC9LlRRCPrtB0ENWNkI4/n67d/RxO67PdtvhbjTwdS2
 NM7wRYb74MUZP/8vEyJ4k8AT/YWHkf76vTd4WSX3dzFHapihkIrpgJbSzSwPpI5s17nd
 Yx2sZZYbrHuIUC2QsF4eDiWflXr7+xQ1spu3JtNvkZrj92PvWGuDZ/c7xTgudMk5XVKH
 lfViqKLGd/10OudDsotbM+ITbR59EZKLO5YoxyWLoKo29vMnxRC1YITfgMvMQVSzg/5E
 KCRQ==
X-Gm-Message-State: ACgBeo2RylIZ3mQKDGkP9+alXpXoAZ1q+3B0YpSfpCYIdPt/C+IRc6sI
 Qfi2xIkqkQvZ8uy2+RNjTXH5i3V50SlS1ZoghlKYp/R+MqGjioLMUHlPRgg5Jn/iEvx2UHhEKIT
 bMWn8G2m7m4Cv7ZWLLQc0jIIkej0BD/PJQaDf3h80NXeqx8ge0UyT4Ih9sADrGfDcjmk=
X-Received: by 2002:a05:600c:3512:b0:3a5:e9d3:d418 with SMTP id
 h18-20020a05600c351200b003a5e9d3d418mr4322350wmq.0.1662018543346; 
 Thu, 01 Sep 2022 00:49:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5BnYjeJxoijHIXrlesxOAEvt4Kwy9Bamqj9rh5zsRq9aB+5kQDxNW5+eF41cZDXGKMO+JfdA==
X-Received: by 2002:a05:600c:3512:b0:3a5:e9d3:d418 with SMTP id
 h18-20020a05600c351200b003a5e9d3d418mr4322323wmq.0.1662018542843; 
 Thu, 01 Sep 2022 00:49:02 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a05600c511a00b003a643ac2b08sm4621481wms.8.2022.09.01.00.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 09/23] i386: Add size suffix to vector FP helpers
Date: Thu,  1 Sep 2022 09:48:28 +0200
Message-Id: <20220901074842.57424-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

For AVX we're going to need both 128 bit (xmm) and 256 bit (ymm) variants of
floating point helpers. Add the register type suffix to the existing
*PS and *PD helpers (SS and SD variants are only valid on 128 bit vectors)

No functional changes.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-15-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 48 ++++++++++++++++++------------------
 target/i386/ops_sse_header.h | 48 ++++++++++++++++++------------------
 target/i386/tcg/translate.c  | 37 +++++++++++++--------------
 3 files changed, 67 insertions(+), 66 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 8845b6d4cb..2c0090a647 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -537,7 +537,7 @@ void glue(helper_pshufw, SUFFIX)(Reg *d, Reg *s, int order)
     MOVE(*d, r);
 }
 #else
-void helper_shufps(Reg *d, Reg *s, int order)
+void glue(helper_shufps, SUFFIX)(Reg *d, Reg *s, int order)
 {
     Reg r;
 
@@ -548,7 +548,7 @@ void helper_shufps(Reg *d, Reg *s, int order)
     MOVE(*d, r);
 }
 
-void helper_shufpd(Reg *d, Reg *s, int order)
+void glue(helper_shufpd, SUFFIX)(Reg *d, Reg *s, int order)
 {
     Reg r;
 
@@ -598,7 +598,7 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
 /* XXX: not accurate */
 
 #define SSE_HELPER_S(name, F)                                           \
-    void helper_ ## name ## ps(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
     {                                                                   \
         d->ZMM_S(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
         d->ZMM_S(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
@@ -611,7 +611,7 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
         d->ZMM_S(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## pd(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
     {                                                                   \
         d->ZMM_D(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
         d->ZMM_D(1) = F(64, d->ZMM_D(1), s->ZMM_D(1));                  \
@@ -647,7 +647,7 @@ SSE_HELPER_S(sqrt, FPU_SQRT)
 
 
 /* float to float conversions */
-void helper_cvtps2pd(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtps2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     float32 s0, s1;
 
@@ -657,7 +657,7 @@ void helper_cvtps2pd(CPUX86State *env, Reg *d, Reg *s)
     d->ZMM_D(1) = float32_to_float64(s1, &env->sse_status);
 }
 
-void helper_cvtpd2ps(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtpd2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_S(0) = float64_to_float32(s->ZMM_D(0), &env->sse_status);
     d->ZMM_S(1) = float64_to_float32(s->ZMM_D(1), &env->sse_status);
@@ -675,7 +675,7 @@ void helper_cvtsd2ss(CPUX86State *env, Reg *d, Reg *s)
 }
 
 /* integer to float */
-void helper_cvtdq2ps(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtdq2ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     d->ZMM_S(0) = int32_to_float32(s->ZMM_L(0), &env->sse_status);
     d->ZMM_S(1) = int32_to_float32(s->ZMM_L(1), &env->sse_status);
@@ -683,7 +683,7 @@ void helper_cvtdq2ps(CPUX86State *env, Reg *d, Reg *s)
     d->ZMM_S(3) = int32_to_float32(s->ZMM_L(3), &env->sse_status);
 }
 
-void helper_cvtdq2pd(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_cvtdq2pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int32_t l0, l1;
 
@@ -760,7 +760,7 @@ WRAP_FLOATCONV(int64_t, float32_to_int64_round_to_zero, float32, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float64_to_int64, float64, INT64_MIN)
 WRAP_FLOATCONV(int64_t, float64_to_int64_round_to_zero, float64, INT64_MIN)
 
-void helper_cvtps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_cvtps2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_L(0) = x86_float32_to_int32(s->ZMM_S(0), &env->sse_status);
     d->ZMM_L(1) = x86_float32_to_int32(s->ZMM_S(1), &env->sse_status);
@@ -768,7 +768,7 @@ void helper_cvtps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     d->ZMM_L(3) = x86_float32_to_int32(s->ZMM_S(3), &env->sse_status);
 }
 
-void helper_cvtpd2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_cvtpd2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_L(0) = x86_float64_to_int32(s->ZMM_D(0), &env->sse_status);
     d->ZMM_L(1) = x86_float64_to_int32(s->ZMM_D(1), &env->sse_status);
@@ -810,7 +810,7 @@ int64_t helper_cvtsd2sq(CPUX86State *env, ZMMReg *s)
 #endif
 
 /* float to integer truncated */
-void helper_cvttps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_cvttps2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_L(0) = x86_float32_to_int32_round_to_zero(s->ZMM_S(0), &env->sse_status);
     d->ZMM_L(1) = x86_float32_to_int32_round_to_zero(s->ZMM_S(1), &env->sse_status);
@@ -818,7 +818,7 @@ void helper_cvttps2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     d->ZMM_L(3) = x86_float32_to_int32_round_to_zero(s->ZMM_S(3), &env->sse_status);
 }
 
-void helper_cvttpd2dq(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_cvttpd2dq, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_L(0) = x86_float64_to_int32_round_to_zero(s->ZMM_D(0), &env->sse_status);
     d->ZMM_L(1) = x86_float64_to_int32_round_to_zero(s->ZMM_D(1), &env->sse_status);
@@ -859,7 +859,7 @@ int64_t helper_cvttsd2sq(CPUX86State *env, ZMMReg *s)
 }
 #endif
 
-void helper_rsqrtps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_rsqrtps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     d->ZMM_S(0) = float32_div(float32_one,
@@ -886,7 +886,7 @@ void helper_rsqrtss(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     set_float_exception_flags(old_flags, &env->sse_status);
 }
 
-void helper_rcpps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_rcpps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     uint8_t old_flags = get_float_exception_flags(&env->sse_status);
     d->ZMM_S(0) = float32_div(float32_one, s->ZMM_S(0), &env->sse_status);
@@ -947,7 +947,7 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
     d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), index, length);
 }
 
-void helper_haddps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_haddps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     ZMMReg r;
 
@@ -958,7 +958,7 @@ void helper_haddps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     MOVE(*d, r);
 }
 
-void helper_haddpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_haddpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     ZMMReg r;
 
@@ -967,7 +967,7 @@ void helper_haddpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     MOVE(*d, r);
 }
 
-void helper_hsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_hsubps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     ZMMReg r;
 
@@ -978,7 +978,7 @@ void helper_hsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     MOVE(*d, r);
 }
 
-void helper_hsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     ZMMReg r;
 
@@ -987,7 +987,7 @@ void helper_hsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     MOVE(*d, r);
 }
 
-void helper_addsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_addsubps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_S(0) = float32_sub(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
     d->ZMM_S(1) = float32_add(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
@@ -995,7 +995,7 @@ void helper_addsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     d->ZMM_S(3) = float32_add(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
 }
 
-void helper_addsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
+void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
     d->ZMM_D(0) = float64_sub(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
     d->ZMM_D(1) = float64_add(d->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
@@ -1003,7 +1003,7 @@ void helper_addsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 
 /* XXX: unordered */
 #define SSE_HELPER_CMP(name, F)                                         \
-    void helper_ ## name ## ps(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
     {                                                                   \
         d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
         d->ZMM_L(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
@@ -1016,7 +1016,7 @@ void helper_addsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
         d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## pd(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
     {                                                                   \
         d->ZMM_Q(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
         d->ZMM_Q(1) = F(64, d->ZMM_D(1), s->ZMM_D(1));                  \
@@ -1099,7 +1099,7 @@ void helper_comisd(CPUX86State *env, Reg *d, Reg *s)
     CC_SRC = comis_eflags[ret + 1];
 }
 
-uint32_t helper_movmskps(CPUX86State *env, Reg *s)
+uint32_t glue(helper_movmskps, SUFFIX)(CPUX86State *env, Reg *s)
 {
     int b0, b1, b2, b3;
 
@@ -1110,7 +1110,7 @@ uint32_t helper_movmskps(CPUX86State *env, Reg *s)
     return b0 | (b1 << 1) | (b2 << 2) | (b3 << 3);
 }
 
-uint32_t helper_movmskpd(CPUX86State *env, Reg *s)
+uint32_t glue(helper_movmskpd, SUFFIX)(CPUX86State *env, Reg *s)
 {
     int b0, b1;
 
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index cef28f2aae..fc697536a0 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -122,8 +122,8 @@ DEF_HELPER_2(glue(movq_mm_T0, SUFFIX), void, Reg, i64)
 #if SHIFT == 0
 DEF_HELPER_3(glue(pshufw, SUFFIX), void, Reg, Reg, int)
 #else
-DEF_HELPER_3(shufps, void, Reg, Reg, int)
-DEF_HELPER_3(shufpd, void, Reg, Reg, int)
+DEF_HELPER_3(glue(shufps, SUFFIX), void, Reg, Reg, int)
+DEF_HELPER_3(glue(shufpd, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshufd, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshuflw, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
@@ -134,9 +134,9 @@ DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 /* XXX: not accurate */
 
 #define SSE_HELPER_S(name, F)                            \
-    DEF_HELPER_3(name ## ps, void, env, Reg, Reg)        \
+    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)        \
     DEF_HELPER_3(name ## ss, void, env, Reg, Reg)        \
-    DEF_HELPER_3(name ## pd, void, env, Reg, Reg)        \
+    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)        \
     DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
 
 SSE_HELPER_S(add, FPU_ADD)
@@ -148,12 +148,12 @@ SSE_HELPER_S(max, FPU_MAX)
 SSE_HELPER_S(sqrt, FPU_SQRT)
 
 
-DEF_HELPER_3(cvtps2pd, void, env, Reg, Reg)
-DEF_HELPER_3(cvtpd2ps, void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvtps2pd, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvtpd2ps, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(cvtss2sd, void, env, Reg, Reg)
 DEF_HELPER_3(cvtsd2ss, void, env, Reg, Reg)
-DEF_HELPER_3(cvtdq2ps, void, env, Reg, Reg)
-DEF_HELPER_3(cvtdq2pd, void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvtdq2ps, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(cvtdq2pd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(cvtpi2ps, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtpi2pd, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtsi2ss, void, env, ZMMReg, i32)
@@ -164,8 +164,8 @@ DEF_HELPER_3(cvtsq2ss, void, env, ZMMReg, i64)
 DEF_HELPER_3(cvtsq2sd, void, env, ZMMReg, i64)
 #endif
 
-DEF_HELPER_3(cvtps2dq, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(cvtpd2dq, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvtps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvtpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(cvtps2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_3(cvtpd2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_2(cvtss2si, s32, env, ZMMReg)
@@ -175,8 +175,8 @@ DEF_HELPER_2(cvtss2sq, s64, env, ZMMReg)
 DEF_HELPER_2(cvtsd2sq, s64, env, ZMMReg)
 #endif
 
-DEF_HELPER_3(cvttps2dq, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(cvttpd2dq, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvttps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvttpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(cvttps2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_3(cvttpd2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_2(cvttss2si, s32, env, ZMMReg)
@@ -186,25 +186,25 @@ DEF_HELPER_2(cvttss2sq, s64, env, ZMMReg)
 DEF_HELPER_2(cvttsd2sq, s64, env, ZMMReg)
 #endif
 
-DEF_HELPER_3(rsqrtps, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(rsqrtps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(rsqrtss, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(rcpps, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(rcpps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(rcpss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(extrq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(extrq_i, void, env, ZMMReg, int, int)
 DEF_HELPER_3(insertq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(insertq_i, void, env, ZMMReg, int, int)
-DEF_HELPER_3(haddps, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(haddpd, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(hsubps, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(hsubpd, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(addsubps, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(addsubpd, void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(haddps, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(haddpd, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(hsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(hsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(addsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(addsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
 
 #define SSE_HELPER_CMP(name, F)                           \
-    DEF_HELPER_3(name ## ps, void, env, Reg, Reg)         \
+    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
     DEF_HELPER_3(name ## ss, void, env, Reg, Reg)         \
-    DEF_HELPER_3(name ## pd, void, env, Reg, Reg)         \
+    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)         \
     DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
 
 SSE_HELPER_CMP(cmpeq, FPU_CMPEQ)
@@ -220,8 +220,8 @@ DEF_HELPER_3(ucomiss, void, env, Reg, Reg)
 DEF_HELPER_3(comiss, void, env, Reg, Reg)
 DEF_HELPER_3(ucomisd, void, env, Reg, Reg)
 DEF_HELPER_3(comisd, void, env, Reg, Reg)
-DEF_HELPER_2(movmskps, i32, env, Reg)
-DEF_HELPER_2(movmskpd, i32, env, Reg)
+DEF_HELPER_2(glue(movmskps, SUFFIX), i32, env, Reg)
+DEF_HELPER_2(glue(movmskpd, SUFFIX), i32, env, Reg)
 #endif
 
 DEF_HELPER_2(glue(pmovmskb, SUFFIX), i32, efine SSE_FOP(name) OP(op1, SSE_OPF_SCALAR, \
-        gen_helper_##name##ps, gen_helper_##name##pd, \
+        gen_helper_##name##ps##_xmm, gen_helper_##name##pd##_xmm, \
         gen_helper_##name##ss, gen_helper_##name##sd)
 #define SSE_OP(sname, dname, op, flags) OP(op, flags, \
         gen_helper_##sname##_xmm, gen_helper_##dname##_xmm, NULL, NULL)
@@ -2843,12 +2843,12 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
             gen_helper_comiss, gen_helper_comisd, NULL, NULL),
     [0x50] = SSE_SPECIAL, /* movmskps, movmskpd */
     [0x51] = OP(op1, SSE_OPF_SCALAR,
-                gen_helper_sqrtps, gen_helper_sqrtpd,
+                gen_helper_sqrtps_xmm, gen_helper_sqrtpd_xmm,
                 gen_helper_sqrtss, gen_helper_sqrtsd),
     [0x52] = OP(op1, SSE_OPF_SCALAR,
-                gen_helper_rsqrtps, NULL, gen_helper_rsqrtss, NULL),
+                gen_helper_rsqrtps_xmm, NULL, gen_helper_rsqrtss, NULL),
     [0x53] = OP(op1, SSE_OPF_SCALAR,
-                gen_helper_rcpps, NULL, gen_helper_rcpss, NULL),
+                gen_helper_rcpps_xmm, NULL, gen_helper_rcpss, NULL),
     [0x54] = SSE_OP(pand, pand, op1, 0), /* andps, andpd */
     [0x55] = SSE_OP(pandn, pandn, op1, 0), /* andnps, andnpd */
     [0x56] = SSE_OP(por, por, op1, 0), /* orps, orpd */
@@ -2856,19 +2856,19 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x58] = SSE_FOP(add),
     [0x59] = SSE_FOP(mul),
     [0x5a] = OP(op1, SSE_OPF_SCALAR,
-                gen_helper_cvtps2pd, gen_helper_cvtpd2ps,
+                gen_helper_cvtps2pd_xmm, gen_helper_cvtpd2ps_xmm,
                 gen_helper_cvtss2sd, gen_helper_cvtsd2ss),
     [0x5b] = OP(op1, 0,
-                gen_helper_cvtdq2ps, gen_helper_cvtps2dq,
-                gen_helper_cvttps2dq, NULL),
+                gen_helper_cvtdq2ps_xmm, gen_helper_cvtps2dq_xmm,
+                gen_helper_cvttps2dq_xmm, NULL),
     [0x5c] = SSE_FOP(sub),
     [0x5d] = SSE_FOP(min),
     [0x5e] = SSE_FOP(div),
     [0x5f] = SSE_FOP(max),
 
     [0xc2] = SSE_FOP(cmpeq), /* sse_op_table4 */
-    [0xc6] = OP(dummy, SSE_OPF_SHUF, (SSEFunc_0_epp)gen_helper_shufps,
-                (SSEFunc_0_epp)gen_helper_shufpd, NULL, NULL),
+    [0xc6] = OP(dummy, SSE_OPF_SHUF, (SSEFunc_0_epp)gen_helper_shufps_xmm,
+                (SSEFunc_0_epp)gen_helper_shufpd_xmm, NULL, NULL),
 
     /* SSSE3, SSE4, MOVBE, CRC32, BMI1, BMI2, ADX.  */
     [0x38] = SSE_SPECIAL,
@@ -2909,15 +2909,15 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x79] = OP(op1, 0,
             NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r),
     [0x7c] = OP(op1, 0,
-                NULL, gen_helper_haddpd, NULL, gen_helper_haddps),
+                NULL, gen_helper_haddpd_xmm, NULL, gen_helper_haddps_xmm),
     [0x7d] = OP(op1, 0,
-                NULL, gen_helper_hsubpd, NULL, gen_helper_hsubps),
+                NULL, gen_helper_hsubpd_xmm, NULL, gen_helper_hsubps_xmm),
     [0x7e] = SSE_SPECIAL, /* movd, movd, , movq */
     [0x7f] = SSE_SPECIAL, /* movq, movdqa, movdqu */
     [0xc4] = SSE_SPECIAL, /* pinsrw */
     [0xc5] = SSE_SPECIAL, /* pextrw */
     [0xd0] = OP(op1, 0,
-                NULL, gen_helper_addsubpd, NULL, gen_helper_addsubps),
+                NULL, gen_helper_addsubpd_xmm, NULL, gen_helper_addsubps_xmm),
     [0xd1] = MMX_OP(psrlw),
     [0xd2] = MMX_OP(psrld),
     [0xd3] = MMX_OP(psrlq),
@@ -2940,8 +2940,8 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0xe4] = MMX_OP(pmulhuw),
     [0xe5] = MMX_OP(pmulhw),
     [0xe6] = OP(op1, 0,
-            NULL, gen_helper_cvttpd2dq,
-            gen_helper_cvtdq2pd, gen_helper_cvtpd2dq),
+            NULL, gen_helper_cvttpd2dq_xmm,
+            gen_helper_cvtdq2pd_xmm, gen_helper_cvtpd2dq_xmm),
     [0xe7] = SSE_SPECIAL,  /* movntq, movntq */
     [0xe8] = MMX_OP(psubsb),
     [0xe9] = MMX_OP(psubsw),
@@ -3018,8 +3018,9 @@ static const SSEFunc_l_ep sse_op_table3bq[] = {
 };
 #endif
 
-#define SSE_FOP(x) { gen_helper_ ## x ## ps, gen_helper_ ## x ## pd, \
-                     gen_helper_ ## x ## ss, gen_helper_ ## x ## sd, }
+#define SSE_FOP(x) { \
+    gen_helper_ ## x ## ps ## _xmm, gen_helper_ ## x ## pd ## _xmm, \
+    gen_helper_ ## x ## ss, gen_helper_ ## x ## sd}
 static const SSEFunc_0_epp sse_op_table4[8][4] = {
     SSE_FOP(cmpeq),
     SSE_FOP(cmplt),
@@ -3636,13 +3637,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x050: /* movmskps */
             rm = (modrm & 7) | REX_B(s);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
-            gen_helper_movmskps(s->tmp2_i32, cpu_env, s->ptr0);
+            gen_helper_movmskps_xmm(s->tmp2_i32, cpu_env, s->ptr0);
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
         case 0x150: /* movmskpd */
             rm = (modrm & 7) | REX_B(s);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, ZMM_OFFSET(rm));
-            gen_helper_movmskpd(s->tmp2_i32, cpu_env, s->ptr0);
+            gen_helper_movmskpd_xmm(s->tmp2_i32, cpu_env, s->ptr0);
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
         case 0x02a: /* cvtpi2ps */
-- 
2.37.1



