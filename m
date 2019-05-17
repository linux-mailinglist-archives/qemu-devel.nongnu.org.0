Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224B21179
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 02:53:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRR7Q-0005bG-72
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 20:53:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hRR6K-0005Ib-3O
	for qemu-devel@nongnu.org; Thu, 16 May 2019 20:51:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hRR6J-0004Gt-7j
	for qemu-devel@nongnu.org; Thu, 16 May 2019 20:51:56 -0400
Received: from mga09.intel.com ([134.134.136.24]:56981)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hRR6H-0004G2-F5
	for qemu-devel@nongnu.org; Thu, 16 May 2019 20:51:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2019 17:51:50 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga005.jf.intel.com with ESMTP; 16 May 2019 17:51:48 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 08:51:14 +0800
Message-Id: <20190517005114.19456-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [PATCH] hw/acpi: ACPI_PCI should depends on both ACPI
 and PCI
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: imammedo@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
	mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pointed out by Philippe Mathieu-Daudé <philmd@redhat.com>.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 hw/acpi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 7265843cc3..7c59cf900b 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -25,7 +25,7 @@ config ACPI_NVDIMM
 
 config ACPI_PCI
     bool
-    depends on ACPI
+    depends on ACPI && PCI
 
 config ACPI_VMGENID
     bool
-- 
2.19.1


