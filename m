Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE44D5A1C37
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:24:30 +0200 (CEST)
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLH3-00049M-RN
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7Z-0008DZ-C7
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7X-0002kd-P1
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7CtAkdHx6EeLTd6jc8ryTB67q6iPWrou0FI4MgP6ag=;
 b=Dn3/1ldRXv5Vj/gq5QeDXnCp5KYBJOFZhP7FknnxYsuWyAnjF5cCX+B1XJq96T9o0AHRsk
 9HV9Kzoh0sjjfm8yZpUfclOIVsRLubUGqhzOm4seVPZw7aDry2Xkjvg3rV288QPZZ1LwHw
 4868fWOLXBCv6UwnBIOjZJoBNuXZ5Dg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-JHiLX8VDOnafL3xvArMfyg-1; Thu, 25 Aug 2022 18:14:38 -0400
X-MC-Unique: JHiLX8VDOnafL3xvArMfyg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j3-20020a05600c1c0300b003a5e72421c2so2985196wms.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/7CtAkdHx6EeLTd6jc8ryTB67q6iPWrou0FI4MgP6ag=;
 b=i/c2lpzO5+MrEeCidkyTgK9XM/VYX+FQOjabNLShUmHmLRwap1EQoBYyibc05cA9Tl
 5M3iLNcEWLw6jYgFahtNY15wSyBj0DDu8wxxiugFu210IgBE3Eyg3WfxcqRLpMBKP79B
 TBH76HmalyMwqHsXMw4H4BhDynu9mektnwJXhx/tm5YJWqFuEYcJhSzPH7wyKxvL3Bj1
 wqkF9N661zXaDQdarbw3jA65pijSTcJoEkDNNvKdwrdwIVtoCeSjtAXiZ6RKTYUqEoGa
 QcTS9ruT/l/D7JD4rMTnJ8j8HX3o9IQmqDtnBtlmNkNe+09uAUSmz7s21loQhUzSwFKR
 LHVA==
X-Gm-Message-State: ACgBeo3FChaPXbJRBhyP5ch6/AGZeyL8K5tmH+pHsYpV+HbIIHpFSn8e
 Rb6FqOIb25EjF29OAFPLtt4egr7NRy1zV3Bg+/CAuGyYT29zlb5hNiMN+Gt5LN1AcAOE8IOncys
 3co4QGL0i5NeeEAa0D23aaXNl8tz7Le9yzEjVWJCmkSkgrpwjluuLqigGBcyxaV5roy4=
X-Received: by 2002:a05:600c:4f92:b0:3a6:cc5:e616 with SMTP id
 n18-20020a05600c4f9200b003a60cc5e616mr3417965wmq.53.1661465676473; 
 Thu, 25 Aug 2022 15:14:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6znEnujWoWTvaTYRRBg/N0dG3SGkQXe040Ptnc6K3ifaqHBURbcqXxfEXzui4bsMxLceaQcw==
X-Received: by 2002:a05:600c:4f92:b0:3a6:cc5:e616 with SMTP id
 n18-20020a05600c4f9200b003a60cc5e616mr3417959wmq.53.1661465676229; 
 Thu, 25 Aug 2022 15:14:36 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a5d6187000000b0022584c82c80sm352229wru.19.2022.08.25.15.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 14/18] i386: Destructive FP helpers for AVX
Date: Fri, 26 Aug 2022 00:14:07 +0200
Message-Id: <20220825221411.35122-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
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

From: Paul Brook <paul@nowt.org>

Perpare the horizontal atithmetic vector helpers for AVX
These currently use a dummy Reg typed variable to store the result then
assign the whole register.  This will cause 128 bit operations to corrupt
the upper half of the register, so replace it with explicit temporaries
and element assignments.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-18-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 68 +++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0493a26804..7252e03619 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -932,45 +932,45 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
     d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), index, length);
 }
 
-void glue(helper_haddps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
-{
-    ZMMReg r;
-
-    r.ZMM_S(0) = float32_add(d->ZMM_S(0), d->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(1) = float32_add(d->ZMM_S(2), d->ZMM_S(3), &env->sse_status);
-    r.ZMM_S(2) = float32_add(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(3) = float32_add(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
-    MOVE(*d, r);
+#define SSE_HELPER_HPS(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+{                                                                 \
+    Reg *v = d;                                                   \
+    float32 r[2 << SHIFT];                                        \
+    int i, j;                                                     \
+    for (i = j = 0; j < 4; i++, j += 2) {                         \
+        r[i] = F(v->ZMM_S(j), v->ZMM_S(j + 1), &env->sse_status); \
+    }                                                             \
+    for (j = 0; j < 4; i++, j += 2) {                             \
+        r[i] = F(s->ZMM_S(j), s->ZMM_S(j + 1), &env->sse_status); \
+    }                                                             \
+    for (i = 0; i < 2 << SHIFT; i++) {                            \
+        d->ZMM_S(i) = r[i];                                       \
+    }                                                             \
 }
 
-void glue(helper_haddpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
-{
-    ZMMReg r;
+SSE_HELPER_HPS(haddps, float32_add)
+SSE_HELPER_HPS(hsubps, float32_sub)
 
-    r.ZMM_D(0) = float64_add(d->ZMM_D(0), d->ZMM_D(1), &env->sse_status);
-    r.ZMM_D(1) = float64_add(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
-    MOVE(*d, r);
+#define SSE_HELPER_HPD(name, F)  \
+void glue(helper_ ## name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s) \
+{                                                                 \
+    Reg *v = d;                                                   \
+    float64 r[2 << SHIFT];                                        \
+    int i, j;                                                     \
+    for (i = j = 0; j < 2; i++, j += 2) {                         \
+        r[i] = F(v->ZMM_D(j), v->ZMM_D(j + 1), &env->sse_status); \
+    }                                                             \
+    for (j = 0; j < 2; i++, j += 2) {                             \
+        r[i] = F(s->ZMM_D(j), s->ZMM_D(j + 1), &env->sse_status); \
+    }                                                             \
+    for (i = 0; i < 1 << SHIFT; i++) {                            \
+        d->ZMM_D(i) = r[i];                                       \
+    }                                                             \
 }
 
-void glue(helper_hsubps, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
-{
-    ZMMReg r;
-
-    r.ZMM_S(0) = float32_sub(d->ZMM_S(0), d->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(1) = float32_sub(d->ZMM_S(2), d->ZMM_S(3), &env->sse_status);
-    r.ZMM_S(2) = float32_sub(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
-    r.ZMM_S(3) = float32_sub(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
-    MOVE(*d, r);
-}
-
-void glue(helper_hsubpd, SUFFIX)(CPUX86State *env, ZMMReg *d, ZMMReg *s)
-{
-    ZMMReg r;
-
-    r.ZMM_D(0) = float64_sub(d->ZMM_D(0), d->ZMM_D(1), &env->sse_status);
-    r.ZMM_D(1) = float64_sub(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
-    MOVE(*d, r);
-}
+SSE_HELPER_HPD(haddpd, float64_add)
+SSE_HELPER_HPD(hsubpd, float64_sub)
 
 void glue(helper_addsubps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-- 
2.37.1



