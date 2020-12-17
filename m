Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C92DCE73
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:35:00 +0100 (CET)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppgZ-0007Mv-EE
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1kppf5-00064c-9G; Thu, 17 Dec 2020 04:33:27 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1kppf3-00059a-0x; Thu, 17 Dec 2020 04:33:27 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CxRcC0ZZVz7Fjb;
 Thu, 17 Dec 2020 17:32:43 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Thu, 17 Dec 2020 17:33:11 +0800
From: chaihaoyu <chaihaoyu1@huawei.com>
Subject: [PATCH v1 3/3] block: "(foo*)" should be "(foo *)"
To: <qemu-block@nongnu.org>, <kwolf@redhat.com>
Message-ID: <d8303419-6419-0858-f16c-1685705179b5@huawei.com>
Date: Thu, 17 Dec 2020 17:33:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.54]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=chaihaoyu1@huawei.com;
 helo=szxga07-in.huawei.com
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error style problems found by checkpatch.pl, please review:
"(foo*)" should be "(foo *)"

Signed-off-by: Haoyu Chai<chaihaoyu1@huawei.com>

---
 block/curl.c         |  2 +-
 block/file-win32.c   |  2 +-
 block/qcow2.c        | 10 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 4f907c47be..d2d8d5d94b 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -251,7 +250,7 @@ static size_t curl_header_cb(void *ptr, size_t size, size_t nmemb, void *opaque)
 /* Called from curl_multi_do_locked, with s->mutex held.  */
 static size_t curl_read_cb(void *ptr, size_t size, size_t nmemb, void *opaque)
 {
-    CURLState *s = ((CURLState*)opaque);
+    CURLState *s = ((CURLState *)opaque);
     size_t realsize = size * nmemb;

     trace_curl_read_cb(realsize);
diff --git a/block/file-win32.c b/block/file-win32.c
index 2642088bd6..e3cca0fede 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -557,7 +560,7 @@ static int64_t raw_getlength(BlockDriverState *bs)
 static int64_t raw_get_allocated_file_size(BlockDriverState *bs)
 {
     typedef DWORD (WINAPI * get_compressed_t)(const char *filename,
-                                              DWORD * high);
+                                              DWORD *high);
     get_compressed_t get_compressed;
     struct _stati64 st;
     const char *filename = bs->filename;
diff --git a/block/qcow2.c b/block/qcow2.c
index b6cb4db8bb..2a06d70f2f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -269,7 +270,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,

         case QCOW2_EXT_MAGIC_FEATURE_TABLE:
             if (p_feature_table != NULL) {
-                void* feature_table = g_malloc0(ext.len + 2 * sizeof(Qcow2Feature));
+                void *feature_table = g_malloc0(ext.len + 2 * sizeof(Qcow2Feature));
                 ret = bdrv_pread(bs->file, offset , feature_table, ext.len);
                 if (ret < 0) {
                     error_setg_errno(errp, -ret, "ERROR: ext_feature_table: "
@@ -2748,7 +2749,7 @@ static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
 static size_t header_ext_add(char *buf, uint32_t magic, const void *s,
     size_t len, size_t buflen)
 {
-    QCowExtension *ext_backing_fmt = (QCowExtension*) buf;
+    QCowExtension *ext_backing_fmt = (QCowExtension *) buf;
     size_t ext_len = sizeof(QCowExtension) + ((len + 7) & ~7);

     if (buflen < ext_len) {
@@ -2790,7 +2791,7 @@ int qcow2_update_header(BlockDriverState *bs)
     buf = qemu_blockalign(bs, buflen);

     /* Header structure */
-    header = (QCowHeader*) buf;
+    header = (QCowHeader *) buf;

     if (buflen < sizeof(*header)) {
         ret = -ENOSPC;
@@ -3015,7 +3016,7 @@ int qcow2_update_header(BlockDriverState *bs)
         /* Using strncpy is ok here, since buf is not NUL-terminated. */
         strncpy(buf, s->image_backing_file, buflen);

-        header->backing_file_offset = cpu_to_be64(buf - ((char*) header));
+        header->backing_file_offset = cpu_to_be64(buf - ((char *) header));
         header->backing_file_size   = cpu_to_be32(backing_file_len);
     }

@@ -3374,7 +3375,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     size_t cluster_size;
     int version;
     int refcount_order;
-    uint64_t* refcount_table;
+    uint64_t *refcount_table;
     int ret;
     uint8_t compression_type = QCOW2_COMPRESSION_TYPE_ZLIB;

