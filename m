Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37030545B63
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:57:37 +0200 (CEST)
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWiG-0004My-Aj
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWG1-0003mC-0u
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:27 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFt-00016U-VX
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835296; x=1686371296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1HTgf6RBn/uGwAc8VLeLDwwqQQe87OZ5n9pmKB0UlKs=;
 b=Q0NT5mVpU8XAPJbtnJZRjQlAXPa5292OkP3jH0WedHsLpu4sHewOCqu8
 IwNFboigutC0SYe9U4dubO/aV6dRdEEQmelKIoQF39mzE0oWIgQZAFmcO
 pd9bIckW1HnRU5Y+nv/crrVv3xs5WZvA9GxpeZiYEkLF7iirmX9sPZQYl
 iIELB+N4Za8eGLs+0/44lB4GcG22ABKkI/gFq2Uy0SU6At/2LT3tq3j3n
 wvpiI3RWSCd8+MVloLn9RlOpAPkBIdp7cf+EE3FVH02pwx0ZQ/ya/m0Sg
 zcZlLwZu+1P1ZvnU/nyiQyrW2gSwv25H4DOyIcRdeJiHmqXLehQIK99// Q==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="202767230"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:14 +0800
IronPort-SDR: 2/QM6E2yDGNQeDk66ijme3Gz2LBo7u2CYk15r3hBYGpxKYyu+wHHshwNZ28MZ4DWa3tr94h081
 g/D8OKUgrD7ZgvAWZ954hVlLnjHBka/2SfCRXudI7NNObLY2xI6sh1VtSF8GREBt1cEVMlK4TY
 id0s1UsfnQVxMmrftWJkjNMd1dT9OrJtXwCyf1pNtvEtet+1s8gCm3nxVQWjNDrVyO5EiFH+n4
 z/dwIIHzSlwAITHlEuyYWHQz3w2+y6wzkvVxGmnfGlDtROgG2xD0C2Q+V5nKcbKV28hadjgC2O
 X4bZ3h/d9NXkBC+eWufJZNXl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:23 -0700
IronPort-SDR: nPqBTEqXT3LfyaH078vOHdSVGFcMVRjNLg6vaE9FaWL6T1tQtBJ3rooE1Kv8vx3S7VqWUWauGF
 XsTs1T3oAq8wJbLpCrrRFfqNtGIl8A9auJhzCNNBTAsiXE0H2kPhwLTy/SFv5v5f+/iWB0QLtC
 M+p3LSUgC6S+u4lBVUQjE5JPJo/sC3Y9UoJwTn+BsDiAxVNJRcHudlThKamVnd7l8QGl22Bsea
 0scjtor8IvvWEG2AW2t/HD32m8pYU1Cc21p+/Ve2H8YTgg3rXsG2AkljcmPspnLF0Gy2D71/Jh
 Gqs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7Hf6VjBz1SVp5
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:14 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835293; x=1657427294; bh=1HTgf6RBn/uGwAc8VL
 eLDwwqQQe87OZ5n9pmKB0UlKs=; b=lKP9fmKdeMecotqMAQ1Anm4kafJNpy3qtX
 Ztlj/PHRP7I5vmJ3qwbfn8E0uevPxMOqcmD23zVYP0NUmrdiLFLI5C8vhAS3BMeJ
 gJfLA6IoBd/iKj8PZ9Alh7HM1SoWf65Lh+s22vgLiNuZ8hZrrkRiL0Uq5oVgifNp
 UJfMh+hzskzETQYcupL9uGSZYNcX/oXmrMC18Vu0Yp28KIYVAcUs2Yj1WXNHwn+I
 sINjBm5fYngfr97eMnLfoz3QxgGqyFr69vXNwGZ7MnMwbn5chewvJXo//SaA1/56
 oxAag6k7CVJa52bTHzNr0Vmqr4ow+IcpapfCzylzjcman93GVfcQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id go3KzzPE6RtU for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:13 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7HY2FDLz1SVp3;
 Thu,  9 Jun 2022 21:28:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/25] target/riscv: rvv: Add tail agnostic for vx, vvm,
 vxm instructions
