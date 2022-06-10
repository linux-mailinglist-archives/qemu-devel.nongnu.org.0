Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FF9545B35
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:41:59 +0200 (CEST)
Received: from localhost ([::1]:45750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWT8-0001p0-Lp
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGB-0003nk-Ho
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:36 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:41107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWG7-00017Y-Mq
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835311; x=1686371311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4KxUHtujHhzszJ2LfEPZIVRhMFu+gs8du6hXV7lE2ws=;
 b=DhhKl8m1OmV3mZVw4NL5KmY6UYcJBb8/ys59BANiudpCjH40QVCWAvly
 TIewxLTeRqHupEjs721kDX7rJYkrsNk4vH5ukv7OF/R3nMNTxhv7xCvTd
 kyqaDytvm6uqjlqCuUOxkEXBu/5rfuG4Q3yE8GjfMijlawOGklpiFQvbH
 hGDtSLMNC6YUwuvrgY7obwo+YY1IXEMvza27Qzo58qNgPLaVGSr7JqaQb
 N+lR+BGXDusca+6MTklVQMSrmTHa2bXXkzYoGC5Ph61GXDJBFBuKl9UCK
 7K3XVWTVOvlr+mey5euHMAOE4HTRU8zCYbqLEKIv85+tW/OzdsKjqXd45 g==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="314815119"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:28 +0800
IronPort-SDR: RTXTbg6OoqimRaR3dSHlS6MYlbtKrg2M2u61wazb1GPJXHmG9oh49tYqbfBouSoayD7XFpjlxU
 VqGp5d61YKKkfoZJQpMNe7GGIZYVXPqs5W7gIDEYeEodThK7TXySlrUGERJLSkky8yPpDimDPr
 R7A6OZ9RqnlcCqy2gI/Wyk9M+g8ZhKPCfUrdu/UUGCCqlS8zZ/0chDwLb62E1+ISScGpY6eiG9
 LtFE7uIC4r0J1h95I0L+c59gXjfKP9FPwtXKjqDx21Q2RGUR2k/wzp2PnZByKpzjuSQtI1IA9r
 M9DI2ja0QX/x/7FHyHm1Rnpe
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:37 -0700
IronPort-SDR: 1mujEO9AVjO6U0dty6DjL/j6nPNn1uJ3oEGKRToWw3VOlip+OIXvI9GJp3f8SpdhSr58dFlyFL
 JmVp60z3dP9mSRIdq2/QIPXHxK0eoOHEiJbS8yL5Ne0t7umqtufzra0vgDKbWaAvYbQAoOYLmL
 Ie1V4p7ibdr92/k66SCkoh+w+FTXE4JWjBEWd9Qv8Qg9DPXfePHITmui+emN5M/i+iXxXA1R/B
 tJgKDoh+GGGO65bXp0YsaqipStdIu0SEl0PpXKZI5aB95DLZSWhSNHS2g7LC1/RVi6xA++ptjK
 50o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7Hw39zlz1Rwrw
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:28 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835307; x=1657427308; bh=4KxUHtujHhzszJ2LfE
 PZIVRhMFu+gs8du6hXV7lE2ws=; b=DJxpQdp/KK/sUa7IrLY61LScp3YEUQ4Qc1
 4FMGWVwOScmPYHYt0EjEklonhtrbtaiEFxaNEv2b9oCvPjx06T773vurWERRMF/Z
 K+K981AZx47qM/QTBjnkp2CJnpJc0ly4pDN9R4apu0V+3xw9K9ysgcUF88fH5Cus
 h0RK3A1n8Yo2NvwIVaoV1Vd8/10aPaYJcsbUylSYSI6LYwKigCFnJkTDw5tntmwf
 7vw4k7eWbP5lBkaY4kdjvJ20op/fokCCt04KMFvWhf9eT+UXsqtir6wbrRMoNJIb
 wwjZ4mEIJcVeLi2ATOMDSqDIRdZYxC2wiiqAf82J2U/tRGODe1rg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id dgqt9flktCkn for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:27 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7Hq5tVxz1Rvlc;
 Thu,  9 Jun 2022 21:28:23 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/25] target/riscv: rvv: Add tail agnostic for vector integer
 merge and move instructions
Date: Fri, 10 Jun 2022 14:26:47 +1000
Message-Id: <20220610042655.2021686-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: eopXD <yueh.ting.chen@gmail.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-10@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 20 ++++++++++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++----
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a64506bf02..128238786e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1969,6 +1969,9 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVStat=
e *env,           \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);     \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -1976,6 +1979,8 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVStat=
e *env,           \
         *((ETYPE *)vd + H(i)) =3D s1;                                  \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
 }
=20
 GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1)
@@ -1988,12 +1993,17 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCV=
State *env,         \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);     \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
         *((ETYPE *)vd + H(i)) =3D (ETYPE)s1;                           \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
 }
=20
 GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1)
@@ -2006,6 +2016,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,          \
                   CPURISCVState *env, uint32_t desc)                 \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);     \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -2013,6 +2026,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,          \
         *((ETYPE *)vd + H(i)) =3D *(vt + H(i));                        \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
 }
=20
 GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1)
@@ -2025,6 +2040,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1,               \
                   void *vs2, CPURISCVState *env, uint32_t desc)      \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);     \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -2034,6 +2052,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1,               \
         *((ETYPE *)vd + H(i)) =3D d;                                   \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
 }
=20
 GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index dbe687fb73..e75a2fd196 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2086,12 +2086,13 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vm=
v_v_v *a)
         vext_check_isa_ill(s) &&
         /* vmv.v.v has rs2 =3D 0 and vm =3D 1 */
         vext_check_sss(s, a->rd, a->rs1, 0, 1)) {
-        if (s->vl_eq_vlmax) {
+        if (s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
             tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
                              vreg_ofs(s, a->rs1),
                              MAXSZ(s), MAXSZ(s));
         } else {
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_gvec_2_ptr * const fns[4] =3D {
                 gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
                 gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
@@ -2126,7 +2127,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_=
v_x *a)
=20
         s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
=20
-        if (s->vl_eq_vlmax) {
+        if (s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
             tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
                                 MAXSZ(s), MAXSZ(s), s1);
         } else {
@@ -2134,6 +2135,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_=
v_x *a)
             TCGv_i64 s1_i64 =3D tcg_temp_new_i64();
             TCGv_ptr dest =3D tcg_temp_new_ptr();
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[4] =3D {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
@@ -2163,7 +2165,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_=
v_i *a)
         /* vmv.v.i has rs2 =3D 0 and vm =3D 1 */
         vext_check_ss(s, a->rd, 0, 1)) {
         int64_t simm =3D sextract64(a->rs1, 0, 5);
-        if (s->vl_eq_vlmax) {
+        if (s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
             tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), simm);
             mark_vs_dirty(s);
@@ -2172,6 +2174,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_=
v_i *a)
             TCGv_i64 s1;
             TCGv_ptr dest;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[4] =3D {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
@@ -2743,7 +2746,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
=20
         TCGv_i64 t1;
=20
-        if (s->vl_eq_vlmax) {
+        if (s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
             t1 =3D tcg_temp_new_i64();
             /* NaN-box f[rs1] */
             do_nanbox(s, t1, cpu_fpr[a->rs1]);
@@ -2755,6 +2758,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
             TCGv_ptr dest;
             TCGv_i32 desc;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[3] =3D {
                 gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w,
--=20
2.36.1


