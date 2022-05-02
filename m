Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A817516DAA
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 11:47:32 +0200 (CEST)
Received: from localhost ([::1]:54438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlSeQ-00022N-To
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 05:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nlSZZ-0007hE-UT
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:42:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:48091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nlSZX-0007nw-4V
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651484547; x=1683020547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ey4+eqM+ZYdWheIqQArMUacmAHU6mEiOk1SLXtJNInY=;
 b=iJ+SX7YcezNXxrd3VDxrJh3stclhXJ7xPSNkWqTdIlY631fqrUp5u5/s
 yyDbKlvThyqdgvuF7Tz0vUUlMS3R+bqWg5Uu/h9SRP5sB1ouJ5Tdd+JHb
 7aw63+3EVaceRq9Jq9+Y9V+o1PdunMZDlJcFc8G7GGbrGU6IeHavPQZOl
 3ldMprEyhOhJyX1XhLhJm286hnbjrFxzfzpj42wESrHfieSTifbSeIfaI
 fY7PajymXYkOjYu6wxHVCJOiUiPZW/yubDNsdHfs86xVpmZhI8SpBsYWi
 a8m22oMiaOP7nJ5X+LfFlAnDR9LJYf3U1M3MtqWbpj/TQJINyaB1qmLSs A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="353597172"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="353597172"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 02:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="561649593"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by orsmga007.jf.intel.com with ESMTP; 02 May 2022 02:42:23 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	qemu-devel@nongnu.org
Subject: [Patch 0/3] vfio: Misc cleanups
Date: Mon,  2 May 2022 02:42:20 -0700
Message-Id: <20220502094223.36384-1-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yi.l.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The three patches were part of iommufd RFC series, sent separately per
Kevin's suggestion.

https://lore.kernel.org/kvm/BN9PR11MB5276085CDF750807005A775B8CF39@BN9PR11MB5276.namprd11.prod.outlook.com/

Regards,
Yi Liu

Eric Auger (2):
  hw/vfio/pci: fix vfio_pci_hot_reset_result trace point
  vfio/pci: Use vbasedev local variable in vfio_realize()

Yi Liu (1):
  vfio/common: Rename VFIOGuestIOMMU::iommu into ::iommu_mr

 hw/vfio/common.c              | 16 +++++------
 hw/vfio/pci.c                 | 51 ++++++++++++++++++-----------------
 include/hw/vfio/vfio-common.h |  2 +-
 3 files changed, 35 insertions(+), 34 deletions(-)

-- 
2.27.0