Date: Fri, 10 Jun 2022 14:26:44 +1000
Message-Id: <20220610042655.2021686-15-alistair.francis@opensource.wdc.com>
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

`vmadc` and `vmsbc` produces a mask value, they always operate with
a tail agnostic policy.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-7@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/internals.h                |   5 +-
 target/riscv/vector_helper.c            | 314 +++++++++++++-----------
 target/riscv/insn_trans/trans_rvv.c.inc |  13 +-
 3 files changed, 190 insertions(+), 142 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 512c6c30cf..193ce57a6d 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -25,8 +25,9 @@
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
 FIELD(VDATA, VTA, 4, 1)
-FIELD(VDATA, NF, 5, 4)
-FIELD(VDATA, WD, 5, 1)
+FIELD(VDATA, VTA_ALL_1S, 5, 1)
+FIELD(VDATA, NF, 6, 4)
+FIELD(VDATA, WD, 6, 1)
=20
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ee28e1b92d..7cdb5d12af 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -127,6 +127,11 @@ static inline uint32_t vext_vta(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, VTA);
 }
=20
+static inline uint32_t vext_vta_all_1s(uint32_t desc)
+{
+    return FIELD_EX32(simd_data(desc), VDATA, VTA_ALL_1S);
+}
+
 /*
  * Get the maximum number of elements can be operated.
  *
@@ -867,10 +872,12 @@ RVVCALL(OPIVX2, vrsub_vx_d, OP_SSS_D, H8, H8, DO_RS=
UB)
=20
 static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
                        CPURISCVState *env, uint32_t desc,
-                       opivx2_fn fn)
+                       opivx2_fn fn, uint32_t esz)
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
     uint32_t i;
=20
     for (i =3D env->vstart; i < vl; i++) {
@@ -880,30 +887,32 @@ static void do_vext_vx(void *vd, void *v0, target_l=
ong s1, void *vs2,
         fn(vd, s1, vs2, i);
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
 }
=20
 /* generate the helpers for OPIVX */
