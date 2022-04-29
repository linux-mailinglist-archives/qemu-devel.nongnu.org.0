Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7211A51418C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:47:55 +0200 (CEST)
Received: from localhost ([::1]:34480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIXq-0003iI-Ja
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIs-0007ej-Nk
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:26 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIq-0002Vn-QQ
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206743; x=1682742743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VwI3RVFMqCBliyUbfcb7E3/PMtb7gb5vXyRcR92QLVk=;
 b=VBQHNWVcQ83kQgeIGZk2W1h+5FZMDuipLoweYUc88+nv15OpM4PGBaPC
 Gnpm4vezNa6zQZb7MQeB75ty54ecEWRASllywt9xxFRjGfLxBeX7v4RdZ
 YQ1Bm7/muHELCF3rwTZRq4Bt//vNmvSW5X24Ij0k9rt7kQKOeqEawiDgQ
 Q3EnA2KHnPGT5FA1uW2dJXgM9pUBL6j2NUy/8nbG/ZLVsAj76txNCZH+Z
 4P9BKFkZY0kEzf79jkDBq44s4OlS4+3Gz1UnA8mQv0jHvIckD9jyf2if5
 VxhZlJ7GTxibjOSjIL4GxoLWZnEgdXol6PDbV1ja6PEPu28dEACVh73Uo A==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995957"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:22 +0800
IronPort-SDR: rQK4o7cW82bcgm4ActJ8kjVUdoYxueDji0fse9JlKqUUTTM0UwLvyW2Dr58n61ZEduTCb9jlRY
 u4waKy1kYSNYnULBchSPCKX3cI9xALetD71xohL0jGB9wMcO0o0GJX/VTxVFmf2x1ZzDDCxGxR
 S9mTe7knsy9kSGRuAOlU07PJ+UKgcFLEIcUfhFJIW7hEuB/p2v6PDOf84AU8CiryiQ8f6uM2hb
 23I1NjiEu0sXLFgAXm0N7oe4FRRyO40FZaAICe7i/2VoDVZSXR1Pycdc/pAQG7hP31+bDNh9lU
 fs/9d7yjekKH1IN0Olj2+ICE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:32 -0700
IronPort-SDR: iUvQvi1fldiyEZPnXyNl56W0Z0h9Bmx6ufk4j+kdvHX+7BKemyCa3RPNBhng1UzEyg2zr8o/Yb
 dLfvVKe04i3KMEsHNvpmxh6SY4qCeHQXCzC0U2uLPKFbYu9yqXIjD75qEUvVJr2eTfBLFTgojn
 aYtrsioD30TuYhvYqt75mZJagdbRonxNl0AcrDoiwWYi8Pp7NQ+hlNBlzxJiOhj3vF6xuPwD1C
 lkxy+Zpgp1EMgyUwKYZ5KSKkdBkGKhLOGgkquj0i+TYc3mrmrhjGvWlLemIWGnlyLocVIktguA
 pzw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMq4yT9z1Rvlx
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206743; x=1653798744; bh=VwI3RVFMqCBliyUbfc
 b7E3/PMtb7gb5vXyRcR92QLVk=; b=Oj4dLagJZL/Ak5+fBy81DSeJhs91O5sfCj
 ztIl54IC+0NESLh+ezy6airVk8V2DS4AGy/hjQryWhPAR/W3u4rec+fXizGR+8Wk
 q88dCpxNgwad/rfXcnCUg2d6kMFQg6v726CA75D2iJLUD9sOMArqgS0W9j2DNBak
 QCyTwdhBmzdSf+4H56zUYOGIwWLKpBh5HJEwsqvvEoC3IGnn0YfqYbuYC6vi20Y6
 s9z3fIHXWgi0gXBeKg/5HRgjKZY7qb6iYcEJAVf1oDojyxFpzr1hUdVID3dwVdAm
 6JAWuNGAgEYDMjOQ7OGCt+8+Z0UURSWdybM02uawJSLFysdwy6/Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0D-yK_O6MfNk for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:23 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMl6SFPz1SVp0;
 Thu, 28 Apr 2022 21:32:19 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Ruibo Lu <luruibo2000@163.com>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/25] target/riscv: rvk: add support for zksed/zksh extension
Date: Fri, 29 Apr 2022 14:31:08 +1000
Message-Id: <20220429043119.1478881-15-alistair.francis@opensource.wdc.com>
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

 - add sm3p0, sm3p1, sm4ed and sm4ks instructions

