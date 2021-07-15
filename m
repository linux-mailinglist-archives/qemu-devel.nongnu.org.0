Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBBD3C9999
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:25:33 +0200 (CEST)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vkS-0005iC-Vk
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc8-0005fY-Jb
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:56 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc7-0003UP-09
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333415; x=1657869415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PxMspOk3+BuBy2D/exxvDUQtwHonT8cvBBgfO7w5J5c=;
 b=f3GV8TghWWXVv3/7qWVqsmfbvWxnQnnj/MX+4KNk2Z/sJtUfp+UOOpBz
 FWCK2EB8j6mV1zFEsMRWgf4JDvzLm8UyRysV3KDXONRq60kn0PJHqjo70
 hEMea8BLoY8JCBE205jUQuACBZFW3E2oWAwAIeYsxRVwXnfxRxk60k72V
 bYXDcD/CyZgbHGbMa5/2akch811itD/MD3C9NoCDmPtzUMUYmeEDVHoqU
 32o5cp1NzAKenHm1sruxhQElAFSm3gs8HanvTD2ckYbBaTjNrtY7b5re5
 Aq9vMx57wpTknuAISClOEfSFlkVrg6SNG01t8WzML/xcZa1xkyO0LM4nM A==;
IronPort-SDR: CJTvfja9RDngXwzGAuQeE74fA1nSxYDIya/tLWU/iCwQX2gydAd0WaEyEjWT4dzuozYYwxxGPf
 ZUv0Km4Eh+95gKr+hqE1VAIEgwAdGXdYt8YHrNvwiHQYJNbdir8iD69FC6dfI4Z+Vw4oUyhj9Y
 RCZGzawqoyRFrXuycx9mSbMKiBVB1/UdEzNm18Pjapa9qq8Glr3wpQOfC5XKDDtDCsYoK7YDWP
 BIy4xK3+luQnNG+sXzoToWx/oyYu1KVJENtGgoMwAI8dGOZB3fs2te90BNFs7qT9IXLH4FP6Af
 LsM=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212308"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:43 +0800
IronPort-SDR: AAM6WS6RzclTvrP2WSxBbT8btOBxPOVDYOHav9xcnqQTjglobbsDsByDg+3RekLDP4G2ygTNPB
 CuXw2n67VcQ0QTVQgiEbT8KBEQ9c50v7vA03JOTl4xCR58KyPqHDJd4hNN3+mzjA94/nzothE/
 EfpwKjsYcjqKH4hniuqvXsNhUZBK5+bf36Zp3XOlqsLFlObY+ErDaO6dtjjCX7m1hMkbsaTewL
 vmZAAcb6MkfZiqrLx+3nSrNaBg92Z3bwMJQ3xvMgOE23jW/9e2Eg+xyUgPuC8UC/7c4gKol43V
 G8XLl9L+WYOwxS0oF5GyD2aA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:45 -0700
IronPort-SDR: NieMzRvDLvF1DHEnLBzmtGP94icsQ9gkIPo7dicrgN7ZRrsfG9luoN1Xh4qdku2fu6nvGh+QK6
 9ZG7YyATJzBPAfHiA6icwoyQl5nHHzpMrF8OBroVA0CBR0IDucsLifLKddMjvkSK1rjcVo50P9
 nF0B7FW0Fmh5b8A0PBB3UZZlyPPPyuD+QQjf+aAarqUklq60snM8k16IMvaPVwW7o3JM6WJhKz
 ZAKbz6I65clZmTAEyPqNGkpz8vaGvt8RUlQNT6TIgtqB760AKdye0RsQKtK4IuXd+qmBBrjGGk
 JRg=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 09/12] char: ibex_uart: Update the register layout
Date: Thu, 15 Jul 2021 00:16:37 -0700
Message-Id: <20210715071640.232070-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715071640.232070-1-alistair.francis@wdc.com>
References: <20210715071640.232070-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8230c157d=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the register layout to match the latest OpenTitan bitstream.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 25c8377d32f3e0f0a1a862c8a5092f8a9e3f9928.1625801868.git.alistair.francis@wdc.com
---
 hw/char/ibex_uart.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index fe4b6c3c9e..6b0c9330bf 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -42,7 +42,8 @@ REG32(INTR_STATE, 0x00)
     FIELD(INTR_STATE, RX_OVERFLOW, 3, 1)
 REG32(INTR_ENABLE, 0x04)
 REG32(INTR_TEST, 0x08)
-REG32(CTRL, 0x0C)
+REG32(ALERT_TEST, 0x0C)
+REG32(CTRL, 0x10)
     FIELD(CTRL, TX_ENABLE, 0, 1)
     FIELD(CTRL, RX_ENABLE, 1, 1)
     FIELD(CTRL, NF, 2, 1)
@@ -52,25 +53,25 @@ REG32(CTRL, 0x0C)
     FIELD(CTRL, PARITY_ODD, 7, 1)
     FIELD(CTRL, RXBLVL, 8, 2)
     FIELD(CTRL, NCO, 16, 16)
-REG32(STATUS, 0x10)
+REG32(STATUS, 0x14)
     FIELD(STATUS, TXFULL, 0, 1)
     FIELD(STATUS, RXFULL, 1, 1)
     FIELD(STATUS, TXEMPTY, 2, 1)
     FIELD(STATUS, RXIDLE, 4, 1)
     FIELD(STATUS, RXEMPTY, 5, 1)
-REG32(RDATA, 0x14)
-REG32(WDATA, 0x18)
-REG32(FIFO_CTRL, 0x1c)
+REG32(RDATA, 0x18)
+REG32(WDATA, 0x1C)
+REG32(FIFO_CTRL, 0x20)
     FIELD(FIFO_CTRL, RXRST, 0, 1)
     FIELD(FIFO_CTRL, TXRST, 1, 1)
     FIELD(FIFO_CTRL, RXILVL, 2, 3)
     FIELD(FIFO_CTRL, TXILVL, 5, 2)
-REG32(FIFO_STATUS, 0x20)
+REG32(FIFO_STATUS, 0x24)
     FIELD(FIFO_STATUS, TXLVL, 0, 5)
     FIELD(FIFO_STATUS, RXLVL, 16, 5)
-REG32(OVRD, 0x24)
-REG32(VAL, 0x28)
-REG32(TIMEOUT_CTRL, 0x2c)
+REG32(OVRD, 0x28)
+REG32(VAL, 0x2C)
+REG32(TIMEOUT_CTRL, 0x30)
 
 static void ibex_uart_update_irqs(IbexUartState *s)
 {
-- 
2.31.1


