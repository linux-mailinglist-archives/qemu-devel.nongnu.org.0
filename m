Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC185327732
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 06:44:23 +0100 (CET)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGbLy-0004yT-UX
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 00:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lGbKb-0003oA-BQ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 00:42:57 -0500
Received: from mga12.intel.com ([192.55.52.136]:2504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lGbKY-00029h-VS
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 00:42:56 -0500
IronPort-SDR: VdJ4nCIvl8CU4O1yJ45T/X9a05l6HgW30yQDDx/aJ3HD3wiBYnnFA9RScneTorVQ8DT9Yo5+9y
 Ix1Sug9y0PVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="165595209"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; d="scan'208";a="165595209"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 21:42:48 -0800
IronPort-SDR: yWQz9wywHVjyrWJJzX2ua1o+S6yGXeZOeq2fvQm7SfRq+A0Sxw7+zEFKHRHQhSyx11vSxz2S25
 lqrWBb6h+0rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; d="scan'208";a="397524153"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2021 21:42:46 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Expose AVX_VNNI instruction to guset
Date: Mon,  1 Mar 2021 13:15:51 +0800
Message-Id: <20210301051552.84828-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yang.zhong@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch will expose AVX_VNNI features to the guest. The related
kvm/kernel patches series have been queued as below link:
https://lore.kernel.org/kvm/eee07399-df81-83ed-d410-18b42d51e26c@redhat.com/


Yang Zhong (1):
  i386/cpu: Expose AVX_VNNI instruction to guset

 target/i386/cpu.c | 4 ++--
 target/i386/cpu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.29.2.334.gfaefdd61ec


