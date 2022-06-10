Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E893545B2D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:38:32 +0200 (CEST)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWPn-0004WE-N7
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWG1-0003mM-HK
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:27 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFx-00016p-5A
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835300; x=1686371300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HFlblSW9xtLS+EtqnSWCLcbeUsVneRTbfsSC6n+nq4s=;
 b=pyK/ZQHSnXgz29JL0g2kO1RxqAonb2JEhf6NjY2DvdAUha1pR+SKzWa1
 SxNImDHSllstUUgEroatwx96TLZjCTFnQi2BlMknAJ1jg5Nvyq1TqaykI
 EpyaBJLBxyzmvi5bZw6XfgcOOt42B8FM7wL5UhyD4ClxZ3WT3uiyfoMrk
 KPKb839EOxxFEZO7HrGrp0g0XP1Es6Y1OrBqgBgmEr3NUuGW542dPoToy
 UKhUH9qSugVk7fZNRDse9QUwDwy5t8pM0pELmIJrmGA2qiGRAKQHjStHB
 Pxy+pmqs1GfKJiYZ8v6XAyIdWBshtmu55fLU5TR3Twn+CpnQ8DsZkKxIF A==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="202767233"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:17 +0800
IronPort-SDR: 3h2OUSwj8bO7cmjltNqNq27X0ftoaJHLudimNIgp1pgFXNA1cD63+mBU/xaT9ucS3X5HgmzTqt
 Rfs0PHLsITriYCF/u1Xfrb8LG4E8msfFiL2Fdu8UFOyCUau2lh4KfL/RN+WQIYh9DFdOBxWSli
 gz8fc9Bl558FfpJ+hxNrv+4cPSsX7iqb2TlvqBPbJYMN+UHdzL88To1bTSjaNDWvlzWBCrhudf
 Jka1dKFemTQ1g5ulU/H1m5eay0btVp3dEYc/GTaFhWp2sfWM4LxVwKSPq2nm4fx3JAbIk6bOHX
 Ssg5wjoBYGpQhpiKepdG/4NC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:27 -0700
IronPort-SDR: 416rmb2vqw+VNvY6NWrXausKZB+ayPU6iZlq/HeG/TGKzNII86229y7zioK1CLhVc5EmC2FtFF
 fPKJ59BReZJ1CpDm9VLPFj1nx0fDU2qf8sty3jkFjN8CxLqnxSHAFkH0Aw8y7Yjls25sZiOoy5
 CMGw3l9WcLJgNbsIS49HrYbM2Sey65KV0MlITJYjaMxBbUgBPTDzdglxswPUmRNcUO8Ee3ZOM3
 Tk3gI8gLIhkg5SrQVX0lhjtKenkErDT4LyXvw5jA4TqTCKcTCqLuddDmB9Wj07w/nf20OU1xdZ
 BP4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7Hk42ngz1Rwrw
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835298; x=1657427299; bh=HFlblSW9xtLS+EtqnS
 WCLcbeUsVneRTbfsSC6n+nq4s=; b=WvNSIdiU0dNKTa8xc9BoC2q8oJNw5mN51G
 D6zx3ZFZJko/rRDFtZsSBoH6vfXsMA5OJ7ZfBM+I1gYmc8bnBgEzZ7RfxA6sX6oy
 7yh7Od4bfl+UUNbhPCvIQEthAaqAb7b72HxmE7RDGY28za56pt5+UBanPI5Xd7II
 Tn0CoAj1AHnQGDH7pYZCTOQF4lXpGPPsgbRK3JEphyAcl/3az20lrJqflGFQPTyK
 f+iLEoCtyay3j0CvTZ5H1G0Hk+GZ1J84bABIun1Yp+Kz9p1R7gT6mMVcHG3/xRXW
 Pjggiw6DJ9qpAQT7LXMccVb8qnDGyjZfRUmrcXgIY7paqXc/KLtA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qJggVBtDcv6E for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:18 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7Hf0y6Vz1Rvlc;
 Thu,  9 Jun 2022 21:28:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/25] target/riscv: rvv: Add tail agnostic for vector integer
 shift instructions
Date: Fri, 10 Jun 2022 14:26:45 +1000
Message-Id: <20220610042655.2021686-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
Message-Id: <165449614532.19704.7000832880482980398-8@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 11 +++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7cdb5d12af..056c2a1c7e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1271,6 +1271,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
                       \
 {                                                                       =
  \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
+    uint32_t esz =3D sizeof(TS1);                                       =
    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);      =
    \
+    uint32_t vta =3D vext_vta(desc);                                    =
    \
     uint32_t i;                                                         =
  \
                                                                         =
  \
     for (i =3D env->vstart; i < vl; i++) {                              =
    \
@@ -1282,6 +1285,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
                       \
         *((TS1 *)vd + HS1(i)) =3D OP(s2, s1 & MASK);                    =
    \
     }                                                                   =
  \
     env->vstart =3D 0;                                                  =
    \
+    /* set tail elements to 1s */                                       =
  \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);            =
  \
 }
=20
 GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7)
@@ -1306,6 +1311,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong=
 s1,      \
 {                                                           \
     uint32_t vm =3D vext_vm(desc);                            \
     uint32_t vl =3D env->vl;                                  \
+    uint32_t esz =3D sizeof(TD);                              \
+    uint32_t total_elems =3D                                  \
+        vext_get_total_elems(env, desc, esz);               \
+    uint32_t vta =3D vext_vta(desc);                          \
     uint32_t i;                                             \
                                                             \
     for (i =3D env->vstart; i < vl; i++) {                    \
@@ -1316,6 +1325,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1,      \
         *((TD *)vd + HD(i)) =3D OP(s2, s1 & MASK);            \
     }                                                       \
     env->vstart =3D 0;                                        \
+    /* set tail elements to 1s */                           \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);\
 }
=20
 GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 22edf6228d..dbe687fb73 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1831,7 +1831,7 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, G=
VecGen2sFn32 *gvec_fn,
         return false;
     }
=20
-    if (a->vm && s->vl_eq_vlmax) {
+    if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         TCGv_i32 src1 =3D tcg_temp_new_i32();
=20
         tcg_gen_trunc_tl_i32(src1, get_gpr(s, a->rs1, EXT_NONE));
@@ -1890,6 +1890,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
--=20
2.36.1


