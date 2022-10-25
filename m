Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0DD60C0D4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 03:19:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on8aB-0003xP-BY; Mon, 24 Oct 2022 21:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1on8Zv-0003Oq-D2
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:18:05 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1on8Zt-0002MV-2c
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1666660681; x=1698196681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2IoVntvzUZfdQw0F/4ik/CJ/v5mblgi9D5PP7I1U8vI=;
 b=Sx5hKDv3B0Vz7zsgSAKv68++1Nfa1TDVUoGl/Y9qLV3SFtKnFIrAAEYb
 afRchkUH87YU6EwlYg0qxRXz7Ewa2Vv1YE98c6OEg8V+q/m+rxJJ90r5l
 2Gnw5FPxO354BNiiScEbPe5hHAcH8KfH0loAGALKQv2A5Vl0zVrRBROT+
 TwFwb9nibo09xDXkC/qfu6HAx0929oiH15YGxnVxiV9EeG50+PXFJnNDz
 HCG+H6NPe5wZl5RUW6l0TbB7NvUGlzMWE+kxDO3LAoeg2mBp3N+BDxG8J
 DQZdFJW4PToQ7qD/xsOZqOOp9Z8vNm/RmWOaLIDFbwMzbqu7B2UmTeQD8 Q==;
X-IronPort-AV: E=Sophos;i="5.95,210,1661788800"; d="scan'208";a="212946918"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2022 09:17:56 +0800
IronPort-SDR: mK3ss2oE8t+iym++pqrpCzqpyn5DpKpK/espagneoh8YtnmcD0ScVo+KXx7kPOZxLwpEdq+fLH
 8w9j1nqyfeufNCcg5qn7zrQjpSw++LXcHBqAiG0TgXO2iV53EvNUVQkTVCiKa9C72DAaljRcvs
 mA7u7o0OEdDZXv9Z/E4Ua/CyutRhhT22Uwcod5nwInoOJf7L94EPPVaJXEie/urcu0laKkywcw
 5FmPxOo2FuY3MGegVEcOXVcyqwJoEyROutjsCduv6CYmbscmKofiU0Z4JKqf7RuTzOhXZ+TC3l
 TzsdBILRSZc131igKj1lHzC5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 17:37:19 -0700
IronPort-SDR: ulTvG7ypqxKtmXksHavn6JP07OZzVpMg0IXkk0/QGNlBc15Z0fXe6QrOfZLJ5rEOmNMQ1fDY6p
 kMR0wlvpnBk3EfiCMOqQqS+uUDAX8V2/XRThxNrXNRkt1zeXsVcgSlqPH4YqjXAY3T8Sh37E5f
 SeIbRWIPywewKhhiTDlEiRmpfUisVtzPYdQ9xgHV01Eslvz5JXAWU75sbwZOqquDfUi9bEvWYx
 N1VTyF1D2v2ZWlv+hFib6nZ1c0MqqbMJA9itvMMoZlnMtSnP05XmTdwn1HbAv9wP34h4rvht7F
 K0A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 18:11:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MxDRv1zSyz1RvTp
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 18:11:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1666660314; x=1669252315; bh=2IoVntvzUZfdQw0F/4
 ik/CJ/v5mblgi9D5PP7I1U8vI=; b=sfz5kofCtp2FBa4/ZUTrK/LEKFozwpoB9a
 r9tVMUy22+HyAQP6Lj3N4qsDgKNvXgxAMsJ74FMBVEj1lSgzH7IodxSp0bovXXbK
 X3sH+tVUUmNbMsXqVMk9ts8nhN+YflRgBnudxiNDVcNTH1GW5KxghcR9DKQw08q2
 RyVz2RXcq3VxNNfNTZLOe6+ATF9uSoDLJcTvIn4JX+Zd/UtAjGf4TtqsKRpd5uLF
 cPAdtGOi6t1MGvutmuC9lS2Zi2OgLz7MAu1LdmJdiWysl3qt1IrEWTQo54Fsjvzx
 TxAunlUTcMsbkrd6HRbkPiS3z1TO3sBEVx4z2NXvcPzL+8DZKMSQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 53SXkpo50Wsy for <qemu-devel@nongnu.org>;
 Mon, 24 Oct 2022 18:11:54 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.77])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MxDRq6rVVz1RvLy;
 Mon, 24 Oct 2022 18:11:51 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v0 2/2] hw/riscv/opentitan: add aon_timer base unimpl
Date: Tue, 25 Oct 2022 11:10:43 +1000
Message-Id: <20221025011040.246503-3-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025011040.246503-1-wilfred.mallawa@opensource.wdc.com>
References: <20221025011040.246503-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Adds the updated `aon_timer` base as an unimplemented device. This is
used by TockOS, patch ensures the guest doesn't hit load faults.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/riscv/opentitan.c         | 3 +++
 include/hw/riscv/opentitan.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 373fed36b6..50452f792a 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -48,6 +48,7 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x1000  },
     [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x1000  },
     [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000  },
+    [IBEX_DEV_AON_TIMER] =3D      {  0x40470000,  0x1000  },
     [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40490000,  0x1000  },
     [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x1000  },
     [IBEX_DEV_AES] =3D            {  0x41100000,  0x1000  },
@@ -264,6 +265,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
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
--=20
2.37.3


