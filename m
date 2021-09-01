Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0883FD165
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:37:26 +0200 (CEST)
Received: from localhost ([::1]:54868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLG7x-0005tS-R5
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjz-0007fW-VW
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:43 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:10421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjs-0000YF-Jt
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462352; x=1661998352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=teTRhQ/O0z0CBsIvCaP6Z6InQHVT7BTVYSYbDPouYJ8=;
 b=rmzGG9jl42GwhwPLWOmnOAKzm1Urf9H9HTR7H2E13bGAnZNp4mqe6Svf
 tVN43p91mxfJ0XMGpl8Dsm/akR5NzOJZaTXC3J2IJ+TmLwEjmhM6dkFuh
 wIA5wzetHVgYPmV169FPNO84v7/Xa4npFjNe9tw6hh3YY6wBcS6KU4Iun
 0EySEX6ypRCWDW+oOj4Sn/ml/4oknfcDA4wlNr3Sk+3vWhusUjmWAwbeq
 clshp0+tr0FsVYnDKx8xdF4++iAS+V1gZeC30xR/7X8MK0tyigDcZVD2K
 503yU4p4amixojfzs4WxiIQ+H8DN3bQHl1JJKWQFYh4hjYsYR85WZWTaG g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178011761"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:12:31 +0800
IronPort-SDR: ZlOJUkKd+NH9oFvTvkY8r4jsqZoPJy9JVHR7R9OQCndFnRKGxut+k7H+Y3JzPEs7id4aTfRclr
 WyJnOFHMpwxN7NwpkBAWgq1KvIHgqgtCUWw5+hYhS9fRvK+5LtEYiWKa2EJxUXbYmE4blGNj3a
 ZqNEFiemf72Ho9y1ziqjLcl3FW4xlAWPKS4WzerS103IWHmViI1GzXG1cHFieO2+dSSZzcyjMk
 j5AongFfgq13g5MnQyRm5uoGAO4xxfTnskSULDIgxJq6OKhfBNx4h667J2Owyq3nCxprrQSaBY
 rRYsVOKaII5X9KivPHEkbiU9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:49:19 -0700
IronPort-SDR: qJbQdkkyEVnpdst7JiVuS+MRKjtFXyOHjWYOP7FFCz8fn90qp0vX53C07SgqPwxez9rmeK2Y5o
 /UkZ4jFdfX5fidnNV6gZSckk/7ThRHR+qFuh1kOpmpLtwKhgjvLRCAR+kQB7pgQynBtU8+WHrk
 zuHvOkW9Pzk64cr+fnEA3Lu/bL4xY93bucyDOEvuXoW9TywLj2UQ5td+lTZuUreIfjkHelDiGf
 eL+ltbIGL1SUvjq4Iuj+FJ+bFbdT+IYGTPcUIqsXgP/xzEvsA6FX8rg8xYdGIHaqxWBStAYL6P
 Y/U=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:12:31 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GzndC0SZWz1RvmJ
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:12:31 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462346; x=1633054347; bh=teTRhQ/O0z0CBsIvCa
 P6Z6InQHVT7BTVYSYbDPouYJ8=; b=ALvYySwHoV4csRftbcFerf+0t7abifcizL
 Bd/D+5ATdtj6PFi3qq3dX+sGxo7M2tTLxYV0r/WMqCHw55q8co4H21Zo9cXI1oYJ
 gL0KLZMtvRFWlKJMsAF2Igih4y/iNPbYR2K6oPBFxfOkuyJ2BdsCj4eJbi/TD3PJ
 ynj5TMM+qRRFj4jPx8d0J5EQ6AYBys80VgiCYtgWrofYKzsTAB0Pd2pWy3FsQvxQ
 D11lbR2rId17C3+ZQKum+zFyWzlLFawRffRkK+080NhDAT/gjrHQtf8AfcREnaID
 8HO8OohRl37VHhWMPd+GmCZWlhhZoexp7OP3ylyfryrSQupczJ7g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YHHSqBi6CwOe for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:12:26 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gznd21RBFz1Rvm1;
 Tue, 31 Aug 2021 19:12:21 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 24/33] target/riscv: Use {get, dest}_gpr for integer load/store
Date: Wed,  1 Sep 2021 12:09:49 +1000
Message-Id: <20210901020958.458454-25-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-16-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 38 +++++++++++++------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index a5249e71c2..76454fb7e2 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -138,15 +138,17 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu =
*a)
=20
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
-    gen_set_gpr(ctx, a->rd, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
+
+    if (a->imm) {
+        TCGv temp =3D temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr =3D temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
@@ -177,19 +179,19 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a=
)
=20
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
-    TCGv t0 =3D tcg_temp_new();
-    TCGv dat =3D tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
-    gen_get_gpr(ctx, dat, a->rs2);
+    TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv data =3D get_gpr(ctx, a->rs2, EXT_NONE);
=20
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
+    if (a->imm) {
+        TCGv temp =3D temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr =3D temp;
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     return true;
 }
=20
-
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
 {
     return gen_store(ctx, a, MO_SB);
--=20
2.31.1


