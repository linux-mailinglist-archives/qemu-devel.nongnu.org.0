Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AD6424D98
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:59:06 +0200 (CEST)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNMv-0000Dk-9D
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCx-00037d-4k
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:47 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCu-00049I-GM
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589324; x=1665125324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vz7kA3KYVV9RK7xqTbmK7Gik0nEJ6tcH4JjjFfja/G4=;
 b=c3pht1pj9gka8I9KHxmpWx7G5MoO6jsJAEMkjGoGcsagSGyEGqE4qEzC
 EboAOmBdxrRCjcZlXv6nNdL+cTv3XvAc5yPZ+h+NVfWXQXq//ZZbydOBF
 R3PgXds/C9PFsDitVPL+LhxxV9LgdLaU7bQHHgUHEmDV6PneWFJsI0abg
 S25fSH2ciN+owUTJIaQCKt71aYXN6ijysApFlhLXdK45fUMVbofpNpI8G
 SCsyd9vIjsesHnpvjYY1j1r4nKzBKmQTjTEBVxQ+fZ+nb9wfFBCj2h7Bk
 PpYvhCL6sqXabGep0ea9fX1yMLZk87ceM8pgDsNi7yeq06QVT59LPxkZ0 A==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="293815413"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:48:41 +0800
IronPort-SDR: 2JKZQdSlexLbBlPBzXlC4gjoL9ve3ghLWjM+QmyPkwdN/o402ns0i09GdHT8LOuStXzGOLJXkO
 oBR0XABr0wvnpJ82AGybVZaOcg6eCXSwrUwvx2vr8ovGskRZJtdzJaYb/Rn8nTrswG/pBqEK6d
 34s8BD6fN8QEkWocSSulleajA9udaZTa2pTXyJjsywhKrg1Mmsvm8g3ADeoHY5kGr4pNI7FBXk
 AKPEDpf5MuJj4XCc0E7EhnRuAaHKGnKtKC1HErm+b/JnXV/az1+YtD8pAEGz5SIAmCNN+TBBJy
 pDt4KiPoN2G45r7ce+0uttS+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:24:35 -0700
IronPort-SDR: cgj0Zs0cWbPirQG4zkSvHWUtfoMxO5oZ7QRz/BmaszetTqjcTSb2NDdCeWPpTla4eilw/CUaP4
 YyhyOqkyhqQbTPlU9RCvNxMtyPHqDeYLVBC/ictjM/KCsGajnyf26ufcsbhb1lcbjHbUzJU3n8
 /nXeE6HATD5bHO7LH0acfjkJ4mkHWC82oZiMjHTiixyqxHqs583A/vmRgJs60uEkHwjR2RLw+6
 KUSsLTjeawRd3Lts0MOuevYWb4mCuysqtaLErCNDq3/OnVHdvKRO5eOF7sv/PEaRAdBnBXMfFi
 1C0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:48:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ23F3Cc8z1Rvlt
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:48:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589320; x=1636181321; bh=Vz7kA3KYVV9RK7xqTb
 mK7Gik0nEJ6tcH4JjjFfja/G4=; b=tS1qeBMCrwDQAErpEEsRXVXRwpqAsaegDS
 QOPfp6cQovbdmFDuOjVr04yJKJ9G7lWVMcD9e3upFJpgeCiGMch9u2JdwXxejr+Z
 liDjW6k+f6sJA8LzVeg9xTVJsC2XVwr1P9j2RJFTPxwznZ2/V/dwmLkvnxOULhPH
 glqn9yxdQIBuaVP2C7YfYx/hOkaOyCObnRtSkXQflT95ReFpNQcNlDz6NpWUfBZj
 5/5tcrWWDl6jKFOavvGrQSkbuEYQ1LUipbSC1JpFklNOwruO0ZFZpYQwsrODDdki
 IZ8S2ZNuIyfjm+KYsAyoQA/g4lUcYVtmYlBwXLabw8fuZpy8HGPg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id VoAgMJhD-i_3 for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:48:40 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ2371q4hz1RvTg;
 Wed,  6 Oct 2021 23:48:34 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 06/26] target/riscv: Remove the W-form instructions from Zbs
Date: Thu,  7 Oct 2021 16:47:31 +1000
Message-Id: <20211007064751.608580-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

Zbs 1.0.0 (just as the 0.93 draft-B before) does not provide for W-form
instructions for Zbs (single-bit instructions).  Remove them.

Note that these instructions had already been removed for the 0.93
version of the draft-B extention and have not been present in the
binutils patches circulating in January 2021.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210911140016.834071-7-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  7 ----
 target/riscv/insn_trans/trans_rvb.c.inc | 56 -------------------------
 2 files changed, 63 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 86f1166dab..b499691a9e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -717,10 +717,6 @@ cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
=20
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
-bsetw      0010100 .......... 001 ..... 0111011 @r
-bclrw      0100100 .......... 001 ..... 0111011 @r
-binvw      0110100 .......... 001 ..... 0111011 @r
-bextw      0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
@@ -728,9 +724,6 @@ rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
=20
-bsetiw     0010100 .......... 001 ..... 0011011 @sh5
-bclriw     0100100 .......... 001 ..... 0011011 @sh5
-binviw     0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index fd549c7b0f..fbe1c3b410 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -420,62 +420,6 @@ static bool trans_packuw(DisasContext *ctx, arg_pack=
uw *a)
     return gen_arith(ctx, a, EXT_NONE, gen_packuw);
 }
=20
-static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift(ctx, a, EXT_NONE, gen_bset);
-}
-
-static bool trans_bsetiw(DisasContext *ctx, arg_bsetiw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bset);
-}
-
-static bool trans_bclrw(DisasContext *ctx, arg_bclrw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift(ctx, a, EXT_NONE, gen_bclr);
-}
-
-static bool trans_bclriw(DisasContext *ctx, arg_bclriw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bclr);
-}
-
-static bool trans_binvw(DisasContext *ctx, arg_binvw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift(ctx, a, EXT_NONE, gen_binv);
-}
-
-static bool trans_binviw(DisasContext *ctx, arg_binviw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_binv);
-}
-
-static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w =3D true;
-    return gen_shift(ctx, a, EXT_NONE, gen_bext);
-}
-
 static bool trans_slow(DisasContext *ctx, arg_slow *a)
 {
     REQUIRE_64BIT(ctx);
--=20
2.31.1


