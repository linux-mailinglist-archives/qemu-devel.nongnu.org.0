Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439BF371140
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 07:31:24 +0200 (CEST)
Received: from localhost ([::1]:49530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldRAx-00024R-8a
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 01:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6K-0004qR-SA; Mon, 03 May 2021 01:26:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6G-0006Av-KO; Mon, 03 May 2021 01:26:36 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1435FJR6068738; Mon, 3 May 2021 01:26:23 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38aav4g572-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:22 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1435HNH1022070;
 Mon, 3 May 2021 05:26:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 388xm8rh6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 05:26:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1435QIL912779850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 05:26:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40D1142042;
 Mon,  3 May 2021 05:26:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AB3042041;
 Mon,  3 May 2021 05:26:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 May 2021 05:26:17 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6745A22004E;
 Mon,  3 May 2021 07:26:17 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 16/18] aspeed: Add support for the rainier-bmc board
Date: Mon,  3 May 2021 07:25:58 +0200
Message-Id: <20210503052600.290483-17-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
References: <20210503052600.290483-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: t-kIXQwC8WSn4TGcSNKrxOROo1YAi3FF
X-Proofpoint-GUID: t-kIXQwC8WSn4TGcSNKrxOROo1YAi3FF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_02:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 malwarescore=0 clxscore=1034 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105030033
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Rainier BMC board is a board for the middle range POWER10 IBM systems=
.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20210407171637.777743-19-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cefa0f13527e..490a8a202239 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -146,6 +146,10 @@ struct AspeedMachineState {
 #define TACOMA_BMC_HW_STRAP1  0x00000000
 #define TACOMA_BMC_HW_STRAP2  0x00000040
=20
+/* Rainier hardware value: (QEMU prototype) */
+#define RAINIER_BMC_HW_STRAP1 0x00000000
+#define RAINIER_BMC_HW_STRAP2 0x00000000
+
 /*
  * The max ram region is for firmwares that scan the address space
  * with load/store to guess how much RAM the SoC has.
@@ -629,6 +633,58 @@ static void g220a_bmc_i2c_init(AspeedMachineState *b=
mc)
                           eeprom_buf);
 }
=20
+static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+
+    /* The rainier expects a TMP275 but a TMP105 is compatible */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP10=
5,
+                     0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP10=
5,
+                     0x49);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP10=
5,
+                     0x4a);
+
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP10=
5,
+                     0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP10=
5,
+                     0x49);
+
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP10=
5,
+                     0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP10=
5,
+                     0x4a);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP10=
5,
+                     0x4b);
+
+    /* Bus 7: TODO dps310@76 */
+    /* Bus 7: TODO max31785@52 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x61);
+    /* Bus 7: TODO si7021-a20@20 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP10=
5,
+                     0x48);
+
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP10=
5,
+                     0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP10=
5,
+                     0x4a);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552",=
 0x61);
+    /* Bus 8: ucd90320@11 */
+    /* Bus 8: ucd90320@b */
+    /* Bus 8: ucd90320@c */
+
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", =
0x4c);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", =
0x4d);
+
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423",=
 0x4c);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423",=
 0x4d);
+
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP1=
05,
+                     0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP1=
05,
+                     0x49);
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -889,6 +945,25 @@ static void aspeed_machine_g220a_class_init(ObjectCl=
ass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
=20
+static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *dat=
a)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "IBM Rainier BMC (Cortex A7)";
+    amc->soc_name  =3D "ast2600-a1";
+    amc->hw_strap1 =3D RAINIER_BMC_HW_STRAP1;
+    amc->hw_strap2 =3D RAINIER_BMC_HW_STRAP2;
+    amc->fmc_model =3D "mx66l1g45g";
+    amc->spi_model =3D "mx66l1g45g";
+    amc->num_cs    =3D 2;
+    amc->macs_mask  =3D ASPEED_MAC2_ON | ASPEED_MAC3_ON;
+    amc->i2c_init  =3D rainier_bmc_i2c_init;
+    mc->default_ram_size =3D 1 * GiB;
+    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static const TypeInfo aspeed_machine_types[] =3D {
     {
         .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -930,6 +1005,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("g220a-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_g220a_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("rainier-bmc"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_rainier_class_init,
     }, {
         .name          =3D TYPE_ASPEED_MACHINE,
         .parent        =3D TYPE_MACHINE,
--=20
2.26.3


