Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173349B76D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 21:54:08 +0200 (CEST)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1FdP-0005u2-47
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 15:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1319249da=dmitry.fomichev@wdc.com>)
 id 1i1FZ4-0000N1-TR
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 15:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1319249da=dmitry.fomichev@wdc.com>)
 id 1i1FZ3-0000ZH-Dc
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 15:49:38 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:47029)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=1319249da=dmitry.fomichev@wdc.com>)
 id 1i1FYz-0000Vz-UC; Fri, 23 Aug 2019 15:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566589773; x=1598125773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WrGHKVduBl42d9CD8UFRTIZ6FP7W7UcEwBBJuvUCUsc=;
 b=ifOB6vc7DtOEdvBHYyR0LB8zJ70UG5mFdYJ69KK/MQWGMyRNFG1V+WXY
 8gS+M/JjdQhLkhcBWzjn4yYawVNFCrypfwXRXBX5uAlhxeEyRb0KgsYgb
 YgSt168vKwrHqVNupArxJ1CCRAZ8gS2Xe0nGLLnMOHKKYPeb2G6vta0u9
 W5giKvYHhQN9A71QZue98R6iWkwM1GJDGM7PdlNvC2rLTTr52P10VBmfN
 OZvnjLYDtU/oDOD5qKMRvKmktzL4JeMWKuHCyWTPDLNYh2BwbHpXFnJMw
 PPCru7lYC1XV2spjb2RNJbEh4nOOB7bb+zCYjsvTnAFPg75DSbQjJtD7Y Q==;
IronPort-SDR: tfxG8xI3MsCnbMEhfubaz7syZCjIWqSVYjUmwkaN9BVN1CDbsGMw0pIxLDugT21glrklMEYaJw
 0pwABFmujW+TZXrcYLsLjgwEBg7VxE9KJE/Uz3vpBCbUw/krlGs4jCxtbO0ArtizP0y2SyaUOS
 1IGTu05Be12AMqC5yBPM2yF1absk62p3YvuZI0ejAeE+y3ha9jPLTfg06HALsaHGXw9yICojLw
 X4J03UBy6yNueyONuC64b98+YDWNooD8pi8vIYnDp69wNOwefxfbzUR+7ZUJ0386ZazKfFTW4D
 G9U=
X-IronPort-AV: E=Sophos;i="5.64,422,1559491200"; d="scan'208";a="223162544"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Aug 2019 03:49:31 +0800
IronPort-SDR: GSIqev7wKYTasPSm4e3hmBUG21rqNX1YTMPiuRSYpP3v7W0Hs7Lc3D98rv2GrmLRXRai0yMMZP
 ETIB95m3D+cbtzca38XzUICelQwv1sQynFu3K409yy385waPOz0xC9ohl4tfxJiXTZg+zI4fjM
 WfLCrGuCgreoQjJdoA2xbLDv5MTgJlWrkhM3kv+iWhWe3DwwZs4oRc+/GKdQ9Nd2kkSWUFO2er
 FQ5GFvrFhD6TZKRbsDCmSGipY9gUzKUZciY8H1rBcZSu0NGGKCaQ+IzHts4u/8+VcExKB73idU
 UB9ebLUgMz8iXKLPFZLjkOM8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 12:46:48 -0700
IronPort-SDR: ZNIbsON233fRjxDLQGGYzjFw8FjCDlQq16etIM21Ox5MLPSBUbrEMXzD033aOsIjPnsm05J2xW
 MTyx1JTR8ouPSZ+HCOYco/cRJYppmDk2dK5gyL95zJhgZPyYzG9VGhdwUU/35MiRmb3Vc+pkpf
 ydBQrpOI3eFarT6jWC3/qMWmRglCnWpBb/N/OHQ3OSm9ErFOg2kNuRbpakCgYXqU6hq3piFPsf
 6sD4aBfr2H7DqAS0K/+8WpXZs9aYEYjU6S7OjxGIc9hnbIsTXo/DZ/+lWiPZIiS2aEUmnofM1q
 0NA=
WDCIronportException: Internal
Received: from dhcp-10-88-173-43.hgst.com ([10.88.173.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Aug 2019 12:49:30 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Date: Fri, 23 Aug 2019 15:49:25 -0400
Message-Id: <20190823194927.23278-3-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823194927.23278-1-dmitry.fomichev@wdc.com>
References: <20190823194927.23278-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 68.232.141.245
Subject: [Qemu-devel] [PATCH v5 2/4] raw: Recognize zoned backing devices
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
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
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
index fbeb0068db..d9f2fc5e46 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1067,15 +1067,13 @@ static int sg_get_max_transfer_length(int fd)
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
@@ -1083,23 +1081,45 @@ static int sg_get_max_segments(int fd)
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
@@ -1108,10 +1128,33 @@ static int sg_get_max_segments(int fd)
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
@@ -1121,9 +1164,10 @@ out:
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
+    int ret;
 
     if (bs->sg) {
-        int ret = sg_get_max_transfer_length(s->fd);
+        ret = sg_get_max_transfer_length(s->fd);
 
         if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
             bs->bl.max_transfer = pow2floor(ret);
@@ -1133,6 +1177,12 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
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
index 42c28cc29a..a606e4a7fe 100644
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
@@ -578,6 +585,7 @@ BlockDriver bdrv_raw = {
     .create_opts          = &raw_create_opts,
     .bdrv_has_zero_init   = &raw_has_zero_init,
     .bdrv_has_zero_init_truncate = &raw_has_zero_init_truncate,
+    .bdrv_get_zoned_info  = &raw_get_zoned_info,
     .strong_runtime_opts  = raw_strong_runtime_opts,
     .mutable_opts         = mutable_opts,
 };
-- 
2.21.0


