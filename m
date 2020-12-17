Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4487F2DCE72
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:33:57 +0100 (CET)
Received: from localhost ([::1]:58880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppfX-0005zT-6b
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1kppeB-00054f-LY; Thu, 17 Dec 2020 04:32:31 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1kppe9-0004sw-0C; Thu, 17 Dec 2020 04:32:31 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CxRbG5Q2yzhsnp;
 Thu, 17 Dec 2020 17:31:54 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 17 Dec 2020 17:32:14 +0800
From: chaihaoyu <chaihaoyu1@huawei.com>
Subject: [PATCH v1 1/3] some space-style errors while coding
To: <qemu-block@nongnu.org>, <kwolf@redhat.com>
Message-ID: <5815fd0a-320a-09ee-4eea-2c2ca5caa7aa@huawei.com>
Date: Thu, 17 Dec 2020 17:32:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.54]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=chaihaoyu1@huawei.com;
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error style problems found by checkpatch.pl, please review:
some space-style errors while coding

Signed-off-by: Haoyu Chai<chaihaoyu1@huawei.com>

---
 block/bochs.c        | 10 ++++----
 block/cloop.c        |  2 +-
 block/curl.c         |  7 +++----
 block/dmg.c          |  4 +-
 block/file-posix.c   | 13 +++++-----
 block/file-win32.c   | 24 ++++++++--------
 block/parallels.c    | 10 +++---
 block/qcow2.c        | 2 +-
 softmmu/bootdevice.c |  4 +--
 9 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/block/bochs.c b/block/bochs.c
index 2f010ab40a..ff9d48162e 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -293,14 +295,14 @@ static void bochs_close(BlockDriverState *bs)
 }
 static BlockDriver bdrv_bochs = {
-    .format_name	= "bochs",
-    .instance_size	= sizeof(BDRVBochsState),
-    .bdrv_probe		= bochs_probe,
-    .bdrv_open		= bochs_open,
+    .format_name        = "bochs",
+    .instance_size      = sizeof(BDRVBochsState),
+    .bdrv_probe	        = bochs_probe,
+    .bdrv_open          = bochs_open,
     .bdrv_child_perm     = bdrv_default_perms,
     .bdrv_refresh_limits = bochs_refresh_limits,
     .bdrv_co_preadv = bochs_co_preadv,
-    .bdrv_close		= bochs_close,
+    .bdrv_close          = bochs_close,
     .is_format          = true,
 };
diff --git a/block/cloop.c b/block/cloop.c
index c99192a57f..e872caedb3 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -195,7 +195,7 @@ static int cloop_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->current_block = s->n_blocks;

-    s->sectors_per_block = s->block_size/512;
+    s->sectors_per_block = s->block_size / 512;
     bs->total_sectors = s->n_blocks * s->sectors_per_block;
     qemu_co_mutex_init(&s->lock);
     return 0;
diff --git a/block/curl.c b/block/curl.c
index 4f907c47be..d2d8d5d94b 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -102,8 +102,7 @@ typedef struct CURLSocket {
     QLIST_ENTRY(CURLSocket) next;
 } CURLSocket;

