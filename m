Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CE6545B32
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:41:14 +0200 (CEST)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWSP-0008Oa-Q8
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFc-0003gZ-TP
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:01 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFa-00015I-Ks
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835278; x=1686371278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GTSBVpgIMA3t5+iXthsfXr1o9s3PptGB2vHKix3z8b0=;
 b=Cyi7YvqsKDlWxVp+TJ+A+jMfGBvMBNcytLqJreM7ANCEglj8I4CtkbNi
 dJ80W47h51gFb56VWpsRbtm4DDP6QCoqh8yRiFA2OVtFr8evTZAsvJi0Q
 W981IfplaG04HyLcK1qZ/hM91nw3P2ps4f4etMpsrQJ6UECvQN2dLLsOL
 y+aR5Mlvrp88qtnkr/OeU7NpQZBbVE/O+qeGtf3DAaLQAo0gH2Qj/Lnr3
 ns4HqUEiZLNhXvkoo+mB76alNqoYT1P6zGcLH8mSr9XXcM4UyQVy2WCED
 1Aq+gkbygNoV0a8zVja7RQk1I+3Xiy/W+m2aGB7nvV0UjjhbIfmjyPdPw w==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="307046450"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:27:52 +0800
IronPort-SDR: I7EdJwTrqJGHOfia/1ugh8TEbo9B9FKL+ytBpfJRkIjp0jUUCBOjnXP6wy8G6NEHki0N4mlE7q
 FBpQFzpEfwR0uR96GxNSCsJMkiKDrGBbDbvyp9yeByd2GJqBblvHxnQh9fh7nI0G646CzcmyLZ
 j6UDs1zL7+3aKe/jBlB3G8eQU/wGzy/X4t1sBlV+mHIjznzczncX0W45T0DSXU/ulUH8e2mZtU
 rAhxwyjB9fDd9GIY96y7QeubCkvF2Qy0xY1ISPYzqlDy1kxKY0GFdBXnDX2aao0f/JJaO8Diot
 Dazip8MzfjWkuTL5qrhv/hF3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:00 -0700
IronPort-SDR: +w1j9KQ19slFu/PSTCabiVeilfz+ZC0mTIKZ8wnmYB1dAf0QwfZLoJBQzNfNL0/zYt0XqIWE/W
 sSqCifnrN+ezRo+9yQz+ZW4VdJKt641aU1NmzMcWtgCAT3x6qAiPrUonNXxff1bRmj07pm2Ehg
 rnKKwro+5uGGowmgZCpJu7zomOshJAXs8gUIlK/xzeh5/b85utO/Qrkk8FizPLPlMWB/VYftcY
 eHMFIFXsJORlKl41vDiCyJ8S54yd0Yxh8CxJYlJ8DYykC34lf6eGML3QGf5OKc68zV4UlfbRyK
 NWY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:27:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7HC6PZ4z1SVp3
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:27:51 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835271; x=1657427272; bh=GTSBVpgIMA3t5+iXth
 sfXr1o9s3PptGB2vHKix3z8b0=; b=qibfUKiDKCu4ptMYflIhQZl8yv9YlX3Thd
 bPRER30mk706MC72i5CD2bCAACaneFa69C+8QdrFk/0rYZ9gomh0sh0umJJYSSY8
 JWKH3XpfTvWYKXmxmIhKSblV/X7R65C5SWNK7kDJCI7jGDSuBCSDs8W/Yxs3jVnb
 +vI1t0kuTnp4+b1w9pu6vOUBkxMV5iU+H+pvS4fLtVJrKacWEtaonb5MqAXNh7JA
 K1vkO0/2jPxcT+Qt/JZL0R/o6jjejsHKt6N5VSZzqcTpCs3F0M7bfoSbJvUoP0+m
 lBI63kUNn5IqKFTqFjSj51kaXxL/gEWTfjddXmyevT6t5u9wq28g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Cxq0Qq0NfpdA for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:27:51 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7H81JY4z1Rvlx;
 Thu,  9 Jun 2022 21:27:47 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/25] target/riscv: rvv: Prune redundant access_type parameter
 passed
Date: Fri, 10 Jun 2022 14:26:39 +1000
Message-Id: <20220610042655.2021686-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
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

No functional change intended in this commit.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-2@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 85dd611cd9..60840325c4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -231,7 +231,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong bas=
e,
                  target_ulong stride, CPURISCVState *env,
                  uint32_t desc, uint32_t vm,
                  vext_ldst_elem_fn *ldst_elem,
-                 uint32_t esz, uintptr_t ra, MMUAccessType access_type)
+                 uint32_t esz, uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
@@ -259,7 +259,7 @@ void HELPER(NAME)(void *vd, void * v0, target_ulong b=
ase,               \
 {                                                                       =
\
     uint32_t vm =3D vext_vm(desc);                                      =
  \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      =
\
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      =
\
+                     ctzl(sizeof(ETYPE)), GETPC());                     =
\
 }
=20
 GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b)
@@ -274,7 +274,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong ba=
se,                \
 {                                                                       =
\
     uint32_t vm =3D vext_vm(desc);                                      =
  \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     =
\
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     =
\
+                     ctzl(sizeof(ETYPE)), GETPC());                     =
\
 }
