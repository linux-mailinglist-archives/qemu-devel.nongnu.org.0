Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C51E545B54
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:50:36 +0200 (CEST)
Received: from localhost ([::1]:34348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWbT-00055W-3l
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGO-0003qP-VG
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:49 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:5606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGI-00017r-Vv
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835322; x=1686371322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SR4Sd1MYd0doLTn8wBdjHtbtwqfnaHxJa6A22cPqwxE=;
 b=ISxFUBXDD5ytvfC/EakZdiMrtJqwNdjXZ8Zd7NxfxPtSBItqu+YDp0fG
 kyU6WLJa/Fyb0w53S7HcPmSeiCqNoAPzB0MjhMSUBC6iK3G9aHoHRWoeC
 lmBMrWNlMAWlSMcPOfq4B6IdqJMwTr6AMyMRU968XmyCrIrrrcQa29j0U
 NB55bi2Qaf2otvcnJO3FaSYZ1i7HC4yS+liAjfqfbJNYaArWvC3Gw2s1I
 mEy0P1vfSy3D/mtVsBNJcPX4gmB8DVkthq97aloAseEPVzl10b1oLM7OQ
 BJpyFEwDZBim/Wv3yzo323A0yOL+ZTg5kQ2hcW6HamVDa862QvIoTgf4I Q==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="201489061"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:41 +0800
IronPort-SDR: RjSRJtYU/WqoCh3G/l7zWpHA8jQeBs69kFdtUTD8Xc/LqMId3do0xUHsm93LrLj0LNeuCsnT/T
 IJ5q0aJd6GRvYqiFP37U7iuZLH2y7uVZFqBAdpc+9xsWHlUaqQ8Gmla9VKcCbieKTbmJkP+ryU
 lX+s4GCduIZ/nV7ipt9YPnElnXINdsrBDbn4rAYZHzRyTxL3pSaJKyu2ZmfU5DW0o7U+8EendC
 1Cdvr5iewOQ28z0wKcTvfdqxIIC+Rx/ANcW/B8KyFfLtChFuWpjzK3JI0Gvqb9PzfY367N4pi7
 FbvU1n8ieh6tyxYGvF+j6m8C
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:49 -0700
IronPort-SDR: dAfSaElk0TDBdELAN2VIvtVxk9m7PPARW0Y3hGFEylnIqdGQtDmXt0FtVuqVbtg/cKUsWoOiYK
 nbLBIJHI4Uqzx6Px/mQnpFlfxvrLHt6XTyYiJzwkARN5mTZAV4f/sQQ3k2YEmNALXTCcQkIM6g
 yF1JnLxeNRohWxqdRe6dXxifWo8Vy+4tmiDBXdGBlbnTgsHrw2VCCv6fTia7+I1K7i7PRF8///
 QcUu/hEmKIUVj/wksk36c2GKTtnut844l20clfh62R0Pdw9UBfcigaGM2qewfLXorGVm2Zsaql
 C+s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7J84xzsz1SVp5
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835317; x=1657427318; bh=SR4Sd1MYd0doLTn8wB
 djHtbtwqfnaHxJa6A22cPqwxE=; b=gBLRQHNsKFJLZU/KG6iRKHHRyLMIKMnuMw
 wXqWaspPmeI65/9TXVWzg7fbMpAL+psiL/EMOKgjoQ/sE9mFbsr9WPgKnLSbcYsu
 XuY4VnD7RVn7+mY9OECijeH3IqumC1mgh5Osuu4TttpsKUpm77QOrqCJn+TFlq5w
 GoAnmAr6zU6bzhvZCHQOkZghM5QTTuIGTzzr7y9N4zNHhzsVgjsIRv7UUVJTBMcW
 Mh1uwvQAquTsEPBlL2FlPdZe6EzPbFR0ruIL01HHkTUiAGNzpDf/RVkzjDk2un9E
 /sWYa7bF+iWC6V6z+3Wic20AMF7+fUUkj+WLec6G3UUsw1/4XcMA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Ad6Q5z4wAXlg for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:37 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7J14r0dz1Rvlc;
 Thu,  9 Jun 2022 21:28:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/25] target/riscv: rvv: Add tail agnostic for vector
 floating-point instructions
Date: Fri, 10 Jun 2022 14:26:49 +1000
Message-Id: <20220610042655.2021686-20-alistair.francis@opensource.wdc.com>
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

Compares write mask registers, and so always operate under a tail-
agnostic policy.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-12@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 440 +++++++++++++-----------
 target/riscv/insn_trans/trans_rvv.c.inc |  17 +
 2 files changed, 261 insertions(+), 196 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1fa93cf1f0..17390d8d06 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2994,13 +2994,16 @@ static void do_##NAME(void *vd, void *vs1, void *=
vs2, int i,   \
     *((TD *)vd + HD(i)) =3D OP(s2, s1, &env->fp_status);         \
 }
=20
-#define GEN_VEXT_VV_ENV(NAME)                             \
+#define GEN_VEXT_VV_ENV(NAME, ESZ)                        \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vm =3D vext_vm(desc);                          \
     uint32_t vl =3D env->vl;                                \
+    uint32_t total_elems =3D                                \
+        vext_get_total_elems(env, desc, ESZ);             \
+    uint32_t vta =3D vext_vta(desc);                        \
     uint32_t i;                                           \
                                                           \
     for (i =3D env->vstart; i < vl; i++) {                  \
@@ -3010,14 +3013,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
         \
         do_##NAME(vd, vs1, vs2, i, env);                  \
     }                                                     \
     env->vstart =3D 0;                                      \
+    /* set tail elements to 1s */                         \
+    vext_set_elems_1s(vd, vta, vl * ESZ,                  \
+                      total_elems * ESZ);                 \
 }
=20
 RVVCALL(OPFVV2, vfadd_vv_h, OP_UUU_H, H2, H2, H2, float16_add)
 RVVCALL(OPFVV2, vfadd_vv_w, OP_UUU_W, H4, H4, H4, float32_add)
 RVVCALL(OPFVV2, vfadd_vv_d, OP_UUU_D, H8, H8, H8, float64_add)
-GEN_VEXT_VV_ENV(vfadd_vv_h)
-GEN_VEXT_VV_ENV(vfadd_vv_w)
-GEN_VEXT_VV_ENV(vfadd_vv_d)
+GEN_VEXT_VV_ENV(vfadd_vv_h, 2)
+GEN_VEXT_VV_ENV(vfadd_vv_w, 4)
+GEN_VEXT_VV_ENV(vfadd_vv_d, 8)
=20
 #define OPFVF2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)        \
 static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i, \
@@ -3027,13 +3033,16 @@ static void do_##NAME(void *vd, uint64_t s1, void=
 *vs2, int i, \
     *((TD *)vd + HD(i)) =3D OP(s2, (TX1)(T1)s1, &env->fp_status);\
 }
=20
-#define GEN_VEXT_VF(NAME)                                 \
+#define GEN_VEXT_VF(NAME, ESZ)                            \
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vm =3D vext_vm(desc);                          \
     uint32_t vl =3D env->vl;                                \
+    uint32_t total_elems =3D                                \
+        vext_get_total_elems(env, desc, ESZ);              \
+    uint32_t vta =3D vext_vta(desc);                        \
     uint32_t i;                                           \
                                                           \
     for (i =3D env->vstart; i < vl; i++) {                  \
@@ -3043,27 +3052,30 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1=
,        \
         do_##NAME(vd, s1, vs2, i, env);                   \
     }                                                     \
     env->vstart =3D 0;                                      \
+    /* set tail elements to 1s */                         \
+    vext_set_elems_1s(vd, vta, vl * ESZ,                  \
+                      total_elems * ESZ);                 \
 }
=20
 RVVCALL(OPFVF2, vfadd_vf_h, OP_UUU_H, H2, H2, float16_add)
 RVVCALL(OPFVF2, vfadd_vf_w, OP_UUU_W, H4, H4, float32_add)
 RVVCALL(OPFVF2, vfadd_vf_d, OP_UUU_D, H8, H8, float64_add)
