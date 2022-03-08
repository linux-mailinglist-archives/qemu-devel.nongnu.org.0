Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD264D1732
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 13:24:31 +0100 (CET)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYtC-0003hI-9c
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 07:24:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYr1-0000Iv-7o; Tue, 08 Mar 2022 07:22:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28346
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYqz-0006F3-Eh; Tue, 08 Mar 2022 07:22:14 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228Blfcu016853; 
 Tue, 8 Mar 2022 12:22:05 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ep0scff6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:05 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228C8Bhr004875;
 Tue, 8 Mar 2022 12:22:03 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3enpk2srsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:03 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 228CM1IU42205454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 12:22:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 124295204E;
 Tue,  8 Mar 2022 12:22:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id CBF015204F;
 Tue,  8 Mar 2022 12:22:00 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.238])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 26ADE2201DC;
 Tue,  8 Mar 2022 13:22:00 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 10/11] hw/arm/aspeed: add Bletchley machine type
Date: Tue,  8 Mar 2022 13:21:48 +0100
Message-Id: <20220308122149.1602798-11-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308122149.1602798-1-clg@kaod.org>
References: <20220308122149.1602798-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I4AypEzz_FB91Nw77z4TACCXSmX0HIZY
X-Proofpoint-GUID: I4AypEzz_FB91Nw77z4TACCXSmX0HIZY
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 clxscore=1034 bulkscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=868 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203080063
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Patrick Williams <patrick@stwcx.xyz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Patrick Williams <patrick@stwcx.xyz>

Add the 'bletchley-bmc' machine type based on the kernel DTS[1] and
hardware schematics available to me.  The i2c model is as complete as
the current QEMU models support, but in some cases I substituted devices
that are close enough for present functionality.  Strap registers are
kept the same as the AST2600-EVB until I'm able to confirm correct
values with physical hardware.

This has been tested with an openbmc image built from [2] plus a kernel
patch[3] for the SPI flash module.

1. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts?id=3Da8c729e966c4e9d0=
33242d948b0e53c2a62d32e2
2. https://github.com/openbmc/openbmc/commit/b9432b980d7f63f7512ffbcc712438=
6ba896dfc6
3. https://github.com/openbmc/linux/commit/25b566b9a9d7f5d4f10c1b7304007bdb=
286eefd7

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
[ clg : increased number of FMC devices to 2 to match Linux dts ]
Message-Id: <20220305000656.1944589-2-patrick@stwcx.xyz>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 088550ed33b2..d205384d986f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -167,6 +167,11 @@ struct AspeedMachineState {
 #define FUJI_BMC_HW_STRAP1    0x00000000
 #define FUJI_BMC_HW_STRAP2    0x00000000
=20
+/* Bletchley hardware value */
+/* TODO: Leave same as EVB for now. */
+#define BLETCHLEY_BMC_HW_STRAP1 AST2600_EVB_HW_STRAP1
+#define BLETCHLEY_BMC_HW_STRAP2 AST2600_EVB_HW_STRAP2
+
 /*
  * The max ram region is for firmwares that scan the address space
  * with load/store to guess how much RAM the SoC has.
@@ -897,6 +902,54 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     }
 }
=20
+#define TYPE_TMP421 "tmp421"
+
+static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+    I2CBus *i2c[13] =3D {};
+    for (int i =3D 0; i < 13; i++) {
+        if ((i =3D=3D 8) || (i =3D=3D 11)) {
+            continue;
+        }
+        i2c[i] =3D aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+
+    /* Bus 0 - 5 all have the same config. */
+    for (int i =3D 0; i < 6; i++) {
+        /* Missing model: ti,ina230 @ 0x45 */
+        /* Missing model: mps,mp5023 @ 0x40 */
+        i2c_slave_create_simple(i2c[i], TYPE_TMP421, 0x4f);
+        /* Missing model: nxp,pca9539 @ 0x76, but PCA9552 works enough */
+        i2c_slave_create_simple(i2c[i], TYPE_PCA9552, 0x76);
+        i2c_slave_create_simple(i2c[i], TYPE_PCA9552, 0x67);
+        /* Missing model: fsc,fusb302 @ 0x22 */
+    }
+
+    /* Bus 6 */
+    at24c_eeprom_init(i2c[6], 0x56, 65536);
+    /* Missing model: nxp,pcf85263 @ 0x51 , but ds1338 works enough */
+    i2c_slave_create_simple(i2c[6], "ds1338", 0x51);
+
+
+    /* Bus 7 */
+    at24c_eeprom_init(i2c[7], 0x54, 65536);
+
+    /* Bus 9 */
+    i2c_slave_create_simple(i2c[9], TYPE_TMP421, 0x4f);
+
+    /* Bus 10 */
+    i2c_slave_create_simple(i2c[10], TYPE_TMP421, 0x4f);
+    /* Missing model: ti,hdc1080 @ 0x40 */
+    i2c_slave_create_simple(i2c[10], TYPE_PCA9552, 0x67);
+
+    /* Bus 12 */
+    /* Missing model: adi,adm1278 @ 0x11 */
+    i2c_slave_create_simple(i2c[12], TYPE_TMP421, 0x4c);
+    i2c_slave_create_simple(i2c[12], TYPE_TMP421, 0x4d);
+    i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -1220,6 +1273,25 @@ static void aspeed_machine_fuji_class_init(ObjectCla=
ss *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
=20
+static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *dat=
a)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "Facebook Bletchley BMC (Cortex-A7)";
+    amc->soc_name  =3D "ast2600-a3";
+    amc->hw_strap1 =3D BLETCHLEY_BMC_HW_STRAP1;
+    amc->hw_strap2 =3D BLETCHLEY_BMC_HW_STRAP2;
+    amc->fmc_model =3D "w25q01jvq";
+    amc->spi_model =3D NULL;
+    amc->num_cs    =3D 2;
+    amc->macs_mask =3D ASPEED_MAC2_ON;
+    amc->i2c_init  =3D bletchley_bmc_i2c_init;
+    mc->default_ram_size =3D 512 * MiB;
+    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
+        aspeed_soc_num_cpus(amc->soc_name);
+}
+
 static const TypeInfo aspeed_machine_types[] =3D {
     {
         .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1273,6 +1345,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("fuji-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_fuji_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("bletchley-bmc"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_bletchley_class_init,
     }, {
         .name          =3D TYPE_ASPEED_MACHINE,
         .parent        =3D TYPE_MACHINE,
--=20
2.34.1


