Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FFC5A1C70
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:33:20 +0200 (CEST)
Received: from localhost ([::1]:55806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLPa-0001aY-Kw
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7d-0008Rg-5d
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7a-0002l3-Rj
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tok4j0sTJaxMGIqatullGemy6/Xa4yxJp5Fm5pV0WyQ=;
 b=Ut9tcXHtHhALK2vP9z7evHvKU0QMA6lBdlmxVpy0taqcYhy5q+3IRsPg9Jp2VTszcxHP1h
 l6Q0dUM75apPecLiceAswiggjWaOMu3HXvKbfwUqinwxJIT/l2RQUOvK7vrpAqoFJ4uAuF
 wMsYrxte+ObIjM6755b1cDtBQ2SXUDM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-DxtBuoNKMCW1hbYILSc6bw-1; Thu, 25 Aug 2022 18:14:41 -0400
X-MC-Unique: DxtBuoNKMCW1hbYILSc6bw-1
Received: by mail-wm1-f69.google.com with SMTP id
 az42-20020a05600c602a00b003a552086ba9so3039649wmb.6
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Tok4j0sTJaxMGIqatullGemy6/Xa4yxJp5Fm5pV0WyQ=;
 b=5u4AzrEjnWsHurFPJNeU5lDNF+4fXiSkKYuTgd0lFLutJeCbJnSZWkACvw0A2JKD0W
 NMI7OAqUhaGTEVJtdo/cAy5yhn0vyQz1W/CEPtKInVGYTtMbhNGGz9g5RNe/IMqSYQ2I
 EP1+hf7KEhU7yr3p2pfgGaaz1PUD6+F3c26BNNkvCfF34TTAlFne0TAZx4QB0MTYKEAk
 J0oBlPW8HyJjEeFLuso0SXIHxJt6Mpnmx4Pr/GSJ3zB7F0kXMp5SpadX9s7eIqg+PDNq
 m4hhllNQRWWwr+6qeAlMEpJNps+YVDqDcfrF1lXGSVKcT4pqEUKCQBQVXS3i5P9N+5UH
 DEQg==
X-Gm-Message-State: ACgBeo3hRZ4LeN7/aB9Ld0k2qlZdgs8tswsOfzBQiyPeebnCKcYVEeFm
 nHk6ieBlOK31cRDDtWj5ZRvn9iQnqxhn/bIQhbEvqZirRfVctS8w+B4GJQlrwUe5MCa1WE8ek1T
 6Chx8CDvpL3Ua+oBzMmCVpg1lOmSwosKFhpDn/kD0Ha+yjAAHhAFzYQcXfKaZymqAh0Y=
X-Received: by 2002:a1c:3b55:0:b0:3a6:7b62:3901 with SMTP id
 i82-20020a1c3b55000000b003a67b623901mr3445426wma.113.1661465679463; 
 Thu, 25 Aug 2022 15:14:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR75i7edhqvlVTcvGLhho9okSPgU7px9gYqSJSoQzwg3q1nXPyGd0m+lk640aAUe9UT5OK3hEw==
X-Received: by 2002:a1c:3b55:0:b0:3a6:7b62:3901 with SMTP id
 i82-20020a1c3b55000000b003a67b623901mr3445414wma.113.1661465679124; 
 Thu, 25 Aug 2022 15:14:39 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b0022537d826f3sm341340wrs.23.2022.08.25.15.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 16/18] i386: Rewrite blendv helpers
Date: Fri, 26 Aug 2022 00:14:09 +0200
Message-Id: <20220825221411.35122-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
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

Rewrite the blendv helpers so that they can easily be extended to support
the AVX encodings, which make all 4 arguments explicit.

No functional changes to the existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-20-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 101 ++++++++++++++++--------------------------
 1 file changed, 39 insertions(+), 62 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 6d5f9b9323..1ff3e92331 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1644,76 +1644,53 @@ void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     }
 }
 
