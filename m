Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDF0390CB7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:05:17 +0200 (CEST)
Received: from localhost ([::1]:48016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llg6u-0008Mn-T3
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0U-0002kh-HJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:38 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0G-0004pQ-Vz
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:38 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso14025415pjb.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sJG2F5NdBXHXD1yr3mStAXC+a80roqb/xw3NOJ00r48=;
 b=wBuUowm5x65NNpz5TLLDCSlRUzaM431oqZxs5ZkHVf6tLXriSEuKvWHK1WzLQ1NuKe
 6aJOlcFt/K9FjLt55apZfTw/T7hdfEtYUPmFX8Fkytg/JHWH9/xepD7BYqw3NgtLfvwg
 YRdqAgJF9ptdhYAaesAsRvevNsIRAwbFq3TaauR9t1bVAAQvMXXn7LUs0ucCT+pjumHZ
 1jHKZjnT4DFS5JAhrN95RD1O4uTK0A5UsNGZwXC949AHNpVFyiXe0NV2k26272TuiorV
 mIeWkQYMRHT6q7SMp4TCIB6esPQVZEGmW7L4zRzg2BsPWqUhBPrwY2R4l1w/m1cw9ixo
 BZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sJG2F5NdBXHXD1yr3mStAXC+a80roqb/xw3NOJ00r48=;
 b=ppUeEB9Tz08s4NgcoTi/bjbfWXBXbIONhirtqkJPGWKsxE/xkwsjKDme1ktXZ/9dQD
 oHTG/IcM4jVYiRgiCgHxqrFrQvDrOUov3BWnCxo8PcTLwJ9IXJ9o0Nabfd6kcex6jCKB
 sb+XAUNvt4QSlMiyg4Hhwr8vQnY5igsKf9Job9XV63UTgOJJtMDqJjzycqvDRLcnb+MS
 yuqxAa66ecP9O9slH1hyddjdRjxQEJZKUrp/FcyxjxyPPZisPkCVcOHf8yeQ9d55EQqV
 mZQlwfNpbxhpjuFrkQp1Sn5pELgTghe0/R0mkVJYJCG0q91NdJYt5YmlzslbTTDe34H9
 cmUw==
X-Gm-Message-State: AOAM533W5y+gibx1eHsNFuDDOvOz9lG+TxnG0yDF0z7E2CdgTxJK1ygW
 2+GUgxI3Wb24T3OL83sTArZPBUV92+AOLQ==
X-Google-Smtp-Source: ABdhPJwO6ZsnaHRWJ4FwQGRkOG7fYiqiMInegEoQVR07yjltN459YZNLjIciXDLuZWDzl9Nl4XAGAA==
X-Received: by 2002:a17:902:db01:b029:f6:4a13:1764 with SMTP id
 m1-20020a170902db01b02900f64a131764mr28984664plx.25.1621983502892; 
 Tue, 25 May 2021 15:58:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] target/arm: Implement bfloat16 dot product (indexed)
