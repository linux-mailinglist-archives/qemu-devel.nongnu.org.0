Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF795080DE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 08:12:39 +0200 (CEST)
Received: from localhost ([::1]:59420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh3Zu-0003m6-9o
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 02:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3HJ-0008EC-3M
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:53:25 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3HH-0004UQ-5b
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650434003; x=1681970003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e2Z1mPMjuALcbIIiDbdx4iqIL8NEKphMfAicrXHlSr0=;
 b=Z3+pd43cRcw6FiTpzdcbkCY3GcM/DmN4SytkHS9BEOIR8PbuB+PfDW8J
 sy/qekpKAS0+eiu4BbbmWQiJHSGwl7kIR9jEjjejruG7VvCzorF62coq+
 4pbuItwdZNTgiYf8/9jJvfFRKqk4YtgPfKNFP+iQT2X8T0r2xk/Uo0xIg
 PCC2PM9tvSnR4nWi+8CaVbiXEYm8kEnsEc4qkdzcyxeIvJq+gmX399Vip
 AdUTls8+4uT4SPkVD14vVd0zQy1tIo1SZFPozzZXC2uk28ZYVQesELMaS
 xilqLNKg1GU9YDqv14iavCGNvn7Lf+/2nG6VZKxy9E/iy3Q4SYZcJtoC/ w==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; d="scan'208";a="199228719"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 13:53:18 +0800
IronPort-SDR: 0VHhUOUJ6N/1XWesE0fv14cvg7f6i9K6C/HKyVaGSALCFTLyzWtB9y3RwPxveFlOvzPP+C1bMR
 gySAbD1RWZjFOssPwgJvjc2i1xbdwP0niyN8IFnVX5VTJcxe3J6k/vQ6k+00yfOFmhsWDKEMuC
 zfY5/k+q1qQgsRec7WtXPwNIIJc56cnvc1J+De530gh9m7I8kudazUxmbDFHNbvu9Wcf2xitLm
 RfegHHNEeCCjogBC8Yokn6CZ8XBR+0YXjKatqt1eNmxDIEIk2k0D1ndlRz55pfFrPM/kMRJk17
 oqE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:24:17 -0700
IronPort-SDR: xq1H8eRX1E0XrqGSULumCS/msUKtMbv55utdEs6EcDfo4+oB7XQPOiRYYxeMaJirA6pgXBee81
 kc09k7cJ0ifOBtzQY/r0ViquR5z+upyyiCZo09impsfjc/V9D6US53XxHlCIbpnI/tI5fEPuU5
 FjwkQ3lm5CImKD3IIdBMnXKBEXvECZqeu3BAdp+YyoUo3lzvjltphPyfMjmfCbJnIw9fO2W/HE
 Y5QoUGJm/rLWnDDU/TEaupICEV6ggqBM20rLAO09fKr3rGFOESZeup/0HKVMU+Yv4iFDP9yfWF
 YpU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:53:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjqbF13NHz1SVp1
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 22:53:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650433992; x=1653025993; bh=e2Z1mPMjuALcbIIiDb
 dx4iqIL8NEKphMfAicrXHlSr0=; b=DNbE90FZ7/spCVivuHuH8eyRnV7FCfHsGX
 kNA+5fpJYpSUn5q55drG7u1i03nUu/Dl6L5T0F+m9i0axizd6T62a+0OIwLDxw6Q
 VUO25umyGSwe/fTxIIiRP+jVDsW5obI+kgo19aS+HclA8ZwKmZ2K0nLV1CPC9/FM
 Vf6HJHzumcIK1ykMM89lZxaSKYYTjxiWMLwTgW5uVWq8vtVms464pwSHOtKzLtP1
 TNnaQPyKOyR3VQZYvu4gbgsZqsRgv6VJKSg+Z+bSeaN9NhPnlWPkUxkpb4SveMtp
 V/UqqfcgKDfR4OsbkVQ7LfcA7LUS93ZyFUUepFYuEnF22jK31+0g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BpluIYJRISV8 for <qemu-devel@nongnu.org>;
 Tue, 19 Apr 2022 22:53:12 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kjqb80LZ2z1Rwrw;
 Tue, 19 Apr 2022 22:53:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 3/6] hw/riscv: virt: Create a platform bus
