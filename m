Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0533E46B6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:34:32 +0200 (CEST)
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5QF-0005EH-Ui
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58d-0004r3-32; Mon, 09 Aug 2021 09:16:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58X-0004wA-IK; Mon, 09 Aug 2021 09:16:17 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179D2oUY113729; Mon, 9 Aug 2021 09:16:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa7fc00gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:16:07 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 179D3ARU115210;
 Mon, 9 Aug 2021 09:16:06 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa7fc00fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:16:06 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179CwWbJ022854;
 Mon, 9 Aug 2021 13:16:05 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3a9ht8kk4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:16:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 179DCtoO61735372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:12:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2646A52059;
 Mon,  9 Aug 2021 13:16:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id A9FF752050;
 Mon,  9 Aug 2021 13:16:01 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BDAAF220032;
 Mon,  9 Aug 2021 15:16:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 04/10] hw: aspeed_gpio: Simplify 1.8V defines
Date: Mon,  9 Aug 2021 15:15:50 +0200
Message-Id: <20210809131556.686260-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131556.686260-1-clg@kaod.org>
References: <20210809131556.686260-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: t7yWWuidxE6Y1UJWhJ7ZeE642Ru9ajgJ
X-Proofpoint-GUID: Dewkz1IFAfxbTttHXX_Ff7Y4IaGcn8av
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=899 clxscore=1034 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090099
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Rashmica Gupta <rashmica.g@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

There's no need to define the registers relative to the 0x800 offset
where the controller is mapped, as the device is instantiated as it's
own model at the correct memory address.

Simplify the defines and remove the offset to save future confusion.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20210713065854.134634-3-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/gpio/aspeed_gpio.c | 73 +++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index b3dec4448009..dc721aec5da7 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -169,44 +169,43 @@
=20
 /* AST2600 only - 1.8V gpios */
 /*
- * The AST2600 has same 3.6V gpios as the AST2400 (memory offsets 0x0-0x=
198)
- * and additional 1.8V gpios (memory offsets 0x800-0x9D4).
+ * The AST2600 two copies of the GPIO controller: the same 3.6V gpios as=
 the
+ * AST2400 (memory offsets 0x0-0x198) and a second controller with 1.8V =
gpios
+ * (memory offsets 0x800-0x9D4).
  */
-#define GPIO_1_8V_REG_OFFSET          0x800
-#define GPIO_1_8V_ABCD_DATA_VALUE     ((0x800 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_DIRECTION      ((0x804 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_INT_ENABLE     ((0x808 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_INT_SENS_0     ((0x80C - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_INT_SENS_1     ((0x810 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_INT_SENS_2     ((0x814 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_INT_STATUS     ((0x818 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_RESET_TOLERANT ((0x81C - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_DATA_VALUE        ((0x820 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_DIRECTION         ((0x824 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_INT_ENABLE        ((0x828 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_INT_SENS_0        ((0x82C - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_INT_SENS_1        ((0x830 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_INT_SENS_2        ((0x834 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_INT_STATUS        ((0x838 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_RESET_TOLERANT    ((0x83C - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_DEBOUNCE_1     ((0x840 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_DEBOUNCE_2     ((0x844 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_DEBOUNCE_1        ((0x848 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_DEBOUNCE_2        ((0x84C - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_DEBOUNCE_TIME_1     ((0x850 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_DEBOUNCE_TIME_2     ((0x854 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_DEBOUNCE_TIME_3     ((0x858 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_COMMAND_SRC_0  ((0x860 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_COMMAND_SRC_1  ((0x864 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_COMMAND_SRC_0     ((0x868 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_COMMAND_SRC_1     ((0x86C - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_DATA_READ      ((0x8C0 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_DATA_READ         ((0x8C4 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_ABCD_INPUT_MASK     ((0x9D0 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_E_INPUT_MASK        ((0x9D4 - GPIO_1_8V_REG_OFFSET) >>=
 2)
-#define GPIO_1_8V_MEM_SIZE            0x9D8
-#define GPIO_1_8V_REG_ARRAY_SIZE      ((GPIO_1_8V_MEM_SIZE - \
-                                      GPIO_1_8V_REG_OFFSET) >> 2)
+#define GPIO_1_8V_ABCD_DATA_VALUE     (0x000 >> 2)
+#define GPIO_1_8V_ABCD_DIRECTION      (0x004 >> 2)
+#define GPIO_1_8V_ABCD_INT_ENABLE     (0x008 >> 2)
+#define GPIO_1_8V_ABCD_INT_SENS_0     (0x00C >> 2)
+#define GPIO_1_8V_ABCD_INT_SENS_1     (0x010 >> 2)
+#define GPIO_1_8V_ABCD_INT_SENS_2     (0x014 >> 2)
+#define GPIO_1_8V_ABCD_INT_STATUS     (0x018 >> 2)
+#define GPIO_1_8V_ABCD_RESET_TOLERANT (0x01C >> 2)
+#define GPIO_1_8V_E_DATA_VALUE        (0x020 >> 2)
+#define GPIO_1_8V_E_DIRECTION         (0x024 >> 2)
+#define GPIO_1_8V_E_INT_ENABLE        (0x028 >> 2)
+#define GPIO_1_8V_E_INT_SENS_0        (0x02C >> 2)
+#define GPIO_1_8V_E_INT_SENS_1        (0x030 >> 2)
+#define GPIO_1_8V_E_INT_SENS_2        (0x034 >> 2)
+#define GPIO_1_8V_E_INT_STATUS        (0x038 >> 2)
+#define GPIO_1_8V_E_RESET_TOLERANT    (0x03C >> 2)
+#define GPIO_1_8V_ABCD_DEBOUNCE_1     (0x040 >> 2)
+#define GPIO_1_8V_ABCD_DEBOUNCE_2     (0x044 >> 2)
+#define GPIO_1_8V_E_DEBOUNCE_1        (0x048 >> 2)
+#define GPIO_1_8V_E_DEBOUNCE_2        (0x04C >> 2)
+#define GPIO_1_8V_DEBOUNCE_TIME_1     (0x050 >> 2)
+#define GPIO_1_8V_DEBOUNCE_TIME_2     (0x054 >> 2)
+#define GPIO_1_8V_DEBOUNCE_TIME_3     (0x058 >> 2)
+#define GPIO_1_8V_ABCD_COMMAND_SRC_0  (0x060 >> 2)
+#define GPIO_1_8V_ABCD_COMMAND_SRC_1  (0x064 >> 2)
+#define GPIO_1_8V_E_COMMAND_SRC_0     (0x068 >> 2)
+#define GPIO_1_8V_E_COMMAND_SRC_1     (0x06C >> 2)
+#define GPIO_1_8V_ABCD_DATA_READ      (0x0C0 >> 2)
+#define GPIO_1_8V_E_DATA_READ         (0x0C4 >> 2)
+#define GPIO_1_8V_ABCD_INPUT_MASK     (0x1D0 >> 2)
+#define GPIO_1_8V_E_INPUT_MASK        (0x1D4 >> 2)
+#define GPIO_1_8V_MEM_SIZE            0x1D8
+#define GPIO_1_8V_REG_ARRAY_SIZE      (GPIO_1_8V_MEM_SIZE >> 2)
=20
 static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high, int g=
pio)
 {
--=20
2.31.1


