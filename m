Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69F92249D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 May 2019 21:14:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hS4n8-0002fu-OH
	for lists+qemu-devel@lfdr.de; Sat, 18 May 2019 15:14:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hS4dT-0002nw-5n
	for qemu-devel@nongnu.org; Sat, 18 May 2019 15:04:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hS4at-0002bD-GY
	for qemu-devel@nongnu.org; Sat, 18 May 2019 15:02:08 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hS4at-0002aC-A7
	for qemu-devel@nongnu.org; Sat, 18 May 2019 15:02:07 -0400
Received: by mail-pg1-x542.google.com with SMTP id t1so3413061pgc.2
	for <qemu-devel@nongnu.org>; Sat, 18 May 2019 12:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dIrUBx1AozwSRTf1CstcHoUDbRuw3JV0rC9AxpXdw/A=;
	b=HbYzrvJFD7lLFYnQLN96DI7UB7yOIJaiDHgcX0tXIY4SOLJwxQ6Ruj/NfpH00cMb6r
	ki6wG24bI+sFlr+yOaVkR77BrlYD/wjEfpqr4soAhUtxZuql1HqRAv2tn5gYreXEV8HA
	Z93pDLzqn9vo4gAXqH4606m3oOJAbpLxoRs3RrB+/hN+vWoBMDvFuHZeshQawRXAQ7ii
	j0Jazb/Ghi+5EYVbCY0x6Va9Pv5Acn9LdvkhTOZJgySOlPjjUdbUQwSzfTWK8rzB/5dl
	mIKFirzuYmB7YqbDOZs61672zvlPFNWReW6+huJYYft+CUE+x/y8UJUPN2vVPDvk61oN
	E3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dIrUBx1AozwSRTf1CstcHoUDbRuw3JV0rC9AxpXdw/A=;
	b=l0dUH68CrcVZyG15Tyom9K6qTQ/w7kFT/nQ1JWrTqUWASJG+zBkFixKG34/3F1FGAd
	y4XBWAgtsJhu0EXAFuzqQM7BzRlNxXpq+hOc+5DtQADjfD3Y9Y7/MsHsZEUj8Mk4bkl6
	jrwEgN0O8the8+ZziAwfUFQWre65OAouaszvEhwBzb4KEg06SqZ9ZdLC3t9eY1I0VHep
	pR4NZvI/lbwfdlKffaoHDiI+RP7uB8p1IPnAlssCU3WB57Y64wQEPlc/FCLFtdePKZ8W
	uiGWo75dKRSva/MUtyHZiGMwPEmXShNvl0CLEZtOsWhfrvRWYHyaxeWKn7JUa2M5oDrQ
	TGzQ==
X-Gm-Message-State: APjAAAWZt68T5fYCZLdxFP/PzEL9GtfT0RyWePVfjWNaQetsG1Jf26+h
	dF2RvGf5FAW+2C8z8+mf5/0BUh73khw=
X-Google-Smtp-Source: APXvYqzgUaZA6apoHI0bqw1cqGN/FRASpYzdhiMTTLNkq8qoIUwPr7Pqvh9wJSTx0X37VOD1taVvXw==
X-Received: by 2002:a62:116:: with SMTP id 22mr30861702pfb.119.1558206126050; 
	Sat, 18 May 2019 12:02:06 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231])
	by smtp.gmail.com with ESMTPSA id m9sm2751274pgd.23.2019.05.18.12.02.04
	for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 12:02:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 18 May 2019 12:01:45 -0700