Date: Wed, 20 Apr 2022 15:52:45 +1000
Message-Id: <20220420055248.960491-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=1021dae20=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Create a platform bus to allow dynamic devices to be connected. This is
based on the ARM implementation.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 include/hw/riscv/virt.h |  7 ++++-
 hw/riscv/virt.c         | 68 +++++++++++++++++++++++++++++------------
 hw/riscv/Kconfig        |  1 +
 3 files changed, 56 insertions(+), 20 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 8b8db3fb7c..984e55c77f 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -46,6 +46,7 @@ struct RISCVVirtState {
=20
     /*< public >*/
     Notifier machine_done;
+    DeviceState *platform_bus_dev;
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
     DeviceState *irqchip[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
@@ -76,6 +77,7 @@ enum {
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
+    VIRT_PLATFORM_BUS,
     VIRT_PCIE_ECAM
 };
=20
@@ -85,9 +87,12 @@ enum {
     VIRTIO_IRQ =3D 1, /* 1 to 8 */
     VIRTIO_COUNT =3D 8,
     PCIE_IRQ =3D 0x20, /* 32 to 35 */
-    VIRTIO_NDEV =3D 0x35 /* Arbitrary maximum number of interrupts */
+    VIRT_PLATFORM_BUS_IRQ =3D 64, /* 64 to 96 */
+    VIRTIO_NDEV =3D 96 /* Arbitrary maximum number of interrupts */
 };
=20
+#define VIRT_PLATFORM_BUS_NUM_IRQS 32
+
 #define VIRT_IRQCHIP_IPI_MSI 1
 #define VIRT_IRQCHIP_NUM_MSIS 255
 #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3d48469367..169da70350 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -37,6 +37,7 @@
 #include "hw/intc/riscv_imsic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
+#include "hw/platform-bus.h"
 #include "chardev/char.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
@@ -68,25 +69,26 @@
 #endif
=20
 static const MemMapEntry virt_memmap[] =3D {
-    [VIRT_DEBUG] =3D       {        0x0,         0x100 },
-    [VIRT_MROM] =3D        {     0x1000,        0xf000 },
-    [VIRT_TEST] =3D        {   0x100000,        0x1000 },
-    [VIRT_RTC] =3D         {   0x101000,        0x1000 },
-    [VIRT_CLINT] =3D       {  0x2000000,       0x10000 },
-    [VIRT_ACLINT_SSWI] =3D {  0x2F00000,        0x4000 },
-    [VIRT_PCIE_PIO] =3D    {  0x3000000,       0x10000 },
-    [VIRT_PLIC] =3D        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * =
2) },
-    [VIRT_APLIC_M] =3D     {  0xc000000, APLIC_SIZE(VIRT_CPUS_MAX) },
-    [VIRT_APLIC_S] =3D     {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
-    [VIRT_UART0] =3D       { 0x10000000,         0x100 },
-    [VIRT_VIRTIO] =3D      { 0x10001000,        0x1000 },
-    [VIRT_FW_CFG] =3D      { 0x10100000,          0x18 },
-    [VIRT_FLASH] =3D       { 0x20000000,     0x4000000 },
-    [VIRT_IMSIC_M] =3D     { 0x24000000, VIRT_IMSIC_MAX_SIZE },
-    [VIRT_IMSIC_S] =3D     { 0x28000000, VIRT_IMSIC_MAX_SIZE },
-    [VIRT_PCIE_ECAM] =3D   { 0x30000000,    0x10000000 },
-    [VIRT_PCIE_MMIO] =3D   { 0x40000000,    0x40000000 },
-    [VIRT_DRAM] =3D        { 0x80000000,           0x0 },
+    [VIRT_DEBUG] =3D        {        0x0,         0x100 },
+    [VIRT_MROM] =3D         {     0x1000,        0xf000 },
+    [VIRT_TEST] =3D         {   0x100000,        0x1000 },
+    [VIRT_RTC] =3D          {   0x101000,        0x1000 },
+    [VIRT_CLINT] =3D        {  0x2000000,       0x10000 },
+    [VIRT_ACLINT_SSWI] =3D  {  0x2F00000,        0x4000 },
+    [VIRT_PCIE_PIO] =3D     {  0x3000000,       0x10000 },
+    [VIRT_PLATFORM_BUS] =3D {  0x4000000,     0x2000000 },
+    [VIRT_PLIC] =3D         {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX *=
 2) },
+    [VIRT_APLIC_M] =3D      {  0xc000000, APLIC_SIZE(VIRT_CPUS_MAX) },
+    [VIRT_APLIC_S] =3D      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
+    [VIRT_UART0] =3D        { 0x10000000,         0x100 },
+    [VIRT_VIRTIO] =3D       { 0x10001000,        0x1000 },
+    [VIRT_FW_CFG] =3D       { 0x10100000,          0x18 },
+    [VIRT_FLASH] =3D        { 0x20000000,     0x4000000 },
+    [VIRT_IMSIC_M] =3D      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
+    [VIRT_IMSIC_S] =3D      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
+    [VIRT_PCIE_ECAM] =3D    { 0x30000000,    0x10000000 },
+    [VIRT_PCIE_MMIO] =3D    { 0x40000000,    0x40000000 },
+    [VIRT_DRAM] =3D         { 0x80000000,           0x0 },
 };
