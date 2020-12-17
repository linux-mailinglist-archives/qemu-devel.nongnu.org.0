Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218BD2DCE74
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:35:40 +0100 (CET)
Received: from localhost ([::1]:35216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpph9-0007u5-Pk
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1kppeC-00055g-I9; Thu, 17 Dec 2020 04:32:32 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1kppe9-0004sv-Pd; Thu, 17 Dec 2020 04:32:32 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CxRZv6mcczkqhd;
 Thu, 17 Dec 2020 17:31:35 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Thu, 17 Dec 2020 17:32:16 +0800
From: chaihaoyu <chaihaoyu1@huawei.com>
Subject: [PATCH v1 2/3]block: braces {} are necessary for all arms of this
 statement
To: <qemu-block@nongnu.org>, <kwolf@redhat.com>
Message-ID: <ab864a2f-33d9-d095-ea48-be3837e3a096@huawei.com>
Date: Thu, 17 Dec 2020 17:32:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.54]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=chaihaoyu1@huawei.com; helo=szxga04-in.huawei.com
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
braces {} are necessary for all arms of this statement

Signed-off-by: Haoyu Chai<chaihaoyu1@huawei.com>

---
 block/bochs.c        |  6 ++-
 block/commit.c       |  3 +-
 block/curl.c         | 15 +++--
 block/file-posix.c   | 27 ++++++---
 block/file-win32.c   | 17 ++++--
 block/qcow2.c        | 3 +-
 6 files changed, 47 insertions(+), 24 deletions(-)

