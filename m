Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6105E36FF20
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:04:17 +0200 (CEST)
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWYq-0000oe-2r
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcW5H-0000zZ-7K; Fri, 30 Apr 2021 12:33:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4814
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcW5F-00074S-C2; Fri, 30 Apr 2021 12:33:42 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UG3doj049968; Fri, 30 Apr 2021 12:33:21 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388n118xq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 12:33:21 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UGNHMr026635;
 Fri, 30 Apr 2021 16:33:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 384akh9uep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 16:33:19 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UGXH8t30802292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 16:33:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08BE611C054;
 Fri, 30 Apr 2021 16:33:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B239D11C04A;
 Fri, 30 Apr 2021 16:33:16 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 16:33:16 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D4EE5220193;
 Fri, 30 Apr 2021 18:33:15 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/18] aspeed: Integrate HACE
Date: Fri, 30 Apr 2021 18:33:07 +0200
Message-Id: <20210430163309.4182922-8-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430163309.4182922-1-clg@kaod.org>
References: <20210430163309.4182922-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r5DO3J2W3df0XhJF_7SjGzy6XxQ-CGX3
X-Proofpoint-ORIG-GUID: r5DO3J2W3df0XhJF_7SjGzy6XxQ-CGX3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1034 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300108
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

Add the hash and crypto engine model to the Aspeed socs.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20210409000253.1475587-3-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst  |  1 -
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_ast2600.c     | 15 +++++++++++++++
 hw/arm/aspeed_soc.c         | 16 ++++++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 23a1468cd175..a1911f940316 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -60,7 +60,6 @@ Missing devices
  * PWM and Fan Controller
  * Slave GPIO Controller
  * Super I/O Controller
- * Hash/Crypto Engine
  * PCI-Express 1 Controller
  * Graphic Display Controller
  * PECI Controller
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 9359d6da336d..d9161d26d645 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -21,6 +21,7 @@
 #include "hw/rtc/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
+#include "hw/misc/aspeed_hace.h"
 #include "hw/watchdog/wdt_aspeed.h"
 #include "hw/net/ftgmac100.h"
 #include "target/arm/cpu.h"
@@ -50,6 +51,7 @@ struct AspeedSoCState {
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
     AspeedSCUState scu;
+    AspeedHACEState hace;
     AspeedXDMAState xdma;
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
@@ -133,6 +135,7 @@ enum {
     ASPEED_DEV_XDMA,
     ASPEED_DEV_EMMC,
     ASPEED_DEV_KCS,
+    ASPEED_DEV_HACE,
 };
=20
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 2a1255b6a042..e0fbb020c770 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -42,6 +42,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_DEV_ETH2]      =3D 0x1E680000,
     [ASPEED_DEV_ETH4]      =3D 0x1E690000,
     [ASPEED_DEV_VIC]       =3D 0x1E6C0000,
+    [ASPEED_DEV_HACE]      =3D 0x1E6D0000,
     [ASPEED_DEV_SDMC]      =3D 0x1E6E0000,
     [ASPEED_DEV_SCU]       =3D 0x1E6E2000,
     [ASPEED_DEV_XDMA]      =3D 0x1E6E7000,
@@ -102,6 +103,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
     [ASPEED_DEV_I2C]       =3D 110,   /* 110 -> 125 */
     [ASPEED_DEV_ETH1]      =3D 2,
     [ASPEED_DEV_ETH2]      =3D 3,
+    [ASPEED_DEV_HACE]      =3D 4,
     [ASPEED_DEV_ETH3]      =3D 32,
     [ASPEED_DEV_ETH4]      =3D 33,
     [ASPEED_DEV_KCS]       =3D 138,   /* 138 -> 142 */
@@ -213,6 +215,9 @@ static void aspeed_soc_ast2600_init(Object *obj)
                             TYPE_SYSBUS_SDHCI);
=20
     object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
+
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
 }
=20
 /*
@@ -494,6 +499,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
                        qdev_get_gpio_in(DEVICE(&s->a7mpcore),
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_=
kcs_4));
+
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr=
),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_H=
ACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
=20
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 817f3ba63dfd..8ed29113f79f 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -34,6 +34,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] =3D {
     [ASPEED_DEV_VIC]    =3D 0x1E6C0000,
     [ASPEED_DEV_SDMC]   =3D 0x1E6E0000,
     [ASPEED_DEV_SCU]    =3D 0x1E6E2000,
+    [ASPEED_DEV_HACE]   =3D 0x1E6E3000,
     [ASPEED_DEV_XDMA]   =3D 0x1E6E7000,
     [ASPEED_DEV_VIDEO]  =3D 0x1E700000,
     [ASPEED_DEV_ADC]    =3D 0x1E6E9000,
@@ -65,6 +66,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] =3D {
     [ASPEED_DEV_VIC]    =3D 0x1E6C0000,
     [ASPEED_DEV_SDMC]   =3D 0x1E6E0000,
     [ASPEED_DEV_SCU]    =3D 0x1E6E2000,
+    [ASPEED_DEV_HACE]   =3D 0x1E6E3000,
     [ASPEED_DEV_XDMA]   =3D 0x1E6E7000,
     [ASPEED_DEV_ADC]    =3D 0x1E6E9000,
     [ASPEED_DEV_VIDEO]  =3D 0x1E700000,
@@ -117,6 +119,7 @@ static const int aspeed_soc_ast2400_irqmap[] =3D {
     [ASPEED_DEV_ETH2]   =3D 3,
     [ASPEED_DEV_XDMA]   =3D 6,
     [ASPEED_DEV_SDHCI]  =3D 26,
+    [ASPEED_DEV_HACE]   =3D 4,
 };
=20
 #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
@@ -212,6 +215,9 @@ static void aspeed_soc_init(Object *obj)
     }
=20
     object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
+
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -421,6 +427,16 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
=20
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
                        qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_=
4));
+
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr=
),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_H=
ACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
 static Property aspeed_soc_properties[] =3D {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION=
,
--=20
2.26.3


