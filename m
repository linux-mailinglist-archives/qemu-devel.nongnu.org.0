Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A3545B44
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:45:37 +0200 (CEST)
Received: from localhost ([::1]:53908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWWe-0007OQ-4c
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGN-0003pu-IZ
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:48 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:5610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWGL-00018L-Dd
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835325; x=1686371325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6n0oU6yZDmZwKs2RbRd8SQ4rqfyKFsT7faSX5Lrrvls=;
 b=TNF86FphQAS4oXQ9JJODNBU0gyftU28K6YRWqwezcBOjJTNtKpdxpxH/
 Lc/Qj7roBsIECNrb4zH5LV3M7FLKYoUimKINSyGYOTZSD8t3F/aP2sYh/
 4V7qMqt9KkajDuQaFv6bsct4VV9nu28hyprOehCB5liKl5EuC2da/SmrU
 SHBQHPrTjdT9ydJ9EHkuBuxSCxSqIdPx+gO1cg0v4cTPaquO/sS6XbVXh
 /THty6FSywfeCp3S4Vi63cg8l5tH4b5gCTF9hdF7mKS26WqS/EARKjj3p
 z0THUS3niKddqGKRut4N4cf6L1A7TDTdaZ75zLk4MLtx1/a78Uxm+AOGf A==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="201489063"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:43 +0800
IronPort-SDR: eJpwwMhmaMjeil1+XNOlEBUPYNwY8ybpD6yMp8kuVMKdG7Q3Lh909OJrXXKk7ZNGFK922ki7rx
 qN2NuT5tbCVR5uvSm7VRr/XH0Qljig1+aYy86vCvtdaexSLXoRXpdRl1Xw363WEjlrHSPgL8pE
 UanZs2D3MeZ7pRX9eMDVDy7GqNL/2UjR02lHDkZE10+ezAg4aX0OppBioLGbfYZWbxCSr1hai7
 mZL0ILjC2bXOjLSE/nTw0LcrqxwPBqHHgZC02f5OjpgnHW0M+p8Nl6KU4p5lE0JFtsQhh61bvC
 ber1lX5m8qDI4ghZpFzgimbX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:51 -0700
IronPort-SDR: JYCw4iZmDyzuDI1GwH5HR+JeJJbCWkqKQYZ5czwiHDEO0o3UaZDqIq2vITepU7BamE7KfSPVbi
 tdfWU/lYYrdCc9ik3XiaPM77gtd46eapZ8mPASMtVrVsYWt/60dg5e5CFqkaS8LZeORsvcY9S/
 IMU8sF1Llc/eiR7p1ENTpBi0VleVxHDfNUCV0IV75a9R1vTRdG9k5djcADN9cccb5jyZyS+wdI
 rFSXg2gUmOox46NTU3p+fiCEGbLmBJstrMgShlfnQxW8fQTaYocyzO8zxWQuV6gHehGmJaSF2L
 QYo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7JB5J8wz1SVp4
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835322; x=1657427323; bh=6n0oU6yZDmZwKs2RbR
 d8SQ4rqfyKFsT7faSX5Lrrvls=; b=r27JJ61XayCS4cecz1T2a5F2TU8v3oQ98h
 wI0guqZpacZZI8wpHVuz4g///EwyZiSND3tNELD39AVCKrv0DQjwAtzl11bFVzNx
 /aK3+j3acdyK828umwYyZvYNcl6rwCtWiIZq/lx8i6yCM+hKRx+TrNVxrsGilFXB
 evgP2KPuh1T/+7cQhw62CFxc773LlSyk4YkY1ozMEZ0I0XMLCwRdhUKbddqLieV/
 98NvdnVS7TKTALY7F5gR846f+PfTXvQ+ktYk84Je/XNVzS5gPRkCnJz3d2VfODmB
 aCrYrBwgOe9TGe8cpozu6QC/yV2U0BWT+ja7H5wp6DxYdlXPI1Zw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id B8ynFBbRDgbB for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:42 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7J55wRlz1Rvlx;
 Thu,  9 Jun 2022 21:28:37 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/25] target/riscv: rvv: Add tail agnostic for vector
 reduction instructions
Date: Fri, 10 Jun 2022 14:26:50 +1000
Message-Id: <20220610042655.2021686-21-alistair.francis@opensource.wdc.com>
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
Message-Id: <165449614532.19704.7000832880482980398-13@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 17390d8d06..174a548ac2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4535,6 +4535,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
       \
 {                                                         \
     uint32_t vm =3D vext_vm(desc);                          \
     uint32_t vl =3D env->vl;                                \
+    uint32_t esz =3D sizeof(TD);                            \
+    uint32_t vlenb =3D simd_maxsz(desc);                    \
+    uint32_t vta =3D vext_vta(desc);                        \
     uint32_t i;                                           \
     TD s1 =3D  *((TD *)vs1 + HD(0));                        \
                                                           \
@@ -4547,6 +4550,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
       \
     }                                                     \
     *((TD *)vd + HD(0)) =3D s1;                             \
     env->vstart =3D 0;                                      \
+    /* set tail elements to 1s */                         \
+    vext_set_elems_1s(vd, vta, esz, vlenb);               \
 }
=20
 /* vd[0] =3D sum(vs1[0], vs2[*]) */
@@ -4616,6 +4621,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
        \
 {                                                          \
     uint32_t vm =3D vext_vm(desc);                           \
     uint32_t vl =3D env->vl;                                 \
+    uint32_t esz =3D sizeof(TD);                             \
+    uint32_t vlenb =3D simd_maxsz(desc);                     \
+    uint32_t vta =3D vext_vta(desc);                         \
     uint32_t i;                                            \
     TD s1 =3D  *((TD *)vs1 + HD(0));                         \
                                                            \
@@ -4628,6 +4636,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
        \
     }                                                      \
     *((TD *)vd + HD(0)) =3D s1;                              \
     env->vstart =3D 0;                                       \
+    /* set tail elements to 1s */                          \
+    vext_set_elems_1s(vd, vta, esz, vlenb);                \
 }
=20
 /* Unordered sum */
@@ -4652,6 +4662,9 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, voi=
d *vs1,
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t esz =3D sizeof(uint32_t);
+    uint32_t vlenb =3D simd_maxsz(desc);
+    uint32_t vta =3D vext_vta(desc);
     uint32_t i;
     uint32_t s1 =3D  *((uint32_t *)vs1 + H4(0));
=20
@@ -4665,6 +4678,8 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, voi=
d *vs1,
     }
     *((uint32_t *)vd + H4(0)) =3D s1;
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, esz, vlenb);
 }
=20
 void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
@@ -4672,6 +4687,9 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, voi=
d *vs1,
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t esz =3D sizeof(uint64_t);
+    uint32_t vlenb =3D simd_maxsz(desc);
+    uint32_t vta =3D vext_vta(desc);
     uint32_t i;
     uint64_t s1 =3D  *((uint64_t *)vs1);
=20
@@ -4685,6 +4703,8 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, voi=
d *vs1,
     }
     *((uint64_t *)vd) =3D s1;
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, esz, vlenb);
 }
=20
 /*
--=20
2.36.1


