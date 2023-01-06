Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA0865FA0D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdEL-0003C8-Hw; Thu, 05 Jan 2023 22:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDU-0002qD-2D
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:26 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDQ-000892-On
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974980; x=1704510980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u0PZVI8ggPvsWeKfQGUDLWZ2cUtHQU4VzrSNKcbz0Zs=;
 b=eJz823Wu2Ol/ZUj4aMq4vh6FkJeTqzAtdEiicKX5D5i33Bbl1IbrVUbz
 sZeqcKclVp1el6kZMwGkXZzrDXUNpjhRBbgLrV/5TV5JGWn/B1/bCuNVV
 GyS5au8EltxwtWa5RDmy7Kj9uHOk6KwxrVsYykkaGd5F1hDuiW5veR619
 fjAL/kPP+Rl6EuYmPQjpQ+baOmL3yCBYKuQCGCx2eJy4o7DPXKZnEayA0
 qWkItYiSeR+wQQBL2ome7Vjt9gb0GqIjwV9ebvkZRJyKZC5jQ/DttA7NY
 +2DhufqMo0DtRiRc3EpV3iP8QFDUoyRxKCHtR+h93S1PFAPDRnaMlPXHw g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254845"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:15:15 +0800
IronPort-SDR: 3nolEhjbm+jdtr6muKID0J/Rp5CdF3iYA/PfeltPAyb5C1lcKMoBE+FdwO7OGh+cxXvKiGlMV2
 0IGvCe/jrgHRrNCQS/bS12N10XkrszQJfuphH6pI+mlSSCjkLmbgPK/AxLZdX4DcoJp22LsGLC
 7OIfEKJi8MxXQfnHz4eWWfp3Bmx/V3bX5dGKBFexTqWMs/HuaXNzOeJIaynJFKYt1D9oMTF8Se
 yo888F4jXuwjyXv0VshoHwCYiucp0xHXPleE+ZAQLFPIxOsjqo1eVw+W/ynGcnfLSAQ+EX1uP0
 cVs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:26 -0800
IronPort-SDR: dy0ZqSFcgwaFQ6DNmxj/BqDl9gERcz0sCwZdqRamhzYGGBlv7GrYKL2i7TKtyLQCrOWZGLPXc3
 uG7amfPdHFIxHMdV/nezbZDb0V6Dv5v4yTg+ua1eognVyrOR9VRSdc2CMKqDHrySqt8pGkFWir
 QAprRRBpB38GotaeWNB+oZuOkYEX5bAwVAYF/3+O4OR3NuxWqpPuwQloPWduzXa2Yc2tPVBTFs
 tvWI6SUi7iw5tpHewO+w0e3acSvHvwqDEnbMN7l3D4QI8D5et2muBEOWRILMJyYAnpzzNPM+Wb
 FpM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kW1bxfz1RvTp
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:15:15 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974914; x=1675566915; bh=u0PZVI8ggPvsWeKfQG
 UDLWZ2cUtHQU4VzrSNKcbz0Zs=; b=SZaaejEk6Y2sIPuKv336N2TqRzx2gIUQC8
 f/TZ+KO+0b/vvsDEoxmMsdyla/Yw3iqTAGnZMTsZ9pUSppJWL+4sQJTcD4qL23TO
 m174b8DJlMoMAcBi6FB1X00IG26H4uSUv2YJLZIFETbEdMUHkSG0ZlXEeELdAa7q
 s7acU+P47mF9+7YwpMff04H8nxzvUP+3Bu5mnFRFHKCGdQr5mpimxTFcN6R7NEYG
 BRfHjYrwh6o8hRW/dZtzbMeGm6vcKZ71WCwu6eG35GcXmVJ3Z0envKfLVQ7e5X41
 b6i49U9iXoIOzP4nG4oqSiUNCf0B/HOxJ25JbvGp3WpAuTt+pPbg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id cE5PL8CXFXs0 for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:15:14 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7kT52x0z1RwqL;
 Thu,  5 Jan 2023 19:15:13 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 40/43] hw/riscv: virt: Fix the value of "riscv,
 ndev" in the dtb
Date: Fri,  6 Jan 2023 13:13:54 +1000
Message-Id: <20230106031357.777790-41-alistair.francis@opensource.wdc.com>
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

From: Bin Meng <bmeng@tinylab.org>

Commit 28d8c281200f ("hw/riscv: virt: Add optional AIA IMSIC support to v=
irt machine")
changed the value of VIRT_IRQCHIP_NUM_SOURCES from 127 to 53, which
is VIRTIO_NDEV and also used as the value of "riscv,ndev" property
in the dtb. Unfortunately this is wrong as VIRT_IRQCHIP_NUM_SOURCES
should include interrupt source 0 but "riscv,ndev" does not.

While we are here, we also fix the comments of platform bus irq range
which is now "64 to 96", but should be "64 to 95", introduced since
commit 1832b7cb3f64 ("hw/riscv: virt: Create a platform bus").

Fixes: 28d8c281200f ("hw/riscv: virt: Add optional AIA IMSIC support to v=
irt machine")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-13-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h | 5 ++---
 hw/riscv/virt.c         | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 62513e075c..e1ce0048af 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -87,14 +87,13 @@ enum {
     VIRTIO_IRQ =3D 1, /* 1 to 8 */
     VIRTIO_COUNT =3D 8,
     PCIE_IRQ =3D 0x20, /* 32 to 35 */
-    VIRT_PLATFORM_BUS_IRQ =3D 64, /* 64 to 96 */
-    VIRTIO_NDEV =3D 96 /* Arbitrary maximum number of interrupts */
+    VIRT_PLATFORM_BUS_IRQ =3D 64, /* 64 to 95 */
 };
=20
 #define VIRT_PLATFORM_BUS_NUM_IRQS 32
=20
 #define VIRT_IRQCHIP_NUM_MSIS 255
-#define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
+#define VIRT_IRQCHIP_NUM_SOURCES 96
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
 #define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
 #define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - =
1U)
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6cf9355b99..94ff2a1584 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -468,7 +468,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
         plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cells(mc->fdt, plic_name, "reg",
         0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
-    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev", VIRTIO_NDEV)=
;
+    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev",
+                          VIRT_IRQCHIP_NUM_SOURCES - 1);
     riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
         plic_phandles[socket]);
--=20
2.39.0


