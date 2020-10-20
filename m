Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3D029338A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 05:18:05 +0200 (CEST)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUiA0-0006X5-9Z
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 23:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kUi4H-0000FC-TR; Mon, 19 Oct 2020 23:12:09 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42920 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kUi4E-0005Cx-Fb; Mon, 19 Oct 2020 23:12:09 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EB88F645E52794F0B16F;
 Tue, 20 Oct 2020 11:11:59 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 11:11:54 +0800
From: Bihong Yu <yubihong@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 3/8] migration: Add spaces around operator
Date: Tue, 20 Oct 2020 11:10:43 +0800
Message-ID: <1603163448-27122-4-git-send-email-yubihong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
References: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 22:24:46
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
 dgilbert@redhat.com, armbru@redhat.com, alex.chen@huawei.com,
 wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Bihong Yu <yubihong@huawei.com>
Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c    |  4 ++--
 migration/postcopy-ram.c |  2 +-
 migration/ram.c          |  2 +-
 migration/savevm.c       |  2 +-
 migration/vmstate.c      | 10 +++++-----
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 0575ecb..e050f57 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2478,8 +2478,8 @@ static void migrate_handle_rp_req_pages(MigrationState *ms, const char* rbname,
      * Since we currently insist on matching page sizes, just sanity check
      * we're being asked for whole host pages.
      */
-    if (start & (our_host_ps-1) ||
-       (len & (our_host_ps-1))) {
+    if (start & (our_host_ps - 1) ||
+       (len & (our_host_ps - 1))) {
         error_report("%s: Misaligned page request, start: " RAM_ADDR_FMT
                      " len: %zd", __func__, start, len);
         mark_source_rp_bad(ms);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 0a2f88a8..eea92bb 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -403,7 +403,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
                      strerror(errno));
         goto out;
     }
-    g_assert(((size_t)testarea & (pagesize-1)) == 0);
+    g_assert(((size_t)testarea & (pagesize - 1)) == 0);
 
     reg_struct.range.start = (uintptr_t)testarea;
     reg_struct.range.len = pagesize;
diff --git a/migration/ram.c b/migration/ram.c
index 6ed4f9e..0aea78f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1563,7 +1563,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
         rs->last_req_rb = ramblock;
     }
     trace_ram_save_queue_pages(ramblock->idstr, start, len);
-    if (start+len > ramblock->used_length) {
+    if (start + len > ramblock->used_length) {
         error_report("%s request overrun start=" RAM_ADDR_FMT " len="
                      RAM_ADDR_FMT " blocklen=" RAM_ADDR_FMT,
                      __func__, start, len, ramblock->used_length);
diff --git a/migration/savevm.c b/migration/savevm.c
index d2e141f..b21f1c1 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -521,7 +521,7 @@ static const VMStateDescription vmstate_configuration = {
         VMSTATE_VBUFFER_ALLOC_UINT32(name, SaveState, 0, NULL, len),
         VMSTATE_END_OF_LIST()
     },
-    .subsections = (const VMStateDescription*[]) {
+    .subsections = (const VMStateDescription *[]) {
         &vmstate_target_page_bits,
         &vmstate_capabilites,
         &vmstate_uuid,
diff --git a/migration/vmstate.c b/migration/vmstate.c
index bafa890..e9d2aef 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -32,13 +32,13 @@ static int vmstate_n_elems(void *opaque, const VMStateField *field)
     if (field->flags & VMS_ARRAY) {
         n_elems = field->num;
     } else if (field->flags & VMS_VARRAY_INT32) {
-        n_elems = *(int32_t *)(opaque+field->num_offset);
+        n_elems = *(int32_t *)(opaque + field->num_offset);
     } else if (field->flags & VMS_VARRAY_UINT32) {
-        n_elems = *(uint32_t *)(opaque+field->num_offset);
+        n_elems = *(uint32_t *)(opaque + field->num_offset);
     } else if (field->flags & VMS_VARRAY_UINT16) {
-        n_elems = *(uint16_t *)(opaque+field->num_offset);
+        n_elems = *(uint16_t *)(opaque + field->num_offset);
     } else if (field->flags & VMS_VARRAY_UINT8) {
-        n_elems = *(uint8_t *)(opaque+field->num_offset);
+        n_elems = *(uint8_t *)(opaque + field->num_offset);
     }
 
     if (field->flags & VMS_MULTIPLY_ELEMENTS) {
@@ -54,7 +54,7 @@ static int vmstate_size(void *opaque, const VMStateField *field)
     int size = field->size;
 
     if (field->flags & VMS_VBUFFER) {
-        size = *(int32_t *)(opaque+field->size_offset);
+        size = *(int32_t *)(opaque + field->size_offset);
         if (field->flags & VMS_MULTIPLY) {
             size *= field->size;
         }
-- 
1.8.3.1


