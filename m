Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449CC5AFEBD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:15:39 +0200 (CEST)
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqDg-0002dQ-Hg
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2t-0003cG-VX
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:31 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2r-0004Ol-Jp
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537865; x=1694073865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mo3kXjtJBmRvi9wrA6wErkCIS7IXTlFMcUqaScuHyXo=;
 b=kH05mNYtquU1KLBN8MBYyOc5/jAzdiLIp7CUZBZZAzZx18dwrBdaFKFx
 AQZqdu34AYeAgknMQFBYlN3Xt5zmhTL/yvNuVGsALiiTBgY8zkSJhB/VH
 /PHMcF7LC8vAB2cHHR6cVKqCTu+mIFCYHMZeR+XJMI3u7j36x2LZJgNs/
 lrvgniGXR9VcSYjsWLtRLvG0xSX8y/2Nmthys7MyzUOsHFoXdM6xPQ2jf
 PYHMD3WdqAAw4vQSd2AWAM6g0c1hqjZOhLIF7a3hT2mdzsSCCGDsu+I6B
 ZK2CcDxiX1rZOX3mSsSPC27/iouPlFg/BN5PIAEalA8dYyT8SjSGDxpqy g==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714949"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:21 +0800
IronPort-SDR: HoJzvSTjl9KchFk+iW4Hx/aXI67oqC56JVySAnYXweYpqEBRfXcCq5ksw7P277suVes0UKPoID
 NHV+GctayW7abtNbUCbaHHG27CTkzCset+bxycssr7UTphsGn0olQfCBdMb2GaXqjvG72ZJYz5
 tZU3oa5IakAUtTPHLqEdvxkzy5vI2zLErcXPyBC645gQptCv4XSuZhey5eFJq6RqROHnWR+8dI
 reRC1MhTmJ4zAORv/tinn8CjiIHns334qwBBCAwuD0NtYxIJcmqPmKSxfzAebT1fbT9cnO9tLN
 9Jurznt9bKpPUFUGuLBKqbeH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:18 -0700
IronPort-SDR: 5gI70AipkCdpPpn8197WMeOODZ0eocFebS3IJdOovRad8ZG1VztOgnCCy9PZ1GKIy+UD9F3p3k
 RMGDfwkAWqfl7rAsNm11sdqoiUWIo7evEGxL5Ecmwm1WQEaiwcGOz+62CWmSg+8wzL+kBCGALP
 aA+MJVKPLm4Rfb8c0SvlpZXBThUpr94L05kumlT7vFEzXy1eu2kNGj4mYJwp9mWFSwrHCQcTk8
 eU+kqL8hkuILm9bOeUsAVjocLlN1KlVHflJ6+9fF2R9Y2155Gw9xgPE+wXZNb43BtMXDVrdyqB
 SbI=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:20 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 05/44] hw/riscv: virt: pass random seed to fdt
Date: Wed,  7 Sep 2022 10:03:14 +0200
Message-Id: <20220907080353.111926-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This is confirmed to successfully initialize the
RNG on Linux 5.19-rc2.

Cc: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220613115810.178210-1-Jason@zx2c4.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bc424dd2f5..f2ce5663a4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
@@ -998,6 +999,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     MachineState *mc = MACHINE(s);
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
+    uint8_t rng_seed[32];
 
     if (mc->dtb) {
         mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
@@ -1046,6 +1048,10 @@ update_bootargs:
     if (cmdline && *cmdline) {
         qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
     }
+
+    /* Pass seed to RNG */
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
 }
 
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
-- 
2.37.2


