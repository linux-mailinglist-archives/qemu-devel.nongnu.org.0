Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B18D495BA5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:16:27 +0100 (CET)
Received: from localhost ([::1]:38290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAp5u-0000a3-5R
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:16:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0Y-0008Ef-1f
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:46 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0W-0004KU-6Z
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744964; x=1674280964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/wjPSH2EAci9G0WbxegO8W9+OTDs/sXehVnzULpy+NI=;
 b=jQX9ULNnIsFsIg4R+I4kWsINPc9Y9QesnJ9cNTX0RAYEpDK6KFZB4hQF
 K/ag9bZM/K4DoiAd1WqLYCDqMWc1sUXpJ0WaN51xeeHphNo6ErB/5QBSh
 gURLXw0WLqmDfEx6yy4ehOe/yCiHJ8LKtNQ2zTpVvwUMuHj5DCu29LhWC
 xmxXM1Z+hJv58J6i7aaCfOsdu1XfGk9fvdq8b9VBrgaGIZt2XmXQJD8TS
 gaMn6yHSmiFkrK/Gp2PekSawWNy4ZcoiWaTGbPlGvMuAgxJWZd938TBXa
 bF14yRfCbGalGKhhSKe6yUu2GHrAnD/d6/0Q0q6C+3IgHooIEdWuNRR+9 A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083046"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:29 +0800
IronPort-SDR: gPgoq+kfBIHJ55OKxWtl+jmzPQgXnsd+BD8veY8nsY4miOMMyeqHH/1ONHOJWda4W9nmDYiyGr
 ucm0bs637CVHvq08KjZbbR0YCI0Hx0cKEWS6YVVL2aqJLIFKZ+EwsKJDv8sT4s1t73IRBiF+wN
 uutPn5lUg9wyfFQ3+77tkWNlS2ABRCkk1SdCl49t0teE7exDd1bDb8TN1IYgDdfHGsssH3uqg2
 Dr0H5Vam8+GqAJkjZDjbfdYN/r8gYKCxRwx8hEqyow83UHeW4eDJoJjeVBSIDTbBGw0+t0YYQ4
 YpXLbv2lPgYFfvUr3fTf8iqU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:56 -0800
IronPort-SDR: U5lgssqxzNHf+B3Ju+O+KU8GHrXtd8hb2xW+GjNFKbvdZ/QMdxX59tJGc3kCYQAoCWTDIVxIKR
 WTlzYTW5hfRTJe0pVcHfxJaOpuJeGonV3I+rtNoQOMlJliCdSQ6zQZTx11kcI1/2Tv3LJILk6N
 Baj50dbt1JsdPzQ58Ji6TvTq23s4bBEECXkrnmspVg3xNzYRp7J/vxE4lHO79gMdsSEQ/tUvsZ
 QJRrKNPkxT2kZsft4kDpWBfgTWfWOYWEg54D0mNjiwOK3HnoWjDZu/EQXxqw4DoKMWBtFx1lCm
 b7E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7zs1x6jz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744888; x=1645336889; bh=/wjPSH2EAci9G0Wbxe
 gO8W9+OTDs/sXehVnzULpy+NI=; b=KeOsTAhW2jDRrWARn8xKfodt5BALfNVfa3
 T8Fo6HQHokk4/60hAyD0O289+Bca6YT24hmLqlQXpoBTLU2KO01yPWFajQ3iwlQj
 CSUXR7HCD4lBgxf5CfTOY43/oVJOH3XNEkZ3qRNOG5NZ94KlAGeo8XoISHax3Oxz
 GJLoApgDCgXXASpd9EKhYbp8SRcWKiQI7BVzJX6LZDDmWkaMqbve/NvXEqCqJctd
 kH2mn2EN2W3rA+FnZu1UkkdK8J1ZO0rUVFi4Ooo9+T1Tlk8lR6+mK06WrE8ONSa3
 IQlqF8H//eyDR9sJDNfMaMLi9s3l2IUJtgMQRpKG5U9u+c9xwMTw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id toJjH1gMJAv8 for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:28 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7zn4dvcz1RvlN;
 Thu, 20 Jan 2022 22:01:25 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 40/61] target/riscv: Don't save pc when exception return
Date: Fri, 21 Jan 2022 15:58:09 +1000
Message-Id: <20220121055830.3164408-41-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

As pc will be written by the xepc in exception return, just ignore
pc in translation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-3-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                          | 4 ++--
 target/riscv/op_helper.c                       | 4 ++--
 target/riscv/insn_trans/trans_privileged.c.inc | 7 ++-----
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6cf6d6ce98..72cc2582f4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -100,8 +100,8 @@ DEF_HELPER_2(csrr_i128, tl, env, int)
 DEF_HELPER_4(csrw_i128, void, env, int, tl, tl)
 DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)
 #ifndef CONFIG_USER_ONLY
-DEF_HELPER_2(sret, tl, env, tl)
-DEF_HELPER_2(mret, tl, env, tl)
+DEF_HELPER_1(sret, tl, env)
+DEF_HELPER_1(mret, tl, env)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
 #endif
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 6f040f2fb9..67693cb42b 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -115,7 +115,7 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, in=
t csr,
=20
 #ifndef CONFIG_USER_ONLY
=20
-target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
+target_ulong helper_sret(CPURISCVState *env)
 {
     uint64_t mstatus;
     target_ulong prev_priv, prev_virt;
@@ -176,7 +176,7 @@ target_ulong helper_sret(CPURISCVState *env, target_u=
long cpu_pc_deb)
     return retpc;
 }
=20
-target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
+target_ulong helper_mret(CPURISCVState *env)
 {
     if (!(env->priv >=3D PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/risc=
v/insn_trans/trans_privileged.c.inc
index 75c6ef80a6..6077bbbf11 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -74,10 +74,8 @@ static bool trans_uret(DisasContext *ctx, arg_uret *a)
 static bool trans_sret(DisasContext *ctx, arg_sret *a)
 {
 #ifndef CONFIG_USER_ONLY
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-
     if (has_ext(ctx, RVS)) {
-        gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
+        gen_helper_sret(cpu_pc, cpu_env);
         tcg_gen_exit_tb(NULL, 0); /* no chaining */
         ctx->base.is_jmp =3D DISAS_NORETURN;
     } else {
@@ -92,8 +90,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 static bool trans_mret(DisasContext *ctx, arg_mret *a)
 {
 #ifndef CONFIG_USER_ONLY
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-    gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
+    gen_helper_mret(cpu_pc, cpu_env);
     tcg_gen_exit_tb(NULL, 0); /* no chaining */
     ctx->base.is_jmp =3D DISAS_NORETURN;
     return true;
--=20
2.31.1


