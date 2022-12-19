Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1121465066F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:31:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75ij-0008GY-Ju; Sun, 18 Dec 2022 21:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75ih-0008Fx-CR
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:35 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75if-00013c-R1
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416253; x=1702952253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SfKxA8G3IanL11OZNQXCiMwcclKpFSTH9ixHNUN8azY=;
 b=pQzCRDlXaDyo0XKgTRroqvsI7KjHIGD7rcwfewDNDMIrovyFhjCIKzMG
 vgzwFtXu8x/aZYeIogpVMX6Zmd1FrsNqPj+4NQWeuXU4X7OlxHABK9Wwc
 aza/ZLItXfKNzaoDiVbVO9DfPN3hKIc/iblmQSaoNnWELrFcddz6sLeJc
 RAF3vU6zeXWFSM2c8tn0+cQqDRj0s+VdKd3A5AU5X3e1hhzqF+xHYCPd+
 x2gdYHeUNr1lq2B3RmKHLhJOAf4VpHXYlsmOkhG+qn2V5dbAuzDt8y8r5
 uBpFI4/qI8IgVGe6vD1UWKHT7uy12gIQo4h9HyrlwUIT/L1/c+3YDzOUB Q==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199303"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:32 +0800
IronPort-SDR: RSdFX/Mxx8PG1iL8ctm5jbQlHJBcnt6m+TWlEwH09sjawJvSDD8aUYc4HoLjaT14F3MHDDo9V8
 MkkHmqAPy1owIlx2KO2i+5aKXunwEkKlhwkwHdY+i9M+BYun3oECF4TmNMCMRGf5iP1lmoeBqQ
 G5fTfOaKr4Rxbc/zzjoyYc6ewVMnpbBav40wteYJBdGYTV9z2KsBTX6WJjkZ45o2UgoDtj07IM
 mNSS9MN+qUpjWTJZPBeg5rYRPlViXV2qiagtSCFKe+5qzYDSBQjqGflpK/5S4XM+KKDjn7M1Eh
 FI0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:05 -0800
IronPort-SDR: YwMe8NaskFE1G6nIF5vIjcXsuBhEH5M7sIS4Jiqx3oaBsgP6gyIj3jISQ/+cMVkxeipqqSYvNF
 Pe27e44kQlhM4TFtA7Jeo6bPd5Fiz2SP4WXaJPZm11nkShfYBPLcsDC3gyh2U/40nVKFGis2AB
 enV+IW2iRLtTXgXvt/XVk4TYlu9DOsGh7puELHtF3lwoor5GIowB7QBOZsyDwQf+ZBtm5uAgIs
 J30bLMdgqhrp+OI+IOCFnns5fBCC8xb6MVkCMuzS975pnQWgeK+bccu1K0jgkz1Y7db3IYIDa+
 +Zw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3JD4X7Wz1RvTr
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416252; x=1674008253; bh=SfKxA8G3IanL11OZNQ
 XCiMwcclKpFSTH9ixHNUN8azY=; b=bcY6G62ZTlPda+kd9sFIUVzIy1zvOVNMSc
 IxVW8EV9axf2XlTWj3uftMOfxBmMQfEMLxuKbaSGYZapttYh42fhATIoS/kW5HaY
 JC/TfUMvEJIwJEr43PSHERnkJVgkpODnYzFw9Nkc9pRicZr/EJuFetlujci6ySNR
 0yRrfiAAmdyPjFOQuSTztZdqMHaqKfO0I/8bgvCYafIuo9idn3/tsjaBL2aFnCXQ
 3+hE6FtcSfD1Hj3M4ymOeq3ki7HoyFCYJDLR92/e6MdrGkrWRWgFClbKUGkfTHbH
 8QA6DIDUkxiaXBEmsprYgFaI1Fq8kwExOUUaTzEgCFyGZsXiAJhw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UjSSxseeIZPc for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:32 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3JB2jd6z1RvLy;
 Sun, 18 Dec 2022 18:17:30 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/45] hw/riscv/opentitan: add aon_timer base unimpl
Date: Mon, 19 Dec 2022 12:16:26 +1000
Message-Id: <20221219021703.20473-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
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