-GEN_VEXT_VF(vfadd_vf_h)
-GEN_VEXT_VF(vfadd_vf_w)
-GEN_VEXT_VF(vfadd_vf_d)
+GEN_VEXT_VF(vfadd_vf_h, 2)
+GEN_VEXT_VF(vfadd_vf_w, 4)
+GEN_VEXT_VF(vfadd_vf_d, 8)
=20
 RVVCALL(OPFVV2, vfsub_vv_h, OP_UUU_H, H2, H2, H2, float16_sub)
 RVVCALL(OPFVV2, vfsub_vv_w, OP_UUU_W, H4, H4, H4, float32_sub)
 RVVCALL(OPFVV2, vfsub_vv_d, OP_UUU_D, H8, H8, H8, float64_sub)
-GEN_VEXT_VV_ENV(vfsub_vv_h)
-GEN_VEXT_VV_ENV(vfsub_vv_w)
-GEN_VEXT_VV_ENV(vfsub_vv_d)
+GEN_VEXT_VV_ENV(vfsub_vv_h, 2)
+GEN_VEXT_VV_ENV(vfsub_vv_w, 4)
+GEN_VEXT_VV_ENV(vfsub_vv_d, 8)
 RVVCALL(OPFVF2, vfsub_vf_h, OP_UUU_H, H2, H2, float16_sub)
 RVVCALL(OPFVF2, vfsub_vf_w, OP_UUU_W, H4, H4, float32_sub)
 RVVCALL(OPFVF2, vfsub_vf_d, OP_UUU_D, H8, H8, float64_sub)
