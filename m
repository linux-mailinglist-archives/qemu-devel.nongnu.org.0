Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D950B5080D0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 08:01:38 +0200 (CEST)
Received: from localhost ([::1]:42830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh3PF-0003ia-Mf
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 02:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3HF-00087s-3f
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:53:21 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:55197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3HD-0004UM-Bs
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650433999; x=1681969999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H2nNCdBlGkbhKY2PzS9ttJJUrgi/BvPdzYzwwCBJy3c=;
 b=SYOwvqg30ba2gz6ogsHnvTsIYlkwW4bT7Rv4eE9iLlnCpZi3gNtreh3G
 p/gZ4O9cLX9l5WSF+dq/GQkPcSveeeB35mORaOl+nVMpFA59hVSWxTKfx
 OCyqGKOcXJNRDtqbxFplB9FSgxt1yqvPOtWTBFM/PMxwcdzef69m7psSP
 8K0AtZgBarvH0Ro0/W7p6MjbJ5kPO9rbbA61z4w7oehrZgXHTZmp4cBi3
 Q8E2gzMLZlEBMQitHROkGf6taNtPNDwP6UdWip/jruzBdMVkvXaYlXdum
 pG7q5vGS6nrB68l+1Q7sxo2DcsjWYGEqBUst51hzz+wcGpTRMAI7JqwSJ w==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; d="scan'208";a="302527765"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 13:53:18 +0800
IronPort-SDR: QjiDCXgB8sxdx5zPtlOPCaArvGEqp/RjoYzSZH8djRhKJrD+mO2HDfGkbpgVzdufFVjPJBebOR
 PtEG5ngwd362uC4PHMmu9pFOJVWAVuw+A+fKN2e6WU/ccM1RNpugYPaY3SLL0sSDHMJHDPoxVM
 rP8WUBSGc8/9MAsSPasuaZsERWqtViaKqF94Zy8MIS3fc1BwNbZa9wnPadVl50uQYlLDKTtvJB
 /LszuQp2iFJeDoKCuz2V8fR0Sx50uLpItxQvjTQqxqsjz5chLmm9zTWE1dn5dYMuWz2iYPvpwn
 GzEL0Zh98KqxWtsDP5GoIMY/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:23:36 -0700
IronPort-SDR: k5/fXTs3Z5OtP/8LVc/4WyAkOOtMZNOAkn6BaTWgd6jT9qwZcByMadhT+9nRm+cfdGcpNpQipS
 f4PaEgpbuVEKNJmmCU3xNkVpuzYHjrkU9YTrlavFxtebVsbOULgchfN0TKy+Tk88Bp/fygLnef
 +VLGwRLdgpKGg0Y0+Yw0qxflB/4Fg9QulIxhxFLsVbh1PkEGS0+l2A+zLoH5g3UDsdw6wlFS/q
 q1f7UsPChwIS8Ad0lxenkAtTwddhK2/SyxWvE3Vi+gTjiWvCe0zzvBrODcMeLDxLBr56DEbNBc
 z6A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:53:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjqbK6BjGz1SVp5
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 22:53:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650433996; x=1653025997; bh=H2nNCdBlGkbhKY2PzS
 9ttJJUrgi/BvPdzYzwwCBJy3c=; b=X+AG6YvsPIzNR5ltI+/gUovOJi/GZypjTN
 TxSa/XjB5takiG0o/DHZ4H5u+nFj/rQYMvhaTbdkm41/6dMtR6fIMP4ZaiTEzsnb
 LQuf9jg7uR7H/MmG7wXN5bCvcSWkVa0F1nZHg/Bt7/L+eSfYsh4+YytJHyAVR5tc
 kj3v97TziTYZOFtRaySyzP/QS0CgZHrRLj343QPvPI7WxUM/WOwI1TyShopty8DJ
 U19sgl2q9QVlRq8LbxxrAKkWrgPmD6tRfj0vJc53Z06OehbYAjt8gUIKQ+Ma+gPZ
 pkOM/T2VBTHtdJoM0YYO9YDPcAXP1ZP5jFjvMEVpdFYOYnaTUDgQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XJrQ0zUr9wfX for <qemu-devel@nongnu.org>;
 Tue, 19 Apr 2022 22:53:16 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjqbD5z5Hz1Rvlx;
 Tue, 19 Apr 2022 22:53:12 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 4/6] hw/riscv: virt: Add support for generating platform
 FDT entries
Date: Wed, 20 Apr 2022 15:52:46 +1000
Message-Id: <20220420055248.960491-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1021dae20=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 hw/riscv/virt.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 169da70350..e4a5c6c28b 100644
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
@@ -411,6 +412,12 @@ static void create_fdt_socket_aclint(RISCVVirtState =
*s,
         qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0)=
;
         qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
         riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+
+        platform_bus_add_all_fdt_nodes(mc->fdt, name,
+                                       memmap[VIRT_PLATFORM_BUS].base,
+                                       memmap[VIRT_PLATFORM_BUS].size,
+                                       VIRT_PLATFORM_BUS_IRQ);
+
         g_free(name);
     }
=20
@@ -469,6 +476,12 @@ static void create_fdt_socket_plic(RISCVVirtState *s=
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
@@ -546,6 +559,12 @@ static void create_fdt_imsic(RISCVVirtState *s, cons=
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
@@ -683,6 +702,12 @@ static void create_fdt_socket_aplic(RISCVVirtState *=
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


