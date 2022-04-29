Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FF514178
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:37:54 +0200 (CEST)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIOA-00064p-1i
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIM-0006GY-8w
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:54 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIJ-0002SM-Sj
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206710; x=1682742710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e1xD1GmlZLOj4dAGD6oDiIdFtvVRaqqPdQv81bePGJs=;
 b=QkHYK2J7PvFk094iJkvKtTLXvUgoVS9iS6N5Jw2WS1mhheHv6c23tV5u
 hWfvfaMUYtbIl+4yNUZ+hVqysS8HWDekiJRcc2Kv9dZFbSo/doKKuEe87
 GCR7NOfQZE+92jYlhB+9AZAgz7oqNXz6IpfVX3LnEmLzdJF8mMbLrXxMs
 S4Zeus87t+W8ox9QAgRNWgHt84ejWNXR782ZWuq9zLX6qf2Mft5YWkRNb
 MkoG7iN3ksmL0XmntTMPRfUKkNUSQH/dKb/t7YRKLSG/NxnLjVkc8fNgq
 I5Bkyo37aJTjR9WUESXTjHCbBEpIBHJT261cfnLQ54uQ0sRCo3RWOUM5G A==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995911"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:31:49 +0800
IronPort-SDR: BfZkXpId5uVqZIAXlw7ox/Ri3IRJomnwYUSL6vfapEArrBoxcpnKhFe0SzIQtWlYHFcCARCi0s
 5oLybw+WlZyjU66qxAdt7uvZDIAruK87mGGwUxMBrhioE/TI3L5Hq0etaf8qxoUL/rOzyxC3/1
 lqYr3sx+nCdVYgpLED2ieUJawraeJd/ZaD2sGoZfvYXos6Wexnr1tYCHMYpdz1wvH3w7sPkYkw
 LndpeVC4lIRPLmkPb0xa+giPpISJGyI+FQX9qJQM+B03fEdMScDYVj9iznywcXbLNgOIQ88Z1h
 r/Kd11fsUs9cUThrgaEy+3b9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:01:59 -0700
IronPort-SDR: ONLXqU3ecc4M+wtaukL9J6vOJU5TOmYWHpL6B8r7y0+uwdWXoGZg85Utncp2/HhREI8Y6M9XDr
 Q1+EVvTGehJbLHOEJGARXZEPqs/qjSC0mMFxuvk/bZ074+TcOnUwem2aIiLLxbBunTKC/vnwl9
 koCHsAYJgGvpUNZPsbl61XI475LPiKYaXNEG1io4PcZubps0WELDsyE6Oekpyhzoe5MbTYu7C8
 7ddY3epokWrWkF4UUOhIdWSD8ImWXQvzZOxLJ1RrH9aBQlO52Zqe5AC380J5gIlmh+EhRbdYAr
 WHk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:31:51 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMB5Jygz1SVp0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:31:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206709; x=1653798710; bh=e1xD1GmlZLOj4dAGD6
 oDiIdFtvVRaqqPdQv81bePGJs=; b=BvJs7eSwRxSKWGw14bfLYHOsq4Qo+2xra5
 d+tFenttFBfn2yJgK5k2prlUQPgNn9cuA+EJhm/AuvMnb2bXiOaR8Yojfr4rPxYa
 nQ7KxEMhxao0I9PeZVGAuenYyJ59ebJ1Zmgqy9tIqv6i51MQgaWgBk9Wq7Mnlzvb
 5qotVPAkEEq4wINdWVSOBnwC+/aV0w90ItyIaE4m0A1rHdcHALuYGM6O+P07oowC
 oruNdvuLPFEYrJOvV+NzHvvV55rzcYUopbqj4Wk3r9J+Yuw2hdwU1lQUGOV8ZVoc
 A3kMIl5DRtMFbVnLbT2tL0lCRG0WV6RStg2I0YJsHGckGWQ4fyHA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id msiSRpr42eAy for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:31:49 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKM616QVz1SVnx;
 Thu, 28 Apr 2022 21:31:45 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 05/25] target/riscv: rvk: add support for zbkb extension
Date: Fri, 29 Apr 2022 14:30:59 +1000
Message-Id: <20220429043119.1478881-6-alistair.francis@opensource.wdc.com>
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

 - reuse partial instructions of zbb extension, update extension check fo=
r them
 - add brev8, pack, packh, packw, unzip, zip instructions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220423023510.30794-3-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  3 +
 target/riscv/insn32.decode              | 45 +++++++-----
 target/riscv/bitmanip_helper.c          | 53 ++++++++++++++
 target/riscv/translate.c                |  7 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 94 +++++++++++++++++++++----
 5 files changed, 174 insertions(+), 28 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a669d0187b..8a3a7615f2 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -66,6 +66,9 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i6=
