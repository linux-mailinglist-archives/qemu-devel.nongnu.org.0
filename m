Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A493147A42E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:03:43 +0100 (CET)
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzApq-0002rn-No
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:03:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAk7-0008Ff-AP
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:48 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAk2-00081R-Uu
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976262; x=1671512262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SJKBj4XtqJK1wX8vii0WQA6jyVDHsSMgfHQfRKym2CY=;
 b=C7SQt/NCecayoDxd4Z8PhAP9MQRnxhqWKChlFmVeHCjONmtbaaEgf+X5
 /6N5RWcfojMp6GqpNQn384YhgH3wBBT/OjHfrQ3U0YoTnFqF8GJuWspo9
 h9wcpWOsa4igtzncwrTxwwtLmVURK47lmuHpwL3+ZanRRcI5yVsp+4KV8
 vnWua38DbBOKWmZ3TLqGTmcft2al/OfiYZ6MQDAqjRxSKUgazl6yV/sFc
 XDx0eHxlTOSrbN/ohOssleaLNV1SHy3owZ6VhexvS3aCfkbYbtOFioC/8
 aKhT76jVc2U+dVyFi1muRrhI8dxC+PZAB5L7cYlClmn+T/YQDyo820+6y w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661877"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:57:41 +0800
IronPort-SDR: q+eWAKeAkIWbWSVYmsCx9nvrfA3kuVsPjBr0LOmORRsEQsgQTnIZSZMph+s9xZL03+Ko3+nEkd
 R2Y7ESDRR8E/s5L6ni0pZpNUDgzngQO5OP8E1NEX7GYj8vbAVa8gR8w5t0RezGEYOVz0Ih1sEl
 dVqPV8f8IAkHis8CmphtMXjqN37EcYBQRDJ6d53aqeb5dHw863MPAftquP9JcYc/geN5xSNo1M
 oy8elRXC6Zc56etvrZU9QFfMBf1DTeAqlHC6mce1NGmWUoGho6NI32U/RNgKJVeArOmrgrbSFX
 q4w5KCWpJdVGe5VdV3L6chqi
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:30:30 -0800
IronPort-SDR: mEe5jqV1IBV1OYknGf+97gCXzVCxI5JS+79sZGafPrhjWjVKA/NTJuUj09kcOz+tsAQdm3W+7E
 qz3spLhrL1+VUyt6d0mrPR72cBt1ZS8uoVuUx6NP1e0MM2mYI8TDHYV/oTu+sxlZSmEbrJa/ao
 eb/MgTTEJoZv7X73rvlV1M2XrglJKSCdeXW60N8Bi0V4eXxk5j6ojSjFXnjdNufuAK+NklzYfZ
 2bE7WthyS9VcdOQYunUcbGmF1vsIy2RlReEwTxUUQk/a4/Wv4NQN1j9NPR2YHT8ItmH1U1I+9p
 EaQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:57:42 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS511XZzz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:57:41 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976260; x=1642568261; bh=SJKBj4XtqJK1wX8vii
 0WQA6jyVDHsSMgfHQfRKym2CY=; b=DIKJUUASLfVl10k4qByt1i59qJ5glichum
 OogHxybQ1wWUaNoHARr9HEmxbRrkF2mhbMaezM5QDiVto4p6eirYENY4sXTMCGtA
 n1zHejgVICNpY19b3mRB6zGTDYqqN+c4LxOjZz3AtThG5yvWcrAjZ1YSDqW8PKOW
 QduPMccSS4tInihM0LN7vIR9tswkKadpbCC1vEZbgBhQO+AIK7dQGtWJyOGHemyp
 NN8eA7n06hfuxDZci9p2SlPNDva1xAKankmMPvvoceAfDstmerVGXolBEZF54JFE
 fvcu3LZF4b+Lenj27y+Z54biJhVnpSCMSSBRYVhjDvu5f4m0Ph9g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5DJ4BJQv6gud for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:57:40 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS4w6KC0z1Rwvd;
 Sun, 19 Dec 2021 20:57:36 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/88] target/riscv: zfh: half-precision floating-point classify
Date: Mon, 20 Dec 2021 14:55:42 +1000
Message-Id: <20211220045705.62174-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211210074329.5775-6-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                     |  1 +
 target/riscv/insn32.decode                |  1 +
 target/riscv/fpu_helper.c                 |  6 ++++++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 12 ++++++++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9c89521d4a..d25cf725c5 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -89,6 +89,7 @@ DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env,=
 tl)
 DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
=20
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3906c9fb20..6c4cde216b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -754,6 +754,7 @@ fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
 feq_h      1010010  ..... ..... 010 ..... 1010011 @r
 flt_h      1010010  ..... ..... 001 ..... 1010011 @r
 fle_h      1010010  ..... ..... 000 ..... 1010011 @r
+fclass_h   1110010  00000 ..... 001 ..... 1010011 @r2
 fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index ec2009ee65..388e23ca67 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -482,6 +482,12 @@ target_ulong helper_feq_h(CPURISCVState *env, uint64=
_t rs1, uint64_t rs2)
     return float16_eq_quiet(frs1, frs2, &env->fp_status);
 }
=20
+target_ulong helper_fclass_h(uint64_t rs1)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    return fclass_h(frs1);
+}
+
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 =3D check_nanbox_h(rs1);
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/ins=
n_trans/trans_rvzfh.c.inc
index 8d0959a667..0549e25fb4 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -372,6 +372,18 @@ static bool trans_fle_h(DisasContext *ctx, arg_fle_h=
 *a)
     return true;
 }
=20
+static bool trans_fclass_h(DisasContext *ctx, arg_fclass_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
+    gen_helper_fclass_h(dest, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
 static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 {
     REQUIRE_FPU;
--=20
2.31.1