-GEN_VEXT_VF(vfsub_vf_h)
-GEN_VEXT_VF(vfsub_vf_w)
-GEN_VEXT_VF(vfsub_vf_d)
+GEN_VEXT_VF(vfsub_vf_h, 2)
+GEN_VEXT_VF(vfsub_vf_w, 4)
+GEN_VEXT_VF(vfsub_vf_d, 8)
=20
 static uint16_t float16_rsub(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3083,9 +3095,9 @@ static uint64_t float64_rsub(uint64_t a, uint64_t b=
, float_status *s)
 RVVCALL(OPFVF2, vfrsub_vf_h, OP_UUU_H, H2, H2, float16_rsub)
 RVVCALL(OPFVF2, vfrsub_vf_w, OP_UUU_W, H4, H4, float32_rsub)
 RVVCALL(OPFVF2, vfrsub_vf_d, OP_UUU_D, H8, H8, float64_rsub)
-GEN_VEXT_VF(vfrsub_vf_h)
-GEN_VEXT_VF(vfrsub_vf_w)
-GEN_VEXT_VF(vfrsub_vf_d)
+GEN_VEXT_VF(vfrsub_vf_h, 2)
+GEN_VEXT_VF(vfrsub_vf_w, 4)
+GEN_VEXT_VF(vfrsub_vf_d, 8)
=20
 /* Vector Widening Floating-Point Add/Subtract Instructions */
 static uint32_t vfwadd16(uint16_t a, uint16_t b, float_status *s)
@@ -3103,12 +3115,12 @@ static uint64_t vfwadd32(uint32_t a, uint32_t b, =
float_status *s)
=20
 RVVCALL(OPFVV2, vfwadd_vv_h, WOP_UUU_H, H4, H2, H2, vfwadd16)
 RVVCALL(OPFVV2, vfwadd_vv_w, WOP_UUU_W, H8, H4, H4, vfwadd32)
-GEN_VEXT_VV_ENV(vfwadd_vv_h)
-GEN_VEXT_VV_ENV(vfwadd_vv_w)
+GEN_VEXT_VV_ENV(vfwadd_vv_h, 4)
+GEN_VEXT_VV_ENV(vfwadd_vv_w, 8)
 RVVCALL(OPFVF2, vfwadd_vf_h, WOP_UUU_H, H4, H2, vfwadd16)
 RVVCALL(OPFVF2, vfwadd_vf_w, WOP_UUU_W, H8, H4, vfwadd32)
-GEN_VEXT_VF(vfwadd_vf_h)
-GEN_VEXT_VF(vfwadd_vf_w)
+GEN_VEXT_VF(vfwadd_vf_h, 4)
+GEN_VEXT_VF(vfwadd_vf_w, 8)
=20
 static uint32_t vfwsub16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3125,12 +3137,12 @@ static uint64_t vfwsub32(uint32_t a, uint32_t b, =
float_status *s)
=20
 RVVCALL(OPFVV2, vfwsub_vv_h, WOP_UUU_H, H4, H2, H2, vfwsub16)
 RVVCALL(OPFVV2, vfwsub_vv_w, WOP_UUU_W, H8, H4, H4, vfwsub32)
-GEN_VEXT_VV_ENV(vfwsub_vv_h)
-GEN_VEXT_VV_ENV(vfwsub_vv_w)
+GEN_VEXT_VV_ENV(vfwsub_vv_h, 4)
+GEN_VEXT_VV_ENV(vfwsub_vv_w, 8)
 RVVCALL(OPFVF2, vfwsub_vf_h, WOP_UUU_H, H4, H2, vfwsub16)
 RVVCALL(OPFVF2, vfwsub_vf_w, WOP_UUU_W, H8, H4, vfwsub32)
-GEN_VEXT_VF(vfwsub_vf_h)
-GEN_VEXT_VF(vfwsub_vf_w)
+GEN_VEXT_VF(vfwsub_vf_h, 4)
+GEN_VEXT_VF(vfwsub_vf_w, 8)
=20
 static uint32_t vfwaddw16(uint32_t a, uint16_t b, float_status *s)
 {
@@ -3144,12 +3156,12 @@ static uint64_t vfwaddw32(uint64_t a, uint32_t b,=
 float_status *s)
=20
 RVVCALL(OPFVV2, vfwadd_wv_h, WOP_WUUU_H, H4, H2, H2, vfwaddw16)
 RVVCALL(OPFVV2, vfwadd_wv_w, WOP_WUUU_W, H8, H4, H4, vfwaddw32)
-GEN_VEXT_VV_ENV(vfwadd_wv_h)
-GEN_VEXT_VV_ENV(vfwadd_wv_w)
+GEN_VEXT_VV_ENV(vfwadd_wv_h, 4)
+GEN_VEXT_VV_ENV(vfwadd_wv_w, 8)
 RVVCALL(OPFVF2, vfwadd_wf_h, WOP_WUUU_H, H4, H2, vfwaddw16)
 RVVCALL(OPFVF2, vfwadd_wf_w, WOP_WUUU_W, H8, H4, vfwaddw32)
-GEN_VEXT_VF(vfwadd_wf_h)
-GEN_VEXT_VF(vfwadd_wf_w)
+GEN_VEXT_VF(vfwadd_wf_h, 4)
+GEN_VEXT_VF(vfwadd_wf_w, 8)
=20
 static uint32_t vfwsubw16(uint32_t a, uint16_t b, float_status *s)
 {
@@ -3163,39 +3175,39 @@ static uint64_t vfwsubw32(uint64_t a, uint32_t b,=
 float_status *s)
=20
 RVVCALL(OPFVV2, vfwsub_wv_h, WOP_WUUU_H, H4, H2, H2, vfwsubw16)
 RVVCALL(OPFVV2, vfwsub_wv_w, WOP_WUUU_W, H8, H4, H4, vfwsubw32)
-GEN_VEXT_VV_ENV(vfwsub_wv_h)
-GEN_VEXT_VV_ENV(vfwsub_wv_w)
+GEN_VEXT_VV_ENV(vfwsub_wv_h, 4)
+GEN_VEXT_VV_ENV(vfwsub_wv_w, 8)
 RVVCALL(OPFVF2, vfwsub_wf_h, WOP_WUUU_H, H4, H2, vfwsubw16)
 RVVCALL(OPFVF2, vfwsub_wf_w, WOP_WUUU_W, H8, H4, vfwsubw32)
-GEN_VEXT_VF(vfwsub_wf_h)
-GEN_VEXT_VF(vfwsub_wf_w)
+GEN_VEXT_VF(vfwsub_wf_h, 4)
+GEN_VEXT_VF(vfwsub_wf_w, 8)
=20
 /* Vector Single-Width Floating-Point Multiply/Divide Instructions */
 RVVCALL(OPFVV2, vfmul_vv_h, OP_UUU_H, H2, H2, H2, float16_mul)
 RVVCALL(OPFVV2, vfmul_vv_w, OP_UUU_W, H4, H4, H4, float32_mul)
 RVVCALL(OPFVV2, vfmul_vv_d, OP_UUU_D, H8, H8, H8, float64_mul)
-GEN_VEXT_VV_ENV(vfmul_vv_h)
-GEN_VEXT_VV_ENV(vfmul_vv_w)
-GEN_VEXT_VV_ENV(vfmul_vv_d)
+GEN_VEXT_VV_ENV(vfmul_vv_h, 2)
+GEN_VEXT_VV_ENV(vfmul_vv_w, 4)
+GEN_VEXT_VV_ENV(vfmul_vv_d, 8)
 RVVCALL(OPFVF2, vfmul_vf_h, OP_UUU_H, H2, H2, float16_mul)
 RVVCALL(OPFVF2, vfmul_vf_w, OP_UUU_W, H4, H4, float32_mul)
 RVVCALL(OPFVF2, vfmul_vf_d, OP_UUU_D, H8, H8, float64_mul)
-GEN_VEXT_VF(vfmul_vf_h)
-GEN_VEXT_VF(vfmul_vf_w)
-GEN_VEXT_VF(vfmul_vf_d)
+GEN_VEXT_VF(vfmul_vf_h, 2)
+GEN_VEXT_VF(vfmul_vf_w, 4)
+GEN_VEXT_VF(vfmul_vf_d, 8)
=20
 RVVCALL(OPFVV2, vfdiv_vv_h, OP_UUU_H, H2, H2, H2, float16_div)
 RVVCALL(OPFVV2, vfdiv_vv_w, OP_UUU_W, H4, H4, H4, float32_div)
 RVVCALL(OPFVV2, vfdiv_vv_d, OP_UUU_D, H8, H8, H8, float64_div)
-GEN_VEXT_VV_ENV(vfdiv_vv_h)
-GEN_VEXT_VV_ENV(vfdiv_vv_w)
-GEN_VEXT_VV_ENV(vfdiv_vv_d)
+GEN_VEXT_VV_ENV(vfdiv_vv_h, 2)
+GEN_VEXT_VV_ENV(vfdiv_vv_w, 4)
+GEN_VEXT_VV_ENV(vfdiv_vv_d, 8)
 RVVCALL(OPFVF2, vfdiv_vf_h, OP_UUU_H, H2, H2, float16_div)
 RVVCALL(OPFVF2, vfdiv_vf_w, OP_UUU_W, H4, H4, float32_div)
 RVVCALL(OPFVF2, vfdiv_vf_d, OP_UUU_D, H8, H8, float64_div)
-GEN_VEXT_VF(vfdiv_vf_h)
-GEN_VEXT_VF(vfdiv_vf_w)
-GEN_VEXT_VF(vfdiv_vf_d)
+GEN_VEXT_VF(vfdiv_vf_h, 2)
+GEN_VEXT_VF(vfdiv_vf_w, 4)
+GEN_VEXT_VF(vfdiv_vf_d, 8)
=20
 static uint16_t float16_rdiv(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3215,9 +3227,9 @@ static uint64_t float64_rdiv(uint64_t a, uint64_t b=
, float_status *s)
 RVVCALL(OPFVF2, vfrdiv_vf_h, OP_UUU_H, H2, H2, float16_rdiv)
 RVVCALL(OPFVF2, vfrdiv_vf_w, OP_UUU_W, H4, H4, float32_rdiv)
 RVVCALL(OPFVF2, vfrdiv_vf_d, OP_UUU_D, H8, H8, float64_rdiv)
-GEN_VEXT_VF(vfrdiv_vf_h)
-GEN_VEXT_VF(vfrdiv_vf_w)
-GEN_VEXT_VF(vfrdiv_vf_d)
+GEN_VEXT_VF(vfrdiv_vf_h, 2)
+GEN_VEXT_VF(vfrdiv_vf_w, 4)
+GEN_VEXT_VF(vfrdiv_vf_d, 8)
=20
 /* Vector Widening Floating-Point Multiply */
 static uint32_t vfwmul16(uint16_t a, uint16_t b, float_status *s)
@@ -3234,12 +3246,12 @@ static uint64_t vfwmul32(uint32_t a, uint32_t b, =
float_status *s)
 }
 RVVCALL(OPFVV2, vfwmul_vv_h, WOP_UUU_H, H4, H2, H2, vfwmul16)
 RVVCALL(OPFVV2, vfwmul_vv_w, WOP_UUU_W, H8, H4, H4, vfwmul32)
-GEN_VEXT_VV_ENV(vfwmul_vv_h)
-GEN_VEXT_VV_ENV(vfwmul_vv_w)
+GEN_VEXT_VV_ENV(vfwmul_vv_h, 4)
+GEN_VEXT_VV_ENV(vfwmul_vv_w, 8)
 RVVCALL(OPFVF2, vfwmul_vf_h, WOP_UUU_H, H4, H2, vfwmul16)
 RVVCALL(OPFVF2, vfwmul_vf_w, WOP_UUU_W, H8, H4, vfwmul32)
-GEN_VEXT_VF(vfwmul_vf_h)
-GEN_VEXT_VF(vfwmul_vf_w)
+GEN_VEXT_VF(vfwmul_vf_h, 4)
+GEN_VEXT_VF(vfwmul_vf_w, 8)
=20
 /* Vector Single-Width Floating-Point Fused Multiply-Add Instructions */
 #define OPFVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)       \
@@ -3270,9 +3282,9 @@ static uint64_t fmacc64(uint64_t a, uint64_t b, uin=
t64_t d, float_status *s)
 RVVCALL(OPFVV3, vfmacc_vv_h, OP_UUU_H, H2, H2, H2, fmacc16)
 RVVCALL(OPFVV3, vfmacc_vv_w, OP_UUU_W, H4, H4, H4, fmacc32)
 RVVCALL(OPFVV3, vfmacc_vv_d, OP_UUU_D, H8, H8, H8, fmacc64)
-GEN_VEXT_VV_ENV(vfmacc_vv_h)
-GEN_VEXT_VV_ENV(vfmacc_vv_w)
-GEN_VEXT_VV_ENV(vfmacc_vv_d)
+GEN_VEXT_VV_ENV(vfmacc_vv_h, 2)
+GEN_VEXT_VV_ENV(vfmacc_vv_w, 4)
+GEN_VEXT_VV_ENV(vfmacc_vv_d, 8)
=20
 #define OPFVF3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)           \
 static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i,    \
@@ -3286,9 +3298,9 @@ static void do_##NAME(void *vd, uint64_t s1, void *=
vs2, int i,    \
 RVVCALL(OPFVF3, vfmacc_vf_h, OP_UUU_H, H2, H2, fmacc16)
 RVVCALL(OPFVF3, vfmacc_vf_w, OP_UUU_W, H4, H4, fmacc32)
 RVVCALL(OPFVF3, vfmacc_vf_d, OP_UUU_D, H8, H8, fmacc64)
-GEN_VEXT_VF(vfmacc_vf_h)
-GEN_VEXT_VF(vfmacc_vf_w)
-GEN_VEXT_VF(vfmacc_vf_d)
+GEN_VEXT_VF(vfmacc_vf_h, 2)
+GEN_VEXT_VF(vfmacc_vf_w, 4)
+GEN_VEXT_VF(vfmacc_vf_d, 8)
=20
 static uint16_t fnmacc16(uint16_t a, uint16_t b, uint16_t d, float_statu=
s *s)
 {
@@ -3311,15 +3323,15 @@ static uint64_t fnmacc64(uint64_t a, uint64_t b, =
uint64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmacc_vv_h, OP_UUU_H, H2, H2, H2, fnmacc16)
 RVVCALL(OPFVV3, vfnmacc_vv_w, OP_UUU_W, H4, H4, H4, fnmacc32)
 RVVCALL(OPFVV3, vfnmacc_vv_d, OP_UUU_D, H8, H8, H8, fnmacc64)
-GEN_VEXT_VV_ENV(vfnmacc_vv_h)
-GEN_VEXT_VV_ENV(vfnmacc_vv_w)
-GEN_VEXT_VV_ENV(vfnmacc_vv_d)
+GEN_VEXT_VV_ENV(vfnmacc_vv_h, 2)
+GEN_VEXT_VV_ENV(vfnmacc_vv_w, 4)
+GEN_VEXT_VV_ENV(vfnmacc_vv_d, 8)
 RVVCALL(OPFVF3, vfnmacc_vf_h, OP_UUU_H, H2, H2, fnmacc16)
 RVVCALL(OPFVF3, vfnmacc_vf_w, OP_UUU_W, H4, H4, fnmacc32)
 RVVCALL(OPFVF3, vfnmacc_vf_d, OP_UUU_D, H8, H8, fnmacc64)
-GEN_VEXT_VF(vfnmacc_vf_h)
-GEN_VEXT_VF(vfnmacc_vf_w)
-GEN_VEXT_VF(vfnmacc_vf_d)
+GEN_VEXT_VF(vfnmacc_vf_h, 2)
+GEN_VEXT_VF(vfnmacc_vf_w, 4)
+GEN_VEXT_VF(vfnmacc_vf_d, 8)
=20
 static uint16_t fmsac16(uint16_t a, uint16_t b, uint16_t d, float_status=
 *s)
 {
@@ -3339,15 +3351,15 @@ static uint64_t fmsac64(uint64_t a, uint64_t b, u=
int64_t d, float_status *s)
 RVVCALL(OPFVV3, vfmsac_vv_h, OP_UUU_H, H2, H2, H2, fmsac16)
 RVVCALL(OPFVV3, vfmsac_vv_w, OP_UUU_W, H4, H4, H4, fmsac32)
 RVVCALL(OPFVV3, vfmsac_vv_d, OP_UUU_D, H8, H8, H8, fmsac64)
-GEN_VEXT_VV_ENV(vfmsac_vv_h)
-GEN_VEXT_VV_ENV(vfmsac_vv_w)
-GEN_VEXT_VV_ENV(vfmsac_vv_d)
+GEN_VEXT_VV_ENV(vfmsac_vv_h, 2)
+GEN_VEXT_VV_ENV(vfmsac_vv_w, 4)
+GEN_VEXT_VV_ENV(vfmsac_vv_d, 8)
 RVVCALL(OPFVF3, vfmsac_vf_h, OP_UUU_H, H2, H2, fmsac16)
 RVVCALL(OPFVF3, vfmsac_vf_w, OP_UUU_W, H4, H4, fmsac32)
 RVVCALL(OPFVF3, vfmsac_vf_d, OP_UUU_D, H8, H8, fmsac64)
-GEN_VEXT_VF(vfmsac_vf_h)
-GEN_VEXT_VF(vfmsac_vf_w)
-GEN_VEXT_VF(vfmsac_vf_d)
+GEN_VEXT_VF(vfmsac_vf_h, 2)
+GEN_VEXT_VF(vfmsac_vf_w, 4)
+GEN_VEXT_VF(vfmsac_vf_d, 8)
=20
 static uint16_t fnmsac16(uint16_t a, uint16_t b, uint16_t d, float_statu=
s *s)
 {
@@ -3367,15 +3379,15 @@ static uint64_t fnmsac64(uint64_t a, uint64_t b, =
uint64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmsac_vv_h, OP_UUU_H, H2, H2, H2, fnmsac16)
 RVVCALL(OPFVV3, vfnmsac_vv_w, OP_UUU_W, H4, H4, H4, fnmsac32)
 RVVCALL(OPFVV3, vfnmsac_vv_d, OP_UUU_D, H8, H8, H8, fnmsac64)
-GEN_VEXT_VV_ENV(vfnmsac_vv_h)
-GEN_VEXT_VV_ENV(vfnmsac_vv_w)
-GEN_VEXT_VV_ENV(vfnmsac_vv_d)
+GEN_VEXT_VV_ENV(vfnmsac_vv_h, 2)
+GEN_VEXT_VV_ENV(vfnmsac_vv_w, 4)
+GEN_VEXT_VV_ENV(vfnmsac_vv_d, 8)
 RVVCALL(OPFVF3, vfnmsac_vf_h, OP_UUU_H, H2, H2, fnmsac16)
 RVVCALL(OPFVF3, vfnmsac_vf_w, OP_UUU_W, H4, H4, fnmsac32)
 RVVCALL(OPFVF3, vfnmsac_vf_d, OP_UUU_D, H8, H8, fnmsac64)
-GEN_VEXT_VF(vfnmsac_vf_h)
-GEN_VEXT_VF(vfnmsac_vf_w)
-GEN_VEXT_VF(vfnmsac_vf_d)
+GEN_VEXT_VF(vfnmsac_vf_h, 2)
+GEN_VEXT_VF(vfnmsac_vf_w, 4)
+GEN_VEXT_VF(vfnmsac_vf_d, 8)
=20
 static uint16_t fmadd16(uint16_t a, uint16_t b, uint16_t d, float_status=
 *s)
 {
@@ -3395,15 +3407,15 @@ static uint64_t fmadd64(uint64_t a, uint64_t b, u=
int64_t d, float_status *s)
 RVVCALL(OPFVV3, vfmadd_vv_h, OP_UUU_H, H2, H2, H2, fmadd16)
 RVVCALL(OPFVV3, vfmadd_vv_w, OP_UUU_W, H4, H4, H4, fmadd32)
 RVVCALL(OPFVV3, vfmadd_vv_d, OP_UUU_D, H8, H8, H8, fmadd64)
-GEN_VEXT_VV_ENV(vfmadd_vv_h)
-GEN_VEXT_VV_ENV(vfmadd_vv_w)
-GEN_VEXT_VV_ENV(vfmadd_vv_d)
+GEN_VEXT_VV_ENV(vfmadd_vv_h, 2)
+GEN_VEXT_VV_ENV(vfmadd_vv_w, 4)
+GEN_VEXT_VV_ENV(vfmadd_vv_d, 8)
 RVVCALL(OPFVF3, vfmadd_vf_h, OP_UUU_H, H2, H2, fmadd16)
 RVVCALL(OPFVF3, vfmadd_vf_w, OP_UUU_W, H4, H4, fmadd32)
 RVVCALL(OPFVF3, vfmadd_vf_d, OP_UUU_D, H8, H8, fmadd64)
-GEN_VEXT_VF(vfmadd_vf_h)
-GEN_VEXT_VF(vfmadd_vf_w)
-GEN_VEXT_VF(vfmadd_vf_d)
+GEN_VEXT_VF(vfmadd_vf_h, 2)
+GEN_VEXT_VF(vfmadd_vf_w, 4)
+GEN_VEXT_VF(vfmadd_vf_d, 8)
=20
 static uint16_t fnmadd16(uint16_t a, uint16_t b, uint16_t d, float_statu=
s *s)
 {
@@ -3426,15 +3438,15 @@ static uint64_t fnmadd64(uint64_t a, uint64_t b, =
uint64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmadd_vv_h, OP_UUU_H, H2, H2, H2, fnmadd16)
 RVVCALL(OPFVV3, vfnmadd_vv_w, OP_UUU_W, H4, H4, H4, fnmadd32)
 RVVCALL(OPFVV3, vfnmadd_vv_d, OP_UUU_D, H8, H8, H8, fnmadd64)
-GEN_VEXT_VV_ENV(vfnmadd_vv_h)
-GEN_VEXT_VV_ENV(vfnmadd_vv_w)
-GEN_VEXT_VV_ENV(vfnmadd_vv_d)
+GEN_VEXT_VV_ENV(vfnmadd_vv_h, 2)
+GEN_VEXT_VV_ENV(vfnmadd_vv_w, 4)
+GEN_VEXT_VV_ENV(vfnmadd_vv_d, 8)
 RVVCALL(OPFVF3, vfnmadd_vf_h, OP_UUU_H, H2, H2, fnmadd16)
 RVVCALL(OPFVF3, vfnmadd_vf_w, OP_UUU_W, H4, H4, fnmadd32)
 RVVCALL(OPFVF3, vfnmadd_vf_d, OP_UUU_D, H8, H8, fnmadd64)
-GEN_VEXT_VF(vfnmadd_vf_h)
-GEN_VEXT_VF(vfnmadd_vf_w)
-GEN_VEXT_VF(vfnmadd_vf_d)
+GEN_VEXT_VF(vfnmadd_vf_h, 2)
+GEN_VEXT_VF(vfnmadd_vf_w, 4)
+GEN_VEXT_VF(vfnmadd_vf_d, 8)
=20
 static uint16_t fmsub16(uint16_t a, uint16_t b, uint16_t d, float_status=
 *s)
 {
@@ -3454,15 +3466,15 @@ static uint64_t fmsub64(uint64_t a, uint64_t b, u=
int64_t d, float_status *s)
 RVVCALL(OPFVV3, vfmsub_vv_h, OP_UUU_H, H2, H2, H2, fmsub16)
 RVVCALL(OPFVV3, vfmsub_vv_w, OP_UUU_W, H4, H4, H4, fmsub32)
 RVVCALL(OPFVV3, vfmsub_vv_d, OP_UUU_D, H8, H8, H8, fmsub64)
-GEN_VEXT_VV_ENV(vfmsub_vv_h)
-GEN_VEXT_VV_ENV(vfmsub_vv_w)
-GEN_VEXT_VV_ENV(vfmsub_vv_d)
+GEN_VEXT_VV_ENV(vfmsub_vv_h, 2)
+GEN_VEXT_VV_ENV(vfmsub_vv_w, 4)
+GEN_VEXT_VV_ENV(vfmsub_vv_d, 8)
 RVVCALL(OPFVF3, vfmsub_vf_h, OP_UUU_H, H2, H2, fmsub16)
 RVVCALL(OPFVF3, vfmsub_vf_w, OP_UUU_W, H4, H4, fmsub32)
 RVVCALL(OPFVF3, vfmsub_vf_d, OP_UUU_D, H8, H8, fmsub64)
-GEN_VEXT_VF(vfmsub_vf_h)
-GEN_VEXT_VF(vfmsub_vf_w)
-GEN_VEXT_VF(vfmsub_vf_d)
+GEN_VEXT_VF(vfmsub_vf_h, 2)
+GEN_VEXT_VF(vfmsub_vf_w, 4)
+GEN_VEXT_VF(vfmsub_vf_d, 8)
=20
 static uint16_t fnmsub16(uint16_t a, uint16_t b, uint16_t d, float_statu=
s *s)
 {
@@ -3482,15 +3494,15 @@ static uint64_t fnmsub64(uint64_t a, uint64_t b, =
uint64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmsub_vv_h, OP_UUU_H, H2, H2, H2, fnmsub16)
 RVVCALL(OPFVV3, vfnmsub_vv_w, OP_UUU_W, H4, H4, H4, fnmsub32)
 RVVCALL(OPFVV3, vfnmsub_vv_d, OP_UUU_D, H8, H8, H8, fnmsub64)
-GEN_VEXT_VV_ENV(vfnmsub_vv_h)
-GEN_VEXT_VV_ENV(vfnmsub_vv_w)
-GEN_VEXT_VV_ENV(vfnmsub_vv_d)
+GEN_VEXT_VV_ENV(vfnmsub_vv_h, 2)
+GEN_VEXT_VV_ENV(vfnmsub_vv_w, 4)
+GEN_VEXT_VV_ENV(vfnmsub_vv_d, 8)
 RVVCALL(OPFVF3, vfnmsub_vf_h, OP_UUU_H, H2, H2, fnmsub16)
 RVVCALL(OPFVF3, vfnmsub_vf_w, OP_UUU_W, H4, H4, fnmsub32)
 RVVCALL(OPFVF3, vfnmsub_vf_d, OP_UUU_D, H8, H8, fnmsub64)
-GEN_VEXT_VF(vfnmsub_vf_h)
-GEN_VEXT_VF(vfnmsub_vf_w)
-GEN_VEXT_VF(vfnmsub_vf_d)
+GEN_VEXT_VF(vfnmsub_vf_h, 2)
+GEN_VEXT_VF(vfnmsub_vf_w, 4)
+GEN_VEXT_VF(vfnmsub_vf_d, 8)
=20
 /* Vector Widening Floating-Point Fused Multiply-Add Instructions */
 static uint32_t fwmacc16(uint16_t a, uint16_t b, uint32_t d, float_statu=
s *s)
@@ -3507,12 +3519,12 @@ static uint64_t fwmacc32(uint32_t a, uint32_t b, =
uint64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwmacc16)
 RVVCALL(OPFVV3, vfwmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwmacc32)
-GEN_VEXT_VV_ENV(vfwmacc_vv_h)
-GEN_VEXT_VV_ENV(vfwmacc_vv_w)
+GEN_VEXT_VV_ENV(vfwmacc_vv_h, 4)
+GEN_VEXT_VV_ENV(vfwmacc_vv_w, 8)
 RVVCALL(OPFVF3, vfwmacc_vf_h, WOP_UUU_H, H4, H2, fwmacc16)
 RVVCALL(OPFVF3, vfwmacc_vf_w, WOP_UUU_W, H8, H4, fwmacc32)
-GEN_VEXT_VF(vfwmacc_vf_h)
-GEN_VEXT_VF(vfwmacc_vf_w)
+GEN_VEXT_VF(vfwmacc_vf_h, 4)
+GEN_VEXT_VF(vfwmacc_vf_w, 8)
=20
 static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_stat=
us *s)
 {
@@ -3530,12 +3542,12 @@ static uint64_t fwnmacc32(uint32_t a, uint32_t b,=
 uint64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwnmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwnmacc16)
 RVVCALL(OPFVV3, vfwnmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwnmacc32)
-GEN_VEXT_VV_ENV(vfwnmacc_vv_h)
-GEN_VEXT_VV_ENV(vfwnmacc_vv_w)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_h, 4)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_w, 8)
 RVVCALL(OPFVF3, vfwnmacc_vf_h, WOP_UUU_H, H4, H2, fwnmacc16)
 RVVCALL(OPFVF3, vfwnmacc_vf_w, WOP_UUU_W, H8, H4, fwnmacc32)
-GEN_VEXT_VF(vfwnmacc_vf_h)
-GEN_VEXT_VF(vfwnmacc_vf_w)
+GEN_VEXT_VF(vfwnmacc_vf_h, 4)
+GEN_VEXT_VF(vfwnmacc_vf_w, 8)
=20
 static uint32_t fwmsac16(uint16_t a, uint16_t b, uint32_t d, float_statu=
s *s)
 {
@@ -3553,12 +3565,12 @@ static uint64_t fwmsac32(uint32_t a, uint32_t b, =
uint64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwmsac16)
 RVVCALL(OPFVV3, vfwmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwmsac32)
-GEN_VEXT_VV_ENV(vfwmsac_vv_h)
-GEN_VEXT_VV_ENV(vfwmsac_vv_w)
+GEN_VEXT_VV_ENV(vfwmsac_vv_h, 4)
+GEN_VEXT_VV_ENV(vfwmsac_vv_w, 8)
 RVVCALL(OPFVF3, vfwmsac_vf_h, WOP_UUU_H, H4, H2, fwmsac16)
 RVVCALL(OPFVF3, vfwmsac_vf_w, WOP_UUU_W, H8, H4, fwmsac32)
-GEN_VEXT_VF(vfwmsac_vf_h)
-GEN_VEXT_VF(vfwmsac_vf_w)
+GEN_VEXT_VF(vfwmsac_vf_h, 4)
+GEN_VEXT_VF(vfwmsac_vf_w, 8)
=20
 static uint32_t fwnmsac16(uint16_t a, uint16_t b, uint32_t d, float_stat=
us *s)
 {
@@ -3576,12 +3588,12 @@ static uint64_t fwnmsac32(uint32_t a, uint32_t b,=
 uint64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwnmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwnmsac16)
 RVVCALL(OPFVV3, vfwnmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwnmsac32)
-GEN_VEXT_VV_ENV(vfwnmsac_vv_h)
-GEN_VEXT_VV_ENV(vfwnmsac_vv_w)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_h, 4)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_w, 8)
 RVVCALL(OPFVF3, vfwnmsac_vf_h, WOP_UUU_H, H4, H2, fwnmsac16)
 RVVCALL(OPFVF3, vfwnmsac_vf_w, WOP_UUU_W, H8, H4, fwnmsac32)
-GEN_VEXT_VF(vfwnmsac_vf_h)
-GEN_VEXT_VF(vfwnmsac_vf_w)
+GEN_VEXT_VF(vfwnmsac_vf_h, 4)
+GEN_VEXT_VF(vfwnmsac_vf_w, 8)
=20
 /* Vector Floating-Point Square-Root Instruction */
 /* (TD, T2, TX2) */
@@ -3597,12 +3609,15 @@ static void do_##NAME(void *vd, void *vs2, int i,=
      \
     *((TD *)vd + HD(i)) =3D OP(s2, &env->fp_status);     \
 }
=20
-#define GEN_VEXT_V_ENV(NAME)                           \
+#define GEN_VEXT_V_ENV(NAME, ESZ)                      \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
         CPURISCVState *env, uint32_t desc)             \
 {                                                      \
     uint32_t vm =3D vext_vm(desc);                       \
     uint32_t vl =3D env->vl;                             \
+    uint32_t total_elems =3D                             \
+        vext_get_total_elems(env, desc, ESZ);          \
+    uint32_t vta =3D vext_vta(desc);                     \
     uint32_t i;                                        \
                                                        \
     if (vl =3D=3D 0) {                                     \
@@ -3615,14 +3630,16 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, =
      \
         do_##NAME(vd, vs2, i, env);                    \
     }                                                  \
     env->vstart =3D 0;                                   \
+    vext_set_elems_1s(vd, vta, vl * ESZ,               \
+                      total_elems * ESZ);              \
 }
=20
 RVVCALL(OPFVV1, vfsqrt_v_h, OP_UU_H, H2, H2, float16_sqrt)
 RVVCALL(OPFVV1, vfsqrt_v_w, OP_UU_W, H4, H4, float32_sqrt)
 RVVCALL(OPFVV1, vfsqrt_v_d, OP_UU_D, H8, H8, float64_sqrt)
-GEN_VEXT_V_ENV(vfsqrt_v_h)
-GEN_VEXT_V_ENV(vfsqrt_v_w)
-GEN_VEXT_V_ENV(vfsqrt_v_d)
+GEN_VEXT_V_ENV(vfsqrt_v_h, 2)
+GEN_VEXT_V_ENV(vfsqrt_v_w, 4)
+GEN_VEXT_V_ENV(vfsqrt_v_d, 8)
=20
 /*
  * Vector Floating-Point Reciprocal Square-Root Estimate Instruction
@@ -3802,9 +3819,9 @@ static float64 frsqrt7_d(float64 f, float_status *s=
)
 RVVCALL(OPFVV1, vfrsqrt7_v_h, OP_UU_H, H2, H2, frsqrt7_h)
 RVVCALL(OPFVV1, vfrsqrt7_v_w, OP_UU_W, H4, H4, frsqrt7_s)
 RVVCALL(OPFVV1, vfrsqrt7_v_d, OP_UU_D, H8, H8, frsqrt7_d)
-GEN_VEXT_V_ENV(vfrsqrt7_v_h)
-GEN_VEXT_V_ENV(vfrsqrt7_v_w)
-GEN_VEXT_V_ENV(vfrsqrt7_v_d)
+GEN_VEXT_V_ENV(vfrsqrt7_v_h, 2)
+GEN_VEXT_V_ENV(vfrsqrt7_v_w, 4)
+GEN_VEXT_V_ENV(vfrsqrt7_v_d, 8)
=20
 /*
  * Vector Floating-Point Reciprocal Estimate Instruction
@@ -3993,36 +4010,36 @@ static float64 frec7_d(float64 f, float_status *s=
)
 RVVCALL(OPFVV1, vfrec7_v_h, OP_UU_H, H2, H2, frec7_h)
 RVVCALL(OPFVV1, vfrec7_v_w, OP_UU_W, H4, H4, frec7_s)
 RVVCALL(OPFVV1, vfrec7_v_d, OP_UU_D, H8, H8, frec7_d)
-GEN_VEXT_V_ENV(vfrec7_v_h)
-GEN_VEXT_V_ENV(vfrec7_v_w)
-GEN_VEXT_V_ENV(vfrec7_v_d)
+GEN_VEXT_V_ENV(vfrec7_v_h, 2)
+GEN_VEXT_V_ENV(vfrec7_v_w, 4)
+GEN_VEXT_V_ENV(vfrec7_v_d, 8)
=20
 /* Vector Floating-Point MIN/MAX Instructions */
 RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number=
)
 RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number=
)
 RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minimum_number=
)
-GEN_VEXT_VV_ENV(vfmin_vv_h)
-GEN_VEXT_VV_ENV(vfmin_vv_w)
-GEN_VEXT_VV_ENV(vfmin_vv_d)
+GEN_VEXT_VV_ENV(vfmin_vv_h, 2)
+GEN_VEXT_VV_ENV(vfmin_vv_w, 4)
+GEN_VEXT_VV_ENV(vfmin_vv_d, 8)
 RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minimum_number)
 RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minimum_number)
 RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minimum_number)