Date: Tue, 25 May 2021 15:58:12 -0700
Message-Id: <20210525225817.400336-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is BFDOT for both AArch64 AdvSIMD and SVE,
and VDOT.BF16 for AArch32 NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h           |  2 ++
 target/arm/neon-shared.decode |  2 ++
 target/arm/sve.decode         |  3 +++
 target/arm/translate-a64.c    | 41 +++++++++++++++++++++++++++--------
 target/arm/translate-neon.c   |  9 ++++++++
 target/arm/translate-sve.c    | 12 ++++++++++
 target/arm/vec_helper.c       | 20 +++++++++++++++++
 7 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index de2f5331dc..376c1cef0f 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1004,6 +1004,8 @@ DEF_HELPER_FLAGS_5(gvec_usmmla_b, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_5(gvec_bfdot, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_bfdot_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 31a0839bbb..fa3cf14e3a 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -81,6 +81,8 @@ VUSDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp
 VSUDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 1 vm:4 \
                vn=%vn_dp vd=%vd_dp
+VDOT_b16_scal  1111 1110 0 . 00 .... .... 1101 . q:1 index:1 0 vm:4 \
+               vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
 %vfml_scalar_q1_index 5:1 3:1
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a7429b293f..51f87e8937 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1633,3 +1633,6 @@ FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
 FMLALT_zzxw     01100100 10 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 FMLSLB_zzxw     01100100 10 1 ..... 0110.0 ..... .....     @rrxr_3a esz=2
 FMLSLT_zzxw     01100100 10 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
+
+### SVE2 floating-point bfloat16 dot-product (indexed)
+BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 127c8d8e9d..1df931cef5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13442,8 +13442,22 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             return;
         }
         break;
-    case 0x0f: /* SUDOT, USDOT */
-        if (is_scalar || (size & 1) || !dc_isar_feature(aa64_i8mm, s)) {
+    case 0x0f:
+        switch (size) {
+        case 0: /* SUDOT */
+        case 2: /* USDOT */
+            if (is_scalar || !dc_isar_feature(aa64_i8mm, s)) {
+                unallocated_encoding(s);
+                return;
+            }
+            break;
+        case 1: /* BFDOT */
+            if (is_scalar || !dc_isar_feature(aa64_bf16, s)) {
+                unallocated_encoding(s);
+                return;
+            }
+            break;
+        default:
             unallocated_encoding(s);
             return;
         }
@@ -13563,13 +13577,22 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                          u ? gen_helper_gvec_udot_idx_b
                          : gen_helper_gvec_sdot_idx_b);
         return;
-    case 0x0f: /* SUDOT, USDOT */
-        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
-                         extract32(insn, 23, 1)
-                         ? gen_helper_gvec_usdot_idx_b
-                         : gen_helper_gvec_sudot_idx_b);
-        return;
-
+    case 0x0f:
+        switch (extract32(insn, 22, 2)) {
+        case 0: /* SUDOT */
+            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                             gen_helper_gvec_sudot_idx_b);
+            return;
+        case 1: /* BFDOT */
+            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                             gen_helper_gvec_bfdot_idx);
+            return;
+        case 2: /* USDOT */
+            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                             gen_helper_gvec_usdot_idx_b);
+            return;
+        }
+        g_assert_not_reached();
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 9460857b2a..8099767792 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -390,6 +390,15 @@ static bool trans_VSUDOT_scalar(DisasContext *s, arg_VSUDOT_scalar *a)
                         gen_helper_gvec_sudot_idx_b);
 }
 
+static bool trans_VDOT_b16_scal(DisasContext *s, arg_VDOT_b16_scal *a)
+{
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_bfdot_idx);
+}
+
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
 {
     int opr_sz;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ed290827ad..6f02030635 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8665,3 +8665,15 @@ static bool trans_BFDOT_zzzz(DisasContext *s, arg_rrrr_esz *a)
     }
     return true;
 }
+
+static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_bf16, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot_idx,
+                          a->rd, a->rn, a->rm, a->ra, a->index);
+    }
+    return true;
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 7eefcd06ea..74a497f38c 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2452,3 +2452,23 @@ void HELPER(gvec_bfdot)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_bfdot_idx)(void *vd, void *vn, void *vm,
+                            void *va, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    intptr_t index = simd_data(desc);
+    intptr_t elements = opr_sz / 4;
+    intptr_t eltspersegment = MIN(16 / 4, elements);
+    float32 *d = vd, *a = va;
+    uint32_t *n = vn, *m = vm;
+
+    for (i = 0; i < elements; i += eltspersegment) {
+        uint32_t m_idx = m[i + H4(index)];
+
+        for (j = i; j < i + eltspersegment; j++) {
+            d[j] = bfdotadd(a[j], n[j], m_idx);
+        }
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.25.1


