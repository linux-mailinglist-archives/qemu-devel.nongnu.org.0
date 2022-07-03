Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8141564361
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:11:58 +0200 (CEST)
Received: from localhost ([::1]:38828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nDR-0004fX-R1
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nBT-0001s6-71
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:09:55 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:56108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nBP-0000vh-Vg
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656806991; x=1688342991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=313dBeAD/+njONzvGGqB/x71wYKkT7Nvi+L1/eUJaqk=;
 b=kclx/OboGcOfV9Mxen3tONGnrwA3VGyNk4aLoPfkO7mW75OYaI60kU3c
 ZFStgyv6M6GLfJBdtlqFxA/drGKGWUQObEl2X4/ZygzM3hJH03q3kDV8v
 e/vNMr/9noPzXZjb5nGgCMpQsAafQr2c0EBwerC1YbRRX1ZG7amKwWUPE
 Q/9KfXOzZmwAC/ryrhmENBnSmCYq95mF3JC4RB2eoTVAifnsHr8ia5kPU
 SL1uN7z9ZddGb55tc3W4BCE3cRP2UOmLOotqbxTPEdZ+z9TMVfFRMMZj7
 2huasWZ3eZGhIv67kxwmIUg6OhmLaalsMB+GE6tDYqKFa7cRFYJgtUYI2 w==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="308989610"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:09:48 +0800
IronPort-SDR: TbzCC9X9FKOZaigXbihcI+JvcEjbkyXgLN6J86YOhTsz+vTHuhyf2tBa6fNT8wyCdtgGCePHlh
 9K4/wSE/ThvOHd6Nc0QsLlgfwNwgtFvv3VQm7rQIFF2OfP0s8vv1YkUHtF7T0c9KjOb7JlInIp
 FLgXTN2aEzkz2MWYSpNipfBbQepZnsiVwSNyhPa+jeLPu5lM1Yhf1ZSfYCYb3GQDpKtDvqrah5
 rtDvdeCDuP08TMDaMOxm62s7JntwfsAo7TnHwB+3O50u8IK/h7tliEWnH6jWRMGZZ200Hp1Ubi
 nLj+gC/Vz8yIBeNyObPCPu0Q
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:27:10 -0700
IronPort-SDR: MBFXnXoFAqUczSDfLFyHadVpKc7RnzHoGmBcUhH/0674Q/E8JyOjWqxFLB4bK1FkL+90odaFS5
 ccJuX635m3IfOSSm5uV19p1495dVZU7YulDf34A9gFCNxZn1INZyB2KoXEt1XPCg+kRBQ/rLPB
 fw79wMxivQFQmsdNNLrltuttBcmUq4eY9Nq3ThUGB4ebQTwdi/hlFtmpsgvAc1j9mEbweeAmc0
 cmCWJVQSztzg4Fjcof9vd2kqtKU/mdEtw5rMt9DtJuehPsY0B8GHwbcFPE+a/FNvP2IJJrZfjj
 XzY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:09:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Sr3xr8z1Rwnx
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:09:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1656806988; x=1659398989; bh=313dBeA
 D/+njONzvGGqB/x71wYKkT7Nvi+L1/eUJaqk=; b=PPhBEyVykHG2q5N9s0n9jia
 9Xw0ayrMpW6qQ65GVAVbgwex+y37lDcpUU1xRD/wx1iKyUE/Q3tCWg+gcp3lcHSQ
 c9YHBS00I6owrGmDs72V+vnS39Ucq6d5C9lVvdjqCXX6Z8Jir+uoxbx4IbpyM9U4
 jCOxPePbr4JCruEcn6/YAiMBx8BKTFS8sVmoNZgc/+7GPpOVD9sghCDqQjWNn1Y4
 77fXJMoeeOkESKydJFb+Bi3ZXEPIaSsjO3VUAGWlLlsY5sSLnoiw9C15tWep73w2
 RSGUTeXU/lPhzsMKq84lxSYhoaIJiqtQ869quqmJhZXrZBx1lJ7qMRwFb7Nga5w=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jbAvXURIP0mi for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:09:48 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Sn3Qdsz1Rwnl;
 Sat,  2 Jul 2022 17:09:44 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/19] target/riscv: Remove condition guarding register zero
 for auipc and lui
Date: Sun,  3 Jul 2022 10:09:20 +1000
Message-Id: <20220703000938.437765-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
References: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Commit 57c108b8646 introduced gen_set_gpri(), which already contains
a check for if the destination register is 'zero'. The check in auipc
and lui are then redundant. This patch removes those checks.

Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220610165517.47517-1-victor.colombo@eldorado.org.br>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index f1342f30f8..c190a59f22 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -32,17 +32,13 @@ static bool trans_c64_illegal(DisasContext *ctx, arg_=
empty *a)
=20
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
-    if (a->rd !=3D 0) {
-        gen_set_gpri(ctx, a->rd, a->imm);
-    }
+    gen_set_gpri(ctx, a->rd, a->imm);
     return true;
 }
=20
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
-    if (a->rd !=3D 0) {
-        gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
-    }
+    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
     return true;
 }
=20
--=20
2.36.1