Message-Id: <20190518190157.21255-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190518190157.21255-1-richard.henderson@linaro.org>
References: <20190518190157.21255-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH 04/16] tcg: Add support for vector compare
 select
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perform a per-element conditional move.  This combination operation is
easier to implement on some host vector units than plain cmp+bitsel.
Omit the usual gvec interface, as this is intended to be used by
target-specific gvec expansion call-backs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h |  1 +
 tcg/i386/tcg-target.h    |  1 +
 tcg/tcg-op.h             |  2 ++
 tcg/tcg-opc.h            |  1 +
 tcg/tcg.h                |  1 +
 tcg/tcg-op-vec.c         | 59 ++++++++++++++++++++++++++++++++++++++++
 tcg/tcg.c                |  3 ++
 tcg/README               |  7 +++++
 8 files changed, 75 insertions(+)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 52ee66424f..b4a9d36bbc 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -141,6 +141,7 @@ typedef enum {
 #define TCG_TARGET_HAS_sat_vec          1
 #define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       0
+#define TCG_TARGET_HAS_cmpsel_vec       0
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 08a0386433..16a83a7f7b 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -191,6 +191,7 @@ extern bool have_avx2;
 #define TCG_TARGET_HAS_sat_vec          1
 #define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       0
+#define TCG_TARGET_HAS_cmpsel_vec       0
 
 #define TCG_TARGET_deposit_i32_valid(ofs, len) \
     (((ofs) == 0 && (len) == 8) || ((ofs) == 8 && (len) == 8) || \
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 268860ed2f..2d4dd5cd7d 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -1002,6 +1002,8 @@ void tcg_gen_cmp_vec(TCGCond cond, unsigned vece, TCGv_vec r,
 
 void tcg_gen_bitsel_vec(unsigned vece, TCGv_vec r, TCGv_vec a,
                         TCGv_vec b, TCGv_vec c);
+void tcg_gen_cmpsel_vec(TCGCond cond, unsigned vece, TCGv_vec r,
+                        TCGv_vec a, TCGv_vec b, TCGv_vec c, TCGv_vec d);
 
 void tcg_gen_ld_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset);
 void tcg_gen_st_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset);
diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
index c05b71427c..c7d971fa3d 100644
--- a/tcg/tcg-opc.h
+++ b/tcg/tcg-opc.h
@@ -257,6 +257,7 @@ DEF(sarv_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_shv_vec))
 DEF(cmp_vec, 1, 2, 1, IMPLVEC)
 
 DEF(bitsel_vec, 1, 3, 0, IMPLVEC | IMPL(TCG_TARGET_HAS_bitsel_vec))
+DEF(cmpsel_vec, 1, 4, 1, IMPLVEC | IMPL(TCG_TARGET_HAS_cmpsel_vec))
 
 DEF(last_generic, 0, 0, 0, TCG_OPF_NOT_PRESENT)
 
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 72f9f6c70b..21cd6f1249 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -188,6 +188,7 @@ typedef uint64_t TCGRegSet;
 #define TCG_TARGET_HAS_sat_vec          0
 #define TCG_TARGET_HAS_minmax_vec       0
 #define TCG_TARGET_HAS_bitsel_vec       0
+#define TCG_TARGET_HAS_cmpsel_vec       0
 #else
 #define TCG_TARGET_MAYBE_vec            1
 #endif
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 99cbf29e0b..a888c02df8 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -119,6 +119,11 @@ bool tcg_can_emit_vecop_list(const TCGOpcode *list,
                 continue;
             }
             break;
+        case INDEX_op_cmpsel_vec:
+            if (tcg_can_emit_vec_op(INDEX_op_cmp_vec, type, vece)) {
+                continue;
+            }
+            break;
         default:
             break;
         }
@@ -159,6 +164,20 @@ void vec_gen_4(TCGOpcode opc, TCGType type, unsigned vece,
     op->args[3] = c;
 }
 
+static void vec_gen_6(TCGOpcode opc, TCGType type, unsigned vece, TCGArg r,
+                      TCGArg a, TCGArg b, TCGArg c, TCGArg d, TCGArg e)
+{
+    TCGOp *op = tcg_emit_op(opc);
+    TCGOP_VECL(op) = type - TCG_TYPE_V64;
+    TCGOP_VECE(op) = vece;
+    op->args[0] = r;
+    op->args[1] = a;
+    op->args[2] = b;
+    op->args[3] = c;
+    op->args[4] = d;
+    op->args[5] = e;
+}
+
 static void vec_gen_op2(TCGOpcode opc, unsigned vece, TCGv_vec r, TCGv_vec a)
 {
     TCGTemp *rt = tcgv_vec_temp(r);
@@ -717,3 +736,43 @@ void tcg_gen_bitsel_vec(unsigned vece, TCGv_vec r, TCGv_vec a,
         tcg_temp_free_vec(t);
     }
 }