4)
 /* Bitmanip */
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_1(brev8, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
=20
 /* Floating Point - Half Precision */
 DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1d3ff1efe1..fdceaf621a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -717,8 +717,22 @@ sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
 slli_uw    00001 ............ 001 ..... 0011011 @sh
=20
-# *** RV32 Zbb Standard Extension ***
+# *** RV32 Zbb/Zbkb Standard Extension ***
 andn       0100000 .......... 111 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rori       01100 ............ 101 ..... 0010011 @sh
+# The encoding for rev8 differs between RV32 and RV64.
+# rev8_32 denotes the RV32 variant.
+rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
+# The encoding for zext.h differs between RV32 and RV64.
+# zext_h_32 denotes the RV32 variant.
+{
+  zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
+  pack       0000100 ..... ..... 100 ..... 0110011 @r
+}
+xnor       0100000 .......... 100 ..... 0110011 @r
+# *** RV32 extra Zbb Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
@@ -728,23 +742,15 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 orc_b      001010 000111 ..... 101 ..... 0010011 @r2
 orn        0100000 .......... 110 ..... 0110011 @r
-# The encoding for rev8 differs between RV32 and RV64.
-# rev8_32 denotes the RV32 variant.
-rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
-rol        0110000 .......... 001 ..... 0110011 @r
-ror        0110000 .......... 101 ..... 0110011 @r
-rori       01100 ............ 101 ..... 0010011 @sh
 sext_b     011000 000100 ..... 001 ..... 0010011 @r2
 sext_h     011000 000101 ..... 001 ..... 0010011 @r2
-xnor       0100000 .......... 100 ..... 0110011 @r
-# The encoding for zext.h differs between RV32 and RV64.
-# zext_h_32 denotes the RV32 variant.
-zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
+# *** RV32 extra Zbkb Standard Extension ***
+brev8      0110100 00111 ..... 101 ..... 0010011 @r2  #grevi
+packh      0000100  .......... 111 ..... 0110011 @r
+unzip      0000100 01111 ..... 101 ..... 0010011 @r2  #unshfl
+zip        0000100 01111 ..... 001 ..... 0010011 @r2  #shfl
=20
-# *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
-clzw       0110000 00000 ..... 001 ..... 0011011 @r2
-ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
-cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+# *** RV64 Zbb/Zbkb Standard Extension (in addition to RV32 Zbb/Zbkb) **=
*
 # The encoding for rev8 differs between RV32 and RV64.
 # When executing on RV64, the encoding used in RV32 is an illegal
 # instruction, so we use different handler functions to differentiate.
@@ -755,7 +761,14 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 # The encoding for zext.h differs between RV32 and RV64.
 # When executing on RV64, the encoding used in RV32 is an illegal
 # instruction, so we use different handler functions to differentiate.
-zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
+{
+  zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
+  packw      0000100 ..... ..... 100 ..... 0111011 @r
+}
+# *** RV64 extra Zbb Standard Extension (in addition to RV32 Zbb) ***
+clzw       0110000 00000 ..... 001 ..... 0011011 @r2
+ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
+cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
=20
 # *** RV32 Zbc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helpe=
r.c
index f1b5e5549f..e003e8b25b 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -49,3 +49,56 @@ target_ulong HELPER(clmulr)(target_ulong rs1, target_u=
long rs2)
=20
     return result;
 }
+
+static inline target_ulong do_swap(target_ulong x, uint64_t mask, int sh=
ift)
+{
+    return ((x & mask) << shift) | ((x & ~mask) >> shift);
+}
+
+target_ulong HELPER(brev8)(target_ulong rs1)
+{
+    target_ulong x =3D rs1;
+
+    x =3D do_swap(x, 0x5555555555555555ull, 1);
+    x =3D do_swap(x, 0x3333333333333333ull, 2);
+    x =3D do_swap(x, 0x0f0f0f0f0f0f0f0full, 4);
+    return x;
+}
+
+static const uint64_t shuf_masks[] =3D {
+    dup_const(MO_8, 0x44),
+    dup_const(MO_8, 0x30),
+    dup_const(MO_16, 0x0f00),
+    dup_const(MO_32, 0xff0000)
+};
+
+static inline target_ulong do_shuf_stage(target_ulong src, uint64_t mask=
L,
+                                         uint64_t maskR, int shift)
+{
+    target_ulong x =3D src & ~(maskL | maskR);
+
+    x |=3D ((src << shift) & maskL) | ((src >> shift) & maskR);
+    return x;
+}
+
+target_ulong HELPER(unzip)(target_ulong rs1)
+{
+    target_ulong x =3D rs1;
+
+    x =3D do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
+    x =3D do_shuf_stage(x, shuf_masks[1], shuf_masks[1] >> 2, 2);
+    x =3D do_shuf_stage(x, shuf_masks[2], shuf_masks[2] >> 4, 4);
+    x =3D do_shuf_stage(x, shuf_masks[3], shuf_masks[3] >> 8, 8);
+    return x;
+}
+
+target_ulong HELPER(zip)(target_ulong rs1)
+{
+    target_ulong x =3D rs1;
+
+    x =3D do_shuf_stage(x, shuf_masks[3], shuf_masks[3] >> 8, 8);
+    x =3D do_shuf_stage(x, shuf_masks[2], shuf_masks[2] >> 4, 4);
+    x =3D do_shuf_stage(x, shuf_masks[1], shuf_masks[1] >> 2, 2);
+    x =3D do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
+    return x;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6495726302..121ead7cfe 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -688,6 +688,13 @@ EX_SH(12)
     }                                  \
 } while (0)
