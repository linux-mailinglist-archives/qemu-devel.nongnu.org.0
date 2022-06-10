Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD13545B40
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:44:40 +0200 (CEST)
Received: from localhost ([::1]:52054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWVj-00069T-Qw
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGG-0003oq-Hm
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:41 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:5606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGC-00017r-Sp
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835316; x=1686371316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KGqLBWtYi/5R7GJrD5boiBqssV/KlgmjpMwgzCPKT+w=;
 b=n3eSZdW32I6bf8CQmX7R18BPo12qvNRcX5CBabbSIozqAEiwWe+dFacf
 HjUw/XVO4y7r4tQA4IMKMOZmLexfk08N5pb6AnTnob+m3j65p0Sb2V8ev
 OjrPIU/CyakKxJWDVUXByvMDO4PXAlCYAFAEk862FKW31Q0VAGYKvFgGA
 ppOA4MLyHwLDYsFVkTGNGYllixi/Gc58a3hvzIla7fcX8p8Yt9E69zqxe
 /1xeKCv71iRBQqJMFsnP5K829rsjf/IAZHLV6nIBrwCdm09kP6v50ZNyf
 +RbD8UNF3la4P0vLQkvJJJAPq3ZlkORyv+oQd4CuSpCAfGCUNHXslBFaq Q==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="201489056"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:35 +0800
IronPort-SDR: yfd0j1GAv5F26VziaTJReOdKmxoyqgbpo6fu/NMwAh9+Yc1kFVWebvvaFXcmcCBvUEGNSx4iKm
 jcBllGJiFZZ03a4HADG5+VJiLKsc/kATcZekT1yB4mTITjzEAvn8HmMyEeNQW6wGdsP9O8juh7
 i2dPcJqdutoMZ5j43HpeGOq659v9MM7iFNpbaQTvYyld3FrrcSIk00tOyeqGrO2dmq+t5kapa7
 tG3VCyBnGj9UK2bWe7gRR2w+TJkJ06bOqOejnszHERe44To86DnH5S+84VEy4IM720TD2OWRNh
 c2FOEaCFPan0f9njvQcefWQM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:43 -0700
IronPort-SDR: VCGqGMnHdo9pSMT4z08Ru59LLgwxTW6wrRraE7VznQwo5EjooV+g7Jeymlh6fH4sa7ke2m6SNc
 KboMB0U+JwD+/4qqu9Qoo5yqFjhjamPtn2m/XgUgRC+/igZs9V9ZLMtMeg+l8nJ4UIjVrun0qq
 Qq78to6M/m+h8BtQRabsktToVUnSdKqfoWDNTUerP+KFkzeGuV6zv+oLJPJZ9+tpfeebXCP96q
 83Q6wJYlsT+WywwRxpyaecRZGtnFPELGvb64kc4UCOGMdwCpZ/l92s4kitqWLeJcOLCszqx6Ym
 3gg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:35 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7J24Vmdz1SVp4
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:34 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835313; x=1657427314; bh=KGqLBWtYi/5R7GJrD5
 boiBqssV/KlgmjpMwgzCPKT+w=; b=DEawtkrOaMEcZ/oSlHfrMjEBI7DhZZT30H
 N5U3b4qVtT4zPuXrqxQobLUQKHS1AEg1S8cBTYwvVqWI6Lsikv4tpH5m4uA4gsro
 aUdPKeTHdIxU84q4b/3ozW0kwKvExHyxvZ9KIiwDe6NRattNeWB8ESHk5X/3dsDr
 ozEFXYaIYxA/+CAresB/xJ+xEk0LGPkNFaCxSlIuhu4QZvyNiiBpkFeYcvqzdUcz
 lVBfRLQP9kQqJxxjX+mVfRjWDyBogOkDhwF5NWae6MIwC0wQZh+UkWdl3bAKlJpa
 fgAPmZg6d7b6NLsUkWCFh13+FAtrMaSSHNKOVjGC/LSaE9mfK9Pg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id JoaadJSciUJa for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:33 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7Hw3DTpz1SVp2;
 Thu,  9 Jun 2022 21:28:28 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/25] target/riscv: rvv: Add tail agnostic for vector
 fix-point arithmetic instructions
