Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CC8545B45
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:45:43 +0200 (CEST)
Received: from localhost ([::1]:53948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWWk-0007PV-CC
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFf-0003hJ-Nu
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:04 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFd-00015I-Fh
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835281; x=1686371281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=toFs4ovFeeDLLyGArRQYOnvX6qbxLU91o9UCcDcK0ME=;
 b=kuvXGaKItM03U9GBGG08/kfCiOX0OC+haJ+DeK+2/Mp7PRAdDvnOZYP5
 8GWA+gdVO7A0l8S3MDcuRMfkQDXcwfWBpwWQcIoXNqrG/6GDbd5pfgIeN
 eUr2RiutQNxvVaWrL5uiEK7jhPvBfJD3J1LM3kkkEqHDEb25xFCJyKHsS
 TiGpmPHk3EfUBz000J5ovRuHK4fAYftTH+KLFYIXtNqtVx6FtfNGGDzWt
 3GbT3vioxjJ8WUa5id2uIcTBSj9+Hc8gaZ6vDooKgl60+Tf6tnteIWYLG
 5T+pptCOiau+KOu2o2aTnbMnD4n+JvDfcWazapcbEAK3qIsseSy9ykmeg A==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="307046459"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:00 +0800
IronPort-SDR: JHa8CtJT8E095SCJKxftMW85UYLR9DUCuJU6SVe0yGPQDsSlgeexVey22lg2+4Jt0/9VrVW4ag
 vQgiM7NxEprqNcpzILTW2FD5a2O/Pp+7ZOPRhyxKDr//qFlvm9olUudRl0H5tvAR0IIu45/rtD
 cOQOk++IbieupZRsvy/XJEacP8gMkQEt7ratZzjL5XxSJbgYqX8xDREaAR/mPH0auedcgWblLx
 s5WjTUn4yOnuB+n67QnFN6MhRBKTNNrtzT4lY+KXdlGd5deq6DsizB66Hp1E+i3Umyfh6gIIhr
 xgB1AUn6qE+DUKBXbjT4+lSB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:09 -0700
IronPort-SDR: dn4s4NXW+wIcQKThz9E+7E45QHw0DmhACH+zcarsZDEy31MB8W1aIwfE77WmyZDK9dFrcpzRBY
 j6KnKGWpAHK6L3Wg/lbZA6fAc10AbRhNSb3jMuJga8TeUPEWX2dgCwmpg1Cghh57CkqDHftsgP
 9uJrJiNNlMBlx6Y9Vv5yD8NjWrnufkE+lV8H7ld/2g4tPUChDxJPOJkjWF0kCxoE6Kzl+U1R6J
 3G4hj9Qg0lTs2743GnfEJkt+Ft6+s1i41mwBfT0Yifu2OKH9tOXAoGyksh7PzKU7+xuUmT/jNO
 M34=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7HN3QY1z1SHwl
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1654835279; x=1657427280; bh=toFs4ov
 FeeDLLyGArRQYOnvX6qbxLU91o9UCcDcK0ME=; b=Xgo3kEEg61uFOZ32ZVMwBZf
 48NNSSjjnb5SaE3ror8XNIDKqxS0pNR/4HG60/tB0GkABvJ/T/hIoLc1i8AmlGF/
 Dq3dRw59Fua12Nhfa2MpVMI0f02Cmfki172ZQ+0vPsPo4/yw+yI58x1m8vgg4rqY
 1yVBHSRU8ZLAQusiLCHEukw4KaOzF0+06IMJ7n7MA4QOsRRugD9bOm3PZaep7Za0
 WHl60aoq+8w3uPsHjx0GzcEdOiyf0LQyWuGZ2BCJdpXlJSVE/q0EKsqmQ5hGOvA7
 D1N0gzpNKPAyazEypX0BsNVqy1cfRiO4eE+eQW2ckC0i+r+PVfTTE24DXH3lWFw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id aGe-XvezB1DG for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:27:59 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7HJ0Yf4z1Rvlc;
 Thu,  9 Jun 2022 21:27:55 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/25] target/riscv: rvv: Early exit when vstart >= vl
Date: Fri, 10 Jun 2022 14:26:41 +1000
Message-Id: <20220610042655.2021686-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

According to v-spec (section 5.4):
When vstart =E2=89=A5 vl, there are no body elements, and no elements are
updated in any destination vector register group, including that
no tail elements are updated with agnostic values.

vmsbf.m, vmsif.m, vmsof.m, viota.m, vcompress instructions themselves
require vstart to be zero. So they don't need the early exit.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-4@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 391c61fe93..6750f5d04a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -652,6 +652,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, =
uint32_t data,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -818,6 +819,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t r=
s1, uint32_t rs2,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -925,6 +927,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs=
1, uint32_t vs2,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1067,6 +1070,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, u=
int32_t data,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1225,6 +1229,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen=
3Fn *gvec_fn,
     }
=20
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     if (a->vm && s->vl_eq_vlmax) {
         gvec_fn(s->sew, vreg_ofs(s, a->rd),
@@ -1272,6 +1277,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2, uint32_t vm,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1436,6 +1442,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, =
uint32_t vs2, uint32_t vm,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1522,6 +1529,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmr=
r *a,
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -1602,6 +1610,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmr=
r *a,
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -1679,6 +1688,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -1860,6 +1870,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2070,6 +2081,7 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_=
v_v *a)
             };
             TCGLabel *over =3D gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
                                cpu_env, s->cfg_ptr->vlen / 8,
@@ -2093,6 +2105,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_=
v_x *a)
         TCGv s1;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
=20
@@ -2148,6 +2161,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_=
v_i *a)
             };
             TCGLabel *over =3D gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
             s1 =3D tcg_constant_i64(simm);
             dest =3D tcg_temp_new_ptr();
@@ -2300,6 +2314,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2330,6 +2345,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -2418,6 +2434,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
         TCGLabel *over =3D gen_new_label();                        \
         gen_set_rm(s, RISCV_FRM_DYN);                            \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);\
                                                                  \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
@@ -2492,6 +2509,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2613,6 +2631,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
         TCGLabel *over =3D gen_new_label();
         gen_set_rm(s, rm);
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -2726,6 +2745,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
             };
             TCGLabel *over =3D gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
             t1 =3D tcg_temp_new_i64();
             /* NaN-box f[rs1] */
@@ -2814,6 +2834,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2865,6 +2886,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -2930,6 +2952,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2983,6 +3006,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -3070,6 +3094,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)=
                \
         gen_helper_gvec_4_ptr *fn =3D gen_helper_##NAME;             \
         TCGLabel *over =3D gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -3238,6 +3263,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v =
*a)
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -3748,6 +3774,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a,=
 uint8_t seq)
     gen_helper_gvec_3_ptr *fn;
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     static gen_helper_gvec_3_ptr * const fns[6][4] =3D {
         {
--=20
2.36.1


