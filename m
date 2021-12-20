Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8A447A4E0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:12:14 +0100 (CET)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBu9-0002tR-Q9
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:12:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAo9-0004Ss-NF
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:01 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAo3-0008G0-No
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976512; x=1671512512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uT3q6EsfxZqXUvfBLX/9OWfNa9mAxYBSpwYZzSPEzUM=;
 b=p/X1qwS5ak/BgFLvZEz7a8HvPe79QmpHHXijoRprKnZhtxz1z05iKavb
 GaSFDfUDgvKpiVr16uD3x1T/kHWZQg9fechP5Uje83TLQv3F/75aBuImJ
 tcjHKNNPHfkOZ3XyCovZ8MKYsdvJ9u4sFP0LiSEpWyWm365SsDLvgOpYV
 90qhJ+BXLqhSmWmvtumVTlrPDgUZsHDFBQpqxqGXbBNIx7AoR4+95aGo2
 oVoh9Faxb86vsIzJZWQTiOdlpyzNaiT/i9wYap4xwvYFjYUQxwbe0Hisd
 e9RNobrb63Z71B+3BbjUEk9LgKpAeVPRfk9Ifd9FjY0Tw0PR6PS3shG2+ w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680188"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:09 +0800
IronPort-SDR: yL5ZwU9S4q8L0jFHYzbYSa4d2AraDEinyfr5oiD/dDN/yfLHPcJoAUNYqpj1Qz4auan9BGdg75
 JXVQtSLEuT+9y8nARr+hef2HdYnh/9nsP1OB/i1wyV0cf0cf+s9MQQn0a0khZHo4gtuSHCSeV6
 YHTSsIhLnFTwaZy2U//52vaD+fMgXMhi7N3GWoBUuYUEEgI+F6bY2gaceG3A33LL1DtDlYD/u+
 QNF4Yg0vqh/HSyMVoSvWyfYeMfgHYpmsa29rQseM4fMIIx2KdtBnzd3v5Xm5RNJpmVLst0kcOz
 bQRGu0eIvvuUa6h+0TuL/uls
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:58 -0800
IronPort-SDR: lNyPAYbq1VNQYO1Q2OSEZOOTCivlsO/PgCEInUNvOH0KWxeYsRiLInW8pFK6HcrwYhZ2LUkGfS
 QZR3Zy9NvUDP3Q9ql9adxljl9CbhLyE1U0MsRe9Mhcjc/s/bHCDehkWs7VSe2o67l0bp1b46zC
 Eyjz/QvoC10j4jf8iEzMhZjiSqaBqGvucB/od18FWY2R8rqPSEDytNEN7CXrRJBUYbqu9swhEO
 4mI4aUu+4QhI0Tlk6iXL/Pv8dO0Yet8d/fL82UoLZVZCzhNrpILQrLmZweCmWDW8qthzHi5EAG
 ZN4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS9051mTz1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:08 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976468; x=1642568469; bh=uT3q6EsfxZqXUvfBLX
 /9OWfNa9mAxYBSpwYZzSPEzUM=; b=Qla8Rp/2OnX8896xgxsRfDBweyMhaQgAI4
 dXYT/CdUryWmW5PGWpO9v1dHq8viPuMFIr9CXOP6lA6HyDnvsGP5lGxZGmoygog+
 99xncO+uLxlNzSzMKUD5tOSTXffrU3sCldZDviYVkXa3H4WZi3QQIqvgEAdxo/ow
 XUQOgdw/vfOkxpU/uVt9VzFCES/t5Vkox12c8ELTBXBN9Rl/zMC8zkXmbQCv5yNo
 mP+nHuiADuJGMhsSa2/luA+IuvribL2s5klWjMkHCGSWx5p1sDe7loX9k2XVqUvc
 76SnRUwO6iPLPE8n5TgvBb7rNLCl/4DD1DAC7L+X3cWokuyoa1ag==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HVAkXk0sqJhD for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:08 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS8x3KBmz1RtVG;
 Sun, 19 Dec 2021 21:01:04 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 57/88] target/riscv: rvv-1.0: mask-register logical instructions
Date: Mon, 20 Dec 2021 14:56:34 +1000
Message-Id: <20211220045705.62174-58-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211210075704.23951-50-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 4 ----
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 71d7b1e879..f883fdf474 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4231,7 +4231,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
       \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax =3D env_archcpu(env)->cfg.vlen;          \
     uint32_t vl =3D env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4241,9 +4240,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
       \
         b =3D vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
-    }                                                     \
 }
=20
 #define DO_NAND(N, M)  (!(N & M))
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 804f423d5b..5c0c3d2547 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2652,7 +2652,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check=
)
 #define GEN_MM_TRANS(NAME)                                         \
 static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s)) {                                   \
         uint32_t data =3D 0;                                         \
         gen_helper_gvec_4_ptr *fn =3D gen_helper_##NAME;             \
         TCGLabel *over =3D gen_new_label();                          \
--=20
2.31.1


