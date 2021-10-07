Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA35424D6F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:52:24 +0200 (CEST)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNGR-00052W-Nc
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCc-0002cU-5p
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:26 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:23991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCX-0002kX-4e
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589300; x=1665125300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ntQwdCXbUEnWxVDcFkc5UHPaHz0pKJGEa4uMX8Vxdc=;
 b=oCbWr7EqHlhIK3bqC18Z6qbU7S+L6J5If+MFVETwSZ/lomBDQZbS8iiq
 yyierhuPieSFzcLQyBdPkXW7enEOk5xjK8ByXFJB51+4CMn2Md1yVUhEG
 pfIXTSQ4irknWPA6oRcUwEblCnGB+EceZnavfSor2/FhOoWiAc+qKwLHx
 hsFKqSp2QpWWoivurTSG1Ik9D5POfV+Xcx2z/xXdORnc+gJmQV/ZLot1B
 qJW4UYQOPS8Q1tjIwbQ9eaHqIJ+61POxfm8fPrq4948QkxiBSgmEWux54
 ME11Lz0kjWpRcNifBgOVcdidtcVGqVATfqoTL/YSbfJGEqNpFurFBnHk6 g==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="186894838"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:48:17 +0800
IronPort-SDR: Oy+ML3gYHCNcD9kfncwI7rhpGml7U7r2+q00BYxEa1zr9x1jiwgNIojh1bbMN47ZtexR7PGzJD
 apbiXvytzyZvtbeltogn3cmOElM+nVKi+GE+zAv26t7MtFgkTgRxuvHHXj82+Yuj4zYcSTrcVz
 XkacTHd3xG/Ry7vqrS8YsxUD2cH7Rmb+3FMgntr5OjqfIV3DN5Ys7Gqw2DYzL/03+WK1N9pjwg
 xCDo+nxcbZrzsG353vwTdRcDLaLFM/rzhxyvCUB4YhalsIBE4jwxY/izvOEE/9tO53K3RE2H3+
 E9ZF71+Zmnplf9oX4Ivo0zIc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:24:12 -0700
IronPort-SDR: 4k+rvfZLef8weeJX2mjuO/tBnIpKUR5mgWme9LLVtdqdr3/KB/Judd8CUuFtvhd0LFs4NvmYeq
 CzWPpQd3rnCNJkNlU3BYjw/GWCRAl6EyA+X0IIn+Lcj8WN+hJikrl8GRffcM84rbW0Dy2tXDm3
 +efmV9ByL2uUvbUATU8f2VcVJRdJLfK1WVyHuF2iPfi39noAq2iTLoS6z0fqxW2iYxF8Ph8MjC
 eap6DP1lOBooEl9qzIi7+6OOWG7uzTGivAQ1mHmziLOEpsFmniOdbQJQgbeEKG1LK++yTK8J7N
 e0Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:48:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ22n5SNWz1Rvlt
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:48:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589297; x=1636181298; bh=4ntQwdCXbUEnWxVDcF
 kc5UHPaHz0pKJGEa4uMX8Vxdc=; b=liwd8gpUQZ+lcc9ZKAzbSWfLhPFh5z+GSK
 uHN/xUKr+wG6m7SP6BkwAyJjFK55QQrgAwlewbszrQFV2+elB1BFhytMAYa4hBv4
 3Y4a2zemsr35Mah62d/Z1XjrXqsMh6JzOiaZ3zpeKjjHgan+bqcpe3g4H5QoL50b
 q3aEzMHlV0q23A4SZ9lEXEKhE97ty8uQx1GxrY5yezv0qS7c7A1CjKSa4IyrsNVo
 oFnEkBGRF7ipy7w+s+7mPlAUN0RU+aW1UcU0w+GM4iJfAMsz3VNzVS2dtURcLGYa
 OEPNjFTnRLKJoYauxNUssrB7n4LoHvCewculEiJqCgP7HEi4KlIw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id r-c199PxLyFf for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:48:17 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ22j03rrz1RvTg;
 Wed,  6 Oct 2021 23:48:12 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/26] target/riscv: fix clzw implementation to operate on arg1
Date: Thu,  7 Oct 2021 16:47:27 +1000
Message-Id: <20211007064751.608580-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The refactored gen_clzw() uses ret as its argument, instead of arg1.
Fix it.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210911140016.834071-3-philipp.tomsich@vrull.eu
Fixes: 60903915050 ("target/riscv: Add DisasExtend to gen_unary")
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index c0a6e25826..6c85c89f6d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -349,7 +349,7 @@ GEN_TRANS_SHADD(3)
=20
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_clzi_tl(ret, ret, 64);
+    tcg_gen_clzi_tl(ret, arg1, 64);
     tcg_gen_subi_tl(ret, ret, 32);
 }
=20
--=20
2.31.1


