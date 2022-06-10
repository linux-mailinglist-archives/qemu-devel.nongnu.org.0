Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83226545B48
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:49:13 +0200 (CEST)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWa6-0003Jh-Vv
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGW-0003wY-Tk
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:58 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGT-00018n-D5
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835332; x=1686371332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q0XdjcHFLKcje4sbYMfyIEDY6c3E4FRomTa9V0CdeoE=;
 b=PbkNnmt9OtidmOhXpoRxBay1/2bVyKlpwnWNTV73lga5YrtUK5HSg60E
 xe2Bl/xgolrA2E12TF7GIAvuFZaNClnl9Eph38LvcYabXRxUsZaxo5slm
 e/F4ujnmAEzV5MJuMxtA4OlbcbWnIXW241epDGg5d1b64n0VC7eVo1Imt
 oE4lvpIan57Bu5gTYXmen1pmOIrnEKF5KbssStHBwmhwp+kxvzDDWc4l3
 pGfNTtXuH83o5E1h3vdDS4LwvlhCYVz0XqO7KCGRyLsLmAUm4CEEMCJkb
 qROtZEzh7CpRtMDN1aCcz81GrjTnGWErhQAPzvT5pD6S5vOPRfSdBRjbd Q==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="202767279"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:51 +0800
IronPort-SDR: M19ydQcxDlWPv+VGHBrrkR1ZublBHkp/B8HcC1lmWhF3+8XmbdyZeaOlQZr+G5rJCHev+IrZZo
 hFDGQlkCyXbVq6IwJB6i1ZL+V06t9mVqkbE+aKI3wbS5SBhPIUuQdq++m123yJououW5RcCHK9
 PHFVfxr3EXyKFjhVKJEIH1hTHjdpzE89HZrUvuFPWCTlcQ/whC4CK4IpKemHogWf4lSpM8/TtV
 yFBDgzA/jbnke3fgRKnBD800NNpkhyHqQTBEWif/YWDb8Z8CRvG73FmaPMSpoAk/zzjEj2/upN
 ufkleNhzHCEsTwx047J5z2ut
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:52:00 -0700
IronPort-SDR: npHXD/OW4Frho+FkMqS+M+yhbHTLifj2JTxWMwuQvTYzd2ZpgzDfq3s1W8pjokn+muArH8LW0L
 gXcl6aDmefiLZHhx3hhjwtdHjFiaGV0/n5FYiVtcAPbXEtRg62EeWKxZBjdgtZViR4UCX30n8E
 cQG6ZMw0QAb7MFpAarzRr4DLsZE4XNCe1/gzxG5Etz9RPaBTxwg1hSzG09meMcZx5wdKl5MwGc
 GW4nB9T/w+V5//2v8rGbuXSJTM/3COsUvD6WR0Jcru03mz2uy8c+YQeILx+ZYix0R7vVHHILq5
 SX8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7JM4Xgvz1SVp2
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:51 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835330; x=1657427331; bh=q0XdjcHFLKcje4sbYM
 fyIEDY6c3E4FRomTa9V0CdeoE=; b=AoJWFyg2jg/RgR1paFILZbAkmpSgsqWJhU
 UsarMUjTolYU+JNM0XhFfOlhAos8Z1FP5lkJdx1ZDMUJeMidEY3wYXAZrTNZ51RP
 9ITqaFPnPAhw0e5N584qv0fGiEqTTeyzcy0KaHPi6kFZoa4V8qW5pn8gAGUqoHhH
 KWzeiP3vBucZixK+xcONuSjlVFv9mW0y3Mzz8+jt4yZOuyGrnKFJ5mIeEnaBdEeR
 q2bpMkVPhzfd1Xi94CBzstFqovPbfYkC+fBrd0S4oS9HUf8GD7637fSRXjNzBph/
 vTz06DqO5WZvUQohnKJSlufTQhjtLcaBINMttaECTtnctjQuMX1g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0-hFvBIo78B8 for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:50 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7JH43Jpz1Rvlc;
 Thu,  9 Jun 2022 21:28:47 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/25] target/riscv: rvv: Add tail agnostic for vector
 permutation instructions
Date: Fri, 10 Jun 2022 14:26:52 +1000
Message-Id: <20220610042655.2021686-23-alistair.francis@opensource.wdc.com>
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
Message-Id: <165449614532.19704.7000832880482980398-15@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 40 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc |  7 +++--
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 75b59cf917..a96fc49c71 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4931,6 +4931,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,         \
 {                                                                       =
  \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
+    uint32_t esz =3D sizeof(ETYPE);                                     =
    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);      =
    \
+    uint32_t vta =3D vext_vta(desc);                                    =
    \
     target_ulong offset =3D s1, i_min, i;                               =
    \
                                                                         =
  \
     i_min =3D MAX(env->vstart, offset);                                 =
    \
@@ -4940,6 +4943,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,         \
         }                                                               =
  \
         *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i - offset));      =
    \
     }                                                                   =
  \
+    /* set tail elements to 1s */                                       =
  \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);            =
  \
 }
=20
 /* vslideup.vx vd, vs2, rs1, vm # vd[i+rs1] =3D vs2[i] */
@@ -4955,6 +4960,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,         \
     uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));       =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
