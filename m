Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440AD545B26
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:34:00 +0200 (CEST)
Received: from localhost ([::1]:55200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWLP-0005d4-AS
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWF7-0002uW-0z
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:29 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:63226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWF5-00011T-2U
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835247; x=1686371247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hIClZIj3GRoe78HKmfdLbhCryYl8YTCWHAYWHqtTS68=;
 b=Day42+TwG2xtL5+ty4LVZ8o2ea5v6PjiQZCdo3rHZR5507kEXe7Ckg39
 sztTQ8omzzEDwq+GonkAu4skEKu5xP8p/hVnwaiO/ew950BSViLJyruV1
 xvfGj4P5sjZRNxsAuJhUGMoBnCyvKGbenLko15iHJ/EVYeXyh5JPIVBFU
 8sjzx9f7xdMXwjPcrkC9z0CnoLhRIcMTqfLBjM62HlWOix77JGXl8gXUA
 ifGd0qtJYF3BhQAMhUnAM63Btfue3DkQyloYMSXMvW08pBX//hSIbhPiL
 LnZ93JOBmWju6+d2xIVqTd0jQ9+rnN+cbkl/RlkHQiSptE54Cqdwkb2vo g==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="307046424"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:27:25 +0800
IronPort-SDR: bJyr4g0Geb1G8Yv8sg6IIbtTsPdAiPV8BH/tNYmMFUAZuNv+hvoqyXZwJaoaDEnw3ovKUpPj+p
 bD6i1A6f1VmDFRkcBF1qDi/WVOrnYRpQ+HMcE1zgjd48GixJBCvwRyP6Ze/BwVVFteUbRCqHru
 WwGLvdK1hoGsDNy/z64FvEccJqkKIHEF6fxcCJOVJMN9M763PKTLg9XC9psMfmW0EDSpzT1BrK
 z4Sr80GP3+GIn1uDvQI0BEdmXvhq4zELMhMOHhxFC3LUhjv2roM9LLJJj1rUdshU/T/0NOKGHy
 /qNYk2z4sgbT2DYqa2f/Fnnt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:50:34 -0700
IronPort-SDR: kQfqv4bSmXFh6VYxCVr6YZXfTdH14gKBCWxHgfOExFyloi/RUNhesNNTL5zCifGxDZg5WBKlth
 Wi18AQQO3d0CuQxSMxYsKbBA3g9B9xVJaQ0BiAfSkH/llsJayGd43Q/Wscq7kECDrVZ1TrFgvq
 a0U3uQ8JPwR9WeJu36knGz8Hn4oXgpCx6wpxg1m9tW0WcOS4t+QaO7uJglsWoknXPX+lo4Wkt8
 Ikuo+ua4mUnDAxWmWoZNPG+pOkx3GtjcP/pyEwy0fjpneigaNUwX2t6/ATG5HuzgT/fU0awD4p
 Mfc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:27:25 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7Gj3KGqz1SVp2
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:27:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1654835244; x=1657427245; bh=hIClZIj
 3GRoe78HKmfdLbhCryYl8YTCWHAYWHqtTS68=; b=MgaEWMUfS+pOBzB+uYnFxD3
 YKaIffefn1U4NBY7NQ3EYsaaxbkfzssbWypIJH63TgFxRf+/ctl7Nn8NhBN4Ijs7
 FsScCRA5uDs4zpNzMK6mgNJ2y5yVpL6FLlbotzSEBFsxo5dPEHaJmkUoH8P24/eh
 pMH52srODbz8RGWVdqG6zQVpWNPSuItjTkIBCuLTc6nLgArjJrFi5gvrIVu3SnP0
 Vs9Fs5KqSNE5rwea8XrybmSvdxKwARnZVl4CxDQXZff1ZJnyICFVtc3QuhWNicHa
 hmmbAzhGnE/nQK6aHcvG0xn7BbqKSXFV1ZZRNdHNVPW8+rR74c0v1dhiS1x1xww=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ZiiSj5-QRM8x for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:27:24 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7Gd6VVZz1Rvlc;
 Thu,  9 Jun 2022 21:27:21 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/25] target/riscv: add support for zmmul extension v0.1
Date: Fri, 10 Jun 2022 14:26:32 +1000
Message-Id: <20220610042655.2021686-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add support for the zmmul extension v0.1. This extension includes all
multiplication operations from the M extension but not the divide ops.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220531030732.3850-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      |  1 +
 target/riscv/cpu.c                      |  7 +++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 18 ++++++++++++------
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f08c3e8813..890d33cebb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -411,6 +411,7 @@ struct RISCVCPUConfig {
     bool ext_zhinxmin;
     bool ext_zve32f;
     bool ext_zve64f;
+    bool ext_zmmul;
=20
     uint32_t mvendorid;
     uint64_t marchid;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a91253d4bd..bcbba3fbd5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -600,6 +600,11 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
             cpu->cfg.ext_ifencei =3D true;
         }
=20
+        if (cpu->cfg.ext_m && cpu->cfg.ext_zmmul) {
+            warn_report("Zmmul will override M");
+            cpu->cfg.ext_m =3D false;
+        }
+
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
                        "I and E extensions are incompatible");
@@ -905,6 +910,7 @@ static Property riscv_cpu_properties[] =3D {
=20
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
+    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
@@ -1031,6 +1037,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str, int max_str_len)
     struct isa_ext_data isa_edata_arr[] =3D {
         ISA_EDATA_ENTRY(zicsr, ext_icsr),
         ISA_EDATA_ENTRY(zifencei, ext_ifencei),
+        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
         ISA_EDATA_ENTRY(zfh, ext_zfh),
         ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
         ISA_EDATA_ENTRY(zfinx, ext_zfinx),
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_=
trans/trans_rvm.c.inc
index 16b029edf0..ec7f705aab 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -18,6 +18,12 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
=20
+#define REQUIRE_M_OR_ZMMUL(ctx) do {                      \
+    if (!ctx->cfg_ptr->ext_zmmul && !has_ext(ctx, RVM)) { \
+        return false;                                     \
+    }                                                     \
+} while (0)
+
 static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, =
TCGv bh)
 {
     TCGv tmpl =3D tcg_temp_new();
@@ -65,7 +71,7 @@ static void gen_mul_i128(TCGv rl, TCGv rh,
=20
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, gen_mul_i128);
 }
=20
@@ -109,7 +115,7 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
=20
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w,
                             gen_mulh_i128);
 }
@@ -161,7 +167,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv ar=
g2)
=20
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w,
                             gen_mulhsu_i128);
 }
@@ -176,7 +182,7 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
=20
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     /* gen_mulh_w works for either sign as input. */
     return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w,
                             gen_mulhu_i128);
@@ -349,7 +355,7 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a=
)
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
     REQUIRE_64_OR_128BIT(ctx);
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     ctx->ol =3D MXL_RV32;
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
 }
@@ -389,7 +395,7 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw =
*a)
 static bool trans_muld(DisasContext *ctx, arg_muld *a)
 {
     REQUIRE_128BIT(ctx);
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     ctx->ol =3D MXL_RV64;
     return gen_arith(ctx, a, EXT_SIGN, tcg_gen_mul_tl, NULL);
 }
--=20
2.36.1


