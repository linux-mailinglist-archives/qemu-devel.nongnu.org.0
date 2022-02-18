Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F04BB413
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 09:22:53 +0100 (CET)
Received: from localhost ([::1]:40438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKyXU-0001Y7-FB
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 03:22:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTO-00074s-BH; Fri, 18 Feb 2022 03:18:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTM-0000Yf-E8; Fri, 18 Feb 2022 03:18:38 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I7ffXw011705; 
 Fri, 18 Feb 2022 08:18:22 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea79nrqbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:22 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21I8DtUx012513;
 Fri, 18 Feb 2022 08:18:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64harcjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:20 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21I8IIsW46465504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 08:18:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 671C75205A;
 Fri, 18 Feb 2022 08:18:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 2423F52051;
 Fri, 18 Feb 2022 08:18:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 728802201E5;
 Fri, 18 Feb 2022 09:18:17 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] arm: Remove swift-bmc machine
Date: Fri, 18 Feb 2022 09:18:09 +0100
Message-Id: <20220218081815.641169-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218081815.641169-1-clg@kaod.org>
References: <20220218081815.641169-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fZg4uBdm3OHKChq_plCYW7fT2tTnifkL
X-Proofpoint-ORIG-GUID: fZg4uBdm3OHKChq_plCYW7fT2tTnifkL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_03,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1034 bulkscore=0 mlxscore=0 mlxlogscore=699 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180051
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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

It was scheduled for removal in 7.0.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220217103141.385345-1-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/about/deprecated.rst       |  7 ----
 docs/about/removed-features.rst |  5 +++
 docs/system/arm/aspeed.rst      |  1 -
 hw/arm/aspeed.c                 | 64 ---------------------------------
 4 files changed, 5 insertions(+), 72 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 26d00812ba94..85773db631c1 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -315,13 +315,6 @@ Use the more generic event ``DEVICE_UNPLUG_GUEST_ERR=
OR`` instead.
 System emulator machines
 ------------------------
=20
-Aspeed ``swift-bmc`` machine (since 6.1)
-''''''''''''''''''''''''''''''''''''''''
-
-This machine is deprecated because we have enough AST2500 based OpenPOWE=
R
-machines. It can be easily replaced by the ``witherspoon-bmc`` or the
-``romulus-bmc`` machines.
-
 PPC 405 ``taihu`` machine (since 7.0)
 '''''''''''''''''''''''''''''''''''''
=20
diff --git a/docs/about/removed-features.rst b/docs/about/removed-feature=
s.rst
index cb0575fd4975..4b831ea29176 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -588,6 +588,11 @@ The Raspberry Pi machines come in various models (A,=
 A+, B, B+). To be able
 to distinguish which model QEMU is implementing, the ``raspi2`` and ``ra=
spi3``
 machines have been renamed ``raspi2b`` and ``raspi3b``.
=20
+Aspeed ``swift-bmc`` machine (removed in 7.0)
+'''''''''''''''''''''''''''''''''''''''''''''
+
+This machine was removed because it was unused. Alternative AST2500 base=
d
+OpenPOWER machines are ``witherspoon-bmc`` and ``romulus-bmc``.
=20
 linux-user mode CPUs
 --------------------
diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index d8b102fa0ad0..60ed94f18759 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -22,7 +22,6 @@ AST2500 SoC based machines :
 - ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
 - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
 - ``sonorapass-bmc``       OCP SonoraPass BMC
-- ``swift-bmc``            OpenPOWER Swift BMC POWER9 (to be removed in =
v7.0)
 - ``fp5280g2-bmc``         Inspur FP5280G2 BMC
 - ``g220a-bmc``            Bytedance G220A BMC
=20
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d911dc904fb3..faf7a9fd6863 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -106,17 +106,6 @@ struct AspeedMachineState {
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
@@ -544,35 +533,6 @@ static void romulus_bmc_i2c_init(AspeedMachineState =
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
@@ -1102,26 +1062,6 @@ static void aspeed_machine_sonorapass_class_init(O=
bjectClass *oc, void *data)
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
-
-    mc->deprecation_reason =3D "redundant system. Please use a similar "
-        "OpenPOWER BMC, Witherspoon or Romulus.";
-};
-
 static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void =
*data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
@@ -1277,10 +1217,6 @@ static const TypeInfo aspeed_machine_types[] =3D {
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
2.34.1