-typedef struct CURLState
-{
+typedef struct CURLState {
     struct BDRVCURLState *s;
     CURLAIOCB *acb[CURL_NUM_ACB];
     CURL *curl;
@@ -282,15 +281,17 @@ static bool curl_find_buf(BDRVCURLState *s, uint64_t start, uint64_t len,
     uint64_t clamped_end = MIN(end, s->len);
     uint64_t clamped_len = clamped_end - start;

-    for (i=0; i<CURL_NUM_STATES; i++) {
+    for (i = 0; i < CURL_NUM_STATES; i++) {
         CURLState *state = &s->states[i];
         uint64_t buf_end = (state->buf_start + state->buf_off);
         uint64_t buf_fend = (state->buf_start + state->buf_len);
@@ -320,7 +321,7 @@ static bool curl_find_buf(BDRVCURLState *s, uint64_t start, uint64_t len,
             acb->start = start - state->buf_start;
             acb->end = acb->start + clamped_len;

-            for (j=0; j<CURL_NUM_ACB; j++) {
+            for (j = 0; j < CURL_NUM_ACB; j++) {
                 if (!state->acb[j]) {
                     state->acb[j] = acb;
                     return true;
diff --git a/block/dmg.c b/block/dmg.c
index 0d6c317296..b0db135398 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -177,8 +177,8 @@ static int64_t dmg_find_koly_offset(BdrvChild *file, Error **errp)
         return ret;
     }
     for (i = 0; i < length - 3; i++) {
-        if (buffer[i] == 'k' && buffer[i+1] == 'o' &&
-            buffer[i+2] == 'l' && buffer[i+3] == 'y') {
+        if (buffer[i] == 'k' && buffer[i + 1] == 'o' &&
+            buffer[i + 2] == 'l' && buffer[i + 3] == 'y') {
             return offset + i;
         }
     }
diff --git a/block/file-posix.c b/block/file-posix.c
index c63926d592..7b9990e02a 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -79,7 +79,7 @@
 #if defined(CONFIG_FALLOCATE_PUNCH_HOLE) || defined(CONFIG_FALLOCATE_ZERO_RANGE)
 #include <linux/falloc.h>
 #endif
-#if defined (__FreeBSD__) || defined(__FreeBSD_kernel__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
 #include <sys/disk.h>
 #include <sys/cdio.h>
 #endif
@@ -125,7 +125,7 @@
 #define FTYPE_FILE   0
 #define FTYPE_CD     1

-#define MAX_BLOCKSIZE	4096
+#define MAX_BLOCKSIZE    4096

 /* Posix file locking bytes. Libvirt takes byte 0, we start from higher bytes,
  * leaving a few more bytes for its future use. */
@@ -2281,16 +2288,17 @@ static int64_t raw_getlength(BlockDriverState *bs)
     int fd = s->fd;
     int64_t size;
     struct stat sb;
-#if defined (__FreeBSD__) || defined(__FreeBSD_kernel__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
     int reopened = 0;
 #endif
     int ret;
-#if defined (__FreeBSD__) || defined(__FreeBSD_kernel__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
 again:
 #endif
     if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
@@ -2328,11 +2337,12 @@ again:
         }
 #endif
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
-        switch(s->type) {
+        switch (s->type) {
         case FTYPE_CD:
             /* XXX FreeBSD acd returns UINT_MAX sectors for an empty drive */
-            if (size == 2048LL * (unsigned)-1)
+            if (size == 2048LL * (unsigned)-1) {
                 size = 0;
+            }
             /* XXX no disc?  maybe we need to reopen... */
             if (size <= 0 && !reopened && cdrom_reopen(bs) >= 0) {
                 reopened = 1;
diff --git a/block/file-win32.c b/block/file-win32.c
index 2642088bd6..e3cca0fede 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -648,9 +651,9 @@ static QemuOptsList raw_create_opts = {
 };

 BlockDriver bdrv_file = {
-    .format_name	= "file",
-    .protocol_name	= "file",
-    .instance_size	= sizeof(BDRVRawState),
+    .format_name        = "file",
+    .protocol_name      = "file",
+    .instance_size      = sizeof(BDRVRawState),
     .bdrv_needs_filename = true,
     .bdrv_parse_filename = raw_parse_filename,
     .bdrv_file_open     = raw_open,
@@ -664,7 +667,7 @@ BlockDriver bdrv_file = {
     .bdrv_aio_flush     = raw_aio_flush,

     .bdrv_co_truncate   = raw_co_truncate,
-    .bdrv_getlength	= raw_getlength,
+    .bdrv_getlength     = raw_getlength,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,

@@ -681,9 +684,9 @@ static int find_cdrom(char *cdrom_name, int cdrom_name_size)

     memset(drives, 0, sizeof(drives));
     GetLogicalDriveStrings(sizeof(drives), drives);
-    while(pdrv[0] != '\0') {
+    while (pdrv[0] != '\0') {
         type = GetDriveType(pdrv);
-        switch(type) {
+        switch (type) {
         case DRIVE_CDROM:
             snprintf(cdrom_name, cdrom_name_size, "\\\\.\\%c:", pdrv[0]);
             return 0;
@@ -816,14 +820,14 @@ done:
 }

 static BlockDriver bdrv_host_device = {
-    .format_name	= "host_device",
-    .protocol_name	= "host_device",
-    .instance_size	= sizeof(BDRVRawState),
+    .format_name        = "host_device",
+    .protocol_name      = "host_device",
+    .instance_size      = sizeof(BDRVRawState),
     .bdrv_needs_filename = true,
     .bdrv_parse_filename = hdev_parse_filename,
-    .bdrv_probe_device	= hdev_probe_device,
-    .bdrv_file_open	= hdev_open,
-    .bdrv_close		= raw_close,
+    .bdrv_probe_device  = hdev_probe_device,
+    .bdrv_file_open     = hdev_open,
+    .bdrv_close	        = raw_close,
     .bdrv_refresh_limits = hdev_refresh_limits,

     .bdrv_aio_preadv    = raw_aio_preadv,
diff --git a/block/parallels.c b/block/parallels.c
index 3c22dfdc9d..aaae73426a 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -898,11 +898,11 @@ static void parallels_close(BlockDriverState *bs)
 }

 static BlockDriver bdrv_parallels = {
-    .format_name	= "parallels",
-    .instance_size	= sizeof(BDRVParallelsState),
-    .bdrv_probe		= parallels_probe,
-    .bdrv_open		= parallels_open,
-    .bdrv_close		= parallels_close,
+    .format_name        = "parallels",
+    .instance_size      = sizeof(BDRVParallelsState),
+    .bdrv_probe	        = parallels_probe,
+    .bdrv_open	        = parallels_open,
+    .bdrv_close	        = parallels_close,
     .bdrv_child_perm          = bdrv_default_perms,
     .bdrv_co_block_status     = parallels_co_block_status,
     .bdrv_has_zero_init       = bdrv_has_zero_init_1,
diff --git a/block/qcow2.c b/block/qcow2.c
index b6cb4db8bb..2a06d70f2f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1580,7 +1581,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
             error_setg_errno(errp, -ret, "Could not read L1 table");
             goto fail;
         }
-        for(i = 0;i < s->l1_size; i++) {
+        for(i = 0; i < s->l1_size; i++) {
             s->l1_table[i] = be64_to_cpu(s->l1_table[i]);
         }
     }
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
-- 
2.29.1.59.gf9b6481aed

