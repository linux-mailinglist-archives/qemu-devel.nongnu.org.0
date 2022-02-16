Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48C44B84F9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:54:38 +0100 (CET)
Received: from localhost ([::1]:50030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKH1A-0004s1-M6
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:54:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKGVE-0003YZ-41; Wed, 16 Feb 2022 04:21:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKGVB-0000E4-Kz; Wed, 16 Feb 2022 04:21:35 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G8kf8T010072; 
 Wed, 16 Feb 2022 09:21:20 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8x2brur5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:21:20 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G9IjGG024731;
 Wed, 16 Feb 2022 09:21:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64ha6hfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:21:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21G9LFm044237310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 09:21:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F2A9A405B;
 Wed, 16 Feb 2022 09:21:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9844A4069;
 Wed, 16 Feb 2022 09:21:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 16 Feb 2022 09:21:14 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.91.22])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3AC69220032;
 Wed, 16 Feb 2022 10:21:14 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/6] ast2600: Add Secure Boot Controller model
Date: Wed, 16 Feb 2022 10:21:07 +0100
Message-Id: <20220216092111.237896-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216092111.237896-1-clg@kaod.org>
References: <20220216092111.237896-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pOu1TAxQhdwMeosPL4Oe4ZnVGV5g_viF
X-Proofpoint-GUID: pOu1TAxQhdwMeosPL4Oe4ZnVGV5g_viF
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1034
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160051
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

Just a stub that indicates the system has booted in secure boot mode.
Used for testing the driver:

 https://lore.kernel.org/all/20211019080608.283324-1-joel@jms.id.au/

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h  |   3 +
 include/hw/misc/aspeed_sbc.h |  33 ++++++++
 hw/arm/aspeed_ast2600.c      |   9 +++
 hw/misc/aspeed_sbc.c         | 141 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   1 +
 5 files changed, 187 insertions(+)
 create mode 100644 include/hw/misc/aspeed_sbc.h
 create mode 100644 hw/misc/aspeed_sbc.c

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index cae9906684cb..da043dcb454d 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -24,6 +24,7 @@
 #include "hw/misc/aspeed_i3c.h"
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/misc/aspeed_hace.h"
+#include "hw/misc/aspeed_sbc.h"
 #include "hw/watchdog/wdt_aspeed.h"
 #include "hw/net/ftgmac100.h"
 #include "target/arm/cpu.h"
@@ -60,6 +61,7 @@ struct AspeedSoCState {
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     EHCISysBusState ehci[ASPEED_EHCIS_NUM];
+    AspeedSBCState sbc;
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
     FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
@@ -109,6 +111,7 @@ enum {
     ASPEED_DEV_SDMC,
     ASPEED_DEV_SCU,
     ASPEED_DEV_ADC,
+    ASPEED_DEV_SBC,
     ASPEED_DEV_VIDEO,
     ASPEED_DEV_SRAM,
     ASPEED_DEV_SDHCI,
diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
new file mode 100644
index 000000000000..e47333cb55db
--- /dev/null
+++ b/include/hw/misc/aspeed_sbc.h
@@ -0,0 +1,33 @@
+/*
+ * sASPEED Secure Boot Controller
+ *
+ * Copyright (C) 2021 IBM Corp.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ASPEED_SBC_H
+#define ASPEED_SBC_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_SBC "aspeed.sbc"
+#define TYPE_ASPEED_AST2600_SBC TYPE_ASPEED_SBC "-ast2600"
+OBJECT_DECLARE_TYPE(AspeedSBCState, AspeedSBCClass, ASPEED_SBC)
+
+#define ASPEED_SBC_NR_REGS (0x93c >> 2)
+
+struct AspeedSBCState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    uint32_t regs[ASPEED_SBC_NR_REGS];
+};
+
+
+struct AspeedSBCClass {
+    SysBusDeviceClass parent_class;
+};
+
+#endif /* _ASPEED_SBC_H_ */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 12f6edc081fd..21cd3342c578 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -47,6 +47,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_DEV_XDMA]      =3D 0x1E6E7000,
     [ASPEED_DEV_ADC]       =3D 0x1E6E9000,
     [ASPEED_DEV_DP]        =3D 0x1E6EB000,
+    [ASPEED_DEV_SBC]       =3D 0x1E6F2000,
     [ASPEED_DEV_VIDEO]     =3D 0x1E700000,
     [ASPEED_DEV_SDHCI]     =3D 0x1E740000,
     [ASPEED_DEV_EMMC]      =3D 0x1E750000,
@@ -227,6 +228,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
     object_initialize_child(obj, "hace", &s->hace, typename);
=20
     object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
+
+    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
 }