=20
 GEN_VEXT_ST_STRIDE(vsse8_v,  int8_t,  ste_b)
@@ -290,7 +290,7 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t d=
esc,
              vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t evl,
-             uintptr_t ra, MMUAccessType access_type)
+             uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
@@ -319,14 +319,14 @@ void HELPER(NAME##_mask)(void *vd, void *v0, target=
_ulong base,         \
 {                                                                       =
\
     uint32_t stride =3D vext_nf(desc) << ctzl(sizeof(ETYPE));           =
  \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, LOAD_FN,   =
\
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      =
\
+                     ctzl(sizeof(ETYPE)), GETPC());                     =
\
 }                                                                       =
\
                                                                         =
\
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
\
                   CPURISCVState *env, uint32_t desc)                    =
\
 {                                                                       =
\
     vext_ldst_us(vd, base, env, desc, LOAD_FN,                          =
\
-                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_LOAD); =
\
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC());                =
\
 }
=20
 GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
@@ -340,14 +340,14 @@ void HELPER(NAME##_mask)(void *vd, void *v0, target=
_ulong base,          \
 {                                                                       =
 \
     uint32_t stride =3D vext_nf(desc) << ctzl(sizeof(ETYPE));           =
   \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  =
 \
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     =
 \
+                     ctzl(sizeof(ETYPE)), GETPC());                     =
 \
 }                                                                       =
 \
                                                                         =
 \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
 \
                   CPURISCVState *env, uint32_t desc)                    =
 \
 {                                                                       =
 \
     vext_ldst_us(vd, base, env, desc, STORE_FN,                         =
 \
-                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_STORE);=
 \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC());                =
 \
 }
=20
 GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
@@ -364,7 +364,7 @@ void HELPER(vlm_v)(void *vd, void *v0, target_ulong b=
ase,
     /* evl =3D ceil(vl/8) */
     uint8_t evl =3D (env->vl + 7) >> 3;
     vext_ldst_us(vd, base, env, desc, lde_b,
-                 0, evl, GETPC(), MMU_DATA_LOAD);
+                 0, evl, GETPC());
 }
=20
 void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
@@ -373,7 +373,7 @@ void HELPER(vsm_v)(void *vd, void *v0, target_ulong b=
ase,
     /* evl =3D ceil(vl/8) */
     uint8_t evl =3D (env->vl + 7) >> 3;
     vext_ldst_us(vd, base, env, desc, ste_b,
-                 0, evl, GETPC(), MMU_DATA_STORE);
+                 0, evl, GETPC());
 }
=20
 /*
@@ -399,7 +399,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base=
,
                 void *vs2, CPURISCVState *env, uint32_t desc,
                 vext_get_index_addr get_index_addr,
                 vext_ldst_elem_fn *ldst_elem,
-                uint32_t esz, uintptr_t ra, MMUAccessType access_type)
+                uint32_t esz, uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
@@ -427,7 +427,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong ba=
se,                   \
                   void *vs2, CPURISCVState *env, uint32_t desc)         =
   \
 {                                                                       =
   \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,             =
   \
-                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD=
); \
+                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC());             =
   \
 }
=20
 GEN_VEXT_LD_INDEX(vlxei8_8_v,   int8_t,  idx_b, lde_b)
@@ -453,7 +453,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong ba=
se,         \
 {                                                                \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
                     STORE_FN, ctzl(sizeof(ETYPE)),               \
-                    GETPC(), MMU_DATA_STORE);                    \
+                    GETPC());                                    \
 }
=20
 GEN_VEXT_ST_INDEX(vsxei8_8_v,   int8_t,  idx_b, ste_b)
@@ -576,8 +576,7 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
  */
 static void
 vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_=
t desc,
-                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra=
,
-                MMUAccessType access_type)
+                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra=
)
 {
     uint32_t i, k, off, pos;
     uint32_t nf =3D vext_nf(desc);
@@ -612,8 +611,7 @@ void HELPER(NAME)(void *vd, target_ulong base,       =
\
                   CPURISCVState *env, uint32_t desc) \
 {                                                    \
     vext_ldst_whole(vd, base, env, desc, LOAD_FN,    \
-                    ctzl(sizeof(ETYPE)), GETPC(),    \
-                    MMU_DATA_LOAD);                  \
+                    ctzl(sizeof(ETYPE)), GETPC());   \
 }
=20
 GEN_VEXT_LD_WHOLE(vl1re8_v,  int8_t,  lde_b)
@@ -638,8 +636,7 @@ void HELPER(NAME)(void *vd, target_ulong base,       =
\
                   CPURISCVState *env, uint32_t desc) \
 {                                                    \
     vext_ldst_whole(vd, base, env, desc, STORE_FN,   \
-                    ctzl(sizeof(ETYPE)), GETPC(),    \
-                    MMU_DATA_STORE);                 \
+                    ctzl(sizeof(ETYPE)), GETPC());   \
 }
=20
 GEN_VEXT_ST_WHOLE(vs1r_v, int8_t, ste_b)
--=20
2.36.1


