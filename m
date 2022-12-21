Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A6653921
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:56:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87ll-0007Of-K3; Wed, 21 Dec 2022 17:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lj-0007Nk-00
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:59 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87le-0000bQ-JB
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662454; x=1703198454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SfKxA8G3IanL11OZNQXCiMwcclKpFSTH9ixHNUN8azY=;
 b=LJbOyhE45CJMBDz39Ik/IAfMVOLaMAevgS8Nm+T5O3/11ARyEzBC6pL2
 lUE2E/w+i8KBOb1TtdSHs6hrsLX79OZOb/PqlwBSGh0vpgecV5JCJH5Dj
 knvTkn5FbGDqAn3ZoHjuESe4RQmtvEsg4tXI6kh/0cxCTixbJL68pVx1T
 2V0ukkAKap/n1z/ALipfeR/8U7MRsVPUH302te3h68wJVBDieJzkB4XU6
 QUC74q8cVhp8RM3HnGriIcpUra4J2XgwEKJYICtZsSPwHc9hgv/ge2OzW
 iDoYr0YQmGCRldDRAUQp2ljeenYLXKpu2F1T6G80uRzHrZZrL/so5OY1h A==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561292"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:46 +0800
IronPort-SDR: 5z3tjnAvpxNq+LGDNHuCzzcZbJLbHKEoXE2ElCmbIhBTsELweuJg2Dk34ihSigO5U+aCpYChHU
 nkkrX6Ow0ECYp67Gk4YpvqDtw7nmTDw21YXnZgLNlhaz9vzWUdMvWD6eMQhMcHGj/LRN2DW3Na
 dZTFP38GAi3Z+SNolw7ek84LuB12Mr3wIta8TM+s0vlo6789IPOiqoViU8Ag/x109QQeChfHb0
 X99lvylajkos2BkNnFHPTzf756lwSS9eNAsKr7ZV5xRU0BTHquO5UAax1+pijXbTdr27wwePun
 N84=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:14 -0800
IronPort-SDR: /7EVtbb7HWqBe+jV8Wcxcc975Y8UuaccBdRrtm4brZwOtTNJhM1y2JkXGBgPptsFvRFifr/h31
 erwQyjtQ+YQCH92faxeIPjIR2XtsVG/NnKhY+Ce6NA4r2Ytr0woBEYKER/OMGI+K6lx5BiqOX3
 u+By7Z6eyM9nnTo2r/8BSdhkJwrKXKxsMe9+J1b+ociwK0HlWaB65m4HMFavvFspY4Yb2hi4DD
 RAF8COYiM2lSjMscxCXv3ZFC/uJ8lI8uz1L7cO1Anc+XbeyErrE6FDxvLvN+1DYWj4FdhBe1DS
 ycY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:46 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLk0c4mz1RvTr
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:46 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662445; x=1674254446; bh=SfKxA8G3IanL11OZNQ
 XCiMwcclKpFSTH9ixHNUN8azY=; b=NevxLN0dZxTZ6OTYdZocdhzQAcmn4ITo27
 iDe774fTMt5KqwO0rrejUZU0F76psY+KH52cxghvXTaaFnnlsnaMQ8OJf4NJKHLw
 rnV+7oOVuJluRu8Z3uQKsefzelLtIspOk7aCw49nIXs4MD6fxK074kRf9/15nRhI
 XNGv0IZ3FtSR/RGKEq4lzd1PoRF985BXGfAySguz9l8eDlNvhH8grh10aztArqBI
 /bVeQAzC2Y1f2iXlvJfKhz5WAo0SzbQ2ucbpesywg+gTGUNKZOCidO93XoniR4vr
 k/NCzLGVpulEdo4nae2MjcE2BoSddH6qZ3K0/G6JToIsY8O1T59g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pkNruyq2HtyF for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:45 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLg6Prvz1RvLy;
 Wed, 21 Dec 2022 14:40:43 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 08/45] hw/riscv/opentitan: add aon_timer base unimpl
Date: Thu, 22 Dec 2022 08:39:45 +1000
Message-Id: <20221221224022.425831-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Adds the updated `aon_timer` base as an unimplemented device. This is
used by TockOS, patch ensures the guest doesn't hit load faults.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221025043335.339815-3-wilfred.mallawa@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h | 1 +
 hw/riscv/opentitan.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 1fc055cdff..7659d1bc5b 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -81,6 +81,7 @@ enum {
     IBEX_DEV_RSTMGR,
     IBEX_DEV_CLKMGR,
     IBEX_DEV_PINMUX,
+    IBEX_DEV_AON_TIMER,
     IBEX_DEV_USBDEV,
     IBEX_DEV_FLASH_CTRL,
     IBEX_DEV_PLIC,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 92493c629d..78f895d773 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -56,6 +56,7 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x1000  },
     [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x1000  },
     [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000  },
+    [IBEX_DEV_AON_TIMER] =3D      {  0x40470000,  0x1000  },
     [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40490000,  0x1000  },
     [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x1000  },
     [IBEX_DEV_AES] =3D            {  0x41100000,  0x1000  },
@@ -272,6 +273,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
         memmap[IBEX_DEV_CLKMGR].base, memmap[IBEX_DEV_CLKMGR].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
         memmap[IBEX_DEV_PINMUX].base, memmap[IBEX_DEV_PINMUX].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.aon_timer",
+        memmap[IBEX_DEV_AON_TIMER].base, memmap[IBEX_DEV_AON_TIMER].size=
);
     create_unimplemented_device("riscv.lowrisc.ibex.usbdev",
         memmap[IBEX_DEV_USBDEV].base, memmap[IBEX_DEV_USBDEV].size);
     create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
--=20
2.38.1


