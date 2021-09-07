Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F14023C9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:05:03 +0200 (CEST)
Received: from localhost ([::1]:37588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVAE-0001cy-Jq
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3z-0001Oq-Mk
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:58:35 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:36859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3v-0001Kt-7F
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:58:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 12EC720E80;
 Tue,  7 Sep 2021 06:58:27 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 08:58:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0027624aabf-cac6-4718-9284-5c9d184aabc5,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 06/10] aspeed/smc: Remove the 'size' attribute from
 AspeedSMCFlash
Date: Tue, 7 Sep 2021 08:58:18 +0200
Message-ID: <20210907065822.1152443-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907065822.1152443-1-clg@kaod.org>
References: <20210907065822.1152443-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8204e4eb-9157-45f7-9fc3-627eb4762986
X-Ovh-Tracer-Id: 977844071736707945
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
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

It's only useful to compute the initial size of the boot_rom region.
Use memory_region_size() instead.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 1 -
 hw/arm/aspeed.c             | 7 ++++---
 hw/ssi/aspeed_smc.c         | 5 ++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index f32f66f9a838..097bb6aaf5f8 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -34,7 +34,6 @@ typedef struct AspeedSMCFlash {
     struct AspeedSMCState *controller;
 
     uint8_t id;
-    uint32_t size;
 
     MemoryRegion mmio;
 } AspeedSMCFlash;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 64c3a7fb66db..ebe11a2e5245 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -376,6 +376,7 @@ static void aspeed_machine_init(MachineState *machine)
     if (drive0) {
         AspeedSMCFlash *fl = &bmc->soc.fmc.flashes[0];
         MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
+        uint64_t size = memory_region_size(&fl->mmio);
 
         /*
          * create a ROM region using the default mapping window size of
@@ -385,15 +386,15 @@ static void aspeed_machine_init(MachineState *machine)
          */
         if (ASPEED_MACHINE(machine)->mmio_exec) {
             memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
-                                     &fl->mmio, 0, fl->size);
+                                     &fl->mmio, 0, size);
             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
                                         boot_rom);
         } else {
             memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
-                                   fl->size, &error_abort);
+                                   size, &error_abort);
             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
                                         boot_rom);
-            write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
+            write_boot_rom(drive0, FIRMWARE_ADDR, size, &error_abort);
         }
     }
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index ae14c384b60c..6d0984cc1d17 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1186,11 +1186,10 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
         fl->id = i;
         fl->controller = s;
-        fl->size = asc->segments[i].size;
         memory_region_init_io(&fl->mmio, OBJECT(s), &aspeed_smc_flash_ops,
-                              fl, name, fl->size);
+                              fl, name, asc->segments[i].size);
         memory_region_add_subregion(&s->mmio_flash, offset, &fl->mmio);
-        offset += fl->size;
+        offset += asc->segments[i].size;
     }
 
     /* DMA support */
-- 
2.31.1


