Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE066002
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 21:33:11 +0200 (CEST)
Received: from localhost ([::1]:44856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hleoY-0005MI-Ig
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 15:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43827)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hleoL-0004jy-Pk
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 15:32:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hleoK-0006N1-Oi
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 15:32:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47716)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hleoK-0006MV-J5
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 15:32:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BDC4581F0F;
 Thu, 11 Jul 2019 19:25:17 +0000 (UTC)
Received: from redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with SMTP id 4C4385D9CA;
 Thu, 11 Jul 2019 19:25:15 +0000 (UTC)
Date: Thu, 11 Jul 2019 15:25:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190711192512.31936-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 11 Jul 2019 19:25:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] xio3130_downstream: typo fix
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

slt ctl/status are passed in incorrect order.
Fix this up.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/pci-bridge/xio3130_downstream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 899b0fd6c9..182e164f74 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -43,7 +43,7 @@ static void xio3130_downstream_write_config(PCIDevice *d, uint32_t address,
 {
     uint16_t slt_ctl, slt_sta;
 
-    pcie_cap_slot_get(d, &slt_sta, &slt_ctl);
+    pcie_cap_slot_get(d, &slt_ctl, &slt_sta);
     pci_bridge_write_config(d, address, val, len);
     pcie_cap_flr_write_config(d, address, val, len);
     pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
-- 
MST