=20
 /*
@@ -539,6 +542,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *de=
v, Error **errp)
         /* The AST2600 I3C controller has one IRQ per bus. */
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
     }
+
+    /* Secure Boot Controller */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->sbc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]=
);
 }
=20
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
new file mode 100644
index 000000000000..e5ac35eb975b
--- /dev/null
+++ b/hw/misc/aspeed_sbc.c
@@ -0,0 +1,141 @@
+/*
+ * ASPEED Secure Boot Controller
+ *
+ * Copyright (C) 2021 IBM Corp.
+ *
+ * Joel Stanley <joel@jms.id.au>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "hw/misc/aspeed_sbc.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+
+#define R_PROT          (0x000 / 4)
+#define R_STATUS        (0x014 / 4)
+
+static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int si=
ze)
+{
+    AspeedSBCState *s =3D ASPEED_SBC(opaque);
+
+    addr >>=3D 2;
+
+    if (addr >=3D ASPEED_SBC_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "=
\n",
+                      __func__, addr << 2);
+        return 0;
+    }
+
+    return s->regs[addr];
+}
+
+static void aspeed_sbc_write(void *opaque, hwaddr addr, uint64_t data,
+                              unsigned int size)
+{
+    AspeedSBCState *s =3D ASPEED_SBC(opaque);
+
+    addr >>=3D 2;
+
+    if (addr >=3D ASPEED_SBC_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx =
"\n",
+                      __func__, addr << 2);
+        return;
+    }
+
+    switch (addr) {
+    case R_STATUS:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to read only register 0x%" HWADDR_PRIx "\=
n",
+                      __func__, addr << 2);
+        return;
+    default:
+        break;
+    }
+
+    s->regs[addr] =3D data;
+}
+
+static const MemoryRegionOps aspeed_sbc_ops =3D {
+    .read =3D aspeed_sbc_read,
+    .write =3D aspeed_sbc_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 4,
+    },
+};
+
+static void aspeed_sbc_reset(DeviceState *dev)
+{
+    struct AspeedSBCState *s =3D ASPEED_SBC(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+
+    /* Set secure boot enabled, and boot from emmc/spi */
+    s->regs[R_STATUS] =3D 1 << 6 | 1 << 5;
+}
+
+static void aspeed_sbc_realize(DeviceState *dev, Error **errp)
+{
+    AspeedSBCState *s =3D ASPEED_SBC(dev);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sbc_ops, s,
+            TYPE_ASPEED_SBC, 0x1000);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_aspeed_sbc =3D {
+    .name =3D TYPE_ASPEED_SBC,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedSBCState, ASPEED_SBC_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->realize =3D aspeed_sbc_realize;
+    dc->reset =3D aspeed_sbc_reset;
+    dc->vmsd =3D &vmstate_aspeed_sbc;
+}
+
+static const TypeInfo aspeed_sbc_info =3D {
+    .name =3D TYPE_ASPEED_SBC,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(AspeedSBCState),
+    .class_init =3D aspeed_sbc_class_init,
+    .class_size =3D sizeof(AspeedSBCClass)
+};
+
+static void aspeed_ast2600_sbc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->desc =3D "AST2600 Secure Boot Controller";
+}
+
+static const TypeInfo aspeed_ast2600_sbc_info =3D {
+    .name =3D TYPE_ASPEED_AST2600_SBC,
+    .parent =3D TYPE_ASPEED_SBC,
+    .class_init =3D aspeed_ast2600_sbc_class_init,
+};
+
+static void aspeed_sbc_register_types(void)
+{
+    type_register_static(&aspeed_ast2600_sbc_info);
+    type_register_static(&aspeed_sbc_info);
+}
+
+type_init(aspeed_sbc_register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 6dcbe044f3f0..645585371a8b 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -111,6 +111,7 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: file=
s(
   'aspeed_i3c.c',
   'aspeed_lpc.c',
   'aspeed_scu.c',
+  'aspeed_sbc.c',
   'aspeed_sdmc.c',
   'aspeed_xdma.c'))
=20
--=20
2.34.1