diff --git a/block/bochs.c b/block/bochs.c
index 2f010ab40a..ff9d48162e 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -83,8 +83,9 @@ static int bochs_probe(const uint8_t *buf, int buf_size, const char *filename)
 {
     const struct bochs_header *bochs = (const void *)buf;

-    if (buf_size < HEADER_SIZE)
+    if (buf_size < HEADER_SIZE) {
         return 0;
+    }

     if (!strcmp(bochs->magic, HEADER_MAGIC) &&
         !strcmp(bochs->type, REDOLOG_TYPE) &&
@@ -156,8 +157,9 @@ static int bochs_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }

-    for (i = 0; i < s->catalog_size; i++)
+    for (i = 0; i < s->catalog_size; i++) {
         le32_to_cpus(&s->catalog_bitmap[i]);
+    }

     s->data_offset = le32_to_cpu(bochs.header) + (s->catalog_size * 4);
diff --git a/block/commit.c b/block/commit.c
index 1e85c306cc..727037a5d0 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -439,8 +439,9 @@ int bdrv_commit(BlockDriverState *bs)
     uint8_t *buf = NULL;
     Error *local_err = NULL;

-    if (!drv)
+    if (!drv) {
         return -ENOMEDIUM;
+    }

     backing_file_bs = bdrv_cow_bs(bs);
diff --git a/block/curl.c b/block/curl.c
index 4f907c47be..d2d8d5d94b 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -282,15 +281,17 @@ static bool curl_find_buf(BDRVCURLState *s, uint64_t start, uint64_t len,
     uint64_t clamped_end = MIN(end, s->len);
     uint64_t clamped_len = clamped_end - start;

-        if (!state->orig_buf)
+        if (!state->orig_buf) {
             continue;
-        if (!state->buf_off)
+        }
+        if (!state->buf_off) {
             continue;
+        }

         // Does the existing buffer cover our section?
         if ((start >= state->buf_start) &&
@@ -344,8 +345,9 @@ static void curl_multi_check_completion(BDRVCURLState *s)
         msg = curl_multi_info_read(s->multi, &msgs_in_queue);

         /* Quit when there are no more completions */
-        if (!msg)
+        if (!msg) {
             break;
+        }

         if (msg->msg == CURLMSG_DONE) {
             int i;
@@ -538,8 +540,9 @@ static void curl_clean_state(CURLState *s)
         assert(!s->acb[j]);
     }

-    if (s->s->multi)
+    if (s->s->multi) {
         curl_multi_remove_handle(s->s->multi, s->curl);
+    }

     while (!QLIST_EMPTY(&s->sockets)) {
         CURLSocket *socket = QLIST_FIRST(&s->sockets);
@@ -791,8 +794,9 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     curl_easy_setopt(state->curl, CURLOPT_HEADERFUNCTION,
                      curl_header_cb);
     curl_easy_setopt(state->curl, CURLOPT_HEADERDATA, s);
-    if (curl_easy_perform(state->curl))
+    if (curl_easy_perform(state->curl)) {
         goto out;
+    }
     if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d)) {
         goto out;
     }
diff --git a/block/file-posix.c b/block/file-posix.c
index c63926d592..7b9990e02a 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1978,8 +1978,9 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;

-    if (fd_open(bs) < 0)
+    if (fd_open(bs) < 0) {
         return -EIO;
+    }

     /*
      * When using O_DIRECT, the request must be aligned to be able to use
@@ -2206,17 +2207,20 @@ static int64_t raw_getlength(BlockDriverState *bs)
     int fd = s->fd;
     struct stat st;

-    if (fstat(fd, &st))
+    if (fstat(fd, &st)) {
         return -errno;
+    }
     if (S_ISCHR(st.st_mode) || S_ISBLK(st.st_mode)) {
         struct disklabel dl;

-        if (ioctl(fd, DIOCGDINFO, &dl))
+        if (ioctl(fd, DIOCGDINFO, &dl)) {
             return -errno;
+        }
         return (uint64_t)dl.d_secsize *
             dl.d_partitions[DISKPART(st.st_rdev)].p_size;
-    } else
+    } else {
         return st.st_size;
+    }
 }
 #elif defined(__NetBSD__)
 static int64_t raw_getlength(BlockDriverState *bs)
@@ -2225,8 +2229,9 @@ static int64_t raw_getlength(BlockDriverState *bs)
     int fd = s->fd;
     struct stat st;

-    if (fstat(fd, &st))
+    if (fstat(fd, &st)) {
         return -errno;
+    }
     if (S_ISCHR(st.st_mode) || S_ISBLK(st.st_mode)) {
         struct dkwedge_info dkw;

@@ -2235,13 +2240,15 @@ static int64_t raw_getlength(BlockDriverState *bs)
         } else {
             struct disklabel dl;

-            if (ioctl(fd, DIOCGDINFO, &dl))
+            if (ioctl(fd, DIOCGDINFO, &dl)) {
                 return -errno;
+            }
             return (uint64_t)dl.d_secsize *
                 dl.d_partitions[DISKPART(st.st_rdev)].p_size;
         }
-    } else
+    } else {
         return st.st_size;
+    }
 }
 #elif defined(__sun__)
 static int64_t raw_getlength(BlockDriverState *bs)
@@ -2281,16 +2288,17 @@ static int64_t raw_getlength(BlockDriverState *bs)
     ret = fd_open(bs);
-    if (ret < 0)
+    if (ret < 0) {
         return ret;
+    }
@@ -2298,11 +2306,12 @@ again:
         if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
 #elif defined(DIOCGPART)
         {
-                struct partinfo pi;
-                if (ioctl(fd, DIOCGPART, &pi) == 0)
-                        size = pi.media_size;
-                else
-                        size = 0;
+            struct partinfo pi;
+            if (ioctl(fd, DIOCGPART, &pi) == 0) {
+                size = pi.media_size;
+            } else {
+                size = 0;
+            }
         }
         if (size == 0)
 #endif
@@ -2328,11 +2337,12 @@ again:
         }
 #endif
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
         switch(s->type) {
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
@@ -175,8 +175,9 @@ int qemu_ftruncate64(int fd, int64_t length)
     HANDLE h;
     BOOL res;

-    if ((GetVersion() & 0x80000000UL) && (length >> 32) != 0)
+    if ((GetVersion() & 0x80000000UL) && (length >> 32) != 0) {
         return -1;
+    }

     h = (HANDLE)_get_osfhandle(fd);
@@ -530,15 +531,17 @@ static int64_t raw_getlength(BlockDriverState *bs)
     DWORD count;
     BOOL status;

-    switch(s->type) {
+    switch (s->type) {
     case FTYPE_FILE:
-        l.LowPart = GetFileSize(s->hfile, (PDWORD)&l.HighPart);
-        if (l.LowPart == 0xffffffffUL && GetLastError() != NO_ERROR)
+        l.LowPart = GetFileSize(s->hfile, (PDWORD) & l.HighPart);
+        if (l.LowPart == 0xffffffffUL && GetLastError() != NO_ERROR) {
             return -EIO;
+        }
         break;
     case FTYPE_CD:
-        if (!GetDiskFreeSpaceEx(s->drive_path, &available, &total, &total_free))
+        if (!GetDiskFreeSpaceEx(s->drive_path, &available, &total, &total_free)) {
             return -EIO;
+        }
         l.QuadPart = total.QuadPart;
         break;
     case FTYPE_HARDDISK:
@@ -702,8 +705,9 @@ static int find_device_type(BlockDriverState *bs, const char *filename)

     if (strstart(filename, "\\\\.\\", &p) ||
         strstart(filename, "//./", &p)) {
-        if (stristart(p, "PhysicalDrive", NULL))
+        if (stristart(p, "PhysicalDrive", NULL)) {
             return FTYPE_HARDDISK;
+        }
         snprintf(s->drive_path, sizeof(s->drive_path), "%c:\\", p[0]);
         type = GetDriveType(s->drive_path);
         switch (type) {
diff --git a/block/qcow2.c b/block/qcow2.c
index b6cb4db8bb..2a06d70f2f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -220,8 +220,9 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,

 #ifdef DEBUG_EXT
         /* Sanity check */
-        if (offset > s->cluster_size)
+        if (offset > s->cluster_size) {
             printf("qcow2_read_extension: suspicious offset %lu\n", offset);
+        }

         printf("attempting to read extended header in offset %lu\n", offset);
 #endif

