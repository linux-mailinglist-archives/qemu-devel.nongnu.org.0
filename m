Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC5C137B8
	for <lists+qemu-devel@lfdr.de>; Sat,  4 May 2019 08:08:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMnq7-0001xH-3r
	for lists+qemu-devel@lfdr.de; Sat, 04 May 2019 02:08:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMnc2-0007zz-GH
	for qemu-devel@nongnu.org; Sat, 04 May 2019 01:53:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMnc0-0004OS-Su
	for qemu-devel@nongnu.org; Sat, 04 May 2019 01:53:30 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41492)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hMnc0-0004O2-Ka
	for qemu-devel@nongnu.org; Sat, 04 May 2019 01:53:28 -0400
Received: by mail-pg1-x530.google.com with SMTP id z3so60120pgp.8
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 22:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2bmVBQp8z716uMbVzTLNIWxQBQeXjV6U6UxMd0qk/lg=;
	b=c97kSxFBdXWiKV2nDPM0iNTfyPqRAXgN8mRSs1+MNOWJeGuDbMuB8WL6GhI72aocFn
	/a+WWplrbujgmq2OzWAs874dM5AClPV6ifs+520QE0bYpZlQ7z5+O0fA52zUzH8tD+Mc
	AKx55nYYsSlo5VvH7a9eFLiT8eDUZG0vaUOLcKn1juVMaynoKi0plmOJ21ed5KwYUMdu
	iUFA7xc3mNHbZHLde0uEwfL5KSEAq+FVt5kXBDmC8xh2a/m4HH7q4MZ6doVk/07d2I7s
	I7ebQywlMetHFfxrdPP9fD3a0oTVazEIE1BeyxLjLH9YZQH77DP8VQFq4+BStN1QYfUW
	qJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2bmVBQp8z716uMbVzTLNIWxQBQeXjV6U6UxMd0qk/lg=;
	b=H2EHA5b/IKllPirPqtiLvnU5qhcUaoxenk3kQotwnOyaGOetKjWRzy0t1NeYffsGyK
	+7bRFF5cHllTssKlGKn7XS1U9YjKmckEtOagK/x5N6Rq5fPlAr5BixWaxbh5l1RYP6to
	oflSja41KeF08U/AjemXrmhgpMvp4plpwkiekFkF8gXuDyg245w2zrs1QMpXliSWoWZ2
	cPdzV2n8OK9h0JgiwcxFKO+qdT8mT/aIlLGvQs4sOizoR7WkE0/xpRHM/2bGYXML5oHq
	diAN8n38MevAzHtCRFgLk02we1Rrh8vsIHW/EQeNN4Vb7CpgGd7CCbryH7mcvNckvSkn
	lCuw==
X-Gm-Message-State: APjAAAU7W9qrxcn/lKILnckzx4Xhl87bu49gOwQehaf+bbFtQnkb10mv
	r0oVc40P8QBo1uXQLERqsuORteG7zKI=
X-Google-Smtp-Source: APXvYqxRq7vVFpN0KjkLjOcvqgJtAsFUyCiYtREATKOelZnIHf1sw5MJWsN68tA5gvCedVaKlIdcqw==
X-Received: by 2002:a63:6844:: with SMTP id d65mr16350150pgc.393.1556949207267;
	Fri, 03 May 2019 22:53:27 -0700 (PDT)
Received: from localhost.localdomain (97-113-189-189.tukw.qwest.net.
	[97.113.189.189]) by smtp.gmail.com with ESMTPSA id
	15sm6680423pfo.117.2019.05.03.22.53.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 22:53:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 22:52:50 -0700
