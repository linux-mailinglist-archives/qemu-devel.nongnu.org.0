Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F293725DE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:37:35 +0200 (CEST)
Received: from localhost ([::1]:38896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldogY-0006S2-Dd
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0V-00065Y-0E; Tue, 04 May 2021 01:54:07 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51089 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0T-0004s7-6J; Tue, 04 May 2021 01:54:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CL5TWKz9sj5; Tue,  4 May 2021 15:53:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107598;
 bh=7ujQDPPP/0A+ekFnLR3g7Ouqjx8k9nF6bDg8z4HD3eU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N3BbwXYpTZbFTPYSHeOH0kYLwFD3q1sKc33grGyP/M4rgy6NTNZzhpInDfBiHgCmY
 0dhy+BbxU40Le8aRrq2lyj50sQjtDZ2F6e1UOZQ7CHpjRoH1v/7kqcR7IobTctEnH0
 cUFqm98k5umZkgBhWcMSfeVdh9PRqFzNgudJ4PGA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 26/46] spapr: Rename RTAS_MAX_ADDR to FDT_MAX_ADDR
Date: Tue,  4 May 2021 15:52:52 +1000
Message-Id: <20210504055312.306823-27-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

SLOF instantiates RTAS since
744a928ccee9 ("spapr: Stop providing RTAS blob")
so the max address applies to the FDT only.

This renames the macro and fixes up the comment.

This should not cause any behavioral change.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-Id: <20210331025123.29310-1-aik@ozlabs.ru>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 529ff056dd..fd53615df0 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -100,7 +100,7 @@
  *
  * We load our kernel at 4M, leaving space for SLOF initial image
  */
-#define RTAS_MAX_ADDR           0x80000000 /* RTAS must stay below that */
+#define FDT_MAX_ADDR            0x80000000 /* FDT must stay below that */
 #define FW_MAX_SIZE             0x400000
 #define FW_FILE_NAME            "slof.bin"
 #define FW_OVERHEAD             0x2800000
@@ -1617,11 +1617,11 @@ static void spapr_machine_reset(MachineState *machine)
     spapr_clear_pending_events(spapr);
 
     /*
-     * We place the device tree and RTAS just below either the top of the RMA,
+     * We place the device tree just below either the top of the RMA,
      * or just below 2GB, whichever is lower, so that it can be
      * processed with 32-bit real mode code if necessary
      */
-    fdt_addr = MIN(spapr->rma_size, RTAS_MAX_ADDR) - FDT_MAX_SIZE;
+    fdt_addr = MIN(spapr->rma_size, FDT_MAX_ADDR) - FDT_MAX_SIZE;
 
     fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
 
@@ -2694,7 +2694,7 @@ static void spapr_machine_init(MachineState *machine)
     spapr->rma_size = spapr_rma_size(spapr, &error_fatal);
 
     /* Setup a load limit for the ramdisk leaving room for SLOF and FDT */
-    load_limit = MIN(spapr->rma_size, RTAS_MAX_ADDR) - FW_OVERHEAD;
+    load_limit = MIN(spapr->rma_size, FDT_MAX_ADDR) - FW_OVERHEAD;
 
     /*
      * VSMT must be set in order to be able to compute VCPU ids, ie to
-- 
2.31.1


