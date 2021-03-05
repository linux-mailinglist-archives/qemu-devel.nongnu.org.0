Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF75032E33D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 08:55:16 +0100 (CET)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI5Ip-0003BT-RP
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 02:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lI5H5-0002JW-PW
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 02:53:27 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lI5H4-0007xe-12
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 02:53:27 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DsKgZ6g5TzjW7y;
 Fri,  5 Mar 2021 15:51:38 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Fri, 5 Mar 2021 15:53:14 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: David Edmondson <dme@dme.org>, Juan Quintela <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Andrey Gruzdev
 <andrey.gruzdev@virtuozzo.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Alexey Romko
 <nevilad@yahoo.com>, "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/3] migration/ram: Modify the code comment of
 ram_save_host_page()
Date: Fri, 5 Mar 2021 15:50:33 +0800
Message-ID: <20210305075035.1852-2-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210305075035.1852-1-jiangkunkun@huawei.com>
References: <20210305075035.1852-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=jiangkunkun@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ram_save_host_page() has been modified several times
since its birth. But the comment hasn't been modified as it should
be. It'd better to modify the comment to explain ram_save_host_page()
more clearly.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 migration/ram.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 72143da0ac..a168da5cdd 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1970,15 +1970,13 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
 }
 
 /**
- * ram_save_host_page: save a whole host page
+ * ram_save_host_page: save a whole host page or the rest of a RAMBlock
  *
- * Starting at *offset send pages up to the end of the current host
- * page. It's valid for the initial offset to point into the middle of
- * a host page in which case the remainder of the hostpage is sent.
- * Only dirty target pages are sent. Note that the host page size may
- * be a huge page for this block.
- * The saving stops at the boundary of the used_length of the block
- * if the RAMBlock isn't a multiple of the host page size.
+ * Send dirty pages between pss->page and either the end of that page
+ * or the used_length of the RAMBlock, whichever is smaller.
+ *
+ * Note that if the host page is a huge page, pss->page may be in the
+ * middle of that page.
  *
  * Returns the number of pages written or negative on error
  *
@@ -2002,7 +2000,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
     }
 
     do {
-        /* Check the pages is dirty and if it is send it */
+        /* Check if the page is dirty and send it if it is */
         if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
             pss->page++;
             continue;
-- 
2.23.0