Message-Id: <20190504055300.18426-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504055300.18426-1-richard.henderson@linaro.org>
References: <20190504055300.18426-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::530
Subject: [Qemu-devel] [PATCH v3 21/31] tcg: Add support for vector absolute
 value
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime.h      |  5 +++
 tcg/aarch64/tcg-target.h     |  1 +
 tcg/i386/tcg-target.h        |  1 +
 tcg/tcg-op-gvec.h            |  2 ++
 tcg/tcg-opc.h                |  1 +
 tcg/tcg.h                    |  1 +
 accel/tcg/tcg-runtime-gvec.c | 48 +++++++++++++++++++++++++++
 tcg/tcg-op-gvec.c            | 63 ++++++++++++++++++++++++++++++++++++
 tcg/tcg-op-vec.c             | 39 ++++++++++++++++++++++
 tcg/tcg.c                    |  2 ++
 tcg/README                   |  4 +++
 11 files changed, 167 insertions(+)

diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index ed3ce5fd91..6d73dc2d65 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -225,6 +225,11 @@ DEF_HELPER_FLAGS_3(gvec_neg16, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_neg32, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_neg64, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(gvec_abs8, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_abs16, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_abs32, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_abs64, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(gvec_not, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_and, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_or, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index f5640a229b..21d06d928c 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -132,6 +132,7 @@ typedef enum {
 #define TCG_TARGET_HAS_orc_vec          1
 #define TCG_TARGET_HAS_not_vec          1
 #define TCG_TARGET_HAS_neg_vec          1
+#define TCG_TARGET_HAS_abs_vec          0
 #define TCG_TARGET_HAS_shi_vec          1
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          1
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 618aa520d2..7445f05885 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -182,6 +182,7 @@ extern bool have_avx2;
 #define TCG_TARGET_HAS_orc_vec          0
 #define TCG_TARGET_HAS_not_vec          0
 #define TCG_TARGET_HAS_neg_vec          0
+#define TCG_TARGET_HAS_abs_vec          0
 #define TCG_TARGET_HAS_shi_vec          1
 #define TCG_TARGET_HAS_shs_vec          1
 #define TCG_TARGET_HAS_shv_vec          have_avx2
diff --git a/tcg/tcg-op-gvec.h b/tcg/tcg-op-gvec.h
index 6ee98f3378..52a398c190 100644
--- a/tcg/tcg-op-gvec.h
+++ b/tcg/tcg-op-gvec.h
@@ -228,6 +228,8 @@ void tcg_gen_gvec_not(unsigned vece, uint32_t dofs, uint32_t aofs,
                       uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_neg(unsigned vece, uint32_t dofs, uint32_t aofs,
                       uint32_t oprsz, uint32_t maxsz);
+void tcg_gen_gvec_abs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                      uint32_t oprsz, uint32_t maxsz);
 
 void tcg_gen_gvec_add(unsigned vece, uint32_t dofs, uint32_t aofs,
                       uint32_t bofs, uint32_t oprsz, uint32_t maxsz);
diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
index 4bf71f261f..4a2dd116eb 100644
--- a/tcg/tcg-opc.h
+++ b/tcg/tcg-opc.h
@@ -225,6 +225,7 @@ DEF(add_vec, 1, 2, 0, IMPLVEC)
 DEF(sub_vec, 1, 2, 0, IMPLVEC)
 DEF(mul_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_mul_vec))
 DEF(neg_vec, 1, 1, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_neg_vec))
+DEF(abs_vec, 1, 1, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_abs_vec))
 DEF(ssadd_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_sat_vec))
 DEF(usadd_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_sat_vec))
 DEF(sssub_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_sat_vec))
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 2c7315da25..0e01a70d66 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -176,6 +176,7 @@ typedef uint64_t TCGRegSet;
     && !defined(TCG_TARGET_HAS_v128) \
     && !defined(TCG_TARGET_HAS_v256)
 #define TCG_TARGET_MAYBE_vec            0
+#define TCG_TARGET_HAS_abs_vec          0
 #define TCG_TARGET_HAS_neg_vec          0
 #define TCG_TARGET_HAS_not_vec          0
 #define TCG_TARGET_HAS_andc_vec         0
diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
index 2152fb6903..0f09e0ef38 100644
--- a/accel/tcg/tcg-runtime-gvec.c
+++ b/accel/tcg/tcg-runtime-gvec.c
@@ -398,6 +398,54 @@ void HELPER(gvec_neg64)(void *d, void *a, uint32_t desc)
     clear_high(d, oprsz, desc);
 }
 
+void HELPER(gvec_abs8)(void *d, void *a, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(int8_t)) {
+        int8_t aa = *(int8_t *)(a + i);
+        *(int8_t *)(d + i) = aa < 0 ? -aa : aa;
+    }
+    clear_high(d, oprsz, desc);
+}
+
+void HELPER(gvec_abs16)(void *d, void *a, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(int16_t)) {
+        int16_t aa = *(int16_t *)(a + i);
+        *(int16_t *)(d + i) = aa < 0 ? -aa : aa;
+    }
+    clear_high(d, oprsz, desc);
+}
+
+void HELPER(gvec_abs32)(void *d, void *a, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(int32_t)) {
+        int32_t aa = *(int32_t *)(a + i);
+        *(int32_t *)(d + i) = aa < 0 ? -aa : aa;
+    }
+    clear_high(d, oprsz, desc);
+}
+
+void HELPER(gvec_abs64)(void *d, void *a, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(int64_t)) {
+        int64_t aa = *(int64_t *)(a + i);
+        *(int64_t *)(d + i) = aa < 0 ? -aa : aa;
+    }
+    clear_high(d, oprsz, desc);
+}
+
 void HELPER(gvec_mov)(void *d, void *a, uint32_t desc)
 {
     intptr_t oprsz = simd_oprsz(desc);
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index c69c7960b8..338ddd9d9e 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2177,6 +2177,69 @@ void tcg_gen_gvec_neg(unsigned vece, uint32_t dofs, uint32_t aofs,
     tcg_gen_gvec_2(dofs, aofs, oprsz, maxsz, &g[vece]);
 }
 
+static void gen_absv_mask(TCGv_i64 d, TCGv_i64 b, unsigned vece)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+    int nbit = 8 << vece;
+
+    /* Create -1 for each negative element.  */
+    tcg_gen_shri_i64(t, b, nbit - 1);
+    tcg_gen_andi_i64(t, t, dup_const(vece, 1));
+    tcg_gen_muli_i64(t, t, (1 << nbit) - 1);
+
+    /*
+     * Invert (via xor -1) and add one (via sub -1).
+     * Because of the ordering the msb is cleared,
+     * so we never have carry into the next element.
+     */
+    tcg_gen_xor_i64(d, b, t);
+    tcg_gen_sub_i64(d, d, t);
+
+    tcg_temp_free_i64(t);
+}
+
+static void tcg_gen_vec_abs8_i64(TCGv_i64 d, TCGv_i64 b)
+{
+    gen_absv_mask(d, b, MO_8);
+}
+
+static void tcg_gen_vec_abs16_i64(TCGv_i64 d, TCGv_i64 b)
+{
+    gen_absv_mask(d, b, MO_16);
+}
+
+void tcg_gen_gvec_abs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                      uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = { INDEX_op_abs_vec, 0 };
+    static const GVecGen2 g[4] = {
+        { .fni8 = tcg_gen_vec_abs8_i64,
+          .fniv = tcg_gen_abs_vec,
+          .fno = gen_helper_gvec_abs8,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fni8 = tcg_gen_vec_abs16_i64,
+          .fniv = tcg_gen_abs_vec,
+          .fno = gen_helper_gvec_abs16,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = tcg_gen_abs_i32,
+          .fniv = tcg_gen_abs_vec,
+          .fno = gen_helper_gvec_abs32,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+        { .fni8 = tcg_gen_abs_i64,
+          .fniv = tcg_gen_abs_vec,
+          .fno = gen_helper_gvec_abs64,
+          .opt_opc = vecop_list,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+          .vece = MO_64 },
+    };
+
+    tcg_debug_assert(vece <= MO_64);
+    tcg_gen_gvec_2(dofs, aofs, oprsz, maxsz, &g[vece]);
+}
+
 void tcg_gen_gvec_and(unsigned vece, uint32_t dofs, uint32_t aofs,
                       uint32_t bofs, uint32_t oprsz, uint32_t maxsz)
 {
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 16062f5995..543508d545 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -110,6 +110,14 @@ bool tcg_can_emit_vecop_list(const TCGOpcode *list,
                 continue;
             }
             break;
+        case INDEX_op_abs_vec:
+            if (tcg_can_emit_vec_op(INDEX_op_sub_vec, type, vece)
+                && (tcg_can_emit_vec_op(INDEX_op_smax_vec, type, vece) > 0
+                    || tcg_can_emit_vec_op(INDEX_op_sari_vec, type, vece) > 0
+                    || tcg_can_emit_vec_op(INDEX_op_cmp_vec, type, vece))) {
+                continue;
+            }
+            break;
         default:
             break;
         }
