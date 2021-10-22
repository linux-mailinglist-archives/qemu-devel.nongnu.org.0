Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD1437873
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:54:54 +0200 (CEST)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdv0X-0001gg-9Y
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumY-0001n9-VA
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:27 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumW-0001Qs-JO
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910023; x=1666446023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5kMdTeCvBsa3k7CM+RKKt2ZHdP1vD9O2pkGibwmxjiY=;
 b=e+XtIcm2Rj9+XrpqWAlL8D4Gwx9HJjHiU7+iMKTEgfm4/4qkAQf0vZsp
 yqjom2Y1J3tIKM5COsUPikxwAx3MU35PPHsLTEyug9Atbu1FiVkVI/pfR
 6CYRmh/CfTZXcMNHD/qJbRjhNF8De8hqBqON2BqAdUAvLIcBjU+fejPCS
 IvmFfDcFCJhpVnIu4b3cFz1Dez0W1IJBiNwOsYInTzifNHGd3fzriPzcf
 Xqz5XTOPi9fkM/Qo/q79GZNC4ELBfFtX61LW/Vu0lDmMkS5zSeyC3Hmol
 +cB4o018CeZ54fymqPANlVIHFzi8ae1/2vdJBM+34jkQwt1K2c3TndKFp Q==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="183617887"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:40:21 +0800
IronPort-SDR: 42lw84A79B3jsR1lZZuBxBNXoOBLh8xWOC4jHOfNqmkF8cn+hAcSvsrNM2E1XF1embbQqy5+bB
 Rfyodd1PmL9tP263cXOWJCbjDTShglOi6wCb/mUbZBjjjTHe+fp0SDTTM417JeugWjmwZcmwud
 HUiAqPlqH3ll6wrzvaWSKmslSAfANSS3GBE7pdsa3JExXf3Vn6E7kfzLHMESUavLai1AvmCSdh
 m3WYShBcu2trpK+6D4t7XEr/rpMWaZ5uoP95xxHmWc7DCR1Q/YMKaAVlWK4BRsuTOF+04KKBJx
 DlH6wUl2ieyj50c0Zkvo9RR9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:15:57 -0700
IronPort-SDR: kl8znKX8E1Dny5O1Cgp1JI0I+vLV7V9DO7ife3qcSgzp/iuRvoF+nY223p6SsTgvDSEC5TAKwr
 B9G+ce4rzbdhOV/oQmJxmqmaDgo3WH+5lpF+pwCIFSRR0X3oVLu5tgoBXYLM2VDuWpuSAVDQ9P
 946UgzPZy2cKQbzeUDNCgUX+iUc2ATgqFvQNJN62jFmcmVk/wJR3/DGk63YH0vGPnrycJhmEuU
 X7wsgbVnwHP8Bt3R36hUsfQe0nH1RxrgTjYWo2srp/h+SSbYcPoYXHYWEwq2XnU6uTnjkl29v8
 OJE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:40:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQTL2kfZz1RtVn
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:40:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910021; x=1637502022; bh=5kMdTeCvBsa3k7CM+R
 KKt2ZHdP1vD9O2pkGibwmxjiY=; b=GYF2ntz5M+fJ7tn7kwfKgW9ERhz2EQQsam
 LH6rLcicsepVH1PcG1zfhplxqd1kmP8MqFRKM1yf10EdDylURHGBST9up41TAYtU
 kbMC5is8ITlhJTX1IHf39e9n1/Q1E9w7NBafNRI6ZzmsCkP6V5RmAbr1GQGCSm/Q
 yO2/5fpLu9PIBeQrtAm+wYNSEd38nBL/xslHqYcf/1a8GNe054jAVNHXQHzd4NGo
 T6SlSw5hICaHo2/a1tTr8jFW+GsVmUWyZWECOL/dEunhnAvYRM8Ij6QBlaQtN3Um
 XKWA6Fo94A7OmHkgrj2vJIdSaNmqsqzhi/mMnS1hLyJxKxmQlraw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1Jh0RxgJORVL for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:21 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQTF4MVWz1RtVl;
 Fri, 22 Oct 2021 06:40:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/33] target/riscv: Use gen_shift*_per_ol for RVB, RVI
Date: Fri, 22 Oct 2021 23:37:59 +1000
Message-Id: <20211022133812.3972903-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

