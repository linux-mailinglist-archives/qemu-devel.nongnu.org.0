Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8AF29CF1E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 10:08:28 +0100 (CET)
Received: from localhost ([::1]:36520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXhRT-0002BM-FD
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 05:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kXhQE-0000nB-If; Wed, 28 Oct 2020 05:07:10 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kXhQB-0002mh-BX; Wed, 28 Oct 2020 05:07:10 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CLjPX53mLzhbQt;
 Wed, 28 Oct 2020 17:06:56 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 28 Oct 2020
 17:06:42 +0800
From: jokenzhang <zhangxinhao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/3] hw/9pfs : add spaces around operator
Date: Wed, 28 Oct 2020 17:05:38 +0800
Message-ID: <20201028090540.1070935-1-zhangxinhao1@huawei.com>
X-Mailer: git-send-email 2.29.0-rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhangxinhao1@huawei.com; helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 05:06:54
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, dengkai1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: jokenzhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
Reported-by: Euler Robot <euler.robot@huawei.com>
---
 hw/9pfs/9p-local.c | 10 +++++-----
 hw/9pfs/9p.c       | 16 ++++++++--------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 3107637209..af52c1daac 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -162,13 +162,13 @@ static void local_mapped_file_attr(int dirfd, const char *name,
     memset(buf, 0, ATTR_MAX);
     while (fgets(buf, ATTR_MAX, fp)) {
         if (!strncmp(buf, "virtfs.uid", 10)) {
-            stbuf->st_uid = atoi(buf+11);
+            stbuf->st_uid = atoi(buf + 11);
         } else if (!strncmp(buf, "virtfs.gid", 10)) {
-            stbuf->st_gid = atoi(buf+11);
+            stbuf->st_gid = atoi(buf + 11);
         } else if (!strncmp(buf, "virtfs.mode", 11)) {
-            stbuf->st_mode = atoi(buf+12);
+            stbuf->st_mode = atoi(buf + 12);
         } else if (!strncmp(buf, "virtfs.rdev", 11)) {
-            stbuf->st_rdev = atoi(buf+12);
+            stbuf->st_rdev = atoi(buf + 12);
         }
         memset(buf, 0, ATTR_MAX);
     }
@@ -823,7 +823,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
         if (fd == -1) {
             goto out;
         }
-        credp->fc_mode = credp->fc_mode|S_IFREG;
+        credp->fc_mode = credp->fc_mode | S_IFREG;
         if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
             /* Set cleint credentials in xattr */
             err = local_set_xattrat(dirfd, name, credp);
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 741d222c3f..94df440fc7 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1091,7 +1091,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
         }
     }
 
-    if (!(ret&~0777)) {
+    if (!(ret & ~0777)) {
         ret |= S_IFREG;
     }
 
@@ -2776,7 +2776,7 @@ static void coroutine_fn v9fs_create(void *opaque)
         v9fs_path_unlock(s);
     } else {
         err = v9fs_co_open2(pdu, fidp, &name, -1,
-                            omode_to_uflags(mode)|O_CREAT, perm, &stbuf);
+                            omode_to_uflags(mode) | O_CREAT, perm, &stbuf);
         if (err < 0) {
             goto out;
         }
@@ -3428,7 +3428,7 @@ static int v9fs_fill_statfs(V9fsState *s, V9fsPDU *pdu, struct statfs *stbuf)
      * compute bsize factor based on host file system block size
      * and client msize
      */
-    bsize_factor = (s->msize - P9_IOHDRSZ)/stbuf->f_bsize;
+    bsize_factor = (s->msize - P9_IOHDRSZ) / stbuf->f_bsize;
     if (!bsize_factor) {
         bsize_factor = 1;
     }
@@ -3440,9 +3440,9 @@ static int v9fs_fill_statfs(V9fsState *s, V9fsPDU *pdu, struct statfs *stbuf)
      * adjust(divide) the number of blocks, free blocks and available
      * blocks by bsize factor
      */
-    f_blocks = stbuf->f_blocks/bsize_factor;
-    f_bfree  = stbuf->f_bfree/bsize_factor;
-    f_bavail = stbuf->f_bavail/bsize_factor;
+    f_blocks = stbuf->f_blocks / bsize_factor;
+    f_bfree  = stbuf->f_bfree / bsize_factor;
+    f_bavail = stbuf->f_bavail / bsize_factor;
     f_files  = stbuf->f_files;
     f_ffree  = stbuf->f_ffree;
     fsid_val = (unsigned int) stbuf->f_fsid.__val[0] |
@@ -4185,6 +4185,6 @@ static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
         error_report("Failed to get the resource limit");
         exit(1);
     }
-    open_fd_hw = rlim.rlim_cur - MIN(400, rlim.rlim_cur/3);
-    open_fd_rc = rlim.rlim_cur/2;
+    open_fd_hw = rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
+    open_fd_rc = rlim.rlim_cur / 2;
 }
-- 
2.29.0-rc1


