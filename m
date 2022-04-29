Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC98514183
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:43:50 +0200 (CEST)
Received: from localhost ([::1]:51890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkITt-0004rp-6s
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIh-00078n-Mm
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:15 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIf-0002SM-PU
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206732; x=1682742732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uA+R1gy+RMF7Jh22UZwoPSc+KJgLha7/VNzMBrOthTA=;
 b=Db9LVmmU8rqY/GJucIDgPePn4MYcPnFoi1a8jBDco1tmV9Md7nnmfsP3
 rkQA11ha6PUxfs+PBHi0Imu+jesKoAo/ObQPSSFMCeOv5LwAV35NVvnIO
 19ITZqdWZX01/dX+8heSj0AzwXRWx9wGFQuFE3jKY9oDwaZv/ZaSzvp+B
 zVsZd2DUGkr5CtIq5XKRY+IJt8id7QwwM+/qTEALZph9odNuT7Sq/C43v
 EXOQFUOUe8bA/8cnNJpOWXXrZDGQIyf6pxVXc1KXQq3QRfnsoYyuyQQi7
 ISkw6Bcp/XCFUeflmb1/vB2nr/P7WT6b0B916lHncnextyz/Y5KuAXrx+ g==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995941"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:11 +0800
IronPort-SDR: a02DJB7OkRve6WpI6+6ZTKYwoz2wdeYsqXF08CGDqGuf2n41U/qipHb1OSYiATxMdaz2Ml+CV6
 MFb6R0ZzLYjF1y6GTc4sjRH6VoMKzkFWQGKku5ptsHWm5sVLfHuLq2hAx05zKWJ8vPut+54ggd
 iJdFVpMdz5azxVZWVTAfexULbM98Zdrzw7tPI7Dc0AwoLKSauyxhRL9Khwaq1ueyON+Mv474TY
 OfM3LQ0g2NfVGo0jtQoWRHF+p5NBRJ7PEDOibG7cENU/6oaXTVB3DNMax7QBuCqrPhGPK1lFnn
 lsx8/orskHxgwuoqIQ2+LF5w
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:21 -0700
IronPort-SDR: OyeGbdO9l9D+IUG1FYztRPqBjcZjJja2sG0D4KXM6gVjxoQEmM6sCSslkvHTH6sjJ8WTKkoOXk
 8aswAjkaLakuloCIaygv3oSfv0T4bgwpP5K8Kebq7oGO8slmYKwfAQMWpqhzfIr1i8vELZs9Vf
 TCuk1uhzW7MuP7fJLW48YYoWNUEl4v9LXUNYZin7GCi0L7GXAsrvujPKcQXcQUiN32DHoFLE1F
 6nOz3ntUZge9wr6750OQMcO3VMTb50x52VLbIXDtFRdKq5GvAd9uT5PBMgNbOo+5JpVFbJDHVF
 jKw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMc4XVdz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206732; x=1653798733; bh=uA+R1gy+RMF7Jh22UZ
 woPSc+KJgLha7/VNzMBrOthTA=; b=SL8KeSyYN/pB5dSkmqLAu1VgrU6hllSQ4M
 G5iyry6izto6OjqgAHVLJZ0iw1C4QsKaFxjFijwxwdPXWyx63jVkIG5F2HI35Ehu
 /UclM+azNt7lqLBNNi41nXTjVbtOlhn8sv6fYdwosFxj4uoFTE4HOaM/LkLEP5b2
 Qr8ebjcX/zr47CejDFqYRKusVyiYo2pggCAYM/oyKGl9XmA1q3ENEGFcyyHrhNKO
 ox9DNZMqKRCOfu2ZH/V8FcU1VBQRviGk6vk5fl88KKjLfE8PnDy56YJjUZ5RkXFu
 +4c3HCWkPBRlrzEtInkxZaW4NHjfPSKloaxaQy6dt7C5yHAT+jJw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QF5iaivhXEXn for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:12 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMY0LZ6z1Rvlc;
 Thu, 28 Apr 2022 21:32:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Zewen Ye <lustrew@foxmail.com>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/25] target/riscv: rvk: add support for sha256 related
 instructions in zknh extension
