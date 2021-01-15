Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9FA2F7149
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 04:58:09 +0100 (CET)
Received: from localhost ([::1]:59450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0GFT-0006xy-Um
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 22:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GDD-0006UT-Td
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:55:47 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GDB-0004Hn-OB
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:55:47 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DH6km4zhMzj7RN;
 Fri, 15 Jan 2021 11:54:40 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Fri, 15 Jan 2021 11:55:35 +0800
Subject: [PATCH v2 1/5] softmmu: fix problems about spaces
From: chaihaoyu <chaihaoyu1@huawei.com>
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <aaa530f5-b7ec-3198-a80b-efb88de20c6c@huawei.com>
Message-ID: <4f1ef805-d1de-26e7-d0b6-3f443a1f7c4a@huawei.com>
Date: Fri, 15 Jan 2021 11:55:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <aaa530f5-b7ec-3198-a80b-efb88de20c6c@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.54]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=chaihaoyu1@huawei.com; helo=szxga05-in.huawei.com
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
Cc: alex.chen@huawei.com, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error messages found by checkpatch.pl:
fix problems about spaces:

Signed-off-by: Haoyu Chai <chaihaoyu1@huawei.com>

---
 softmmu/bootdevice.c   |  4 ++--
 softmmu/memory.c       | 16 ++++++++--------
 softmmu/qdev-monitor.c |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/softmmu/bootdevice.c b/softmmu/bootdevice.c
index add4e3d2d1..4edb80de8c 100644
--- a/softmmu/bootdevice.c
+++ b/softmmu/bootdevice.c
@@ -257,7 +257,7 @@ char *get_boot_devices_list(size_t *size)
         bootpath = get_boot_device_path(i->dev, ignore_suffixes, i->suffix);

         if (total) {
-            list[total-1] = '\n';
+            list[total - 1] = '\n';
         }
         len = strlen(bootpath) + 1;
         list = g_realloc(list, total + len);
@@ -269,7 +269,7 @@ char *get_boot_devices_list(size_t *size)
     *size = total;

     if (boot_strict && *size > 0) {
-        list[total-1] = '\n';
+        list[total - 1] = '\n';
         list = g_realloc(list, total + 5);
         memcpy(&list[total], "HALT", 5);
         *size = total + 5;
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 333e1ed7b0..2d346b9de4 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -336,7 +336,7 @@ static void flatview_simplify(FlatView *view)
     while (i < view->nr) {
         j = i + 1;
         while (j < view->nr
-               && can_merge(&view->ranges[j-1], &view->ranges[j])) {
+               && can_merge(&view->ranges[j - 1], &view->ranges[j])) {
             int128_addto(&view->ranges[i].addr.size, view->ranges[j].addr.size);
             ++j;
         }
@@ -841,8 +841,8 @@ static void address_space_update_ioeventfds(AddressSpace *as)
                     ioeventfds = g_realloc(ioeventfds,
                             ioeventfd_max * sizeof(*ioeventfds));
                 }
-                ioeventfds[ioeventfd_nb-1] = fr->mr->ioeventfds[i];
-                ioeventfds[ioeventfd_nb-1].addr = tmp;
+                ioeventfds[ioeventfd_nb - 1] = fr->mr->ioeventfds[i];
+                ioeventfds[ioeventfd_nb - 1].addr = tmp;
             }
         }
     }
@@ -2371,8 +2371,8 @@ void memory_region_add_eventfd(MemoryRegion *mr,
     ++mr->ioeventfd_nb;
     mr->ioeventfds = g_realloc(mr->ioeventfds,
                                   sizeof(*mr->ioeventfds) * mr->ioeventfd_nb);
-    memmove(&mr->ioeventfds[i+1], &mr->ioeventfds[i],
-            sizeof(*mr->ioeventfds) * (mr->ioeventfd_nb-1 - i));
+    memmove(&mr->ioeventfds[i + 1], &mr->ioeventfds[i],
+            sizeof(*mr->ioeventfds) * (mr->ioeventfd_nb - 1 - i));
     mr->ioeventfds[i] = mrfd;
     ioeventfd_update_pending |= mr->enabled;
     memory_region_transaction_commit();
@@ -2404,11 +2404,11 @@ void memory_region_del_eventfd(MemoryRegion *mr,
         }
     }
     assert(i != mr->ioeventfd_nb);
-    memmove(&mr->ioeventfds[i], &mr->ioeventfds[i+1],
-            sizeof(*mr->ioeventfds) * (mr->ioeventfd_nb - (i+1)));
+    memmove(&mr->ioeventfds[i], &mr->ioeventfds[i + 1],
+            sizeof(*mr->ioeventfds) * (mr->ioeventfd_nb - (i + 1)));
     --mr->ioeventfd_nb;
     mr->ioeventfds = g_realloc(mr->ioeventfds,
-                                  sizeof(*mr->ioeventfds)*mr->ioeventfd_nb + 1);
+                                  sizeof(*mr->ioeventfds) * mr->ioeventfd_nb + 1);
     ioeventfd_update_pending |= mr->enabled;
     memory_region_transaction_commit();
 }
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 8dc656becc..a681d6a4e8 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -501,7 +501,7 @@ static BusState *qbus_find(const char *path, Error **errp)
         }

         /* find device */
-        if (sscanf(path+pos, "%127[^/]%n", elem, &len) != 1) {
+        if (sscanf(path + pos, "%127[^/]%n", elem, &len) != 1) {
             g_assert_not_reached();
             elem[0] = len = 0;
         }
@@ -536,7 +536,7 @@ static BusState *qbus_find(const char *path, Error **errp)
         }

         /* find bus */
-        if (sscanf(path+pos, "%127[^/]%n", elem, &len) != 1) {
+        if (sscanf(path + pos, "%127[^/]%n", elem, &len) != 1) {
             g_assert_not_reached();
             elem[0] = len = 0;
         }
-- 
2.29.1.59.gf9b6481aed

