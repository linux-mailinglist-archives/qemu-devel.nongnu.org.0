Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E1139EAE3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:41:53 +0200 (CEST)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPoW-0000gD-4w
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeC-0001t3-W1
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:13 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeA-0004b7-BZ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112270; x=1654648270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KlAnR4VuUatt4GW0MxmGnEIMikm429RIBK18QnWnT80=;
 b=Gc9QXKfDW5z2GdMjTP64g/ATJUdylJtdD3krd1KZeObDzNRUBCApXnZP
 yxKfJeNQWR8CsB8kNS0T+ph3R3Ga8MwTusg4SHo+na1/c3Q34grSeTkbc
 7YR5l+x2eixjcuS9sqEYPQJd4Cw1ifL8kcg7E37Erw1B0Gud6Xtx81Sci
 2WHbaxkrJqSOYSczIYsSaKI+dNMUGqJb8lC4uU815wI41GnRdZ0dHi1Cg
 tDsMIeug1VmpyWKaHbA/2+pcXVX47kjhaJv32hpv3TrMhz71jNjPVecLM
 5bZiBglpC+DogJgSBmTBifbzOY/h/pUh2QfI9+9xZYt9c7WIt/34KDKkq w==;
IronPort-SDR: dKDND5ZuUxsNWcZC2EjXMWXqzRlq/ruGRjlub96Smie0Q+C0NUSaKGSi16Xk9R8o0CZFhp6f2d
 ycu2t06iSQYfrInnNQ9qEVxP4Va57UAiir+Q0/KQzFB/jFxD8S7h7wfT0nfkh8nyFd7kBo+JHq
 7wUFmPtEhtq+EImm0/Ic+WgXlhsn+iSVaecI0OFUIAx30DsVF9FUGS7qgeddrJvwS3ij4AFI4v
 ce3MxZA/na2niV1Ar9LvN4TsUz/ZwqzxTxl7VA3jV6jFYwVeSsgzvNhiAO7voF5Dz5FNzw+v/Z
 5eg=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087387"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:58 +0800
IronPort-SDR: 04NyaaQ/s05udqOJjt5EvboMrb4LukblzmTp4wU8YKEmnD7li1QVQGNian3UwXwODW99ZtHO/Y
 2fm2hRvqM+JwjrJWIuY5WFK/IoGsE8ZBexFu/4AOlGoEM/e9uy4PN1Ws5ONuJ+PmVcihUswCoJ
 Lh7fgDXrIhtIJhayJPlr0sqhe2QTLhdDUHMKFTvQlaqXFNFH330Xx3mg5XemEny4Ov2ERi6iTN
 ombz/FsnD8nKQhk3eGOxf2t7tNGUzp+Bqh7QhjSjawmBudmSMppB/I4fH0GWZfAjfqVedTS9M3
 OktCOIE16/M8/I1xvlt1QlU9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:05 -0700
IronPort-SDR: LvQRTWUmhtlaRfLpdnf8cCDKBpFVshPhglcZ5Ifra8HEY9vo0ggclB8Wj/rmNT+RWWd+t+q/sx
 oQ8G2y1+bxJTZ3zQxaKxiTNS/SlKWYhJQy3BvoNRC42j4lzVI4tvmJwMBrJNX7D3VP6Ft/7b7+
 mLUMWv+5kUjnLK0FdYwdRgr4IOOOMYPasgszbmYPfOQzjEbio59wDhd42QyPIZVFS1qljzdVUh
 34TRr+EKhXgq0mvTPqKXu2poKp2/6uRuIQ5CxHoy1QXDpnaszDbTQ0mIwl7h5oSL16G9Rt9fiX
 TFs=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:55 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 15/32] target/riscv: Pass the same value to oprsz and maxsz.
