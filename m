Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428E368D63A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:11:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMow-0001kx-I2; Tue, 07 Feb 2023 07:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPMot-0001Wx-V7
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:11:31 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPMoq-0004aB-OE
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:11:30 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id DDFE9600D9;
 Tue,  7 Feb 2023 15:11:23 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown [2a02:6b8:b081:218::1:e])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 HBbDgg1QJGk1-Q9cKLL3A; Tue, 07 Feb 2023 15:11:23 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675771883; bh=9UQZIC26gd9V5xSKa0q+eOT+DoRF3Hp4776K835oCfM=;
 h=Cc:Message-Id:References:Date:In-Reply-To:Subject:To:From;
 b=Yrm6B9WX1adYzGi4QSwjp986paPwlR56lTTs4bcH1uSdFHCGkab9EyPh1yYWMht2s
 LmKmHN1eKuOrIUOUnULB8d1kARSyGROMuK4M9Cav+Rf3pOi2cwCXsrJachTBOmT2+o
 OsxRQIlghf5fGgIOVSUk9N/VR/NeL4MqccNtFMfo=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, vsementsov@yandex-team.ru,
 philmd@linaro.org
Subject: [PATCH v2 3/3] pcie: drop unused PCIExpressIndicator
Date: Tue,  7 Feb 2023 15:11:16 +0300
Message-Id: <20230207121116.325456-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207121116.325456-1-vsementsov@yandex-team.ru>
References: <20230207121116.325456-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The structure type is unused. Also, it's the only user of corresponding
macros, so drop them too.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pcie.h      | 8 --------
 include/hw/pci/pcie_regs.h | 5 -----
 2 files changed, 13 deletions(-)

diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 798a262a0a..3cc2b15957 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -27,14 +27,6 @@
 #include "hw/pci/pcie_sriov.h"
 #include "hw/hotplug.h"
 
-typedef enum {
-    /* for attention and power indicator */
-    PCI_EXP_HP_IND_RESERVED     = PCI_EXP_SLTCTL_IND_RESERVED,
-    PCI_EXP_HP_IND_ON           = PCI_EXP_SLTCTL_IND_ON,
-    PCI_EXP_HP_IND_BLINK        = PCI_EXP_SLTCTL_IND_BLINK,
-    PCI_EXP_HP_IND_OFF          = PCI_EXP_SLTCTL_IND_OFF,
-} PCIExpressIndicator;
-
 typedef enum {
     /* these bits must match the bits in Slot Control/Status registers.
      * PCI_EXP_HP_EV_xxx = PCI_EXP_SLTCTL_xxxE = PCI_EXP_SLTSTA_xxx
diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
index 00b595a82e..1fe0bdd25b 100644
--- a/include/hw/pci/pcie_regs.h
+++ b/include/hw/pci/pcie_regs.h
@@ -66,11 +66,6 @@ typedef enum PCIExpLinkWidth {
 
 #define PCI_EXP_SLTCAP_PSN_SHIFT        ctz32(PCI_EXP_SLTCAP_PSN)
 
-#define PCI_EXP_SLTCTL_IND_RESERVED     0x0
-#define PCI_EXP_SLTCTL_IND_ON           0x1
-#define PCI_EXP_SLTCTL_IND_BLINK        0x2
-#define PCI_EXP_SLTCTL_IND_OFF          0x3
-
 #define PCI_EXP_SLTCTL_SUPPORTED        \
             (PCI_EXP_SLTCTL_ABPE |      \
              PCI_EXP_SLTCTL_PDCE |      \
-- 
2.34.1


