Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7F62AE868
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 06:49:39 +0100 (CET)
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcj0k-0005Uf-LB
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 00:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyo-0003qz-7o
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:38 -0500
Received: from mga14.intel.com ([192.55.52.115]:60768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyl-0008O5-5p
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:37 -0500
IronPort-SDR: JVKLAE+UtARd2ciQ3MOSVSfgkJfdQq1Xhv+fweg+Pv+8K9R+Rc+hYACzECVn9ACnRxvya6XwIa
 3bJHRny+zpnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314658"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314658"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:28 -0800
IronPort-SDR: h+xOlF9TcjRWUkbJgHCiHClWxvL6t5hYRwS/GYHG0GJM2AieTXorOcv4BvHm1N05Ew2f4B1n9O
 B13xTh6CK2GA==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710385"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:27 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/25] Temp: Add the PCI_EXT_ID_DVSEC definition to the
 qemu pci_regs.h copy.
Date: Tue, 10 Nov 2020 21:47:00 -0800
Message-Id: <20201111054724.794888-2-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111054724.794888-1-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=ben.widawsky@intel.com; helo=mga14.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 00:47:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This hasn't yet been added to the linux kernel tree, so for purposes
of this RFC just add it locally.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 include/standard-headers/linux/pci_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard-headers/linux/pci_regs.h
index a95d55f9f2..5d0b79b9da 100644
--- a/include/standard-headers/linux/pci_regs.h
+++ b/include/standard-headers/linux/pci_regs.h
@@ -723,6 +723,7 @@
 #define PCI_EXT_CAP_ID_DPC	0x1D	/* Downstream Port Containment */
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
+#define PCI_EXT_CAP_ID_DVSEC	0x23    /* Designated Vendor-Specific */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
 #define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_16GT
-- 
2.29.2


