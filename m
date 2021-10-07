Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8941042595D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:25:17 +0200 (CEST)
Received: from localhost ([::1]:60148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYX8u-0005GA-I4
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWQN-0001D0-Mz; Thu, 07 Oct 2021 12:39:15 -0400
Received: from mga04.intel.com ([192.55.52.120]:55434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWQM-0008BP-0p; Thu, 07 Oct 2021 12:39:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="225072992"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="225072992"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:26:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="624325877"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:26:03 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/15] pcie: Add 1.2 version token for the Power Management
 Capability
Date: Thu,  7 Oct 2021 18:23:59 +0200
Message-Id: <20211007162406.1920374-9-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Oct 2021 13:12:41 -0400
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
Cc: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 include/hw/pci/pci_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci/pci_regs.h b/include/hw/pci/pci_regs.h
index 77ba64b931..a590140962 100644
--- a/include/hw/pci/pci_regs.h
+++ b/include/hw/pci/pci_regs.h
@@ -4,5 +4,6 @@
 #include "standard-headers/linux/pci_regs.h"
 
 #define  PCI_PM_CAP_VER_1_1     0x0002  /* PCI PM spec ver. 1.1 */
+#define  PCI_PM_CAP_VER_1_2     0x0003  /* PCI PM spec ver. 1.2 */
 
 #endif
-- 
2.25.1