-GEN_VEXT_VF(vfmin_vf_h)
-GEN_VEXT_VF(vfmin_vf_w)
-GEN_VEXT_VF(vfmin_vf_d)
+GEN_VEXT_VF(vfmin_vf_h, 2)
+GEN_VEXT_VF(vfmin_vf_w, 4)
+GEN_VEXT_VF(vfmin_vf_d, 8)
=20
 RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maximum_number=
)
 RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maximum_number=
)
 RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maximum_number=
)
-GEN_VEXT_VV_ENV(vfmax_vv_h)
-GEN_VEXT_VV_ENV(vfmax_vv_w)
-GEN_VEXT_VV_ENV(vfmax_vv_d)
+GEN_VEXT_VV_ENV(vfmax_vv_h, 2)
+GEN_VEXT_VV_ENV(vfmax_vv_w, 4)
+GEN_VEXT_VV_ENV(vfmax_vv_d, 8)
 RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maximum_number)
 RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maximum_number)
 RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maximum_number)
-GEN_VEXT_VF(vfmax_vf_h)
-GEN_VEXT_VF(vfmax_vf_w)
-GEN_VEXT_VF(vfmax_vf_d)
+GEN_VEXT_VF(vfmax_vf_h, 2)
+GEN_VEXT_VF(vfmax_vf_w, 4)
+GEN_VEXT_VF(vfmax_vf_d, 8)
=20
 /* Vector Floating-Point Sign-Injection Instructions */
 static uint16_t fsgnj16(uint16_t a, uint16_t b, float_status *s)