Most shift instructions require a separate implementation
for RV32 when TARGET_LONG_BITS =3D=3D 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-14-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 31 +++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 92 ++++++++++++++-----------
 target/riscv/insn_trans/trans_rvi.c.inc | 26 +++----
 3 files changed, 97 insertions(+), 52 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f3a5870ad0..bed1c2174e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -438,6 +438,22 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_=
shift *a, DisasExtend ext,
     return true;
 }
=20
+static bool gen_shift_imm_fn_per_ol(DisasContext *ctx, arg_shift *a,
+                                    DisasExtend ext,
+                                    void (*f_tl)(TCGv, TCGv, target_long=
),
+                                    void (*f_32)(TCGv, TCGv, target_long=
))
+{
+    int olen =3D get_olen(ctx);
+    if (olen !=3D TARGET_LONG_BITS) {
+        if (olen =3D=3D 32) {
+            f_tl =3D f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_shift_imm_fn(ctx, a, ext, f_tl);
+}
+
 static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExten=
d ext,
                              void (*func)(TCGv, TCGv, TCGv))
 {
@@ -474,6 +490,21 @@ static bool gen_shift(DisasContext *ctx, arg_r *a, D=
isasExtend ext,
     return true;
 }
=20
+static bool gen_shift_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ex=
t,
+                             void (*f_tl)(TCGv, TCGv, TCGv),
+                             void (*f_32)(TCGv, TCGv, TCGv))
+{
+    int olen =3D get_olen(ctx);
+    if (olen !=3D TARGET_LONG_BITS) {
+        if (olen =3D=3D 32) {
+            f_tl =3D f_32;
+        } else {
+            g_assert_not_reached();
+        }
+    }
+    return gen_shift(ctx, a, ext, f_tl);
+}
+
 static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
                       void (*func)(TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 4eb41756fa..c8d31907c5 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -227,22 +227,70 @@ static bool trans_bexti(DisasContext *ctx, arg_bext=
i *a)
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
 }
=20
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 =3D tcg_temp_new_i32();
+    TCGv_i32 t2 =3D tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotr_tl);
+    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw)=
;
+}
+
+static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
+{
+    TCGv_i32 t1 =3D tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_rotri_i32(t1, t1, shamt);
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
 }
=20
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_rotri_tl);
+    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
+                                   tcg_gen_rotri_tl, gen_roriw);
+}
+
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 =3D tcg_temp_new_i32();
+    TCGv_i32 t2 =3D tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotl_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
 }
=20
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
+    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw)=
;
 }
=20
 static void gen_rev8_32(TCGv ret, TCGv src1)
@@ -352,24 +400,6 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw=
 *a)
     return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
=20
-static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv_i32 t1 =3D tcg_temp_new_i32();
-    TCGv_i32 t2 =3D tcg_temp_new_i32();
-
-    /* truncate to 32-bits */
-    tcg_gen_trunc_tl_i32(t1, arg1);
-    tcg_gen_trunc_tl_i32(t2, arg2);
-
-    tcg_gen_rotr_i32(t1, t1, t2);
-
-    /* sign-extend 64-bits */
-    tcg_gen_ext_i32_tl(ret, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
-}
-
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -383,25 +413,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw=
 *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol =3D MXL_RV32;
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_rorw);
-}
-
-static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv_i32 t1 =3D tcg_temp_new_i32();
-    TCGv_i32 t2 =3D tcg_temp_new_i32();
-
-    /* truncate to 32-bits */
-    tcg_gen_trunc_tl_i32(t1, arg1);
-    tcg_gen_trunc_tl_i32(t2, arg2);
-
-    tcg_gen_rotl_i32(t1, t1, t2);
-
-    /* sign-extend 64-bits */
-    tcg_gen_ext_i32_tl(ret, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw);
 }
=20
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 9cf0383cfb..91dc438a3a 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -268,14 +268,26 @@ static bool trans_slli(DisasContext *ctx, arg_slli =
*a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
=20
+static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
+}
+
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
+    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
+                                   tcg_gen_shri_tl, gen_srliw);
+}
+
+static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
 }
=20
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
+    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
+                                   tcg_gen_sari_tl, gen_sraiw);
 }
=20
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -342,11 +354,6 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw=
 *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
=20
-static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
-{
-    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
-}
-
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -354,11 +361,6 @@ static bool trans_srliw(DisasContext *ctx, arg_srliw=
 *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
 }
=20
-static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
-{
-    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
-}
-
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
--=20
2.31.1


