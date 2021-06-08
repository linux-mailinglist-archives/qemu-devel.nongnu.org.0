Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C8D39EAED
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:44:12 +0200 (CEST)
Received: from localhost ([::1]:52984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPql-00076h-8i
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeQ-00021j-0o
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:26 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeN-0004b7-Fk
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112283; x=1654648283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BA8bnTg/qGEa7YciEPjVOylu0AuqS6dgHFxWs58I0tE=;
 b=A0BORonhLO1HG4uqK1jxF7oRzIuehljPLWBzrG+BJmJrOz/XZlhJozsL
 xB/D4+uGEl6TszVH/NltpOYxPhtTyt8KQ9hDFgLLLFkJjJJ/UIM3s9ZYV
 TxCEaDuC24yNwzcPexb0Cvoio3SYHGwb5VDbkTiCesEITQwJxX1eukaLc
 wyi78oMlZu+HxYbDDBxcFsRhHpU6Iow2HZW266m3JIPi0iJ2vFsVhB6Iy
 7tk33l0W/IBEpRXe7N8MBRQLNmWu38xJP5mETaaPJAorvdRNMGxh7Qyko
 1n5HrSz6vOlmSvW5Z1h/GB/AiGtsPPXVKe7QJgL6+MYPfStKpQXNj8eHZ A==;
IronPort-SDR: B1aXmyChDTaUCnA7nISLlG+2t4ArjZxVAFfzVESe/gV29xOLuxeMt5lpNbpqrB9ti3Akk7q9mv
 CahDm4hEBLk/pGPRBNYR2xMhn/d1gSDSuPv4eqHvA0lyoe1V6JZfCXwmO21WZ4tRcAPdmFVe+J
 kF2agD7gYWXKcYJLzDnu/gGxnPCQ9IrBXp+30xIii59weBR88RI4lGO8J5gIkIBue42l46Wv8s
 V6+IEuAG39DpC58klxEpdj8Hi+IqW1lDQKTQbjEjUhoCXD8hCTwf42nwUZrZ82eaWw1bQCcmIg
 qrE=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087406"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:10 +0800
IronPort-SDR: wZatqgn6OHRv4Nsp/8ZPbm/3fj721eUdFwugx8Vm4wo+1oX5nrQbjTckrEFt3AW5uSoI4DM9rt
 066LW2jQAcJHBNd0SHRiALfmozpfnKcIMWla/revKBn7UzeU9WIHqAc51gao3yY7v1WiW+eXJd
 px7EZ/oK/aMD9kayc83XqQpQunOUwT+f1sJkzWeFSIfDMy9RU25YnJ7xVU2rGLDd3CPXWm+9fd
 TKF4BZqN9sWh5DATEeQtqkx/5KqQNkC8Z7decQSnUt/Z5ADAn0QoW15kLAFts8xJ6jmN7QQ0Q2
 uBpQDeRXYC9rUWzmwncdOBBx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:17 -0700
IronPort-SDR: M6PQROAwwoX+4G8T2rbphi1+7+uJe1wsyXwUBbBlp17mpQ0QRr6SqZ1bk2Ok0/QtrT4oDGEw7V
 R45qxa4EYrpYUF1dSNYYw++xeMtAeSK7LGPxe+EpYwxEg5+Ri3962F2pqv2u49S+kKSFInR0NQ
 rlwNS3vnnpag7vPNkcgwpapDpGZOGo4zGYRo9vbso1SNUAzimyIV0EtXY/j4wpM/esLdkpSVfQ
 l5nA+b+e/NiFWoOCAl4LRLo7gq5Mg4BfznwL5fImQKDAjgV84s15VHmlZB1XFqHxXjQWFvUdyb
 6Wo=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:07 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 18/32] target/riscv: rvb: count bits set
Date: Tue,  8 Jun 2021 10:29:33 +1000
Message-Id: <20210608002947.1649775-19-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
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
Cc: Frank Chang <frank.chang@sifive.com>, alistair23@gmail.com,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20210505160620.15723-4-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/translate.c                |  6 ++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 13 +++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9a2ffab150..6f7671872d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -662,7 +662,9 @@ vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 # *** RV32B Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
+cpop       011000 000010 ..... 001 ..... 0010011 @r2
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
+cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 60fac0fe27..c1a30c2172 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -561,6 +561,12 @@ static void gen_clzw(TCGv ret, TCGv arg1)
     tcg_gen_subi_tl(ret, ret, 32);
 }
 
+static void gen_cpopw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_ctpop_tl(ret, arg1);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 157b4e3c41..4a5d271b43 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -29,6 +29,12 @@ static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
     return gen_unary(ctx, a, gen_ctz);
 }
 
+static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ctpop_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -42,3 +48,10 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_unary(ctx, a, gen_ctzw);
 }
+
+static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_cpopw);
+}
-- 
2.31.1


