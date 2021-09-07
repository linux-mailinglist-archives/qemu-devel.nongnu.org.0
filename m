Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E274023B9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:02:04 +0200 (CEST)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNV7L-000459-4n
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3y-0001ND-Kz
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:58:34 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3u-0001Kw-1G
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:58:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 07D7E20C15;
 Tue,  7 Sep 2021 06:58:26 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 08:58:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002f07278b0-683a-48fa-8166-f4817a6263b1,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 05/10] aspeed/smc: Remove the 'flash' attribute from
 AspeedSMCFlash
Date: Tue, 7 Sep 2021 08:58:17 +0200
Message-ID: <20210907065822.1152443-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907065822.1152443-1-clg@kaod.org>
References: <20210907065822.1152443-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 14b2fe2f-6220-43ee-98ab-8bf640f8244d
X-Ovh-Tracer-Id: 977562596443065193
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no use for it.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  1 -
 hw/arm/aspeed.c             | 11 +++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 0ea536a44c3a..f32f66f9a838 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -37,7 +37,6 @@ typedef struct AspeedSMCFlash {
     uint32_t size;
 
     MemoryRegion mmio;
-    DeviceState *flash;
 } AspeedSMCFlash;
 
 #define TYPE_ASPEED_SMC "aspeed.smc"
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 95ce4b1670ac..64c3a7fb66db 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -274,18 +274,17 @@ static void aspeed_board_init_flashes(AspeedSMCState *s,
     int i ;
 
     for (i = 0; i < s->num_cs; ++i) {
-        AspeedSMCFlash *fl = &s->flashes[i];
         DriveInfo *dinfo = drive_get_next(IF_MTD);
         qemu_irq cs_line;
+        DeviceState *dev;
 
-        fl->flash = qdev_new(flashtype);
+        dev = qdev_new(flashtype);
         if (dinfo) {
-            qdev_prop_set_drive(fl->flash, "drive",
-                                blk_by_legacy_dinfo(dinfo));
+            qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
         }
-        qdev_realize_and_unref(fl->flash, BUS(s->spi), &error_fatal);
+        qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
 
-        cs_line = qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
+        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
         sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
     }
 }
-- 
2.31.1


