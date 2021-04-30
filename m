Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D4136FF73
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:25:54 +0200 (CEST)
Received: from localhost ([::1]:47766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWtl-0004xI-CD
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW7-0000IK-HR; Fri, 30 Apr 2021 13:01:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW5-0002W4-Nw; Fri, 30 Apr 2021 13:01:27 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UGYdj1153391; Fri, 30 Apr 2021 13:01:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388n7ph52h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 13:01:20 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13UGYgMg153645;
 Fri, 30 Apr 2021 13:01:19 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388n7ph51k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 13:01:19 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UGxOvD008617;
 Fri, 30 Apr 2021 17:01:17 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 384akhbam9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 17:01:17 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13UH0o9m36962744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 17:00:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0713DAE053;
 Fri, 30 Apr 2021 17:01:15 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFE06AE045;
 Fri, 30 Apr 2021 17:01:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 17:01:14 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1A70422016C;
 Fri, 30 Apr 2021 19:01:14 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 18/18] aspeed: Add support for the quanta-q7l1-bmc board
Date: Fri, 30 Apr 2021 19:01:08 +0200
Message-Id: <20210430170108.10261-9-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430170108.10261-1-clg@kaod.org>
References: <20210430170108.10261-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 59_KVUyhTS8442IL9SHRUn1xrIXz7_eb
X-Proofpoint-ORIG-GUID: Ii4kpl8kcadG-8fH6qsjOjgRDcXAjx3M
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1034
 suspectscore=0 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300109
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
Cc: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Patrick Venture <venture@google.com>

The Quanta-Q71l BMC board is a board supported by OpenBMC.

Tested: Booted quanta-q71l firmware.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210416162426.3217033-1-venture@google.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 490a8a202239..a10909fa8395 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -138,6 +138,19 @@ struct AspeedMachineState {
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
=20
+/* Quanta-Q71l hardware value */
+#define QUANTA_Q71L_BMC_HW_STRAP1 (                                     =
\
+        SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_128MB) |               =
\
+        SCU_AST2400_HW_STRAP_DRAM_CONFIG(2/* DDR3 with CL=3D6, CWL=3D5 *=
/) | \
+        SCU_AST2400_HW_STRAP_ACPI_DIS |                                 =
\
+        SCU_AST2400_HW_STRAP_SET_CLK_SOURCE(AST2400_CLK_24M_IN) |       =
\
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   =
\
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_PASS_THROUGH) |          =
\
+        SCU_AST2400_HW_STRAP_SET_CPU_AHB_RATIO(AST2400_CPU_AHB_RATIO_2_1=
) | \
+        SCU_HW_STRAP_SPI_WIDTH |                                        =
\
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_8M_DRAM) |                        =
\
+        SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
+
 /* AST2600 evb hardware value */
 #define AST2600_EVB_HW_STRAP1 0x000000C0
 #define AST2600_EVB_HW_STRAP2 0x00000003
@@ -437,6 +450,34 @@ static void palmetto_bmc_i2c_init(AspeedMachineState=
 *bmc)
     object_property_set_int(OBJECT(dev), "temperature3", 110000, &error_=
abort);
 }
=20
+static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+
+    /*
+     * The quanta-q71l platform expects tmp75s which are compatible with
+     * tmp105s.
+     */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", =
0x4c);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", =
0x4e);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", =
0x4f);
+
+    /* TODO: i2c-1: Add baseboard FRU eeprom@54 24c64 */
+    /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */
+    /* TODO: Add Memory Riser i2c mux and eeproms. */
+
+    /* TODO: i2c-2: pca9546@74 */
+    /* TODO: i2c-2: pca9548@77 */
+    /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */
+    /* TODO: i2c-7: Add pca9546@70 */
+    /*        - i2c@0: pmbus@59 */
+    /*        - i2c@1: pmbus@58 */
+    /*        - i2c@2: pmbus@58 */
+    /*        - i2c@3: pmbus@59 */
+    /* TODO: i2c-7: Add PDB FRU eeprom@52 */
+    /* TODO: i2c-8: Add BMC FRU eeprom@50 */
+}
+
 static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
@@ -784,6 +825,23 @@ static void aspeed_machine_palmetto_class_init(Objec=
tClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
=20
+static void aspeed_machine_quanta_q71l_class_init(ObjectClass *oc, void =
*data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "Quanta-Q71l BMC (ARM926EJ-S)";
+    amc->soc_name  =3D "ast2400-a1";
+    amc->hw_strap1 =3D QUANTA_Q71L_BMC_HW_STRAP1;
+    amc->fmc_model =3D "n25q256a";
+    amc->spi_model =3D "mx25l25635e";
+    amc->num_cs    =3D 1;
+    amc->i2c_init  =3D quanta_q71l_bmc_i2c_init;
+    mc->default_ram_size       =3D 128 * MiB;
+    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
+        aspeed_soc_num_cpus(amc->soc_name);
+}
+
 static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
                                                         void *data)
 {
@@ -1005,6 +1063,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("g220a-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_g220a_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("quanta-q71l-bmc"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_quanta_q71l_class_init,
     }, {
         .name          =3D MACHINE_TYPE_NAME("rainier-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
--=20
2.26.3


