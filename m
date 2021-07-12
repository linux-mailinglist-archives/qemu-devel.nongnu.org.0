Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBCB3C66A2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 01:02:37 +0200 (CEST)
Received: from localhost ([::1]:36816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34we-0005jz-Ay
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 19:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oM-0005Nb-Od
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:02 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oL-0006qj-3G
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130442; x=1657666442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cGua8vSKOZZ/PPn1kCw33FiPKJInMTSE/ByicFl93Ro=;
 b=hUnUNTQ1yJ2LwtHqVA6zZN/2/S8WDgbdQUfmqbK7OZdZ91nCJxPL7mas
 ov0RSDEib4VwWsI8HootX3sNLZRkZkw+zHLua4TF1wT4zA0856xh+0+3o
 CMAZMAYtOGsx19rDI0+WU1s0zBCbHezIIl9Xf/6tTtXE6qqqvyEJ01Y9r
 zXJhE5EgI70VbJN649+hIVu1QI5v80rnzVOASfMfG2+8jMgv8j22vspup
 FRBKG/yGZu8oxol2+j9kQtgjjRgifw2NEulkS7RFUvmpvdABMLiz1M+1h
 PE8E+xsi012Uo+MSVcNPIU+HcYVHQNxFiVPlGo3ojnkonFwXrUqQjj0JW A==;
IronPort-SDR: XRC/pN4XbdaO6oBgSQt2UBqNKtuZC/WGhNrM3X3T9EbSNR+DZzbOiha0dB57d4MpBd8MgwJu+B
 e+jWuuQvbxwKEPWynL52bB0YrYBxKPOrBm0Oj3TwBf7kiPTPF+HFofIiBQWDaU6G23k6wJewtp
 ruVIqldxFHvaTy/pJgPsH0KqWZOPT7wbvLMD6EJzPTa5XwRC1T450Be2zw2RTt/dFGVdudYdQc
 1ek0Pwf3jHG9plMKI32ovEoRv8eAFuAUhLCkU1adfT8rIP+x0xZVnUPsjX5I2Scbm/FpVhQH8u
 MCI=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174973309"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:53 +0800
IronPort-SDR: 54e2c2SLgFBN8gk91YAAyj16y4JgfXhnac4Rnelq6lhCqtC+kda8/Fc1sQFbwwcNbiHmaBQxoN
 oaHMJfURAME3K6GU8IK65m8HzTOnsnbk9Gm5cLz9fRYSnZof+rdwpiD8p46pkatBFylAsIkuvm
 qoQPYOFTx8/TsYeMkZHEbpzQGeODTVn5wRlKaGpd7uREOeOZ2hKdC3S+xScLoD1lxfgwv1132E
 dTIx4phf2heQXbzFb/XZr5P7z1qED+6mKOS0nrU7qrc+TcIgbyEVZPGfxCWRr5dgKJq6tPUsqQ
 mtAtZg6Wa6NRflNthn7GuBoi
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:31:58 -0700
IronPort-SDR: Uf8v12WFu1L5BucXhx3qAdEzBg7mNbmoS7xo8NqEw0hgbi4Glv6uow3n24MX6vQmq+5XUnFyLy
 i5IepCZx+BBdQNsgjVCNtCK2FeIPdsVHUWKoii65c8k6TKh7CF1RJpmkhx6N9TosaktHluIz7d
 p089A5GEewVwEleemkrQjwmeP/jeQsAFCTzQm7FRYO62/ZDbKbZu6DB2NCZkrm2BC9xnqAYUPb
 x96GONfj9TXxi8UqtGYI1rZCK8N+VU/iftHD3nEYrtFU6VZ2Dbdec1Ygb/iMxGy9LIGil9drni
 zJM=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:53 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 10/11] hw/riscv: opentitan: Add the unimplement
 rv_core_ibex_peri
Date: Mon, 12 Jul 2021 15:53:47 -0700
Message-Id: <20210712225348.213819-11-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
References: <20210712225348.213819-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: ed707782e84118e1b06a32fd79b70fecfb54ff82.1625801868.git.alistair.francis@wdc.com
---
 include/hw/riscv/opentitan.h | 1 +
 hw/riscv/opentitan.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 86cceef698..a488f5e8ec 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -81,6 +81,7 @@ enum {
     IBEX_DEV_ALERT_HANDLER,
     IBEX_DEV_NMI_GEN,
     IBEX_DEV_OTBN,
+    IBEX_DEV_PERI,
 };
 
 enum {
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index c5a7e3bacb..933c211b11 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -58,6 +58,7 @@ static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_ALERT_HANDLER] =  {  0x411b0000,  0x1000  },
     [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
     [IBEX_DEV_OTBN] =           {  0x411d0000,  0x10000 },
+    [IBEX_DEV_PERI] =           {  0x411f0000,  0x10000 },
 };
 
 static void opentitan_board_init(MachineState *machine)
@@ -217,6 +218,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
         memmap[IBEX_DEV_NMI_GEN].base, memmap[IBEX_DEV_NMI_GEN].size);
     create_unimplemented_device("riscv.lowrisc.ibex.otbn",
         memmap[IBEX_DEV_OTBN].base, memmap[IBEX_DEV_OTBN].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.peri",
+        memmap[IBEX_DEV_PERI].base, memmap[IBEX_DEV_PERI].size);
 }
 
 static void lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


