Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F56660C2B2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 06:38:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onBeU-0000uO-FB; Tue, 25 Oct 2022 00:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1onBeR-0000tw-LB
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:34:55 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1onBeO-0000i4-GB
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1666672492; x=1698208492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pn3ibjEmihEkpBwT9Ubys6jav8KKBBU6KHGHwtsVuJ4=;
 b=GVOltu265pAae9+YNGdONPq5gg4AKUI7khjIrIN3Dk0rsNd+WLXwoXnZ
 Kxfy3ywtFHLGLoH/aWNi+QP90S0Vd4tzawgWI8qnWnlUryIcAU3U12baI
 0OBPROkfmRVDM65FCb+OZ/DXhIcYRaknb36R9/svgwOcPSPbaj7FR7pBF
 OmxJOUh5lyzPue4FvnuRi/9a64uLJoKkSf3H1mby+B2y3oq2wc7H9086m
 91ykITHMEsunR01MuOSedRyN/ogmfFjCDrYb9l2e9PhnlzCKr30dZFWtw
 RTxXiwYwx7kMxRXFYApo/K+52DnPrHDr5QCFaFjhLgM96AFnx/NR/P9BS w==;
X-IronPort-AV: E=Sophos;i="5.95,211,1661788800"; d="scan'208";a="214652154"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2022 12:34:50 +0800
IronPort-SDR: 87/jBPCdTBlSAtL/cGSzHpUKfq8BkikZr3lTiRmZ6OPrrYIZLyPuFDABU90rcQ1Tphs7brnb7p
 fd3CC0kFCBPaiiwYsYW/FswLEL2G7Sa8ksw5w2Naa5tB9bUQnUKFyLmDvqOChAUoTFkMl+c6Pw
 WxW74UuD+qQoEK0TqUt1UzCPpQ4ZVhsyQNBg2NA80mAST1BILzHsf36VEbB7XY7O+Ac1bSI8e2
 xc8P01pu8cpV3Bq3SXi58zr1zp3Hi7nlukEIS51IlN1B+i1U9Sd9qhAgS5pBbQ+SmTR6aWJg27
 qlWzUuapB/eyd1jVIK8MSErM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 20:48:31 -0700
IronPort-SDR: TcmPeqZthRaWIRkmZYMfd4ZTxiDwHY1xQYb9r5JnWQqOOktypU/kvfuoqMkqaXB7PONMsoq51h
 md7LkcMp8AcBFQgvWgiWx/kVX3bWNC2G6tzb6fs9B9RGKWXwKcMSw2ZKla4VY34cSPgkgLLLvl
 2hLJZhKVCK/1/n7xvm4mJvIJEkqbB49k3roaucp1thYthc1+GX/CLTbZR8fUBmzJBnuZZZxuQd
 OrkommqbQ2wGr4Hifc0CJ+CC3lHBboqj49xMc1i0wavbVD9dyXeXyDh7+wqVZZec6Tqxo1fP+V
 AXs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 21:34:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MxJy1076gz1RwtC
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 21:34:49 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1666672488; x=1669264489; bh=Pn3ibjEmihEkpBwT9U
 bys6jav8KKBBU6KHGHwtsVuJ4=; b=IcDaMVduu439P71HuSD4cjB9U1BcJnAkKB
 D9tAmtX3gBdbTByKGAR7Vx/7nPMxJkK5EIXtcU4m8m+2jewIzYGLvWdqmHzFbZLV
 r64tKG6TlZXNXjtKNT4InkJvCw+2c0CI1ijPiKBjdRD8sxLQ9bZFf0IvY5txi6ua
 e9EEA+tVU6u1vatYEh7x11FFiNV4RUOuaaP/dFQ7ptGKKrk7NTKW5ptpdFzeavDM
 wZDNtcJVJc2TVAvyvb3MbHAvfEEtO/E+qj5UzZTtIf6wuzZbHH3LYe/IP2wko0wC
 VWcL4WEwyVDfo8a+xI8AhvkaK975UWWnDh3F6aXAKJgSM1/xP33w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DaruakWwAyv5 for <qemu-devel@nongnu.org>;
 Mon, 24 Oct 2022 21:34:48 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.78])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MxJxx0VLlz1RvLy;
 Mon, 24 Oct 2022 21:34:44 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v1 2/2] hw/riscv/opentitan: add aon_timer base unimpl
Date: Tue, 25 Oct 2022 14:33:37 +1000
Message-Id: <20221025043335.339815-3-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025043335.339815-1-wilfred.mallawa@opensource.wdc.com>
References: <20221025043335.339815-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com;
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
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c         | 3 +++
 include/hw/riscv/opentitan.h | 1 +
 2 files changed, 4 insertions(+)

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


