Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D305439EAFA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:48:16 +0200 (CEST)
Received: from localhost ([::1]:37056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPuh-00079b-TD
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPek-0002lX-TL
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:46 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeh-0004dW-GV
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112303; x=1654648303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wQ2jjzM0oeWTMv+l8f/0JkBPS0uot/sIl9sr5X38ris=;
 b=mfRRux56WnDdf3/yoTs10ywcufNREauSfsw3IEpxASgDHih7B+Eu/djo
 IM/TBZMDr9Ew2VAnAg6QOfvqZwDvoG3S1Hata+IXjzcMBzP0zkvexBV9h
 zt2GU92IvvhaprCSGpt98CevaIEqgtViWOyA0TBbiaa2gg6yoW89qhGyq
 ZWkoGaYYCyrMPr3QobMGYMG/imseF3m0+aIfk+eUqyZBdnveCnLtRVgqX
 1oazhdhMpXL+TzHglQH1DKsZfhOmTOw6L1Jmi0w12SOpnh3hzJE8eb9sy
 8zVbsDRofb5mYSgBdPnIRSar3XiMZP6NAWrGPjmIWXPuMmAy9wiTFLZO3 Q==;
IronPort-SDR: yB9aYJ6NeXLv+DKGvHOYid8MSgIWuNEIbyQvKBIw1FsEzVZL6SPGMB8uu0cVj1t6lu9VGKGpqQ
 FrbtuQXY+N2/mSTuWNyyIAoLcYmdRMZFxj/Y+BaK0uY0eGaQIxHABK8o+wF8nFSLqufUAYu0ih
 hHjvx/L8lasuVp+v8EyLyLbN+8D1ax2VF/8QkiprVPf8jSFOeyWHY73wIlqa+iltV2AWElPtz2
 7m7drwbYgv4945bDAL2vFWU5kB6ElNbkFLT862Qc2SwkPgi/0zhref5TbMRkGdaW1IweRi+AxC
 5Uc=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087433"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:25 +0800
IronPort-SDR: MiScLgn1qTtX3ZowaG65L+xU/siP5DAxIMvafaUIrks4G9iyxiuAX6VGUR74bZYZobgO5ayYYC
 W1KRVcnEF3X9QUjLOe/5dlmvehb0nZpImKnA290M+vm+HtTFhKiQM/+aSB4Kj6DpOOiG8bJI4W
 DxqEtVZpQeVDaHZk3L7iON9kp3sM101S4rL52IBwGQa79gErBtUpVrcN4tmR8jLgVoeF/qN8Hi
 vo0JMk4QjyXSESbMYkQbyzjN10zeB3MS6QhbhmeLDkCotMfEoXwHE2z37zMAF3DEn72K89U1dS
 OKhLi2VE8gGaw7ZIXidwZhZ6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:32 -0700
IronPort-SDR: m0H8TVC0BdhQcC/3yQB75WEhDOzTbvDzWeoTI9MPFEkCB67LDMRRhzfzzzYrDCL6J4AHovQ9P9
 MSo9nKZpehUFecwaVgKyh3StAJMtg58nhVzdAdC+hc3eVTibWhp0N7kYldrENglVrQ7qOkU8Or
 tfvcvvn0W50cF9Egv4PomT96EdnFz7k/ucC2gg2Gw9xPN1KKh19zcEFom0Anl9kq5yShtpTQHq
 piLWJG8YnAoLjtzaJjju76XpB6Oe+BnfJhvboa4BTd5PIORCAZjVySijmGiPW7fjRxs7GWROBj
 dRo=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:22 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 22/32] target/riscv: rvb: sign-extend instructions
Date: Tue,  8 Jun 2021 10:29:37 +1000
Message-Id: <20210608002947.1649775-23-alistair.francis@wdc.com>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20210505160620.15723-8-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 81dfdfbafd..9361984634 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -663,6 +663,9 @@ vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+sext_b     011000 000100 ..... 001 ..... 0010011 @r2
+sext_h     011000 000101 ..... 001 ..... 0010011 @r2
+
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
 xnor       0100000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 5a4fc02f70..3d594e8cb4 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -95,6 +95,18 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
     return gen_arith(ctx, a, tcg_gen_umax_tl);
 }
 
+static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ext8s_tl);
+}
+
+static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ext16s_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.31.1


