Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EEC5AFEF0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:27:22 +0200 (CEST)
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqP3-00056Z-VS
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3H-0003gw-NS
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:54 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3G-0004Ud-0q
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537889; x=1694073889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PryBPiQnlxWYDQvS/dlRYya0Kuib35WbEqA4OYMdjEU=;
 b=obZwm4IL1trXtcqP/VkbeGb7Ii6barKTawu33Y2nrwvWkcZz+tMnPbqG
 aN6xZrqoCl4NTkDDB/iHhYHCIu2di8wqQao9YnBSSTOe6X3Mu3WaUvnYu
 JADMyf66kjA+Z60fKLIj6FSMBms7IYFX7eCQFng7K0vn3HvW8UbvA8Ep4
 o1tc5jpsN+jtQXDc2gqyydg0T9KGqoVJjYh8QBpFHJm/KlZgx/jUkvifB
 KpHmos5tDyVvQQJrP13+vwi2kYBGBqPtb+dlFezS7JPJ8dp8CzFy/JLcb
 E9O7IOUop+VDXVrvsoXCAhcB/x9ppUwwZ8p97Eo5vcwqIKaGSxSAqTLNU A==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714988"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:36 +0800
IronPort-SDR: nmJn8fuwFadloc7tDhrACQvwV1HHpE1tK/Fkgni4JZCrjZ6QJVat74SyYc5DLPGA3/qPGr9GyF
 8ZwoIpB6+wObwyZpU8bLXW0HfNzhQ4YId+Fr7deZH2wTHOmEcV/d8CdJVE377sqSgxaDNoFWpB
 FuerT7umMk1x2Aecyz96YrPomIE5vDMZxLpBy34gxeAjhFgJZ5YzZRG43egLzcrKWjHB7Mo1Bi
 VBFD2q3f5buVYI30CaXIMNYN8VucsvVWPi7oShpVm3fBG7o0qr8K43ESU/zYCDuBZ1HbWeP25V
 jYlj71lQZVhoom1DwAPFFtk/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:34 -0700
IronPort-SDR: 8QeGjI6/zpOBdgr2jM4ZjPBzh2EnFjBfiCUt+HFE+fhFDT9L72eqvCqz4JxctdDScH9jR/7KsH
 U2od/yp78JMNIoNsDFqCtHq+skqBdWFGzLfssUCUpualkBppbX3RkBqvD23M3A0HMUrOcKS8pC
 fs2Joz3qeTU7mRhlZD34BNkmREemwy6Sxxw/p10WIRag7y1u7XADdjbfJxxXmWC9XVc4hRk9nE
 cW+7FIFWt7ZKahj4zHcKPjL3xnwQ6IJPpE88nLN41wixvZZBmsSdTUxl41Omt7iwoR+ykQDJ0l
 rgw=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:36 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/44] target/riscv: Fix typo and restore Pointer Masking
 functionality for RISC-V
Date: Wed,  7 Sep 2022 10:03:22 +0200
Message-Id: <20220907080353.111926-14-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Alexey Baturo <baturo.alexey@gmail.com>

Fixes: 4302bef9e178 ("target/riscv: Calculate address according to XLEN")
Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220717101543.478533-2-space.monkey.delivers@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6eeb728462..76da8db8a7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -544,7 +544,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
 
     tcg_gen_addi_tl(addr, src1, imm);
     if (ctx->pm_mask_enabled) {
-        tcg_gen_and_tl(addr, addr, pm_mask);
+        tcg_gen_andc_tl(addr, addr, pm_mask);
     } else if (get_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
-- 
2.37.2


