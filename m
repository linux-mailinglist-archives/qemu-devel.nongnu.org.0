Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0613D514189
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:46:43 +0200 (CEST)
Received: from localhost ([::1]:58596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIWg-0000y9-56
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIp-0007W0-3M
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:23 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIn-0002Vn-7A
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206739; x=1682742739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vVuOVaTp/eX+Kx9A4dh7mKk3MMTyuWhxoPhKHqudIjg=;
 b=o5Y6NsO11d2Dn6p5aIdALCVg/OznXV8UGkw3SmI4/2ibC3pubjPEA3JL
 WOs80p1Jk6li3foF8O0zIkd6hKKGJSXY9GaiMFfT77N3igzgu8R0fwzVH
 fL8mJusWvyTkCf+w4x3sD7+q1nfKlQz/lUywumiw/Fk9hpwKQ4Mq9OQ1y
 XvoW02Eeaz5LVEedUOFW85FrXIF1kDYcTY+NU2yRbwXQT8y8QsQsHhJCv
 sOYh2xUFDeb9lLbjpg8bpi2vUaTCjxPbyZrt0lSbVYRUbJYbFkxuF9YTg
 TRApSlxq0uiNVfsmF0GU36ss3EZx6/CgUJ55poSHdyselPO6u1JUj2cG0 Q==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995952"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:18 +0800
IronPort-SDR: Y+CIwBRhNoL4/J/04iW45bs5R9T5IM2SIHCerwi76UKFvjylSqCcI59eP5PJq2ktBoPZrEqk5a
 5x9EtnRB1ZHpEmyZQzp5z/mTHLq28EMOVu8AtS2nWU6F1uiZEFFgNZHFhi+OCrHkUs21h9qeXc
 fHETh6g4/EOVu3UrSXSfCjAtjUp/thhvApzpjwQcwA7UqDaQTF1MXxM84xUFUAV1IdyVhqE+4R
 roKdsaXoR+RI74DmSdnhXGR4wk/JIFbmJ/SVSUvikryDx5uKZ5ZQUEW2uhmVGLXQponqjeuJKd
 vzdpEMtE73pIjdS+Yde1uHPD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:28 -0700
IronPort-SDR: t0banvfVH/czjfP4HkwRNwFkQW2U+hEtfuj0Oe6q5l1WDvJP7bJzwICPq9YUm967Pr4D6eqNbr
 h2A+hiwOY/dnDRAftUyz14jBN4LzfHOBXI41YHS+x+pgZcSyq//UClfd/4+961WdIZOfBKK4Gp
 8JQqSNSg6YkEzDgQorX4AOelsvht1+rL1OjXeJIH5DqpbArkgazFyHEoOLFZJ8OumsNECN6IN6
 +szQANkqlKbQTM4HbW4sOvTGVh9Y+D3VEy6Gq6vroYVQW4pHBOYTnRqM6usPJuKZEi1tJ2/Fly
 VEI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:20 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMl6P0Cz1SVny
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:19 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206739; x=1653798740; bh=vVuOVaTp/eX+Kx9A4d
 h7mKk3MMTyuWhxoPhKHqudIjg=; b=ZzTIFf/9h+XJ0cdUWYN2fBkoM7pLiaUfTl
 ZrhZEMcMCPpx1K860CKZO3c67671hr+G03CLQ/df7BMWIloBGBGOftxaBAA6sJKe
 5y8RGnBK6S0f6qZwHNQDEbPEzyq2v45g3GHzj1FiSzWebUnCZJIALGHmCdfqry08
 nAvVlHJL3QJaeozb9m7snpbWBjEBxr/YymRUInTI2D5/RHvYJB+lBaz+nsFqUPu3
 BMuPuuZliyDK6uzFtqj2LCciPfKqmR8493xsOYwHEy8uFXfRJ+xN6yYv1Ll8cQTv
 scp9uzDw4NYm+GdaHTcEQiU6i8QGOFhhEqHvrFcuutYwpsSYzBRQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ndhAhM3DD8Vf for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:19 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMh21vYz1SHwl;
 Thu, 28 Apr 2022 21:32:15 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Zewen Ye <lustrew@foxmail.com>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/25] target/riscv: rvk: add support for sha512 related
 instructions for RV64 in zknh extension
Date: Fri, 29 Apr 2022 14:31:07 +1000
Message-Id: <20220429043119.1478881-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

 - add sha512sum0, sha512sig0, sha512sum1 and sha512sig1 instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423023510.30794-11-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvk.c.inc | 53 +++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 02a0c71890..d9ebb138d1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -868,3 +868,8 @@ sha512sig0l 01 01010 ..... ..... 000 ..... 0110011 @r
 sha512sig0h 01 01110 ..... ..... 000 ..... 0110011 @r
 sha512sig1l 01 01011 ..... ..... 000 ..... 0110011 @r
 sha512sig1h 01 01111 ..... ..... 000 ..... 0110011 @r
+# *** RV64 Zknh Standard Extension ***
+sha512sig0  00 01000 00110 ..... 001 ..... 0010011 @r2
+sha512sig1  00 01000 00111 ..... 001 ..... 0010011 @r2
+sha512sum0  00 01000 00100 ..... 001 ..... 0010011 @r2
+sha512sum1  00 01000 00101 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_=
trans/trans_rvk.c.inc
index 9ed057a153..8274b5a364 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -278,3 +278,56 @@ static bool trans_sha512sig1h(DisasContext *ctx, arg=
_sha512sig1h *a)
     REQUIRE_ZKNH(ctx);
     return gen_sha512h_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64, 3, 6, 1=
9);
 }
+
+static bool gen_sha512_rv64(DisasContext *ctx, arg_r2 *a, DisasExtend ex=
t,
+                            void (*func)(TCGv_i64, TCGv_i64, int64_t),
+                            int64_t num1, int64_t num2, int64_t num3)
+{
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
+    TCGv_i64 t0 =3D tcg_temp_new_i64();
+    TCGv_i64 t1 =3D tcg_temp_new_i64();
+    TCGv_i64 t2 =3D tcg_temp_new_i64();
+
+    tcg_gen_extu_tl_i64(t0, src1);
+    tcg_gen_rotri_i64(t1, t0, num1);
+    tcg_gen_rotri_i64(t2, t0, num2);
+    tcg_gen_xor_i64(t1, t1, t2);
+    func(t2, t0, num3);
+    tcg_gen_xor_i64(t1, t1, t2);
+    tcg_gen_trunc_i64_tl(dest, t1);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+    return true;
+}
+
+static bool trans_sha512sig0(DisasContext *ctx, arg_sha512sig0 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_shri_i64, 1, 8, 7);
+}
+
+static bool trans_sha512sig1(DisasContext *ctx, arg_sha512sig1 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_shri_i64, 19, 61, 6=
);
+}
+
+static bool trans_sha512sum0(DisasContext *ctx, arg_sha512sum0 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 28, 34, =
39);
+}
+
+static bool trans_sha512sum1(DisasContext *ctx, arg_sha512sum1 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 14, 18, =
41);
+}
--=20
2.35.1


