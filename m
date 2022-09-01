Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF1C5A928A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:59:14 +0200 (CEST)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTg2b-000067-NW
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTexA-0001TV-GT
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTex8-0003BA-GW
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dT+Cm0N8qaLNhVPC331ez8mhNQ20GiFjLqzVTX8b194=;
 b=CCM/CFATP8/FN/wrb677NydjXa65iGcgdx3zVf39Rnsobb8BWPRYGF3aG6pmv4no4HY1Bd
 nJStvJMtyKZ6IZex+4xtpA2JFRlZeGyqBUBsK7hMHEKbJWZ7Xcl4tT77XLBtcPfJcoMPst
 mFITR7EIEIxeAg+WWtZf9ru5YX3dijA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-yjn1Q9vuOoChF09bw0Snbg-1; Thu, 01 Sep 2022 03:49:26 -0400
X-MC-Unique: yjn1Q9vuOoChF09bw0Snbg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j36-20020a05600c1c2400b003a540d88677so9479620wms.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dT+Cm0N8qaLNhVPC331ez8mhNQ20GiFjLqzVTX8b194=;
 b=CW9FwCOw+QuPkOsxWUX6RdnA5Dp5PuVTWbokDFA6ZZ0vGU7YSIYwp8tCHQrWphsnkq
 aZq5yKZtyTwBxg5+MzEDLevZmxcs/Klg+iUJmAhUQdjVQ8vX+U7UOcKFtESF8nesdjBE
 Ubj1cejnQVnks4YDQtRK0bRXDCdmKuUtDxfKI8/k3lzLchSmje41Vems8T/z4wqAVhVO
 HWmBH3g8GtsYN6BNzos9Nu3mjVLvfhv3lD8lqaSdH/quBoPJtgtRVSUrsIZy8x4ELnyB
 dKvdDLMUAWxF4lB5a11iezGCuWN4K6vA3LHkQL+aCIMCexAmclwKs7l1jdfZVBc/I0b/
 0T5g==
X-Gm-Message-State: ACgBeo17YCbFzMg6C5GnWgmfrIxoDQhMZQqGvyqH5FBgFEx9B/MgW+l4
 Eu5K2BPmq62EtOcszQVO/gSufc4pMZsQr3Ln2EN6hpkH7S14rDM4U0o/eDkHvOEFbvOpbkGJPtH
 dQbdlzV9A/LulnztRWmalTVXg8MwlIXnWblAXduagdro7b0eE5IGBRkMKNpdWvqjBkNo=
X-Received: by 2002:a05:600c:4e52:b0:3a6:d89:4d1b with SMTP id
 e18-20020a05600c4e5200b003a60d894d1bmr4360719wmq.150.1662018564799; 
 Thu, 01 Sep 2022 00:49:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR65/i8+miWFhL5mdsvqODo+bGnsD9xQQL4HJViQzFPkrkXUtztTfM8/RF2M7ro8L+pblSFyWA==
X-Received: by 2002:a05:600c:4e52:b0:3a6:d89:4d1b with SMTP id
 e18-20020a05600c4e5200b003a60d894d1bmr4360708wmq.150.1662018564536; 
 Thu, 01 Sep 2022 00:49:24 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b002252884cc91sm13699840wrs.43.2022.09.01.00.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 18/23] i386: Dot product AVX helper prep
Date: Thu,  1 Sep 2022 09:48:37 +0200
Message-Id: <20220901074842.57424-19-pbonzini@redhat.com>
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
index de874e136f..59ed30071e 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1903,55 +1903,64 @@ SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
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
@@ -1959,6 +1968,7 @@ void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
     d->ZMM_D(0) = (mask & (1 << 0)) ? temp2 : float64_zero;
     d->ZMM_D(1) = (mask & (1 << 1)) ? temp2 : float64_zero;
 }
+#endif
 
 void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t offset)
-- 
2.37.1



