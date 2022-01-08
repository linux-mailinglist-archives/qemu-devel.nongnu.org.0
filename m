Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8B04881EF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:57:06 +0100 (CET)
Received: from localhost ([::1]:40760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65ez-00050a-IY
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:57:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64ff-0001xw-EE
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:43 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fd-0006wZ-LB
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621220; x=1673157220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qVkg6EiEys5+GJnqtJMWTSCahOKNvfw7Nr5w8GhyC+o=;
 b=nkANDy/f6OiG3h+LuTRzXJpCXCRXdLIeX3aydrzILDfvWrueoJXKcCdE
 wDjLUbha+fU1vaB4k3/jz8BNLv+N8hkPAfzdzLFME5r6RfBPsOjvZklpA
 0A3+KwVjrrHSB/73u/bV2w5l3OkvbATONe2Am9oZDumYq/1eZW57PmpfM
 7oTzjb3oD/IeQwldvMtkrlXH9riuYcN+dBqb9f6F+ue4eyPhxiB29h9gl
 2t2IJeCcpoIAR0MQXciAmbzxB20AMeRNQDNM28RaCkgdMb1H5xzEV/VV9
 AKeKHrAwumjn0flailL6JuAGinxkZeCkFxXt9glJreXw3xbo8kf+aoF9M g==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984962"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:53:39 +0800
IronPort-SDR: Rnei2yiYyRjCF4eQ8AUEcFtSzaF5+c3CeNXit5y3F8ww0TTVbOn1MyHoYLJS1G8PJZeFc7j3YS
 CTJM+cxFDsrdCCa/mCTOnvlL0VpvF5ijkycTv/ihNN78NWNXZwcmBZ3CcjIsvCKqZGAOOuTSNF
 nNzBuD3hxH1Nrj8I2m3DQX4WzEvLu1/9X6q8oocjWpHEZPJwGbtF0WLexH7Nkm5wvpv1BKZ3QI
 VBb7l1PBDCPba0WTgzxYeo4ivyCGlj29GI8yi9iOIgTqB8JCBQjzIyDafh+W4xpb/tBdWJ6KMr
 c48ee8CxDdwhQsVzUwMXWWQl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:26:07 -0800
IronPort-SDR: xPEUpQO+99eS5E5u7IgSVa2ROJFTdpWmZzzFY3S3nLWOPvCX1ei4BJqv21BYE3cUbJkHFO6iyH
 B9VnEpDgBtTDknLPN4uqx+9I1bZkc5YKPBqtRljnfI/NxrvwUQJIfIMi4/zgyPIDZ4WcgUkDUM
 VUW14CxHpUC5xiJrgqxrXJziFBWlrcIS+tLjdC2Wt/cL4rmxkKiy7O1J/Cznyu21ORcxU7cPjj
 oEcQL2LjDMOr1YJXA4H5M3b1hm3w4QckJ/QfgbJ1Qr3T/o2h1P5kZd3MvLccEigWUyGI2NdZV7
 wfQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:53:42 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Qr4JXXz1VSkf
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:53:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621220; x=1644213221; bh=qVkg6EiEys5+GJnqtJ
 MWTSCahOKNvfw7Nr5w8GhyC+o=; b=bn69SVEec0zd8/bf5nVsKLPb0GeJUuDomm
 bmbXoek5X2woU5gJmrak+0jLt/s63+2Y/IMRNLKDvQDUHbB2RMaKUQkSPB90xHJI
 nGxqbbiFRzmpjKnxUMu8Um9pyNHccgzDzwqPMC2/DLPRxDR87MgZuX85EJ8x/lWr
 /lP2/w5d16G9nm2rgbZ99Ie3J9lMalPQEv58/IypS10DyQtr4IstTlc+HRKHivb3
 mRJlncPPM95GtJFESvfk6y73l1EDPh1JoTBWa++mkRqfeEhUPuPHD6z8LS4M8oqH
 35a6RqLhtkMVKzKaMDut0ivBm3CK0CEnU8t0vhReylbVeOr+iGYg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id r4FbnVaYOwpk for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:53:40 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Qm5P64z1VSkY;
 Fri,  7 Jan 2022 21:53:36 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 35/37] target/riscv: Set the opcode in DisasContext
Date: Sat,  8 Jan 2022 15:50:46 +1000
Message-Id: <20220108055048.3512645-36-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20211220064916.107241-2-alistair.francis@opensource.wdc.com
---
 target/riscv/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4ae4345691..9e4f9c3342 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -846,6 +846,7 @@ static void decode_opc(CPURISCVState *env, DisasConte=
xt *ctx, uint16_t opcode)
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
+            ctx->opcode =3D opcode;
             ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
             if (!decode_insn16(ctx, opcode)) {
                 gen_exception_illegal(ctx);
@@ -856,6 +857,7 @@ static void decode_opc(CPURISCVState *env, DisasConte=
xt *ctx, uint16_t opcode)
         opcode32 =3D deposit32(opcode32, 16, 16,
                              translator_lduw(env, &ctx->base,
                                              ctx->base.pc_next + 2));
+        ctx->opcode =3D opcode32;
         ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
         if (!decode_insn32(ctx, opcode32)) {
             gen_exception_illegal(ctx);
--=20
2.31.1