@@ -4043,15 +4060,15 @@ static uint64_t fsgnj64(uint64_t a, uint64_t b, f=
loat_status *s)
 RVVCALL(OPFVV2, vfsgnj_vv_h, OP_UUU_H, H2, H2, H2, fsgnj16)
 RVVCALL(OPFVV2, vfsgnj_vv_w, OP_UUU_W, H4, H4, H4, fsgnj32)
 RVVCALL(OPFVV2, vfsgnj_vv_d, OP_UUU_D, H8, H8, H8, fsgnj64)
-GEN_VEXT_VV_ENV(vfsgnj_vv_h)
-GEN_VEXT_VV_ENV(vfsgnj_vv_w)
-GEN_VEXT_VV_ENV(vfsgnj_vv_d)
+GEN_VEXT_VV_ENV(vfsgnj_vv_h, 2)
+GEN_VEXT_VV_ENV(vfsgnj_vv_w, 4)
+GEN_VEXT_VV_ENV(vfsgnj_vv_d, 8)
 RVVCALL(OPFVF2, vfsgnj_vf_h, OP_UUU_H, H2, H2, fsgnj16)
 RVVCALL(OPFVF2, vfsgnj_vf_w, OP_UUU_W, H4, H4, fsgnj32)
 RVVCALL(OPFVF2, vfsgnj_vf_d, OP_UUU_D, H8, H8, fsgnj64)
