Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A45B51DB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:22:37 +0200 (CEST)
Received: from localhost ([::1]:37136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWHc-0008Hp-GB
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0w-0000oC-6Z
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0o-0007Db-8r
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vhx48BDGTwt0Ckz35BjzQ0EMK6AFnYOJEU23RYLW1fY=;
 b=VXREgcNnXu3QUxm6qGExW09VeMeWO1J5NHdJNKo/mWCCpC62OWNMR1HOYTqi8m2Vr96EDe
 q9FjyY/y/7w2+X+ARJ0cOnHsrEwFkj3TWMp97d3gkuhjijbTyfDqQUTNo7mgyUspQ4KO6R
 Ntl4k0uxcbniZFbdn/nwIYbZOnTyt10=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-BX6ZHfrMM3CBsgn4LL7dxA-1; Sun, 11 Sep 2022 19:05:12 -0400
X-MC-Unique: BX6ZHfrMM3CBsgn4LL7dxA-1
Received: by mail-ej1-f70.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso503454ejb.5
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Vhx48BDGTwt0Ckz35BjzQ0EMK6AFnYOJEU23RYLW1fY=;
 b=h+02vmhG8ZboHG3yk51Cvg/PqUxLKS6epY9OG8aL0jLRj6aqPdUOe6S8IVkY6ahz06
 Z+BV8DYwn/1yAUxh5gMeGfr2iC6b7pLkNRUWhY0wSi43wrQpi8tIYO6QELwLuiLU9uas
 zuLPyIanjJdbM8qlowEdm8cjkwot53EPRy72BjA8on/sb0lvrpvtlmJ4DP1wOD75DIt0
 PyQ1E2aaa7xH4G6zj0OwYbbXJW1Pm/UUj5jWO3BKAq23WEqs9WVvTM93dQEcbOjJRy1W
 JeE1UhPEPdeQ/St0F6eu7bYhCbPZhrvsEoEjNB/YIsWArRxgm3y6dET4I8P1MnftSfbG
 yrLg==
X-Gm-Message-State: ACgBeo1gZcrF9AneQ1YQKji8R5VKTd7ToEx9/FxUc8QbyLRzFeWK1mws
 IPwphmVhER6CwvluxgWBLQsi2bKr0oWRhWntEAsI++Ywd2yNJ6+XswhF8ZgU1tkCG7F7F3m4rMx
 7jMt83IxmketBakLUSeWaeH00LC1NVRpP2SMZUfw/VZRpANSUzeD9NEJOxuJgA9vg/dc=
X-Received: by 2002:a17:907:d07:b0:72e:ec79:ad0f with SMTP id
 gn7-20020a1709070d0700b0072eec79ad0fmr17127947ejc.296.1662937510181; 
 Sun, 11 Sep 2022 16:05:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6evu6VMIqemb0iDTJMZXEampMiWcUUmD7GXWHXhh0JMbwi2O+/oFuBLTXT7Z2iZXQX1SMgog==
X-Received: by 2002:a17:907:d07:b0:72e:ec79:ad0f with SMTP id
 gn7-20020a1709070d0700b0072eec79ad0fmr17127919ejc.296.1662937509115; 
 Sun, 11 Sep 2022 16:05:09 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a50c34a000000b0044838efb8f8sm4669624edb.25.2022.09.11.16.05.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/37] target/i386: extend helpers to support VEX.V 3- and 4-
 operand encodings
Date: Mon, 12 Sep 2022 01:03:55 +0200
Message-Id: <20220911230418.340941-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Add to the helpers all the operands that are needed to implement AVX.

Extracted from a patch by Paul Brook <paul@nowt.org>.

Message-Id: <20220424220204.2493824-26-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 173 +++++++++++++--------------------
 target/i386/ops_sse_header.h | 149 ++++++++++++++--------------
 target/i386/tcg/translate.c  | 181 ++++++++++++++++++++++++-----------
 3 files changed, 265 insertions(+), 238 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index c0766de18d..fb8733f509 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -48,9 +48,8 @@
 #define FPSLL(x, c) ((x) << shift)
 #endif
 
