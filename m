Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3F526F717
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 09:34:47 +0200 (CEST)
Received: from localhost ([::1]:56556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJAur-0007Oo-SE
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 03:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kJAnd-0007rl-OV
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 03:27:17 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:38309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kJAnc-0003lf-08
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 03:27:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B2AC65C5D986;
 Fri, 18 Sep 2020 09:27:05 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 18 Sep
 2020 09:27:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0011e5b4873-ded1-4af5-ad61-f03b036f5d29,
 ECEC63DD04C3092DE3B5C7147C06DCFEA73B34A9) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: [PULL 1/3] hw/arm/aspeed: Map the UART5 device unconditionally
Date: Fri, 18 Sep 2020 09:27:01 +0200
Message-ID: <20200918072703.331138-2-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200918072703.331138-1-clg@kaod.org>
References: <20200918072703.331138-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: daee5ac3-acaa-429c-878c-b00fe81f28ac
X-Ovh-Tracer-Id: 7010134297991351264
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrtdehgdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 03:27:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The UART5 is present on the machine regardless there is a
character device connected to it. Map it unconditionally.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20200905212415.760452-1-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 8 +++-----
 hw/arm/aspeed_soc.c     | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 9d95e4214357..1450bde7cf26 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -325,11 +325,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* UART - attach an 8250 to the IO space as our UART5 */
-    if (serial_hd(0)) {
-        qemu_irq uart5 = aspeed_soc_get_irq(s, ASPEED_DEV_UART5);
-        serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                       uart5, 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
-    }
+    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
+                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
+                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 35be126db6fd..7eefd54ac07a 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -283,11 +283,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* UART - attach an 8250 to the IO space as our UART5 */
-    if (serial_hd(0)) {
-        qemu_irq uart5 = aspeed_soc_get_irq(s, ASPEED_DEV_UART5);
-        serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                       uart5, 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
-    }
+    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
+                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
-- 
2.25.4