-#define GEN_VEXT_VX(NAME)                                 \
+#define GEN_VEXT_VX(NAME, ESZ)                            \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
     do_vext_vx(vd, v0, s1, vs2, env, desc,                \
-               do_##NAME);                                \
-}
-
-GEN_VEXT_VX(vadd_vx_b)
-GEN_VEXT_VX(vadd_vx_h)
-GEN_VEXT_VX(vadd_vx_w)
-GEN_VEXT_VX(vadd_vx_d)
-GEN_VEXT_VX(vsub_vx_b)
-GEN_VEXT_VX(vsub_vx_h)
-GEN_VEXT_VX(vsub_vx_w)
-GEN_VEXT_VX(vsub_vx_d)
-GEN_VEXT_VX(vrsub_vx_b)
-GEN_VEXT_VX(vrsub_vx_h)
-GEN_VEXT_VX(vrsub_vx_w)
-GEN_VEXT_VX(vrsub_vx_d)
+               do_##NAME, ESZ);                           \
+}
+
+GEN_VEXT_VX(vadd_vx_b, 1)
+GEN_VEXT_VX(vadd_vx_h, 2)
+GEN_VEXT_VX(vadd_vx_w, 4)
+GEN_VEXT_VX(vadd_vx_d, 8)
+GEN_VEXT_VX(vsub_vx_b, 1)
+GEN_VEXT_VX(vsub_vx_h, 2)
+GEN_VEXT_VX(vsub_vx_w, 4)
+GEN_VEXT_VX(vsub_vx_d, 8)
+GEN_VEXT_VX(vrsub_vx_b, 1)
+GEN_VEXT_VX(vrsub_vx_h, 2)
+GEN_VEXT_VX(vrsub_vx_w, 4)
+GEN_VEXT_VX(vrsub_vx_d, 8)
=20
 void HELPER(vec_rsubs8)(void *d, void *a, uint64_t b, uint32_t desc)
 {
@@ -1031,30 +1040,30 @@ RVVCALL(OPIVX2, vwadd_wx_w, WOP_WSSS_W, H8, H4, D=
O_ADD)
 RVVCALL(OPIVX2, vwsub_wx_b, WOP_WSSS_B, H2, H1, DO_SUB)
 RVVCALL(OPIVX2, vwsub_wx_h, WOP_WSSS_H, H4, H2, DO_SUB)
 RVVCALL(OPIVX2, vwsub_wx_w, WOP_WSSS_W, H8, H4, DO_SUB)
-GEN_VEXT_VX(vwaddu_vx_b)
-GEN_VEXT_VX(vwaddu_vx_h)
-GEN_VEXT_VX(vwaddu_vx_w)
-GEN_VEXT_VX(vwsubu_vx_b)
-GEN_VEXT_VX(vwsubu_vx_h)
-GEN_VEXT_VX(vwsubu_vx_w)
-GEN_VEXT_VX(vwadd_vx_b)
-GEN_VEXT_VX(vwadd_vx_h)
-GEN_VEXT_VX(vwadd_vx_w)
-GEN_VEXT_VX(vwsub_vx_b)
-GEN_VEXT_VX(vwsub_vx_h)
-GEN_VEXT_VX(vwsub_vx_w)
-GEN_VEXT_VX(vwaddu_wx_b)
-GEN_VEXT_VX(vwaddu_wx_h)
-GEN_VEXT_VX(vwaddu_wx_w)
-GEN_VEXT_VX(vwsubu_wx_b)
-GEN_VEXT_VX(vwsubu_wx_h)
-GEN_VEXT_VX(vwsubu_wx_w)
-GEN_VEXT_VX(vwadd_wx_b)
-GEN_VEXT_VX(vwadd_wx_h)
-GEN_VEXT_VX(vwadd_wx_w)
-GEN_VEXT_VX(vwsub_wx_b)
-GEN_VEXT_VX(vwsub_wx_h)
-GEN_VEXT_VX(vwsub_wx_w)
+GEN_VEXT_VX(vwaddu_vx_b, 2)
+GEN_VEXT_VX(vwaddu_vx_h, 4)
+GEN_VEXT_VX(vwaddu_vx_w, 8)
+GEN_VEXT_VX(vwsubu_vx_b, 2)
+GEN_VEXT_VX(vwsubu_vx_h, 4)
+GEN_VEXT_VX(vwsubu_vx_w, 8)
+GEN_VEXT_VX(vwadd_vx_b, 2)
+GEN_VEXT_VX(vwadd_vx_h, 4)
+GEN_VEXT_VX(vwadd_vx_w, 8)
+GEN_VEXT_VX(vwsub_vx_b, 2)
+GEN_VEXT_VX(vwsub_vx_h, 4)
+GEN_VEXT_VX(vwsub_vx_w, 8)
+GEN_VEXT_VX(vwaddu_wx_b, 2)
+GEN_VEXT_VX(vwaddu_wx_h, 4)
+GEN_VEXT_VX(vwaddu_wx_w, 8)
+GEN_VEXT_VX(vwsubu_wx_b, 2)
+GEN_VEXT_VX(vwsubu_wx_h, 4)
+GEN_VEXT_VX(vwsubu_wx_w, 8)
+GEN_VEXT_VX(vwadd_wx_b, 2)
+GEN_VEXT_VX(vwadd_wx_h, 4)
+GEN_VEXT_VX(vwadd_wx_w, 8)
+GEN_VEXT_VX(vwsub_wx_b, 2)
+GEN_VEXT_VX(vwsub_wx_h, 4)
+GEN_VEXT_VX(vwsub_wx_w, 8)
=20
 /* Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions */
 #define DO_VADC(N, M, C) (N + M + C)
@@ -1065,6 +1074,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, v=
oid *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vl =3D env->vl;                                    \
+    uint32_t esz =3D sizeof(ETYPE);                             \
+    uint32_t total_elems =3D                                    \
+        vext_get_total_elems(env, desc, esz);                 \
+    uint32_t vta =3D vext_vta(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -1075,6 +1088,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, s1, carry);         \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* set tail elements to 1s */                             \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);  \
 }
