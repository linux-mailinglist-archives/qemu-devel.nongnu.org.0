Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901B44959CC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:19:14 +0100 (CET)
Received: from localhost ([::1]:41248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnGT-0008CH-K9
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:19:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmwt-0006jd-H4
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:00 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmwr-00040f-D7
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744737; x=1674280737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VSEfC94CnyqVn6RWb0ohP1Qs3rgCObOrp5haBp0K+tE=;
 b=Fk8C5+xjV3XwoOxdr0tI4FoaXn+3pORMXQG9l0qtk5emyGdMTa2yL8yO
 KPbzYG2WvqW/ClIgPl1LiPpjvpv5kDyYzmJVODYY5/KB5aMHOexKobE82
 SXDXLnpUBMINQTYC8EZWNMIfh78YlFfRMzrQjzONxS5a6BW1Cn52yaRKW
 W0K0GxN/tYveZaKqb15hraFhQ29MDV3Pwct/nWEMAU44aEbSyv/2cKTur
 zLay4A9WMo1P5Rikyk0eFwe3nf/Paw0VU78wuMUVP1FWsP5+o+eHtJwHp
 gHKzScGQ8FhTQS5tn0X4xXyMs4bnC+OGNkYKEhTcJ8PwFqa1Wg3GMHE74 g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976471"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:58:50 +0800
IronPort-SDR: RY5oXF6kzdd7Y9qERhsVUQXbbkLPZBLr1F4wbKwkeFaw6x/NiaptlHi7yJIPKIi7oslAE3WJ27
 jPIet3NKdKLE12fZbCbj9+GWHrAYTx3hgTxrfn7sQea+3VqfzAfAuZ2hsO8Z6MyN/pr2e2wYoQ
 l2eRF3W0EBh8r8Yr9u0MDh+Z74Tjaeeli/12g3t7D7CLOpvk9AJR59HtosU1oaiy9jyi/g6hg1
 iBmQiAOpMK+gSa0JlG0reRp3oX9gSqstQjpObCgQgnDLvgVU8QkcwsA/payqgA2WhEcP6PLZLz
 gXFa2/upO+hlXaC6SS7UtdnW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:01 -0800
IronPort-SDR: 9TV1vSJ6IMBDABdSiBXOEg1ZHSeb4IioTVSPnDZ6W1VKfiZmGUWfjYCXhWJg6AoBynLl3i3Es7
 02JHpjzvqmHMtKP5heCmMUBpRHzSxRAsSn+LbagrdlWbIKhKkCuRUE3RpuX4p78pGpe+Q40Rrf
 LzdmqNtM+HTR2HMxpK/gV3DKyjfrpg4iqBZIaaEDrZ3X7thafHY6++vdJ81yp3YKX/B2JYqDrp
 tLQOM8udvuYCv4WH/tV72vzkvxCt5PdT0TIyAT/Hzt3jrDYhuZKtJNjYxo9115purY5MsRRTq8
 +sM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:58:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7wn6v0mz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:58:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744729; x=1645336730; bh=VSEfC94CnyqVn6RWb0
 ohP1Qs3rgCObOrp5haBp0K+tE=; b=l6/kj2rYeEg8Zb4RkeCjRZHI9GiEpm0Lin
 OSJzCVLnlUYC7zPS+5YaCVP9eSmbDokMI6HdtU6zob+LwkekeS/iJ7ACX1IXEO6x
 oTulDfRuHFvXK1tigKZMAM20/CPgdmKX4SjeMFB3+Jidkx2P1YBOD0bQUDZqjgmO
 nb0nbFx3fTSNU7AifEueEFIBZWrkjiLZOy2+PnXLb2d578fjEZ2WpCe2fOg6piW2
 77GXIADBk1CLA10Penr0EEOhrfREc4pPNA4D+FWm2B/0gErBSjWjT8fHSKzBeMxd
 JTyQBjBCKxoQvg8sSJjI9GComn7zWa/n1ei9ZyjDyYNyE0rAvHxg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id vY46-oguMOVc for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:58:49 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7wk0xLSz1RvlN;
 Thu, 20 Jan 2022 21:58:45 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 02/61] riscv: opentitan: fixup plic stride len
Date: Fri, 21 Jan 2022 15:57:31 +1000
Message-Id: <20220121055830.3164408-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

The following change was made to rectify incorrectly set stride length
on the PLIC [1]. Where it should be 32bit and not 24bit (0x18). This was
discovered whilst attempting to fix a bug where a timer_interrupt was
not serviced on TockOS-OpenTitan.

[1] https://docs.opentitan.org/hw/top_earlgrey/ip_autogen/rv_plic/doc/

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20220111071025.4169189-1-alistair.francis@opensource.wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 0856c347e8..aec7cfa33f 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -160,7 +160,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 0x18);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 32);
     qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 8);
     qdev_prop_set_uint32(DEVICE(&s->plic), "aperture-size", memmap[IBEX_=
DEV_PLIC].size);
--=20
2.31.1


