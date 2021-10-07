Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE3E424D71
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:53:27 +0200 (CEST)
Received: from localhost ([::1]:48050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNHS-0006UT-1P
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYND2-0003Jw-3t
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:52 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:36035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCz-0004gx-71
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589329; x=1665125329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NaAjtM37i/DePknbGhxrgWMHmZ++CFtQwZ8ZLjKS/ik=;
 b=KMvBBIvu7pwbphQtWpRqY8hUcxsmEckAdyh5PALaugmNHUuKwV1G942D
 jRNIm1PVU1SzsYVk6ghy0L52Urm82kc5VVVsJNTA5qobWUKaeAcUUa9ro
 rH9IGRlq7MfFZRtMpqbM6Xv/xXCF4V0PrzLa6Hn+HLdMkveBExiEE9WT5
 8/K6kMdH/6NKeybLi9t+cBTNs2fMbyG/wikiLexWQ+bArszC+W5zcH2S5
 IA4i7jd6Wa7b3g2PA8EnyqaViOcHtXGg37WfUHhJR7JsyHaFG5zNit8ZT
 9H2man+Ua4Q6P+s04gJjoZIj6bg44S4qget/LlvHME0hw4314iRS5ShsC w==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="285950680"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:48:47 +0800
IronPort-SDR: TKHioaixDtlHfrucXNoMgb5jTQjcWTa75bZBsq9CeqYySejKrymkzQg1Zrl1hAcxwNvhdIl98J
 TdVMpXuKQUl8vhtO6Lpgj681PDI9JxrF4q+6b57tlB+mf5sKDXgOvyFhmnie1W4qbbPKr7zSzz
 ZD0neiv1q+PwGN1QnJvmMe34DweCzf9c2ch/US94FlhFWqlE1cvNAMGobTGEFYRpsYjw9mRYmZ
 LZSlZX4/o9R9JqWTRvPZDbqMTPFt1ahWMbx3d1SNiMYergRpaDP+iX4If8pQj4gEJpspbWzTXM
 EE8El459HaiYDXEI8ysTt/AR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:24:41 -0700
IronPort-SDR: p0IcnDf6lDaz+Qj+DLMiU1w6ip/UbiLqR5OXaZvMy8V3jvV+bJows7O4bvd1qPesUXg7ZXp5Ed
 1awZtcRtPL2Se/N01Ef23WJxEmIxvbPs5uvjpfMqv0pMSJeHE14P1V20NJaxDTHt9FmuySuxtZ
 GtxVa9aeUGvPxO1nS6W+UDcqO1o/xATNaKkfpPBoDg85XA2hlvtjVIR5GwnLEn0Zhpsc1x8iwi
 0fE/ABlCevkk3jjXHKvDL3SSfiCdZDRsz48ylYKPrvbH4GBuG7wHDyopuQhJgAKwUgdfzcgH3o
 M7Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:48:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ23M4CmLz1RvmL
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:48:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589326; x=1636181327; bh=NaAjtM37i/DePknbGh
 xrgWMHmZ++CFtQwZ8ZLjKS/ik=; b=Ke5mKg/Eb0Ca5ZZvhqt0FzzCIb/wNkZ6tk
 lFSs+iO4rHRhRK6m0+V0eujjnjViAzPsPuL3wLz46iJI3qga792nk+p7vora7Gq6
 YhnYmGzhw/uU1rKntNtOD7m6vriOI0yIqDaIMIdOb7erE7AuTBeQai7w5teiIk5E
 9NWVgaLasoSMZrvJFA4w5xY8GQccdUthKloEE88YeysmmmPlStitv5OFjlNujDfa
 vZrfLlZAl3pCI1vAVydo3aCOE8s4a1vSaUHD5g8M/FZI3G/2supxqMMwogdv5ebD
 gn2+dxJsx2VRliGKr5UH/WhqDo4m1FzE5HAV8KEAD7oMnMExfgXQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BO_Ve2m91C19 for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:48:46 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ23G0qygz1RvTg;
 Wed,  6 Oct 2021 23:48:41 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 07/26] target/riscv: Remove shift-one instructions (proposed
 Zbo in pre-0.93 draft-B)
Date: Thu,  7 Oct 2021 16:47:32 +1000
Message-Id: <20211007064751.608580-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The Zb[abcs] ratification package does not include the proposed
shift-one instructions. There currently is no clear plan to whether
these (or variants of them) will be ratified as Zbo (or a different
extension) or what the timeframe for such a decision could be.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210911140016.834071-8-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  8 ---
 target/riscv/insn_trans/trans_rvb.c.inc | 70 -------------------------
 2 files changed, 78 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b499691a9e..e0f6e315a2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -693,8 +693,6 @@ bset       0010100 .......... 001 ..... 0110011 @r
 bclr       0100100 .......... 001 ..... 0110011 @r
 binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
-slo        0010000 .......... 001 ..... 0110011 @r
-sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
@@ -704,8 +702,6 @@ bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
 binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
-sloi       00100. ........... 001 ..... 0010011 @sh
-sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
 gorci      00101. ........... 101 ..... 0010011 @sh
@@ -717,15 +713,11 @@ cpopw      0110000 00010 ..... 001 ..... 0011011 @r=
2
=20
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
-slow       0010000 .......... 001 ..... 0111011 @r
-srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
=20
-sloiw      0010000 .......... 001 ..... 0011011 @sh5
-sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index fbe1c3b410..a5bf40f95b 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -237,44 +237,6 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti=
 *a)
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
 }
=20
-static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_not_tl(ret, arg1);
-    tcg_gen_shl_tl(ret, ret, arg2);
-    tcg_gen_not_tl(ret, ret);
-}
-
-static bool trans_slo(DisasContext *ctx, arg_slo *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, gen_slo);
-}
-
-static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_slo);
-}
-
-static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_not_tl(ret, arg1);
-    tcg_gen_shr_tl(ret, ret, arg2);
-    tcg_gen_not_tl(ret, ret);
-}
-
-static bool trans_sro(DisasContext *ctx, arg_sro *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_ZERO, gen_sro);
-}
-
-static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
-{
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_sro);
-}
-
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -420,38 +382,6 @@ static bool trans_packuw(DisasContext *ctx, arg_pack=
uw *a)
     return gen_arith(ctx, a, EXT_NONE, gen_packuw);
 }
=20
-static bool trans_slow(DisasContext *ctx, arg_slow *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift(ctx, a, EXT_NONE, gen_slo);
-}
-
-static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_slo);
-}
-
-static bool trans_srow(DisasContext *ctx, arg_srow *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift(ctx, a, EXT_ZERO, gen_sro);
-}
-
-static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_sro);
-}
-
 static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     TCGv_i32 t1 =3D tcg_temp_new_i32();
--=20
2.31.1


