Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7085098ED
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:23:36 +0200 (CEST)
Received: from localhost ([::1]:37544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRA7-0007ac-HT
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRi-0005OZ-GX
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:44 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRe-0007xw-Gf
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523058; x=1682059058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=su5YxZklaH/xa9o3VVgOYBluOVxxEPtn6VK/HCmbu3Q=;
 b=I1JqLbJkRJwJOjZ95IfnZZcI5iaCf9SfG0btUw1SisN0qiXmSh8vKvnt
 pr5AfAVc36lbhQiN2G8AVbhElt4ClIIiF4XYm7BPD+BCHsRsVKpSnWqYk
 Llo/Y+MfbZISlAB+2FTS9zvjhURy/2IBwGnXwPhSlz5aV49QFug04kcGr
 rQihI1XxrJ+f/ucn2DouhzjSihWyfWkMU/xf8yxlU4Lq32lT+WzE2QJ83
 1yquIK8pSB3HsMaLxCwXv7Qh0pwWSTueTMcUx5aOqIh46r31VnvtQFPTg
 /BeftEK/z6JCXm9BONTSnEzW/pMK6DF+hgP3Pa+B4Rp2Ly0JbV8DHwp/E g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639980"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:27 +0800
IronPort-SDR: SanGyfZjc6DyUDCR5rTvFkkoa76OIe81HWWyOi9gyqAXmNsMROkHyqKYvCtZ2GOy2SLOsF3JK+
 SkSG1VJLI1UEhPImbZebmL0OH1TDuEKQcK+irKVNWNRuY4eD4x9YsOk8KV6LMd5NSVBZMKzlLh
 jOZTEq9WIl2yVcBD/iQsFXaTo4Hz3VnVOqCqmVHvHC+xEmXl9rJZitjHWgs0W56q9tDLAEgpjx
 2vW30tFq7ZWF0QskqSWkEKON1nL01/9a0uVqgtsCWNXp/Fg9+slQL77Pn1oG7Y0JU00asClQrm
 ZLtSzTUBfgys+aRSiHhz/Ijk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:30 -0700
IronPort-SDR: N7+6Jz6Q1Rylnl0sxi67ks03jsnz3yZEqzMUgaJlQ9bEWuzCkccU+xvO6ai3qQnTOm8ZQncPvr
 FMR8HHARvUiOZpm+3eg+7dtvfozuI0OhgK0E7dzZzbekLTboc1NofAc49qxOYN4TDFv2d7VeZQ
 3QQCP+pE2im4KDAypJ9jZWCgT0Ymu35bslenNmCEzD5dsK2U/5CNI5PsOTYEM/7pRE52M3OYyj
 inS1A3T4W0hVfOSR+KPdqU5v3AJxehHQAmGg3n6P6oankEbcOSUVznox3tWmfBZ/whxTHCuT3z
 MV8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWq3s01z1Rvlx
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523047; x=1653115048; bh=su5YxZklaH/xa9o3VV
 gOYBluOVxxEPtn6VK/HCmbu3Q=; b=rKQC00HyODvvdMtKVccjXsRYAuSSHkWc/m
 EEvc4+3inq2MrfHlhTy1r3vjGzzyjewabv1j4wU3ob+WgquEkGTEQk/FITuJ6zO3
 hDGkcRLwTA1PYuW0q5N3S1suN5ISyu6fVQmU7IcCuqVwroaxnFtCOFX+w3pVDc1U
 aGOZo9dE7TxhxTtxgGVCyNU7zy3Uxul+hE4DJ+k76q04b4PsmAJ1rHFOFHfb2dtO
 g3esglRtyemlR+foPOJR3m+//NNb32FId5Wt9v7Dzdk149XZlTc10C5igfa1TeES
 trgIIVoyhwLTOvjx5/UoviAPV2rB2kNEO9tRuiX9u+mweCEJzDcQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KxvdNHFJUek1 for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:27 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWm2jvWz1SVp3;
 Wed, 20 Apr 2022 23:37:24 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/31] target/riscv: optimize helper for vmv<nr>r.v
Date: Thu, 21 Apr 2022 16:36:12 +1000
Message-Id: <20220421063630.1033608-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