-GEN_VEXT_VF(vfsgnj_vf_h)
-GEN_VEXT_VF(vfsgnj_vf_w)
-GEN_VEXT_VF(vfsgnj_vf_d)
+GEN_VEXT_VF(vfsgnj_vf_h, 2)
+GEN_VEXT_VF(vfsgnj_vf_w, 4)
+GEN_VEXT_VF(vfsgnj_vf_d, 8)
=20
 static uint16_t fsgnjn16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -4071,15 +4088,15 @@ static uint64_t fsgnjn64(uint64_t a, uint64_t b, =
float_status *s)
 RVVCALL(OPFVV2, vfsgnjn_vv_h, OP_UUU_H, H2, H2, H2, fsgnjn16)
 RVVCALL(OPFVV2, vfsgnjn_vv_w, OP_UUU_W, H4, H4, H4, fsgnjn32)
 RVVCALL(OPFVV2, vfsgnjn_vv_d, OP_UUU_D, H8, H8, H8, fsgnjn64)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_h)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_w)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_d)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_h, 2)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_w, 4)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_d, 8)
 RVVCALL(OPFVF2, vfsgnjn_vf_h, OP_UUU_H, H2, H2, fsgnjn16)
 RVVCALL(OPFVF2, vfsgnjn_vf_w, OP_UUU_W, H4, H4, fsgnjn32)
 RVVCALL(OPFVF2, vfsgnjn_vf_d, OP_UUU_D, H8, H8, fsgnjn64)
