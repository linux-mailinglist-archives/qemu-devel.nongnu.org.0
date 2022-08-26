Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8C75A32BF
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:43:27 +0200 (CEST)
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRiz0-0006yr-TT
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVm-0007P6-J1
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVX-0007rK-Kw
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DEO/olqE9tW3TFJpHSpIhXVaOnMkzlGBZP7IVsXs58=;
 b=W/DFZoVuDn8j0NCP3cnt0YOht8NwTUBAn+f8PzQV2/7rzi0t/AVzxXfl7Do2PHDDIF4Hz0
 eMqcnGiQnh+wDXVsJMcGBeniF5KJc0M459/D4j1aoCFRZm/pVvUnqh5/8raXT5RmJudXOH
 uPqo1JLp0ZUaKPV4WhFN8RJx4y/p8hk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-48-LzxJN6GuPGSnogvp3CZfQA-1; Fri, 26 Aug 2022 19:12:51 -0400
X-MC-Unique: LzxJN6GuPGSnogvp3CZfQA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so1837454eda.19
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0DEO/olqE9tW3TFJpHSpIhXVaOnMkzlGBZP7IVsXs58=;
 b=bMg9uOe1K5DpEhNcpgFdFmjfc0oZLv3W00Hfi7dcosz6f8lW2MJF+2HR3bEOPCO9yQ
 b4FGyRfYSv9/2ruQ9XcxtfsD+gZuKNg5ZMKBbPfc0x8iLpq9fOUco3shhsWK7XTLpjbn
 1t7h4FNBJtu8grNxFKP/EkprmrPm2797HEU6HkJa53lQzUL9lyjyzbS2mFd5+NGkBTfT
 oQehJSib7d+2PZaZlQdGGnttxz0jW0lD5keQWpH9Mr08ptopPnKLpZYTdj/IZmBzijw4
 t43Dv6BkElTZk53YaA2GYC7WB/U8fB0vRgr96OOsvvPvzIrjSN/TvBfzmyPL2SlV/J0g
 1c+w==
X-Gm-Message-State: ACgBeo1ZKVv9OM7gkPjfj3qcTbYiOo6lmomrDEhmZOXA+91xTk3GxZQW
 fsHDkKmHq9b53uTXsNIFGEZF8eWXxX7glbKmnFnIPSlQx+Tz19q7YC1md2LzBgPGmBVC7qov7iY
 a8c7ZDVovtChtQ3CHW69A9DGVxt50bFjwEchjGtYZIvTQoumIYzEiDEGQsmI9L5i/t48=
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id
 x19-20020a1709064bd300b007313bdfb95cmr6790819ejv.677.1661555570460; 
 Fri, 26 Aug 2022 16:12:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6+s8NEZMSrPd4b63MVw0yzfuTwvCkklHc4GYDMOh3Ql3ma8qFG+nsfE5k+uLE/v+ikO1ZBiw==
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id
 x19-20020a1709064bd300b007313bdfb95cmr6790806ejv.677.1661555570182; 
 Fri, 26 Aug 2022 16:12:50 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 z22-20020a50cd16000000b00445f9faf13csm1945300edi.72.2022.08.26.16.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 21/23] i386: Rewrite blendv helpers
Date: Sat, 27 Aug 2022 01:12:02 +0200
Message-Id: <20220826231204.201395-22-pbonzini@redhat.com>
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
index 84bbae4b9a..f9cc1d7623 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1627,76 +1627,38 @@ void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
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
@@ -1962,10 +1924,10 @@ void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
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



