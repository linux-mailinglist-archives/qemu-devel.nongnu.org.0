Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46683FD732
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:48:38 +0200 (CEST)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMrF-0002VA-PY
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLMlY-00033S-Bt; Wed, 01 Sep 2021 05:42:44 -0400
Received: from 5.mo52.mail-out.ovh.net ([188.165.45.220]:46481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLMlW-0001Cz-Hm; Wed, 01 Sep 2021 05:42:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id A46EC28E788;
 Wed,  1 Sep 2021 11:42:28 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 11:41:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0058939a569-29df-4301-b6fc-9bd33f094206,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 8/8] ppc/pnv: Rename "id" to "quad-id" in PnvQuad
Date: Wed, 1 Sep 2021 11:41:53 +0200
Message-ID: <20210901094153.227671-9-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901094153.227671-1-clg@kaod.org>
References: <20210901094153.227671-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0fff8912-8f03-4972-aab7-c7f0b449d538
X-Ovh-Tracer-Id: 5397282680596368291
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo52.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This to avoid possible conflicts with the "id" property of QOM objects.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv_core.h | 2 +-
 hw/ppc/pnv.c              | 4 ++--
 hw/ppc/pnv_core.c         | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index 6ecee98a76ed..c22eab2e1f69 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -67,7 +67,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvQuad, PNV_QUAD)
 struct PnvQuad {
     DeviceState parent_obj;
 
-    uint32_t id;
+    uint32_t quad_id;
     MemoryRegion xscom_regs;
 };
 #endif /* PPC_PNV_CORE_H */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 761b82be7401..93f76738fc94 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1370,10 +1370,10 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
                                            sizeof(*eq), TYPE_PNV_QUAD,
                                            &error_fatal, NULL);
 
-        object_property_set_int(OBJECT(eq), "id", core_id, &error_fatal);
+        object_property_set_int(OBJECT(eq), "quad-id", core_id, &error_fatal);
         qdev_realize(DEVICE(eq), NULL, &error_fatal);
 
-        pnv_xscom_add_subregion(chip, PNV9_XSCOM_EQ_BASE(eq->id),
+        pnv_xscom_add_subregion(chip, PNV9_XSCOM_EQ_BASE(eq->quad_id),
                                 &eq->xscom_regs);
     }
 }
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index 4de8414df212..19e8eb885f71 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -407,13 +407,13 @@ static void pnv_quad_realize(DeviceState *dev, Error **errp)
     PnvQuad *eq = PNV_QUAD(dev);
     char name[32];
 
-    snprintf(name, sizeof(name), "xscom-quad.%d", eq->id);
+    snprintf(name, sizeof(name), "xscom-quad.%d", eq->quad_id);
     pnv_xscom_region_init(&eq->xscom_regs, OBJECT(dev), &pnv_quad_xscom_ops,
                           eq, name, PNV9_XSCOM_EQ_SIZE);
 }
 
 static Property pnv_quad_properties[] = {
-    DEFINE_PROP_UINT32("id", PnvQuad, id, 0),
+    DEFINE_PROP_UINT32("quad-id", PnvQuad, quad_id, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.31.1


