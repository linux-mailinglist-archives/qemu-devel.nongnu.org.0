Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938B41D390
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:46:11 +0200 (CEST)
Received: from localhost ([::1]:46496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVppa-0004yC-2z
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVot5-0002GH-4J; Thu, 30 Sep 2021 01:45:43 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVot3-00042O-7z; Thu, 30 Sep 2021 01:45:42 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR3p3qz4xbw; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=FrpYk2SVXypc5reRuTOP37BQI1hZ6patEoyMOJ8lUB0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mpfQww5nazkZ9kWbB9OzaDpkvsgKufOgs+sCcpEkSWsALDzsn9Z6EOmV1XQ9+q8hU
 kzpKtYZv2O6fnkQ4u/tiSc2FPHMswP7y9MD0SzbUwkYflqEdQ9A8vKlnjulnQKCSk5
 iYsbvX//uluWdHtRPIjrX2pBgn4fNuBwtPdrH1e8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 35/44] hw/intc: openpic: Drop Raven related codes
Date: Thu, 30 Sep 2021 15:44:17 +1000
Message-Id: <20210930054426.357344-36-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

There is no machine that uses Motorola MCP750 (aka Raven) model.
Drop the related codes.

While we are here, drop the mentioning of Intel GW80314 I/O
companion chip in the comments as it has been obsolete for years,
and correct a typo too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20210918032653.646370-2-bin.meng@windriver.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/openpic.c        | 28 +---------------------------
 include/hw/ppc/openpic.h | 16 ----------------
 2 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 2790c6710a..23eafb32bd 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -25,12 +25,8 @@
 /*
  *
  * Based on OpenPic implementations:
- * - Intel GW80314 I/O companion chip developer's manual
  * - Motorola MPC8245 & MPC8540 user manuals.
- * - Motorola MCP750 (aka Raven) programmer manual.
- * - Motorola Harrier programmer manuel
- *
- * Serial interrupts, as implemented in Raven chipset are not supported yet.
+ * - Motorola Harrier programmer manual
  *
  */
 
@@ -1564,28 +1560,6 @@ static void openpic_realize(DeviceState *dev, Error **errp)
 
         break;
 
-    case OPENPIC_MODEL_RAVEN:
-        opp->nb_irqs = RAVEN_MAX_EXT;
-        opp->vid = VID_REVISION_1_3;
-        opp->vir = VIR_GENERIC;
-        opp->vector_mask = 0xFF;
-        opp->tfrr_reset = 4160000;
-        opp->ivpr_reset = IVPR_MASK_MASK | IVPR_MODE_MASK;
-        opp->idr_reset = 0;
-        opp->max_irq = RAVEN_MAX_IRQ;
-        opp->irq_ipi0 = RAVEN_IPI_IRQ;
-        opp->irq_tim0 = RAVEN_TMR_IRQ;
-        opp->brr1 = -1;
-        opp->mpic_mode_mask = GCR_MODE_MIXED;
-
-        if (opp->nb_cpus != 1) {
-            error_setg(errp, "Only UP supported today");
-            return;
-        }
-
-        map_list(opp, list_le, &list_count);
-        break;
-
     case OPENPIC_MODEL_KEYLARGO:
         opp->nb_irqs = KEYLARGO_MAX_EXT;
         opp->vid = VID_REVISION_1_2;
diff --git a/include/hw/ppc/openpic.h b/include/hw/ppc/openpic.h
index 74ff44bff0..f89802a15c 100644
--- a/include/hw/ppc/openpic.h
+++ b/include/hw/ppc/openpic.h
@@ -21,7 +21,6 @@ enum {
 
 typedef struct IrqLines { qemu_irq irq[OPENPIC_OUTPUT_NB]; } IrqLines;
 
-#define OPENPIC_MODEL_RAVEN       0
 #define OPENPIC_MODEL_FSL_MPIC_20 1
 #define OPENPIC_MODEL_FSL_MPIC_42 2
 #define OPENPIC_MODEL_KEYLARGO    3
@@ -32,13 +31,6 @@ typedef struct IrqLines { qemu_irq irq[OPENPIC_OUTPUT_NB]; } IrqLines;
 #define OPENPIC_MAX_IRQ     (OPENPIC_MAX_SRC + OPENPIC_MAX_IPI + \
                              OPENPIC_MAX_TMR)
 
-/* Raven */
-#define RAVEN_MAX_CPU      2
-#define RAVEN_MAX_EXT     48
-#define RAVEN_MAX_IRQ     64
-#define RAVEN_MAX_TMR      OPENPIC_MAX_TMR
-#define RAVEN_MAX_IPI      OPENPIC_MAX_IPI
-
 /* KeyLargo */
 #define KEYLARGO_MAX_CPU  4
 #define KEYLARGO_MAX_EXT  64
@@ -49,14 +41,6 @@ typedef struct IrqLines { qemu_irq irq[OPENPIC_OUTPUT_NB]; } IrqLines;
 /* Timers don't exist but this makes the code happy... */
 #define KEYLARGO_TMR_IRQ  (KEYLARGO_IPI_IRQ + KEYLARGO_MAX_IPI)
 
-/* Interrupt definitions */
-#define RAVEN_FE_IRQ     (RAVEN_MAX_EXT)     /* Internal functional IRQ */
-#define RAVEN_ERR_IRQ    (RAVEN_MAX_EXT + 1) /* Error IRQ */
-#define RAVEN_TMR_IRQ    (RAVEN_MAX_EXT + 2) /* First timer IRQ */
-#define RAVEN_IPI_IRQ    (RAVEN_TMR_IRQ + RAVEN_MAX_TMR) /* First IPI IRQ */
-/* First doorbell IRQ */
-#define RAVEN_DBL_IRQ    (RAVEN_IPI_IRQ + (RAVEN_MAX_CPU * RAVEN_MAX_IPI))
-
 typedef struct FslMpicInfo {
     int max_ext;
 } FslMpicInfo;
-- 
2.31.1


