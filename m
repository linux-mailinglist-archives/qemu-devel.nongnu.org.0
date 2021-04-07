Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE43357311
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:23:48 +0200 (CEST)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBu7-0006IF-8j
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnj-0007a5-Dn; Wed, 07 Apr 2021 13:17:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52142
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnf-0006nV-Mb; Wed, 07 Apr 2021 13:17:11 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H8oZ2145520; Wed, 7 Apr 2021 13:16:57 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37rw07p5xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:57 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HCBwA023097;
 Wed, 7 Apr 2021 17:16:55 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 37rvc1gfyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:55 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGrbi42664200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 164A74C044;
 Wed,  7 Apr 2021 17:16:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD4994C04E;
 Wed,  7 Apr 2021 17:16:52 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:52 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 308B7220190;
 Wed,  7 Apr 2021 19:16:52 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 17/24] aspeed: Remove swift-bmc machine
Date: Wed,  7 Apr 2021 19:16:30 +0200
Message-Id: <20210407171637.777743-18-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: M9oQgShtZh8qby_NctxNli5o97ud9wvN
X-Proofpoint-GUID: M9oQgShtZh8qby_NctxNli5o97ud9wvN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 clxscore=1034 impostorscore=0 mlxlogscore=860
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070116
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SWIFT machine never came out of the lab and we already have enough
AST2500 based OpenPower machines. Remove it.

Cc: Adriana Kobylak <anoo@us.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 61 -------------------------------------------------
 1 file changed, 61 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 1cf5a15c8098..97dcca74feb4 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -110,17 +110,6 @@ struct AspeedMachineState {
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       =
\
         SCU_AST2500_HW_STRAP_RESERVED1)
=20
-/* Swift hardware value: 0xF11AD206 */
-#define SWIFT_BMC_HW_STRAP1 (                                           =
\
-        AST2500_HW_STRAP1_DEFAULTS |                                    =
\
-        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     =
\
-        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        =
\
-        SCU_AST2500_HW_STRAP_UART_DEBUG |                               =
\
-        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              =
\
-        SCU_H_PLL_BYPASS_EN |                                           =
\
-        SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
-        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
-
 #define G220A_BMC_HW_STRAP1 (                                      \
         SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     =
\
         SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        =
\
@@ -465,35 +454,6 @@ static void romulus_bmc_i2c_init(AspeedMachineState =
*bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338",=
 0x32);
 }
=20
-static void swift_bmc_i2c_init(AspeedMachineState *bmc)
-{
-    AspeedSoCState *soc =3D &bmc->soc;
-
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552",=
 0x60);
-
-    /* The swift board expects a TMP275 but a TMP105 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "tmp105", =
0x48);
-    /* The swift board expects a pca9551 but a pca9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x60);
-
-    /* The swift board expects an Epson RX8900 RTC but a ds1338 is compa=
tible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "ds1338", =
0x32);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552",=
 0x60);
-
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", =
0x4c);
-    /* The swift board expects a pca9539 but a pca9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "pca9552",=
 0x74);
-
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423",=
 0x4c);
-    /* The swift board expects a pca9539 but a pca9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "pca9552"=
,
-                     0x74);
-
-    /* The swift board expects a TMP275 but a TMP105 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105",=
 0x48);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105",=
 0x4a);
-}
-
 static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
@@ -796,23 +756,6 @@ static void aspeed_machine_sonorapass_class_init(Obj=
ectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
=20
-static void aspeed_machine_swift_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc =3D MACHINE_CLASS(oc);
-    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
-
-    mc->desc       =3D "OpenPOWER Swift BMC (ARM1176)";
-    amc->soc_name  =3D "ast2500-a1";
-    amc->hw_strap1 =3D SWIFT_BMC_HW_STRAP1;
-    amc->fmc_model =3D "mx66l1g45g";
-    amc->spi_model =3D "mx66l1g45g";
-    amc->num_cs    =3D 2;
-    amc->i2c_init  =3D swift_bmc_i2c_init;
-    mc->default_ram_size       =3D 512 * MiB;
-    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
-        aspeed_soc_num_cpus(amc->soc_name);
-};
-
 static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void =
*data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
@@ -903,10 +846,6 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("romulus-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_romulus_class_init,
-    }, {
-        .name          =3D MACHINE_TYPE_NAME("swift-bmc"),
-        .parent        =3D TYPE_ASPEED_MACHINE,
-        .class_init    =3D aspeed_machine_swift_class_init,
     }, {
         .name          =3D MACHINE_TYPE_NAME("sonorapass-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
--=20
2.26.3


