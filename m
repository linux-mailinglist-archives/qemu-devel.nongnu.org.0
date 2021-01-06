Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF692EB8BD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:57:44 +0100 (CET)
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzx9-0002Tp-A2
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeu-0005xD-Hr; Tue, 05 Jan 2021 22:38:52 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52915 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzes-0006NK-Pc; Tue, 05 Jan 2021 22:38:52 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpJ54gCz9sWq; Wed,  6 Jan 2021 14:38:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904312;
 bh=DeGX6oX3pueVzK/HPGrBseoqiS/OUo2DmhzNLbSSYQY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HviYh9V7TxvCtYjEX755B/VZRo9lyUKokUfmddAZHD/yIMI92FTtseyDjazN4LIoQ
 8uOkyPSGVb3HS97aD7ZHk7kjjhgOX4gZPvVeioRnq3IBiC0cc0O7ps2ymBp+phlAs0
 qNhu4Dt2JNutqdeLgccD494gVDizMQJGkhROjuDQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 20/22] ppc440_pcix: Improve comment for IRQ mapping
Date: Wed,  6 Jan 2021 14:38:14 +1100
Message-Id: <20210106033816.232598-21-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan via <qemu-ppc@nongnu.org>

The code mapping all PCI interrupts to a single CPU IRQ works but is
not trivial so document it in a comment.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <c25c0310510672b58466e795fd701e65e8f1ff97.1609636173.git.balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc440_pcix.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index ee952314c8..eb1290ffc8 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -415,8 +415,15 @@ static void ppc440_pcix_reset(DeviceState *dev)
     s->sts = 0;
 }
 
-/* All pins from each slot are tied to a single board IRQ.
- * This may need further refactoring for other boards. */
+/*
+ * All four IRQ[ABCD] pins from all slots are tied to a single board
+ * IRQ, so our mapping function here maps everything to IRQ 0.
+ * The code in pci_change_irq_level() tracks the number of times
+ * the mapped IRQ is asserted and deasserted, so if multiple devices
+ * assert an IRQ at the same time the behaviour is correct.
+ *
+ * This may need further refactoring for boards that use multiple IRQ lines.
+ */
 static int ppc440_pcix_map_irq(PCIDevice *pci_dev, int irq_num)
 {
     trace_ppc440_pcix_map_irq(pci_dev->devfn, irq_num, 0);
-- 
2.29.2


