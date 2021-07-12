Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBF3C6689
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:56:12 +0200 (CEST)
Received: from localhost ([::1]:43624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34qR-000892-C3
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oH-00059K-Gv
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:53:57 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:50559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oF-0006rR-3o
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130434; x=1657666434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9A8QWqswZ6UOntZKeMVseSxt7D5c/I+oM3IrzN5UJzI=;
 b=fuua36CbRkjfzTi/TmX6KrcYefBly7wIo1xlPk4rAp0ZUS/MbDDF8xRZ
 3yyyh11C5cnNf8HrEIRiMUs+2hltxFyJEFKTHMNc1t/X1k2ip032WxGv1
 RjjYf9peqETE0IYg8v9Wbdb9Nf+b9SfGaJqWLeQWyhBm72r9b4eczoMXV
 +gVdGvpI7Igp8I2oNGSR3ZQf8x3wsZICZFbYMEICOO08ftuEGK3tRq6rP
 UIPFt9kIh72ywkUYHCkbIO2kzkOvXAC4t/DRKzx27kKlGgFXJMsE5TJxf
 Iucuqq6/P7+r+Av9LSZVEzJDLp7h6nX6vvOeb6cL4ZUfNBlQy7IHmGhzl Q==;
IronPort-SDR: GqXIkQ5/ECV4+AvyUAQc5bwAUUVZaSo6kbb4XncqZ0WKEN0Z3vmdtOB2Sk7WBAjIXsVK2cU4vN
 rCmKMUKZSO/B2rxlPKFfy+zDVnDwKtaMs7Y5N5Itgkz/cc1EAwWU7VfTWZdzZK14BmntWwSxqL
 oiFzk5YO1BodwqiMzA7GCPvJoG6EcrwPKngA2Cl7WMrK99Hg0uT6bEGyFhFJPdLwzOopvscg14
 784mYtEOAadMA2aaLRlv0XKdhrFFMtWNVB36mkwhoqECVaqpQir+eTfQdtZ+oBqHgdiigSFJeu
 HqI=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174398528"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:51 +0800
IronPort-SDR: +qVYsec89Qg1+AsYnJCsD2pdwVRMDrI0VC0pIN7I0ibf64E0z1EaZVytwXOcoy2uX4vEODQQYO
 njNAB8PWMAatEZZmM3ctDen7xju+vkTx6OuDBzosrVaVHZZ8yUeQKinqMmlRJUTQrcq7eouYrS
 Z8ZbeMpBr4nzx3Cv8hFmfdnrvUtEUf2JvZSY1nHAKijBgzlgE8REmWm2WjiWWA4xLhGt0EC7R0
 UdiQQnNvf5QhE0n3kuN/tEfMiRHmDjcXK/XXfgOihaG/BAXrqCiWN+u+0XQBjusdfbIqCysA/n
 8TjvLbR8UjhtMRaof4NJZMqC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:30:36 -0700
IronPort-SDR: TmR4Hp+G66+6Ic+siegIw8uANybTs/iUvgc/uAQXuJ5LwDKngpOQb2oI75A9SEA45jLuE5y7mQ
 KAx1UxFeCwSuD0t0dqnwCDrHgL6PFmULsC+9gcw4noYU1/2/Wel0nBGRXqADygJ3KS3XroMSma
 t+pVQEjcI5jL3WBE3gL7gWW55kWHJDGAVrIxUf7X6DXZQ6pf3nk/jw248E+v+fOEDHrUk36yFQ
 fFC6TP584r4RtfJIduUbAtb1pn/bmoUbCqQlb37CGyGs7zs03/b3m4CRBVTytJ7J3xTKeqaK9r
 n/c=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 07/11] hw/riscv: sifive_u: Correct the CLINT timebase frequency
Date: Mon, 12 Jul 2021 15:53:44 -0700
Message-Id: <20210712225348.213819-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
References: <20210712225348.213819-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