=20
 GEN_VEXT_VADC_VVM(vadc_vvm_b, uint8_t,  H1, DO_VADC)
@@ -1092,6 +1107,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,        \
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
     uint32_t i;                                                         =
 \
                                                                         =
 \
     for (i =3D env->vstart; i < vl; i++) {                              =
   \
@@ -1101,6 +1119,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,        \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, (ETYPE)(target_long)s1, carr=
y);\
     }                                                                   =
 \
     env->vstart =3D 0;                                          \
+    /* set tail elements to 1s */                                       =
 \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);            =
 \
 }
=20
 GEN_VEXT_VADC_VXM(vadc_vxm_b, uint8_t,  H1, DO_VADC)
@@ -1123,6 +1143,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
 {                                                             \
     uint32_t vl =3D env->vl;                                    \
     uint32_t vm =3D vext_vm(desc);                              \
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;        \
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -1132,6 +1154,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, v=
oid *vs2,   \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* mask destination register are always tail-agnostic */  \
+    /* set tail elements to 1s */                             \
+    if (vta_all_1s) {                                         \
+        for (; i < total_elems; i++) {                        \
+            vext_set_elem_mask(vd, i, 1);                     \
+        }                                                     \
+    }                                                         \
 }
=20
 GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
@@ -1150,6 +1179,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1,          \
 {                                                               \
     uint32_t vl =3D env->vl;                                      \
     uint32_t vm =3D vext_vm(desc);                                \
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;          \
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                \
     uint32_t i;                                                 \
                                                                 \
     for (i =3D env->vstart; i < vl; i++) {                        \
@@ -1159,6 +1190,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong=
 s1,          \
                 DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
     }                                                           \
     env->vstart =3D 0;                                            \
+    /* mask destination register are always tail-agnostic */    \
+    /* set tail elements to 1s */                               \
+    if (vta_all_1s) {                                           \
+        for (; i < total_elems; i++) {                          \
+            vext_set_elem_mask(vd, i, 1);                       \
+        }                                                       \
+    }                                                           \
 }
=20
 GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
@@ -1209,18 +1247,18 @@ RVVCALL(OPIVX2, vxor_vx_b, OP_SSS_B, H1, H1, DO_X=
OR)
 RVVCALL(OPIVX2, vxor_vx_h, OP_SSS_H, H2, H2, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_w, OP_SSS_W, H4, H4, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_d, OP_SSS_D, H8, H8, DO_XOR)
-GEN_VEXT_VX(vand_vx_b)
-GEN_VEXT_VX(vand_vx_h)
-GEN_VEXT_VX(vand_vx_w)
-GEN_VEXT_VX(vand_vx_d)
-GEN_VEXT_VX(vor_vx_b)
-GEN_VEXT_VX(vor_vx_h)
-GEN_VEXT_VX(vor_vx_w)
-GEN_VEXT_VX(vor_vx_d)
-GEN_VEXT_VX(vxor_vx_b)
-GEN_VEXT_VX(vxor_vx_h)
-GEN_VEXT_VX(vxor_vx_w)
-GEN_VEXT_VX(vxor_vx_d)
+GEN_VEXT_VX(vand_vx_b, 1)
+GEN_VEXT_VX(vand_vx_h, 2)
+GEN_VEXT_VX(vand_vx_w, 4)
+GEN_VEXT_VX(vand_vx_d, 8)
+GEN_VEXT_VX(vor_vx_b, 1)
+GEN_VEXT_VX(vor_vx_h, 2)
+GEN_VEXT_VX(vor_vx_w, 4)
+GEN_VEXT_VX(vor_vx_d, 8)
+GEN_VEXT_VX(vxor_vx_b, 1)
+GEN_VEXT_VX(vxor_vx_h, 2)
+GEN_VEXT_VX(vxor_vx_w, 4)
+GEN_VEXT_VX(vxor_vx_d, 8)
=20
 /* Vector Single-Width Bit Shift Instructions */
 #define DO_SLL(N, M)  (N << (M))