+    uint32_t esz =3D sizeof(ETYPE);                                     =
    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);      =
    \
+    uint32_t vta =3D vext_vta(desc);                                    =
    \
     target_ulong i_max, i;                                              =
  \
                                                                         =
  \
     i_max =3D MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);   =
    \
@@ -4971,6 +4979,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,         \
     }                                                                   =
  \
                                                                         =
  \
     env->vstart =3D 0;                                                  =
    \
+    /* set tail elements to 1s */                                       =
  \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);            =
  \
 }
=20
 /* vslidedown.vx vd, vs2, rs1, vm # vd[i] =3D vs2[i+rs1] */
@@ -4986,6 +4996,9 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0=
, target_ulong s1,       \
     typedef uint##BITWIDTH##_t ETYPE;                                   =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
      \
     uint32_t vl =3D env->vl;                                            =
      \
+    uint32_t esz =3D sizeof(ETYPE);                                     =
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
@@ -4999,6 +5012,8 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0=
, target_ulong s1,       \
         }                                                               =
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
 GEN_VEXT_VSLIE1UP(8,  H1)
@@ -5026,6 +5041,9 @@ static void vslide1down_##BITWIDTH(void *vd, void *=
v0, target_ulong s1,       \
     typedef uint##BITWIDTH##_t ETYPE;                                   =
      \
     uint32_t vm =3D vext_vm(desc);                                      =
        \
     uint32_t vl =3D env->vl;                                            =
        \
+    uint32_t esz =3D sizeof(ETYPE);                                     =
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
@@ -5039,6 +5057,8 @@ static void vslide1down_##BITWIDTH(void *vd, void *=
v0, target_ulong s1,       \
         }                                                               =
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
 GEN_VEXT_VSLIDE1DOWN(8,  H1)
@@ -5092,6 +5112,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,               \
     uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(TS2)));         =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
+    uint32_t esz =3D sizeof(TS2);                                       =
    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);      =
    \
+    uint32_t vta =3D vext_vta(desc);                                    =
    \
     uint64_t index;                                                     =
  \
     uint32_t i;                                                         =
  \
                                                                         =
  \
@@ -5107,6 +5130,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,               \
         }                                                               =
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
 /* vd[i] =3D (vs1[i] >=3D VLMAX) ? 0 : vs2[vs1[i]]; */
@@ -5127,6 +5152,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,         \
     uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));       =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
+    uint32_t esz =3D sizeof(ETYPE);                                     =
    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);      =
    \
+    uint32_t vta =3D vext_vta(desc);                                    =
    \
     uint64_t index =3D s1;                                              =
    \
     uint32_t i;                                                         =
  \
                                                                         =
  \
@@ -5141,6 +5169,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,         \
         }                                                               =
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
 /* vd[i] =3D (x[rs1] >=3D VLMAX) ? 0 : vs2[rs1] */
@@ -5155,6 +5185,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,               \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
     uint32_t vl =3D env->vl;                                            =
    \
+    uint32_t esz =3D sizeof(ETYPE);                                     =
    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);      =
    \
+    uint32_t vta =3D vext_vta(desc);                                    =
    \
     uint32_t num =3D 0, i;                                              =
    \
                                                                         =
  \
     for (i =3D env->vstart; i < vl; i++) {                              =
    \
@@ -5165,6 +5198,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,               \
         num++;                                                          =
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
 /* Compress into vd elements of vs2 where vs1 is enabled */
@@ -5196,6 +5231,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,   =
              \
 {                                                                \
     uint32_t vl =3D env->vl;                                       \
     uint32_t vm =3D vext_vm(desc);                                 \
+    uint32_t esz =3D sizeof(ETYPE);                                \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz); \
+    uint32_t vta =3D vext_vta(desc);                               \
     uint32_t i;                                                  \
                                                                  \
     for (i =3D env->vstart; i < vl; i++) {                         \
@@ -5205,6 +5243,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,   =
              \
         *((ETYPE *)vd + HD(i)) =3D *((DTYPE *)vs2 + HS1(i));       \
     }                                                            \
     env->vstart =3D 0;                                             \
+    /* set tail elements to 1s */                                \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);     \
 }
=20
 GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index a94e634a6b..4f84d4878a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3669,7 +3669,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_=
rmrr *a)
         return false;
     }
=20
-    if (a->vm && s->vl_eq_vlmax) {
+    if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         int scale =3D s->lmul - (s->sew + 3);
         int vlmax =3D s->cfg_ptr->vlen >> -scale;
         TCGv_i64 dest =3D tcg_temp_new_i64();
@@ -3701,7 +3701,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_=
rmrr *a)
         return false;
     }
=20
-    if (a->vm && s->vl_eq_vlmax) {
+    if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         int scale =3D s->lmul - (s->sew + 3);
         int vlmax =3D s->cfg_ptr->vlen >> -scale;
         if (a->rs1 >=3D vlmax) {
@@ -3753,6 +3753,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg=
_r *a)
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
=20
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->cfg_ptr->vlen / 8,
@@ -3853,6 +3854,8 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a,=
 uint8_t seq)
     }
=20
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
+    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
=20
     tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                        vreg_ofs(s, a->rs2), cpu_env,
--=20
2.36.1


