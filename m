Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DC15A923F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:41:44 +0200 (CEST)
Received: from localhost ([::1]:48304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTflf-00043C-Bw
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTexA-0001TU-Bz
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTex7-0003B1-HF
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvRdYXqxKilYPGCf8ByPEEOUIBIjFXJU4or0s3GS58o=;
 b=AiLbSpBLJntM5nOQNVT7aRpeZwFTxx83s2BIObZtFomG37N+MfHx3WgoqtK+Wn98/PfQqS
 DUH0Wq15CK1f9mGPyxtnhxfO5hNT9W0xeoCGvCHx9vNRya0M8LICjF7iWsAOBDLYzTGFtK
 eaJ/TwbHMqSDyB6LOKyaVFsHfI0Pdvc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-6udRPbS5PVeKPnWyoWAO8w-1; Thu, 01 Sep 2022 03:49:27 -0400
X-MC-Unique: 6udRPbS5PVeKPnWyoWAO8w-1
Received: by mail-wr1-f70.google.com with SMTP id
 r20-20020adfb1d4000000b002258c581ba2so2831887wra.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cvRdYXqxKilYPGCf8ByPEEOUIBIjFXJU4or0s3GS58o=;
 b=GN64axDb1dT3vVZ1jSqAU2faQMeZ7iOXZQm/Y6FF9PedHS6ygEUoOTmjZ0CegsRVEM
 yb5+oJnNj617KdirFDkcgAVWq27vYgCGbvbo/yh+wfbGO9EEtVBTp1KdB2F5P4WYycDa
 7l3JFIhHgf1IeY9/KrAaQJDErQtasARdIxvM0Vnn5EJkLjBA3aPx18xPqPgF9rWkBeBg
 xcTanPMXacXZrnYURL+uoh0WdCbJCeZ1VZwKMQcKFpklA6t9gRAf6fEitCHRQUgt2Bbu
 iP/vjfS/+7iG/cRGS/tT48DQV+U8jxdeUHPm94TNMh0y7NL1rgJeM1ZWl86o0K6+ZiNL
 eBUg==
X-Gm-Message-State: ACgBeo3o+J8faIk6B/Lbu9XxTWuJ7SEXbTxNVKJ0It27OC2azqHHHo3o
 N/0CbX+OjFHTmsX+ct8/Lx1G79B6PAYFK7t9OnDob8BwuTnBXQWSDWm+PCTdZF2WXU5gFmNvWxC
 qYs3T86cRobfRD36e25HqOfkOh+Am4vX6UyKnZ0ZjI16xrVQ8+bjqQy0KwyP5/5w4Ywo=
X-Received: by 2002:a05:600c:4e8c:b0:3a6:11e:cc08 with SMTP id
 f12-20020a05600c4e8c00b003a6011ecc08mr4247308wmq.198.1662018566610; 
 Thu, 01 Sep 2022 00:49:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7IYi4LshRzlAbT755GY6I5+VeivcH+2+8NX195yN2qNkiOytJnNLSZpzl9oQOoVIKEAvc1KA==
X-Received: by 2002:a05:600c:4e8c:b0:3a6:11e:cc08 with SMTP id
 f12-20020a05600c4e8c00b003a6011ecc08mr4247292wmq.198.1662018566380; 
 Thu, 01 Sep 2022 00:49:26 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c1c2600b003a5c75bd36fsm4731660wms.10.2022.09.01.00.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 19/23] i386: Destructive FP helpers for AVX
Date: Thu,  1 Sep 2022 09:48:38 +0200
Message-Id: <20220901074842.57424-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
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
 target/i386/ops_sse.h | 93 ++++++++++++++++++-------------------------
 1 file changed, 39 insertions(+), 54 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 59ed30071e..61722fe4a2 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
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
-- 
2.37.1



