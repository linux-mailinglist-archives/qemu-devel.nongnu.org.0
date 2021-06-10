Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B663A2CBB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:18:25 +0200 (CEST)
Received: from localhost ([::1]:39222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKZk-0002sM-BU
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lrKXS-0007eZ-4g
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:16:02 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:57776 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lrKXQ-0000kJ-Kd
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:16:01 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id C88AD60311111; Thu, 10 Jun 2021 09:15:59 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v6 cxl2.0-v6-doe 2/6] include/hw/pci: headers for PCIe DOE
Date: Thu, 10 Jun 2021 09:15:57 -0400
Message-Id: <1623330957-18354-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623329999-15662-1-git-send-email-cbrowy@avery-design.com>
References: <1623329999-15662-1-git-send-email-cbrowy@avery-design.com>
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.398,
 NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: ben.widawsky@intel.com, david@redhat.com, qemu-devel@nongnu.org,
 vishal.l.verma@intel.com, jgroves@micron.com,
 Chris Browy <cbrowy@avery-design.com>, armbru@redhat.com, f4bug@amsat.org,
 hchkuo@avery-design.com.tw, tyshao@avery-design.com.tw,
 jonathan.cameron@huawei.com, imammedo@redhat.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: hchkuo <hchkuo@avery-design.com.tw>

Macros for the vender ID of PCI-SIG mentioned in "PCIe Data Object
Exchange ECN, March 12, 2020" and the size of PCIe Data Object
Exchange.

Signed-off-by: hchkuo <hchkuo@avery-design.com.tw>
Signed-off-by: Chris Browy <cbrowy@avery-design.com>
---
 include/hw/pci/pci_ids.h   | 3 +++
 include/hw/pci/pcie_regs.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 95f92d98e9..2656009cfe 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -157,6 +157,9 @@
 
 /* Vendors and devices.  Sort key: vendor first, device next. */
 
+/* Ref: PCIe Data Object Exchange ECN, March 12, 2020, Table 7-x2 */
+#define PCI_VENDOR_ID_PCI_SIG            0x0001
+
 #define PCI_VENDOR_ID_LSI_LOGIC          0x1000
 #define PCI_DEVICE_ID_LSI_53C810         0x0001
 #define PCI_DEVICE_ID_LSI_53C895A        0x0012
diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
index 1db86b0ec4..963dc2e170 100644
--- a/include/hw/pci/pcie_regs.h
+++ b/include/hw/pci/pcie_regs.h
@@ -179,4 +179,8 @@ typedef enum PCIExpLinkWidth {
 #define PCI_ACS_VER                     0x1
 #define PCI_ACS_SIZEOF                  8
 
+/* DOE Capability Register Fields */
+#define PCI_DOE_VER                     0x1
+#define PCI_DOE_SIZEOF                  24
+
 #endif /* QEMU_PCIE_REGS_H */
-- 
2.17.1


