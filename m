Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6CF421326
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:54:53 +0200 (CEST)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXQIm-0000pP-Io
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXQAv-000118-AF
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:46:45 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:36509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXQAs-0001Cq-OK
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:46:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2E12D21BD4;
 Mon,  4 Oct 2021 15:46:38 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 4 Oct
 2021 17:46:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002d00afd69-ff90-481c-b980-8ca82c3bad5c,
 32296DFA07ABF8CFA5B750E6C0B5925FEAD98EF4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 3/4] aspeed/wdt: Add an alias for the MMIO region
Date: Mon, 4 Oct 2021 17:46:34 +0200
Message-ID: <20211004154635.394258-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004154635.394258-1-clg@kaod.org>
References: <20211004154635.394258-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 69f4c91a-2a74-40d1-9b49-03a19d521310
X-Ovh-Tracer-Id: 2440106575108737897
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Initialize the region in the instance_init handler because we will
want to link this region in the FMC object before the WDT object is
realized.

Cc: Peter Delevoryas <pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/watchdog/wdt_aspeed.c         | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index f945cd6c5833..008e7d9b498c 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -29,6 +29,7 @@ struct AspeedWDTState {
 
     /*< public >*/
     MemoryRegion iomem;
+    MemoryRegion iomem_alias;
     uint32_t regs[ASPEED_WDT_REGS_MAX];
 
     AspeedSCUState *scu;
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 146ffcd71301..6426f3a77494 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -261,6 +261,16 @@ static void aspeed_wdt_timer_expired(void *dev)
 
 #define PCLK_HZ 24000000
 
+static void aspeed_wdt_instance_init(Object *obj)
+{
+    AspeedWDTState *s = ASPEED_WDT(obj);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
+                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
+    memory_region_init_alias(&s->iomem_alias, OBJECT(s),
+                             TYPE_ASPEED_WDT ".alias",
+                             &s->iomem, 0, ASPEED_WDT_REGS_MAX * 4);
+}
 static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
@@ -275,9 +285,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
      */
     s->pclk_freq = PCLK_HZ;
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
-                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
-    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_mmio(sbd, &s->iomem_alias);
 }
 
 static Property aspeed_wdt_properties[] = {
@@ -301,6 +309,7 @@ static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
 static const TypeInfo aspeed_wdt_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .name  = TYPE_ASPEED_WDT,
+    .instance_init  = aspeed_wdt_instance_init,
     .instance_size  = sizeof(AspeedWDTState),
     .class_init = aspeed_wdt_class_init,
     .class_size    = sizeof(AspeedWDTClass),
-- 
2.31.1


