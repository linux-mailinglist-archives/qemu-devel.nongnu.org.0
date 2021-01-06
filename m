Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FF62EB885
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:43:39 +0100 (CET)
Received: from localhost ([::1]:58360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzjW-0002qG-FQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeh-0005Xt-FF; Tue, 05 Jan 2021 22:38:39 -0500
Received: from ozlabs.org ([203.11.71.1]:42611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzed-0006Er-MB; Tue, 05 Jan 2021 22:38:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpG0bBQz9sVw; Wed,  6 Jan 2021 14:38:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904310;
 bh=0/zKC+Nzps8g36d6zgelpU42RIiZeKuKe9r5JLj2VnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IisPhTNf7giUojwPNpUx8upg2Nul3sNuPFA/eqU1ZoKlcsn9Nli4PXmzVAkJKS6iF
 u7W8pjD6JCLEfM5NckQ0Tdr7r6I/OcbtTfH1pHmkT1+A9ezdpZYeZxUXe05RTL2vUl
 Mwo2S1eBdsVgdvsY7DhbpG4IRODY6v2KF7lYrXgA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 01/22] hw/ppc/ppc4xx_devs: Make code style fixes to UIC code
Date: Wed,  6 Jan 2021 14:37:55 +1100
Message-Id: <20210106033816.232598-2-david@gibson.dropbear.id.au>
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In a following commit we will move the PPC UIC implementation to
its own file in hw/intc. To prevent checkpatch complaining about that
code-motion, fix up the minor style issues first.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201212001537.24520-2-peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc4xx_devs.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index f1651e04d9..f2f9ca4ffe 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -105,7 +105,7 @@ struct ppcuic_t {
     qemu_irq *irqs;
 };
 
-static void ppcuic_trigger_irq (ppcuic_t *uic)
+static void ppcuic_trigger_irq(ppcuic_t *uic)
 {
     uint32_t ir, cr;
     int start, end, inc, i;
@@ -156,26 +156,28 @@ static void ppcuic_trigger_irq (ppcuic_t *uic)
     }
 }
 
-static void ppcuic_set_irq (void *opaque, int irq_num, int level)
+static void ppcuic_set_irq(void *opaque, int irq_num, int level)
 {
     ppcuic_t *uic;
     uint32_t mask, sr;
 
     uic = opaque;
-    mask = 1U << (31-irq_num);
+    mask = 1U << (31 - irq_num);
     LOG_UIC("%s: irq %d level %d uicsr %08" PRIx32
                 " mask %08" PRIx32 " => %08" PRIx32 " %08" PRIx32 "\n",
                 __func__, irq_num, level,
                 uic->uicsr, mask, uic->uicsr & mask, level << irq_num);
-    if (irq_num < 0 || irq_num > 31)
+    if (irq_num < 0 || irq_num > 31) {
         return;
+    }
     sr = uic->uicsr;
 
     /* Update status register */
     if (uic->uictr & mask) {
         /* Edge sensitive interrupt */
-        if (level == 1)
+        if (level == 1) {
             uic->uicsr |= mask;
+        }
     } else {
         /* Level sensitive interrupt */
         if (level == 1) {
@@ -188,11 +190,12 @@ static void ppcuic_set_irq (void *opaque, int irq_num, int level)
     }
     LOG_UIC("%s: irq %d level %d sr %" PRIx32 " => "
                 "%08" PRIx32 "\n", __func__, irq_num, level, uic->uicsr, sr);
-    if (sr != uic->uicsr)
+    if (sr != uic->uicsr) {
         ppcuic_trigger_irq(uic);
+    }
 }
 
-static uint32_t dcr_read_uic (void *opaque, int dcrn)
+static uint32_t dcr_read_uic(void *opaque, int dcrn)
 {
     ppcuic_t *uic;
     uint32_t ret;
@@ -220,13 +223,15 @@ static uint32_t dcr_read_uic (void *opaque, int dcrn)
         ret = uic->uicsr & uic->uicer;
         break;
     case DCR_UICVR:
-        if (!uic->use_vectors)
+        if (!uic->use_vectors) {
             goto no_read;
+        }
         ret = uic->uicvr;
         break;
     case DCR_UICVCR:
-        if (!uic->use_vectors)
+        if (!uic->use_vectors) {
             goto no_read;
+        }
         ret = uic->uicvcr;
         break;
     default:
@@ -238,7 +243,7 @@ static uint32_t dcr_read_uic (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_uic (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_uic(void *opaque, int dcrn, uint32_t val)
 {
     ppcuic_t *uic;
 
-- 
2.29.2