@@ -1474,22 +1512,22 @@ RVVCALL(OPIVX2, vmax_vx_b, OP_SSS_B, H1, H1, DO_M=
AX)
 RVVCALL(OPIVX2, vmax_vx_h, OP_SSS_H, H2, H2, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_w, OP_SSS_W, H4, H4, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_d, OP_SSS_D, H8, H8, DO_MAX)
-GEN_VEXT_VX(vminu_vx_b)
-GEN_VEXT_VX(vminu_vx_h)
-GEN_VEXT_VX(vminu_vx_w)
-GEN_VEXT_VX(vminu_vx_d)
-GEN_VEXT_VX(vmin_vx_b)
-GEN_VEXT_VX(vmin_vx_h)
-GEN_VEXT_VX(vmin_vx_w)
-GEN_VEXT_VX(vmin_vx_d)
-GEN_VEXT_VX(vmaxu_vx_b)
-GEN_VEXT_VX(vmaxu_vx_h)
-GEN_VEXT_VX(vmaxu_vx_w)
-GEN_VEXT_VX(vmaxu_vx_d)
-GEN_VEXT_VX(vmax_vx_b)
-GEN_VEXT_VX(vmax_vx_h)
-GEN_VEXT_VX(vmax_vx_w)
-GEN_VEXT_VX(vmax_vx_d)
+GEN_VEXT_VX(vminu_vx_b, 1)
+GEN_VEXT_VX(vminu_vx_h, 2)
+GEN_VEXT_VX(vminu_vx_w, 4)
+GEN_VEXT_VX(vminu_vx_d, 8)
+GEN_VEXT_VX(vmin_vx_b, 1)
+GEN_VEXT_VX(vmin_vx_h, 2)
+GEN_VEXT_VX(vmin_vx_w, 4)
+GEN_VEXT_VX(vmin_vx_d, 8)
+GEN_VEXT_VX(vmaxu_vx_b, 1)
+GEN_VEXT_VX(vmaxu_vx_h, 2)
+GEN_VEXT_VX(vmaxu_vx_w, 4)
+GEN_VEXT_VX(vmaxu_vx_d, 8)
+GEN_VEXT_VX(vmax_vx_b, 1)
+GEN_VEXT_VX(vmax_vx_h, 2)
+GEN_VEXT_VX(vmax_vx_w, 4)
+GEN_VEXT_VX(vmax_vx_d, 8)
=20
 /* Vector Single-Width Integer Multiply Instructions */
 #define DO_MUL(N, M) (N * M)
@@ -1633,22 +1671,22 @@ RVVCALL(OPIVX2, vmulhsu_vx_b, OP_SUS_B, H1, H1, d=
o_mulhsu_b)
 RVVCALL(OPIVX2, vmulhsu_vx_h, OP_SUS_H, H2, H2, do_mulhsu_h)
 RVVCALL(OPIVX2, vmulhsu_vx_w, OP_SUS_W, H4, H4, do_mulhsu_w)
 RVVCALL(OPIVX2, vmulhsu_vx_d, OP_SUS_D, H8, H8, do_mulhsu_d)