@@ -429,6 +437,37 @@ void tcg_gen_neg_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
     tcg_swap_vecop_list(hold_list);
 }
 
+void tcg_gen_abs_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
+{
+    const TCGOpcode *hold_list;
+
+    tcg_assert_listed_vecop(INDEX_op_abs_vec);
+    hold_list = tcg_swap_vecop_list(NULL);
+
+    if (!do_op2(vece, r, a, INDEX_op_abs_vec)) {
+        TCGType type = tcgv_vec_temp(r)->base_type;
+        TCGv_vec t = tcg_temp_new_vec(type);
+
+        tcg_debug_assert(tcg_can_emit_vec_op(INDEX_op_sub_vec, type, vece));
+        if (tcg_can_emit_vec_op(INDEX_op_smax_vec, type, vece) > 0) {
+            tcg_gen_neg_vec(vece, t, a);
+            tcg_gen_smax_vec(vece, r, a, t);
+        } else {
+            if (tcg_can_emit_vec_op(INDEX_op_sari_vec, type, vece) > 0) {
+                tcg_gen_sari_vec(vece, t, a, (8 << vece) - 1);
+            } else {
+                do_dupi_vec(t, MO_REG, 0);
+                tcg_gen_cmp_vec(TCG_COND_LT, vece, t, a, t);
+            }
+            tcg_gen_xor_vec(vece, r, a, t);
+            tcg_gen_sub_vec(vece, r, r, t);
+        }
+
+        tcg_temp_free_vec(t);
+    }
+    tcg_swap_vecop_list(hold_list);
+}
+
 static void do_shifti(TCGOpcode opc, unsigned vece,
                       TCGv_vec r, TCGv_vec a, int64_t i)
 {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 3b80feb344..24083b8c00 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1616,6 +1616,8 @@ bool tcg_op_supported(TCGOpcode op)
         return have_vec && TCG_TARGET_HAS_not_vec;
     case INDEX_op_neg_vec:
         return have_vec && TCG_TARGET_HAS_neg_vec;
+    case INDEX_op_abs_vec:
+        return have_vec && TCG_TARGET_HAS_abs_vec;
     case INDEX_op_andc_vec:
         return have_vec && TCG_TARGET_HAS_andc_vec;
     case INDEX_op_orc_vec:
diff --git a/tcg/README b/tcg/README
index c30e5418a6..cbdfd3b6bc 100644
--- a/tcg/README
+++ b/tcg/README
@@ -561,6 +561,10 @@ E.g. VECL=1 -> 64 << 1 -> v128, and VECE=2 -> 1 << 2 -> i32.
 
   Similarly, v0 = -v1.
 
+* abs_vec   v0, v1
+
+  Similarly, v0 = v1 < 0 ? -v1 : v1, in elements across the vector.
+
 * smin_vec:
 * umin_vec:
 
-- 
2.17.1


