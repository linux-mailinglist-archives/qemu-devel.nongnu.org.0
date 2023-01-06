Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE36365FA07
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:18:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCc-0001lN-0d; Thu, 05 Jan 2023 22:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCS-0001cT-Ns
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:21 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCN-00088M-CT
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974915; x=1704510915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T0IaEBurbP3qtnCtWfDiZYpa+ZU/poV6jKYf09oFKV0=;
 b=cMRcDMf0KtPFPsZBTKzs1Ir2CRCCyoodUFzHABIr9C2+lmEtzboHxoy9
 hT0rydR/Du2uHcspftGl38Fa+jRLpMVMHvGIYPZtkRvOKmqRReKx6JMNr
 iIe4Xgpu/alCjxz527Ky/3K8408EWIldbpyvPWhWzWzrat+KhZADc2KrF
 Yrdeu0hhPmjHSETC4codqInX7b1143wTc7TRE8GeXdMP88u1hRDDWNwzn
 NdEStEUVIELlFEWoX+5w31Hi+fgWojnvqkwhy8srQQ+5yrj7UtcGIWGST
 O8pqJzRu6DVirNbuDcTUqkRIuygIG3mHJfU9Ys0dU5ZR4aug+gUV+TUZX A==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254798"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:41 +0800
IronPort-SDR: 50s1XLVxdcPn2UFfnRe4OKAQmiBz/5VC01Td5iYOqe4NcoO+ugMr2EjrUaeZInawPLfZgmQwTn
 XF0p5J5Jw62QZqBuEWk+1bvCg2dL9gTDdMxjE+g0u3B6sRAp+UQw44EFmNkspec3aqjDzR7WrP
 VU+GuHCGICdA+ByR/eVfuL7mrm1NsuCnu/wbB8FU8dnB6GKxXrXupabS8ElWyFqes+aYaSvp9z
 JPOvbreX+6Gj+Z5JFh7xya1GkXRhdglqWJgyh9Pg5pE6IMkMbMtSJXdNSuMEtHMxOQ3hpVsrob
 42U=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:52 -0800
IronPort-SDR: GxidrtAhFRexGG2shJTrhzYeRyNUwO+a7LaXfSvsbBMOgnYToyHkk1Ln2mbGc5ApO1CXJyPs+E
 fitXFDM73acpQhSvPc1KwZ4hG0mt8GDON4vhVWijIWd1IAMVtSv9yOQo/gn6htBSmXKNIaOIFY
 HYMbnAWi3lneBxfg7n9jmDmrY/TYQhkh7lNYjKr9CShj5RmwG9SVwlQ0YfLVJ2OaUVhjVUpPhH
 pci3z5Lrhjdk1G0Ge/vwUafhii66jVYidr0fOhUEMvA+8UgaIKStdpjOvajaoxRcaahEq3OwNU
 j/4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:43 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7js3jDLz1RvTr
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:41 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1672974880; x=1675566881; bh=T0IaEBu
 rbP3qtnCtWfDiZYpa+ZU/poV6jKYf09oFKV0=; b=PjDVFFLpEA2go7txR2fFB9r
 e2Fg3466piZdveny2iAxgJ3i0sPhs9oiCWXBnpVqjwfqTEboitINoV3J/bSk34ij
 P+GQ45aXIo6Epm23xU0kIJ0E2IMesEh7lPmikXw3Sagd2t1QnE0cBQaRDYBaRPsj
 pEwP9Vz0jxP6uBfBJKDcYSiBrjqYzuy3dYRpBdbGBpwF7GerhJr6n3Y0qGK9qC5j
 BnHq6iLEFWWqHGB+1u4h/ocMsYDshAepdNifumL925XhOSOSVEln3v7shxJXqrHw
 yLgH7OLgtr/KAKa6oyu0KZqcdRMhagWmtx7XMw6VvjF/UvUErbJkprsAv8Dgf6g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RflqeWAeVDzO for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:40 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jq4Mkkz1RvLy;
 Thu,  5 Jan 2023 19:14:39 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 21/43] hw/{misc,
 riscv}: pfsoc: add system controller as unimplemented