-#define XMM0 (env->xmm_regs[0])
+#if SHIFT >= 1
 
-#if SHIFT == 1
 #define SSE_HELPER_V(name, elem, num, F)                                \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)           \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
     {                                                                   \
-        d->elem(0) = F(d->elem(0), s->elem(0), XMM0.elem(0));           \
-        d->elem(1) = F(d->elem(1), s->elem(1), XMM0.elem(1));           \
-        if (num > 2) {                                                  \
-            d->elem(2) = F(d->elem(2), s->elem(2), XMM0.elem(2));       \
-            d->elem(3) = F(d->elem(3), s->elem(3), XMM0.elem(3));       \
-            if (num > 4) {                                              \
-                d->elem(4) = F(d->elem(4), s->elem(4), XMM0.elem(4));   \
-                d->elem(5) = F(d->elem(5), s->elem(5), XMM0.elem(5));   \
-                d->elem(6) = F(d->elem(6), s->elem(6), XMM0.elem(6));   \
-                d->elem(7) = F(d->elem(7), s->elem(7), XMM0.elem(7));   \
-                if (num > 8) {                                          \
-                    d->elem(8) = F(d->elem(8), s->elem(8), XMM0.elem(8)); \
-                    d->elem(9) = F(d->elem(9), s->elem(9), XMM0.elem(9)); \
-                    d->elem(10) = F(d->elem(10), s->elem(10), XMM0.elem(10)); \
-                    d->elem(11) = F(d->elem(11), s->elem(11), XMM0.elem(11)); \
-                    d->elem(12) = F(d->elem(12), s->elem(12), XMM0.elem(12)); \
-                    d->elem(13) = F(d->elem(13), s->elem(13), XMM0.elem(13)); \
-                    d->elem(14) = F(d->elem(14), s->elem(14), XMM0.elem(14)); \
-                    d->elem(15) = F(d->elem(15), s->elem(15), XMM0.elem(15)); \
-                }                                                       \
-            }                                                           \
+        Reg *v = d;                                                     \
+        Reg *m = &env->xmm_regs[0];                                     \
+        int i;                                                          \
+        for (i = 0; i < num; i++) {                                     \
+            d->elem(i) = F(v->elem(i), s->elem(i), m->elem(i));         \
         }                                                               \
     }
 
+#define BLEND_I128(elem, num, F, b) do {                                    \
+    d->elem(b + 0) = F(v->elem(b + 0), s->elem(b + 0), ((imm >> 0) & 1));   \
+    d->elem(b + 1) = F(v->elem(b + 1), s->elem(b + 1), ((imm >> 1) & 1));   \
+    if (num > 2) {                                                          \
+        d->elem(b + 2) = F(v->elem(b + 2), s->elem(b + 2), ((imm >> 2) & 1)); \
+        d->elem(b + 3) = F(v->elem(b + 3), s->elem(b + 3), ((imm >> 3) & 1)); \
+    }                                                                       \
+    if (num > 4) {                                                          \
+        d->elem(b + 4) = F(v->elem(b + 4), s->elem(b + 4), ((imm >> 4) & 1)); \
+        d->elem(b + 5) = F(v->elem(b + 5), s->elem(b + 5), ((imm >> 5) & 1)); \
+        d->elem(b + 6) = F(v->elem(b + 6), s->elem(b + 6), ((imm >> 6) & 1)); \
+        d->elem(b + 7) = F(v->elem(b + 7), s->elem(b + 7), ((imm >> 7) & 1)); \
+    }                                                                       \
+    } while (0)
+
 #define SSE_HELPER_I(name, elem, num, F)                                \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t imm) \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,   \
