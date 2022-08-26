Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09C05A32B6
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:39:18 +0200 (CEST)
Received: from localhost ([::1]:55516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRiuz-0003iY-NK
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVl-0007NE-Vx
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVX-0007r4-Kx
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dXDG0T4lgQtoZWVDW9qu9uiTkBCwz2icaBi/0SFHNjk=;
 b=CKiz/FPg5InstVVhlS6KhEQZavNySvuXiJ3rO3lBuwVveCpYKjafvf2W0kgQF0vNW93XW5
 xSuvMEGO/efZMm0Xiz2gcRxG9Y/Ptzs3RQAjiunp1omHcZfyVnN9gKCmXkylqJGfPLHpu/
 dQedeKihEl4vE2VjWpk4wA8WOOl1g4A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-aRutDFsVOhCcGDVlWfd1BA-1; Fri, 26 Aug 2022 19:12:47 -0400
X-MC-Unique: aRutDFsVOhCcGDVlWfd1BA-1
Received: by mail-ed1-f72.google.com with SMTP id
 q18-20020a056402519200b0043dd2ff50feso1845825edd.9
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dXDG0T4lgQtoZWVDW9qu9uiTkBCwz2icaBi/0SFHNjk=;
 b=VRZJysH9947CTZWRLH9fIKltQswcJlV+Rfbs9wbeF74NcQjAxe0YyojcaFkmv6i5GK
 PuyQNS8CiX/YxkAJsfGeWCRUSF3qM1CJacTKaWTqJSR3f7TA9Ei1aZSHSs3XcE4TP1+9
 DGLjs1LqiKN3qTRpcCjMFgJxLOrbs74pwVvAstg95B1rO4d7eymulXprFK7Uc9li8fZm
 CM26S1hH4km2J31kRlsTalDLpvOPOiejVLnKzc/1iJjthVzc4mwlG7Nad2pzjZ/yI6b9
 BvjBkKUV39l2z0GsidiwaohlVHVhw9FKnNDe6ZyUdF+2DswwVx82Du2WrIKsQp2/SPEE
 tXpA==
X-Gm-Message-State: ACgBeo2rc7yjrWd1lf3TGHBhuEnCliZ5g5dKVOquLuVzRkRQmY9UFtFq
 bpd2FVcYcuwSV3D55inpU5SQJMQ0N8t7itAyStV5Vwjn/t11xAozVb4v9e2aIvilSJIJ5NGoi7U
 /GbHatkhHAkb0FXmHGWjG2cxubuLQf+pjLAmRzI/7AOkT0oVT7CqDWyTpvIhXqy7U6yw=
X-Received: by 2002:a17:907:6eaa:b0:741:44e3:d9e4 with SMTP id
 sh42-20020a1709076eaa00b0074144e3d9e4mr637013ejc.424.1661555565786; 
 Fri, 26 Aug 2022 16:12:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4wHj2yZz1mGMc9JuOBJVgaz1FYoWHeQYuwR5lH5TGorYOg05UsFBGeMtqfMKjdcfHlVbCb0A==
X-Received: by 2002:a17:907:6eaa:b0:741:44e3:d9e4 with SMTP id
 sh42-20020a1709076eaa00b0074144e3d9e4mr636996ejc.424.1661555565527; 
 Fri, 26 Aug 2022 16:12:45 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 g30-20020a056402321e00b00445bda73fbesm1925079eda.33.2022.08.26.16.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 18/23] i386: Dot product AVX helper prep
Date: Sat, 27 Aug 2022 01:11:59 +0200
Message-Id: <20220826231204.201395-19-pbonzini@redhat.com>
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

Make the dpps and dppd helpers AVX-ready

I can't see any obvious reason why dppd shouldn't work on 256 bit ymm
registers, but both AMD and Intel agree that it's xmm only.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-17-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 80 ++++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index f0bb30ba53..17d04888c5 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1925,55 +1925,64 @@ SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
 SSE_HELPER_I(helper_blendpd, Q, 2, FBLENDP)
 SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
 