-GEN_VEXT_VF(vfsgnjn_vf_h)
-GEN_VEXT_VF(vfsgnjn_vf_w)
-GEN_VEXT_VF(vfsgnjn_vf_d)
+GEN_VEXT_VF(vfsgnjn_vf_h, 2)
+GEN_VEXT_VF(vfsgnjn_vf_w, 4)
+GEN_VEXT_VF(vfsgnjn_vf_d, 8)
=20
 static uint16_t fsgnjx16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -4099,15 +4116,15 @@ static uint64_t fsgnjx64(uint64_t a, uint64_t b, =
float_status *s)
 RVVCALL(OPFVV2, vfsgnjx_vv_h, OP_UUU_H, H2, H2, H2, fsgnjx16)
 RVVCALL(OPFVV2, vfsgnjx_vv_w, OP_UUU_W, H4, H4, H4, fsgnjx32)
 RVVCALL(OPFVV2, vfsgnjx_vv_d, OP_UUU_D, H8, H8, H8, fsgnjx64)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_h)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_w)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_d)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_h, 2)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_w, 4)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_d, 8)
 RVVCALL(OPFVF2, vfsgnjx_vf_h, OP_UUU_H, H2, H2, fsgnjx16)
 RVVCALL(OPFVF2, vfsgnjx_vf_w, OP_UUU_W, H4, H4, fsgnjx32)
 RVVCALL(OPFVF2, vfsgnjx_vf_d, OP_UUU_D, H8, H8, fsgnjx64)
-GEN_VEXT_VF(vfsgnjx_vf_h)
-GEN_VEXT_VF(vfsgnjx_vf_w)
-GEN_VEXT_VF(vfsgnjx_vf_d)
+GEN_VEXT_VF(vfsgnjx_vf_h, 2)
+GEN_VEXT_VF(vfsgnjx_vf_w, 4)
+GEN_VEXT_VF(vfsgnjx_vf_d, 8)
=20
 /* Vector Floating-Point Compare Instructions */
 #define GEN_VEXT_CMP_VV_ENV(NAME, ETYPE, H, DO_OP)            \
@@ -4116,6 +4133,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;        \
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -4128,6 +4147,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, v=
oid *vs2,   \
                            DO_OP(s2, s1, &env->fp_status));   \
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
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -4140,6 +4166,8 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
void *vs2,       \
 {                                                                   \
     uint32_t vm =3D vext_vm(desc);                                    \
     uint32_t vl =3D env->vl;                                          \
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;              \
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                    \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D env->vstart; i < vl; i++) {                            \
@@ -4151,6 +4179,13 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,=
 void *vs2,       \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
     env->vstart =3D 0;                                                \
+    /* mask destination register are always tail-agnostic */        \
+    /* set tail elements to 1s */                                   \
+    if (vta_all_1s) {                                               \
+        for (; i < total_elems; i++) {                              \
+            vext_set_elem_mask(vd, i, 1);                           \
+        }                                                           \
+    }                                                               \
 }
=20
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
@@ -4251,12 +4286,15 @@ static void do_##NAME(void *vd, void *vs2, int i)=
      \
     *((TD *)vd + HD(i)) =3D OP(s2);                      \
 }
=20
-#define GEN_VEXT_V(NAME)                               \
+#define GEN_VEXT_V(NAME, ESZ)                          \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
                   CPURISCVState *env, uint32_t desc)   \
 {                                                      \
     uint32_t vm =3D vext_vm(desc);                       \
     uint32_t vl =3D env->vl;                             \
+    uint32_t total_elems =3D                             \
+        vext_get_total_elems(env, desc, ESZ);          \
+    uint32_t vta =3D vext_vta(desc);                     \
     uint32_t i;                                        \
                                                        \
     for (i =3D env->vstart; i < vl; i++) {               \
@@ -4266,6 +4304,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,   =
    \
         do_##NAME(vd, vs2, i);                         \
     }                                                  \
     env->vstart =3D 0;                                   \
+    /* set tail elements to 1s */                      \
+    vext_set_elems_1s(vd, vta, vl * ESZ,               \
+                      total_elems * ESZ);              \
 }
=20
 target_ulong fclass_h(uint64_t frs1)
@@ -4328,17 +4369,22 @@ target_ulong fclass_d(uint64_t frs1)
 RVVCALL(OPIVV1, vfclass_v_h, OP_UU_H, H2, H2, fclass_h)
 RVVCALL(OPIVV1, vfclass_v_w, OP_UU_W, H4, H4, fclass_s)
 RVVCALL(OPIVV1, vfclass_v_d, OP_UU_D, H8, H8, fclass_d)
-GEN_VEXT_V(vfclass_v_h)
-GEN_VEXT_V(vfclass_v_w)
-GEN_VEXT_V(vfclass_v_d)
+GEN_VEXT_V(vfclass_v_h, 2)
+GEN_VEXT_V(vfclass_v_w, 4)
+GEN_VEXT_V(vfclass_v_d, 8)
=20
 /* Vector Floating-Point Merge Instruction */
+
 #define GEN_VFMERGE_VF(NAME, ETYPE, H)                        \
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
+    uint32_t esz =3D sizeof(ETYPE);                             \
+    uint32_t total_elems =3D                                    \
+        vext_get_total_elems(env, desc, esz);                 \
+    uint32_t vta =3D vext_vta(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -4347,6 +4393,8 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
void *vs2, \
           =3D (!vm && !vext_elem_mask(v0, i) ? s2 : s1);        \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* set tail elements to 1s */                             \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);  \
 }
=20
 GEN_VFMERGE_VF(vfmerge_vfm_h, int16_t, H2)
@@ -4358,33 +4406,33 @@ GEN_VFMERGE_VF(vfmerge_vfm_d, int64_t, H8)
 RVVCALL(OPFVV1, vfcvt_xu_f_v_h, OP_UU_H, H2, H2, float16_to_uint16)
 RVVCALL(OPFVV1, vfcvt_xu_f_v_w, OP_UU_W, H4, H4, float32_to_uint32)
 RVVCALL(OPFVV1, vfcvt_xu_f_v_d, OP_UU_D, H8, H8, float64_to_uint64)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_h)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_w)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_d)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_h, 2)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_w, 4)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_d, 8)
=20
 /* vfcvt.x.f.v vd, vs2, vm # Convert float to signed integer. */
 RVVCALL(OPFVV1, vfcvt_x_f_v_h, OP_UU_H, H2, H2, float16_to_int16)
 RVVCALL(OPFVV1, vfcvt_x_f_v_w, OP_UU_W, H4, H4, float32_to_int32)
 RVVCALL(OPFVV1, vfcvt_x_f_v_d, OP_UU_D, H8, H8, float64_to_int64)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_h)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_w)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_d)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_h, 2)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_w, 4)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_d, 8)
=20
 /* vfcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to float. */
 RVVCALL(OPFVV1, vfcvt_f_xu_v_h, OP_UU_H, H2, H2, uint16_to_float16)
 RVVCALL(OPFVV1, vfcvt_f_xu_v_w, OP_UU_W, H4, H4, uint32_to_float32)
 RVVCALL(OPFVV1, vfcvt_f_xu_v_d, OP_UU_D, H8, H8, uint64_to_float64)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_h)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_w)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_d)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_h, 2)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_w, 4)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_d, 8)
