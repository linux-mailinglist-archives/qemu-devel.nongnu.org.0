Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D9C66001
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 21:33:00 +0200 (CEST)
Received: from localhost ([::1]:44850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hleoM-0004Wp-VM
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 15:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43758)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hleoA-00047p-4e
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 15:32:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hleo9-0006EQ-4W
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 15:32:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57046)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hleo8-0006C4-Rv
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 15:32:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 11AA58046D;
 Thu, 11 Jul 2019 19:27:17 +0000 (UTC)
Received: from redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with SMTP id CC33019C58;
 Thu, 11 Jul 2019 19:27:15 +0000 (UTC)
Date: Thu, 11 Jul 2019 15:27:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190711192713.32152-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 11 Jul 2019 19:27:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] pcie: consistent names for function args
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function declarations for pci_cap_slot_get and
pci_cap_slot_write_config call the argument "slot_ctl", but the function
definitions and all the call sites drop the 'o' and call it "slt_ctl".
Let's be consistent.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 34f277735c..c7f0388b26 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -107,7 +107,7 @@ void pcie_cap_lnkctl_reset(PCIDevice *dev);
 
 void pcie_cap_slot_init(PCIDevice *dev, uint16_t slot);
 void pcie_cap_slot_reset(PCIDevice *dev);
-void pcie_cap_slot_get(PCIDevice *dev, uint16_t *slot_ctl, uint16_t *slt_sta);
+void pcie_cap_slot_get(PCIDevice *dev, uint16_t *slt_ctl, uint16_t *slt_sta);
 void pcie_cap_slot_write_config(PCIDevice *dev,
                                 uint16_t old_slot_ctl, uint16_t old_slt_sta,
                                 uint32_t addr, uint32_t val, int len);
-- 
MST

