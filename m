Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBB6538D6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:42:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mQ-00081x-Ab; Wed, 21 Dec 2022 17:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mN-0007x4-2s
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:39 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mL-0000bQ-1P
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662496; x=1703198496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+M7+37H0131qu5DnZvJJSIbui8Sp1KNr5DG3bv1IxMw=;
 b=UZNI9yXdy0SpXYs6FPNVlEPdaxz8leyXz7k+rF/H+wEuJ4tyw2iwoTwg
 DD3hz3jR43Sa/U/C9DEKxkjehknCuTuwpzgx6ia7nMBtna5uMy9LL/dd+
 CliVqqa5LlF8IPW3iUztZiHAEOsa/uLrZhQ8U2KmO2a/EG7qyuTc1zOSA
 f/qwF36cFZcgDvzcokMW9+PyLlhnad0tB8+M6d2hp9+lhe/n8YXiaZ8X8
 V8qpzaiAbO6HxBj7ReTZaub63rzZ+LzspJ5j7ibkzZIqopEbVw8jNAZUI
 bqFIWrZdAAPvtvJfrsL1kAZrOO2cVWr7W0ofdUebS/ttDpXPlvFyK8x5z g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561351"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:07 +0800
IronPort-SDR: C5jSEV5YQeF8K7uoC14wgqKdOhnjD929j6xVojkzpV9mj7WsV2Fu2jrUa8pilzq/riaptwq9BW
 rPmIaU/IGRlVm9L0BP6wRrEtTm3ugJA28wajJWww6QvPd/IuiZgwEHeI2pM/Bonli0IWTaEZ3/
 9KFxo26yc7BURTvQ66c9LJswuyx3DHMPUdcVRIr1foCJak0rhWXriDD8D64xPSkrG5C4PXu9wm
 RttGclUUbpqLl3d1D+hV9u7tJ9JDcHHlQctRN1N9dvnkqrYO6sx8W2xYvo0RkX8PAWM2NXhNH8
 ZdM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:36 -0800
IronPort-SDR: BEL5qVSv1Li3yVqNJvd9Dgs8RPZQUODtGvVMXUrJinBnaP5bl9C9kZak7eSQZ3wWCYC2NkbH+s
 qakUwb10H0mzzmqqIaWrd6R5uYfIusLZYNgLTvghwj/izJ5B+Qv77gcX8ETcbMxhYRSf+M92Ae
 6iMPyYzE5Dgw7X+hVmxwsJolEYdolmss6MjTf/c6/GSstxGL3u8D9MzI0gid26QC8f/YecraiD
 G+4ZRdiBoB/N/3TpYBoMbWykkAohV2Vbo6jFn5L7mnmTisJlYLD1gq5EBpEoh8cyUBwtyr6gXZ
 kwI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpM75dW6z1Rwrq
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662467; x=1674254468; bh=+M7+37H0131qu5DnZv
 JJSIbui8Sp1KNr5DG3bv1IxMw=; b=qsXCftEGEUWkJ1JaNS+pyPlQh/ptdDCJq0
 wL12o0QVEMORL/vC6qfJXmgc42IMTV4DSK8Vk8Qq3WPzWPvBNOuLlLjHK+kAe8Id
 DcdGHbg3e/aO4oXD5iDtCPeNLQssEuKErjwi4jqghXArqpav0STGMr7HsJ78Auas
 46TWR0g4sDFOySBqeojRjjcqScGMG/1sWadl9QYFwcosat0uOxqLEo5Z4HuwNDxC
 1jpKyWod5osbJTeK3GUkRCGS1ggfEKQVszPgoH10Q46wDRTRcx9blPXvw/tPS3CF
 rCZ3oNrJ1MitdSqcqDo+222LapYP0MU7VdeNAyZaN/AbR2ELDwyg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UncBDIP13Pso for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:07 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpM53Zj3z1RvLy;
 Wed, 21 Dec 2022 14:41:05 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 18/45] hw/riscv: virt: Remove the redundant ipi-id property
Date: Thu, 22 Dec 2022 08:39:55 +1000
Message-Id: <20221221224022.425831-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Atish Patra <atishp@rivosinc.com>

The imsic DT binding[1] has changed and no longer require an ipi-id.
The latest IMSIC driver dynamically allocates ipi id if slow-ipi
is not defined.

Get rid of the unused dt property which may lead to confusion.

[1] https://lore.kernel.org/lkml/20221111044207.1478350-5-apatel@ventanam=
icro.com/

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221122080529.1692533-1-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h | 1 -
 hw/riscv/virt.c         | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index be4ab8fe7f..62513e075c 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -93,7 +93,6 @@ enum {
=20
 #define VIRT_PLATFORM_BUS_NUM_IRQS 32
=20
-#define VIRT_IRQCHIP_IPI_MSI 1
 #define VIRT_IRQCHIP_NUM_MSIS 255
 #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..6cf9355b99 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -546,8 +546,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const=
 MemMapEntry *memmap,
         riscv_socket_count(mc) * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
     if (riscv_socket_count(mc) > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bit=
s",
             imsic_num_bits(imsic_max_hart_per_socket));
@@ -597,8 +595,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const=
 MemMapEntry *memmap,
         riscv_socket_count(mc) * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
     if (imsic_guest_bits) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bi=
ts",
             imsic_guest_bits);
--=20
2.38.1


