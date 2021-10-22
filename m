Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB54F437893
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:59:10 +0200 (CEST)
Received: from localhost ([::1]:41186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdv4e-0002Ed-HN
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumU-0001hf-0N
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:22 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:64491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumQ-0001Nq-Fg
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910018; x=1666446018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TUoz6MM0riwXJiwPWUxO3Fkw9oaATPa48MO1HdT5yLs=;
 b=T2noL6VDN1SW06YZ2mxTSWGLY329mzVo1L2TIddzFycHUxVNFHJ+P8M5
 T8ooRjwmwPRF8l+W5MyCufsdMMae8NZJlGfhhXTeRyMfKr4BEcybS9SSr
 9aIpbype0eKpyj6qKVQ2RV5HJUdoIzOvbj2QOItpjtuH1oSs2uyDtjjTm
 tVGXg4k5x9lrtI7UAtaC/eSFB368gHCDx2UiIaH/8SD9s6qqN/L5HWrrc
 XCpIi2+TSGd88XcSCdRbYhxMVPJNI7Cka0vcN9WWbSty+Hy1eDx2T/noU
 4q2ASgQn2PScalJHvhQiMedlQaWzxX/WEWBLQfbfinyvASzdSeh8w3v0b w==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="182632632"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:40:17 +0800
IronPort-SDR: SWlF7fdLyC9zZb12XKko2GaxxLOOg8jhNbCb9I5VMHE1xfI1nJ/srxhRLEUfxVVL83lacFdvot
 nS92Y71D+Fk1Rt//iso4/WkBC+YFU/2Kc8GkfM7RmAeQ+NLwDr9fg2BndQKQ/PBscyXe/wweH4
 9pU3k/AgeIEZZnefCSLqt9xdB10FZkUCEHkhbOdaWODeLx3RYz6hHLBoOjhoro3y4jS6WpaTfh
 bq/XM1ool306QTIwT0WYe8tl4RgXdUeV/n9MOqNoF0Z9bIp7akYjOqCB12YkAB3sfwqXzB+9ut
 JAay2GY0QD4JOxL8X7RilCeY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:14:19 -0700
IronPort-SDR: B8VJtWWnqYd/9qF4lRp1gbJ/NdVysuE8DFCsfqo8OeBsO19Vuw3wX3oGtd9DLgHUkWoBOCHKuu
 nUh4yCxdT231jtr2jvgfxUU0XoB4ZRQLWz6CQ3PB3xN5HnnIMKyjaEXqBLSwb+3PvsgygpPf1N
 w+IjlrFm4OkHFNl+EGiYLV9QbZXBVBAiOWYSLmdBkf7wIFe6Qiz2PnZ81JFs2fCHDFmtaQhJ61
 3bziM+762m9qAxv6sr2mmkb/lJhIEgqm3jssuzewCIsWpiS0x37GsnYfoA/54ULUXS7/wSdr0C
 4TQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:40:17 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQTF02dFz1RtVt
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:40:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910016; x=1637502017; bh=TUoz6MM0riwXJiwPWU
 xO3Fkw9oaATPa48MO1HdT5yLs=; b=WOpRbcJkDnrmZn4wAmXr4pIOkS0Ld1TAyA
 TrY2qGaq7hZXkKEOofRSVf1svvHsW39iUPja1f1lN8YhtRO6YlL9lJhCtDL2yJ6G
 kdfyG9trsBMgi8rhN9uwHzQyaM74jcV72r7KAxIQHprmvd/wLnjWnTLoQTAWFvdf
 K2pfV9uTBPTqFkop0qiJzbY/kvtm2BqBlr7Ky1HAAfwdBnWaNjhbV4KV42bkJhkw
 NWGld2hiXnYMzSiq4C2VKbQoDpd4oOnn0OwDo0LcqlUDFDd8p9+iwGNrlgS0AO4o
 TP4IRmEJmq23gzkXMscbOKmQxFjMO/pViS57mOdarpd2sqbykYYQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AFwoGCLh_bO9 for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:16 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQT82lNQz1RtVl;
 Fri, 22 Oct 2021 06:40:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/33] target/riscv: Use gen_unary_per_ol for RVB
Date: Fri, 22 Oct 2021 23:37:58 +1000
Message-Id: <20211022133812.3972903-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

The count zeros instructions require a separate implementation
for RV32 when TARGET_LONG_BITS =3D=3D 64.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-13-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 16 ++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 33 ++++++++++++-------------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index cb515e2a3c..f3a5870ad0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -486,6 +486,22 @@ static bool gen_unary(DisasContext *ctx, arg_r2 *a, =
DisasExtend ext,
     return true;
 }
=20
+static bool gen_unary_per_ol(DisasContext *ctx, arg_r2 *a, DisasExtend e=
xt,
+                             void (*f_tl)(TCGv, TCGv),
+                             void (*f_32)(TCGv, TCGv))
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
+    return gen_unary(ctx, a, ext, f_tl);
+}
+
 static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 {
     DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index d6f9e9fc83..4eb41756fa 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -47,10 +47,18 @@ static void gen_clz(TCGv ret, TCGv arg1)
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
 }
=20
+static void gen_clzw(TCGv ret, TCGv arg1)
+{
+    TCGv t =3D tcg_temp_new();
+    tcg_gen_shli_tl(t, arg1, 32);
+    tcg_gen_clzi_tl(ret, t, 32);
+    tcg_temp_free(t);
+}
+
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_ZERO, gen_clz);
+    return gen_unary_per_ol(ctx, a, EXT_NONE, gen_clz, gen_clzw);
 }
=20
 static void gen_ctz(TCGv ret, TCGv arg1)
@@ -58,10 +66,15 @@ static void gen_ctz(TCGv ret, TCGv arg1)
     tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
 }
=20
+static void gen_ctzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ctzi_tl(ret, arg1, 32);
+}
+
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
+    return gen_unary_per_ol(ctx, a, EXT_ZERO, gen_ctz, gen_ctzw);
 }
=20
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
@@ -317,14 +330,6 @@ static bool trans_zext_h_64(DisasContext *ctx, arg_z=
ext_h_64 *a)
     return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16u_tl);
 }
=20
-static void gen_clzw(TCGv ret, TCGv arg1)
-{
-    TCGv t =3D tcg_temp_new();
-    tcg_gen_shli_tl(t, arg1, 32);
-    tcg_gen_clzi_tl(ret, t, 32);
-    tcg_temp_free(t);
-}
-
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -332,17 +337,11 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw =
*a)
     return gen_unary(ctx, a, EXT_NONE, gen_clzw);
 }
=20
-static void gen_ctzw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
-    tcg_gen_ctzi_tl(ret, ret, 64);
-}
-
 static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
+    return gen_unary(ctx, a, EXT_ZERO, gen_ctzw);
 }
=20
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
--=20
2.31.1


