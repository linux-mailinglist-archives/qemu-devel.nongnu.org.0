Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF583C9996
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:24:05 +0200 (CEST)
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vj2-0002WG-Dd
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc7-0005cg-PF
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:55 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc4-0003aa-PU
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333413; x=1657869413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9A8QWqswZ6UOntZKeMVseSxt7D5c/I+oM3IrzN5UJzI=;
 b=d5IQbpWnaM+hCdZ180hi6dn1I12LKCpjV/wuXi5N26OWv4dIzIH31zrr
 sjwnY+3Dir9urep02gbig1Df8N+YGkuEPmbAfXwc9FmMPSm95i/1cFNJ9
 D1cdckNszohl8ztnbmGntEYyhEEARiS4HzwrDHXZT2zJPwnjlJzfaO4Ge
 obnGOOQ7UhkCj0b4RIiEEuZDCZ/eI5FTcUJFP0yMG4mEc/9hhuGZRz8/K
 edrk/PMRU3OWDeBJvS6OU50BiM2u21LAv39hhlO09+QNx2qekO6rXAL/B
 3eUPR5GB+/tg1VZeL1RuZ+2YPZEPZJa6Dzz3UGrS0l/iZ5w0Kaz5pC7DB g==;
IronPort-SDR: MG5VGHKOtLvZ2aDFSzibwdiTmj7zP6SxGSdYZkmQZxZMKL1vETdW+IBWJW4+4dBr+diuC9QxWw
 EhrqiYI8qhcHVldIA67Kxkg14ujsSBnonYAizNJl8rqrCsqCGTgj0AEzAp9lyjewLB3o5Mgsoa
 UW65nlbDuVrrKSZv8Fhky73sHrZq26IM/XHNfh8tzfvAkbwEd4s77yqCeGBMZYrh7jZF+wjagv
 RzKzlta/0SQeBgDJkAJgrmKLUETOGbQSK/qk8LSDkpqSLdM5UUU23Ps6q8eBsIVzgzX7cgoq7U
 cDE=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212306"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:43 +0800
IronPort-SDR: ex2f50PZHDuCZ+BU4fGZ94Q1Y0UtiBJAUaNBp1T3x/i44CHd9bB1lGQxUJ0GEsFJACSuKyR48l
 Tigja2gEpcYT2ufUtoxyy5mpNLOEf0uf1SoYtpZQOjQuLezoKdAr96ktyeTKtCFKPgkhBbCPBp
 6t7DKYbRc2arGkohYzZLyAvWtkRDWaCOyNAOmspyIDIl8QUY3dTURL2YG8EBDlWh4zf3y5FK6X
 71EF8tCf6okqB6dP6im1n7UTE1PEEk1SsYBXPl2wArfmyu/TI5Pxyplvk0c0iFwCq2ehiEyG86
 6r1vdR6LjkgLuTrlmsVxQQUk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:45 -0700
IronPort-SDR: mt1R6uIb/DQqmSg4XdDLZV60mFZuYv6RWfS/4JAHtMSlxGbFssdftvZsBdj44o4fvsJHRZ4SpK
 VdF25D09wmq0/ju4rd+1qWrql3p7yOg1QQQGz0QR3bb7EaqvSVczuElJbhO81wuTbtPcFMXFJ3
 oR/gjQFKUUIvk3TbUZc5jTkItdrrXvwVFP2g7CXMy/BnOK41wyKiMnf1etPrdQRDOLF+oR4h6d
 LcQzvytnZkeNwrSnbwx4D9pDAh95mUnTw/JPek4HvBwB/O+3t01c9mrfdwk63+hSj/yJrfYhjb
 QGE=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 07/12] hw/riscv: sifive_u: Correct the CLINT timebase
 frequency
Date: Thu, 15 Jul 2021 00:16:35 -0700
Message-Id: <20210715071640.232070-8-alistair.francis@wdc.com>
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the CLINT timebase frequency is set to 10MHz on sifive_u,
but on the real hardware the timebase frequency is 1Mhz.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210706102616.1922469-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 273c86418c..e75ca38783 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -62,6 +62,9 @@
 
 #include <libfdt.h>
 
+/* CLINT timebase frequency */
+#define CLINT_TIMEBASE_FREQ 1000000
+
 static const MemMapEntry sifive_u_memmap[] = {
     [SIFIVE_U_DEV_DEBUG] =    {        0x0,      0x100 },
     [SIFIVE_U_DEV_MROM] =     {     0x1000,     0xf000 },
@@ -165,7 +168,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-        SIFIVE_CLINT_TIMEBASE_FREQ);
+        CLINT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
 
@@ -847,7 +850,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     sifive_clint_create(memmap[SIFIVE_U_DEV_CLINT].base,
         memmap[SIFIVE_U_DEV_CLINT].size, 0, ms->smp.cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-        SIFIVE_CLINT_TIMEBASE_FREQ, false);
+        CLINT_TIMEBASE_FREQ, false);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->prci), errp)) {
         return;
-- 
2.31.1