-GEN_VEXT_VX(vmul_vx_b)
-GEN_VEXT_VX(vmul_vx_h)
-GEN_VEXT_VX(vmul_vx_w)
-GEN_VEXT_VX(vmul_vx_d)
-GEN_VEXT_VX(vmulh_vx_b)
-GEN_VEXT_VX(vmulh_vx_h)
-GEN_VEXT_VX(vmulh_vx_w)
-GEN_VEXT_VX(vmulh_vx_d)
-GEN_VEXT_VX(vmulhu_vx_b)
-GEN_VEXT_VX(vmulhu_vx_h)
-GEN_VEXT_VX(vmulhu_vx_w)
-GEN_VEXT_VX(vmulhu_vx_d)
-GEN_VEXT_VX(vmulhsu_vx_b)
-GEN_VEXT_VX(vmulhsu_vx_h)
-GEN_VEXT_VX(vmulhsu_vx_w)
-GEN_VEXT_VX(vmulhsu_vx_d)
+GEN_VEXT_VX(vmul_vx_b, 1)
+GEN_VEXT_VX(vmul_vx_h, 2)
+GEN_VEXT_VX(vmul_vx_w, 4)
+GEN_VEXT_VX(vmul_vx_d, 8)
+GEN_VEXT_VX(vmulh_vx_b, 1)
+GEN_VEXT_VX(vmulh_vx_h, 2)
+GEN_VEXT_VX(vmulh_vx_w, 4)
+GEN_VEXT_VX(vmulh_vx_d, 8)
+GEN_VEXT_VX(vmulhu_vx_b, 1)
+GEN_VEXT_VX(vmulhu_vx_h, 2)
+GEN_VEXT_VX(vmulhu_vx_w, 4)
+GEN_VEXT_VX(vmulhu_vx_d, 8)
+GEN_VEXT_VX(vmulhsu_vx_b, 1)
+GEN_VEXT_VX(vmulhsu_vx_h, 2)
+GEN_VEXT_VX(vmulhsu_vx_w, 4)
+GEN_VEXT_VX(vmulhsu_vx_d, 8)
=20
 /* Vector Integer Divide Instructions */
 #define DO_DIVU(N, M) (unlikely(M =3D=3D 0) ? (__typeof(N))(-1) : N / M)
@@ -1707,22 +1745,22 @@ RVVCALL(OPIVX2, vrem_vx_b, OP_SSS_B, H1, H1, DO_R=
EM)
 RVVCALL(OPIVX2, vrem_vx_h, OP_SSS_H, H2, H2, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_w, OP_SSS_W, H4, H4, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_d, OP_SSS_D, H8, H8, DO_REM)
-GEN_VEXT_VX(vdivu_vx_b)
-GEN_VEXT_VX(vdivu_vx_h)
-GEN_VEXT_VX(vdivu_vx_w)
-GEN_VEXT_VX(vdivu_vx_d)
-GEN_VEXT_VX(vdiv_vx_b)
-GEN_VEXT_VX(vdiv_vx_h)
-GEN_VEXT_VX(vdiv_vx_w)
-GEN_VEXT_VX(vdiv_vx_d)
-GEN_VEXT_VX(vremu_vx_b)
-GEN_VEXT_VX(vremu_vx_h)
-GEN_VEXT_VX(vremu_vx_w)
-GEN_VEXT_VX(vremu_vx_d)
-GEN_VEXT_VX(vrem_vx_b)
-GEN_VEXT_VX(vrem_vx_h)
-GEN_VEXT_VX(vrem_vx_w)
-GEN_VEXT_VX(vrem_vx_d)
+GEN_VEXT_VX(vdivu_vx_b, 1)
+GEN_VEXT_VX(vdivu_vx_h, 2)
+GEN_VEXT_VX(vdivu_vx_w, 4)
+GEN_VEXT_VX(vdivu_vx_d, 8)
+GEN_VEXT_VX(vdiv_vx_b, 1)
+GEN_VEXT_VX(vdiv_vx_h, 2)
+GEN_VEXT_VX(vdiv_vx_w, 4)
+GEN_VEXT_VX(vdiv_vx_d, 8)
+GEN_VEXT_VX(vremu_vx_b, 1)
+GEN_VEXT_VX(vremu_vx_h, 2)
+GEN_VEXT_VX(vremu_vx_w, 4)
+GEN_VEXT_VX(vremu_vx_d, 8)
+GEN_VEXT_VX(vrem_vx_b, 1)
+GEN_VEXT_VX(vrem_vx_h, 2)
+GEN_VEXT_VX(vrem_vx_w, 4)
+GEN_VEXT_VX(vrem_vx_d, 8)
=20
 /* Vector Widening Integer Multiply Instructions */
 RVVCALL(OPIVV2, vwmul_vv_b, WOP_SSS_B, H2, H1, H1, DO_MUL)