Date: Fri, 10 Jun 2022 14:26:48 +1000
Message-Id: <20220610042655.2021686-19-alistair.francis@opensource.wdc.com>
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

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-11@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 220 ++++++++++++++++++-----------------
 1 file changed, 114 insertions(+), 106 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 128238786e..1fa93cf1f0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2103,10 +2103,12 @@ static inline void
 vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
              CPURISCVState *env,
              uint32_t desc,
-             opivv2_rm_fn *fn)
+             opivv2_rm_fn *fn, uint32_t esz)
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
=20
     switch (env->vxrm) {
     case 0: /* rnu */
@@ -2126,15 +2128,17 @@ vext_vv_rm_2(void *vd, void *v0, void *vs1, void =
*vs2,
                      env, vl, vm, 3, fn);
         break;
     }
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
 }
=20
 /* generate helpers for fixed point instructions with OPIVV format */
-#define GEN_VEXT_VV_RM(NAME)                                    \
+#define GEN_VEXT_VV_RM(NAME, ESZ)                               \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,     \
                   CPURISCVState *env, uint32_t desc)            \
 {                                                               \
     vext_vv_rm_2(vd, v0, vs1, vs2, env, desc,                   \
-                 do_##NAME);                                    \
+                 do_##NAME, ESZ);                               \
 }
=20
 static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, ui=
nt8_t b)
@@ -2184,10 +2188,10 @@ RVVCALL(OPIVV2_RM, vsaddu_vv_b, OP_UUU_B, H1, H1,=
 H1, saddu8)
 RVVCALL(OPIVV2_RM, vsaddu_vv_h, OP_UUU_H, H2, H2, H2, saddu16)
 RVVCALL(OPIVV2_RM, vsaddu_vv_w, OP_UUU_W, H4, H4, H4, saddu32)
 RVVCALL(OPIVV2_RM, vsaddu_vv_d, OP_UUU_D, H8, H8, H8, saddu64)
-GEN_VEXT_VV_RM(vsaddu_vv_b)
-GEN_VEXT_VV_RM(vsaddu_vv_h)
-GEN_VEXT_VV_RM(vsaddu_vv_w)
-GEN_VEXT_VV_RM(vsaddu_vv_d)
+GEN_VEXT_VV_RM(vsaddu_vv_b, 1)
+GEN_VEXT_VV_RM(vsaddu_vv_h, 2)
+GEN_VEXT_VV_RM(vsaddu_vv_w, 4)
+GEN_VEXT_VV_RM(vsaddu_vv_d, 8)
=20
 typedef void opivx2_rm_fn(void *vd, target_long s1, void *vs2, int i,
                           CPURISCVState *env, int vxrm);
@@ -2220,10 +2224,12 @@ static inline void
 vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
              CPURISCVState *env,
              uint32_t desc,
-             opivx2_rm_fn *fn)
+             opivx2_rm_fn *fn, uint32_t esz)
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
=20
     switch (env->vxrm) {
     case 0: /* rnu */
@@ -2243,25 +2249,27 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, =
void *vs2,
                      env, vl, vm, 3, fn);
         break;
     }
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
 }
=20
 /* generate helpers for fixed point instructions with OPIVX format */