=20
 /* vfcvt.f.x.v vd, vs2, vm # Convert integer to float. */
 RVVCALL(OPFVV1, vfcvt_f_x_v_h, OP_UU_H, H2, H2, int16_to_float16)
 RVVCALL(OPFVV1, vfcvt_f_x_v_w, OP_UU_W, H4, H4, int32_to_float32)
 RVVCALL(OPFVV1, vfcvt_f_x_v_d, OP_UU_D, H8, H8, int64_to_float64)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_h)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_w)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_d)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_h, 2)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_w, 4)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8)
=20
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
@@ -4394,30 +4442,30 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_d)
 /* vfwcvt.xu.f.v vd, vs2, vm # Convert float to double-width unsigned in=
teger.*/
 RVVCALL(OPFVV1, vfwcvt_xu_f_v_h, WOP_UU_H, H4, H2, float16_to_uint32)
 RVVCALL(OPFVV1, vfwcvt_xu_f_v_w, WOP_UU_W, H8, H4, float32_to_uint64)
-GEN_VEXT_V_ENV(vfwcvt_xu_f_v_h)
-GEN_VEXT_V_ENV(vfwcvt_xu_f_v_w)
+GEN_VEXT_V_ENV(vfwcvt_xu_f_v_h, 4)
+GEN_VEXT_V_ENV(vfwcvt_xu_f_v_w, 8)
=20
 /* vfwcvt.x.f.v vd, vs2, vm # Convert float to double-width signed integ=
er. */
 RVVCALL(OPFVV1, vfwcvt_x_f_v_h, WOP_UU_H, H4, H2, float16_to_int32)
 RVVCALL(OPFVV1, vfwcvt_x_f_v_w, WOP_UU_W, H8, H4, float32_to_int64)
-GEN_VEXT_V_ENV(vfwcvt_x_f_v_h)
-GEN_VEXT_V_ENV(vfwcvt_x_f_v_w)
+GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 4)
+GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, 8)
=20
 /* vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width =
float */
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_b, WOP_UU_B, H2, H1, uint8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_h, WOP_UU_H, H4, H2, uint16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_w, WOP_UU_W, H8, H4, uint32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_xu_v_b)
-GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h)
-GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_b, 2)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h, 4)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w, 8)
=20
 /* vfwcvt.f.x.v vd, vs2, vm # Convert integer to double-width float. */
 RVVCALL(OPFVV1, vfwcvt_f_x_v_b, WOP_UU_B, H2, H1, int8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_x_v_h, WOP_UU_H, H4, H2, int16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_x_v_w, WOP_UU_W, H8, H4, int32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_x_v_b)
-GEN_VEXT_V_ENV(vfwcvt_f_x_v_h)
-GEN_VEXT_V_ENV(vfwcvt_f_x_v_w)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_b, 2)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, 4)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, 8)
=20
 /*
  * vfwcvt.f.f.v vd, vs2, vm
@@ -4430,8 +4478,8 @@ static uint32_t vfwcvtffv16(uint16_t a, float_statu=
s *s)
=20
 RVVCALL(OPFVV1, vfwcvt_f_f_v_h, WOP_UU_H, H4, H2, vfwcvtffv16)
 RVVCALL(OPFVV1, vfwcvt_f_f_v_w, WOP_UU_W, H8, H4, float32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_f_v_h)
-GEN_VEXT_V_ENV(vfwcvt_f_f_v_w)
+GEN_VEXT_V_ENV(vfwcvt_f_f_v_h, 4)
+GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 8)
=20
 /* Narrowing Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
@@ -4442,29 +4490,29 @@ GEN_VEXT_V_ENV(vfwcvt_f_f_v_w)
 RVVCALL(OPFVV1, vfncvt_xu_f_w_b, NOP_UU_B, H1, H2, float16_to_uint8)
 RVVCALL(OPFVV1, vfncvt_xu_f_w_h, NOP_UU_H, H2, H4, float32_to_uint16)
 RVVCALL(OPFVV1, vfncvt_xu_f_w_w, NOP_UU_W, H4, H8, float64_to_uint32)
-GEN_VEXT_V_ENV(vfncvt_xu_f_w_b)
-GEN_VEXT_V_ENV(vfncvt_xu_f_w_h)
-GEN_VEXT_V_ENV(vfncvt_xu_f_w_w)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_b, 1)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_h, 2)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_w, 4)
=20
 /* vfncvt.x.f.v vd, vs2, vm # Convert double-width float to signed integ=
er. */
 RVVCALL(OPFVV1, vfncvt_x_f_w_b, NOP_UU_B, H1, H2, float16_to_int8)
 RVVCALL(OPFVV1, vfncvt_x_f_w_h, NOP_UU_H, H2, H4, float32_to_int16)
 RVVCALL(OPFVV1, vfncvt_x_f_w_w, NOP_UU_W, H4, H8, float64_to_int32)
-GEN_VEXT_V_ENV(vfncvt_x_f_w_b)
-GEN_VEXT_V_ENV(vfncvt_x_f_w_h)
-GEN_VEXT_V_ENV(vfncvt_x_f_w_w)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_b, 1)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_h, 2)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_w, 4)
=20
 /* vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to =
float */
 RVVCALL(OPFVV1, vfncvt_f_xu_w_h, NOP_UU_H, H2, H4, uint32_to_float16)
 RVVCALL(OPFVV1, vfncvt_f_xu_w_w, NOP_UU_W, H4, H8, uint64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_xu_w_h)
-GEN_VEXT_V_ENV(vfncvt_f_xu_w_w)
+GEN_VEXT_V_ENV(vfncvt_f_xu_w_h, 2)
+GEN_VEXT_V_ENV(vfncvt_f_xu_w_w, 4)
=20
 /* vfncvt.f.x.v vd, vs2, vm # Convert double-width integer to float. */
 RVVCALL(OPFVV1, vfncvt_f_x_w_h, NOP_UU_H, H2, H4, int32_to_float16)
 RVVCALL(OPFVV1, vfncvt_f_x_w_w, NOP_UU_W, H4, H8, int64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_x_w_h)
-GEN_VEXT_V_ENV(vfncvt_f_x_w_w)
+GEN_VEXT_V_ENV(vfncvt_f_x_w_h, 2)
+GEN_VEXT_V_ENV(vfncvt_f_x_w_w, 4)
=20
 /* vfncvt.f.f.v vd, vs2, vm # Convert double float to single-width float=
. */
 static uint16_t vfncvtffv16(uint32_t a, float_status *s)
@@ -4474,8 +4522,8 @@ static uint16_t vfncvtffv16(uint32_t a, float_statu=
s *s)
=20
 RVVCALL(OPFVV1, vfncvt_f_f_w_h, NOP_UU_H, H2, H4, vfncvtffv16)
 RVVCALL(OPFVV1, vfncvt_f_f_w_w, NOP_UU_W, H4, H8, float64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_f_w_h)
-GEN_VEXT_V_ENV(vfncvt_f_f_w_w)
+GEN_VEXT_V_ENV(vfncvt_f_f_w_h, 2)
+GEN_VEXT_V_ENV(vfncvt_f_f_w_w, 4)
=20
 /*
  *** Vector Reduction Operations
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index e75a2fd196..1add4cb655 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2338,6 +2338,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
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
@@ -2420,6 +2423,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)            \
         gen_set_rm(s, RISCV_FRM_DYN);                             \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);              \
+        data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S,                \
+                          s->cfg_vta_all_1s);                     \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
                            fns[s->sew - 1], s);                   \
     }                                                             \
@@ -2458,6 +2464,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
                                                                  \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
                            vreg_ofs(s, a->rs1),                  \
                            vreg_ofs(s, a->rs2), cpu_env,         \
@@ -2497,6 +2504,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
         gen_set_rm(s, RISCV_FRM_DYN);                            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
                            fns[s->sew - 1], s);                  \
     }                                                            \
@@ -2533,6 +2541,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -2572,6 +2581,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
         gen_set_rm(s, RISCV_FRM_DYN);                            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
                            fns[s->sew - 1], s);                  \
     }                                                            \
@@ -2655,6 +2665,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), cpu_env,
                            s->cfg_ptr->vlen / 8,
@@ -2859,6 +2870,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -2910,6 +2922,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -2977,6 +2991,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -3030,6 +3045,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
--=20
2.36.1



