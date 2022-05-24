Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D365333AE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:52:11 +0200 (CEST)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdNq-00081J-Rs
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGe-0007Pi-HT
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:44 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGc-0002Yx-O9
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432282; x=1684968282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I7x1udF8I/ScLI1v+llAAQx0Sho5uUSsM22rLMILJYE=;
 b=PPePZxDIA3+w7FgCvQlB60xp6YoeT4lfdFZ7DXP/rHoq4BZBYSjbrN4L
 7Kq26y+okXgWOYZhrhBCDma7Ms8xHci0npSV5UAXRntyAqqrBAqzNKFUL
 KH4dSOuU5Ol0Q9bdtEyyo2CWkSHvDG7hHMNfnTRTp63rTSOjpscD9ZyzR
 /vtPlRtPkSehEAu86Ae/O3gQ32UXYMnb0qM9D4lHqMX3Bte/OxUbyZ0Vo
 d2i6Ks3B+dw1i7Xq25onTQklGnlw8kaltQGi4D+ScdPR2iLzEZGo1KI4x
 GQc58vK0GV2hQVk8Pf4k+8zXLZmgsQrLDv9ar285dA4QOJUOPUOoGDQq8 A==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566651"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:44:41 +0800
IronPort-SDR: VNlEfSiwRGKzAIbnflm+JqXpEErqa0yYZA4o7+4Pv0OWVmgIolKqfCmkKQChOZkoXiSC5Hrzsg
 y4DlKAgRz3Rjb2CrdnIURNNI/HA+bAw3+DveD3cXrZlQIpCxMj5hG+W/7Z2YDIB9nAqESvV0Jd
 AG4ndthWz4SQD3QEF0hg02r30D2XJS+x6wRw6mVCdeuLPujBHkobH7jfE6zAk/amdl+EL/8bpV
 q0mk8vaS56r1nucaiPq/6HCirSjfYlPLVi74ifBYHMD38W8KV/UeC8eVQfewnvpQ/oAcDKtq7C
 2iwfGkJDk+IFPLYfR6hvmcuz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:13 -0700
IronPort-SDR: QaIEECFov+lDAsGq8PCkF6RFw4x45RJbA4nMJ5y9QejewRMBxGXO5PLltQejn3i1Az0gF7hV0g
 MiKMllPs9eMYkkzyggFSXNKZZb6Sd7SPt9jCSDQ1SbtjkC2gK2C5pPojvXhO/05eg0a9sHR/CL
 D65oX0WgqOqsPcEstYDmtfQQWJpLEXd+RRQ4CpLDoWyZihk7OMQIhCuzLdkyiEP5SGKSDdkUfn
 vdftSHEfa+RoC4DowcchmdTFqTtVxVjY5rDKWUyRjxO7STklxvJe27v7rirvSIOqKuvQxymhVF
 1IA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:44:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78Qd1YmPz1SHwl
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:44:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432280; x=1656024281; bh=I7x1udF8I/ScLI1v+l
 lAAQx0Sho5uUSsM22rLMILJYE=; b=NQEE+11DnRupfsmOz7rQzMOpANsN+s9hrb
 yuDN+cPz33PLyWjC8AwGnkovKf+jx7+0WjYNG5Q1K1JKcuocmCDbHlY7qG9XER5O
 LDVMb1r4RzgpBtR+TxwCXAW6MHj5cHH/a1gU3dhNI4xSF0k5mHI9vFEBGOkvPAeK
 m+gW8gcY7qrnrcGH4RxKF1AwIQ8A7I87sjA81+lLO8E93FDqbZMgXyrb7z7eITt4
 o7CKvJG4+pdAXdWkkh0zY0KpWIP3yyPxhWSEeTFYZ+OZhH40naeXmn2Wqw4Fy5Dv
 PbMgCuTpjk37JUeFUstHUR4j9IUkYB+3pjgpOu+OciycFRMpyMCg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 82yDf_5CHKLD for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:44:40 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78QZ3mVgz1Rwrw;
 Tue, 24 May 2022 15:44:38 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/23] target/riscv: rvv: Fix early exit condition for whole
 register load/store
Date: Wed, 25 May 2022 08:44:07 +1000
Message-Id: <20220524224428.552334-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
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

From: eopXD <eop.chen@sifive.com>

Vector whole register load instructions have EEW encoded in the opcode,
so we shouldn't take SEW here. Vector whole register store instructions
are always EEW=3D8.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165181414065.18540.14828125053334599921-0@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 58 +++++++++++++------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 90327509f7..391c61fe93 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1118,10 +1118,10 @@ GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op,=
 ld_us_check)
 typedef void gen_helper_ldst_whole(TCGv_ptr, TCGv, TCGv_env, TCGv_i32);
=20
 static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
