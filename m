Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F2B47BB9B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:18:07 +0100 (CET)
Received: from localhost ([::1]:36948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzaLX-0005tn-0s
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mzaIQ-00025H-W3
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:14:55 -0500
Received: from mga01.intel.com ([192.55.52.88]:26357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mzaIO-0001qo-KV
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:14:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640074492; x=1671610492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V+tPcmHHd0bjVnF6xwwBrWjngmBXrdwa04+GBmdskyc=;
 b=gFOD1jNayO/xi6cUV4tyiwWiCFL0032JmcQQlFzJ0aVMjq3m2+isNEgd
 7nrIMtB5zyg7suvq14bHCFY7Z9MXGTywNx6tbE8qI5KYsieBHOC79h9vL
 5B5KSX9ehH6JeqFDdg/TTpZrwvX5LxVUH0EjOZCzRwkcuQ7m05fg3AUUb
 xfmuNlD/kbnTsiU1FeE/GvQ38z5dB+WJlgMyzP+mAK+j4FbQIj3uApO8t
 nf/wveNLgQwwBrS++XZ6Y+J6miqp4ds0FmJBvNfRTidnmfBQfw3HKabYN
 4RDgvI5Q3EeJJ6O4JfySRJBibFG43OQ4N2BlxTD1zR2J4q/iSHWJ5bNCN w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="264538655"
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; d="scan'208";a="264538655"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 00:14:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; d="scan'208";a="684583562"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 00:14:48 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH] MAINTAINERS: Update COLO Proxy section
Date: Tue, 21 Dec 2021 16:04:00 +0800
Message-Id: <20211221080400.1492980-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1de6ce6e44..5479b9376e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2983,6 +2983,7 @@ F: docs/colo-proxy.txt
 F: net/colo*
 F: net/filter-rewriter.c
 F: net/filter-mirror.c
+F: tests/qtest/test-filter*
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
-- 
2.25.1