-void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 15) {
         for (int i = 0; i < 1 << SHIFT; i++) {
@@ -64,9 +63,8 @@ void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_psllw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psllw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 15) {
         for (int i = 0; i < 1 << SHIFT; i++) {
@@ -80,9 +78,8 @@ void glue(helper_psllw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_psraw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psraw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 15) {
         shift = 15;
@@ -94,9 +91,8 @@ void glue(helper_psraw, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_psrld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psrld, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 31) {
         for (int i = 0; i < 1 << SHIFT; i++) {
@@ -110,9 +106,8 @@ void glue(helper_psrld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_pslld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_pslld, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 31) {
         for (int i = 0; i < 1 << SHIFT; i++) {
@@ -126,9 +121,8 @@ void glue(helper_pslld, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_psrad, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psrad, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 31) {
         shift = 31;
@@ -140,9 +134,8 @@ void glue(helper_psrad, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_psrlq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psrlq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 63) {
         for (int i = 0; i < 1 << SHIFT; i++) {
@@ -156,9 +149,8 @@ void glue(helper_psrlq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_psllq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psllq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift;
     if (c->Q(0) > 63) {
         for (int i = 0; i < 1 << SHIFT; i++) {
@@ -173,9 +165,8 @@ void glue(helper_psllq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 }
 
 #if SHIFT >= 1
-void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift, i, j;
 
     shift = c->L(0);
@@ -192,9 +183,8 @@ void glue(helper_psrldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 }
 
-void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
+void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, Reg *c)
 {
-    Reg *s = d;
     int shift, i, j;
 
     shift = c->L(0);
@@ -222,9 +212,8 @@ void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
     }
 
 #define SSE_HELPER_2(name, elem, num, F)                        \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)   \
     {                                                           \
-        Reg *v = d;                                             \
         int n = num;                                            \
         for (int i = 0; i < n; i++) {                           \
             d->elem(i) = F(v->elem(i), s->elem(i));             \
@@ -362,18 +351,24 @@ SSE_HELPER_W(helper_pcmpeqw, FCMPEQ)
 SSE_HELPER_L(helper_pcmpeql, FCMPEQ)
 
 SSE_HELPER_W(helper_pmullw, FMULLW)
-#if SHIFT == 0
-SSE_HELPER_W(helper_pmulhrw, FMULHRW)
-#endif
 SSE_HELPER_W(helper_pmulhuw, FMULHUW)
 SSE_HELPER_W(helper_pmulhw, FMULHW)
 
+#if SHIFT == 0
+void glue(helper_pmulhrw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->W(0) = FMULHRW(d->W(0), s->W(0));
+    d->W(1) = FMULHRW(d->W(1), s->W(1));
+    d->W(2) = FMULHRW(d->W(2), s->W(2));
+    d->W(3) = FMULHRW(d->W(3), s->W(3));
+}
+#endif
+
 SSE_HELPER_B(helper_pavgb, FAVG)
 SSE_HELPER_W(helper_pavgw, FAVG)
 
-void glue(helper_pmuludq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pmuludq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     int i;
 
     for (i = 0; i < (1 << SHIFT); i++) {
@@ -381,9 +376,8 @@ void glue(helper_pmuludq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }
 }
 
-void glue(helper_pmaddwd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pmaddwd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     int i;
 
     for (i = 0; i < (2 << SHIFT); i++) {
@@ -402,10 +396,8 @@ static inline int abs1(int a)
     }
 }
 #endif
-
-void glue(helper_psadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_psadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     int i;
 
     for (i = 0; i < (1 << SHIFT); i++) {
@@ -478,9 +470,8 @@ void glue(helper_pshufw, SUFFIX)(Reg *d, Reg *s, int order)
     SHUFFLE4(W, s, s, 0);
 }
 #else
-void glue(helper_shufps, SUFFIX)(Reg *d, Reg *s, int order)
+void glue(helper_shufps, SUFFIX)(Reg *d, Reg *v, Reg *s, int order)
 {
-    Reg *v = d;
     uint32_t r0, r1, r2, r3;
     int i;
 
@@ -489,9 +480,8 @@ void glue(helper_shufps, SUFFIX)(Reg *d, Reg *s, int order)
     }
 }
 
-void glue(helper_shufpd, SUFFIX)(Reg *d, Reg *s, int order)
+void glue(helper_shufpd, SUFFIX)(Reg *d, Reg *v, Reg *s, int order)
 {
-    Reg *v = d;
     uint64_t r0, r1;
     int i;
 
@@ -543,9 +533,8 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
 
 #define SSE_HELPER_P(name, F)                                           \
     void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
-            Reg *d, Reg *s)                                             \
+            Reg *d, Reg *v, Reg *s)                                     \
     {                                                                   \
-        Reg *v = d;                                                     \
         int i;                                                          \
         for (i = 0; i < 2 << SHIFT; i++) {                              \
             d->ZMM_S(i) = F(32, v->ZMM_S(i), s->ZMM_S(i));              \
@@ -553,9 +542,8 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
     }                                                                   \
                                                                         \
     void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env,          \
-            Reg *d, Reg *s)                                     \
+            Reg *d, Reg *v, Reg *s)                                     \
     {                                                                   \
-        Reg *v = d;                                                     \
         int i;                                                          \
         for (i = 0; i < 1 << SHIFT; i++) {                              \
             d->ZMM_D(i) = F(64, v->ZMM_D(i), s->ZMM_D(i));              \
@@ -567,15 +555,13 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
 #define SSE_HELPER_S(name, F)                                           \
     SSE_HELPER_P(name, F)                                               \
                                                                         \
-    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)\
+    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *v, Reg *s)\
     {                                                                   \
-        Reg *v = d;                                                     \
         d->ZMM_S(0) = F(32, v->ZMM_S(0), s->ZMM_S(0));                  \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)\
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *v, Reg *s)\
     {                                                                   \
-        Reg *v = d;                                                     \
         d->ZMM_D(0) = F(64, v->ZMM_D(0), s->ZMM_D(0));                  \
     }
 
@@ -958,9 +944,8 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
 #endif
 
 #define SSE_HELPER_HPS(name, F)  \
-void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
 {                                                                 \
-    Reg *v = d;                                                   \
     float32 r[2 << SHIFT];                                        \
     int i, j, k;                                                  \
     for (k = 0; k < 2 << SHIFT; k += LANE_WIDTH / 4) {            \
@@ -980,9 +965,8 @@ SSE_HELPER_HPS(haddps, float32_add)
 SSE_HELPER_HPS(hsubps, float32_sub)
 
 #define SSE_HELPER_HPD(name, F)  \
-void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
 {                                                                 \
-    Reg *v = d;                                                   \
     float64 r[1 << SHIFT];                                        \
     int i, j, k;                                                  \
     for (k = 0; k < 1 << SHIFT; k += LANE_WIDTH / 8) {            \
@@ -1001,9 +985,8 @@ void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
 SSE_HELPER_HPD(haddpd, float64_add)
 SSE_HELPER_HPD(hsubpd, float64_sub)
 
-void glue(helper_addsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_addsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     int i;
     for (i = 0; i < 2 << SHIFT; i += 2) {
         d->ZMM_S(i) = float32_sub(v->ZMM_S(i), s->ZMM_S(i), &env->sse_status);
@@ -1011,9 +994,8 @@ void glue(helper_addsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }
 }
 
-void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     int i;
     for (i = 0; i < 1 << SHIFT; i += 2) {
         d->ZMM_D(i) = float64_sub(v->ZMM_D(i), s->ZMM_D(i), &env->sse_status);
@@ -1023,9 +1005,8 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 
 #define SSE_HELPER_CMP_P(name, F, C)                                    \
     void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
-                                             Reg *d, Reg *s)    \
+                                             Reg *d, Reg *v, Reg *s)    \
     {                                                                   \
-        Reg *v = d;                                                     \
         int i;                                                          \
         for (i = 0; i < 2 << SHIFT; i++) {                              \
             d->ZMM_L(i) = C(F(32, v->ZMM_S(i), s->ZMM_S(i))) ? -1 : 0;  \
@@ -1033,9 +1014,8 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }                                                                   \
                                                                         \
     void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env,          \
-                                             Reg *d, Reg *s)    \
+                                             Reg *d, Reg *v, Reg *s)    \
     {                                                                   \
-        Reg *v = d;                                                     \
         int i;                                                          \
         for (i = 0; i < 1 << SHIFT; i++) {                              \
             d->ZMM_Q(i) = C(F(64, v->ZMM_D(i), s->ZMM_D(i))) ? -1 : 0;  \
@@ -1045,15 +1025,13 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #if SHIFT == 1
 #define SSE_HELPER_CMP(name, F, C)                                          \
     SSE_HELPER_CMP_P(name, F, C)                                            \
-    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)    \
+    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *v, Reg *s)    \
     {                                                                       \
-        Reg *v = d;                                                         \
         d->ZMM_L(0) = C(F(32, v->ZMM_S(0), s->ZMM_S(0))) ? -1 : 0;          \
     }                                                                       \
                                                                             \
-    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)    \
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *v, Reg *s)    \
     {                                                                       \
-        Reg *v = d;                                                         \
         d->ZMM_Q(0) = C(F(64, v->ZMM_D(0), s->ZMM_D(0))) ? -1 : 0;          \
     }
 
@@ -1179,9 +1157,8 @@ uint32_t glue(helper_pmovmskb, SUFFIX)(CPUX86State *env, Reg *s)
 
 #define PACK_HELPER_B(name, F) \
 void glue(helper_pack ## name, SUFFIX)(CPUX86State *env,      \
-        Reg *d, Reg *s)                                       \
+        Reg *d, Reg *v, Reg *s)                               \
 {                                                             \
-    Reg *v = d;                                               \
     uint8_t r[PACK_WIDTH * 2];                                \
     int j, k;                                                 \
     for (j = 0; j < 4 << SHIFT; j += PACK_WIDTH) {            \
@@ -1200,9 +1177,8 @@ void glue(helper_pack ## name, SUFFIX)(CPUX86State *env,      \
 PACK_HELPER_B(sswb, satsb)
 PACK_HELPER_B(uswb, satub)
 
-void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     uint16_t r[PACK_WIDTH];
     int j, k;
 
@@ -1222,9 +1198,8 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #define UNPCK_OP(base_name, base)                                    \
-        Reg *v = d;                                                     \
         uint8_t r[PACK_WIDTH * 2];                                      \
         int j, i;                                                       \
                                                                         \
@@ -1241,9 +1216,8 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## wd, SUFFIX)(CPUX86State *env,\
-                                                Reg *d, Reg *s) \
+                                                Reg *d, Reg *v, Reg *s) \
     {                                                                   \
-        Reg *v = d;                                                     \
         uint16_t r[PACK_WIDTH];                                         \
         int j, i;                                                       \
                                                                         \
@@ -1260,9 +1234,8 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## dq, SUFFIX)(CPUX86State *env,\
-                                                Reg *d, Reg *s) \
+                                                Reg *d, Reg *v, Reg *s) \
     {                                                                   \
-        Reg *v = d;                                                     \
         uint32_t r[PACK_WIDTH / 2];                                     \
         int j, i;                                                       \
                                                                         \
@@ -1280,9 +1253,8 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
                                                                         \
     XMM_ONLY(                                                           \
              void glue(helper_punpck ## base_name ## qdq, SUFFIX)(      \
-                        CPUX86State *env, Reg *d, Reg *s)       \
+                        CPUX86State *env, Reg *d, Reg *v, Reg *s)       \
              {                                                          \
-                 Reg *v = d;                                            \
                  uint64_t r[2];                                         \
                  int i;                                                 \
                                                                         \
@@ -1453,9 +1425,8 @@ void helper_pswapd(CPUX86State *env, MMXReg *d, MMXReg *s)
 #endif
 
 /* SSSE3 op helpers */
-void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     int i;
 #if SHIFT == 0
     uint8_t r[8];
@@ -1480,9 +1451,8 @@ void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 }
 
 #define SSE_HELPER_HW(name, F)  \
-void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
 {                                                          \
-    Reg *v = d;                                            \
     uint16_t r[4 << SHIFT];                                \
     int i, j, k;                                           \
     for (k = 0; k < 4 << SHIFT; k += LANE_WIDTH / 2) {     \
@@ -1499,9 +1469,8 @@ void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
 }
 
 #define SSE_HELPER_HL(name, F)  \
-void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s) \
 {                                                          \
-    Reg *v = d;                                            \
     uint32_t r[2 << SHIFT];                                \
     int i, j, k;                                           \
     for (k = 0; k < 2 << SHIFT; k += LANE_WIDTH / 4) {     \
@@ -1527,9 +1496,8 @@ SSE_HELPER_HL(phsubd, FSUB)
 #undef SSE_HELPER_HW
 #undef SSE_HELPER_HL
 
-void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     int i;
     for (i = 0; i < 4 << SHIFT; i++) {
         d->W(i) = satsw((int8_t)s->B(i * 2) * (uint8_t)v->B(i * 2) +
@@ -1554,10 +1522,9 @@ SSE_HELPER_B(helper_psignb, FSIGNB)
 SSE_HELPER_W(helper_psignw, FSIGNW)
 SSE_HELPER_L(helper_psignd, FSIGNL)
 
-void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                   int32_t shift)
 {
-    Reg *v = d;
     int i;
 
     /* XXX could be checked during translation */
@@ -1594,10 +1561,9 @@ void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #if SHIFT >= 1
 
 #define SSE_HELPER_V(name, elem, num, F)                                \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,   \
+                            Reg *m)                                     \
     {                                                                   \
-        Reg *v = d;                                                     \
-        Reg *m = &env->xmm_regs[0];                                     \
         int i;                                                          \
         for (i = 0; i < num; i++) {                                     \
             d->elem(i) = F(v->elem(i), s->elem(i), m->elem(i));         \
@@ -1605,10 +1571,9 @@ void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     }
 
 #define SSE_HELPER_I(name, elem, num, F)                                \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,   \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,   \
                             uint32_t imm)                               \
     {                                                                   \
-        Reg *v = d;                                                     \
         int i;                                                          \
         for (i = 0; i < num; i++) {                                     \
             int j = i & 7;                                              \
@@ -1660,9 +1625,8 @@ SSE_HELPER_F(helper_pmovzxwq, Q, 1 << SHIFT, s->W)
 SSE_HELPER_F(helper_pmovzxdq, Q, 1 << SHIFT, s->L)
 #endif
 
-void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     int i;
 
     for (i = 0; i < 1 << SHIFT; i++) {
@@ -1673,9 +1637,8 @@ void glue(helper_pmuldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 #define FCMPEQQ(d, s) (d == s ? -1 : 0)
 SSE_HELPER_Q(helper_pcmpeqq, FCMPEQQ)
 
-void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    Reg *v = d;
     uint16_t r[8];
     int i, j, k;
 
@@ -1893,10 +1856,9 @@ SSE_HELPER_I(helper_blendps, L, 2 << SHIFT, FBLENDP)
 SSE_HELPER_I(helper_blendpd, Q, 1 << SHIFT, FBLENDP)
 SSE_HELPER_I(helper_pblendw, W, 4 << SHIFT, FBLENDP)
 
-void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                uint32_t mask)
 {
-    Reg *v = d;
     float32 prod1, prod2, temp2, temp3, temp4;
     int i;
 
@@ -1939,9 +1901,8 @@ void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #if SHIFT == 1
 /* Oddly, there is no ymm version of dppd */
 void glue(helper_dppd, SUFFIX)(CPUX86State *env,
-                               Reg *d, Reg *s, uint32_t mask)
+                               Reg *d, Reg *v, Reg *s, uint32_t mask)
 {
-    Reg *v = d;
     float64 prod1, prod2, temp2;
 
     if (mask & (1 << 4)) {
@@ -1960,10 +1921,9 @@ void glue(helper_dppd, SUFFIX)(CPUX86State *env,
 }
 #endif
 
-void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                   uint32_t offset)
 {
-    Reg *v = d;
     int i, j;
     uint16_t r[8];
 
@@ -2236,10 +2196,9 @@ static void clmulq(uint64_t *dest_l, uint64_t *dest_h,
 }
 #endif
 
-void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
                                     uint32_t ctrl)
 {
-    Reg *v = d;
     uint64_t a, b;
     int i;
 
@@ -2250,10 +2209,10 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     }
 }
 
-void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0 ; i < 2 << SHIFT ; i++) {
@@ -2265,10 +2224,10 @@ void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }
 }
 
-void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0; i < 8 << SHIFT; i++) {
@@ -2276,10 +2235,10 @@ void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }
 }
 
-void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0 ; i < 2 << SHIFT ; i++) {
@@ -2291,10 +2250,10 @@ void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }
 }
 
-void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *v;
     Reg rk = *s;
 
     for (i = 0; i < 8 << SHIFT; i++) {
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 7f57dab496..21fed7fa05 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -34,31 +34,31 @@
 #define dh_typecode_ZMMReg dh_typecode_ptr
 #define dh_typecode_MMXReg dh_typecode_ptr
 
-DEF_HELPER_3(glue(psrlw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psraw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psllw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psrld, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psrad, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pslld, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psrlq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psllq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(psrlw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psraw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psllw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psrld, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psrad, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pslld, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psrlq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psllq, SUFFIX), void, env, Reg, Reg, Reg)
 
 #if SHIFT >= 1
-DEF_HELPER_3(glue(psrldq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pslldq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(psrldq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pslldq, SUFFIX), void, env, Reg, Reg, Reg)
 #endif
 
 #define SSE_HELPER_B(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 #define SSE_HELPER_W(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 #define SSE_HELPER_L(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 #define SSE_HELPER_Q(name, F)\
-    DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name, SUFFIX), void, env, Reg, Reg, Reg)
 
 SSE_HELPER_B(paddb, FADD)
 SSE_HELPER_W(paddw, FADD)
@@ -109,10 +109,10 @@ SSE_HELPER_W(pmulhw, FMULHW)
 SSE_HELPER_B(pavgb, FAVG)
 SSE_HELPER_W(pavgw, FAVG)
 
-DEF_HELPER_3(glue(pmuludq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaddwd, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(pmuludq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaddwd, SUFFIX), void, env, Reg, Reg, Reg)
 
-DEF_HELPER_3(glue(psadbw, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(psadbw, SUFFIX), void, env, Reg, Reg, Reg)
 #if SHIFT < 2
 DEF_HELPER_4(glue(maskmov, SUFFIX), void, env, Reg, Reg, tl)
 #endif
@@ -134,8 +134,8 @@ DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 /* XXX: not accurate */
 
 #define SSE_HELPER_P4(name)                                             \
-    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
-    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)
+    DEF_HELPER_4(glue(name ## ps, SUFFIX), void, env, Reg, Reg, Reg)    \
+    DEF_HELPER_4(glue(name ## pd, SUFFIX), void, env, Reg, Reg, Reg)
 
 #define SSE_HELPER_P3(name, ...)                                        \
     DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
@@ -144,8 +144,8 @@ DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 #if SHIFT == 1
 #define SSE_HELPER_S4(name)                                             \
     SSE_HELPER_P4(name)                                                 \
-    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)                       \
-    DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
+    DEF_HELPER_4(name ## ss, void, env, Reg, Reg, Reg)                  \
+    DEF_HELPER_4(name ## sd, void, env, Reg, Reg, Reg)
 #define SSE_HELPER_S3(name)                                             \
     SSE_HELPER_P3(name)                                                 \
     DEF_HELPER_3(name ## ss, void, env, Reg, Reg)                       \
@@ -155,8 +155,8 @@ DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 #define SSE_HELPER_S3(name, ...) SSE_HELPER_P3(name)
 #endif
 
-DEF_HELPER_3(glue(shufps, SUFFIX), void, Reg, Reg, int)
-DEF_HELPER_3(glue(shufpd, SUFFIX), void, Reg, Reg, int)
+DEF_HELPER_4(glue(shufps, SUFFIX), void, Reg, Reg, Reg, int)
+DEF_HELPER_4(glue(shufpd, SUFFIX), void, Reg, Reg, Reg, int)
 
 SSE_HELPER_S4(add)
 SSE_HELPER_S4(sub)
@@ -212,6 +212,7 @@ DEF_HELPER_2(cvttsd2sq, s64, env, ZMMReg)
 
 DEF_HELPER_3(glue(rsqrtps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(rcpps, SUFFIX), void, env, ZMMReg, ZMMReg)
+
 #if SHIFT == 1
 DEF_HELPER_3(rsqrtss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(rcpss, void, env, ZMMReg, ZMMReg)
@@ -248,20 +249,20 @@ DEF_HELPER_2(glue(movmskpd, SUFFIX), i32, env, Reg)
 #endif
 
 DEF_HELPER_2(glue(pmovmskb, SUFFIX), i32, env, Reg)
-DEF_HELPER_3(glue(packsswb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(packuswb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(packssdw, SUFFIX), void, env, Reg, Reg)
-#define UNPCK_OP(base_name, base)                                       \
-    DEF_HELPER_3(glue(punpck ## base_name ## bw, SUFFIX), void, env, Reg, Reg) \
-    DEF_HELPER_3(glue(punpck ## base_name ## wd, SUFFIX), void, env, Reg, Reg) \
-    DEF_HELPER_3(glue(punpck ## base_name ## dq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(packsswb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(packuswb, SUFFIX)# name ## dq, SUFFIX), void, env, Reg, Reg, Reg)
 
 UNPCK_OP(l, 0)
 UNPCK_OP(h, 1)
 
 #if SHIFT >= 1
-DEF_HELPER_3(glue(punpcklqdq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(punpckhqdq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(punpcklqdq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(punpckhqdq, SUFFIX), void, env, Reg, Reg, Reg)
 #endif
 
 /* 3DNow! float ops */
@@ -288,28 +289,28 @@ DEF_HELPER_3(pswapd, void, env, MMXReg, MMXReg)
 #endif
 
 /* SSSE3 op helpers */
-DEF_HELPER_3(glue(phaddw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phaddd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phaddsw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phsubw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phsubd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(phsubsw, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(phaddw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phaddd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phaddsw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phsubw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phsubd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(phsubsw, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_3(glue(pabsb, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pabsw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pabsd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaddubsw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmulhrsw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pshufb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psignb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psignw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(psignd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_4(glue(palignr, SUFFIX), void, env, Reg, Reg, s32)
+DEF_HELPER_4(glue(pmaddubsw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmulhrsw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pshufb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psignb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psignw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(psignd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_5(glue(palignr, SUFFIX), void, env, Reg, Reg, Reg, s32)
 
 /* SSE4.1 op helpers */
 #if SHIFT >= 1
-DEF_HELPER_3(glue(pblendvb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(blendvps, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(blendvpd, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_5(glue(pblendvb, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(blendvps, SUFFIX), void, env, Reg, Reg, Reg, Reg)
+DEF_HELPER_5(glue(blendvpd, SUFFIX), void, env, Reg, Reg, Reg, Reg)
 DEF_HELPER_3(glue(ptest, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovsxbw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovsxbd, SUFFIX), void, env, Reg, Reg)
@@ -323,40 +324,40 @@ DEF_HELPER_3(glue(pmovzxbq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxwd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxwq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmovzxdq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmuldq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pcmpeqq, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(packusdw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminsb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminsd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminuw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pminud, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxsb, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxsd, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxuw, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmaxud, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(pmulld, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(pmuldq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pcmpeqq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(packusdw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminsb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminsd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminuw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pminud, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxsb, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxsd, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxuw, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmaxud, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(pmulld, SUFFIX), void, env, Reg, Reg, Reg)
 #if SHIFT == 1
 DEF_HELPER_3(glue(phminposuw, SUFFIX), void, env, Reg, Reg)
 #endif
 DEF_HELPER_4(glue(roundps, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(roundpd, SUFFIX), void, env, Reg, Reg, i32)
 #if SHIFT == 1
-DEF_HELPER_4(glue(roundss, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(roundsd, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_4(roundss_xmm, void, env, Reg, Reg, i32)
+DEF_HELPER_4(roundsd_xmm, void, env, Reg, Reg, i32)
 #endif
-DEF_HELPER_4(glue(blendps, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(blendpd, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(pblendw, SUFFIX), void, env, Reg, Reg, i32)
-DEF_HELPER_4(glue(dpps, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_5(glue(blendps, SUFFIX), void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_5(glue(blendpd, SUFFIX), void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_5(glue(pblendw, SUFFIX), void, env, Reg, Reg, Reg, i32)
+DEF_HELPER_5(glue(dpps, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #if SHIFT == 1
-DEF_HELPER_4(glue(dppd, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_5(glue(dppd, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
-DEF_HELPER_4(glue(mpsadbw, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_5(glue(mpsadbw, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
 
 /* SSE4.2 op helpers */
 #if SHIFT >= 1
-DEF_HELPER_3(glue(pcmpgtq, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(pcmpgtq, SUFFIX), void, env, Reg, Reg, Reg)
 #endif
 #if SHIFT == 1
 DEF_HELPER_4(glue(pcmpestri, SUFFIX), void, env, Reg, Reg, i32)
@@ -368,15 +369,15 @@ DEF_HELPER_3(crc32, tl, i32, tl, i32)
 
 /* AES-NI op helpers */
 #if SHIFT >= 1
-DEF_HELPER_3(glue(aesdec, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(aesdeclast, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(aesenc, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(glue(aesenclast, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_4(glue(aesdec, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(aesdeclast, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(aesenc, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_4(glue(aesenclast, SUFFIX), void, env, Reg, Reg, Reg)
 #if SHIFT == 1
 DEF_HELPER_3(glue(aesimc, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(aeskeygenassist, SUFFIX), void, env, Reg, Reg, i32)
 #endif
-DEF_HELPER_4(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, i32)
+DEF_HELPER_5(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, Reg, i32)
 #endif
 
 #undef SHIFT
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 240811bd49..e996aab541 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -129,6 +129,7 @@ typedef struct DisasContext {
     TCGv tmp4;
     TCGv_ptr ptr0;
     TCGv_ptr ptr1;
+    TCGv_ptr ptr2;
     TCGv_i32 tmp2_i32;
     TCGv_i32 tmp3_i32;
     TCGv_i64 tmp1_i64;
@@ -2893,18 +2894,28 @@ typedef void (*SSEFunc_0_epl)(TCGv_ptr env, TCGv_ptr reg, TCGv_i64 val);
 typedef void (*SSEFunc_0_epp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b);
 typedef void (*SSEFunc_0_eppp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv_ptr reg_c);
+typedef void (*SSEFunc_0_epppp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                TCGv_ptr reg_c, TCGv_ptr reg_d);
 typedef void (*SSEFunc_0_eppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv_i32 val);
+typedef void (*SSEFunc_0_epppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                TCGv_ptr reg_c, TCGv_i32 val);
 typedef void (*SSEFunc_0_ppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_i32 val);
+typedef void (*SSEFunc_0_pppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_ptr reg_c,
+                               TCGv_i32 val);
 typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv val);
+typedef void (*SSEFunc_0_epppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                TCGv_ptr reg_c, TCGv val);
 
 static bool first = true; static unsigned long limit;
 #include "decode-new.h"
 #include "emit.c.inc"
 #include "decode-new.c.inc"
 
+#define SSE_OPF_V0        (1 << 0) /* vex.v must be 1111b (only 2 operands) */
 #define SSE_OPF_CMP       (1 << 1) /* does not write for first operand */
+#define SSE_OPF_BLENDV    (1 << 2) /* blendv* instruction */
 #define SSE_OPF_SPECIAL   (1 << 3) /* magic */
 #define SSE_OPF_3DNOW     (1 << 4) /* 3DNow! instruction */
 #define SSE_OPF_MMX       (1 << 5) /* MMX/integer/AVX2 instruction */
@@ -2914,10 +2925,10 @@ static bool first = true; static unsigned long limit;
 #define OP(op, flags, a, b, c, d)       \
     {flags, {{.op = a}, {.op = b}, {.op = c}, {.op = d} } }
 
-#define MMX_OP(x) OP(op1, SSE_OPF_MMX, \
+#define MMX_OP(x) OP(op2, SSE_OPF_MMX, \
         gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm, NULL, NULL)
 
-#define SSE_FOP(name) OP(op1, SSE_OPF_SCALAR, \
+#define SSE_FOP(name) OP(op2, SSE_OPF_SCALAR, \
         gen_helper_##name##ps##_xmm, gen_helper_##name##pd##_xmm, \
         gen_helper_##name##ss, gen_helper_##name##sd)
 #define SSE_OP(sname, dname, op, flags) OP(op, flags, \
@@ -2927,6 +2938,9 @@ typedef union SSEFuncs {
     SSEFunc_0_epp op1;
     SSEFunc_0_ppi op1i;
     SSEFunc_0_eppt op1t;
+    SSEFunc_0_eppp op2;
+    SSEFunc_0_pppi op2i;
+    SSEFunc_0_epppp op3;
 } SSEFuncs;
 
 struct SSEOpHelper_table1 {
@@ -2946,8 +2960,8 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x11] = SSE_SPECIAL, /* movups, movupd, movss, movsd */
     [0x12] = SSE_SPECIAL, /* movlps, movlpd, movsldup, movddup */
     [0x13] = SSE_SPECIAL, /* movlps, movlpd */
-    [0x14] = SSE_OP(punpckldq, punpcklqdq, op1, 0), /* unpcklps, unpcklpd */
-    [0x15] = SSE_OP(punpckhdq, punpckhqdq, op1, 0), /* unpckhps, unpckhpd */
+    [0x14] = SSE_OP(punpckldq, punpcklqdq, op2, 0), /* unpcklps, unpcklpd */
+    [0x15] = SSE_OP(punpckhdq, punpckhqdq, op2, 0), /* unpckhps, unpckhpd */
     [0x16] = SSE_SPECIAL, /* movhps, movhpd, movshdup */
     [0x17] = SSE_SPECIAL, /* movhps, movhpd */
 
@@ -2957,28 +2971,28 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x2b] = SSE_SPECIAL, /* movntps, movntpd, movntss, movntsd */
     [0x2c] = SSE_SPECIAL, /* cvttps2pi, cvttpd2pi, cvttsd2si, cvttss2si */
     [0x2d] = SSE_SPECIAL, /* cvtps2pi, cvtpd2pi, cvtsd2si, cvtss2si */
-    [0x2e] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR,
+    [0x2e] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR | SSE_OPF_V0,
             gen_helper_ucomiss, gen_helper_ucomisd, NULL, NULL),
-    [0x2f] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR,
+    [0x2f] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR | SSE_OPF_V0,
             gen_helper_comiss, gen_helper_comisd, NULL, NULL),
     [0x50] = SSE_SPECIAL, /* movmskps, movmskpd */
-    [0x51] = OP(op1, SSE_OPF_SCALAR,
+    [0x51] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
                 gen_helper_sqrtps_xmm, gen_helper_sqrtpd_xmm,
                 gen_helper_sqrtss, gen_helper_sqrtsd),
-    [0x52] = OP(op1, SSE_OPF_SCALAR,
+    [0x52] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
                 gen_helper_rsqrtps_xmm, NULL, gen_helper_rsqrtss, NULL),
-    [0x53] = OP(op1, SSE_OPF_SCALAR,
+    [0x53] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
                 gen_helper_rcpps_xmm, NULL, gen_helper_rcpss, NULL),
-    [0x54] = SSE_OP(pand, pand, op1, 0), /* andps, andpd */
-    [0x55] = SSE_OP(pandn, pandn, op1, 0), /* andnps, andnpd */
-    [0x56] = SSE_OP(por, por, op1, 0), /* orps, orpd */
-    [0x57] = SSE_OP(pxor, pxor, op1, 0), /* xorps, xorpd */
+    [0x54] = SSE_OP(pand, pand, op2, 0), /* andps, andpd */
+    [0x55] = SSE_OP(pandn, pandn, op2, 0), /* andnps, andnpd */
+    [0x56] = SSE_OP(por, por, op2, 0), /* orps, orpd */
+    [0x57] = SSE_OP(pxor, pxor, op2, 0), /* xorps, xorpd */
     [0x58] = SSE_FOP(add),
     [0x59] = SSE_FOP(mul),
-    [0x5a] = OP(op1, SSE_OPF_SCALAR,
+    [0x5a] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
                 gen_helper_cvtps2pd_xmm, gen_helper_cvtpd2ps_xmm,
                 gen_helper_cvtss2sd, gen_helper_cvtsd2ss),
-    [0x5b] = OP(op1, 0,
+    [0x5b] = OP(op1, SSE_OPF_V0,
                 gen_helper_cvtdq2ps_xmm, gen_helper_cvtps2dq_xmm,
                 gen_helper_cvttps2dq_xmm, NULL),
     [0x5c] = SSE_FOP(sub),
@@ -2987,7 +3001,7 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x5f] = SSE_FOP(max),
 
     [0xc2] = SSE_FOP(cmpeq), /* sse_op_table4 */
-    [0xc6] = SSE_OP(shufps, shufpd, op1i, SSE_OPF_SHUF),
+    [0xc6] = SSE_OP(shufps, shufpd, op2i, SSE_OPF_SHUF),
 
     /* SSSE3, SSE4, MOVBE, CRC32, BMI1, BMI2, ADX.  */
     [0x38] = SSE_SPECIAL,
@@ -3006,13 +3020,13 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x69] = MMX_OP(punpckhwd),
     [0x6a] = MMX_OP(punpckhdq),
     [0x6b] = MMX_OP(packssdw),
-    [0x6c] = OP(op1, SSE_OPF_MMX,
+    [0x6c] = OP(op2, SSE_OPF_MMX,
                 NULL, gen_helper_punpcklqdq_xmm, NULL, NULL),
-    [0x6d] = OP(op1, SSE_OPF_MMX,
+    [0x6d] = OP(op2, SSE_OPF_MMX,
                 NULL, gen_helper_punpckhqdq_xmm, NULL, NULL),
     [0x6e] = SSE_SPECIAL, /* movd mm, ea */
     [0x6f] = SSE_SPECIAL, /* movq, movdqa, , movqdu */
-    [0x70] = OP(op1i, SSE_OPF_SHUF | SSE_OPF_MMX,
+    [0x70] = OP(op1i, SSE_OPF_SHUF | SSE_OPF_MMX | SSE_OPF_V0,
             gen_helper_pshufw_mmx, gen_helper_pshufd_xmm,
             gen_helper_pshufhw_xmm, gen_helper_pshuflw_xmm),
     [0x71] = SSE_SPECIAL, /* shiftw */
@@ -3023,17 +3037,17 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0x76] = MMX_OP(pcmpeql),
     [0x77] = SSE_SPECIAL, /* emms */
     [0x78] = SSE_SPECIAL, /* extrq_i, insertq_i (sse4a) */
-    [0x79] = OP(op1, 0,
+    [0x79] = OP(op1, SSE_OPF_V0,
             NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r),
-    [0x7c] = OP(op1, 0,
+    [0x7c] = OP(op2, 0,
                 NULL, gen_helper_haddpd_xmm, NULL, gen_helper_haddps_xmm),
-    [0x7d] = OP(op1, 0,
+    [0x7d] = OP(op2, 0,
                 NULL, gen_helper_hsubpd_xmm, NULL, gen_helper_hsubps_xmm),
     [0x7e] = SSE_SPECIAL, /* movd, movd, , movq */
     [0x7f] = SSE_SPECIAL, /* movq, movdqa, movdqu */
     [0xc4] = SSE_SPECIAL, /* pinsrw */
     [0xc5] = SSE_SPECIAL, /* pextrw */
-    [0xd0] = OP(op1, 0,
+    [0xd0] = OP(op2, 0,
                 NULL, gen_helper_addsubpd_xmm, NULL, gen_helper_addsubps_xmm),
     [0xd1] = MMX_OP(psrlw),
     [0xd2] = MMX_OP(psrld),
@@ -3056,7 +3070,7 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0xe3] = MMX_OP(pavgw),
     [0xe4] = MMX_OP(pmulhuw),
     [0xe5] = MMX_OP(pmulhw),
-    [0xe6] = OP(op1, 0,
+    [0xe6] = OP(op1, SSE_OPF_V0,
             NULL, gen_helper_cvttpd2dq_xmm,
             gen_helper_cvtdq2pd_xmm, gen_helper_cvtpd2dq_xmm),
     [0xe7] = SSE_SPECIAL,  /* movntq, movntq */
@@ -3075,7 +3089,7 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     [0xf4] = MMX_OP(pmuludq),
     [0xf5] = MMX_OP(pmaddwd),
     [0xf6] = MMX_OP(psadbw),
-    [0xf7] = OP(op1t, SSE_OPF_MMX,
+    [0xf7] = OP(op1t, SSE_OPF_MMX | SSE_OPF_V0,
                 gen_helper_maskmov_mmx, gen_helper_maskmov_xmm, NULL, NULL),
     [0xf8] = MMX_OP(psubb),
     [0xf9] = MMX_OP(psubw),
@@ -3093,7 +3107,7 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
 
 #define MMX_OP2(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm }
 
-static const SSEFunc_0_epp sse_op_table2[3 * 8][2] = {
+static const SSEFunc_0_eppp sse_op_table2[3 * 8][2] = {
     [0 + 2] = MMX_OP2(psrlw), = {
+static const SSEFunc_0_eppp sse_op_table4[8][4] = {
     SSE_CMP(cmpeq),
     SSE_CMP(cmplt),
     SSE_CMP(cmple),
@@ -3149,6 +3163,11 @@ static const SSEFunc_0_epp sse_op_table4[8][4] = {
 };
 #undef SSE_CMP
 
+static void gen_helper_pavgusb(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b)
+{
+    gen_helper_pavgb_mmx(env, reg_a, reg_a, reg_b);
+}
+
 static const SSEFunc_0_epp sse_op_table5[256] = {
     [0x0c] = gen_helper_pi2fw,
     [0x0d] = gen_helper_pi2fd,
@@ -3173,7 +3192,7 @@ static const SSEFunc_0_epp sse_op_table5[256] = {
     [0xb6] = gen_helper_movq, /* pfrcpit2 */
     [0xb7] = gen_helper_pmulhrw_mmx,
     [0xbb] = gen_helper_pswapd,
-    [0xbf] = gen_helper_pavgb_mmx,
+    [0xbf] = gen_helper_pavgusb,
 };
 
 struct SSEOpHelper_table6 {
@@ -3185,6 +3204,8 @@ struct SSEOpHelper_table6 {
 struct SSEOpHelper_table7 {
     union {
         SSEFunc_0_eppi op1;
+        SSEFunc_0_epppi op2;
+        SSEFunc_0_epppp op3;
     } fn[2];
     uint32_t ext_mask;
     int flags;
@@ -3196,15 +3217,15 @@ struct SSEOpHelper_table7 {
     {{{.op = mmx_name}, {.op = gen_helper_ ## name ## _xmm} }, \
         CPUID_EXT_ ## ext, flags}
 #define BINARY_OP_MMX(name, ext) \
-    OP(name, op1, SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
+    OP(name, op2, SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
 #define BINARY_OP(name, ext, flags) \
-    OP(name, op1, flags, ext, NULL)
+    OP(name, op2, flags, ext, NULL)
 #define UNARY_OP_MMX(name, ext) \
-    OP(name, op1, SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
+    OP(name, op1, SSE_OPF_V0 | SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
 #define UNARY_OP(name, ext, flags) \
-    OP(name, op1, flags, ext, NULL)
-#define BLENDV_OP(name, ext, flags) OP(name, op1, 0, ext, NULL)
-#define CMP_OP(name, ext) OP(name, op1, SSE_OPF_CMP, ext, NULL)
+    OP(name, op1, SSE_OPF_V0 | flags, ext, NULL)
+#define BLENDV_OP(name, ext, flags) OP(name, op3, SSE_OPF_BLENDV, ext, NULL)
+#define CMP_OP(name, ext) OP(name, op1, SSE_OPF_CMP | SSE_OPF_V0, ext, NULL)
 #define SPECIAL_OP(ext) OP(special, op1, SSE_OPF_SPECIAL, ext, NULL)
 
 /* prefix [66] 0f 38 */
@@ -3748,7 +3769,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op1_offset = offsetof(CPUX86State,mmx_t0);
             }
             assert(b1 < 2);
-            SSEFunc_0_epp fn = sse_op_table2[((b - 1) & 3) * 8 +
+            SSEFunc_0_eppp fn = sse_op_table2[((b - 1) & 3) * 8 +
                                        (((modrm >> 3)) & 7)][b1];
             if (!fn) {
                 goto unknown_op;
@@ -3761,8 +3782,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
             }
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op1_offset);
-            fn(cpu_env, s->ptr0, s->ptr1);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            tcg_gen_addi_ptr(s->ptr2, cpu_env, op1_offset);
+            fn(cpu_env, s->ptr0, s->ptr1, s->ptr2);
             break;
         case 0x050: /* movmskps */
             rm = (modrm & 7) | REX_B(s);
@@ -4030,7 +4052,21 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
                 tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
                 tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-                op6->fn[b1].op1(cpu_env, s->ptr0, s->ptr1);
+                if (op6->flags & SSE_OPF_V0) {
+                    op6->fn[b1].op1(cpu_env, s->ptr0, s->ptr1);
+                } else {
+                    tcg_gen_addi_ptr(s->ptr2, cpu_env, op1_offset);
+                    if (op6->flags & SSE_OPF_BLENDV) {
+                        TCGv_ptr mask = tcg_temp_new_ptr();
+                        tcg_gen_addi_ptr(mask, cpu_env, ZMM_OFFSET(0));
+                        op6->fn[b1].op3(cpu_env, s->ptr0, s->ptr2, s->ptr1,
+                                       mask);
+                        tcg_temp_free_ptr(mask);
+                    } else {
+                        SSEFunc_0_eppp fn = op6->fn[b1].op2;
+                        fn(cpu_env, s->ptr0, s->ptr2, s->ptr1);
+                    }
+                }
             } else {
                 CHECK_NO_VEX(s);
                 if ((op6->flags & SSE_OPF_MMX) == 0) {
@@ -4046,7 +4082,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
                 tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
                 tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-                op6->fn[0].op1(cpu_env, s->ptr0, s->ptr1);
+                if (op6->flags & SSE_OPF_V0) {
+                    op6->fn[0].op1(cpu_env, s->ptr0, s->ptr1);
+                } else {
+                    op6->fn[0].op2(cpu_env, s->ptr0, s->ptr0, s->ptr1);
+                }
             }
 
             if (op6->flags & SSE_OPF_CMP) {
@@ -4380,7 +4420,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 /* We only actually have one MMX instuction (palignr) */
                 assert(b == 0x0f);
 
-                op7->fn[0].op1(cpu_env, s->ptr0, s->ptr1,
+                op7->fn[0].op2(cpu_env, s->ptr0, s->ptr0, s->ptr1,
                                tcg_const_i32(val));
                 break;
             }
@@ -4407,7 +4447,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            op7->fn[b1].op1(cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
+            if (op7->flags & SSE_OPF_V0) {
+                op7->fn[b1].op1(cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
+            } else {
+                tcg_gen_addi_ptr(s->ptr2, cpu_env, op1_offset);
+                op7->fn[b1].op2(cpu_env, s->ptr0, s->ptr2, s->ptr1,
+                               tcg_const_i32(val));
+            }
             if (op7->flags & SSE_OPF_CMP) {
                 set_cc_op(s, CC_OP_EFLAGS);
             }
@@ -4499,26 +4545,46 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 return;
             }
         }
+
+
         tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
         tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-        if (sse_op_flags & SSE_OPF_SHUF) {
-            val = x86_ldub_code(env, s);
-            sse_op_fn.op1i(s->ptr0, s->ptr1, tcg_const_i32(val));
-        } else if (b == 0xf7) {
-            /* maskmov : we must prepare A0 */
-            if (mod != 3) {
-                goto illegal_op;
+        if (sse_op_flags & SSE_OPF_V0) {
+            if (sse_op_flags & SSE_OPF_SHUF) {
+                val = x86_ldub_code(env, s);
+                sse_op_fn.op1i(s->ptr0, s->ptr1, tcg_const_i32(val));
+            } else if (b == 0xf7) {
+                /* maskmov : we must prepare A0 */
+                if (mod != 3) {
+                    goto illegal_op;
+                }
+                tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
+                gen_extu(s->aflag, s->A0);
+                gen_add_A0_ds_seg(s);
+
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                sse_op_fn.op1t(cpu_env, s->ptr0, s->ptr1, s->A0);
+                /* Does not write to the fist operand */
+                return;
+            } else {
+                sse_op_fn.op1(cpu_env, s->ptr0, s->ptr1);
             }
-            tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
-            gen_extu(s->aflag, s->A0);
-            gen_add_A0_ds_seg(s);
-            sse_op_fn.op1t(cpu_env, s->ptr0, s->ptr1, s->A0);
-        } else if (b == 0xc2) {
-            /* compare insns, bits 7:3 (7:5 for AVX) are ignored */
-            val = x86_ldub_code(env, s) & 7;
-            sse_op_table4[val][b1](cpu_env, s->ptr0, s->ptr1);
         } else {
-            sse_op_fn.op1(cpu_env, s->ptr0, s->ptr1);
+            tcg_gen_addi_ptr(s->ptr2, cpu_env, op1_offset);
+            if (sse_op_flags & SSE_OPF_SHUF) {
+                val = x86_ldub_code(env, s);
+                sse_op_fn.op2i(s->ptr0, s->ptr2, s->ptr1,
+                                   tcg_const_i32(val));
+            } else {
+                SSEFunc_0_eppp fn = sse_op_fn.op2;
+                if (b == 0xc2) {
+                    /* compare insns */
+                    val = x86_ldub_code(env, s) & 7;
+                    fn = sse_op_table4[val][b1];
+                }
+                fn(cpu_env, s->ptr0, s->ptr2, s->ptr1);
+            }
         }
 
         if (sse_op_flags & SSE_OPF_CMP) {
@@ -8598,6 +8664,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->tmp4 = tcg_temp_new();
     dc->ptr0 = tcg_temp_new_ptr();
     dc->ptr1 = tcg_temp_new_ptr();
+    dc->ptr2 = tcg_temp_new_ptr();
     dc->cc_srcT = tcg_temp_local_new();
 }
 
-- 
2.37.2



