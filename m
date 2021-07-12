Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEEB3C6695
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:58:42 +0200 (CEST)
Received: from localhost ([::1]:52584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34sr-0005oo-41
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oK-0005FH-Gy
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:00 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:50568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oI-0006ux-DS
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130437; x=1657666437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PxMspOk3+BuBy2D/exxvDUQtwHonT8cvBBgfO7w5J5c=;
 b=ghRXEXEr4s/C2VBtRiatj7liJxgxd+p/x/JLcJYxeFc12dxcPVHwYFBu
 j8kw6ZVWG3PM5BwaaFZ/Bcpctkk77zVMmJWLWrgn3+GFZgo98po8869Rk
 S/hM+0wOYW2oGwmSPZbs4DNoGGQ4G/Elc3OEUzlhcgSCxOTdrz9WeuP3L
 3fXI6oj5b4hiE2K71e7AZ8NtTCCJ6ruyvludzQ77sRpTb2NvSN6W8t+RC
 cU6OLtn9T9nP8O05CPNdWQiwhSEID+U7XuriPpniYbFHvfQJTb+ON/Ctu
 TD0E95fxS5Bg2mClNUFDFO55HxNJNH0dmQMdlgrsdMJVaAFL1MKi04Etk Q==;
IronPort-SDR: YN+iguIlvCDY5GprcwD5zMyQ27oh/x8D7M9hOuuk9POMbkHwOoAgXmQ280HECXdQl3Mq2tqxb6
 tEKkv2HRpR1vVEuAELvpSEBPBgnQZ4Zy/rBonVqVAbuK7SmxfnvHJH9PkG5fTh2Kaqo9JlRN0W
 eoBOmrHDnyYC09JpigixySQ2dh5PTnZRTpVUvvySToB3Q1AztsFrqtBk/Ti6QZIYy3GE2EM4Pn
 eO200eqVhSLIxqJkfFjd+GldpKH0qK7M1fd+29SJz/rjCCY2zd/BouFs7GKA2ffcIpefzl3lWy
 n2A=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174398530"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:51 +0800
IronPort-SDR: 92JgdTVstpB/WO0lMLLS5sErWYzrCtxz4iQFcngMw/Rkd/4xPCklV4MrhB5OT9q+Ma5zm8bo13
 thhv2w9kICwUsCdf0x9704ft8Nfq9p3z1fZJUJJfHFAJMjwwnHXa1FmJydukU/DT7+kcJYIbsD
 h6GpJ63NKMjcOyoyHFSTzfwKk4u2j4QZh2mSW5sq3xiKcFvi7T8hRw7tDYI48mrnT29mKBm3ZU
 +dw2zTLHrzvo1MB9H2YCLSJ7jhOt5goLtTyGr3+7IjkUZpblk8cUTL6rKTvWG4xB93lfPqA1EI
 2i9fYwtHQOwxYVZMIeTWaHkY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:30:36 -0700
IronPort-SDR: W9OGMe5SQza8L4lICspjxN4K33kzq3jxYxS6RWcsSr6zuOndeb0EMY2Fq+uvX2h+9J+9DXxlxc
 aEo9/RTN88g3duw2GReKODqooGK5cKd/hppzqfNeqH7UyVn/ThmUajEgk4c8nW8DsR93KLnhid
 5kRGVGG6nQncadmhZdrUVXEM9icNEKO4LzBg19oHnv/l0zXrLi/3XmaGaoVrDc3OvLDd+D8fcA
 e03TNB5S7sawGL5V3m3eGscQs+WMsk14Oc0/IcDwLcuX7TS4DYhjKvfaJe1eMPFb3uCmFV59JE
 Bxo=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:53 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 09/11] char: ibex_uart: Update the register layout
Date: Mon, 12 Jul 2021 15:53:46 -0700
Message-Id: <20210712225348.213819-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
References: <20210712225348.213819-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
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


