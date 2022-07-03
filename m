Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311BB564363
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:14:50 +0200 (CEST)
Received: from localhost ([::1]:47304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nGD-0001tV-6x
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nBU-0001sk-Nc
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:09:56 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:56111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nBT-0000wE-4Z
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656806994; x=1688342994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XOGoS+LaSNx9ztfN+554+3MJdJHKkwrfOy2g668jrT8=;
 b=exOOWSFVG54abgVW+LnB2X9xcnvdpVcoljGnZJePkJuVwGsf/KfWV+RP
 u+VWk5twfEqLY75US7mvdhbmkPmlrT3SYHAARrD8ebj65/1r37uMRFXLo
 gAKD9pIvo0Zahsv1TER2ZP+fcT8iTbiQq3cx6UTD0fU808Jx1C/YHZUde
 H0asBqldLwYErGOsk+E1QsG9yj8MNC/7Jym3HZunqdE4GW2cFj8r28Jh7
 oUSH8jMv+GlX2JWH7dTMvHv2PWuk8rSkLVsrTJsMcqvQGtlSkLUnehjxA
 y5byNoKktpBYK+KTy3MFWdhn9c48dsPIBgvWnSb0vZ7jQc6oVCXVnSWdS Q==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="308989616"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:09:51 +0800
IronPort-SDR: Nb4TuMjuPh8U9RVwoGlN/L9+6QPR0H0FN6XqT9ZCkwUEdXrgfeBKx0lbpFSpOPuNdNQbG7i0Uf
 O1CBMwQzizIdTNHgIt0dfTHxLWXO0IpSyDxLO7paSigd2BuaVPy5lDjNL5kSHY4JhxF1FlFbpa
 cjddFiFsA3lLKgSdUkpPNrscDyLyCTY6AvzKOTMV2DFKK9uY0xiR8rRkvxUX9Eai9F5sv1CF3Q
 igxbDYjZb4RAZkSJd9XH/8tSc6csBvmAJX84BFw9TQ/WgcHVqcMPbWzUike70eLOBFijIqyZC6
 medBBqTmH2Z9gHGP+LuGZUUs
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:27:14 -0700
IronPort-SDR: xAOOH56R4hCcK+6m/r0yDBSA6Kz/80DnbnySOMGy+loGY22bEbcZlDxr6eW9e2duYa1L+ISPhn
 g32lSENbJljWxC49sGJZk8Fyu1oTukPO8qkxZJeYyIzcLDYfMtKa3RjYA7YrtEs2rLIfYyRCx8
 Zixh8/SlooTlQKckECjVr9afI3Fze+i1+viuV+e5VGISiI6FT1eG2RVXprFS0i1HFd5AdPwep3
 v1Akeou/GRT3AXRVEXRCaDfBJLdnzH9u8vEAaEQ4E49IvEkRlw0NDq1CROjLBSV9sIrRYuJIZJ
 8XM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:09:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Sv5SDxz1Rwnl
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:09:51 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656806991; x=1659398992; bh=XOGoS+LaSNx9ztfN+5
 54+3MJdJHKkwrfOy2g668jrT8=; b=nnI3qnQ697vJNOpMtWXx/8bRCfC/NC3sYD
 pLb29ubCkVNSUTBu+2dRQb0pM0TMUU9k4L4bMnYjfXRcaNOX4TGhyGZxr39sUaCc
 Qv8q/yzGn+ZFUBjruEC8CHQYBZotibXZE1WTJ06reCfulibkxNo6R/WgIet/Acp0
 vTaR+frLy7YIvRkEkLCjASkjpNkW7LS21nquflbG3RbOQKK/yxg6y7NKSnl3fa9N
 fntyP0QlXfNnGnXOoRR2OCZgre4v+slswiqSsLKzmmOOf2TcRdqFhWztHiGvMSTk
 /tCsEILUo1nO6OBO69AEUeCdD9NGi0GYQWkpd7tMHkrm02pPiptQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id aRpVCw5szKDe for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:09:51 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8St23vHz1RtVk;
 Sat,  2 Jul 2022 17:09:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/19] target/riscv: Remove generate_exception_mtval
Date: Sun,  3 Jul 2022 10:09:22 +1000
Message-Id: <20220703000938.437765-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
References: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The function doesn't set mtval, it sets badaddr. Move the set
of badaddr directly into gen_exception_inst_addr_mis and use
generate_exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220604231004.49990-3-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a10f3f939c..7205a29603 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -230,14 +230,6 @@ static void generate_exception(DisasContext *ctx, in=
t excp)
     ctx->base.is_jmp =3D DISAS_NORETURN;
 }
=20
-static void generate_exception_mtval(DisasContext *ctx, int excp)
-{
-    gen_set_pc_imm(ctx, ctx->base.pc_next);
-    tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
-    gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
-    ctx->base.is_jmp =3D DISAS_NORETURN;
-}
-
 static void gen_exception_illegal(DisasContext *ctx)
 {
     tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
@@ -247,7 +239,8 @@ static void gen_exception_illegal(DisasContext *ctx)
=20
 static void gen_exception_inst_addr_mis(DisasContext *ctx)
 {
-    generate_exception_mtval(ctx, RISCV_EXCP_INST_ADDR_MIS);
+    tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
+    generate_exception(ctx, RISCV_EXCP_INST_ADDR_MIS);
 }
=20
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
--=20
2.36.1


