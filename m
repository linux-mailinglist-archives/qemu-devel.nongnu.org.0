Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F97B545B60
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:55:18 +0200 (CEST)
Received: from localhost ([::1]:41156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWg1-0001ta-Ij
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFs-0003jL-3g
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:17 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:5571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFn-00016D-Ud
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835291; x=1686371291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p8UJYluIbtIiQrtjXNwgM5l0g1QB8N4fKI3UMGeszdI=;
 b=PUsECW5ZXjxBvtZ6rgRbxgI/PEJ4ms6dcG9d/cusxVswbu2KKJa3a40z
 TAwMDfvNxwSbwLANlFRjEZAF9+vLgI+TUrcYztgaWg8fMZFn2g5xp1fG6
 oKUkSEAA/sK3ZB8q8zBXDevqw9MJUsksg6nhLkqFdzQb2lYe7lL0Mquhp
 4w4Lqi9R5ih3Qfu7A6j+rEKo32CV5BDq8eUUG1jBRucsUaIEOaWE+grUy
 XCbmVRPgLxFwBMlKwpzIsgloHLNrudNh2lscc2YPSKw06a88nrb/Pp4z+
 yqrE1xZhSp7qvXR70dDZkRHQJcJNiEF8pMxnx5zDzgxh/6IQfjOX8WTka g==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="201489032"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:09 +0800
IronPort-SDR: 7YQKRxsWjTk3H0kTL3BBEOGXAS/rjoPKWuedVWBtE8l0XvrNYvOAbLmVc8QcF14FtfdYKANDJX
 SuYqKDPTqXI7ztN3knOSzLoVu3vBeis86nAAn9IsSLe5I5ClTIk4z2kCTHsMxFJVaenvtn3B6n
 u9elDR/6iazrkLcvrm2xfaxxy5OhUcjxqhL0d9PdYPtqVmOKYq16gO5Aa1nbBbBW1JGpXHMGAd
 OnEAce4r5PFKyxNyk2GAApRpfusiga9gRxYncn1Zvh6CYxSBAwsRxaxndOvaSpKsIc2BfnIpsc
 BcT0dRxGBh3GTpYKn9JBLLvM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:18 -0700
IronPort-SDR: jkQY0SgEpPzjtOknKxH/6kwOhOYe+jdt0VKssYb1ZxGmyj6nZm/Wqi/J9JAFSLGsfAah9742ab
 sru9/gBfbXfYFG6FyCRVHWObOqiOI//YfsIjPFhGBMK8Puc/8814bctiEyWHW+rdRBhFMOwCPC
 ScY2W5FgOZo2DDDNxb8VLe6IzqK1Mg65lXL/T/re11XNB8Fc+zZBm978+9UH0rYbuxP6nXhL+u
 dHougmW+HbXanGI+uRxZvWByptbFvVfuIuLqqaQbeQaOIJH2I/CFfcjGg8V2Xq5RdlvIYIx9Ev
 cxY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7HY2GHXz1SVp4
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835288; x=1657427289; bh=p8UJYluIbtIiQrtjXN
 wgM5l0g1QB8N4fKI3UMGeszdI=; b=VNS04Wz4x3U1EPrtF9m2kNh4f5cBukR2ci
 zPgPetF58kFswoGMxopK9vQzECvAR8ZD6yKqvs9RRD50yVcPymLuyV/Z9SaCCnXI
 7DeuF56ODAlG4mZsSmzfnDY0CLdoSN/VsUTP27Km93c2naHlF5Q+M6L/zO4198Zb
 TjfCdUBfhAG/lNDLiHAm8Vt8sfVPsa81kwoCEXZXeGxOWPjZ00sUYBkNbhwft0iE
 4DxFSy7jJhF2eaC6tnixIY/F/Mf0O4aPetHhL2Coa84lZFXS9UPu+vqjPGPfSS/Y
 rdnQgt2OG0I76DAkxppOKMzftzIJs82v1PlxwA3aWOuTIlewrk+A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Ffjr_aTo_BL1 for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:08 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7HS0bH6z1Rvlc;
 Thu,  9 Jun 2022 21:28:03 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/25] target/riscv: rvv: Add tail agnostic for vector load /
 store instructions
Date: Fri, 10 Jun 2022 14:26:43 +1000
Message-Id: <20220610042655.2021686-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

Destination register of unit-stride mask load and store instructions are
always written with a tail-agnostic policy.

A vector segment load / store instruction may contain fractional lmul
with nf * lmul > 1. The rest of the elements in the last register should
be treated as tail elements.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-6@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                |  2 +
 target/riscv/vector_helper.c            | 60 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc |  6 +++
 3 files changed, 68 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 59f0ee9a50..b151c20674 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -95,6 +95,7 @@ typedef struct DisasContext {
     int8_t lmul;
     uint8_t sew;
     uint8_t vta;
+    bool cfg_vta_all_1s;
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
@@ -1101,6 +1102,7 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
     ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul =3D sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3)=
;
     ctx->vta =3D FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_=
all_1s;
+    ctx->cfg_vta_all_1s =3D cpu->cfg.rvv_ta_all_1s;
     ctx->vstart =3D env->vstart;
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->misa_mxl_max =3D env->misa_mxl_max;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e2a2979bad..ee28e1b92d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -270,6 +270,9 @@ vext_ldst_stride(void *vd, void *v0, target_ulong bas=
e,
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
=20
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
@@ -284,6 +287,18 @@ vext_ldst_stride(void *vd, void *v0, target_ulong ba=
se,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
+    if (nf * max_elems % total_elems !=3D 0) {
+        uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
+        uint32_t registers_used =3D
+            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
+        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
+                          registers_used * vlenb);
+    }
 }
=20
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        =
\
@@ -329,6 +344,9 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVSta=
te *env, uint32_t desc,
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < evl; i++, env->vstart++) {
@@ -340,6 +358,18 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVSt=
ate *env, uint32_t desc,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + evl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
+    if (nf * max_elems % total_elems !=3D 0) {
+        uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
+        uint32_t registers_used =3D
+            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
+        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
+                          registers_used * vlenb);
+    }
 }
=20
 /*
@@ -439,6 +469,9 @@ vext_ldst_index(void *vd, void *v0, target_ulong base=
,
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
@@ -454,6 +487,18 @@ vext_ldst_index(void *vd, void *v0, target_ulong bas=
e,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
+    if (nf * max_elems % total_elems !=3D 0) {
+        uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
+        uint32_t registers_used =3D
+            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
+        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
+                          registers_used * vlenb);
+    }
 }
=20
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)               =
   \
@@ -521,6 +566,9 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
     target_ulong addr, offset, remain;
=20
     /* probe every access*/
@@ -576,6 +624,18 @@ ProbeSuccess:
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
+    if (nf * max_elems % total_elems !=3D 0) {
+        uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
+        uint32_t registers_used =3D
+            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
+        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
+                          registers_used * vlenb);
+    }
 }
=20
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index bf9886a93d..cd73fd6119 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -711,6 +711,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, =
uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
=20
@@ -774,6 +775,8 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v =
*a, uint8_t eew)
     /* EMUL =3D 1, NFIELDS =3D 1 */
     data =3D FIELD_DP32(data, VDATA, LMUL, 0);
     data =3D FIELD_DP32(data, VDATA, NF, 1);
+    /* Mask destination register are always tail-agnostic */
+    data =3D FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
=20
@@ -862,6 +865,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *=
a, uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -991,6 +995,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a=
, uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -1108,6 +1113,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a,=
 uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
=20
--=20
2.36.1


