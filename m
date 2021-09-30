Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22441D2F6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:59:32 +0200 (CEST)
Received: from localhost ([::1]:52238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVp6P-0007RJ-A6
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos7-0000zr-GY; Thu, 30 Sep 2021 01:44:43 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:36977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos5-0003Rj-Lm; Thu, 30 Sep 2021 01:44:43 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR0wzNz4xbY; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=ctd0ZP7a4akHOYauQkg/Q9Vp9xCBNcAqTpB7eUV34eQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hyw+fm/2dYXVFtAhiCwQtqYC7WFXOlVxlPgMGkPxEL9vF5s82U61pMuRxFIab70qR
 tC6so64iuEYiXeRBV7LSQa12mYPE0XK90eJPzEnktivSAsh3AxbgZdNKadbK5gdNeG
 rREh8bUh2TGLHFla7kB8umvNmd0YB6AMFEVEE33A=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 10/44] ppc/pnv: Rename "id" to "quad-id" in PnvQuad
Date: Thu, 30 Sep 2021 15:43:52 +1000
Message-Id: <20210930054426.357344-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

This to avoid possible conflicts with the "id" property of QOM objects.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210901094153.227671-9-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c              | 4 ++--
 hw/ppc/pnv_core.c         | 4 ++--
 include/hw/ppc/pnv_core.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index a62e90b15e..03c86508d2 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1368,10 +1368,10 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
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
index 4de8414df2..19e8eb885f 100644
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
 
diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index 6ecee98a76..c22eab2e1f 100644
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
-- 
2.31.1


