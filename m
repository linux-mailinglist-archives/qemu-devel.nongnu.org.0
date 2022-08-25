Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A165A1745
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 18:55:13 +0200 (CEST)
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRG8O-0001ew-H7
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 12:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRG20-000689-8V
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 12:48:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRG1x-0002Oc-5q
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 12:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661446112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4F7JyGUN6Ik/gJc/PLLg+kIf9SE5uPDEWBtsr9MyWFY=;
 b=ZAbFE64PhdA1EFC+LQIcVjw+eDGDY5J7fUoM8ye/NlfuvNgfPlPETvkwVVYZ/gpkxHIwmQ
 L+Gqx0Y0GbR847UK7cW8WLNrvRmBCQ3x61Z5ece+Q1nFXuE5PX2Gq6jQfQf3gCYA9PUSNO
 i47w2K7vw3vapvd4XsKfKupImLGneH4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-JBxU6RUbM12ng0IKT0MFyw-1; Thu, 25 Aug 2022 12:48:30 -0400
X-MC-Unique: JBxU6RUbM12ng0IKT0MFyw-1
Received: by mail-wm1-f71.google.com with SMTP id
 a17-20020a05600c349100b003a545125f6eso2684019wmq.4
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 09:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=4F7JyGUN6Ik/gJc/PLLg+kIf9SE5uPDEWBtsr9MyWFY=;
 b=vNTZ6qfDSwqndnCe6zpdD/B348JMRRCd9+kwRQJOfgVyP6qMjXe1BfLRZoM2Ax13hN
 HdrFwyKC1feH32nPGaEaGYTZzMOOm720RBLSi+EO6oqECt12A7T/JFdAJLCWQAQrGqYI
 BEFi8lGghe4VNgVXXC7kYaNKj02V98vn6cK1IKGcu3PWp+LyLsdDdIV20sgtWDcnaZxs
 o5TNcS7jU5P/nsY2Jymu3WaDPUhOBAxRnSMegymBCBTWpLUrnEHT+gu3q2ElSMXH3S8B
 AjnVOTkK8CWUBqlNFFag7RcW8QZFEfGR9JL2k0OjWRBzgLWrZ79BaujTyVTqMMsK/JGL
 EcTA==
X-Gm-Message-State: ACgBeo1+9wQKCD+4L7fNO4LjnCd7+AYNibQIHi0KCJrZG/FJIpyc8a51
 Prbm/2d88NxjR4X1Dox1e3+zTRQ4usddLACDkgY6zF9MjEqSlqsM8OgdK1/HXrtCvY7sbcqLeDd
 2RVVM6VSo8HnxEAiBK9IqKw+oZnzdt5O5MXmTfQmftSZXxrNr4tLEQbbU6QAQVP6jvhU=
X-Received: by 2002:a05:6000:1c0c:b0:225:569c:dd2c with SMTP id
 ba12-20020a0560001c0c00b00225569cdd2cmr2750275wrb.628.1661446108805; 
 Thu, 25 Aug 2022 09:48:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5/mPqI9ITlQVDF9L6Bs6phC+LNTDQcqB6Wy87M329TVORCsOQZeqEnvpDvGVPJYZodkWrEVA==
X-Received: by 2002:a05:6000:1c0c:b0:225:569c:dd2c with SMTP id
 ba12-20020a0560001c0c00b00225569cdd2cmr2750257wrb.628.1661446108268; 
 Thu, 25 Aug 2022 09:48:28 -0700 (PDT)
Received: from goa-sendmail ([93.56.170.129]) by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c4e0500b003a331c6bffdsm5663561wmq.47.2022.08.25.09.48.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 09:48:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] i386: DPPS rounding fix
Date: Thu, 25 Aug 2022 18:48:27 +0200
Message-Id: <20220825164827.392942-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
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

The DPPS (Dot Product) instruction is defined to first sum pairs of
intermediate results, then sum those values to get the final result.
i.e. (A+B)+(C+D)

We incrementally sum the results, i.e. ((A+B)+C)+D, which can result
in incorrect rouding.

For consistency, also change the variable names to the ones used
in the Intel SDM and implement DPPD following the manual.

Based on a patch by Paul Brook <paul@nowt.org>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 67 ++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 2524db4c25..b12b271fcd 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1943,56 +1943,59 @@ SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
 
 void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
 {
-    float32 iresult = float32_zero;
+    float32 prod1, prod2, temp2, temp3, temp4;
 
+    /*
+     * We must evaluate (A+B)+(C+D), not ((A+B)+C)+D
+     * to correctly round the intermediate results
+     */
     if (mask & (1 << 4)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(0), s->ZMM_S(0),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod1 = float32_mul(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
+    } else {
+        prod1 = float32_zero;
     }
     if (mask & (1 << 5)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(1), s->ZMM_S(1),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod2 = float32_mul(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
+    } else {
+        prod2 = float32_zero;
     }
+    temp2 = float32_add(prod1, prod2, &env->sse_status);
     if (mask & (1 << 6)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(2), s->ZMM_S(2),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod1 = float32_mul(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
+    } else {
+        prod1 = float32_zero;
     }
     if (mask & (1 << 7)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(3), s->ZMM_S(3),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod2 = float32_mul(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
+    } else {
+        prod2 = float32_zero;
     }
-    d->ZMM_S(0) = (mask & (1 << 0)) ? iresult : float32_zero;
-    d->ZMM_S(1) = (mask & (1 << 1)) ? iresult : float32_zero;
-    d->ZMM_S(2) = (mask & (1 << 2)) ? iresult : float32_zero;
-    d->ZMM_S(3) = (mask & (1 << 3)) ? iresult : float32_zero;
+    temp3 = float32_add(prod1, prod2, &env->sse_status);
+    temp4 = float32_add(temp2, temp3, &env->sse_status);
+
+    d->ZMM_S(0) = (mask & (1 << 0)) ? temp4 : float32_zero;
+    d->ZMM_S(1) = (mask & (1 << 1)) ? temp4 : float32_zero;
+    d->ZMM_S(2) = (mask & (1 << 2)) ? temp4 : float32_zero;
+    d->ZMM_S(3) = (mask & (1 << 3)) ? temp4 : float32_zero;
 }
 
 void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
 {
-    float64 iresult = float64_zero;
+    float64 prod1, prod2, temp2;
 
     if (mask & (1 << 4)) {
-        iresult = float64_add(iresult,
-                              float64_mul(d->ZMM_D(0), s->ZMM_D(0),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod1 = float64_mul(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
+    } else {
+        prod1 = float64_zero;
     }
     if (mask & (1 << 5)) {
-        iresult = float64_add(iresult,
-                              float64_mul(d->ZMM_D(1), s->ZMM_D(1),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod2 = float64_mul(d->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
+    } else {
+        prod2 = float64_zero;
     }
-    d->ZMM_D(0) = (mask & (1 << 0)) ? iresult : float64_zero;
-    d->ZMM_D(1) = (mask & (1 << 1)) ? iresult : float64_zero;
+    temp2 = float64_add(prod1, prod2, &env->sse_status);
+    d->ZMM_D(0) = (mask & (1 << 0)) ? temp2 : float64_zero;
+    d->ZMM_D(1) = (mask & (1 << 1)) ? temp2 : float64_zero;
 }
 
 void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-- 
2.37.1


