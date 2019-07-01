Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1720954DA4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 13:31:22 +0200 (CEST)
Received: from localhost ([::1]:58984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfjfV-0000Qd-7t
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 07:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53618)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hfjd8-0006qj-TL
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 07:28:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hfjd7-00046K-Tn
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 07:28:54 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2244 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jonathan.cameron@huawei.com>)
 id 1hfjd5-0003q0-DT; Tue, 25 Jun 2019 07:28:51 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 29B65258D9C69BBF49A5;
 Tue, 25 Jun 2019 19:28:43 +0800 (CST)
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Jun 2019 19:28:32 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Tue, 25 Jun 2019 19:27:46 +0800
Message-ID: <20190625112752.83188-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
References: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.123.41.22]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-devel] [RFC PATCH 1/7] Temp: Add the PCI_EXT_ID_DVSEC
 definition to the qemu pci_regs.h copy.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jcm@redhat.com,
 linuxarm@huawei.com, Auger Eric <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This hasn't yet been added to the linux kernel tree, so for purposes
of this RFC just add it locally.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 include/standard-headers/linux/pci_regs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard=
-headers/linux/pci_regs.h
index 27164769d1..224b52e62b 100644
--- a/include/standard-headers/linux/pci_regs.h
+++ b/include/standard-headers/linux/pci_regs.h
@@ -709,7 +709,8 @@
 #define PCI_EXT_CAP_ID_DPC	0x1D	/* Downstream Port Containment */
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
-#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PTM
+#define PCI_EXT_CAP_ID_DVSEC	0x23    /* Designated Vendor-Specific */
+#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_DVSEC
=20
 #define PCI_EXT_CAP_DSN_SIZEOF	12
 #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
--=20
2.20.1


