Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3545C3E46CA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:38:51 +0200 (CEST)
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5UQ-0006Wu-7x
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD591-0005LB-Dk; Mon, 09 Aug 2021 09:16:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58z-0005KW-1Z; Mon, 09 Aug 2021 09:16:43 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DGS9B013287; Mon, 9 Aug 2021 09:16:33 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aam0m42ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:16:32 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179CwivL028798;
 Mon, 9 Aug 2021 13:16:09 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3a9ht8kk8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:16:09 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179DG6Ix49611112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:16:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 738D8A405C;
 Mon,  9 Aug 2021 13:16:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22F89A4067;
 Mon,  9 Aug 2021 13:16:06 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:16:06 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4B3FD220032;
 Mon,  9 Aug 2021 15:16:05 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 10/10] arm/aspeed: Add DPS310 to Witherspoon and Rainier
Date: Mon,  9 Aug 2021 15:15:56 +0200
Message-Id: <20210809131556.686260-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131556.686260-1-clg@kaod.org>
References: <20210809131556.686260-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rYiztG2Jw0Tkk3ADP18dTAHtvejpcSIm
X-Proofpoint-ORIG-GUID: rYiztG2Jw0Tkk3ADP18dTAHtvejpcSIm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 clxscore=1034 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 mlxlogscore=935 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090099
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

Witherspoon uses the DPS310 as a temperature sensor. Rainier uses it as
a temperature and humidity sensor.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210616073358.750472-3-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210629142336.750058-5-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 1ea09584d1f6..e2623c9d3a57 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -602,7 +602,6 @@ static void witherspoon_bmc_i2c_init(AspeedMachineSta=
te *bmc)
=20
     /* Bus 3: TODO bmp280@77 */
     /* Bus 3: TODO max31785@52 */
-    /* Bus 3: TODO dps310@76 */
     dev =3D DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
     qdev_prop_set_string(dev, "description", "pca1");
     i2c_slave_realize_and_unref(I2C_SLAVE(dev),
@@ -617,6 +616,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineSta=
te *bmc)
         qdev_connect_gpio_out(dev, pca1_leds[i].gpio_id,
                               qdev_get_gpio_in(DEVICE(led), 0));
     }
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "dps310", =
0x76);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", =
0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", =
0x4c);
=20
@@ -725,9 +725,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *=
bmc)
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
=20
-    /* Bus 7: TODO dps310@76 */
     /* Bus 7: TODO max31785@52 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x61);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "dps310", =
0x76);
     /* Bus 7: TODO si7021-a20@20 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP10=
5,
                      0x48);
--=20
2.31.1


