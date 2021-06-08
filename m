Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2A39EAEC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:44:04 +0200 (CEST)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPqd-0006gt-Ok
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeX-0002BY-4f
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:33 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPeV-0004dW-7m
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112290; x=1654648290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o05Iene5hNGyOZfvyK/ntfyzyUCZq+MDzSfWXUnwWdg=;
 b=ACt3xZ/ehpkg438bqsuxa9eBIxjaY4D8U9CyAEaUcOru080YhFYZoyyU
 h/kM/7OBeG7qd9Vdo20YzTlyNW9mXrrA2BG5yTWSYQwAz34Zbx1QKZN2M
 1iB5eKUba+XpIw+RluM3E8IXt4GTJXXOjN1QOSMnvol4ehwm+1MmPqFeg
 aE1pj/9RzYUuodVGYiOC+opeV/MHktc3dxPVE2pwachFtn3ECiL9K/UT+
 Ez3HMJZ1s5JcDao8NI/89Xs0NddbY+W5OjDx2ysZrL3l7dr/4YSqm9hW/
 YbG7wVp6MimJ5lxONQAcMbooUyoJbV05WdviHXfAKFOoDATejRaeZtzF1 g==;
IronPort-SDR: wWaztqoJ3E1hPDcUkNRrmb6lkXRNyrvdMSuRrcuj+VvtWj/jIedla4sXNet4dc176+j738qUx5
 Srm1eBkF3QWQc+mhX9QPba9+PvZX1wV7TFelkiBpG5T+jsxqsbbbCvrEnqo99TogeLcP7MG1RZ
 jFl6FTyywK0YP43sHuJVc85yAiEpt3NfqC6aPxkKJ89PsDgBM+wBJDkkQAipDOz8zBoAReJfNs
 7mQcJhWepe4hEo3ces/XD68pT978DwYNWC7kwbBD/ZZTTSQr/ujoJmeTBcV8pobcpwmUEg5vKS
 Hfc=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087408"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:14 +0800
IronPort-SDR: eEB6KSxhPjnQFhDJc1F0sRpswbfZPotHoqar+VRZhtYQNctj6+TvQtZnA4f1eFBSnI7zGP1WIi
 0ihMHAzLHLYExNNoDQKBK27IIKFlXtDGx98ZO9rOUWkbF7eSY8EkkpVe37oCXNvB2oHYPyiVTF
 cfB18045AAxCmoBK1UJDTSWUXhNM/StxnovlkhzBiXmOBJApBw7YtcP3eoonVGnu70Udp8alaU
 FxJWwnFptt+EdXvFTw15p4keG22GShTYWG2QiqBLK9WW83vtSZSAW61KZmOv7FmWff5z/nqrpe
 oSmfdyBsEUrgSsoAJDYpZYhJ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:21 -0700
IronPort-SDR: 4KoLugcV1WW6AGEyjSbJCNgGIU0qYZBJLntsLX16wijYpx8AvXQiahkudcfECm461skxsiZCJQ
 /3aGqF7829lAGlFBWAP8nIstkhgc9TV+WMIPknwKFzfg97be9FSHIzMxrYpAPNOrvqib1wWu/E
 i2GcPmlYIkhGNUZtdIKij8hqBX0v4BcdSPq2dSeSW6Ajgrp/1aHJRxziE+8Pvh2NxDMUHVI49v
 DskJiytbyQAws7J1vjnIu6ZhzrBVHlxb49zg/ecRJEnGb/VQH+2EH7idLDfnC5TDJJnysJJlvo
 rTM=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:11 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 19/32] target/riscv: rvb: logic-with-negate
Date: Tue,  8 Jun 2021 10:29:34 +1000
Message-Id: <20210608002947.1649775-20-alistair.francis@wdc.com>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210505160620.15723-5-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6f7671872d..a4d95ea621 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -663,6 +663,9 @@ vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+andn       0100000 .......... 111 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+xnor       0100000 .......... 100 ..... 0110011 @r
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 4a5d271b43..b8676785c6 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -35,6 +35,24 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
     return gen_unary(ctx, a, tcg_gen_ctpop_tl);
 }
 
+static bool trans_andn(DisasContext *ctx, arg_andn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_andc_tl);
+}
+
+static bool trans_orn(DisasContext *ctx, arg_orn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_orc_tl);
+}
+
+static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_eqv_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.31.1


