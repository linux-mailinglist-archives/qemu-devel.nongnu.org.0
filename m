Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB62374C03
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:38:15 +0200 (CEST)
Received: from localhost ([::1]:33522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR5r-0002a4-0O
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQu8-0002OY-MO
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:26:08 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQu5-0000wu-AW
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257165; x=1651793165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hm1PZz5zTe2h985zHWYZPUO7Ex1Xb0pRXXDGBKNcQMc=;
 b=YS1Kxl1weGVE/9BYpai6LKw1gCPNQekCQtBvKg9tkCz1LQLrfnl5HPIK
 piAjkpIQ196Bp9O2lqfhmqmuo9ypPe0feuc2kl0lCOs5NCrS2LjOZQRLH
 MlfZ+PFYCS92lPm54NaNsRLG0lT10c4XPVzVQ9o5vcBUHNFMBZuGoZikK
 5GjbDis5xakiPQPysVciM+Gw0TfAsWdCFediDQvg3GHpDGLaORM+n6/nk
 3I9Rf/bOdXgsDx9x+wFNtZFzkq7ghE9+IT+pqrlIt8gkPMkrisspc5U0B
 DbF+Q90i/h1BZuBuSH4zACfCKZ55Nnok8xduTsHLfJVqiftkipPx0ldxg w==;
IronPort-SDR: 0/8r1v+8zqogio3BydB0/7pDs53lpT7DqrICeSAuzv9zQTu8v2NTYLvZQHujRnCLKn7pBMW02j
 zzHquTZm78cpudglBIFQOX7vqrG1eizhYq+wZPvWD1Y7kLUjRTmqFQsB1JkohKJxzGU8+0Ou95
 FCUuVoWxcLhQjPzVqcc1bteRUvc1eITB8zqbfix1w+iwUnPYtFH4piNdoZ8xYCvsLmcsnUCY1p
 hbPNb4CR/Aq8t+GdI47u35W9ovj7kVXba+7NnnWt6FPK6p/wleRFNyAn07J/8PVfV32x3lORZj
 WrY=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166586054"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:25:41 +0800
IronPort-SDR: k3OvYvK3R7UbdwJ2sqjwZZ2ybSDLE3uv/D2o8WKkEjWIFu7kJrcnAxqvS8Bx1q3qK1zfeKMX6G
 3aQfBHYg2Im3Jha8mpXTrBU1/Zppfjpvs9DSp94hqk+f7DATFMwsUZsAXWOZYVhID4qB/W3ux8
 /Lvsm1U8YhTeyTYmzjIfFqu+I09Zu0cuVp63kRmtf//ZZG5fPy4rJqlvKZBHUgpFn9uegzNPHi
 zMP/xp2Np0tRKL4vqGZLnY09rMbLjZAXoreAkccRI6TgfuwjjJY7YfqBl19uIqUMti07HxUibM
 H+fQcsW294jo9ErsQuf0tDC2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:04:21 -0700
IronPort-SDR: PSmUUBoE6x8Wnp+G8vIBf5VPVhkUQESNl8ofa/1aylB3ZQ/K5I6eKiq1VtPzEWEUqilAGGsWJn
 C2c51+HOnTQA0gGbwqXmpsZjZM1z2BgXIvIA5fNWKLyWBFvqPKI0ibjDu3SlyHWw9niMekOl3q
 svT3iHjHBdz3tSSIl2YEUEXOWZq3mxF3o1QnligYDiK9bBsdVirlm/37KaXErFUkVipkoXsSQT
 X2rZyQANhqu5vbgokxWhKCUPOqey6SB92zWCcc5H/QDVNqLzrrMuHOKxmyuQDgCt6mW35iBHy7
 b24=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:25:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 42/42] target/riscv: Fix the RV64H decode comment
Date: Thu,  6 May 2021 09:23:12 +1000
Message-Id: <20210505232312.4175486-43-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BugLink: https://gitlab.com/qemu-project/qemu/-/issues/47
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 024ce841221c1d15c74b253512428c4baca7e4ba.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fecf0f15d5..8901ba1e1b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -288,7 +288,7 @@ hsv_w       0110101  .....  ..... 100 00000 1110011 @r2_s
 hfence_gvma 0110001  .....  ..... 000 00000 1110011 @hfence_gvma
 hfence_vvma 0010001  .....  ..... 000 00000 1110011 @hfence_vvma
 
-# *** RV32H Base Instruction Set ***
+# *** RV64H Base Instruction Set ***
 hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
 hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
 hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
-- 
2.31.1