@@ -1753,15 +1791,15 @@ RVVCALL(OPIVX2, vwmulu_vx_w, WOP_UUU_W, H8, H4, D=
O_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_b, WOP_SUS_B, H2, H1, DO_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_h, WOP_SUS_H, H4, H2, DO_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_w, WOP_SUS_W, H8, H4, DO_MUL)
-GEN_VEXT_VX(vwmul_vx_b)
-GEN_VEXT_VX(vwmul_vx_h)
-GEN_VEXT_VX(vwmul_vx_w)
-GEN_VEXT_VX(vwmulu_vx_b)
-GEN_VEXT_VX(vwmulu_vx_h)
-GEN_VEXT_VX(vwmulu_vx_w)
-GEN_VEXT_VX(vwmulsu_vx_b)
-GEN_VEXT_VX(vwmulsu_vx_h)
-GEN_VEXT_VX(vwmulsu_vx_w)
+GEN_VEXT_VX(vwmul_vx_b, 2)
+GEN_VEXT_VX(vwmul_vx_h, 4)
+GEN_VEXT_VX(vwmul_vx_w, 8)
+GEN_VEXT_VX(vwmulu_vx_b, 2)
+GEN_VEXT_VX(vwmulu_vx_h, 4)
+GEN_VEXT_VX(vwmulu_vx_w, 8)
+GEN_VEXT_VX(vwmulsu_vx_b, 2)
+GEN_VEXT_VX(vwmulsu_vx_h, 4)
+GEN_VEXT_VX(vwmulsu_vx_w, 8)
=20
 /* Vector Single-Width Integer Multiply-Add Instructions */
 #define OPIVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
@@ -1834,22 +1872,22 @@ RVVCALL(OPIVX3, vnmsub_vx_b, OP_SSS_B, H1, H1, DO=
_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_h, OP_SSS_H, H2, H2, DO_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_w, OP_SSS_W, H4, H4, DO_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_d, OP_SSS_D, H8, H8, DO_NMSUB)
-GEN_VEXT_VX(vmacc_vx_b)
-GEN_VEXT_VX(vmacc_vx_h)
-GEN_VEXT_VX(vmacc_vx_w)
-GEN_VEXT_VX(vmacc_vx_d)
-GEN_VEXT_VX(vnmsac_vx_b)
-GEN_VEXT_VX(vnmsac_vx_h)
-GEN_VEXT_VX(vnmsac_vx_w)
-GEN_VEXT_VX(vnmsac_vx_d)
-GEN_VEXT_VX(vmadd_vx_b)
-GEN_VEXT_VX(vmadd_vx_h)
-GEN_VEXT_VX(vmadd_vx_w)
-GEN_VEXT_VX(vmadd_vx_d)
-GEN_VEXT_VX(vnmsub_vx_b)
-GEN_VEXT_VX(vnmsub_vx_h)
-GEN_VEXT_VX(vnmsub_vx_w)
-GEN_VEXT_VX(vnmsub_vx_d)
+GEN_VEXT_VX(vmacc_vx_b, 1)
+GEN_VEXT_VX(vmacc_vx_h, 2)
+GEN_VEXT_VX(vmacc_vx_w, 4)
+GEN_VEXT_VX(vmacc_vx_d, 8)
+GEN_VEXT_VX(vnmsac_vx_b, 1)
+GEN_VEXT_VX(vnmsac_vx_h, 2)
+GEN_VEXT_VX(vnmsac_vx_w, 4)
+GEN_VEXT_VX(vnmsac_vx_d, 8)
+GEN_VEXT_VX(vmadd_vx_b, 1)
+GEN_VEXT_VX(vmadd_vx_h, 2)
+GEN_VEXT_VX(vmadd_vx_w, 4)
+GEN_VEXT_VX(vmadd_vx_d, 8)
+GEN_VEXT_VX(vnmsub_vx_b, 1)
+GEN_VEXT_VX(vnmsub_vx_h, 2)
+GEN_VEXT_VX(vnmsub_vx_w, 4)
+GEN_VEXT_VX(vnmsub_vx_d, 8)
=20
 /* Vector Widening Integer Multiply-Add Instructions */
 RVVCALL(OPIVV3, vwmaccu_vv_b, WOP_UUU_B, H2, H1, H1, DO_MACC)
