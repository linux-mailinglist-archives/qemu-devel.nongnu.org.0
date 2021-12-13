Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A96472DA7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:43:39 +0100 (CET)
Received: from localhost ([::1]:51004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlcA-0006Qn-9B
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:43:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNy-0007YI-0c
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:28:58 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:52017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNu-0000Jy-I0
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:28:57 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.5])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 12CE9D19BEE5;
 Mon, 13 Dec 2021 14:28:53 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0033d3ced66-25ca-45e5-a00e-5f7ed8abfd88,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 12/19] ppc/pnv: Remove "system-memory" property from PHB4
 PEC
Date: Mon, 13 Dec 2021 14:28:23 +0100
Message-ID: <20211213132830.108372-13-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ef04644b-70ff-4291-af92-d351fe0241f7
X-Ovh-Tracer-Id: 5374201732249258790
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

This is not useful and will be in the way for support of user created
PHB4 devices.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4_pec.c | 6 +-----
 hw/ppc/pnv.c               | 2 --
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index a7dd4173d598..dfed2af0f7df 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -124,7 +124,7 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
 static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
 {
     PnvPhb4PecState *pec = stack->pec;
-    MemoryRegion *sysmem = pec->system_memory;
+    MemoryRegion *sysmem = get_system_memory();
     uint64_t bar_en = stack->nest_regs[PEC_NEST_STK_BAR_EN];
     uint64_t bar, mask, size;
     char name[64];
@@ -394,8 +394,6 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     char name[64];
     int i;
 
-    assert(pec->system_memory);
-
     if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
         error_setg(errp, "invalid PEC index: %d", pec->index);
         return;
@@ -486,8 +484,6 @@ static Property pnv_pec_properties[] = {
         DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
         DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
                          PnvChip *),
-        DEFINE_PROP_LINK("system-memory", PnvPhb4PecState, system_memory,
-                     TYPE_MEMORY_REGION, MemoryRegion *),
         DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 284fbd50dae3..c59a4a078cd0 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1396,8 +1396,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
                                 &error_fatal);
         object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
                                  &error_fatal);
-        object_property_set_link(OBJECT(pec), "system-memory",
-                                 OBJECT(get_system_memory()), &error_abort);
         if (!qdev_realize(DEVICE(pec), NULL, errp)) {
             return;
         }
-- 
2.31.1