Date: Fri,  6 Jan 2023 13:13:35 +1000
Message-Id: <20230106031357.777790-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Conor Dooley <conor.dooley@microchip.com>

The system controller on PolarFire SoC is access via a mailbox. The
control registers for this mailbox lie in the "IOSCB" region & the
interrupt is cleared via write to the "SYSREG" region. It also has a
QSPI controller, usually connected to a flash chip, that is used for
storing FPGA bitstreams and used for In-Application Programming (IAP).

Linux has an implementation of the system controller, through which the
hwrng is accessed, leading to load/store access faults.

Add the QSPI as unimplemented and a very basic (effectively
unimplemented) version of the system controller's mailbox. Rather than
purely marking the regions as unimplemented, service the mailbox
requests by reporting failures and raising the interrupt so a guest can
better handle the lack of support.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221117225518.4102575-4-conor@kernel.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/misc/mchp_pfsoc_ioscb.h  |  3 ++
 include/hw/misc/mchp_pfsoc_sysreg.h |  1 +
 include/hw/riscv/microchip_pfsoc.h  |  1 +
 hw/misc/mchp_pfsoc_ioscb.c          | 72 ++++++++++++++++++++++++++++-
 hw/misc/mchp_pfsoc_sysreg.c         | 18 ++++++--
 hw/riscv/microchip_pfsoc.c          |  6 +++
 6 files changed, 95 insertions(+), 6 deletions(-)

diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pf=
soc_ioscb.h
index 687b213742..a1104862c8 100644
--- a/include/hw/misc/mchp_pfsoc_ioscb.h
+++ b/include/hw/misc/mchp_pfsoc_ioscb.h
@@ -29,6 +29,8 @@ typedef struct MchpPfSoCIoscbState {
     MemoryRegion lane01;
     MemoryRegion lane23;
     MemoryRegion ctrl;
+    MemoryRegion qspixip;
+    MemoryRegion mailbox;
     MemoryRegion cfg;
     MemoryRegion ccc;
     MemoryRegion pll_mss;
@@ -41,6 +43,7 @@ typedef struct MchpPfSoCIoscbState {
     MemoryRegion cfm_sgmii;
     MemoryRegion bc_sgmii;
     MemoryRegion io_calib_sgmii;
+    qemu_irq irq;
 } MchpPfSoCIoscbState;
=20
 #define TYPE_MCHP_PFSOC_IOSCB "mchp.pfsoc.ioscb"
diff --git a/include/hw/misc/mchp_pfsoc_sysreg.h b/include/hw/misc/mchp_p=
fsoc_sysreg.h
index 546ba68f6a..3cebe40ea9 100644
--- a/include/hw/misc/mchp_pfsoc_sysreg.h
+++ b/include/hw/misc/mchp_pfsoc_sysreg.h
@@ -28,6 +28,7 @@
 typedef struct MchpPfSoCSysregState {
     SysBusDevice parent;
     MemoryRegion sysreg;
+    qemu_irq irq;
 } MchpPfSoCSysregState;
=20
 #define TYPE_MCHP_PFSOC_SYSREG "mchp.pfsoc.sysreg"
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microc=
hip_pfsoc.h
index 7e7950dd36..69a686b54a 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -147,6 +147,7 @@ enum {
     MICROCHIP_PFSOC_MMUART2_IRQ =3D 92,
     MICROCHIP_PFSOC_MMUART3_IRQ =3D 93,
     MICROCHIP_PFSOC_MMUART4_IRQ =3D 94,
+    MICROCHIP_PFSOC_MAILBOX_IRQ =3D 96,
 };
=20
 #define MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT    1
diff --git a/hw/misc/mchp_pfsoc_ioscb.c b/hw/misc/mchp_pfsoc_ioscb.c
index f976e42f72..a71d134295 100644
--- a/hw/misc/mchp_pfsoc_ioscb.c
+++ b/hw/misc/mchp_pfsoc_ioscb.c
@@ -24,6 +24,7 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
+#include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/misc/mchp_pfsoc_ioscb.h"
=20
@@ -34,6 +35,9 @@
 #define IOSCB_WHOLE_REG_SIZE        0x10000000
 #define IOSCB_SUBMOD_REG_SIZE       0x1000
 #define IOSCB_CCC_REG_SIZE          0x2000000
+#define IOSCB_CTRL_REG_SIZE         0x800
+#define IOSCB_QSPIXIP_REG_SIZE      0x200
+
=20
 /*
  * There are many sub-modules in the IOSCB module.
@@ -45,6 +49,8 @@
 #define IOSCB_LANE01_BASE           0x06500000
 #define IOSCB_LANE23_BASE           0x06510000
 #define IOSCB_CTRL_BASE             0x07020000
+#define IOSCB_QSPIXIP_BASE          0x07020100
+#define IOSCB_MAILBOX_BASE          0x07020800
 #define IOSCB_CFG_BASE              0x07080000
 #define IOSCB_CCC_BASE              0x08000000
 #define IOSCB_PLL_MSS_BASE          0x0E001000
@@ -143,6 +149,58 @@ static const MemoryRegionOps mchp_pfsoc_io_calib_ddr=
_ops =3D {
     .endianness =3D DEVICE_LITTLE_ENDIAN,
 };
=20
+#define SERVICES_CR             0x50
+#define SERVICES_SR             0x54
+#define SERVICES_STATUS_SHIFT   16
+
+static uint64_t mchp_pfsoc_ctrl_read(void *opaque, hwaddr offset,
+                                     unsigned size)
+{
+    uint32_t val =3D 0;
+
+    switch (offset) {
+    case SERVICES_SR:
+        /*
+         * Although some services have no error codes, most do. All serv=
ices
+         * that do implement errors, begin their error codes at 1. Treat=
 all
+         * service requests as failures & return 1.
+         * See the "PolarFire=C2=AE FPGA and PolarFire SoC FPGA System S=
ervices"
+         * user guide for more information on service error codes.
+         */
+        val =3D 1u << SERVICES_STATUS_SHIFT;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device read "
+                      "(size %d, offset 0x%" HWADDR_PRIx ")\n",
+                      __func__, size, offset);
+    }
+
+    return val;
+}
+
+static void mchp_pfsoc_ctrl_write(void *opaque, hwaddr offset,
+                                  uint64_t value, unsigned size)
+{
+    MchpPfSoCIoscbState *s =3D opaque;
+
+    switch (offset) {
+    case SERVICES_CR:
+        qemu_irq_raise(s->irq);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
+                      "(size %d, value 0x%" PRIx64
+                      ", offset 0x%" HWADDR_PRIx ")\n",
+                      __func__, size, value, offset);
+    }
+}
+
+static const MemoryRegionOps mchp_pfsoc_ctrl_ops =3D {
+    .read =3D mchp_pfsoc_ctrl_read,
+    .write =3D mchp_pfsoc_ctrl_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+};
+
 static void mchp_pfsoc_ioscb_realize(DeviceState *dev, Error **errp)
 {
     MchpPfSoCIoscbState *s =3D MCHP_PFSOC_IOSCB(dev);
@@ -162,10 +220,18 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *d=
ev, Error **errp)
                           "mchp.pfsoc.ioscb.lane23", IOSCB_SUBMOD_REG_SI=
