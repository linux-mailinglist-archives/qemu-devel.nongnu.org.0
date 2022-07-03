Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2FA56436C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:20:57 +0200 (CEST)
Received: from localhost ([::1]:36042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nM8-0004kf-RX
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEN-0008An-BX
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:55 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEJ-0001p4-3P
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807170; x=1688343170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XOGoS+LaSNx9ztfN+554+3MJdJHKkwrfOy2g668jrT8=;
 b=H1qVyptcUusfzZMQ1HJnfwGIuZyJfJEwJxnICU9BQNIsoga2kB3pm5Wq
 Q7dgdOX0T4Xgh9+vadcbngidx/Jh5H7zvSlKTd2xZi7rPdvRRj0pTilXT
 X4KaehbEMOE94DHB+C80J5kPfEkMwTvse0ApwIBw+cbYakNY2Szu9j2It
 5MigeliB4kXiacED8dUisZVpYu64R9MaeI5VbO207lWtrHg16xISCrfk4
 tSUQ+nocRXa2dbizCA3A3TP9DeNIXIb/naussY1qsRxOSx2fMH6m5uEkL
 CN4dHq9B5OqXj9crmSRG90qJkSajBhymz0G5jgz9jH1QZIXzc8ksD9dUW A==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667216"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:12:45 +0800
IronPort-SDR: XnW3QGYg4u5FUyo96/cqSMeWjBbhZfS0MoBAQ0qAk4bFRxbAGQUXNsMSeXYJBuTfUCbt2lMG6a
 5UOK2OlRm6JAVgoNBDLuzTgZU3FPApDtrHb4FBqJHyXG5MxEJZYYDLTZ3LOfiO2PyOS0UirTXd
 cNon0Q9Gp20chBUqK5sPPX2sgL2mWP4CP/a0Ei8rrsznTk9gYffo/TYDnCH4sMjpuG4l9lAhyp
 blqTidmeRG906veTEtfgR77kwIehSNvyWXX/mW/TMs3lbA9ODd22q/qBgEXoXfiLkxA+wO4+6a
 NCRc9e6uTmAtOvSzf5wbB+At
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:07 -0700
IronPort-SDR: uUF6PoEQrXIMe8V4hvBcR27OweAzopIxutf7LpNm9rdo9kvMNifvHKzHwodq8E1Vpkko0azWRf
 Td/3/cDS3uMpsty0YW7qDtcupU/ahYqepnLgIB0H/PA7wGteU24MkBHaIM++BfayziXFrKOAdy
 9aueoWMgu7ttS0bdd2kj8tIo9qBlvdWTXtyJ1MJByz59i/bZn+Fb0AscWQbenbzIgaeWaLuyaR
 vr2xZ4RHaw4L8GUdnqVy9Q76Hfeuo2FbRNzCLX8hIZKZoDA1l3BtkuaRflmjfwLxVFdQxwsNpY
 ilA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:12:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8XF3qycz1Rwnx
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:12:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807165; x=1659399166; bh=XOGoS+LaSNx9ztfN+5
 54+3MJdJHKkwrfOy2g668jrT8=; b=sflzhH3t7LMGZBhP29ka1yeSpfjCGZgM1u
 ZZ0dEmgjYjF0+B1XM+09C9bKz5teb0eMrW7D31dhH/cFMHXa2QnmpxwxpILhk7iV
 sDtUgoBWWegodfZyGC2gdkOMOB8WC0a8E/afJMpQbLeL5+4LuazsWOJ2rNx37EKa
 8ks4k6PDITNgBsazoMbNtzpB4Y1FwT1PQIOMOfHZ04HoouJXgoqELLVroRhlLciR
 dTOOB6IzCjltd1PkHW+navU8p8anp89KLx8dKymvB20m/f7bz8iR96nfgu0bwzf5
 xbK+TrcywGpGWICcXuHShtLaMHL6hhmONCeNJMbPd7fi6ue7CFNw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id cH9kQCcHDNrQ for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:12:45 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8XD0GRWz1RtVk;
 Sat,  2 Jul 2022 17:12:43 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 03/19] target/riscv: Remove generate_exception_mtval
Date: Sun,  3 Jul 2022 10:12:18 +1000
Message-Id: <20220703001234.439716-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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