=20
 /* PCIe high mmio is fixed for RV32 */
@@ -1156,6 +1158,32 @@ static DeviceState *virt_create_aia(RISCVVirtAIATy=
pe aia_type, int aia_guests,
     return aplic_m;
 }
=20
+static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
+{
+    DeviceState *dev;
+    SysBusDevice *sysbus;
+    const MemMapEntry *memmap =3D virt_memmap;
+    int i;
+    MemoryRegion *sysmem =3D get_system_memory();
+
+    dev =3D qdev_new(TYPE_PLATFORM_BUS_DEVICE);
+    dev->id =3D g_strdup(TYPE_PLATFORM_BUS_DEVICE);
+    qdev_prop_set_uint32(dev, "num_irqs", VIRT_PLATFORM_BUS_NUM_IRQS);
+    qdev_prop_set_uint32(dev, "mmio_size", memmap[VIRT_PLATFORM_BUS].siz=
e);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    s->platform_bus_dev =3D dev;
+
+    sysbus =3D SYS_BUS_DEVICE(dev);
+    for (i =3D 0; i < VIRT_PLATFORM_BUS_NUM_IRQS; i++) {
+        int irq =3D VIRT_PLATFORM_BUS_IRQ + i;
+        sysbus_connect_irq(sysbus, i, qdev_get_gpio_in(irqchip, irq));
+    }
+
+    memory_region_add_subregion(sysmem,
+                                memmap[VIRT_PLATFORM_BUS].base,
+                                sysbus_mmio_get_region(sysbus, 0));
+}
+
 static
 void virt_machine_done(Notifier *notifier, void *data)
 {
@@ -1407,6 +1435,8 @@ static void virt_machine_init(MachineState *machine=
)
                    memmap[VIRT_PCIE_PIO].base,
                    DEVICE(pcie_irqchip));
=20
+    create_platform_bus(s, DEVICE(mmio_irqchip));
+
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 91bb9d21c4..da790f5936 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -48,6 +48,7 @@ config RISCV_VIRT
     select SIFIVE_TEST
     select VIRTIO_MMIO
     select FW_CFG_DMA
+    select PLATFORM_BUS
=20
 config SIFIVE_E
     bool
--=20
2.35.1


