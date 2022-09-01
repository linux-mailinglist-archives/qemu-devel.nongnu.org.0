Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D52F5A9FD5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 21:23:28 +0200 (CEST)
Received: from localhost ([::1]:52662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpmh-0004bq-AE
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 15:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosz-0000H5-7r
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTost-0000D9-Gf
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUoKU9+iIxkG+AOjVpADIJ5k5rQvBnaRI6wz3HXB9A4=;
 b=g1IJAH0sbjO8rAlz21TbJtYDNj8SgqxG64aXaptTROhOswRx33E4xk45ugLFBhAXolOqBB
 OjOKruQhz9VdPw4nIEpnwoH1MUyw9ravQnh6Jr1gWUVW01e6o+iDRFmYbgt07eOHJo9xPu
 17FhhypA1PCdUqo0nXa/S9GHTuhS7Nc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-461-JVQeH2cmOuaaL2NhEVOrkg-1; Thu, 01 Sep 2022 14:25:41 -0400
X-MC-Unique: JVQeH2cmOuaaL2NhEVOrkg-1
Received: by mail-ej1-f69.google.com with SMTP id
 gb33-20020a170907962100b00741496e2da1so6268310ejc.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YUoKU9+iIxkG+AOjVpADIJ5k5rQvBnaRI6wz3HXB9A4=;
 b=A2us3GZbLzB/WqSjgXcuFTeHW/1HwZvzdTSlzolOXEzdMCGK/px+zLPh14mI6SnkVU
 GCnlwniMCRD0DwhqHVunPMA89IYJV5Ms2Icwemv+D2hkhILigZ0FEcZoW3xFxXvHgyDC
 XfaN8cG0SChvB00H47XvDDp5xdHtvjYpixVKM0R04/bzeMz5T/43oTB4r3zZqBY1Uj6M
 z/ySNv9dl7xNrEh5ZpMayKhup8t6ALDydwe/xxurgQBLZL++AYZs0cgKTAAxZ0H2D/49
 JuE3r+oNAFtg5UrxDqhXkb1PVyWg1zC8UL4aX2COb+lbT5C4ivfnaYPbAvH6k04M9Cf+
 dwzg==
X-Gm-Message-State: ACgBeo16tH8Vb02fjy+NkHIeLLdBSS4F7FG3YrfZew3u7q9en8btuzZ7
 qI5d3MEEe7lksAcgpqODk/zf8npJM4KTWYsPb0PYPlzQZ/sENwoDhbm2H2omBw14mNTv/bF4NSj
 3knE8wZvVOlrGxkzIIO9CkhbvXofxpznNfAsexGI5oX3gs+LVhfn6cfOGQ2CHaW8DqxE=
X-Received: by 2002:a17:906:eec9:b0:73d:c369:690f with SMTP id
 wu9-20020a170906eec900b0073dc369690fmr24894550ejb.767.1662056735589; 
 Thu, 01 Sep 2022 11:25:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4NFaK2+UvKb/gKTaaJxAQacLt80vCBu+c4Iui+LVpdlrt/9mOTnLHTcIQwUmyyniCqn8iA5A==
X-Received: by 2002:a17:906:eec9:b0:73d:c369:690f with SMTP id
 wu9-20020a170906eec900b0073dc369690fmr24894531ejb.767.1662056735261; 
 Thu, 01 Sep 2022 11:25:35 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a0564021f0d00b004485afde654sm1766021edb.6.2022.09.01.11.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 35/39] target/i386: Destructive FP helpers for AVX
Date: Thu,  1 Sep 2022 20:24:25 +0200
Message-Id: <20220901182429.93533-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 91 ++++++++++++++++++-------------------------
 1 file changed, 38 insertions(+), 53 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index c9737e16b9..c6dba9572d 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -22,7 +22,6 @@
 
 #if SHIFT == 0
 #define Reg MMXReg
-#define SIZE 8
 #define XMM_ONLY(...)
 #define B(n) MMX_B(n)
 #define W(n) MMX_W(n)
@@ -31,7 +30,6 @@
 #define SUFFIX _mmx
 #else
 #define Reg ZMMReg
-#define SIZE 16
 #define XMM_ONLY(...) __VA_ARGS__
 #define B(n) ZMM_B(n)
 #define W(n) ZMM_W(n)
@@ -43,22 +41,6 @@
 #define LANE_WIDTH (SHIFT ? 16 : 8)
 #define PACK_WIDTH (LANE_WIDTH / 2)
 
-/*
- * Copy the relevant parts of a Reg value around. In the case where
- * sizeof(Reg) > SIZE, these helpers operate only on the lower bytes of
- * a 64 byte ZMMReg, so we must copy only those and keep the top bytes
- * untouched in the guest-visible destination destination register.
- * Note that the "lower bytes" are placed last in memory on big-endian
- * hosts, which store the vector backwards in memory.  In that case the
- * copy *starts* at B(SIZE - 1) and ends at B(0), the opposite of
- * the little-endian case.
- */
-#if HOST_BIG_ENDIAN
-#define MOVE(d, r) memcpy(&((d).B(SIZE - 1)), &(r).B(SIZE - 1), SIZE)
-#else
-#define MOVE(d, r) memcpy(&(d).B(0), &(r).B(0), SIZE)
-#endif
-
 #if SHIFT == 0
 #define FPSRL(x, c) ((x) >> shift)
 #define FPSRAW(x, c) ((int16_t)(x) >> shift)
@@ -945,45 +927,49 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
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
+    int i, j, k;                                                  \
+    for (k = 0; k < 2 << SHIFT; k += LANE_WIDTH / 4) {            \
+        for (i = j = 0; j < 4; i++, j += 2) {                     \
+            r[i + k] = F(v->ZMM_S(j + k), v->ZMM_S(j + k + 1), &env->sse_status); \
+        }                                                         \
+        for (j = 0; j < 4; i++, j += 2) {                         \
+            r[i + k] = F(s->ZMM_S(j + k), s->ZMM_S(j + k + 1), &env->sse_status); \
+        }                                                         \
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
+    float64 r[1 << SHIFT];                                        \
+    int i, j, k;                                                  \
+    for (k = 0; k < 1 << SHIFT; k += LANE_WIDTH / 8) {            \
+        for (i = j = 0; j < 2; i++, j += 2) {                     \
+            r[i + k] = F(v->ZMM_D(j + k), v->ZMM_D(j + k + 1), &env->sse_status); \
+        }                                                         \
+        for (j = 0; j < 2; i++, j += 2) {                         \
+            r[i + k] = F(s->ZMM_D(j + k), s->ZMM_D(j + k + 1), &env->sse_status); \
+        }                                                         \
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
@@ -2331,4 +2317,3 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #undef L
 #undef Q
 #undef SUFFIX
-#undef SIZE
-- 
2.37.2



