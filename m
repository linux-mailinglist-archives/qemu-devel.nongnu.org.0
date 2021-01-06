Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5202EB888
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:43:48 +0100 (CET)
Received: from localhost ([::1]:59276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzjf-0003Cp-4S
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzek-0005fM-Ih; Tue, 05 Jan 2021 22:38:42 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51677 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzei-0006IC-QU; Tue, 05 Jan 2021 22:38:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpG2vrcz9sVx; Wed,  6 Jan 2021 14:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904310;
 bh=kfEPRNUrMxoZ3Swm41kkUjdiBsTxkHoRF/VQ6ILmmtE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CQnsDA9Atj6H0dIiDnOYf+KhQBYV20mExJyN1mqtStuBkcr/I/j0tOBmwNtrzqGN/
 OykRCVXrmxrcA+3IvuqxgbSy297bLWd613eta/RXYemfbsPPBAW6fFYOacgZqr2nnD
 pKAg/3vgAYIskWpD72dMXclLYAZcbfqtCv7W8D34=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 06/22] spapr/xive: Make spapr_xive_pic_print_info() static
Date: Wed,  6 Jan 2021 14:38:00 +1100
Message-Id: <20210106033816.232598-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20201215174025.2636824-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c        | 2 +-
 include/hw/ppc/spapr_xive.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index caedd312d7..801bc19341 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -156,7 +156,7 @@ static void spapr_xive_end_pic_print_info(SpaprXive *xive, XiveEND *end,
 #define spapr_xive_in_kernel(xive) \
     (kvm_irqchip_in_kernel() && (xive)->fd != -1)
 
-void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon)
+static void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon)
 {
     XiveSource *xsrc = &xive->source;
     int i;
diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index 26c8d90d71..b282960ad9 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -66,8 +66,6 @@ typedef struct SpaprXiveClass {
  */
 #define SPAPR_XIVE_BLOCK_ID 0x0
 
-void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon);
-
 struct SpaprMachineState;
 void spapr_xive_hcall_init(struct SpaprMachineState *spapr);
 void spapr_xive_mmio_set_enabled(SpaprXive *xive, bool enable);
-- 
2.29.2