Date: Tue,  8 Jun 2021 10:29:30 +1000
Message-Id: <20210608002947.1649775-16-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Since commit e2e7168a214b0ed98dc357bba96816486a289762, if oprsz
is still zero(as we don't use this field), simd_desc will trigger an
assert.

Besides, tcg_gen_gvec_*_ptr calls simd_desc in it's implementation.
Here we pass the value to maxsz and oprsz to bypass the assert.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210521054816.1784297-1-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 89 ++++++++++++++-----------
 1 file changed, 50 insertions(+), 39 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 47914a3b69..83d9a285ba 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -183,7 +183,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
      */
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -334,7 +334,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     mask = tcg_temp_new_ptr();
     base = tcg_temp_new();
     stride = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     gen_get_gpr(stride, rs2);
@@ -462,7 +462,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
     base = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -594,7 +594,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     base = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -671,7 +671,7 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
     base = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -831,7 +831,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
-                           cpu_env, 0, s->vlen / 8, data, fn);
+                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
     }
     gen_set_label(over);
     return true;
@@ -874,7 +874,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1021,7 +1021,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1119,7 +1119,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
-                           cpu_env, 0, s->vlen / 8,
+                           cpu_env, s->vlen / 8, s->vlen / 8,
                            data, fn);
         gen_set_label(over);
         return true;
@@ -1207,7 +1207,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
-                           cpu_env, 0, s->vlen / 8, data, fn);
+                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
         gen_set_label(over);
         return true;
     }
@@ -1284,8 +1284,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew]);        \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew]);                           \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1473,8 +1474,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew]);        \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew]);                           \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1690,7 +1692,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
             };
 
             tcg_gen_ext_tl_i64(s1_i64, s1);
-            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1_i64, cpu_env, desc);
 
@@ -1729,7 +1731,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
 
             s1 = tcg_const_i64(simm);
             dest = tcg_temp_new_ptr();
-            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1, cpu_env, desc);
 
@@ -1838,8 +1840,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew - 1]);                       \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1863,7 +1866,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1950,8 +1953,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
                            vreg_ofs(s, a->rs1),                  \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,      \
-                           s->vlen / 8, data, fns[s->sew - 1]);  \
+                           vreg_ofs(s, a->rs2), cpu_env,         \
+                           s->vlen / 8, s->vlen / 8, data,       \
+                           fns[s->sew - 1]);                     \
         gen_set_label(over);                                     \
         return true;                                             \
     }                                                            \
@@ -2024,8 +2028,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew - 1]);                       \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2138,8 +2143,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew - 1]);                       \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2225,7 +2231,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
             dest = tcg_temp_new_ptr();
-            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
 
@@ -2278,8 +2284,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew - 1]);                       \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2326,8 +2333,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew - 1]);                       \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2388,8 +2396,8 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fn);                 \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data, fn);    \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2420,7 +2428,7 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
         dst = tcg_temp_new();
-        desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+        desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -2452,7 +2460,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
         dst = tcg_temp_new();
-        desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+        desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -2486,7 +2494,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
-                           cpu_env, 0, s->vlen / 8, data, fn);     \
+                           cpu_env, s->vlen / 8, s->vlen / 8,      \
+                           data, fn);                              \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2516,8 +2525,8 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
             gen_helper_viota_m_w, gen_helper_viota_m_d,
         };
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
-                           vreg_ofs(s, a->rs2), cpu_env, 0,
-                           s->vlen / 8, data, fns[s->sew]);
+                           vreg_ofs(s, a->rs2), cpu_env,
+                           s->vlen / 8, s->vlen / 8, data, fns[s->sew]);
         gen_set_label(over);
         return true;
     }
@@ -2542,7 +2551,8 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
             gen_helper_vid_v_w, gen_helper_vid_v_d,
         };
         tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
-                           cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
+                           cpu_env, s->vlen / 8, s->vlen / 8,
+                           data, fns[s->sew]);
         gen_set_label(over);
         return true;
     }
@@ -2895,7 +2905,8 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
-                           cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
+                           cpu_env, s->vlen / 8, s->vlen / 8, data,
+                           fns[s->sew]);
         gen_set_label(over);
         return true;
     }
-- 
2.31.1