ZE);
     memory_region_add_subregion(&s->container, IOSCB_LANE23_BASE, &s->la=
ne23);
=20
-    memory_region_init_io(&s->ctrl, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
-                          "mchp.pfsoc.ioscb.ctrl", IOSCB_SUBMOD_REG_SIZE=
);
+    memory_region_init_io(&s->ctrl, OBJECT(s), &mchp_pfsoc_ctrl_ops, s,
+                          "mchp.pfsoc.ioscb.ctrl", IOSCB_CTRL_REG_SIZE);
     memory_region_add_subregion(&s->container, IOSCB_CTRL_BASE, &s->ctrl=
);
=20
+    memory_region_init_io(&s->qspixip, OBJECT(s), &mchp_pfsoc_dummy_ops,=
 s,
+                          "mchp.pfsoc.ioscb.qspixip", IOSCB_QSPIXIP_REG_=
SIZE);
+    memory_region_add_subregion(&s->container, IOSCB_QSPIXIP_BASE, &s->q=
spixip);
+
+    memory_region_init_io(&s->mailbox, OBJECT(s), &mchp_pfsoc_dummy_ops,=
 s,
+                          "mchp.pfsoc.ioscb.mailbox", IOSCB_SUBMOD_REG_S=
IZE);
+    memory_region_add_subregion(&s->container, IOSCB_MAILBOX_BASE, &s->m=
ailbox);
+
     memory_region_init_io(&s->cfg, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
                           "mchp.pfsoc.ioscb.cfg", IOSCB_SUBMOD_REG_SIZE)=
;
     memory_region_add_subregion(&s->container, IOSCB_CFG_BASE, &s->cfg);
@@ -222,6 +288,8 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *dev=
, Error **errp)
                           IOSCB_SUBMOD_REG_SIZE);
     memory_region_add_subregion(&s->container, IOSCB_IO_CALIB_SGMII_BASE=
,
                                 &s->io_calib_sgmii);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 }
=20
 static void mchp_pfsoc_ioscb_class_init(ObjectClass *klass, void *data)
diff --git a/hw/misc/mchp_pfsoc_sysreg.c b/hw/misc/mchp_pfsoc_sysreg.c
index 89571eded5..7876fe0c5b 100644
--- a/hw/misc/mchp_pfsoc_sysreg.c
+++ b/hw/misc/mchp_pfsoc_sysreg.c
@@ -24,10 +24,12 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
+#include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/misc/mchp_pfsoc_sysreg.h"
=20
 #define ENVM_CR         0xb8
+#define MESSAGE_INT     0x118c
=20
 static uint64_t mchp_pfsoc_sysreg_read(void *opaque, hwaddr offset,
                                        unsigned size)
@@ -52,10 +54,17 @@ static uint64_t mchp_pfsoc_sysreg_read(void *opaque, =
hwaddr offset,
 static void mchp_pfsoc_sysreg_write(void *opaque, hwaddr offset,
                                     uint64_t value, unsigned size)
 {
-    qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
-                  "(size %d, value 0x%" PRIx64
-                  ", offset 0x%" HWADDR_PRIx ")\n",
-                  __func__, size, value, offset);
+    MchpPfSoCSysregState *s =3D opaque;
+    switch (offset) {
+    case MESSAGE_INT:
+        qemu_irq_lower(s->irq);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
+                      "(size %d, value 0x%" PRIx64
+                      ", offset 0x%" HWADDR_PRIx ")\n",
+                      __func__, size, value, offset);
+    }
 }
=20
 static const MemoryRegionOps mchp_pfsoc_sysreg_ops =3D {
@@ -73,6 +82,7 @@ static void mchp_pfsoc_sysreg_realize(DeviceState *dev,=
 Error **errp)
                           "mchp.pfsoc.sysreg",
                           MCHP_PFSOC_SYSREG_REG_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->sysreg);
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 }
=20
 static void mchp_pfsoc_sysreg_class_init(ObjectClass *klass, void *data)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 2a24e3437a..b10321b564 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -306,6 +306,9 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->sysreg), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysreg), 0,
                     memmap[MICROCHIP_PFSOC_SYSREG].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sysreg), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic),
+                       MICROCHIP_PFSOC_MAILBOX_IRQ));
=20
     /* AXISW */
     create_unimplemented_device("microchip.pfsoc.axisw",
@@ -459,6 +462,9 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->ioscb), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioscb), 0,
                     memmap[MICROCHIP_PFSOC_IOSCB].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ioscb), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic),
+                       MICROCHIP_PFSOC_MAILBOX_IRQ));
=20
     /* FPGA Fabric */
     create_unimplemented_device("microchip.pfsoc.fabricfic3",
--=20
2.39.0


