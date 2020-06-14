Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2291F8A20
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 20:35:47 +0200 (CEST)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkXTu-0006Uw-OV
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 14:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkXLU-0004LD-4u; Sun, 14 Jun 2020 14:27:04 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:52081)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkXLS-0007go-DK; Sun, 14 Jun 2020 14:27:03 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C8DA7748DCF;
 Sun, 14 Jun 2020 20:26:51 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AB9BB7482CE; Sun, 14 Jun 2020 20:26:43 +0200 (CEST)
Message-Id: <fa8025e73555bcb54e1b741d7c759d5860b43014.1592158400.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1592158400.git.balaton@eik.bme.hu>
References: <cover.1592158400.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 3/9] grackle: Set revision in PCI config to match hardware
Date: Sun, 14 Jun 2020 20:13:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Howard Spoelstra <hsp.cat7@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/pci-host/grackle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index 4b3af0c704..48d11f13ab 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -130,7 +130,7 @@ static void grackle_pci_class_init(ObjectClass *klass, void *data)
     k->realize   = grackle_pci_realize;
     k->vendor_id = PCI_VENDOR_ID_MOTOROLA;
     k->device_id = PCI_DEVICE_ID_MOTOROLA_MPC106;
-    k->revision  = 0x00;
+    k->revision  = 0x40;
     k->class_id  = PCI_CLASS_BRIDGE_HOST;
     /*
      * PCI-facing part of the host bridge, not usable without the
-- 
2.21.3


