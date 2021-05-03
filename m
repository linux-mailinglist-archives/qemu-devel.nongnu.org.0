Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34303722EB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:20:51 +0200 (CEST)
Received: from localhost ([::1]:59692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgvr-0001WO-1n
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpO-0004iU-B3
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:10 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpL-0000C6-9M
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080047; x=1651616047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=33oKkjRKiHqdoKmxYRwb0N+/KhiXMXBJI/b/JHXG0gg=;
 b=Uws5/kyDJ0J6tkwvQF1XhT2BRLANjP0HnjErdRY1aeCWRuKrabn+N6QT
 iPewYKQvFqH+72ciqB7XhfB3UleHHSOGMeF/fk5jbr1NXECUJe2Z8ejKN
 d3fMWRPCfeEvHrdUGK76maX1QYgEsjQYDPGeqSZb0+voBSbEqyD14UVbH
 XbcBh6xbkY51/MCdFnVhv2KL0SQ0SMUGMnqNJvIZ8oz6YBZM6Ntic1D5Q
 Fw7cFRdI6mCHXF/f/RrLwRTA01wtw4KN9b/pfWWC6GaQS7Rjc1qfgWJiO
 aeImieYvqQwn8vevVDmy4fXWHFD4YeHsm8JL5H1bsYsoSihk9GM/IuJey w==;
IronPort-SDR: FdXgVj91vqANXzAbm5bXyFS00d6b8KWf/p6ogVLB/hRzykOylYBaDgWmqS2E75KF7VEv3VTyxq
 xSK6eKXh/pp1MahCnURKLTxzChkIUf+rb7WfOaur4U3Gx2OA+I8Ka514SxfM75eZX69ryq/ZR/
 a6GBSXBemLoQ5iAKpGw6zs6BGvymsBI8glc1jSFO/6jmbBPMVIQKYXogsQwaKaRTyfc42sDq5m
 9fLB7TIMBjEIC34eWvdjZLwx/Vavyg+L+ht4WvEIHzzPzbiSFzr8d0P3fucstJAYQvq5zMuvhe
 wkw=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114612"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:05 +0800
IronPort-SDR: Ehia+rqvUjo+2k6nzQTf8MiPF65p9/qKSu5y0m0vwzQAeMFLBb5JzRJYhmgKLAtKHlt0Oicbap
 /f+uv8byTq1yF9HUtypeaLpJqvrE0aGcXb8j/x9JfAmIdGcc9vAXDDnNB8oAexmkWtF9PP7w+k
 JAxbO1rrxzZYTUAPwvd1Xf6ffN//2MAdMqqJw8GmhgQCVUaquxTVG/tdinq9Fky/CUmASrdCr9
 V5Il3TSnnY9yUpulMne0k0EmuiKkDYd3pcdB2Hdbo7nPJM0r5J6E0KH5x2mG658Ngfi6apZrjl
 slOzY4wAkMWCGYVAcmOCXZDr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:16 -0700
IronPort-SDR: pjgqMa2YXAl9Jm5DbYFideuRqouQ5+OuJURNo3viheXAbOfQceIs57FZ1RyjUf3/QttiY5L5Wg
 +5wL4Zi/jsGNU++qncJjPlObTrBWuwhPRW9NkUr4oXpLKHESohfr5Wfp11ND72/jBLLGFi7pZm
 JIojBtGoleziQEsbGnEU/hIQe2bfoQtsMf+/1SPdFQQxfkn5JopbTQFNLsEb0iimZ8SNnvodto
 nFREUpwW920Wu+KcMgVIfvJQ0gNjHj7pSs8ChOjkIAs0UeS5NmMowqu2pqPGxbmvaRvZWZ44WV
 ac8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 08/42] hw/riscv: Connect Shakti UART to Shakti platform
Date: Tue,  4 May 2021 08:12:53 +1000
Message-Id: <20210503221327.3068768-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

Connect one shakti uart to the shakti_c machine.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210401181457.73039-5-vijai@behindbytes.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/shakti_c.h | 2 ++
 hw/riscv/shakti_c.c         | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index 8ffc2b0213..50a2b79086 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -21,6 +21,7 @@
 
 #include "hw/riscv/riscv_hart.h"
 #include "hw/boards.h"
+#include "hw/char/shakti_uart.h"
 
 #define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
 #define RISCV_SHAKTI_SOC(obj) \
@@ -33,6 +34,7 @@ typedef struct ShaktiCSoCState {
     /*< public >*/
     RISCVHartArrayState cpus;
     DeviceState *plic;
+    ShaktiUartState uart;
     MemoryRegion rom;
 
 } ShaktiCSoCState;
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index c8205d3f22..e207fa83dd 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -125,6 +125,13 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
         SIFIVE_CLINT_TIMEBASE_FREQ, false);
 
+    qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0));
+    if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&sss->uart), 0,
+                    shakti_c_memmap[SHAKTI_C_UART].base);
+
     /* ROM */
     memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
                            shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal);
@@ -143,6 +150,7 @@ static void shakti_c_soc_instance_init(Object *obj)
     ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(obj);
 
     object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY);
+    object_initialize_child(obj, "uart", &sss->uart, TYPE_SHAKTI_UART);
 
     /*
      * CPU type is fixed and we are not supporting passing from commandline yet.
-- 
2.31.1


