Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C765FA18
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:22:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBZ-0001A1-SW; Thu, 05 Jan 2023 22:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBX-00018k-BU
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:23 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBR-000892-Jm
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974857; x=1704510857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CGPWIt57qCilMV1TemFAMmCEIS4I0mHLP/Ow16k21pE=;
 b=ayVvbrllAmsRzU4zNWIFuSjRxZYAPbGKbCOGDfZK3HYjLVIHouLn4P1f
 WQCqBsO/Q4bbbecu4nkJ/+XCq08L8eiHzhdCCVzdIFM47QU/Rxvqr1UXx
 WKAmCVFI+pOWv8KhqHFP84kdJOkXGun8TrKB09HHe/yBhKxr6WFdjswZt
 vGGXTxEBTbrIpx3izEro7XrEYI/ZytFMWIkiTpWqC6I/Q8omYI1oOCrpj
 nVU1fpojuWO+G116heXQ4l0eMe6lVGP5O4SizY5CiQVTqrDuqWkKPBSd7
 urKgtlzayYodbktTlpY0PNNtKGzHGmJwgdb6+ZPTdnEZXeMrtsiQxXqqr Q==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254753"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:14 +0800
IronPort-SDR: 1dmVk900KwIRnl/OpHe3/pTkdt5VNfhFJmADXVGwrmkQUS68s7+OtguYSXf1q5mq9g5JpvVdKd
 xxbVMHzR3Eu9VcbBqM5daAKScE3UrBfuHG285FwqL918XLhni11T4yjIQWvsJ+A7Mq2Tkdi4gN
 1w3djbJe9xBWsifUcYWL1h5j6OvX3OuJ5uF8vvuanP8BpuhWdAoRjJYUJJJjItPRgIT+GZI+Kl
 vhwpNlWG6zweXRXGuPjO0GRDvqR2aNe3PltqoAzhmiaHQcyNVDLgYElQEXYVNen+ITwP254cZN
 wN4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:26 -0800
IronPort-SDR: O8f3FH3yGr0yIbjjDVV5AKG3L2ZfAA21PAzCPsPZLbXO4xFepus/Unvt74aHGkNseLQfukKSoy
 T66zlwrfo/7BRcCAikMi+TU6VVVZ5DwbEVEMQ4o1mK42FbkjDwpFbjRoJ37WwGS12a9a0Y+pFn
 k16qtAGJGge+97vYps2x4RlSc2OkOxKJ6+wcgJ/wuAEbeMGDBImD7A0IIRw2f02hs3sGW+oSOJ
 lV8ngjNYzaqbfQFsgVrPaXTwt9KeWGD43a7lHzsigYRi0drCrnh4AC0STwgrkLkOawjz2Lf1Mm
 k04=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jL6hWDz1RwtC
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974854; x=1675566855; bh=CGPWIt57qCilMV1Tem
 FAMmCEIS4I0mHLP/Ow16k21pE=; b=Q1XFS8909lAE9NiighNFBPwwdcdaHWqqOh
 WwSOATy7RFEKi8PRfHij/98Aaa2xnmhVhhqEUNnXrZ+8EyGe3zyr2YDYaHdH+VHI
 +QudltOWd0ys2LKoCaiwcEqm4FuSTyG8plW86CD2QVKyWnQQsEdrvLKR96vwCz8T
 f3grH7/935TIMBB6DU4XCV64zLugOZMr5hZJktbfe0RN1T+hl6ejjmMQLr7m+WKa
 iDIwwEpJ4ORh3s80LgpR+DBJ6rzj9hxjdOBMQDYULX0HWogcoN0mV4dCT5Lzf/AO
 RtOB3JoanK441TR22GTaFKOwy+RZFNB8y3zusWy8yPfgrKd6tqJw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id uV7HSzW_N9Xd for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:14 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jJ6YRwz1RvTp;
 Thu,  5 Jan 2023 19:14:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 06/43] hw/riscv/opentitan: add aon_timer base unimpl
Date: Fri,  6 Jan 2023 13:13:20 +1000
Message-Id: <20230106031357.777790-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
2.39.0


