Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209941C174
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 06:36:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQPBP-0003IF-0j
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 00:36:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQPAF-0002xl-5W
	for qemu-devel@nongnu.org; Tue, 14 May 2019 00:35:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQPAD-000576-Eh
	for qemu-devel@nongnu.org; Tue, 14 May 2019 00:35:43 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45077)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hQKxN-0003PZ-Js
	for qemu-devel@nongnu.org; Mon, 13 May 2019 20:06:11 -0400
Received: by mail-pl1-x629.google.com with SMTP id a5so7254609pls.12
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 17:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qw9asg7SRqxlX27WylYo/55gkKhhqIWBrKFJgQwUqqc=;
	b=lkG/QmzTW/zZONINuJOr2zZe9lZC/dbWUUqmnAWhOfiqiys/vYzZ1t+C78K/1MoI+C
	JJ5bIW/M6upkIWDdXXDyRlh9/jIggv8RFYIfWP42UaBe1+TXM9ia8MY6KMHpTx8Iy4Gr
	6fEppWA7/nGPoGg68L4qZQ8z2VVE9MFbjSZSKhCMZoHrdgWwq+3n+jAV+3Zf7ompXsR8
	Jr+WXccVDoo/5LMDobbzKBYvupsKVT6AUmde7KIfhl/CWRvxXPSQ52e7TFMpD5b1IVvg
	kZWQm+R8YbtvubJh7YrKFc398SJ4nY/lHoOEhxOzTHgbqU0ajNYpOoMW5fUGBYwtjEIE
	whIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qw9asg7SRqxlX27WylYo/55gkKhhqIWBrKFJgQwUqqc=;
	b=RLn2parAmCEnzl6+OQygRwjo9gW3sPWYK74kiV+pAASZQ017BigTS0wqi86Vn1rN64
	FMY0bTErnxAJn8/DwqzvKBDJny6ceQ3U2og/JJJdlmzFAfQbMGoeIXB4TuKgVn7XYQTL
	/wSSoq7QUW6zXLJbKOt2L5RgTq4ugXAGAcVdvimGomZeWCG9ib3G4NQ88zTgLa+dYNJC
	cSI6EeIpqDUKiK+Ui5lVMnXM2YwDDAFRvuG30aa7gB8Z96cKIbktMzJccCKyxGddPxjo
	w3DEF1+ciKP6qaoIIxO9y7qvlc30ha0NSrwqCrD7sveFbhPPtuvDPhE568smRgrzcGvj
	l4tQ==
X-Gm-Message-State: APjAAAVd1LpUIL9RohS0SgXgLO2L+ijlK6DM0nyJLm0KUlTh9Iqw0PcA
	FeIgvaTbv4SrCFv9iAa64S3O9oy1/9c=
X-Google-Smtp-Source: APXvYqxhZUdaov2z+wJEK0+Ry6AsiSsqnyU3q0sNB3hdvt2JitreIKr/X7+uJsW9DsEBDnPbqZ2UjA==
X-Received: by 2002:a17:902:b202:: with SMTP id
	t2mr33525755plr.69.1557792367215; 
	Mon, 13 May 2019 17:06:07 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231])
	by smtp.gmail.com with ESMTPSA id u3sm238151pfn.29.2019.05.13.17.06.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 17:06:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 17:05:27 -0700
Message-Id: <20190514000540.4313-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514000540.4313-1-richard.henderson@linaro.org>
References: <20190514000540.4313-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::629
Subject: [Qemu-devel] [PULL 18/31] tcg: Add gvec expanders for vector shift
 by scalar
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
Cc: peter.maydell@linux.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow expansion either via shift by scalar or by replicating
the scalar for shift by vector.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Use a private structure for do_gvec_shifts.
---
 tcg/tcg-op-gvec.h |   7 ++
 tcg/tcg-op.h      |   4 +
 tcg/tcg-op-gvec.c | 214 ++++++++++++++++++++++++++++++++++++++++++++++
 tcg/tcg-op-vec.c  |  54 ++++++++++++
 4 files changed, 279 insertions(+)