=20
+#define REQUIRE_EITHER_EXT(ctx, A, B) do {       \
+    if (!ctx->cfg_ptr->ext_##A &&      \
+        !ctx->cfg_ptr->ext_##B) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static int ex_rvc_register(DisasContext *ctx, int reg)
 {
     return 8 + reg;
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index e8519a6d69..f36577579d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the Zb[abcs] Standard Extension.
+ * RISC-V translation routines for the Zb[abcs] and Zbk[bcx] Standard Ex=
tension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
@@ -42,6 +42,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_ZBKB(ctx) do {                   \
+    if (!ctx->cfg_ptr->ext_zbkb) {               \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static void gen_clz(TCGv ret, TCGv arg1)
 {
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
@@ -85,19 +91,19 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a=
)
=20
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_logic(ctx, a, tcg_gen_andc_tl);
 }
=20
 static bool trans_orn(DisasContext *ctx, arg_orn *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_logic(ctx, a, tcg_gen_orc_tl);
 }
=20
 static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_logic(ctx, a, tcg_gen_eqv_tl);
 }
=20
@@ -247,7 +253,7 @@ static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
=20
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw,=
 NULL);
 }
=20
@@ -264,7 +270,7 @@ static void gen_roriw(TCGv ret, TCGv arg1, target_lon=
g shamt)
=20
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
                                    tcg_gen_rotri_tl, gen_roriw, NULL);
 }
@@ -289,7 +295,7 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
=20
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw,=
 NULL);
 }
=20
@@ -301,14 +307,14 @@ static void gen_rev8_32(TCGv ret, TCGv src1)
 static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
     REQUIRE_32BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
 }
=20
 static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
 }
=20
@@ -403,7 +409,7 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw =
*a)
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     ctx->ol =3D MXL_RV32;
     return gen_shift(ctx, a, EXT_NONE, gen_rorw, NULL);
 }
@@ -411,7 +417,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a=
)
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     ctx->ol =3D MXL_RV32;
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw, NULL);
 }
@@ -419,7 +425,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw =
*a)
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     ctx->ol =3D MXL_RV32;
     return gen_shift(ctx, a, EXT_NONE, gen_rolw, NULL);
 }
@@ -504,3 +510,67 @@ static bool trans_clmulr(DisasContext *ctx, arg_clmu=
lh *a)
     REQUIRE_ZBC(ctx);
     return gen_arith(ctx, a, EXT_NONE, gen_helper_clmulr, NULL);
 }
+
+static void gen_pack(TCGv ret, TCGv src1, TCGv src2)
+{
+    tcg_gen_deposit_tl(ret, src1, src2,
+                       TARGET_LONG_BITS / 2,
+                       TARGET_LONG_BITS / 2);
+}
+
+static void gen_packh(TCGv ret, TCGv src1, TCGv src2)
+{
+    TCGv t =3D tcg_temp_new();
+
+    tcg_gen_ext8u_tl(t, src2);
+    tcg_gen_deposit_tl(ret, src1, t, 8, TARGET_LONG_BITS - 8);
+    tcg_temp_free(t);
+}
+
+static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
+{
+    TCGv t =3D tcg_temp_new();
+
+    tcg_gen_ext16s_tl(t, src2);
+    tcg_gen_deposit_tl(ret, src1, t, 16, TARGET_LONG_BITS - 16);
+    tcg_temp_free(t);
+}
+
+static bool trans_brev8(DisasContext *ctx, arg_brev8 *a)
+{
+    REQUIRE_ZBKB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, gen_helper_brev8);
+}
+
+static bool trans_pack(DisasContext *ctx, arg_pack *a)
+{
+    REQUIRE_ZBKB(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_pack, NULL);
+}
+
+static bool trans_packh(DisasContext *ctx, arg_packh *a)
+{
+    REQUIRE_ZBKB(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_packh, NULL);
+}
+
+static bool trans_packw(DisasContext *ctx, arg_packw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZBKB(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_packw, NULL);
+}
+
+static bool trans_unzip(DisasContext *ctx, arg_unzip *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBKB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, gen_helper_unzip);
+}
+
+static bool trans_zip(DisasContext *ctx, arg_zip *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBKB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, gen_helper_zip);
+}
--=20
2.35.1


