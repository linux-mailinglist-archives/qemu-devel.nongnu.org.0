Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD7E39060B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:59:03 +0200 (CEST)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZSQ-0002uI-JJ
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc6-0004ox-An
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc2-0004x7-8p
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:58 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f20-20020a05600c4e94b0290181f6edda88so6762581wmq.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EgGpN6avG1B0VMrqoYmkFvmTpXKCe3xtK0Cu1GAgmOw=;
 b=W8BJHKuWlWou1/J0wtpoHMgoYZLqNvIeaGET6WDP4w2IVPuUMtXMN79pmGEmvFHYKn
 eqFkr5cX0GR1oL+iwlQb0WvOkRfcOvaeiD31R0eMmpo2HQ2iXSExMgLmROs8/6Lkv0G2
 SD1Vcqnfe7i49dYwJx7RZ9q225+Q4Tl7CTqSnf7yhJxPryAgW7EYDS4z+Av+4fiWA6Gz
 ZdCibnYk9tVz/I9d+KWhOahCTbxTwEU2IkAdPjQgIjFQ6K0E+fPpuaFVMfJCh7Z1r+DD
 yFYyr4qnC3Ikz5CYpXnAOQnLjf0RgcXGz6bq59CHXtZLxJ6Ri7mQxpt1oDI5DQSXuC0Z
 TYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EgGpN6avG1B0VMrqoYmkFvmTpXKCe3xtK0Cu1GAgmOw=;
 b=VNyXjOMDjKgc9H9rq4dBEgQk5TN2M8s8FhMWPCjnL9MO3/DRQi+aV2V5l2vj03OXU4
 nGB8qGNCtiU9PDL3A3RX4s+AX0aG4J2XBKLeKOrWAwh+psYTE+lE0GM+SvkjRDNcFwXU
 3m+hm6eZpXkc/rP67WpLVnu6XlMRJoB69/lT46FfLhxt8j/0bn1JDr7/Vw8QX+lDj/+A
 OAtzYwU4iyWZLAw+l66Q1X4N6QO3bfwTXSQkpK3qfpj4JMvEDKqnVkAgjgwbz39v1qKg
 ZHinrY53hU81bU7wi5Xn9FekASoMbOyyoEWkICXLff4o6PGyqof540SuJhhHY9mIcFrI
 KP0A==
X-Gm-Message-State: AOAM533eaE2k/lUcIsjbQ9UXp8ygREbtZLh9/5m1Qi/Mf4sCe6wEuTWx
 paGA8lSULYBDutBkmBCRPTrhD6lEsTqyr0mN
X-Google-Smtp-Source: ABdhPJzywabqYquhhWY0Xv5HqcCl7ctl8rbt+JPADtKdJjvtLVCbCuqRp1YNEDmbuB5/PMpaw/+HGA==
X-Received: by 2002:a1c:1f4f:: with SMTP id f76mr24423072wmf.62.1621955087760; 
 Tue, 25 May 2021 08:04:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 086/114] target/arm: Macroize helper_gvec_{s,u}dot_{b,h}
Date: Tue, 25 May 2021 16:02:56 +0100
Message-Id: <20210525150324.32370-87-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Richard Henderson <richard.henderson@linaro.org>

We're about to add more variations on this theme.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-65-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vec_helper.c | 82 ++++++++++-------------------------------
 1 file changed, 20 insertions(+), 62 deletions(-)

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 8b7269d8e1e..cddf095c74a 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -543,73 +543,31 @@ void HELPER(sve2_sqrdmulh_idx_d)(void *vd, void *vn, void *vm, uint32_t desc)
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
- * with respect to the ordering of data within the 64-bit lanes.
+ * with respect to the ordering of data within the quad-width lanes.
  * All elements are treated equally, no matter where they are.
  */
 
-void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    int32_t *d = vd, *a = va;
-    int8_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 4; ++i) {
-        d[i] = (a[i] +
-                n[i * 4 + 0] * m[i * 4 + 0] +
-                n[i * 4 + 1] * m[i * 4 + 1] +
-                n[i * 4 + 2] * m[i * 4 + 2] +
-                n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
+#define DO_DOT(NAME, TYPED, TYPEN, TYPEM) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
+{                                                                         \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                \
+    TYPED *d = vd, *a = va;                                               \
+    TYPEN *n = vn;                                                        \
+    TYPEM *m = vm;                                                        \
+    for (i = 0; i < opr_sz / sizeof(TYPED); ++i) {                        \
+        d[i] = (a[i] +                                                    \
+                (TYPED)n[i * 4 + 0] * m[i * 4 + 0] +                      \
+                (TYPED)n[i * 4 + 1] * m[i * 4 + 1] +                      \
+                (TYPED)n[i * 4 + 2] * m[i * 4 + 2] +                      \
+                (TYPED)n[i * 4 + 3] * m[i * 4 + 3]);                      \
+    }                                                                     \
+    clear_tail(d, opr_sz, simd_maxsz(desc));                              \
 }
 
-void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    uint32_t *d = vd, *a = va;
-    uint8_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 4; ++i) {
-        d[i] = (a[i] +
-                n[i * 4 + 0] * m[i * 4 + 0] +
-                n[i * 4 + 1] * m[i * 4 + 1] +
-                n[i * 4 + 2] * m[i * 4 + 2] +
-                n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
-
-void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    int64_t *d = vd, *a = va;
-    int16_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 8; ++i) {
-        d[i] = (a[i] +
-                (int64_t)n[i * 4 + 0] * m[i * 4 + 0] +
-                (int64_t)n[i * 4 + 1] * m[i * 4 + 1] +
-                (int64_t)n[i * 4 + 2] * m[i * 4 + 2] +
-                (int64_t)n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
-
-void HELPER(gvec_udot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    uint64_t *d = vd, *a = va;
-    uint16_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 8; ++i) {
-        d[i] = (a[i] +
-                (uint64_t)n[i * 4 + 0] * m[i * 4 + 0] +
-                (uint64_t)n[i * 4 + 1] * m[i * 4 + 1] +
-                (uint64_t)n[i * 4 + 2] * m[i * 4 + 2] +
-                (uint64_t)n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
+DO_DOT(gvec_sdot_b, int32_t, int8_t, int8_t)
+DO_DOT(gvec_udot_b, uint32_t, uint8_t, uint8_t)
+DO_DOT(gvec_sdot_h, int64_t, int16_t, int16_t)
+DO_DOT(gvec_udot_h, uint64_t, uint16_t, uint16_t)
 
 void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm,
                              void *va, uint32_t desc)
-- 
2.20.1


