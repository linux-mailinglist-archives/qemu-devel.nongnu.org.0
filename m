Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3664099B4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:43:59 +0200 (CEST)
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPp3n-0001X3-1P
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mPoaB-0003w5-Hl
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:13:23 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:35943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mPoa5-0000hM-MK
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:13:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 67E8513ECD1;
 Mon, 13 Sep 2021 16:13:12 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 18:13:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0019a87fcd7-b6ab-4302-b435-18ae5056f957,
 7CA125ACC991A0BE3D2311CBE60F5A293341D68C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/14] hw: aspeed_gpio: Simplify 1.8V defines
Date: Mon, 13 Sep 2021 18:12:55 +0200
Message-ID: <20210913161304.3805652-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913161304.3805652-1-clg@kaod.org>
References: <20210913161304.3805652-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c65ce67e-af97-460d-9669-e60ef6ac5de1
X-Ovh-Tracer-Id: 8689695484695120748
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210713065854.134634-3-joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/gpio/aspeed_gpio.c | 73 +++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index b3dec4448009..dc721aec5da7 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -169,44 +169,43 @@
 
 /* AST2600 only - 1.8V gpios */
 /*
- * The AST2600 has same 3.6V gpios as the AST2400 (memory offsets 0x0-0x198)
- * and additional 1.8V gpios (memory offsets 0x800-0x9D4).
+ * The AST2600 two copies of the GPIO controller: the same 3.6V gpios as the
+ * AST2400 (memory offsets 0x0-0x198) and a second controller with 1.8V gpios
+ * (memory offsets 0x800-0x9D4).
  */
-#define GPIO_1_8V_REG_OFFSET          0x800
-#define GPIO_1_8V_ABCD_DATA_VALUE     ((0x800 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_DIRECTION      ((0x804 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INT_ENABLE     ((0x808 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INT_SENS_0     ((0x80C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INT_SENS_1     ((0x810 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INT_SENS_2     ((0x814 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INT_STATUS     ((0x818 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_RESET_TOLERANT ((0x81C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_DATA_VALUE        ((0x820 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_DIRECTION         ((0x824 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INT_ENABLE        ((0x828 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INT_SENS_0        ((0x82C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INT_SENS_1        ((0x830 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INT_SENS_2        ((0x834 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INT_STATUS        ((0x838 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_RESET_TOLERANT    ((0x83C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_DEBOUNCE_1     ((0x840 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_DEBOUNCE_2     ((0x844 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_DEBOUNCE_1        ((0x848 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_DEBOUNCE_2        ((0x84C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_DEBOUNCE_TIME_1     ((0x850 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_DEBOUNCE_TIME_2     ((0x854 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_DEBOUNCE_TIME_3     ((0x858 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_COMMAND_SRC_0  ((0x860 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_COMMAND_SRC_1  ((0x864 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_COMMAND_SRC_0     ((0x868 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_COMMAND_SRC_1     ((0x86C - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_DATA_READ      ((0x8C0 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_DATA_READ         ((0x8C4 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_ABCD_INPUT_MASK     ((0x9D0 - GPIO_1_8V_REG_OFFSET) >> 2)
-#define GPIO_1_8V_E_INPUT_MASK        ((0x9D4 - GPIO_1_8V_REG_OFFSET) >> 2)
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
 
 static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high, int gpio)
 {
-- 
2.31.1


