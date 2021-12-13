Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BB8472E02
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:52:22 +0100 (CET)
Received: from localhost ([::1]:42774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlkb-0004CT-BD
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:52:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mwlO7-0008D3-KW; Mon, 13 Dec 2021 08:29:07 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:57777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mwlNz-0000ML-Lz; Mon, 13 Dec 2021 08:29:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0529FD19BEF5;
 Mon, 13 Dec 2021 14:28:58 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003710f58b3-50ef-4207-a749-2896319278b2,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 19/19] ppc/pnv: Move num_phbs under Pnv8Chip
Date: Mon, 13 Dec 2021 14:28:30 +0100
Message-ID: <20211213132830.108372-20-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 03c7aede-9810-4171-a7ff-6475bb94dcac
X-Ovh-Tracer-Id: 5375327632686680870
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not used elsewhere so that's where it belongs.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h | 4 ++--
 hw/ppc/pnv.c         | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index ca27bd39f0ac..251c9854329d 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -52,7 +52,6 @@ struct PnvChip {
     uint64_t     cores_mask;
     PnvCore      **cores;
 
-    uint32_t     num_phbs;
     uint32_t     num_pecs;
 
     MemoryRegion xscom_mmio;
@@ -82,6 +81,7 @@ struct Pnv8Chip {
 
 #define PNV8_CHIP_PHB3_MAX 4
     PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
+    uint32_t     num_phbs;
 
     XICSFabric    *xics;
 };
@@ -136,8 +136,8 @@ struct PnvChipClass {
     /*< public >*/
     uint64_t     chip_cfam_id;
     uint64_t     cores_mask;
-    uint32_t     num_phbs;
     uint32_t     num_pecs;
+    uint32_t     num_phbs;
 
     DeviceRealize parent_realize;
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 2b027e299d27..8a3732c982e5 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1099,7 +1099,6 @@ static void pnv_chip_power10_intc_print_info(PnvChip *chip, PowerPCCPU *cpu,
 
 static void pnv_chip_power8_instance_init(Object *obj)
 {
-    PnvChip *chip = PNV_CHIP(obj);
     Pnv8Chip *chip8 = PNV8_CHIP(obj);
     PnvChipClass *pcc = PNV_CHIP_GET_CLASS(obj);
     int i;
@@ -1118,10 +1117,10 @@ static void pnv_chip_power8_instance_init(Object *obj)
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
 
     if (defaults_enabled()) {
-        chip->num_phbs = pcc->num_phbs;
+        chip8->num_phbs = pcc->num_phbs;
     }
 
-    for (i = 0; i < chip->num_phbs; i++) {
+    for (i = 0; i < chip8->num_phbs; i++) {
         object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
     }
 
@@ -1239,7 +1238,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
                                 &chip8->homer.regs);
 
     /* PHB3 controllers */
-    for (i = 0; i < chip->num_phbs; i++) {
+    for (i = 0; i < chip8->num_phbs; i++) {
         PnvPHB3 *phb = &chip8->phbs[i];
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
-- 
2.31.1


