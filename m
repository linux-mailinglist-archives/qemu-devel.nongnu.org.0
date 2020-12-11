Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6982D6F12
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:21:27 +0100 (CET)
Received: from localhost ([::1]:33514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knZvo-0002hM-Uu
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq3-0005Wg-D4; Thu, 10 Dec 2020 23:15:27 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:42299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq0-0000Uy-0e; Thu, 10 Dec 2020 23:15:26 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CscrZ4f84z9sWV; Fri, 11 Dec 2020 15:15:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660110;
 bh=30IN9E+iDeGmA9l4nt+SQ3Bx4uYn26iJRk5Uk+ZSwk4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AxGFT7LQz2oGNOfugpoGgDtdFdpyHJcvc/J8Qkc1SWOh1D3VWsabt84ldFeemxCmw
 aNz4sE87ok5uli4ZD6QJjeWR52WbXrKgF+mdnGCxCiOfl2CLMx/NpisdYT9N9O7GT8
 46HEgxo8Z5W1Ql1joj7hSPOuSW36FzwI1P7m5psM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 02/30] spapr/xics: Drop unused argument to
 xics_kvm_has_broken_disconnect()
Date: Fri, 11 Dec 2020 15:14:39 +1100
Message-Id: <20201211041507.425378-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Never used from the start.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201120174646.619395-6-groug@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xics_kvm.c          | 2 +-
 hw/ppc/spapr_irq.c          | 2 +-
 include/hw/ppc/xics_spapr.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index 68bb1914b9..570d635bcc 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -484,7 +484,7 @@ void xics_kvm_disconnect(SpaprInterruptController *intc)
  * support destruction of a KVM XICS device while the VM is running.
  * Required to start a spapr machine with ic-mode=dual,kernel-irqchip=on.
  */
-bool xics_kvm_has_broken_disconnect(SpaprMachineState *spapr)
+bool xics_kvm_has_broken_disconnect(void)
 {
     int rc;
 
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index f59960339e..a0d1e1298e 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -186,7 +186,7 @@ static int spapr_irq_check(SpaprMachineState *spapr, Error **errp)
     if (kvm_enabled() &&
         spapr->irq == &spapr_irq_dual &&
         kvm_kernel_irqchip_required() &&
-        xics_kvm_has_broken_disconnect(spapr)) {
+        xics_kvm_has_broken_disconnect()) {
         error_setg(errp,
             "KVM is incompatible with ic-mode=dual,kernel-irqchip=on");
         error_append_hint(errp,
diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
index 0b8182e40b..de752c0d2c 100644
--- a/include/hw/ppc/xics_spapr.h
+++ b/include/hw/ppc/xics_spapr.h
@@ -38,6 +38,6 @@ DECLARE_INSTANCE_CHECKER(ICSState, ICS_SPAPR,
 int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
                      Error **errp);
 void xics_kvm_disconnect(SpaprInterruptController *intc);
-bool xics_kvm_has_broken_disconnect(SpaprMachineState *spapr);
+bool xics_kvm_has_broken_disconnect(void);
 
 #endif /* XICS_SPAPR_H */
-- 
2.29.2


