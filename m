Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCAC545B66
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 07:02:57 +0200 (CEST)
Received: from localhost ([::1]:49904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWnQ-00088v-G5
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 01:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGT-0003u6-5t
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:53 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGQ-00018g-2z
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835329; x=1686371329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b0A2eoTM2/L9OZ/crsT+TNlPwYQ4HTODxMuoTexBdS8=;
 b=goaow5f/0/lR/YkCTR5rE2GO0wOMbxhwTAE8p0CeKW3UI36TetsfaFMH
 +nJx0H1Uqpwe9FS5h/jLlV6heOOj1VY5XoZ/nUsDHzas1U2aeMbZUUxDU
 aHD7xD2CDLAflSNSEAOUs1QGukuE7gcLLaL4uhGqpY9KArXuCHqhr4e96
 XZ1iXYbBSBulyCtogOI/70bfqqoQd6xQX6owiIt+0fgso7Wk8w5PKpqjD
 TBLzewwHbtVbJfz+TNPT6GqOdT5eMLQSpk9HymHFi6hnUR/e0VwphHrJ7
 aF70Sq79Sap7QVMGwA8AOm5X8Wk8+ONxlOrKd+52/oZZ3kRn0qQTvO2pZ w==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="202767272"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:48 +0800
IronPort-SDR: SV2Hjo5UwraA9siysLiA6pxXIDZOn4lEjFFmZL7vR3NgAnRt6WfR7iM6zIIY0Jo4IqCjpgIp3s
 FeA7fHLYGDLmBE/+NIxguxBI27IO05tNN/La5WbM8zh9mVwz4EuGIeH2vR8LT30JaEZtuiiKKX
 cOZwWjF+S0WyMMq59xWb4iEiu7zJuEznPG016oj37T9N2Wf/zsxJJ6w5SCD88TGG+jYOcib85w
 Q8lbLkEuR+RNzxBe7ZhCtumd0VEEcM014pWOzfCVxTrVJuDM1AkOb3JmPBtmbpGs95p6IUj63c
 3H/jT/4rfqDr87XKoZ5S+RQ8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:56 -0700
IronPort-SDR: x7xls7Z1JxKPYFjqz+2SdWwpXGvOI5aLzsKG+roAOGopt9XAYB/Sf0LCjRvXxEvVrsGNKZtaN8
 44eEbDwngKHHKCOA+Rzr6mdyygsupSENgC7ILWKzsTT+ChoanWb6iZ7NRfbI1Vos5kUgTKsPfz
 u1uTlrB35JO/ajgptbiLAZZVCTop0hshjY7hXvUZoz0EpKAqL5tMkvjGAAVok5lvOEK8EYm5HZ
 XDqKvMo5cB6s6pN6+XQpxI2i+OUP2B2WXOZ8Pt/Qe4iurio8XTLDgv628VDzT24oFPkQFv2aOk
 bfc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7JH4szVz1SVp3
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835326; x=1657427327; bh=b0A2eoTM2/L9OZ/crs
 T+TNlPwYQ4HTODxMuoTexBdS8=; b=JgI0wyp5/A2WEaShd+jXFZW93mocnZBl96
 t/amYH3JUOO1UdrKcqvo0YxRkWTBY4vl2CordFofS7asJA7ORSp3RerN5z4TmYaw
 G236d4GeVZsjPtfbNgyR6UwSlLSDylEGj9USIZOglu8zqCHCQfNdAeYXWILWdKTY
 IxzcH4C2jcOYjctt66tZg3GD0WE3vGAoo91Xi3REARrbgO+kXJyeP4gKSv/O8osh
 Z3PpJS+3qxBiFDkQjFMMa+a5Hc8UmRBh9z4R0XO49fKExl+pXduuMy6bTrYHndud
 Pl5hE0wNtVIF1g5hGIxaYvpKpYfSgLfmapbj7lyOXfCsJ7Iy+rpw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id w91PvoboXrlA for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:46 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7JB5qMGz1Rvlx;
 Thu,  9 Jun 2022 21:28:42 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/25] target/riscv: rvv: Add tail agnostic for vector mask
 instructions
Date: Fri, 10 Jun 2022 14:26:51 +1000
Message-Id: <20220610042655.2021686-22-alistair.francis@opensource.wdc.com>
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

The tail elements in the destination mask register are updated under
a tail-agnostic policy.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-14@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 30 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc |  6 +++++
 2 files changed, 36 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 174a548ac2..75b59cf917 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4717,6 +4717,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
       \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vl =3D env->vl;                                \
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;    \
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);          \
     uint32_t i;                                           \
     int a, b;                                             \
                                                           \
@@ -4726,6 +4728,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,  =
        \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
     env->vstart =3D 0;                                      \
+    /* mask destination register are always tail-         \
+     * agnostic                                           \
+     */                                                   \
+    /* set tail elements to 1s */                         \
+    if (vta_all_1s) {                                     \
+        for (; i < total_elems; i++) {                    \
+            vext_set_elem_mask(vd, i, 1);                 \
+        }                                                 \
+    }                                                     \
 }
=20
 #define DO_NAND(N, M)  (!(N & M))
@@ -4793,6 +4804,8 @@ static void vmsetm(void *vd, void *v0, void *vs2, C=
PURISCVState *env,
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);
     int i;
     bool first_mask_bit =3D false;
=20
@@ -4821,6 +4834,13 @@ static void vmsetm(void *vd, void *v0, void *vs2, =
CPURISCVState *env,
         }
     }
     env->vstart =3D 0;
+    /* mask destination register are always tail-agnostic */
+    /* set tail elements to 1s */
+    if (vta_all_1s) {
+        for (; i < total_elems; i++) {
+            vext_set_elem_mask(vd, i, 1);
+        }
+    }
 }
=20
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
@@ -4848,6 +4868,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CP=
URISCVState *env,      \
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
     uint32_t sum =3D 0;                                                 =
    \
     int i;                                                              =
  \
                                                                         =
  \
@@ -4861,6 +4884,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CP=
URISCVState *env,      \
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
 GEN_VEXT_VIOTA_M(viota_m_b, uint8_t,  H1)
@@ -4874,6 +4899,9 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState=
 *env, uint32_t desc)  \
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
     int i;                                                              =
  \
                                                                         =
  \
     for (i =3D env->vstart; i < vl; i++) {                              =
    \
@@ -4883,6 +4911,8 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState=
 *env, uint32_t desc)  \
         *((ETYPE *)vd + H(i)) =3D i;                                    =
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
 GEN_VEXT_VID_V(vid_v_b, uint8_t,  H1)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 1add4cb655..a94e634a6b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3135,6 +3135,8 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)=
                \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D                                                     \
+            FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -3239,6 +3241,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D                                                     \
+            FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
                            cpu_env, s->cfg_ptr->vlen / 8,          \
@@ -3276,6 +3280,7 @@ static bool trans_viota_m(DisasContext *s, arg_viot=
a_m *a)
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         static gen_helper_gvec_3_ptr * const fns[4] =3D {
             gen_helper_viota_m_b, gen_helper_viota_m_h,
             gen_helper_viota_m_w, gen_helper_viota_m_d,
@@ -3305,6 +3310,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v =
*a)
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         static gen_helper_gvec_2_ptr * const fns[4] =3D {
             gen_helper_vid_v_b, gen_helper_vid_v_h,
             gen_helper_vid_v_w, gen_helper_vid_v_d,
--=20
2.36.1