+
+void tcg_gen_cmpsel_vec(TCGCond cond, unsigned vece, TCGv_vec r,
+                        TCGv_vec a, TCGv_vec b, TCGv_vec c, TCGv_vec d)
+{
+    TCGTemp *rt = tcgv_vec_temp(r);
+    TCGTemp *at = tcgv_vec_temp(a);
+    TCGTemp *bt = tcgv_vec_temp(b);
+    TCGTemp *ct = tcgv_vec_temp(c);
+    TCGTemp *dt = tcgv_vec_temp(d);
+    TCGArg ri = temp_arg(rt);
+    TCGArg ai = temp_arg(at);
+    TCGArg bi = temp_arg(bt);
+    TCGArg ci = temp_arg(ct);
+    TCGArg di = temp_arg(dt);
+    TCGType type = rt->base_type;
+    const TCGOpcode *hold_list;
+    int can;
+
+    tcg_debug_assert(at->base_type >= type);
+    tcg_debug_assert(bt->base_type >= type);
+    tcg_debug_assert(ct->base_type >= type);
+    tcg_debug_assert(dt->base_type >= type);
+
+    tcg_assert_listed_vecop(INDEX_op_cmpsel_vec);
+    hold_list = tcg_swap_vecop_list(NULL);
+    can = tcg_can_emit_vec_op(INDEX_op_cmpsel_vec, type, vece);
+
+    if (can > 0) {
+        vec_gen_6(INDEX_op_cmpsel_vec, type, vece, ri, ai, bi, ci, di, cond);
+    } else if (can < 0) {
+        tcg_expand_vec_op(INDEX_op_cmpsel_vec, type, vece,
+                          ri, ai, bi, ci, di, cond);
+    } else {
+        TCGv_vec t = tcg_temp_new_vec(type);
+        tcg_gen_cmp_vec(cond, vece, t, a, b);
+        tcg_gen_bitsel_vec(vece, r, t, c, d);
+        tcg_temp_free_vec(t);
+    }
+    tcg_swap_vecop_list(hold_list);
+}
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5d947dbcb0..02a2680169 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1648,6 +1648,8 @@ bool tcg_op_supported(TCGOpcode op)
         return have_vec && TCG_TARGET_HAS_minmax_vec;
     case INDEX_op_bitsel_vec:
         return have_vec && TCG_TARGET_HAS_bitsel_vec;
+    case INDEX_op_cmpsel_vec:
+        return have_vec && TCG_TARGET_HAS_cmpsel_vec;
 
     default:
         tcg_debug_assert(op > INDEX_op_last_generic && op < NB_OPS);
@@ -2028,6 +2030,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
             case INDEX_op_setcond_i64:
             case INDEX_op_movcond_i64:
             case INDEX_op_cmp_vec:
+            case INDEX_op_cmpsel_vec:
                 if (op->args[k] < ARRAY_SIZE(cond_name)
                     && cond_name[op->args[k]]) {
                     col += qemu_log(",%s", cond_name[op->args[k++]]);
diff --git a/tcg/README b/tcg/README
index 76057ab59f..21fcdf737f 100644
--- a/tcg/README
+++ b/tcg/README
@@ -631,6 +631,13 @@ E.g. VECL=1 -> 64 << 1 -> v128, and VECE=2 -> 1 << 2 -> i32.
 
   Bitwise select, v0 = (v2 & v1) | (v3 & ~v1), across the entire vector.
 
+* cmpsel_vec v0, c1, c2, v3, v4, cond
+
+  Select elements based on comparison results:
+  for (i = 0; i < n; ++i) {
+    v0[i] = (c1[i] cond c2[i]) ? v3[i] : v4[i].
+  }
+
 *********
 
 Note 1: Some shortcuts are defined when the last operand is known to be
-- 
2.17.1


