Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D406C28B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 23:27:45 +0200 (CEST)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnrSh-00089X-Jz
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 17:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49573)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=09475cf9f=dmitry.fomichev@wdc.com>)
 id 1hnrSA-0006ou-Bu
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 17:27:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=09475cf9f=dmitry.fomichev@wdc.com>)
 id 1hnrS9-0006ys-35
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 17:27:10 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:14135)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=09475cf9f=dmitry.fomichev@wdc.com>)
 id 1hnrS8-0006yK-RD; Wed, 17 Jul 2019 17:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1563398828; x=1594934828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7tzlz4nS/NDt/He6kF5q4UiaEdfHTksSd4cZbWW1HH0=;
 b=h7Tg7m87VGpMy0vN5b8uXs7TCvprDSJY8lJSkePOCkdi8J87jua38IGu
 0a+oFc+O1BUA08NbVn7nDZIRkNDCDUyugAIr4pB948kaoWhGPN3sZX/b6
 nYSMu+hvEzFLUquntp0reY3H4Fcu2Kxbx/2HGhNlbDNWLavv6Q7Hl1Wio
 cthlnYjDndcaCdYkZjK1wFQvuL7I1hhHHFN2WeM3nYI+5piBkVtgptiLF
 Wh4lwq2Oa/XbmvMdgMqiR0QizcFpYfQoES6iN46MXtNDWQxOk9TyEio/8
 byAvryNjdr9EM2u5l+Rf7Fxe+yuvBl91bOforxY6Aa0M/EoYZm97gbOyH Q==;
IronPort-SDR: wERviknFKxYqyZhMfEQBhyuQCG2UVc6CD7WWHGlHqIwECmsB6f7rvqDeiWu6xvcL9LdbkA5n9q
 +dGB04RTUIouc/kpN4m0EAayg/NwN4rIrydCPHJU2zo34kzruH78/K3dunGsvlaVgdb/DjpkDz
 iVbBaKVISvsWRKE5e92omkU/RzOcseIfhs7/nQSE7Sv+FKnAVLiRPNT8T5DTh2pe54cHJUNohf
 B0lZd3RZTYdFNqy/anEiBpzxtl6xqE0X5BiYifLvVy8wCw06K8AX475QFZVydGMV5iBMTbSdQl
 OeY=
X-IronPort-AV: E=Sophos;i="5.64,275,1559491200"; d="scan'208";a="113319442"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jul 2019 05:27:06 +0800
IronPort-SDR: g75E7E9Kv5nQCzv+JH354dsHlsHtnRPb/e5lgAgrMJS6LQkrJq166YpsP+55FXswKby/JCYSLg
 WIThnHt6avF/EfaSPVpGwBtzhYE5o12s/kDVrLpDIWSLJmcG+mx92kjHFeZYawHn7H7i/j+YxU
 Qa4a91DCWE0TsPqJwKs0QkwMA0pZmvtCICUKIssmnJVHfafu8OM5Sdp19jpLOE9lcwe8a+pNhz
 fT4zP1CH4ceFcv9vfz1ucjv0DBv8ucDyjIgBOCRbXYCblnEUrhjVwwbflkmoeroDO/B0Fd6SFL
 y39PqCPio+dMt57hwGWwKBeL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 17 Jul 2019 14:25:33 -0700
IronPort-SDR: pWwyXjhgUXbkCIX7lh4UMF+0zpIC0c8DYI/n4O0d/QKrJXm4mtJE9bB8mKVVHLsjdC1zaR2NBu
 nnvkCZCMIZP4h3J825+CGrqO4AR0dQXewW+RuxnZE8Tz2IX2kEy1jp2SNQWKZhP8hnWmWxQ9yn
 9SPrt3AQ8Ot6vMSjpnJ+ijDtkVhDtxHO1wChhuG2uCFUvKqr4cJ2whO0k4BI/BnGbCAcVYBvW/
 gSP51fwPiCHmm8Wd1ES3fS4+PVI2fa+l4HiTiwpSJgG3V2i/WrDhAJwJehfn3vOGI4Gyyy2vk1
 FS8=
Received: from dhcp-10-88-173-43.hgst.com ([10.88.173.43])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jul 2019 14:27:06 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 17 Jul 2019 17:27:00 -0400
Message-Id: <20190717212703.10205-3-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190717212703.10205-1-dmitry.fomichev@wdc.com>
References: <20190717212703.10205-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.154.42
Subject: [Qemu-devel] [PATCH v2 2/5] raw: Recognize zoned backing devices
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of this patch is to recognize a zoned block device (ZBD)
when it is opened as a raw file. The new code initializes the zoned
model propery introduced by the previous commit.

This commit is Linux-specific as it gets the Zoned Block Device Model
value (none/host-managed/host-aware) from sysfs on the host.