+                            uint32_t imm)                               \
     {                                                                   \
-        d->elem(0) = F(d->elem(0), s->elem(0), ((imm >> 0) & 1));       \
-        d->elem(1) = F(d->elem(1), s->elem(1), ((imm >> 1) & 1));       \
-        if (num > 2) {                                                  \
-            d->elem(2) = F(d->elem(2), s->elem(2), ((imm >> 2) & 1));   \
-            d->elem(3) = F(d->elem(3), s->elem(3), ((imm >> 3) & 1));   \
-            if (num > 4) {                                              \
-                d->elem(4) = F(d->elem(4), s->elem(4), ((imm >> 4) & 1)); \
-                d->elem(5) = F(d->elem(5), s->elem(5), ((imm >> 5) & 1)); \
-                d->elem(6) = F(d->elem(6), s->elem(6), ((imm >> 6) & 1)); \
-                d->elem(7) = F(d->elem(7), s->elem(7), ((imm >> 7) & 1)); \
-                if (num > 8) {                                          \
-                    d->elem(8) = F(d->elem(8), s->elem(8), ((imm >> 8) & 1)); \
-                    d->elem(9) = F(d->elem(9), s->elem(9), ((imm >> 9) & 1)); \
-                    d->elem(10) = F(d->elem(10), s->elem(10),           \
-                                    ((imm >> 10) & 1));                 \
-                    d->elem(11) = F(d->elem(11), s->elem(11),           \
-                                    ((imm >> 11) & 1));                 \
-                    d->elem(12) = F(d->elem(12), s->elem(12),           \
-                                    ((imm >> 12) & 1));                 \
-                    d->elem(13) = F(d->elem(13), s->elem(13),           \
-                                    ((imm >> 13) & 1));                 \
-                    d->elem(14) = F(d->elem(14), s->elem(14),           \
-                                    ((imm >> 14) & 1));                 \
-                    d->elem(15) = F(d->elem(15), s->elem(15),           \
-                                    ((imm >> 15) & 1));                 \
-                }                                                       \
-            }                                                           \
+        Reg *v = d;                                                     \
+        int i;                                                          \
+        for (i = 0; i < num; i++) {                                     \
+            int j = i & 7;                                              \
+            d->elem(i) = F(v->elem(i), s->elem(i), (imm >> j) & 1);     \
         }                                                               \
     }
 
 /* SSE4.1 op helpers */
-#define FBLENDVB(d, s, m) ((m & 0x80) ? s : d)
-#define FBLENDVPS(d, s, m) ((m & 0x80000000) ? s : d)
-#define FBLENDVPD(d, s, m) ((m & 0x8000000000000000LL) ? s : d)
-SSE_HELPER_V(helper_pblendvb, B, 16, FBLENDVB)
-SSE_HELPER_V(helper_blendvps, L, 4, FBLENDVPS)
-SSE_HELPER_V(helper_blendvpd, Q, 2, FBLENDVPD)
+#define FBLENDVB(v, s, m) ((m & 0x80) ? s : v)
+#define FBLENDVPS(v, s, m) ((m & 0x80000000) ? s : v)
+#define FBLENDVPD(v, s, m) ((m & 0x8000000000000000LL) ? s : v)
+SSE_HELPER_V(helper_pblendvb, B, 8 << SHIFT, FBLENDVB)
+SSE_HELPER_V(helper_blendvps, L, 2 << SHIFT, FBLENDVPS)
+SSE_HELPER_V(helper_blendvpd, Q, 1 << SHIFT, FBLENDVPD)
 
 void glue(helper_ptest, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
@@ -1979,10 +1956,10 @@ void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 }
 #endif
 
-#define FBLENDP(d, s, m) (m ? s : d)
-SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
-SSE_HELPER_I(helper_blendpd, Q, 2, FBLENDP)
-SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
+#define FBLENDP(v, s, m) (m ? s : v)
+SSE_HELPER_I(helper_blendps, L, 2 << SHIFT, FBLENDP)
+SSE_HELPER_I(helper_blendpd, Q, 1 << SHIFT, FBLENDP)
+SSE_HELPER_I(helper_pblendw, W, 4 << SHIFT, FBLENDP)
 
 void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                uint32_t mask)
-- 
2.37.1



