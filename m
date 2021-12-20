Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A9647A347
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 02:19:43 +0100 (CET)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mz7L4-00021m-Mu
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 20:19:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mz7IW-0000Ns-IR
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 20:17:04 -0500
Received: from mga01.intel.com ([192.55.52.88]:46571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mz7IT-0008OU-Pj
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 20:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639963021; x=1671499021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t5ikSlyPB3pvpKfS8XwSac3rEEMqzg/JB8Utc5zE5A8=;
 b=PTPWqeqKjZAFF1c+OU6ADDYV/WdfnYDNBHPx3KoiaIyTVIuzV/s7YOxW
 uJ2T3CWpXiiyfTrKLpMyPu7/wYz4ebz/H1ioWuQhyL7axZXp/q8EFHIQP
 IbMoWkF9qFjctRh4e49JqlYuUJO+BOobrB4mvSLJgTKCtXRGPbIquLwHY
 Q92P/nRiLWNVAcYjua8gfHGFWs5hSHAL8UgcUkhNu7fRh8uo+5KqNxx1K
 r2in8yCfVX1ZoFu16QanRPCb0phzQVJJZArbAoXiigruuIPYsu09pM6Re
 Qzco1sAuwhmjzqfRGo70bEq7PNmoz+zZ5RVAPRwNlranMMH3R7kl5Chpb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="264256328"
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; d="scan'208";a="264256328"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 17:16:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; d="scan'208";a="467211006"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 17:16:54 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH 2/2] net/colo-compare.c: Update the default value comments
Date: Mon, 20 Dec 2021 09:06:03 +0800
Message-Id: <20211220010603.1443843-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220010603.1443843-1-chen.zhang@intel.com>
References: <20211220010603.1443843-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.204,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the comments consistent with the REGULAR_PACKET_CHECK_MS.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 216de5a12b..62554b5b3c 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1267,7 +1267,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
     }
 
     if (!s->expired_scan_cycle) {
-        /* Set default value to 3000 MS */
+        /* Set default value to 1000 MS */
         s->expired_scan_cycle = REGULAR_PACKET_CHECK_MS;
     }
 
-- 
2.25.1