In order to avoid code duplication in file-posix.c, a common helper
function is added to read values of sysfs entries under
/sys/block/<dev>/queue. This way, the existing function that reads
the value of "max_segments" entry and the the new function that reads
"zoned" value both share the same helper code.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 block/file-posix.c | 74 ++++++++++++++++++++++++++++++++++++++--------
 block/raw-format.c |  8 +++++
 2 files changed, 70 insertions(+), 12 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 4479cc7ab4..e307cab7a4 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1053,15 +1053,13 @@ static int sg_get_max_transfer_length(int fd)
 #endif
 }
 
-static int sg_get_max_segments(int fd)
+static int hdev_read_blk_queue_entry(int fd, const char *key,
+    char *buf, int buf_len)
 {
 #ifdef CONFIG_LINUX
-    char buf[32];
-    const char *end;
     char *sysfspath = NULL;
     int ret;
     int sysfd = -1;
-    long max_segments;
     struct stat st;
 
     if (fstat(fd, &st)) {
@@ -1069,23 +1067,45 @@ static int sg_get_max_segments(int fd)
         goto out;
     }
 
-    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
-                                major(st.st_rdev), minor(st.st_rdev));
+    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
+                                major(st.st_rdev), minor(st.st_rdev), key);
     sysfd = open(sysfspath, O_RDONLY);
     if (sysfd == -1) {
         ret = -errno;
         goto out;
     }
     do {
-        ret = read(sysfd, buf, sizeof(buf) - 1);
+        ret = read(sysfd, buf, buf_len - 1);
     } while (ret == -1 && errno == EINTR);
     if (ret < 0) {
         ret = -errno;
-        goto out;
     } else if (ret == 0) {
         ret = -EIO;
+    }
+out:
+    if (sysfd != -1) {
+        close(sysfd);
+    }
+    g_free(sysfspath);
+    return ret;
+#else
+    return -ENOTSUP;
+#endif
+}
+
+static int sg_get_max_segments(int fd)
+{
+#ifdef CONFIG_LINUX
+    char buf[32];
+    const char *end;
+    int ret;
+    long max_segments;
+
+    ret = hdev_read_blk_queue_entry(fd, "max_segments", buf, sizeof(buf));
+    if (ret < 0) {
         goto out;
     }
+
     buf[ret] = 0;
     /* The file is ended with '\n', pass 'end' to accept that. */
     ret = qemu_strtol(buf, &end, 10, &max_segments);
@@ -1094,10 +1114,33 @@ static int sg_get_max_segments(int fd)
     }
 
 out:
-    if (sysfd != -1) {
-        close(sysfd);
+    return ret;
+#else
+    return -ENOTSUP;
+#endif
+}
+
+static int hdev_get_zoned_model(int fd)
+{
+#ifdef CONFIG_LINUX
+    char buf[32];
+    int ret;
+
+    ret = hdev_read_blk_queue_entry(fd, "zoned", buf, sizeof(buf));
+    if (ret < 0) {
+        ret = BLK_ZONED_MODEL_NONE;
+        goto out;
     }
-    g_free(sysfspath);
+
+    buf[ret - 1] = 0;
+    ret = BLK_ZONED_MODEL_NONE;
+    if (strcmp(buf, "host-managed") == 0) {
+        ret = BLK_ZONED_MODEL_HM;
+    } else if (strcmp(buf, "host-aware") == 0) {
+        ret = BLK_ZONED_MODEL_HA;
+    }
+
+out:
     return ret;
 #else
     return -ENOTSUP;
@@ -1107,9 +1150,10 @@ out:
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
+    int ret;
 
     if (bs->sg) {
-        int ret = sg_get_max_transfer_length(s->fd);
+        ret = sg_get_max_transfer_length(s->fd);
 
         if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
             bs->bl.max_transfer = pow2floor(ret);
@@ -1119,6 +1163,12 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
         if (ret > 0) {
             bs->bl.max_transfer = MIN(bs->bl.max_transfer, ret * getpagesize());
         }
+
+    }
+
+    ret = hdev_get_zoned_model(s->fd);
+    if (ret >= 0) {
+        bs->bl.zoned_model = ret;
     }
 
     raw_probe_alignment(bs, s->fd, errp);
diff --git a/block/raw-format.c b/block/raw-format.c
index bffd424dd0..12c2a3f95d 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -369,6 +369,13 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
     }
 }
 
+static void raw_get_zoned_info(BlockDriverState *bs)
+{
+    if (!bs->probed) {
+        bs->bl.zoned_model = bs->file->bs->bl.zoned_model;
+    }
+}
+
 static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
                                         PreallocMode prealloc, Error **errp)
 {
@@ -572,6 +579,7 @@ BlockDriver bdrv_raw = {
     .bdrv_co_ioctl        = &raw_co_ioctl,
     .create_opts          = &raw_create_opts,
     .bdrv_has_zero_init   = &raw_has_zero_init,
+    .bdrv_get_zoned_info  = &raw_get_zoned_info,
     .strong_runtime_opts  = raw_strong_runtime_opts,
     .mutable_opts         = mutable_opts,
 };
-- 
2.21.0


