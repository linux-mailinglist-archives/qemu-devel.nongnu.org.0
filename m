Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDA639EAFE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:49:38 +0200 (CEST)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPw1-0002LJ-AD
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPfJ-0004Gl-CQ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:21 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPfH-0004b7-Hs
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112339; x=1654648339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7sUqrMDUBKoHwq/3Udj0wRbDfDnGAD0mYweh7i1I/Ws=;
 b=KjbVyssLeH7qTyHRrGDuPYE1SIZuSIeFgnCZBEp8Jek/DcT6C3FkGNOb
 WDpwZKVslNtdV/IX2O890g8Q3FbS/hsjbEIaRfpRr8mT04te4t9t7awNh
 vyJZH65BdMNoEPqoUMgR5f7LbkWjNZQyIIE8uNHsTCB1a6hi2KtrQRVbW
 9OApunW9XWHg3Ro1JKIR9U9beDG3TI2im+vtHlnm1RxJS6+jlCGyp5ntf
 lqTvrYl5wee2vC2gbNuoyTubG7i8Kp/e4r1suOo9PIgkjRGBS5QSodMIq
 /8m9ztNFf3eGARdHKTjpaxaF2kuZ9bZKFSUhKmL8cmRiasjrLpengJIdL Q==;
IronPort-SDR: m3XRI2ZTV1q4msw6WMyUo2eRah5m+dLX5HRIld3WHbblTEMc+3purkfCRLT526O6rbJJ1BLR2p
 Hv1iYUhjo4Xna5RjM3+FsT8+1mLNx/1oHhWGSlUqW3TOXHqRPjvs11Dl3NAPDV0Jf3FR8pEM+a
 JUv3fPID9tloAmQoAEOzY8CjKdk/t7iham9Re0bAKqJ9H2A4KPA5ObtvWOSdfowWfdR2RJidZs
 FD02RqPu0ab+Gt7ck5unSpNhBDF8hq1lCoWec3/D+BGsef8cAjsJcFH6xNRmztZ1f51vDuzvz2
 DqE=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087476"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:54 +0800
IronPort-SDR: f3k0DFEqaWcJM6mQXUdqUmhCpgjqPRNu8I/kQGcAxJncCJkbgz0sB7U6aZq1oGoLa/4ow+3BU0
 V3wtUynENWLf3x41c++DieP6l5UNa2HT9CWqyQu8jSz+XznbLqOw9rClKHll2JZT4CUQS2mpoe
 +3pmy//e4offpTNHU8FztGqlqtz7B0xwkcgEVWz17P++KWXCAinUphEuzpwRzteHhBNwvMyPc/
 arRNBCQZwmkdq4FDIK9WP/06m51LCgFZuI1q6ucwfvWDrv8Q8Bqyw7hDiGtH7tvqwL/PAeEs9X
 xqtFiFRNOH8M1WrgT61iAj6B
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:11:01 -0700
IronPort-SDR: YtK/ltKe2rAARPWGSV4OQCf8WDtZUPPyeN53PtIYIG/Pm1KwrHoEcsUurhN6bHybSGV6Lvp88i
 4r4Bq6uJC2xL/pShfInKdZKdzeN3kQp3pjH9PcwU5pBgwm3Npoy4vTcTZqzlShixZt+WuLij+j
 bTPzwNUmmSJroKyvX4/ECeynJLRCeFd9Mr/P962GPElT+3b2/8uD4DPuwGrJkk+P3kNnAvpwkJ
 FOBljc6Gbr2aY2/oKKvlXpwfgh1w+nBVgKfl7U5PqtAh7VPaP9Jsio1FH6vcTGhhpUAU54GRZU
 8FY=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:51 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 30/32] target/riscv: rvb: add/shift with prefix zero-extend
Date: Tue,  8 Jun 2021 10:29:45 +1000
Message-Id: <20210608002947.1649775-31-alistair.francis@wdc.com>
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

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210505160620.15723-16-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  3 +++
 target/riscv/translate.c                |  6 ++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 26 +++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 287920ee9b..f09f8d5faf 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -720,6 +720,7 @@ gorcw      0010100 .......... 101 ..... 0111011 @r
 sh1add_uw  0010000 .......... 010 ..... 0111011 @r
 sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
+add_uw     0000100 .......... 000 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -729,3 +730,5 @@ sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
+
+slli_uw    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ae9b5f7a2e..c6e8739614 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -765,6 +765,12 @@ GEN_SHADD_UW(1)
 GEN_SHADD_UW(2)
 GEN_SHADD_UW(3)
 
+static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b27114a068..9e81f6e3de 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -410,3 +410,29 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
 GEN_TRANS_SHADD_UW(1)
 GEN_TRANS_SHADD_UW(2)
 GEN_TRANS_SHADD_UW(3)
+
+static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_add_uw);
+}
+
+static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+
+    TCGv source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    if (a->shamt < 32) {
+        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
+    } else {
+        tcg_gen_shli_tl(source1, source1, a->shamt);
+    }
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
-- 
2.31.1