diff --git a/tcg/tcg-op-gvec.h b/tcg/tcg-op-gvec.h
index 84a6247b16..6ee98f3378 100644
--- a/tcg/tcg-op-gvec.h
+++ b/tcg/tcg-op-gvec.h
@@ -318,6 +318,13 @@ void tcg_gen_gvec_shri(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_sari(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t shift, uint32_t oprsz, uint32_t maxsz);
 
+void tcg_gen_gvec_shls(unsigned vece, uint32_t dofs, uint32_t aofs,
+                       TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
+void tcg_gen_gvec_shrs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                       TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
+void tcg_gen_gvec_sars(unsigned vece, uint32_t dofs, uint32_t aofs,
+                       TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
+
 /*
  * Perform vector shift by vector element, modulo the element size.
  * E.g.  D[i] = A[i] << (B[i] % (8 << vece)).
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 833c6330b5..472b73cb38 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -986,6 +986,10 @@ void tcg_gen_shli_vec(unsigned vece, TCGv_vec r, TCGv_vec a, int64_t i);
 void tcg_gen_shri_vec(unsigned vece, TCGv_vec r, TCGv_vec a, int64_t i);
 void tcg_gen_sari_vec(unsigned vece, TCGv_vec r, TCGv_vec a, int64_t i);
 
+void tcg_gen_shls_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_i32 s);
+void tcg_gen_shrs_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_i32 s);
+void tcg_gen_sars_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_i32 s);
+
 void tcg_gen_shlv_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec s);
 void tcg_gen_shrv_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec s);
 void tcg_gen_sarv_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec s);
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 061ef329f1..c69c7960b8 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2555,6 +2555,220 @@ void tcg_gen_gvec_sari(unsigned vece, uint32_t dofs, uint32_t aofs,
     }
 }
 
+/*
+ * Specialized generation vector shifts by a non-constant scalar.
+ */
+
+typedef struct {
+    void (*fni4)(TCGv_i32, TCGv_i32, TCGv_i32);
+    void (*fni8)(TCGv_i64, TCGv_i64, TCGv_i64);
+    void (*fniv_s)(unsigned, TCGv_vec, TCGv_vec, TCGv_i32);
+    void (*fniv_v)(unsigned, TCGv_vec, TCGv_vec, TCGv_vec);
+    gen_helper_gvec_2 *fno[4];
+    TCGOpcode s_list[2];
+    TCGOpcode v_list[2];
+} GVecGen2sh;
+
+static void expand_2sh_vec(unsigned vece, uint32_t dofs, uint32_t aofs,
+                           uint32_t oprsz, uint32_t tysz, TCGType type,
+                           TCGv_i32 shift,
+                           void (*fni)(unsigned, TCGv_vec, TCGv_vec, TCGv_i32))
+{
+    TCGv_vec t0 = tcg_temp_new_vec(type);
+    uint32_t i;
+
+    for (i = 0; i < oprsz; i += tysz) {
+        tcg_gen_ld_vec(t0, cpu_env, aofs + i);
+        fni(vece, t0, t0, shift);
+        tcg_gen_st_vec(t0, cpu_env, dofs + i);
+    }
+    tcg_temp_free_vec(t0);
+}
+
+static void
+do_gvec_shifts(unsigned vece, uint32_t dofs, uint32_t aofs, TCGv_i32 shift,
+               uint32_t oprsz, uint32_t maxsz, const GVecGen2sh *g)
+{
+    TCGType type;
+    uint32_t some;
+
+    check_size_align(oprsz, maxsz, dofs | aofs);
+    check_overlap_2(dofs, aofs, maxsz);
+
+    /* If the backend has a scalar expansion, great.  */
+    type = choose_vector_type(g->s_list, vece, oprsz, vece == MO_64);
+    if (type) {
+        const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
+        switch (type) {
+        case TCG_TYPE_V256:
+            some = QEMU_ALIGN_DOWN(oprsz, 32);
+            expand_2sh_vec(vece, dofs, aofs, some, 32,
+                           TCG_TYPE_V256, shift, g->fniv_s);
+            if (some == oprsz) {
+                break;
+            }
+            dofs += some;
+            aofs += some;
+            oprsz -= some;
+            maxsz -= some;
+            /* fallthru */
+        case TCG_TYPE_V128:
+            expand_2sh_vec(vece, dofs, aofs, oprsz, 16,
+                           TCG_TYPE_V128, shift, g->fniv_s);
+            break;
+        case TCG_TYPE_V64:
+            expand_2sh_vec(vece, dofs, aofs, oprsz, 8,
+                           TCG_TYPE_V64, shift, g->fniv_s);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        tcg_swap_vecop_list(hold_list);
+        goto clear_tail;
+    }
+
+    /* If the backend supports variable vector shifts, also cool.  */
+    type = choose_vector_type(g->v_list, vece, oprsz, vece == MO_64);
+    if (type) {
+        const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
+        TCGv_vec v_shift = tcg_temp_new_vec(type);
+
+        if (vece == MO_64) {
+            TCGv_i64 sh64 = tcg_temp_new_i64();
+            tcg_gen_extu_i32_i64(sh64, shift);
+            tcg_gen_dup_i64_vec(MO_64, v_shift, sh64);
+            tcg_temp_free_i64(sh64);
+        } else {
+            tcg_gen_dup_i32_vec(vece, v_shift, shift);
+        }
+
+        switch (type) {
+        case TCG_TYPE_V256:
+            some = QEMU_ALIGN_DOWN(oprsz, 32);
+            expand_2s_vec(vece, dofs, aofs, some, 32, TCG_TYPE_V256,
+                          v_shift, false, g->fniv_v);
+            if (some == oprsz) {
+                break;
+            }
+            dofs += some;
+            aofs += some;
+            oprsz -= some;
+            maxsz -= some;
+            /* fallthru */
+        case TCG_TYPE_V128:
+            expand_2s_vec(vece, dofs, aofs, oprsz, 16, TCG_TYPE_V128,
+                          v_shift, false, g->fniv_v);
+            break;
+        case TCG_TYPE_V64:
+            expand_2s_vec(vece, dofs, aofs, oprsz, 8, TCG_TYPE_V64,
+                          v_shift, false, g->fniv_v);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        tcg_temp_free_vec(v_shift);
+        tcg_swap_vecop_list(hold_list);
+        goto clear_tail;
+    }
+
+    /* Otherwise fall back to integral... */
+    if (vece == MO_32 && check_size_impl(oprsz, 4)) {
+        expand_2s_i32(dofs, aofs, oprsz, shift, false, g->fni4);
+    } else if (vece == MO_64 && check_size_impl(oprsz, 8)) {
+        TCGv_i64 sh64 = tcg_temp_new_i64();
+        tcg_gen_extu_i32_i64(sh64, shift);
+        expand_2s_i64(dofs, aofs, oprsz, sh64, false, g->fni8);
+        tcg_temp_free_i64(sh64);
+    } else {
+        TCGv_ptr a0 = tcg_temp_new_ptr();
+        TCGv_ptr a1 = tcg_temp_new_ptr();
+        TCGv_i32 desc = tcg_temp_new_i32();
+
+        tcg_gen_shli_i32(desc, shift, SIMD_DATA_SHIFT);
+        tcg_gen_ori_i32(desc, desc, simd_desc(oprsz, maxsz, 0));
+        tcg_gen_addi_ptr(a0, cpu_env, dofs);
+        tcg_gen_addi_ptr(a1, cpu_env, aofs);
+
+        g->fno[vece](a0, a1, desc);
+
+        tcg_temp_free_ptr(a0);
+        tcg_temp_free_ptr(a1);
+        tcg_temp_free_i32(desc);
+        return;
+    }
+
+ clear_tail:
+    if (oprsz < maxsz) {
+        expand_clr(dofs + oprsz, maxsz - oprsz);
+    }
+}
+
+void tcg_gen_gvec_shls(unsigned vece, uint32_t dofs, uint32_t aofs,
+                       TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen2sh g = {
+        .fni4 = tcg_gen_shl_i32,
+        .fni8 = tcg_gen_shl_i64,
+        .fniv_s = tcg_gen_shls_vec,
+        .fniv_v = tcg_gen_shlv_vec,
+        .fno = {
+            gen_helper_gvec_shl8i,
+            gen_helper_gvec_shl16i,
+            gen_helper_gvec_shl32i,
+            gen_helper_gvec_shl64i,
+        },
+        .s_list = { INDEX_op_shls_vec, 0 },
+        .v_list = { INDEX_op_shlv_vec, 0 },
+    };
+
+    tcg_debug_assert(vece <= MO_64);
+    do_gvec_shifts(vece, dofs, aofs, shift, oprsz, maxsz, &g);
+}
+
+void tcg_gen_gvec_shrs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                       TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen2sh g = {
+        .fni4 = tcg_gen_shr_i32,
+        .fni8 = tcg_gen_shr_i64,
+        .fniv_s = tcg_gen_shrs_vec,
+        .fniv_v = tcg_gen_shrv_vec,
+        .fno = {
+            gen_helper_gvec_shr8i,
+            gen_helper_gvec_shr16i,
+            gen_helper_gvec_shr32i,
+            gen_helper_gvec_shr64i,
+        },
+        .s_list = { INDEX_op_shrs_vec, 0 },
+        .v_list = { INDEX_op_shrv_vec, 0 },
+    };
+
+    tcg_debug_assert(vece <= MO_64);
+    do_gvec_shifts(vece, dofs, aofs, shift, oprsz, maxsz, &g);
+}
+
+void tcg_gen_gvec_sars(unsigned vece, uint32_t dofs, uint32_t aofs,
+                       TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen2sh g = {
+        .fni4 = tcg_gen_sar_i32,
+        .fni8 = tcg_gen_sar_i64,
+        .fniv_s = tcg_gen_sars_vec,
+        .fniv_v = tcg_gen_sarv_vec,
+        .fno = {
+            gen_helper_gvec_sar8i,
+            gen_helper_gvec_sar16i,
+            gen_helper_gvec_sar32i,
+            gen_helper_gvec_sar64i,
+        },
+        .s_list = { INDEX_op_sars_vec, 0 },
+        .v_list = { INDEX_op_sarv_vec, 0 },
+    };
+
+    tcg_debug_assert(vece <= MO_64);
+    do_gvec_shifts(vece, dofs, aofs, shift, oprsz, maxsz, &g);
+}
+
 /*
  * Expand D = A << (B % element bits)
  *
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 96317dbd10..16062f5995 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -598,3 +598,57 @@ void tcg_gen_sarv_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 {
     do_op3(vece, r, a, b, INDEX_op_sarv_vec);
 }
+
+static void do_shifts(unsigned vece, TCGv_vec r, TCGv_vec a,
+                      TCGv_i32 s, TCGOpcode opc_s, TCGOpcode opc_v)
+{
+    TCGTemp *rt = tcgv_vec_temp(r);
+    TCGTemp *at = tcgv_vec_temp(a);
+    TCGTemp *st = tcgv_i32_temp(s);
+    TCGArg ri = temp_arg(rt);
+    TCGArg ai = temp_arg(at);
+    TCGArg si = temp_arg(st);
+    TCGType type = rt->base_type;
+    const TCGOpcode *hold_list;
+    int can;
+
+    tcg_debug_assert(at->base_type >= type);
+    tcg_assert_listed_vecop(opc_s);
+    hold_list = tcg_swap_vecop_list(NULL);
+
+    can = tcg_can_emit_vec_op(opc_s, type, vece);
+    if (can > 0) {
+        vec_gen_3(opc_s, type, vece, ri, ai, si);
+    } else if (can < 0) {
+        tcg_expand_vec_op(opc_s, type, vece, ri, ai, si);
+    } else {
+        TCGv_vec vec_s = tcg_temp_new_vec(type);
+
+        if (vece == MO_64) {
+            TCGv_i64 s64 = tcg_temp_new_i64();
+            tcg_gen_extu_i32_i64(s64, s);
+            tcg_gen_dup_i64_vec(MO_64, vec_s, s64);
+            tcg_temp_free_i64(s64);
+        } else {
+            tcg_gen_dup_i32_vec(vece, vec_s, s);
+        }
+        do_op3(vece, r, a, vec_s, opc_v);
+        tcg_temp_free_vec(vec_s);
+    }
+    tcg_swap_vecop_list(hold_list);
+}
+
+void tcg_gen_shls_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_i32 b)
+{
+    do_shifts(vece, r, a, b, INDEX_op_shls_vec, INDEX_op_shlv_vec);
+}
+
+void tcg_gen_shrs_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_i32 b)
+{
+    do_shifts(vece, r, a, b, INDEX_op_shrs_vec, INDEX_op_shrv_vec);
+}
+
+void tcg_gen_sars_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_i32 b)
+{
+    do_shifts(vece, r, a, b, INDEX_op_sars_vec, INDEX_op_sarv_vec);
+}
-- 
2.17.1


