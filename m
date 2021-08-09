Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8573E46C0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:35:48 +0200 (CEST)
Received: from localhost ([::1]:57336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5RT-0007iA-DZ
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD590-0005I7-4F; Mon, 09 Aug 2021 09:16:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58y-0005Jo-2M; Mon, 09 Aug 2021 09:16:41 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DGQud146216; Mon, 9 Aug 2021 09:16:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab1j86667-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:16:26 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 179D45P4055165;
 Mon, 9 Aug 2021 09:16:08 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab1j86649-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:16:08 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179CwSSj014647;
 Mon, 9 Aug 2021 13:16:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3a9ht8uk5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:16:05 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179DG3He55509336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:16:03 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4A8BA4069;
 Mon,  9 Aug 2021 13:16:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DE7EA406D;
 Mon,  9 Aug 2021 13:16:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:16:02 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 979B822016C;
 Mon,  9 Aug 2021 15:16:01 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 05/10] hw: aspeed_gpio: Clarify GPIO controller name
Date: Mon,  9 Aug 2021 15:15:51 +0200
Message-Id: <20210809131556.686260-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131556.686260-1-clg@kaod.org>
References: <20210809131556.686260-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wFSqpgRHZoK2KjiRsM-BeGwgkVzO94oX
X-Proofpoint-ORIG-GUID: Vh9F8byva-S0PyrWYIuw3rhcs3wuELLi
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1034 impostorscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Rashmica Gupta <rashmica.g@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

There are two GPIO controllers in the ast2600; one is 3.3V and the other
is 1.8V.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210713065854.134634-4-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/gpio/aspeed_gpio.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index dc721aec5da7..dfa6d6cb40a9 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -164,12 +164,12 @@
 #define GPIO_YZAAAB_DIRECTION      (0x1E4 >> 2)
 #define GPIO_AC_DATA_VALUE         (0x1E8 >> 2)
 #define GPIO_AC_DIRECTION          (0x1EC >> 2)
-#define GPIO_3_6V_MEM_SIZE         0x1F0
-#define GPIO_3_6V_REG_ARRAY_SIZE   (GPIO_3_6V_MEM_SIZE >> 2)
+#define GPIO_3_3V_MEM_SIZE         0x1F0
+#define GPIO_3_3V_REG_ARRAY_SIZE   (GPIO_3_3V_MEM_SIZE >> 2)
=20
 /* AST2600 only - 1.8V gpios */
 /*
- * The AST2600 two copies of the GPIO controller: the same 3.6V gpios as=
 the
+ * The AST2600 two copies of the GPIO controller: the same 3.3V gpios as=
 the
  * AST2400 (memory offsets 0x0-0x198) and a second controller with 1.8V =
gpios
  * (memory offsets 0x800-0x9D4).
  */
@@ -380,7 +380,7 @@ static uint32_t update_value_control_source(GPIOSets =
*regs, uint32_t old_value,
     return new_value;
 }
=20
-static const AspeedGPIOReg aspeed_3_6v_gpios[GPIO_3_6V_REG_ARRAY_SIZE] =3D=
 {
+static const AspeedGPIOReg aspeed_3_3v_gpios[GPIO_3_3V_REG_ARRAY_SIZE] =3D=
 {
     /* Set ABCD */
     [GPIO_ABCD_DATA_VALUE] =3D     { 0, gpio_reg_data_value },
     [GPIO_ABCD_DIRECTION] =3D      { 0, gpio_reg_direction },
@@ -800,7 +800,7 @@ static const GPIOSetProperties ast2500_set_props[] =3D=
 {
     [7] =3D {0x000000ff,  0x000000ff,  {"AC"} },
 };
=20
-static GPIOSetProperties ast2600_3_6v_set_props[] =3D {
+static GPIOSetProperties ast2600_3_3v_set_props[] =3D {
     [0] =3D {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
     [1] =3D {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
     [2] =3D {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
@@ -927,7 +927,7 @@ static void aspeed_gpio_ast2400_class_init(ObjectClas=
s *klass, void *data)
     agc->nr_gpio_pins =3D 216;
     agc->nr_gpio_sets =3D 7;
     agc->gap =3D 196;
-    agc->reg_table =3D aspeed_3_6v_gpios;
+    agc->reg_table =3D aspeed_3_3v_gpios;
 }
=20
 static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
@@ -938,17 +938,17 @@ static void aspeed_gpio_2500_class_init(ObjectClass=
 *klass, void *data)
     agc->nr_gpio_pins =3D 228;
     agc->nr_gpio_sets =3D 8;
     agc->gap =3D 220;
-    agc->reg_table =3D aspeed_3_6v_gpios;
+    agc->reg_table =3D aspeed_3_3v_gpios;
 }
=20
-static void aspeed_gpio_ast2600_3_6v_class_init(ObjectClass *klass, void=
 *data)
+static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void=
 *data)
 {
     AspeedGPIOClass *agc =3D ASPEED_GPIO_CLASS(klass);
=20
-    agc->props =3D ast2600_3_6v_set_props;
+    agc->props =3D ast2600_3_3v_set_props;
     agc->nr_gpio_pins =3D 208;
     agc->nr_gpio_sets =3D 7;
-    agc->reg_table =3D aspeed_3_6v_gpios;
+    agc->reg_table =3D aspeed_3_3v_gpios;
 }
=20
 static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void=
 *data)
@@ -984,10 +984,10 @@ static const TypeInfo aspeed_gpio_ast2500_info =3D =
{
     .instance_init  =3D aspeed_gpio_init,
 };
=20
-static const TypeInfo aspeed_gpio_ast2600_3_6v_info =3D {
+static const TypeInfo aspeed_gpio_ast2600_3_3v_info =3D {
     .name           =3D TYPE_ASPEED_GPIO "-ast2600",
     .parent         =3D TYPE_ASPEED_GPIO,
-    .class_init     =3D aspeed_gpio_ast2600_3_6v_class_init,
+    .class_init     =3D aspeed_gpio_ast2600_3_3v_class_init,
     .instance_init  =3D aspeed_gpio_init,
 };
=20
@@ -1003,7 +1003,7 @@ static void aspeed_gpio_register_types(void)
     type_register_static(&aspeed_gpio_info);
     type_register_static(&aspeed_gpio_ast2400_info);
     type_register_static(&aspeed_gpio_ast2500_info);
-    type_register_static(&aspeed_gpio_ast2600_3_6v_info);
+    type_register_static(&aspeed_gpio_ast2600_3_3v_info);
     type_register_static(&aspeed_gpio_ast2600_1_8v_info);
 }
=20
--=20
2.31.1


