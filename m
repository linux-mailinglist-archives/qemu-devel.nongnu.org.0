Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957A04CF2B9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:38:40 +0100 (CET)
Received: from localhost ([::1]:53888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7x1-0005sE-OQ
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:38:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nR7eO-0003I7-T3; Mon, 07 Mar 2022 02:19:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nR7eM-000378-M5; Mon, 07 Mar 2022 02:19:24 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2277AjTV001913; 
 Mon, 7 Mar 2022 07:19:07 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3emsauy2e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 07:19:06 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2277H0v4012630;
 Mon, 7 Mar 2022 07:19:04 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3eky4huxt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 07:19:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2277J2Cw42926520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Mar 2022 07:19:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F055E52063;
 Mon,  7 Mar 2022 07:19:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id AF3CD5204F;
 Mon,  7 Mar 2022 07:19:01 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.76.59])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EF7FD2201D3;
 Mon,  7 Mar 2022 08:19:00 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 4/6] aspeed/smc: Rename 'max_peripherals' to 'max_cs'
Date: Mon,  7 Mar 2022 08:18:54 +0100
Message-Id: <20220307071856.1410731-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307071856.1410731-1-clg@kaod.org>
References: <20220307071856.1410731-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bC8HHva8cToWuJWSFMtspNX4mKqnDO31
X-Proofpoint-ORIG-GUID: bC8HHva8cToWuJWSFMtspNX4mKqnDO31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_01,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1034 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070041
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
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The naming makes more sense in a SPI controller model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/ssi/aspeed_smc.c         | 42 ++++++++++++++++++-------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 4a9354e13c7f..6501a04b8f3e 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -95,7 +95,7 @@ struct AspeedSMCClass {
     uint8_t r_timings;
     uint8_t nregs_timings;
     uint8_t conf_enable_w0;
-    uint8_t max_peripherals;
+    uint8_t max_cs;
     const uint32_t *resets;
     const AspeedSegments *segments;
     uint32_t segment_addr_mask;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6859f061c8be..f194182beacf 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -224,7 +224,7 @@ static bool aspeed_smc_flash_overlap(const AspeedSMCS=
tate *s,
     AspeedSegments seg;
     int i;
=20
-    for (i =3D 0; i < asc->max_peripherals; i++) {
+    for (i =3D 0; i < asc->max_cs; i++) {
         if (i =3D=3D cs) {
             continue;
         }
@@ -290,7 +290,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSta=
te *s, int cs,
      */
     if ((asc->segments =3D=3D aspeed_2500_spi1_segments ||
          asc->segments =3D=3D aspeed_2500_spi2_segments) &&
-        cs =3D=3D asc->max_peripherals &&
+        cs =3D=3D asc->max_cs &&
         seg.addr + seg.size !=3D asc->segments[cs].addr +
         asc->segments[cs].size) {
         aspeed_smc_error("Tried to change CS%d end address to 0x%"
@@ -693,13 +693,13 @@ static void aspeed_smc_reset(DeviceState *d)
     }
=20
     /* Unselect all peripherals */
-    for (i =3D 0; i < asc->max_peripherals; ++i) {
+    for (i =3D 0; i < asc->max_cs; ++i) {
         s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
         qemu_set_irq(s->cs_lines[i], true);
     }
=20
     /* setup the default segment register values and regions for all */
-    for (i =3D 0; i < asc->max_peripherals; ++i) {
+    for (i =3D 0; i < asc->max_cs; ++i) {
         aspeed_smc_flash_set_segment_region(s, i,
                     asc->segment_to_reg(s, &asc->segments[i]));
     }
@@ -729,8 +729,8 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
         (aspeed_smc_has_dma(asc) && addr =3D=3D R_DMA_LEN) ||
         (aspeed_smc_has_dma(asc) && addr =3D=3D R_DMA_CHECKSUM) ||
         (addr >=3D R_SEG_ADDR0 &&
-         addr < R_SEG_ADDR0 + asc->max_peripherals) ||
-        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peripheral=
s)) {
+         addr < R_SEG_ADDR0 + asc->max_cs) ||
+        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_cs)) {
=20
         trace_aspeed_smc_read(addr << 2, size, s->regs[addr]);
=20
@@ -1042,11 +1042,11 @@ static void aspeed_smc_write(void *opaque, hwaddr=
 addr, uint64_t data,
          addr < s->r_timings + asc->nregs_timings) ||
         addr =3D=3D s->r_ce_ctrl) {
         s->regs[addr] =3D value;
-    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peri=
pherals) {
+    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_cs) =
{
         int cs =3D addr - s->r_ctrl0;
         aspeed_smc_flash_update_ctrl(&s->flashes[cs], value);
     } else if (addr >=3D R_SEG_ADDR0 &&
-               addr < R_SEG_ADDR0 + asc->max_peripherals) {
+               addr < R_SEG_ADDR0 + asc->max_cs) {
         int cs =3D addr - R_SEG_ADDR0;
=20
         if (value !=3D s->regs[R_SEG_ADDR0 + cs]) {
@@ -1090,7 +1090,7 @@ static void aspeed_smc_instance_init(Object *obj)
     AspeedSMCClass *asc =3D ASPEED_SMC_GET_CLASS(s);
     int i;
=20
-    for (i =3D 0; i < asc->max_peripherals; i++) {
+    for (i =3D 0; i < asc->max_cs; i++) {
         object_initialize_child(obj, "flash[*]", &s->flashes[i],
                                 TYPE_ASPEED_SMC_FLASH);
     }
@@ -1133,9 +1133,9 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
     s->spi =3D ssi_create_bus(dev, "spi");
=20
     /* Setup cs_lines for peripherals */
-    s->cs_lines =3D g_new0(qemu_irq, asc->max_peripherals);
+    s->cs_lines =3D g_new0(qemu_irq, asc->max_cs);
=20
-    for (i =3D 0; i < asc->max_peripherals; ++i) {
+    for (i =3D 0; i < asc->max_cs; ++i) {
         sysbus_init_irq(sbd, &s->cs_lines[i]);
     }
=20
@@ -1168,7 +1168,7 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
      * module behind to handle the memory accesses. This depends on
      * the board configuration.
      */
-    for (i =3D 0; i < asc->max_peripherals; ++i) {
+    for (i =3D 0; i < asc->max_cs; ++i) {
         AspeedSMCFlash *fl =3D &s->flashes[i];
=20
         if (!object_property_set_link(OBJECT(fl), "controller", OBJECT(s=
),
@@ -1314,7 +1314,7 @@ static void aspeed_2400_smc_class_init(ObjectClass =
*klass, void *data)
     asc->r_timings         =3D R_TIMINGS;
     asc->nregs_timings     =3D 1;
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
-    asc->max_peripherals   =3D 1;
+    asc->max_cs            =3D 1;
     asc->segments          =3D aspeed_2400_smc_segments;
     asc->flash_window_base =3D 0x10000000;
     asc->flash_window_size =3D 0x6000000;
@@ -1359,7 +1359,7 @@ static void aspeed_2400_fmc_class_init(ObjectClass =
*klass, void *data)
     asc->r_timings         =3D R_TIMINGS;
     asc->nregs_timings     =3D 1;
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
-    asc->max_peripherals   =3D 5;
+    asc->max_cs            =3D 5;
     asc->segments          =3D aspeed_2400_fmc_segments;
     asc->segment_addr_mask =3D 0xffff0000;
     asc->resets            =3D aspeed_2400_fmc_resets;
@@ -1401,7 +1401,7 @@ static void aspeed_2400_spi1_class_init(ObjectClass=
 *klass, void *data)
     asc->r_timings         =3D R_SPI_TIMINGS;
     asc->nregs_timings     =3D 1;
     asc->conf_enable_w0    =3D SPI_CONF_ENABLE_W0;
-    asc->max_peripherals   =3D 1;
+    asc->max_cs            =3D 1;
     asc->segments          =3D aspeed_2400_spi1_segments;
     asc->flash_window_base =3D 0x30000000;
     asc->flash_window_size =3D 0x10000000;
@@ -1442,7 +1442,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass =
*klass, void *data)
     asc->r_timings         =3D R_TIMINGS;
     asc->nregs_timings     =3D 1;
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
-    asc->max_peripherals   =3D 3;
+    asc->max_cs            =3D 3;
     asc->segments          =3D aspeed_2500_fmc_segments;
     asc->segment_addr_mask =3D 0xffff0000;
     asc->resets            =3D aspeed_2500_fmc_resets;
@@ -1480,7 +1480,7 @@ static void aspeed_2500_spi1_class_init(ObjectClass=
 *klass, void *data)
     asc->r_timings         =3D R_TIMINGS;
     asc->nregs_timings     =3D 1;
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
-    asc->max_peripherals   =3D 2;
+    asc->max_cs            =3D 2;
     asc->segments          =3D aspeed_2500_spi1_segments;
     asc->segment_addr_mask =3D 0xffff0000;
     asc->flash_window_base =3D 0x30000000;
@@ -1515,7 +1515,7 @@ static void aspeed_2500_spi2_class_init(ObjectClass=
 *klass, void *data)
     asc->r_timings         =3D R_TIMINGS;
     asc->nregs_timings     =3D 1;
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
-    asc->max_peripherals   =3D 2;
+    asc->max_cs            =3D 2;
     asc->segments          =3D aspeed_2500_spi2_segments;
     asc->segment_addr_mask =3D 0xffff0000;
     asc->flash_window_base =3D 0x38000000;
@@ -1597,7 +1597,7 @@ static void aspeed_2600_fmc_class_init(ObjectClass =
*klass, void *data)
     asc->r_timings         =3D R_TIMINGS;
     asc->nregs_timings     =3D 1;
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
-    asc->max_peripherals   =3D 3;
+    asc->max_cs            =3D 3;
     asc->segments          =3D aspeed_2600_fmc_segments;
     asc->segment_addr_mask =3D 0x0ff00ff0;
     asc->resets            =3D aspeed_2600_fmc_resets;
@@ -1636,7 +1636,7 @@ static void aspeed_2600_spi1_class_init(ObjectClass=
 *klass, void *data)
     asc->r_timings         =3D R_TIMINGS;
     asc->nregs_timings     =3D 2;
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
-    asc->max_peripherals   =3D 2;
+    asc->max_cs            =3D 2;
     asc->segments          =3D aspeed_2600_spi1_segments;
     asc->segment_addr_mask =3D 0x0ff00ff0;
     asc->flash_window_base =3D 0x30000000;
@@ -1675,7 +1675,7 @@ static void aspeed_2600_spi2_class_init(ObjectClass=
 *klass, void *data)
     asc->r_timings         =3D R_TIMINGS;
     asc->nregs_timings     =3D 3;
     asc->conf_enable_w0    =3D CONF_ENABLE_W0;
-    asc->max_peripherals   =3D 3;
+    asc->max_cs            =3D 3;
     asc->segments          =3D aspeed_2600_spi2_segments;
     asc->segment_addr_mask =3D 0x0ff00ff0;
     asc->flash_window_base =3D 0x50000000;
--=20
2.34.1


