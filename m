Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7965141A3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:59:09 +0200 (CEST)
Received: from localhost ([::1]:54786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIii-0000wc-Si
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJb-00011o-PY
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:33:12 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJZ-0002Wg-UG
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206789; x=1682742789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Oh34tk90LI8trrCCL5swVfzcCcrs+tpo6As7lIiXWs=;
 b=kVncpz0DfOi6MKX6sAhZLnnviUmzkReHIc6Z0McwGElnd8ZIqIovu+1R
 H7G/uKhkOzhjN3V0uv34PPRstOOEgzJRQfWowtpJDlY1/+Kt51HJ2H62S
 nJqmFug52ca9xbOEEOL0f8BgaYEsbx0as4T6jlEfqMh2aSUcycqaMfDHn
 KiOcxAI2canqJ3SNir4SRZ/k0W3eGVMM16aGNTiPxhoUMuQx5+IhRJt5q
 5/7BcR2311LG5LoINlLHH5E+BTMdCe/qMFu47fCgeUvVfv6aujDaa+EQ2
 NHAYgficpPhn4qNVVj/waiIA7n0Wvod334nc6q1X76lGdN4yVF/9vB8bM Q==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995998"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:50 +0800
IronPort-SDR: h80+vpaMh04PkloxvRpfN5y8MH764VtnnYG3lDvgXl1hn5D+ek/AHfHD9I2ynJ9QZn7IjCKEJm
 TxlcGmTcPyhHRCdEU2rWfvP+HtDwhBsnXHn2ZZM7Eb4umkYBDX++L5ZjbZSa/Wf1v/nKqmBvkB
 DLQaYWf1A/R1+tH2iZwf6ZCc6qMdZmo/zvD6Gna5PuQbmwrdYt+hSk0pmyCWkLvPDIDWZWimRd
 K1HT74wE5hn8uuTOZV10GX84OiRw0ahkpszH//RnP0Cdct8sHxXfLfNv936hA81l3/PqNsMSy6
 8fO7mo+BKr07zxsGUD9xF68A
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:59 -0700
IronPort-SDR: /IziMVGBawz9e1LDUIAp6RPo0Fn8GFFCFIYaruYtiKbOrmFUBOOxosmKVybH/gKrtQMOk3d8p+
 q2NZ6kJzYFhyEJ501XbRbyInMJidzV0a5fwtzbvnNtHdeWli1QYEStCIZzroZ9U0bx9Qpfdda4
 aPrefvfnCwAxMhKf8SioE2AFRQuR+Htl4yVAzyVTCVKgQ4craKeHnEXDYEc710kzsqwZT2WHh/
 i+hApP246ptXcSiGKYCq8fQNI0y5oXhQN2o2q0qeGu7F53OLICNldBpkidC1ct50K3SP36hVMl
 F90=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:51 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKNL6Bmpz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206770; x=1653798771; bh=/Oh34tk90LI8trrCCL
 5swVfzcCcrs+tpo6As7lIiXWs=; b=Zc621Gxc2TcR8mTLfPg1RqGNUn5cLORoy9
 wuri9J5CDkdXX+Bep16lkLfiCePjQIEy0NFqxSd/+YgOaVn5C6DAMCYQxHfYqt+h
 xLZEDzXJ2ZW4tPaHkNUUO48vxvp5dP4zMLetKgu7rcDd+aVVmZhoBlR0lfycQcqq
 Bj5xuhzQ7k0uJLfuq5VJqYkxsBpfKqMHeUyfiW717Zx4zmiq1UCxxgWyhjFc/EqD
 5+A4y6DMFdeWXoSkdt301Zm8w8MXRJcAETeDQ4EWLU2mpX8EikWogvGnVzrYSlyk
 cpyPUuqlIKPnl1T+40dJ7rT64OEFwKpEYxhf/XznkGwYXwlnaHWg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 23K6lqoTfUHk for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:50 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKNJ4mpCz1SVp0;
 Thu, 28 Apr 2022 21:32:48 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PULL 23/25] hw/riscv: virt: Add support for generating platform FDT
 entries
Date: Fri, 29 Apr 2022 14:31:17 +1000
Message-Id: <20220429043119.1478881-24-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

Similar to the ARM virt machine add support for adding device tree
entries for dynamically created devices.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Message-Id: <20220427234146.1130752-5-alistair.francis@opensource.wdc.com=
>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d99ea1c9fd..12d0650b33 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
+#include "hw/core/sysbus-fdt.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
@@ -475,6 +476,12 @@ static void create_fdt_socket_plic(RISCVVirtState *s=
,
     riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
         plic_phandles[socket]);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(plic_name);
=20
     g_free(plic_cells);
@@ -552,6 +559,12 @@ static void create_fdt_imsic(RISCVVirtState *s, cons=
t MemMapEntry *memmap,
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle=
);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(imsic_name);
=20
     /* S-level IMSIC node */
@@ -689,6 +702,12 @@ static void create_fdt_socket_aplic(RISCVVirtState *=
s,
         VIRT_IRQCHIP_NUM_SOURCES);
     riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandl=
e);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(aplic_name);
=20
     g_free(aplic_cells);
--=20
2.35.1


