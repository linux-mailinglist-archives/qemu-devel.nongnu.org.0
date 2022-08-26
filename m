Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900B5A32A1
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:30:06 +0200 (CEST)
Received: from localhost ([::1]:43044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRim5-0001K8-80
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVk-0007GO-33
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVV-0007sY-GI
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhoWDleWv/dGnNNeR4qdNvgqCfSBeJZS8kKwET5x6P0=;
 b=Raqqd/5cqEvBwyLRvYoVBEAGzojDvW3p07Cn/WWU9WR3P9LW1QMevRUZKEtxDRvAK+tWBF
 t/SjA3dCcHl2BZYtTQREANBn3eH6tHFP1MgyIrv4XM5qdrAYOL3Shr0IhwbbF/DYKVkCC3
 FNkwmAb6WDwLk7E5xtW48yI5w1esF6g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-552-DpHsaKGUOASL-1N7PAl5Ag-1; Fri, 26 Aug 2022 19:12:48 -0400
X-MC-Unique: DpHsaKGUOASL-1N7PAl5Ag-1
Received: by mail-ed1-f72.google.com with SMTP id
 v7-20020a056402348700b004481d536c7bso310359edc.10
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mhoWDleWv/dGnNNeR4qdNvgqCfSBeJZS8kKwET5x6P0=;
 b=bfdL4KrQyL4lnS+IoFC92N+fkK2CpHKNvtr31OKeAUWmy98EQ/sAVwcupQeNQSQv5+
 wWAPtYyIMASA+QT3dVhpjJbrMwocmFXEARYbCOvsaJXNc0JdyGffqWooTTujpptMnOmo
 VNySXZV8O8m4O24rrFv3iPChZcu7juJlfvSzsNsJwYRrgmkg4LQq5+QvyN4imbDv0O0U
 2tM4BjYw+CCU84xF7ka+j+GDRgqd8ElPfwflGcrtxJPYYDi30yHE82/VXEOb6By05je2
 cpKGKYA0f0x6+xfwDBCBXqziThgKchCfH4gNZQdMaM6LmmwL+dsKp6WIRRMEkb1j0JKJ
 lSOA==
X-Gm-Message-State: ACgBeo1RiyHyQ3JpfPM2Xf3D+5MZzT/6xNpUkh/ar2cfbwIathXG6Xg5
 AE750Al8hgM8njS4dd21iKCCRXj6ujUFAyBqpB+/W6KGxqiAkTIG1lsqvLfucIzPZmuARcu0yRT
 mwQbfsHnN5jf/Kxm5r2HhbcKDmhynt6i8N9xnLNRXLzInov3JIQZVXM944Es9kPYphCc=
X-Received: by 2002:a17:907:7389:b0:73d:81a1:d562 with SMTP id
 er9-20020a170907738900b0073d81a1d562mr7011830ejc.27.1661555567247; 
 Fri, 26 Aug 2022 16:12:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5bg0m/K18cBFQtpQFQl34NDWClzyjCbH2DkwUwirOnTC3eeSs/O1JIHhL+CDLFtT7sD5l+3w==
X-Received: by 2002:a17:907:7389:b0:73d:81a1:d562 with SMTP id
 er9-20020a170907738900b0073d81a1d562mr7011815ejc.27.1661555566914; 
 Fri, 26 Aug 2022 16:12:46 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906328100b0073d70df6e56sm1397203ejw.138.2022.08.26.16.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 19/23] i386: Destructive FP helpers for AVX
Date: Sat, 27 Aug 2022 01:12:00 +0200
Message-Id: <20220826231204.201395-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826231204.201395-1-pbonzini@redhat.com>
References: <20220826231204.201395-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 target/i386/ops_sse.h | 70 +++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 17d04888c5..ed2f04ded5 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -940,45 +940,45 @@ void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
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
@@ -1999,7 +1999,7 @@ void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     int i, j;
     uint16_t r[8];
 
-    for (j = 0; j < 4 << SHIFT; j++) {
+    for (j = 0; j < 4 << SHIFT; ) {
         int s0 = (j * 2) + ((offset & 3) << 2);
         int d0 = (j * 2) + ((offset & 4) << 0);
         for (i = 0; i < 8; i++, d0++) {
-- 
2.37.1