LEN is not used for GEN_VEXT_VMV_WHOLE macro, so vmv<nr>r.v can share
the same helper

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220325085902.29500-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  5 +----
 target/riscv/vector_helper.c            | 29 ++++++++++---------------
 target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++----------
 3 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 26bbab2fab..a669d0187b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1086,10 +1086,7 @@ DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, =
ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
=20
-DEF_HELPER_4(vmv1r_v, void, ptr, ptr, env, i32)
-DEF_HELPER_4(vmv2r_v, void, ptr, ptr, env, i32)
-DEF_HELPER_4(vmv4r_v, void, ptr, ptr, env, i32)
-DEF_HELPER_4(vmv8r_v, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vmvr_v, void, ptr, ptr, env, i32)
=20
 DEF_HELPER_5(vzext_vf2_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vzext_vf2_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7a6ce0a3bc..99f3134aa0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4888,25 +4888,18 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H=
4)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
=20
 /* Vector Whole Register Move */
-#define GEN_VEXT_VMV_WHOLE(NAME, LEN)                      \
-void HELPER(NAME)(void *vd, void *vs2, CPURISCVState *env, \
-                  uint32_t desc)                           \
-{                                                          \
-    /* EEW =3D 8 */                                          \
-    uint32_t maxsz =3D simd_maxsz(desc);                     \
-    uint32_t i =3D env->vstart;                              \
-                                                           \
-    memcpy((uint8_t *)vd + H1(i),                          \
-           (uint8_t *)vs2 + H1(i),                         \
-           maxsz - env->vstart);                           \
-                                                           \
-    env->vstart =3D 0;                                       \
-}
+void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t de=
sc)
+{
+    /* EEW =3D 8 */
+    uint32_t maxsz =3D simd_maxsz(desc);
+    uint32_t i =3D env->vstart;
+
+    memcpy((uint8_t *)vd + H1(i),
+           (uint8_t *)vs2 + H1(i),
+           maxsz - env->vstart);
=20
-GEN_VEXT_VMV_WHOLE(vmv1r_v, 1)
-GEN_VEXT_VMV_WHOLE(vmv2r_v, 2)
-GEN_VEXT_VMV_WHOLE(vmv4r_v, 4)
-GEN_VEXT_VMV_WHOLE(vmv8r_v, 8)
+    env->vstart =3D 0;
+}
=20
 /* Vector Integer Extension */
 #define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1)            \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index b336d57270..90327509f7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3695,7 +3695,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg=
_r *a)
  * Whole Vector Register Move Instructions ignore vtype and vl setting.
  * Thus, we don't need to check vill bit. (Section 16.6)
  */
-#define GEN_VMV_WHOLE_TRANS(NAME, LEN, SEQ)                             =
\
+#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                             \
 static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               =
\
 {                                                                       =
\
     if (require_rvv(s) &&                                               =
\
@@ -3710,13 +3710,8 @@ static bool trans_##NAME(DisasContext *s, arg_##NA=
ME * a)               \
         } else {                                                        =
\
             TCGLabel *over =3D gen_new_label();                         =
  \
             tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, maxsz, over);  =
\
-                                                                        =
\
-            static gen_helper_gvec_2_ptr * const fns[4] =3D {           =
  \
-                gen_helper_vmv1r_v, gen_helper_vmv2r_v,                 =
\
-                gen_helper_vmv4r_v, gen_helper_vmv8r_v,                 =
\
-            };                                                          =
\
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2), =
\
-                               cpu_env, maxsz, maxsz, 0, fns[SEQ]);     =
\
+                               cpu_env, maxsz, maxsz, 0, gen_helper_vmvr=
_v); \
             mark_vs_dirty(s);                                           =
\
             gen_set_label(over);                                        =
\
         }                                                               =
\
@@ -3725,10 +3720,10 @@ static bool trans_##NAME(DisasContext *s, arg_##N=
AME * a)               \
     return false;                                                       =
\
 }
=20
-GEN_VMV_WHOLE_TRANS(vmv1r_v, 1, 0)
-GEN_VMV_WHOLE_TRANS(vmv2r_v, 2, 1)
-GEN_VMV_WHOLE_TRANS(vmv4r_v, 4, 2)
-GEN_VMV_WHOLE_TRANS(vmv8r_v, 8, 3)
+GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
+GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
+GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
+GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
=20
 static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
 {
--=20
2.35.1


