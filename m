Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6846E28B4BE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 14:39:24 +0200 (CEST)
Received: from localhost ([::1]:56980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRx6p-00057c-FI
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 08:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRx4u-0003Aq-Lz; Mon, 12 Oct 2020 08:37:24 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5224 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRx4r-0007ZG-8l; Mon, 12 Oct 2020 08:37:24 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 05A8AB9B8AE5C97E78FB;
 Mon, 12 Oct 2020 20:37:04 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 12 Oct 2020
 20:36:54 +0800
From: Bihong Yu <yubihong@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 1/8] migration: Do not use C99 // comments
Date: Mon, 12 Oct 2020 21:08:53 +0800
Message-ID: <1602508140-11372-2-git-send-email-yubihong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 07:12:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: yubihong@huawei.com, zhengchuan@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Bihong Yu <yubihong@huawei.com>
Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/block.c | 2 +-
 migration/rdma.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 737b649..4b8576b 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -40,7 +40,7 @@
 #define MAX_IO_BUFFERS 512
 #define MAX_PARALLEL_IO 16
 
-//#define DEBUG_BLK_MIGRATION
+/* #define DEBUG_BLK_MIGRATION */
 
 #ifdef DEBUG_BLK_MIGRATION
 #define DPRINTF(fmt, ...) \
diff --git a/migration/rdma.c b/migration/rdma.c
index 0340841..0eb42b7 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1288,7 +1288,7 @@ const char *print_wrid(int wrid)
  * workload information or LRU information is available, do not attempt to use
  * this feature except for basic testing.
  */
-//#define RDMA_UNREGISTRATION_EXAMPLE
+/* #define RDMA_UNREGISTRATION_EXAMPLE */
 
 /*
  * Perform a non-optimized memory unregistration after every transfer
-- 
1.8.3.1