-#define GEN_VEXT_VX_RM(NAME)                              \
+#define GEN_VEXT_VX_RM(NAME, ESZ)                         \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
         void *vs2, CPURISCVState *env, uint32_t desc)     \
 {                                                         \
     vext_vx_rm_2(vd, v0, s1, vs2, env, desc,              \
-                 do_##NAME);                              \
+                 do_##NAME, ESZ);                         \
 }
=20
 RVVCALL(OPIVX2_RM, vsaddu_vx_b, OP_UUU_B, H1, H1, saddu8)
 RVVCALL(OPIVX2_RM, vsaddu_vx_h, OP_UUU_H, H2, H2, saddu16)
 RVVCALL(OPIVX2_RM, vsaddu_vx_w, OP_UUU_W, H4, H4, saddu32)
 RVVCALL(OPIVX2_RM, vsaddu_vx_d, OP_UUU_D, H8, H8, saddu64)
-GEN_VEXT_VX_RM(vsaddu_vx_b)
-GEN_VEXT_VX_RM(vsaddu_vx_h)
-GEN_VEXT_VX_RM(vsaddu_vx_w)
-GEN_VEXT_VX_RM(vsaddu_vx_d)
+GEN_VEXT_VX_RM(vsaddu_vx_b, 1)
+GEN_VEXT_VX_RM(vsaddu_vx_h, 2)
+GEN_VEXT_VX_RM(vsaddu_vx_w, 4)
+GEN_VEXT_VX_RM(vsaddu_vx_d, 8)
=20
 static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_=
t b)
 {
@@ -2307,19 +2315,19 @@ RVVCALL(OPIVV2_RM, vsadd_vv_b, OP_SSS_B, H1, H1, =
H1, sadd8)
 RVVCALL(OPIVV2_RM, vsadd_vv_h, OP_SSS_H, H2, H2, H2, sadd16)
 RVVCALL(OPIVV2_RM, vsadd_vv_w, OP_SSS_W, H4, H4, H4, sadd32)
 RVVCALL(OPIVV2_RM, vsadd_vv_d, OP_SSS_D, H8, H8, H8, sadd64)
-GEN_VEXT_VV_RM(vsadd_vv_b)
-GEN_VEXT_VV_RM(vsadd_vv_h)
-GEN_VEXT_VV_RM(vsadd_vv_w)
-GEN_VEXT_VV_RM(vsadd_vv_d)
+GEN_VEXT_VV_RM(vsadd_vv_b, 1)
+GEN_VEXT_VV_RM(vsadd_vv_h, 2)
+GEN_VEXT_VV_RM(vsadd_vv_w, 4)
+GEN_VEXT_VV_RM(vsadd_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vsadd_vx_b, OP_SSS_B, H1, H1, sadd8)
 RVVCALL(OPIVX2_RM, vsadd_vx_h, OP_SSS_H, H2, H2, sadd16)
 RVVCALL(OPIVX2_RM, vsadd_vx_w, OP_SSS_W, H4, H4, sadd32)
 RVVCALL(OPIVX2_RM, vsadd_vx_d, OP_SSS_D, H8, H8, sadd64)
-GEN_VEXT_VX_RM(vsadd_vx_b)
-GEN_VEXT_VX_RM(vsadd_vx_h)
-GEN_VEXT_VX_RM(vsadd_vx_w)
-GEN_VEXT_VX_RM(vsadd_vx_d)
+GEN_VEXT_VX_RM(vsadd_vx_b, 1)
+GEN_VEXT_VX_RM(vsadd_vx_h, 2)
+GEN_VEXT_VX_RM(vsadd_vx_w, 4)
+GEN_VEXT_VX_RM(vsadd_vx_d, 8)
=20
 static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, ui=
nt8_t b)
 {
@@ -2368,19 +2376,19 @@ RVVCALL(OPIVV2_RM, vssubu_vv_b, OP_UUU_B, H1, H1,=
 H1, ssubu8)
 RVVCALL(OPIVV2_RM, vssubu_vv_h, OP_UUU_H, H2, H2, H2, ssubu16)
 RVVCALL(OPIVV2_RM, vssubu_vv_w, OP_UUU_W, H4, H4, H4, ssubu32)
 RVVCALL(OPIVV2_RM, vssubu_vv_d, OP_UUU_D, H8, H8, H8, ssubu64)
-GEN_VEXT_VV_RM(vssubu_vv_b)
-GEN_VEXT_VV_RM(vssubu_vv_h)
-GEN_VEXT_VV_RM(vssubu_vv_w)
-GEN_VEXT_VV_RM(vssubu_vv_d)
+GEN_VEXT_VV_RM(vssubu_vv_b, 1)
+GEN_VEXT_VV_RM(vssubu_vv_h, 2)
+GEN_VEXT_VV_RM(vssubu_vv_w, 4)
+GEN_VEXT_VV_RM(vssubu_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vssubu_vx_b, OP_UUU_B, H1, H1, ssubu8)
 RVVCALL(OPIVX2_RM, vssubu_vx_h, OP_UUU_H, H2, H2, ssubu16)
 RVVCALL(OPIVX2_RM, vssubu_vx_w, OP_UUU_W, H4, H4, ssubu32)
 RVVCALL(OPIVX2_RM, vssubu_vx_d, OP_UUU_D, H8, H8, ssubu64)
-GEN_VEXT_VX_RM(vssubu_vx_b)
-GEN_VEXT_VX_RM(vssubu_vx_h)
-GEN_VEXT_VX_RM(vssubu_vx_w)
-GEN_VEXT_VX_RM(vssubu_vx_d)
+GEN_VEXT_VX_RM(vssubu_vx_b, 1)
+GEN_VEXT_VX_RM(vssubu_vx_h, 2)
+GEN_VEXT_VX_RM(vssubu_vx_w, 4)
+GEN_VEXT_VX_RM(vssubu_vx_d, 8)
=20
 static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_=
t b)
 {
@@ -2426,19 +2434,19 @@ RVVCALL(OPIVV2_RM, vssub_vv_b, OP_SSS_B, H1, H1, =
H1, ssub8)
 RVVCALL(OPIVV2_RM, vssub_vv_h, OP_SSS_H, H2, H2, H2, ssub16)
 RVVCALL(OPIVV2_RM, vssub_vv_w, OP_SSS_W, H4, H4, H4, ssub32)
 RVVCALL(OPIVV2_RM, vssub_vv_d, OP_SSS_D, H8, H8, H8, ssub64)
-GEN_VEXT_VV_RM(vssub_vv_b)
-GEN_VEXT_VV_RM(vssub_vv_h)
-GEN_VEXT_VV_RM(vssub_vv_w)
-GEN_VEXT_VV_RM(vssub_vv_d)
+GEN_VEXT_VV_RM(vssub_vv_b, 1)
+GEN_VEXT_VV_RM(vssub_vv_h, 2)
+GEN_VEXT_VV_RM(vssub_vv_w, 4)
+GEN_VEXT_VV_RM(vssub_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vssub_vx_b, OP_SSS_B, H1, H1, ssub8)
 RVVCALL(OPIVX2_RM, vssub_vx_h, OP_SSS_H, H2, H2, ssub16)
 RVVCALL(OPIVX2_RM, vssub_vx_w, OP_SSS_W, H4, H4, ssub32)
 RVVCALL(OPIVX2_RM, vssub_vx_d, OP_SSS_D, H8, H8, ssub64)
-GEN_VEXT_VX_RM(vssub_vx_b)
-GEN_VEXT_VX_RM(vssub_vx_h)
-GEN_VEXT_VX_RM(vssub_vx_w)
-GEN_VEXT_VX_RM(vssub_vx_d)
+GEN_VEXT_VX_RM(vssub_vx_b, 1)
+GEN_VEXT_VX_RM(vssub_vx_h, 2)
+GEN_VEXT_VX_RM(vssub_vx_w, 4)
+GEN_VEXT_VX_RM(vssub_vx_d, 8)
=20
 /* Vector Single-Width Averaging Add and Subtract */
 static inline uint8_t get_round(int vxrm, uint64_t v, uint8_t shift)
@@ -2490,19 +2498,19 @@ RVVCALL(OPIVV2_RM, vaadd_vv_b, OP_SSS_B, H1, H1, =
H1, aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_h, OP_SSS_H, H2, H2, H2, aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_w, OP_SSS_W, H4, H4, H4, aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_d, OP_SSS_D, H8, H8, H8, aadd64)
-GEN_VEXT_VV_RM(vaadd_vv_b)
-GEN_VEXT_VV_RM(vaadd_vv_h)
-GEN_VEXT_VV_RM(vaadd_vv_w)
-GEN_VEXT_VV_RM(vaadd_vv_d)
+GEN_VEXT_VV_RM(vaadd_vv_b, 1)
+GEN_VEXT_VV_RM(vaadd_vv_h, 2)
+GEN_VEXT_VV_RM(vaadd_vv_w, 4)
+GEN_VEXT_VV_RM(vaadd_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vaadd_vx_b, OP_SSS_B, H1, H1, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_h, OP_SSS_H, H2, H2, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_w, OP_SSS_W, H4, H4, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_d, OP_SSS_D, H8, H8, aadd64)
-GEN_VEXT_VX_RM(vaadd_vx_b)
-GEN_VEXT_VX_RM(vaadd_vx_h)
-GEN_VEXT_VX_RM(vaadd_vx_w)
-GEN_VEXT_VX_RM(vaadd_vx_d)
+GEN_VEXT_VX_RM(vaadd_vx_b, 1)
+GEN_VEXT_VX_RM(vaadd_vx_h, 2)
+GEN_VEXT_VX_RM(vaadd_vx_w, 4)
+GEN_VEXT_VX_RM(vaadd_vx_d, 8)
=20
 static inline uint32_t aaddu32(CPURISCVState *env, int vxrm,
                                uint32_t a, uint32_t b)
@@ -2527,19 +2535,19 @@ RVVCALL(OPIVV2_RM, vaaddu_vv_b, OP_UUU_B, H1, H1,=
 H1, aaddu32)
 RVVCALL(OPIVV2_RM, vaaddu_vv_h, OP_UUU_H, H2, H2, H2, aaddu32)
 RVVCALL(OPIVV2_RM, vaaddu_vv_w, OP_UUU_W, H4, H4, H4, aaddu32)
 RVVCALL(OPIVV2_RM, vaaddu_vv_d, OP_UUU_D, H8, H8, H8, aaddu64)
-GEN_VEXT_VV_RM(vaaddu_vv_b)
-GEN_VEXT_VV_RM(vaaddu_vv_h)
-GEN_VEXT_VV_RM(vaaddu_vv_w)
-GEN_VEXT_VV_RM(vaaddu_vv_d)
+GEN_VEXT_VV_RM(vaaddu_vv_b, 1)
+GEN_VEXT_VV_RM(vaaddu_vv_h, 2)
+GEN_VEXT_VV_RM(vaaddu_vv_w, 4)
+GEN_VEXT_VV_RM(vaaddu_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vaaddu_vx_b, OP_UUU_B, H1, H1, aaddu32)
 RVVCALL(OPIVX2_RM, vaaddu_vx_h, OP_UUU_H, H2, H2, aaddu32)
 RVVCALL(OPIVX2_RM, vaaddu_vx_w, OP_UUU_W, H4, H4, aaddu32)
 RVVCALL(OPIVX2_RM, vaaddu_vx_d, OP_UUU_D, H8, H8, aaddu64)
-GEN_VEXT_VX_RM(vaaddu_vx_b)
-GEN_VEXT_VX_RM(vaaddu_vx_h)
-GEN_VEXT_VX_RM(vaaddu_vx_w)
-GEN_VEXT_VX_RM(vaaddu_vx_d)
+GEN_VEXT_VX_RM(vaaddu_vx_b, 1)
+GEN_VEXT_VX_RM(vaaddu_vx_h, 2)
+GEN_VEXT_VX_RM(vaaddu_vx_w, 4)
+GEN_VEXT_VX_RM(vaaddu_vx_d, 8)
=20
 static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, in=
t32_t b)
 {
@@ -2563,19 +2571,19 @@ RVVCALL(OPIVV2_RM, vasub_vv_b, OP_SSS_B, H1, H1, =
H1, asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_h, OP_SSS_H, H2, H2, H2, asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_w, OP_SSS_W, H4, H4, H4, asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_d, OP_SSS_D, H8, H8, H8, asub64)
-GEN_VEXT_VV_RM(vasub_vv_b)
-GEN_VEXT_VV_RM(vasub_vv_h)
-GEN_VEXT_VV_RM(vasub_vv_w)
-GEN_VEXT_VV_RM(vasub_vv_d)
+GEN_VEXT_VV_RM(vasub_vv_b, 1)
+GEN_VEXT_VV_RM(vasub_vv_h, 2)
+GEN_VEXT_VV_RM(vasub_vv_w, 4)
+GEN_VEXT_VV_RM(vasub_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vasub_vx_b, OP_SSS_B, H1, H1, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_h, OP_SSS_H, H2, H2, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_w, OP_SSS_W, H4, H4, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_d, OP_SSS_D, H8, H8, asub64)
-GEN_VEXT_VX_RM(vasub_vx_b)
-GEN_VEXT_VX_RM(vasub_vx_h)
-GEN_VEXT_VX_RM(vasub_vx_w)
-GEN_VEXT_VX_RM(vasub_vx_d)
+GEN_VEXT_VX_RM(vasub_vx_b, 1)
+GEN_VEXT_VX_RM(vasub_vx_h, 2)
+GEN_VEXT_VX_RM(vasub_vx_w, 4)
+GEN_VEXT_VX_RM(vasub_vx_d, 8)
=20
 static inline uint32_t asubu32(CPURISCVState *env, int vxrm,
                                uint32_t a, uint32_t b)
@@ -2600,19 +2608,19 @@ RVVCALL(OPIVV2_RM, vasubu_vv_b, OP_UUU_B, H1, H1,=
 H1, asubu32)
 RVVCALL(OPIVV2_RM, vasubu_vv_h, OP_UUU_H, H2, H2, H2, asubu32)
 RVVCALL(OPIVV2_RM, vasubu_vv_w, OP_UUU_W, H4, H4, H4, asubu32)
 RVVCALL(OPIVV2_RM, vasubu_vv_d, OP_UUU_D, H8, H8, H8, asubu64)
-GEN_VEXT_VV_RM(vasubu_vv_b)
-GEN_VEXT_VV_RM(vasubu_vv_h)
-GEN_VEXT_VV_RM(vasubu_vv_w)
-GEN_VEXT_VV_RM(vasubu_vv_d)
+GEN_VEXT_VV_RM(vasubu_vv_b, 1)
+GEN_VEXT_VV_RM(vasubu_vv_h, 2)
+GEN_VEXT_VV_RM(vasubu_vv_w, 4)
+GEN_VEXT_VV_RM(vasubu_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vasubu_vx_b, OP_UUU_B, H1, H1, asubu32)
 RVVCALL(OPIVX2_RM, vasubu_vx_h, OP_UUU_H, H2, H2, asubu32)
 RVVCALL(OPIVX2_RM, vasubu_vx_w, OP_UUU_W, H4, H4, asubu32)
 RVVCALL(OPIVX2_RM, vasubu_vx_d, OP_UUU_D, H8, H8, asubu64)
-GEN_VEXT_VX_RM(vasubu_vx_b)
-GEN_VEXT_VX_RM(vasubu_vx_h)
-GEN_VEXT_VX_RM(vasubu_vx_w)
-GEN_VEXT_VX_RM(vasubu_vx_d)
+GEN_VEXT_VX_RM(vasubu_vx_b, 1)
+GEN_VEXT_VX_RM(vasubu_vx_h, 2)
+GEN_VEXT_VX_RM(vasubu_vx_w, 4)
+GEN_VEXT_VX_RM(vasubu_vx_d, 8)
=20
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation =
*/
 static inline int8_t vsmul8(CPURISCVState *env, int vxrm, int8_t a, int8=
_t b)
@@ -2707,19 +2715,19 @@ RVVCALL(OPIVV2_RM, vsmul_vv_b, OP_SSS_B, H1, H1, =
H1, vsmul8)
 RVVCALL(OPIVV2_RM, vsmul_vv_h, OP_SSS_H, H2, H2, H2, vsmul16)
 RVVCALL(OPIVV2_RM, vsmul_vv_w, OP_SSS_W, H4, H4, H4, vsmul32)
 RVVCALL(OPIVV2_RM, vsmul_vv_d, OP_SSS_D, H8, H8, H8, vsmul64)
-GEN_VEXT_VV_RM(vsmul_vv_b)
-GEN_VEXT_VV_RM(vsmul_vv_h)
-GEN_VEXT_VV_RM(vsmul_vv_w)
-GEN_VEXT_VV_RM(vsmul_vv_d)
+GEN_VEXT_VV_RM(vsmul_vv_b, 1)
+GEN_VEXT_VV_RM(vsmul_vv_h, 2)
+GEN_VEXT_VV_RM(vsmul_vv_w, 4)
+GEN_VEXT_VV_RM(vsmul_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vsmul_vx_b, OP_SSS_B, H1, H1, vsmul8)
 RVVCALL(OPIVX2_RM, vsmul_vx_h, OP_SSS_H, H2, H2, vsmul16)
 RVVCALL(OPIVX2_RM, vsmul_vx_w, OP_SSS_W, H4, H4, vsmul32)
 RVVCALL(OPIVX2_RM, vsmul_vx_d, OP_SSS_D, H8, H8, vsmul64)
-GEN_VEXT_VX_RM(vsmul_vx_b)
-GEN_VEXT_VX_RM(vsmul_vx_h)
-GEN_VEXT_VX_RM(vsmul_vx_w)
-GEN_VEXT_VX_RM(vsmul_vx_d)
+GEN_VEXT_VX_RM(vsmul_vx_b, 1)
+GEN_VEXT_VX_RM(vsmul_vx_h, 2)
+GEN_VEXT_VX_RM(vsmul_vx_w, 4)
+GEN_VEXT_VX_RM(vsmul_vx_d, 8)
=20
 /* Vector Single-Width Scaling Shift Instructions */
 static inline uint8_t
@@ -2766,19 +2774,19 @@ RVVCALL(OPIVV2_RM, vssrl_vv_b, OP_UUU_B, H1, H1, =
H1, vssrl8)
 RVVCALL(OPIVV2_RM, vssrl_vv_h, OP_UUU_H, H2, H2, H2, vssrl16)
 RVVCALL(OPIVV2_RM, vssrl_vv_w, OP_UUU_W, H4, H4, H4, vssrl32)
 RVVCALL(OPIVV2_RM, vssrl_vv_d, OP_UUU_D, H8, H8, H8, vssrl64)
-GEN_VEXT_VV_RM(vssrl_vv_b)
-GEN_VEXT_VV_RM(vssrl_vv_h)
-GEN_VEXT_VV_RM(vssrl_vv_w)
-GEN_VEXT_VV_RM(vssrl_vv_d)
+GEN_VEXT_VV_RM(vssrl_vv_b, 1)
+GEN_VEXT_VV_RM(vssrl_vv_h, 2)
+GEN_VEXT_VV_RM(vssrl_vv_w, 4)
+GEN_VEXT_VV_RM(vssrl_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vssrl_vx_b, OP_UUU_B, H1, H1, vssrl8)
 RVVCALL(OPIVX2_RM, vssrl_vx_h, OP_UUU_H, H2, H2, vssrl16)
 RVVCALL(OPIVX2_RM, vssrl_vx_w, OP_UUU_W, H4, H4, vssrl32)
 RVVCALL(OPIVX2_RM, vssrl_vx_d, OP_UUU_D, H8, H8, vssrl64)
-GEN_VEXT_VX_RM(vssrl_vx_b)
-GEN_VEXT_VX_RM(vssrl_vx_h)
-GEN_VEXT_VX_RM(vssrl_vx_w)
-GEN_VEXT_VX_RM(vssrl_vx_d)
+GEN_VEXT_VX_RM(vssrl_vx_b, 1)
+GEN_VEXT_VX_RM(vssrl_vx_h, 2)
+GEN_VEXT_VX_RM(vssrl_vx_w, 4)
+GEN_VEXT_VX_RM(vssrl_vx_d, 8)
=20
 static inline int8_t
 vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
@@ -2825,19 +2833,19 @@ RVVCALL(OPIVV2_RM, vssra_vv_b, OP_SSS_B, H1, H1, =
H1, vssra8)
 RVVCALL(OPIVV2_RM, vssra_vv_h, OP_SSS_H, H2, H2, H2, vssra16)
 RVVCALL(OPIVV2_RM, vssra_vv_w, OP_SSS_W, H4, H4, H4, vssra32)
 RVVCALL(OPIVV2_RM, vssra_vv_d, OP_SSS_D, H8, H8, H8, vssra64)
-GEN_VEXT_VV_RM(vssra_vv_b)
-GEN_VEXT_VV_RM(vssra_vv_h)
-GEN_VEXT_VV_RM(vssra_vv_w)
-GEN_VEXT_VV_RM(vssra_vv_d)
+GEN_VEXT_VV_RM(vssra_vv_b, 1)
+GEN_VEXT_VV_RM(vssra_vv_h, 2)
+GEN_VEXT_VV_RM(vssra_vv_w, 4)
+GEN_VEXT_VV_RM(vssra_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vssra_vx_b, OP_SSS_B, H1, H1, vssra8)
 RVVCALL(OPIVX2_RM, vssra_vx_h, OP_SSS_H, H2, H2, vssra16)
 RVVCALL(OPIVX2_RM, vssra_vx_w, OP_SSS_W, H4, H4, vssra32)
 RVVCALL(OPIVX2_RM, vssra_vx_d, OP_SSS_D, H8, H8, vssra64)
-GEN_VEXT_VX_RM(vssra_vx_b)
-GEN_VEXT_VX_RM(vssra_vx_h)
-GEN_VEXT_VX_RM(vssra_vx_w)
-GEN_VEXT_VX_RM(vssra_vx_d)
+GEN_VEXT_VX_RM(vssra_vx_b, 1)
+GEN_VEXT_VX_RM(vssra_vx_h, 2)
+GEN_VEXT_VX_RM(vssra_vx_w, 4)
+GEN_VEXT_VX_RM(vssra_vx_d, 8)
=20
 /* Vector Narrowing Fixed-Point Clip Instructions */
 static inline int8_t
@@ -2900,16 +2908,16 @@ vnclip32(CPURISCVState *env, int vxrm, int64_t a,=
 int32_t b)
 RVVCALL(OPIVV2_RM, vnclip_wv_b, NOP_SSS_B, H1, H2, H1, vnclip8)
 RVVCALL(OPIVV2_RM, vnclip_wv_h, NOP_SSS_H, H2, H4, H2, vnclip16)
 RVVCALL(OPIVV2_RM, vnclip_wv_w, NOP_SSS_W, H4, H8, H4, vnclip32)
-GEN_VEXT_VV_RM(vnclip_wv_b)
-GEN_VEXT_VV_RM(vnclip_wv_h)
-GEN_VEXT_VV_RM(vnclip_wv_w)
+GEN_VEXT_VV_RM(vnclip_wv_b, 1)
+GEN_VEXT_VV_RM(vnclip_wv_h, 2)
+GEN_VEXT_VV_RM(vnclip_wv_w, 4)
=20
 RVVCALL(OPIVX2_RM, vnclip_wx_b, NOP_SSS_B, H1, H2, vnclip8)
 RVVCALL(OPIVX2_RM, vnclip_wx_h, NOP_SSS_H, H2, H4, vnclip16)
 RVVCALL(OPIVX2_RM, vnclip_wx_w, NOP_SSS_W, H4, H8, vnclip32)
-GEN_VEXT_VX_RM(vnclip_wx_b)
-GEN_VEXT_VX_RM(vnclip_wx_h)
-GEN_VEXT_VX_RM(vnclip_wx_w)
+GEN_VEXT_VX_RM(vnclip_wx_b, 1)
+GEN_VEXT_VX_RM(vnclip_wx_h, 2)
+GEN_VEXT_VX_RM(vnclip_wx_w, 4)
=20
 static inline uint8_t
 vnclipu8(CPURISCVState *env, int vxrm, uint16_t a, uint8_t b)
@@ -2962,16 +2970,16 @@ vnclipu32(CPURISCVState *env, int vxrm, uint64_t =
a, uint32_t b)
 RVVCALL(OPIVV2_RM, vnclipu_wv_b, NOP_UUU_B, H1, H2, H1, vnclipu8)
 RVVCALL(OPIVV2_RM, vnclipu_wv_h, NOP_UUU_H, H2, H4, H2, vnclipu16)
 RVVCALL(OPIVV2_RM, vnclipu_wv_w, NOP_UUU_W, H4, H8, H4, vnclipu32)
-GEN_VEXT_VV_RM(vnclipu_wv_b)
-GEN_VEXT_VV_RM(vnclipu_wv_h)
-GEN_VEXT_VV_RM(vnclipu_wv_w)
+GEN_VEXT_VV_RM(vnclipu_wv_b, 1)
+GEN_VEXT_VV_RM(vnclipu_wv_h, 2)
+GEN_VEXT_VV_RM(vnclipu_wv_w, 4)
=20
 RVVCALL(OPIVX2_RM, vnclipu_wx_b, NOP_UUU_B, H1, H2, vnclipu8)
 RVVCALL(OPIVX2_RM, vnclipu_wx_h, NOP_UUU_H, H2, H4, vnclipu16)
 RVVCALL(OPIVX2_RM, vnclipu_wx_w, NOP_UUU_W, H4, H8, vnclipu32)
-GEN_VEXT_VX_RM(vnclipu_wx_b)
-GEN_VEXT_VX_RM(vnclipu_wx_h)
-GEN_VEXT_VX_RM(vnclipu_wx_w)
+GEN_VEXT_VX_RM(vnclipu_wx_b, 1)
+GEN_VEXT_VX_RM(vnclipu_wx_h, 2)
+GEN_VEXT_VX_RM(vnclipu_wx_w, 4)
=20
 /*
  *** Vector Float Point Arithmetic Instructions
--=20
2.36.1


