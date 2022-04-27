Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D955127CA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 01:52:38 +0200 (CEST)
Received: from localhost ([::1]:40542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njrSX-00008W-1X
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 19:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIW-0004vd-Kr
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 19:42:20 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:48841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIU-0004W3-Nj
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 19:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102934; x=1682638934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l40sjyCp0l/BFK8+rhXyzxzFyGa7+yrMxywVjzjn3c0=;
 b=hXU4XYWrY5t84abOp+ZtClKbzSP6h+S4UoK+7HCMKBNaDogqm6fKVxBx
 d3daIwcYZmSdYIBEn/qj6JcFkR0wvbV5HARegZNf+OrXHWPrXrDgT9G9b
 rCW1eA0oW2IM286Vwvy3NSInAw2T5ZRqFpR9cHMMaG6OZkNav6b0cl7NS
 cHIoJjxqO3xi7mZNH7Ic/J7RWAg3gIIF8LVD7zN2FOyO0fh3KaIGO8Iin
 KgmcFVYhrgfGjR7ED/WM4fl20p0X4Fjmv14frfPY3RKRT8Qz3mHYMNBFE
 4t1wi+cw+z5RDv9iwxolSa4aCZ3I+Zx5U4IAlby8KChAoIk4Sy7bkhKPD g==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="197844545"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:42:12 +0800
IronPort-SDR: T1c1st6Lq9S6GgTP2mZLL1mhZOU85xYtRc2gYc2/w/r1uY3jjMVpzbe3PqfQDBA5Q1Yl3b8H6X
 zWceQTDs3lhSbyAT9LiEPvj4Qwd3L+5LZZ8v3DQit0q0/n80SCMjBuJg3Me17Zwh4n/WI3Kbb6
 /EsSubUXAp3yqZPxAL+av+qvkI6m9CUMS6Uqd027xRSG8cI3w1IBqXZN5vrV3LUJmAjnf8lIAS
 mTyW6vLINDRbCr2mH6j7IT0W1HegZJSZ/uIUfrNn9nWgmcxz41zfjbU13xxk6zkbGgZZZ0v9AP
 8/66s1RjNGA1BGt5eDi94Kyg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:22 -0700
IronPort-SDR: Zr3RosNY/f6Q7D7iWVX41xgm/wwGQioh66DKXTVHku9JA2Z9tEMdoNG6JPsysPforp3zFFcoo5
 HSptwAnZGR/dOeEipyy3Zr8Ctkn5t3aCWSFWhQ1USip6BythJ4Ct5USKHLa0UK1ioKm3tkk3E3
 CSesEcehCpYQcHvQ1KIPC5GLPrr00sS5/LP6AYlrB5yDGNnPfD8ZQxh/uic3LMAQcM/Tc3VBFG
 xuxjelq+sfurA6NnhACuLmLm0DLN4wW27++04mdsRlnAgxYrVvXSsDvrJqM98oUfl5Kj4WWnUH
 x9c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:42:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZzS3hQkz1SVp2
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 16:42:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651102931; x=1653694932; bh=l40sjyCp0l/BFK8+rh
 XyzxzFyGa7+yrMxywVjzjn3c0=; b=qhVky5MSkVeCOMD8I9vNFzl7Spz5R+s1Xh
 aWHZ9cz7/GpHPT7nU5EZGeqIr3+Ocsq5p0xQLSVvQLIiPM+FVOavojqSoN6Qxzi6
 r5aH+8HImotWgrz3klMTgvwCSQYbwUT+l4uiSHONsZBu8xWnm5oqP2wkj4TG6S23
 ePfrPFn5wNB+E8KzZ6MjM5Q9ZbWw/RL6Oh98w+nG2SxX86ahddvpYp2/502oPgyZ
 SIRP8WQEPSYdrtIfpZ2bT+a1QfX1zcMJD8lH2iM9LixIwAstp7cUeCpHcu0lajrK
 Ur0voFffn3bQDP33DdDq4lk+CyKsZfXVErZ+wQiMRsa0GaqHp86A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id a_D7ArQ3jqV3 for <qemu-devel@nongnu.org>;
 Wed, 27 Apr 2022 16:42:11 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZzN0wFSz1Rvlc;
 Wed, 27 Apr 2022 16:42:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 4/6] hw/riscv: virt: Add support for generating platform
 FDT entries
Date: Thu, 28 Apr 2022 09:41:44 +1000
Message-Id: <20220427234146.1130752-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
References: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=109fe075d=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
---
 hw/riscv/virt.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 312138e7bf..a2ffd04a78 100644
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