-                             gen_helper_ldst_whole *fn, DisasContext *s,
-                             bool is_store)
+                             uint32_t width, gen_helper_ldst_whole *fn,
+                             DisasContext *s, bool is_store)
 {
-    uint32_t evl =3D (s->cfg_ptr->vlen / 8) * nf / (1 << s->sew);
+    uint32_t evl =3D (s->cfg_ptr->vlen / 8) * nf / width;
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, evl, over);
=20
@@ -1153,38 +1153,42 @@ static bool ldst_whole_trans(uint32_t vd, uint32_=
t rs1, uint32_t nf,
  * load and store whole register instructions ignore vtype and vl settin=
g.
  * Thus, we don't need to check vill bit. (Section 7.9)
  */
-#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF, IS_STORE)                    =
  \
+#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF, WIDTH, IS_STORE)             =
  \
 static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               =
  \
 {                                                                       =
  \
     if (require_rvv(s) &&                                               =
  \
         QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                               =
  \
-        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, gen_helper_##NAME=
, \
-                                s, IS_STORE);                           =
  \
+        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, WIDTH,           =
  \
+                                gen_helper_##NAME, s, IS_STORE);        =
  \
     }                                                                   =
  \
     return false;                                                       =
  \
 }
=20
-GEN_LDST_WHOLE_TRANS(vl1re8_v,  1, false)
-GEN_LDST_WHOLE_TRANS(vl1re16_v, 1, false)
-GEN_LDST_WHOLE_TRANS(vl1re32_v, 1, false)
-GEN_LDST_WHOLE_TRANS(vl1re64_v, 1, false)
-GEN_LDST_WHOLE_TRANS(vl2re8_v,  2, false)
-GEN_LDST_WHOLE_TRANS(vl2re16_v, 2, false)
-GEN_LDST_WHOLE_TRANS(vl2re32_v, 2, false)
-GEN_LDST_WHOLE_TRANS(vl2re64_v, 2, false)
-GEN_LDST_WHOLE_TRANS(vl4re8_v,  4, false)
-GEN_LDST_WHOLE_TRANS(vl4re16_v, 4, false)
-GEN_LDST_WHOLE_TRANS(vl4re32_v, 4, false)
-GEN_LDST_WHOLE_TRANS(vl4re64_v, 4, false)
-GEN_LDST_WHOLE_TRANS(vl8re8_v,  8, false)
-GEN_LDST_WHOLE_TRANS(vl8re16_v, 8, false)
-GEN_LDST_WHOLE_TRANS(vl8re32_v, 8, false)
-GEN_LDST_WHOLE_TRANS(vl8re64_v, 8, false)
-
-GEN_LDST_WHOLE_TRANS(vs1r_v, 1, true)
-GEN_LDST_WHOLE_TRANS(vs2r_v, 2, true)
-GEN_LDST_WHOLE_TRANS(vs4r_v, 4, true)
-GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
+GEN_LDST_WHOLE_TRANS(vl1re8_v,  1, 1, false)
+GEN_LDST_WHOLE_TRANS(vl1re16_v, 1, 2, false)
+GEN_LDST_WHOLE_TRANS(vl1re32_v, 1, 4, false)
+GEN_LDST_WHOLE_TRANS(vl1re64_v, 1, 8, false)
+GEN_LDST_WHOLE_TRANS(vl2re8_v,  2, 1, false)
+GEN_LDST_WHOLE_TRANS(vl2re16_v, 2, 2, false)
+GEN_LDST_WHOLE_TRANS(vl2re32_v, 2, 4, false)
+GEN_LDST_WHOLE_TRANS(vl2re64_v, 2, 8, false)
+GEN_LDST_WHOLE_TRANS(vl4re8_v,  4, 1, false)
+GEN_LDST_WHOLE_TRANS(vl4re16_v, 4, 2, false)
+GEN_LDST_WHOLE_TRANS(vl4re32_v, 4, 4, false)
+GEN_LDST_WHOLE_TRANS(vl4re64_v, 4, 8, false)
+GEN_LDST_WHOLE_TRANS(vl8re8_v,  8, 1, false)
+GEN_LDST_WHOLE_TRANS(vl8re16_v, 8, 2, false)
+GEN_LDST_WHOLE_TRANS(vl8re32_v, 8, 4, false)
+GEN_LDST_WHOLE_TRANS(vl8re64_v, 8, 8, false)
+
+/*
+ * The vector whole register store instructions are encoded similar to
+ * unmasked unit-stride store of elements with EEW=3D8.
+ */
+GEN_LDST_WHOLE_TRANS(vs1r_v, 1, 1, true)
+GEN_LDST_WHOLE_TRANS(vs2r_v, 2, 1, true)
+GEN_LDST_WHOLE_TRANS(vs4r_v, 4, 1, true)
+GEN_LDST_WHOLE_TRANS(vs8r_v, 8, 1, true)
=20
 /*
  *** Vector Integer Arithmetic Instructions
--=20
2.35.3


