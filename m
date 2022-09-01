Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB435A9FA4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 21:12:55 +0200 (CEST)
Received: from localhost ([::1]:43538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpcU-0002kL-3q
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 15:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosw-00009X-Hu
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosq-0000Ct-L2
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVE8Uu9rZf8n301GIiEKt2SI9XFhWH/zsAv542A+wS4=;
 b=FrxBc9Eis6MeBs8RI1XWyQd0I/naOJeYs7K2ZO+f85a8jIO7UMWBrWggjKFZMNUI3uYIxw
 8iX01n4C0fjWtsqOYUhsQemlcm7lSHB6wXSyheYEUbO1/qebzxf1NcnwH1n3Y+7HAxcteJ
 liPQDKAqCXXJLdWxtCuQ7X/bM6PcB8U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-8TJQKI5ZNXG-bSCRiI5FGQ-1; Thu, 01 Sep 2022 14:25:40 -0400
X-MC-Unique: 8TJQKI5ZNXG-bSCRiI5FGQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 v1-20020a056402348100b00448acc79177so7155252edc.23
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xVE8Uu9rZf8n301GIiEKt2SI9XFhWH/zsAv542A+wS4=;
 b=UT3COoKkOPNmG3pOkuLTqMpCw2oFErR1VuQMgDr+2d4YF0/UOOE+MiS/xU6CRyEjF6
 qlshjpzx1zp71oLj7fE+PognV1mbhRpEVxDMiPM5+e7zR6pwtcbZGGCqyt0F1n3C6YMf
 vbRIO7nBJnWcHTjGYOO0fjUrzicl/Iy20JPlQGPxbnP89WVIgMtB43fO9Gl8b+xGA/W/
 bGg5a9wnVfjyVpA/cWVDiyJybEvYvKKsEb/MFQcF+FFsbKGezoeqr8O9MtPQgCxzs1X8
 UpTSUOCxwyGBAvs39xP884+Y4EHZ8nF6p5RL9W1rSdEUi8Ezkikwym3cEpoxXFoUKjQL
 9Krg==
X-Gm-Message-State: ACgBeo2wBuCaguCTpWlUIvDwtgGgyWtTPHAOubY+bRtSlos0IVtRCD8e
 L5TcpPv9w//kYLJhcJ1GlJRezpkGWMgLvFPytluwaNLYt+gFxWzVo2s9sAmLVi3SXzh7QUvePQQ
 i/rtbNhNaC375J+eSsfuWdFpi4HOigLHzj1DktDoO3KHUUQ8fw4hysmhvNFx7ZBnvWUA=
X-Received: by 2002:a05:6402:1e8c:b0:448:8776:d813 with SMTP id
 f12-20020a0564021e8c00b004488776d813mr15746653edf.15.1662056739130; 
 Thu, 01 Sep 2022 11:25:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4TkdWfOZjxHLiXLbzZEkzVW9xS5AeUBL29VYFTx6mpimUrpve1v7I5k+4EwxoWnz3hy89XBA==
X-Received: by 2002:a05:6402:1e8c:b0:448:8776:d813 with SMTP id
 f12-20020a0564021e8c00b004488776d813mr15746634edf.15.1662056738844; 
 Thu, 01 Sep 2022 11:25:38 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05640217d300b0044780b6debasm1721225edy.32.2022.09.01.11.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 37/39] target/i386: Rewrite blendv helpers
Date: Thu,  1 Sep 2022 20:24:27 +0200
Message-Id: <20220901182429.93533-38-pbonzini@redhat.com>
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

Rewrite the blendv helpers so that they can easily be extended to support
the AVX encodings, which make all 4 arguments explicit.

No functional changes to the existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-20-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 86 ++++++++++++-------------------------------
 1 file changed, 24 insertions(+), 62 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0c4257dee7..5241663227 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1591,76 +1591,38 @@ void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
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
@@ -1926,10 +1888,10 @@ void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
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
2.37.2