-void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
+void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+                               uint32_t mask)
 {
+    Reg *v = d;
     float32 prod1, prod2, temp2, temp3, temp4;
+    int i;
 
-    /*
-     * We must evaluate (A+B)+(C+D), not ((A+B)+C)+D
-     * to correctly round the intermediate results
-     */
-    if (mask & (1 << 4)) {
-        prod1 = float32_mul(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
-    } else {
-        prod1 = float32_zero;
-    }
-    if (mask & (1 << 5)) {
-        prod2 = float32_mul(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
-    } else {
-        prod2 = float32_zero;
-    }
-    temp2 = float32_add(prod1, prod2, &env->sse_status);
-    if (mask & (1 << 6)) {
-        prod1 = float32_mul(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
-    } else {
-        prod1 = float32_zero;
-    }
-    if (mask & (1 << 7)) {
-        prod2 = float32_mul(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
-    } else {
-        prod2 = float32_zero;
-    }
-    temp3 = float32_add(prod1, prod2, &env->sse_status);
-    temp4 = float32_add(temp2, temp3, &env->sse_status);
+    for (i = 0; i < 2 << SHIFT; i += 4) {
+        /*
+         * We must evaluate (A+B)+(C+D), not ((A+B)+C)+D
+         * to correctly round the intermediate results
+         */
+        if (mask & (1 << 4)) {
+            prod1 = float32_mul(v->ZMM_S(i), s->ZMM_S(i), &env->sse_status);
+        } else {
+            prod1 = float32_zero;
+        }
+        if (mask & (1 << 5)) {
+            prod2 = float32_mul(v->ZMM_S(i+1), s->ZMM_S(i+1), &env->sse_status);
+        } else {
+            prod2 = float32_zero;
+        }
+        temp2 = float32_add(prod1, prod2, &env->sse_status);
+        if (mask & (1 << 6)) {
+            prod1 = float32_mul(v->ZMM_S(i+2), s->ZMM_S(i+2), &env->sse_status);
+        } else {
+            prod1 = float32_zero;
+        }
+        if (mask & (1 << 7)) {
+            prod2 = float32_mul(v->ZMM_S(i+3), s->ZMM_S(i+3), &env->sse_status);
+        } else {
+            prod2 = float32_zero;
+        }
+        temp3 = float32_add(prod1, prod2, &env->sse_status);
+        temp4 = float32_add(temp2, temp3, &env->sse_status);
 
-    d->ZMM_S(0) = (mask & (1 << 0)) ? temp4 : float32_zero;
-    d->ZMM_S(1) = (mask & (1 << 1)) ? temp4 : float32_zero;
-    d->ZMM_S(2) = (mask & (1 << 2)) ? temp4 : float32_zero;
-    d->ZMM_S(3) = (mask & (1 << 3)) ? temp4 : float32_zero;
+        d->ZMM_S(i) = (mask & (1 << 0)) ? temp4 : float32_zero;
+        d->ZMM_S(i+1) = (mask & (1 << 1)) ? temp4 : float32_zero;
+        d->ZMM_S(i+2) = (mask & (1 << 2)) ? temp4 : float32_zero;
+        d->ZMM_S(i+3) = (mask & (1 << 3)) ? temp4 : float32_zero;
+    }
 }
 
-void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
+#if SHIFT == 1
+/* Oddly, there is no ymm version of dppd */
+void glue(helper_dppd, SUFFIX)(CPUX86State *env,
+                               Reg *d, Reg *s, uint32_t mask)
 {
+    Reg *v = d;
     float64 prod1, prod2, temp2;
 
     if (mask & (1 << 4)) {
-        prod1 = float64_mul(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
+        prod1 = float64_mul(v->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
     } else {
         prod1 = float64_zero;
     }
     if (mask & (1 << 5)) {
-        prod2 = float64_mul(d->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
+        prod2 = float64_mul(v->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
     } else {
         prod2 = float64_zero;
     }
@@ -1981,6 +1990,7 @@ void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
     d->ZMM_D(0) = (mask & (1 << 0)) ? temp2 : float64_zero;
     d->ZMM_D(1) = (mask & (1 << 1)) ? temp2 : float64_zero;
 }
+#endif
 
 void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t offset)
-- 
2.37.1



