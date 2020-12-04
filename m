Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2C82CE541
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 02:43:57 +0100 (CET)
Received: from localhost ([::1]:43788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl08a-0000Ti-5g
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 20:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kl07q-0008V6-09
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 20:43:10 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kl07n-0008BQ-6D
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 20:43:09 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CnFnn1TfYzhkkJ;
 Fri,  4 Dec 2020 09:42:37 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 09:42:49 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <alex.williamson@redhat.com>, <cohuck@redhat.com>, <kwankhede@nvidia.com>
Subject: [PATCH] vfio: Fix vfio_listener_log_sync function name typo
Date: Fri, 4 Dec 2020 09:42:40 +0800
Message-ID: <20201204014240.772-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=yuzenghui@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is an obvious typo in the function name of the .log_sync() callback.
Spell it correctly.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/vfio/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6ff1daa763..d360d6f2da 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1118,7 +1118,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
                        int128_get64(section->size), ram_addr);
 }
 
-static void vfio_listerner_log_sync(MemoryListener *listener,
+static void vfio_listener_log_sync(MemoryListener *listener,
         MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
@@ -1136,7 +1136,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
 static const MemoryListener vfio_memory_listener = {
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
-    .log_sync = vfio_listerner_log_sync,
+    .log_sync = vfio_listener_log_sync,
 };
 
 static void vfio_listener_release(VFIOContainer *container)
-- 
2.19.1