Date: Fri, 29 Apr 2022 14:31:05 +1000
Message-Id: <20220429043119.1478881-12-alistair.francis@opensource.wdc.com>
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

 - add sha256sig0, sha256sig1, sha256sum0 and sha256sum1 instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423023510.30794-9-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvk.c.inc | 55 +++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0b800b4093..db28ecdd2b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -857,3 +857,8 @@ aes64esm    00 11011 ..... ..... 000 ..... 0110011 @r
 # *** RV64 Zkne/zknd Standard Extension ***
 aes64ks2    01 11111 ..... ..... 000 ..... 0110011 @r
 aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 @i_aes
+# *** RV32 Zknh Standard Extension ***
+sha256sig0  00 01000 00010 ..... 001 ..... 0010011 @r2
+sha256sig1  00 01000 00011 ..... 001 ..... 0010011 @r2
+sha256sum0  00 01000 00000 ..... 001 ..... 0010011 @r2
+sha256sum1  00 01000 00001 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_=
trans/trans_rvk.c.inc
index 6336b48cb5..531e2c7cb3 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -29,6 +29,12 @@
     }                                           \
 } while (0)
=20
+#define REQUIRE_ZKNH(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zknh) {              \
+        return false;                           \
+    }                                           \
+} while (0)
+
 static bool gen_aes32_sm4(DisasContext *ctx, arg_k_aes *a,
                           void (*func)(TCGv, TCGv, TCGv, TCGv))
 {
@@ -123,3 +129,52 @@ static bool trans_aes64im(DisasContext *ctx, arg_aes=
64im *a)
     REQUIRE_ZKND(ctx);
     return gen_unary(ctx, a, EXT_NONE, gen_helper_aes64im);
 }
+
+static bool gen_sha256(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
+                       void (*func)(TCGv_i32, TCGv_i32, int32_t),
+                       int32_t num1, int32_t num2, int32_t num3)
+{
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
+    TCGv_i32 t0 =3D tcg_temp_new_i32();
+    TCGv_i32 t1 =3D tcg_temp_new_i32();
+    TCGv_i32 t2 =3D tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t0, src1);
+    tcg_gen_rotri_i32(t1, t0, num1);
+    tcg_gen_rotri_i32(t2, t0, num2);
+    tcg_gen_xor_i32(t1, t1, t2);
+    func(t2, t0, num3);
+    tcg_gen_xor_i32(t1, t1, t2);
+    tcg_gen_ext_i32_tl(dest, t1);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+    return true;
+}
+
+static bool trans_sha256sig0(DisasContext *ctx, arg_sha256sig0 *a)
+{
+    REQUIRE_ZKNH(ctx);
+    return gen_sha256(ctx, a, EXT_NONE, tcg_gen_shri_i32, 7, 18, 3);
+}
+
+static bool trans_sha256sig1(DisasContext *ctx, arg_sha256sig1 *a)
+{
+    REQUIRE_ZKNH(ctx);
+    return gen_sha256(ctx, a, EXT_NONE, tcg_gen_shri_i32, 17, 19, 10);
+}
+
+static bool trans_sha256sum0(DisasContext *ctx, arg_sha256sum0 *a)
+{
+    REQUIRE_ZKNH(ctx);
+    return gen_sha256(ctx, a, EXT_NONE, tcg_gen_rotri_i32, 2, 13, 22);
+}
+
+static bool trans_sha256sum1(DisasContext *ctx, arg_sha256sum1 *a)
+{
+    REQUIRE_ZKNH(ctx);
+    return gen_sha256(ctx, a, EXT_NONE, tcg_gen_rotri_i32, 6, 11, 25);
+}
--=20
2.35.1


