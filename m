Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C824437870
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:53:24 +0200 (CEST)
Received: from localhost ([::1]:54070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mduz4-0008Se-0v
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumH-0001J2-NN
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:10 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:36402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumF-0001Id-9P
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910007; x=1666446007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C84ZQjMLJZ9ncphVskN1oKWmyWx4zQATr9d7mAt+hyw=;
 b=eWohdzkBThLlyIzExYMVwj0q7VJWOiKcC1MAemopAyyqTd0ZEQWH9P55
 BjO2XPAjFRLwQxbZDvCvQ958c7G4RATlu5OdsE8Z3QGisuv/HZ5T1jiJE
 TVcDCssf0OMCwAeDcq+jZ46I24ItpNoFTcJROhN89YMfsgSBpluygrzDb
 os9rCu/H1FhcjY0ilsnGI1woXG5L3rE7iwCWdRPEzFJFz421lIoQW3Nhd
 CIkQyb3HqTmnSG74nayMVygiXWvmYHP9YDnvNDPYP6RT1FhmXglMHZfIr
 OylH7FHSTYP1vAF2Psn9o9397Ztb1/RKx/S+dsg74qeigvIUpON5wDe96 A==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="184556322"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:40:07 +0800
IronPort-SDR: BYpirgh/mQpcdr2gp5ZXrm3gSOy1da7m8H8W0JiCezMoPt6FYLZmp/AjHTeHs+cQDuVYPuxHIw
 nux6x8L/FbD5oWSb4OR7EYSNHkvcTcE2TfiVsfNQZSGQ29aVl64pt9Xj2+dv44BXZJWBeotUEP
 wy+ji+FXBnZOKQlKD8Q0p27UZKnEgHZbQRinYe4052oLREsiz5+Ml6lfRjbP4yj4SuL3KBMN9k
 LCeq6JaqJ5Y26gTib9MQZ6Knbh3SpWDGCIcnvT0aowFxHpH0+k8+Fc+9TCb1oRlKPwI93Ot5Ru
 q6H88OhU6PSHeLISj2FwoaIf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:15:41 -0700
IronPort-SDR: bBaaoMDPqJU4Q/PbWwZjCkOXFbbd99XSa05YNKG1c9ybc4JD3WOwdS7oOicaRqPRT3PaoDwEJK
 GLMZhWtoCCPFx+D1bLRfOGNpt29Ifd9QzXCCN/xh8tKaZ+LzV8QkNgwOT5mJLk80rrJ9mjTl0z
 xMNgjruhmQqxMpLWRQGCMKceJxvQ8t3Z5cbWgjc9oZ8vJM5mnqKxDMRQB09IuwDDcV43QtDNDq
 7OcmmoxjM4W0pFUVH+eFjtmlbm9c9ILtTGpqePx5e7eIXJKDdElVoO6sSjem+tii9N43BPte62
 Y5Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:40:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQT22WT4z1RtVm
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:40:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910005; x=1637502006; bh=C84ZQjMLJZ9ncphVsk
 N1oKWmyWx4zQATr9d7mAt+hyw=; b=XGaH7CmHYyK5R1Pp9Sgkm9ifMNG+M0Gusq
 L1icjiAD5wGYfZfoZDeB9Sge2H52sSwtXnQuxPlonESZeozVEPzjPXuF/vfc6Oez
 kPtcvllDPj6m0/sUW2ufVH9tnyh4OYdZzsb03bUN3qv2uYPu6RZjAT2X97vbOZrL
 v9UgkTqy1L+9L2HSiNIfiKumgeIvJRLEIE9kApSp2xJ1aV9j5y3P73fN8v+0aiYA
 rGF8m1osyKzfcULCNr1juYufIS1V7W9/1vPftmvWoQAxPKMtkgnFze+o4PA/dt0C
 SqdID5Y7xwSdEiYaWsuQRH2UHx6Om7/sNXUDjKstC8ki2gbX4XQw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id dmlYkQoMBL3W for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:05 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQSx5vhnz1RtVl;
 Fri, 22 Oct 2021 06:40:01 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/33] target/riscv: Use gen_arith_per_ol for RVM
Date: Fri, 22 Oct 2021 23:37:56 +1000
Message-Id: <20211022133812.3972903-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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
X-Mailman-Version: 2.1.23
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

From: Richard Henderson <richard.henderson@linaro.org>

The multiply high-part instructions require a separate
implementation for RV32 when TARGET_LONG_BITS =3D=3D 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-11-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 16 +++++++++++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 26 ++++++++++++++++++++++---
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index afd59ef690..cb515e2a3c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -403,6 +403,22 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, D=
isasExtend ext,
     return true;
 }
=20
+static bool gen_arith_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ex=
t,
+                             void (*f_tl)(TCGv, TCGv, TCGv),
+                             void (*f_32)(TCGv, TCGv, TCGv))
+{
+    int olen =3D get_olen(ctx);
+
+    if (olen !=3D TARGET_LONG_BITS) {
+        if (olen =3D=3D 32) {
+            f_tl =3D f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_arith(ctx, a, ext, f_tl);
+}
+
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExten=
d ext,
                              void (*func)(TCGv, TCGv, target_long))
 {
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_=
trans/trans_rvm.c.inc
index 9a1fe3c799..2af0e5c139 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -33,10 +33,16 @@ static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
     tcg_temp_free(discard);
 }
=20
+static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
+{
+    tcg_gen_mul_tl(ret, s1, s2);
+    tcg_gen_sari_tl(ret, ret, 32);
+}
+
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
+    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w);
 }
=20
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -54,10 +60,23 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2=
)
     tcg_temp_free(rh);
 }
=20
+static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t1 =3D tcg_temp_new();
+    TCGv t2 =3D tcg_temp_new();
+
+    tcg_gen_ext32s_tl(t1, arg1);
+    tcg_gen_ext32u_tl(t2, arg2);
+    tcg_gen_mul_tl(ret, t1, t2);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_gen_sari_tl(ret, ret, 32);
+}
+
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
+    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w);
 }
=20
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -71,7 +90,8 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
+    /* gen_mulh_w works for either sign as input. */
+    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w);
 }
=20
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
--=20
2.31.1


