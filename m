Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044A03712AD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:51:53 +0200 (CEST)
Received: from localhost ([::1]:42544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUIy-00082V-1X
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4P-0003K2-Ue; Mon, 03 May 2021 04:36:50 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:39409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4D-0000ht-OB; Mon, 03 May 2021 04:36:49 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MUY9w-1m3uut2XWi-00QRbF; Mon, 03
 May 2021 10:36:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/23] hw/arm: Constify VMStateDescription
Date: Mon,  3 May 2021 10:36:07 +0200
Message-Id: <20210503083623.139700-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ivi013dKKJ1uMAg2aq0pbcE/RD1n0m56RxxBSSmeN0ONBpLzmPF
 96xDqQkSYxhK5+GLZ5TRUo/yvXCItZ5DZQ5y/k9RQlnzpKrWsSKqi1/4IiTNfKDPBIuboW3
 /J70Yll+aSw78QZtk4vDDbrWyw27LJ4wF1tAiXTITgKlpgAOpwb4eOE+5QtPM9KuFfYR8Y/
 yWSo11ERZaNgg/YnavTSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dkFCMOX449g=:9sEP10TszZfzAWzKvudmKp
 eORSmu0qZSSmm03B+dwV/M4K05s3ffvYlbDpl9Aspi8OmqeBx/WQsBzmJIx2Le6pqxKkm36n4
 7wubuJaF/9aai4BjwvNM26hOsCcHOxBTb5dt9xIMmhEWGNVJPPDXuK2QOCAFJuzJqL8zR8Yr2
 rW67jaHMZZ8cSDBQgmGH1hjIOluDB0B2++k5JKaNN91QJR2l0Rb9Bvk1xWi7WsrGw0b66KVlx
 Ac0GX0BL0oxrwHsBHelRNyOs7MqwC8tjzcUeF6mdthiCd6UQTaVEaMqH+OefALSPlhnkAJcMM
 1CZS2LzJb9+LDdaI0lBX9H2n24Q965bSbTNl+QHELUwc3LiavyPzfYY9CGW5ZN8xrEU8nVn4t
 E7/YRhWtIWlv8g/6ZQioAOxUQJSPw6nTam1lXkHezWRA6/jFpxSP2zBUidgsJNifQW7TD3Uz9
 zzGJOAdOc69edReHiHEupDMb0+4u1I7RUlqHPmLxOt/DIMpXLsGTZwkliWMk+16iIjzME4OEk
 Ihdn1rbIJ8/arGkxR4Bj3g=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210313171150.2122409-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/arm/highbank.c   | 2 +-
 hw/arm/pxa2xx_pic.c | 2 +-
 hw/arm/spitz.c      | 4 ++--
 hw/arm/strongarm.c  | 2 +-
 hw/arm/z2.c         | 4 ++--
 hw/dma/pxa2xx_dma.c | 4 ++--
 hw/misc/mst_fpga.c  | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index bf886268c57d..5afdd28b35c1 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -170,7 +170,7 @@ struct HighbankRegsState {
     uint32_t regs[NUM_REGS];
 };
 
-static VMStateDescription vmstate_highbank_regs = {
+static const VMStateDescription vmstate_highbank_regs = {
     .name = "highbank-regs",
     .version_id = 0,
     .minimum_version_id = 0,
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index cf6cb2a373ac..ed032fed548d 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -301,7 +301,7 @@ DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
     return dev;
 }
 
-static VMStateDescription vmstate_pxa2xx_pic_regs = {
+static const VMStateDescription vmstate_pxa2xx_pic_regs = {
     .name = "pxa2xx_pic",
     .version_id = 0,
     .minimum_version_id = 0,
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 6b3bf9828bcb..b45a929cbd9e 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -1134,7 +1134,7 @@ static bool is_version_0(void *opaque, int version_id)
     return version_id == 0;
 }
 
-static VMStateDescription vmstate_sl_nand_info = {
+static const VMStateDescription vmstate_sl_nand_info = {
     .name = "sl-nand",
     .version_id = 0,
     .minimum_version_id = 0,
@@ -1170,7 +1170,7 @@ static const TypeInfo sl_nand_info = {
     .class_init    = sl_nand_class_init,
 };
 
-static VMStateDescription vmstate_spitz_kbd = {
+static const VMStateDescription vmstate_spitz_kbd = {
     .name = "spitz-keyboard",
     .version_id = 1,
     .minimum_version_id = 0,
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index c7ca54bceaa4..e3e3ea61634f 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -207,7 +207,7 @@ static int strongarm_pic_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static VMStateDescription vmstate_strongarm_pic_regs = {
+static const VMStateDescription vmstate_strongarm_pic_regs = {
     .name = "strongarm_pic",
     .version_id = 0,
     .minimum_version_id = 0,
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 5099bd83802e..9c1e876207b3 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -162,7 +162,7 @@ static void zipit_lcd_realize(SSIPeripheral *dev, Error **errp)
     z->pos = 0;
 }
 
-static VMStateDescription vmstate_zipit_lcd_state = {
+static const VMStateDescription vmstate_zipit_lcd_state = {
     .name = "zipit-lcd",
     .version_id = 2,
     .minimum_version_id = 2,
@@ -268,7 +268,7 @@ static uint8_t aer915_recv(I2CSlave *slave)
     return retval;
 }
 
-static VMStateDescription vmstate_aer915_state = {
+static const VMStateDescription vmstate_aer915_state = {
     .name = "aer915",
     .version_id = 1,
     .minimum_version_id = 1,
diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index b3707ff3de25..fa896f7edf77 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -525,7 +525,7 @@ static bool is_version_0(void *opaque, int version_id)
     return version_id == 0;
 }
 
-static VMStateDescription vmstate_pxa2xx_dma_chan = {
+static const VMStateDescription vmstate_pxa2xx_dma_chan = {
     .name = "pxa2xx_dma_chan",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -540,7 +540,7 @@ static VMStateDescription vmstate_pxa2xx_dma_chan = {
     },
 };
 
-static VMStateDescription vmstate_pxa2xx_dma = {
+static const VMStateDescription vmstate_pxa2xx_dma = {
     .name = "pxa2xx_dma",
     .version_id = 1,
     .minimum_version_id = 0,
diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
index edfc35d5f0f9..2aaadfa96681 100644
--- a/hw/misc/mst_fpga.c
+++ b/hw/misc/mst_fpga.c
@@ -222,7 +222,7 @@ static void mst_fpga_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-static VMStateDescription vmstate_mst_fpga_regs = {
+static const VMStateDescription vmstate_mst_fpga_regs = {
     .name = "mainstone_fpga",
     .version_id = 0,
     .minimum_version_id = 0,
-- 
2.31.1


