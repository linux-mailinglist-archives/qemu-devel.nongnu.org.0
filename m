Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBC23C999D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:26:57 +0200 (CEST)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vlo-0001Cj-Fo
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vcI-00060K-TF
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:17:07 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vcH-0003VO-4M
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333425; x=1657869425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cGua8vSKOZZ/PPn1kCw33FiPKJInMTSE/ByicFl93Ro=;
 b=UShcAoXJuC8G84qlg15CPywwsVLQZ4YNJa13/gnw7qwz6AVXCZiIW6fn
 /EV4mRF4L4byQudmX/FknRSCdSRL73wS5c3OkxH86iHeJ2U/NX6doYctK
 pGJV+2jpT7TI6+xA2k+udR5gUSta9Z7efUKJmpNUIZ0gdpxBAu2W8Vdw1
 uHVTvcmrcjBZOAv3+uBXAI/Nrq+xSCx42cId9JARhR4qCFZ3xisKhcJQj
 89Yh87VjnjfCzCIyqkk3/b05BnFJ0yPKYLrrlLeXHsjMjLDFi2x0HuTqm
 Ma+Rdpt3dc7opG9yR0HKMWUxcpMZDrjIg59dPbwj6wp2yzsXm0sLwCb6g Q==;
IronPort-SDR: aK8uldllOPvq1YmKiQCPJuEGQtpkgzkc9lLcgynE5qtkarlXQ9ip+VwEn8bZxFqvUB5xV5N5HA
 QhlcqVXqCXqDlta0a4eyI6AVbRYEwhZTwDTIYUkiGrgtWBgI4Jp1MQ/T9kHzJfYXvz6kegooQg
 DKrMBcHGUoWF8DVhK3du91M3C4MeEbdgCFwH4GXuNRhb71c1ca8eo0o+LjIVruYXxdtXzdt6nR
 FwFpVHI8BQQauZHI500y64vcLxb+75pOR6I4RqmKOeA5gDoZkSL8WOCdgx7VejeOTSr0TsHeqJ
 F/4=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212309"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:43 +0800
IronPort-SDR: AFbuI/Mh9+aSo2f5vvuvXVnkjrQpjweuU3144nky8xCOtsPB4Ml6jD+ECswoaWMVf8877Jj2rp
 Dq9axwUBaZgwtNwVB/HmMGyn5NGANNRg36aUXXX02cyFlkKx500eQBalh6HoEKQLMu9sd2DvVL
 kLWOwYXNP1FcpfQoTi/9hQXz974VRPVhnODaKw4NhVAPp3rPe/PFZYy8AJnf1fbpvx1dyOCmW2
 440J5c5tenxMihWNR7UxymE6tg9TIliKsHq1bZedmyPh0y02bucxmyUacSPc/m2Y4UUYEOL5V0
 K6nSAC1VwIWzGbvaxPwTVn7l
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:45 -0700
IronPort-SDR: fY7OVQ/+njX9P+Z6iDLpAfxbQgAia+FBl6LJyzCnkXqbnIXf3Pz6WRU0sMV3f1hZu9vTUy1hTG
 Lc67mTm+knO+iUCi8TspXUfEi2PDM1qqpcyUktLqR9fTEeXiB2o6jaDqZas2UjjazGJb+i4fqC
 4cTGAEdvWWdkaPxtEyP7jigQOhOEPmn6SgcOXOXVcOvOaEzfmuSCjVEBDDxRZ7Up/WAW+sAH42
 r+R1scFghe+9gTu+qltSu4+5RBIUwESY2FsPJFy+LwhzoPOh5QVy8WLe8TQ6E/ERlx27dHy21S
 IrI=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 10/12] hw/riscv: opentitan: Add the unimplement
 rv_core_ibex_peri
Date: Thu, 15 Jul 2021 00:16:38 -0700
Message-Id: <20210715071640.232070-11-alistair.francis@wdc.com>
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