Co-authored-by: Ruibo Lu <luruibo2000@163.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423023510.30794-12-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  3 ++
 target/riscv/insn32.decode              |  6 +++
 target/riscv/crypto_helper.c            | 28 ++++++++++++
 target/riscv/insn_trans/trans_rvk.c.inc | 58 +++++++++++++++++++++++++
 4 files changed, 95 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 56519fcc26..4ef3b2251d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1126,3 +1126,6 @@ DEF_HELPER_FLAGS_2(aes64dsm, TCG_CALL_NO_RWG_SE, tl=
, tl, tl)
 DEF_HELPER_FLAGS_2(aes64ks2, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(aes64ks1i, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_1(aes64im, TCG_CALL_NO_RWG_SE, tl, tl)
+
+DEF_HELPER_FLAGS_3(sm4ed, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d9ebb138d1..4033565393 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -873,3 +873,9 @@ sha512sig0  00 01000 00110 ..... 001 ..... 0010011 @r=
2
 sha512sig1  00 01000 00111 ..... 001 ..... 0010011 @r2
 sha512sum0  00 01000 00100 ..... 001 ..... 0010011 @r2
 sha512sum1  00 01000 00101 ..... 001 ..... 0010011 @r2
+# *** RV32 Zksh Standard Extension ***
+sm3p0       00 01000 01000 ..... 001 ..... 0010011 @r2
+sm3p1       00 01000 01001 ..... 001 ..... 0010011 @r2
+# *** RV32 Zksed Standard Extension ***
+sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
+sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index cb4783a1e9..2ef30281b1 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -271,4 +271,32 @@ target_ulong HELPER(aes64im)(target_ulong rs1)
=20
     return result;
 }
+
+target_ulong HELPER(sm4ed)(target_ulong rs1, target_ulong rs2,
+                           target_ulong shamt)
+{
+    uint32_t sb_in =3D (uint8_t)(rs2 >> shamt);
+    uint32_t sb_out =3D (uint32_t)sm4_sbox[sb_in];
+
+    uint32_t x =3D sb_out ^ (sb_out << 8) ^ (sb_out << 2) ^ (sb_out << 1=
8) ^
+                 ((sb_out & 0x3f) << 26) ^ ((sb_out & 0xC0) << 10);
+
+    uint32_t rotl =3D rol32(x, shamt);
+
+    return sext32_xlen(rotl ^ (uint32_t)rs1);
+}
+
+target_ulong HELPER(sm4ks)(target_ulong rs1, target_ulong rs2,
+                           target_ulong shamt)
+{
+    uint32_t sb_in =3D (uint8_t)(rs2 >> shamt);
+    uint32_t sb_out =3D sm4_sbox[sb_in];
+
+    uint32_t x =3D sb_out ^ ((sb_out & 0x07) << 29) ^ ((sb_out & 0xFE) <=
< 7) ^
+                 ((sb_out & 0x01) << 23) ^ ((sb_out & 0xF8) << 13);
+
+    uint32_t rotl =3D rol32(x, shamt);
+
+    return sext32_xlen(rotl ^ (uint32_t)rs1);
+}
 #undef sext32_xlen
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_=
trans/trans_rvk.c.inc
index 8274b5a364..90f4eeff60 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -35,6 +35,18 @@
     }                                           \
 } while (0)
=20
+#define REQUIRE_ZKSED(ctx) do {                 \
+    if (!ctx->cfg_ptr->ext_zksed) {             \
+        return false;                           \
+    }                                           \
+} while (0)
+
+#define REQUIRE_ZKSH(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zksh) {              \
+        return false;                           \
+    }                                           \
+} while (0)
+
 static bool gen_aes32_sm4(DisasContext *ctx, arg_k_aes *a,
                           void (*func)(TCGv, TCGv, TCGv, TCGv))
 {
@@ -331,3 +343,49 @@ static bool trans_sha512sum1(DisasContext *ctx, arg_=
sha512sum1 *a)
     REQUIRE_ZKNH(ctx);
     return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 14, 18, =
41);
 }
+
+/* SM3 */
+static bool gen_sm3(DisasContext *ctx, arg_r2 *a, int32_t b, int32_t c)
+{
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv_i32 t0 =3D tcg_temp_new_i32();
+    TCGv_i32 t1 =3D tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t0, src1);
+    tcg_gen_rotli_i32(t1, t0, b);
+    tcg_gen_xor_i32(t1, t0, t1);
+    tcg_gen_rotli_i32(t0, t0, c);
+    tcg_gen_xor_i32(t1, t1, t0);
+    tcg_gen_ext_i32_tl(dest, t1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(t1);
+    return true;
+}
+
+static bool trans_sm3p0(DisasContext *ctx, arg_sm3p0 *a)
+{
+    REQUIRE_ZKSH(ctx);
+    return gen_sm3(ctx, a, 9, 17);
+}
+
+static bool trans_sm3p1(DisasContext *ctx, arg_sm3p1 *a)
+{
+    REQUIRE_ZKSH(ctx);
+    return gen_sm3(ctx, a, 15, 23);
+}
+
+/* SM4 */
+static bool trans_sm4ed(DisasContext *ctx, arg_sm4ed *a)
+{
+    REQUIRE_ZKSED(ctx);
+    return gen_aes32_sm4(ctx, a, gen_helper_sm4ed);
+}
+
+static bool trans_sm4ks(DisasContext *ctx, arg_sm4ks *a)
+{
+    REQUIRE_ZKSED(ctx);
+    return gen_aes32_sm4(ctx, a, gen_helper_sm4ks);
+}
--=20
2.35.1


