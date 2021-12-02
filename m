Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9D84665A0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:44:24 +0100 (CET)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnJv-0003fS-Aq
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:44:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnII-0000Hg-Ph
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:42 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:51539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIG-0005Ei-FT
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.108])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3F35B2202E;
 Thu,  2 Dec 2021 14:42:38 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 15:42:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0015b70f7cc-aef1-459b-b166-46380be18060,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 01/14] ppc/pnv: Reduce the maximum of PHB3 devices
Date: Thu, 2 Dec 2021 15:42:22 +0100
Message-ID: <20211202144235.1276352-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202144235.1276352-1-clg@kaod.org>
References: <20211202144235.1276352-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ad0909b3-6a77-4cdf-9c3a-25777e320241
X-Ovh-Tracer-Id: 15807071746029816614
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
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

All POWER8 machines have a maximum of 3 PHB3 devices. Adapt the
PNV8_CHIP_PHB3_MAX definition for consistency.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h | 2 +-
 hw/ppc/pnv.c         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index aa08d79d24de..6f498c8f1b5f 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -79,7 +79,7 @@ struct Pnv8Chip {
     PnvOCC       occ;
     PnvHomer     homer;
 
-#define PNV8_CHIP_PHB3_MAX 4
+#define PNV8_CHIP_PHB3_MAX 3
     PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
 
     XICSFabric    *xics;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 71e45515f136..bd768dcc28ad 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1256,7 +1256,7 @@ static void pnv_chip_power8e_class_init(ObjectClass *klass, void *data)
 
     k->chip_cfam_id = 0x221ef04980000000ull;  /* P8 Murano DD2.1 */
     k->cores_mask = POWER8E_CORE_MASK;
-    k->num_phbs = 3;
+    k->num_phbs = PNV8_CHIP_PHB3_MAX;
     k->core_pir = pnv_chip_core_pir_p8;
     k->intc_create = pnv_chip_power8_intc_create;
     k->intc_reset = pnv_chip_power8_intc_reset;
@@ -1280,7 +1280,7 @@ static void pnv_chip_power8_class_init(ObjectClass *klass, void *data)
 
     k->chip_cfam_id = 0x220ea04980000000ull; /* P8 Venice DD2.0 */
     k->cores_mask = POWER8_CORE_MASK;
-    k->num_phbs = 3;
+    k->num_phbs = PNV8_CHIP_PHB3_MAX;
     k->core_pir = pnv_chip_core_pir_p8;
     k->intc_create = pnv_chip_power8_intc_create;
     k->intc_reset = pnv_chip_power8_intc_reset;
@@ -1304,7 +1304,7 @@ static void pnv_chip_power8nvl_class_init(ObjectClass *klass, void *data)
 
     k->chip_cfam_id = 0x120d304980000000ull;  /* P8 Naples DD1.0 */
     k->cores_mask = POWER8_CORE_MASK;
-    k->num_phbs = 3;
+    k->num_phbs = PNV8_CHIP_PHB3_MAX;
     k->core_pir = pnv_chip_core_pir_p8;
     k->intc_create = pnv_chip_power8_intc_create;
     k->intc_reset = pnv_chip_power8_intc_reset;
-- 
2.31.1