@@ -1883,18 +1921,18 @@ RVVCALL(OPIVX3, vwmaccsu_vx_w, WOP_SSU_W, H8, H4,=
 DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_b, WOP_SUS_B, H2, H1, DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_h, WOP_SUS_H, H4, H2, DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_w, WOP_SUS_W, H8, H4, DO_MACC)
-GEN_VEXT_VX(vwmaccu_vx_b)
-GEN_VEXT_VX(vwmaccu_vx_h)
-GEN_VEXT_VX(vwmaccu_vx_w)
-GEN_VEXT_VX(vwmacc_vx_b)
-GEN_VEXT_VX(vwmacc_vx_h)
-GEN_VEXT_VX(vwmacc_vx_w)
-GEN_VEXT_VX(vwmaccsu_vx_b)
-GEN_VEXT_VX(vwmaccsu_vx_h)
-GEN_VEXT_VX(vwmaccsu_vx_w)
-GEN_VEXT_VX(vwmaccus_vx_b)
-GEN_VEXT_VX(vwmaccus_vx_h)
-GEN_VEXT_VX(vwmaccus_vx_w)
+GEN_VEXT_VX(vwmaccu_vx_b, 2)
+GEN_VEXT_VX(vwmaccu_vx_h, 4)
+GEN_VEXT_VX(vwmaccu_vx_w, 8)
+GEN_VEXT_VX(vwmacc_vx_b, 2)
+GEN_VEXT_VX(vwmacc_vx_h, 4)
+GEN_VEXT_VX(vwmacc_vx_w, 8)
+GEN_VEXT_VX(vwmaccsu_vx_b, 2)
+GEN_VEXT_VX(vwmaccsu_vx_h, 4)
+GEN_VEXT_VX(vwmaccsu_vx_w, 8)
+GEN_VEXT_VX(vwmaccus_vx_b, 2)
+GEN_VEXT_VX(vwmaccus_vx_h, 4)
+GEN_VEXT_VX(vwmaccus_vx_w, 8)
=20
 /* Vector Integer Merge and Move Instructions */
 #define GEN_VEXT_VMV_VV(NAME, ETYPE, H)                              \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index cd73fd6119..22edf6228d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1293,6 +1293,8 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2, uint32_t vm,
=20
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
     desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
                                       s->cfg_ptr->vlen / 8, data));
=20
@@ -1328,7 +1330,7 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen=
2sFn *gvec_fn,
         return false;
     }
=20
-    if (a->vm && s->vl_eq_vlmax) {
+    if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         TCGv_i64 src1 =3D tcg_temp_new_i64();
=20
         tcg_gen_ext_tl_i64(src1, get_gpr(s, a->rs1, EXT_SIGN));
@@ -1458,6 +1460,8 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, =
uint32_t vs2, uint32_t vm,
=20
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
     desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
                                       s->cfg_ptr->vlen / 8, data));
=20
@@ -1486,7 +1490,7 @@ do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen=
2iFn *gvec_fn,
         return false;
     }
=20
-    if (a->vm && s->vl_eq_vlmax) {
+    if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                 extract_imm(s, a->rs1, imm_mode), MAXSZ(s), MAXSZ(s));
         mark_vs_dirty(s);
@@ -1540,6 +1544,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmr=
r *a,
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
@@ -1621,6 +1626,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmr=
r *a,
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
@@ -1699,6 +1705,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D                                                     \
+            FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
--=20
2.36.1


