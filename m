Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE45EF0EE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:54:42 +0200 (CEST)
Received: from localhost ([::1]:59710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odpJZ-0001ij-68
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp2a-0000Sd-QT; Thu, 29 Sep 2022 04:37:10 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp2Y-0007jF-Be; Thu, 29 Sep 2022 04:37:07 -0400
Received: by mail-pg1-x533.google.com with SMTP id f193so877269pgc.0;
 Thu, 29 Sep 2022 01:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+JQ66bLElXnn3EMf7/PaRKI9w4ydiSjIGiaM8hZtrgM=;
 b=RpfE0+E7C6vEM4YCXB3kX65FrEN1FdLNyDUuOYW3yLEWuwYqyKBncItYM8ZS5hBYVz
 HBRr5oNAQMbYq67K/P7V7HYjIawhg506FUERPf98u6/Y/kqIT6R5NZk/YpdkPwr9ZTwt
 iAh8Zf9quqBNRCAFxh+O4+9YBCH4bJjDenM+rQKuDD4nv3ktyt0pFp9Rzl59yMMRdqgP
 q6NKZhtP5mESR1GFidUKFT2pihr5qJufeET39HaTI27T5u1/JBI4Mw6LXK2KIkaJk9e4
 hCzxI+Q4XI14Xh5ozGQHxMFkVxtHd0X34c+xApEYMqeVhS+0nJl9NHU6SKFR/cRwchh7
 CW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+JQ66bLElXnn3EMf7/PaRKI9w4ydiSjIGiaM8hZtrgM=;
 b=PNPDBlnwX0mOnp/aVcYz5Qk2acrw5pZfnFiCsTIO1/3TbOgNnYNEAmXxn/tUqr8sC4
 +lGTeYZi8Zo55/K/L3COkFMAt5lxKz31Cvh47riBRUZmRBxdHCTjpIhAUZBCRl5h8qic
 dhX5KTMNKN9E2+PZZt48Yhr4L4Y3xN9/tSxhuGwkeffuDkQWw7q4jT3n9jhPkaKkHdg9
 gm7PAQMqsS7tOXDSKhqFchzmGd/cqYzqOXFn36W3tt/6951mhxGlkwGBxvAL7tIevrLM
 b0rwa7FYXFmxbgiOoCAzsJivOT94R2YmYzKEghAkoEH+p4ujLo3VDVmQodxV4IEjYkqW
 Ni4Q==
X-Gm-Message-State: ACrzQf35Nc5yZQjaM3qAQiR/h+pEUJBHb9Ougxf9uEj2irX71UiPlyrH
 44cRzzklY5vnhqgxxylpVjnGbByV1NMf6g==
X-Google-Smtp-Source: AMsMyM4VMm9j3CejHcFoUXBkhsPkiCzGDVIkFoDGIXMDrQCPvhFZ+FdcCnqOgt9Yorz62B38Kn17bw==
X-Received: by 2002:a63:4384:0:b0:43a:18ce:f98a with SMTP id
 q126-20020a634384000000b0043a18cef98amr1899391pga.273.1664440624280; 
 Thu, 29 Sep 2022 01:37:04 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 s5-20020a170902ea0500b0017829a3df46sm5324233plg.204.2022.09.29.01.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 01:37:03 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 stefanha@redhat.com, Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v10 2/7] file-posix: introduce helper functions for sysfs
 attributes
Date: Thu, 29 Sep 2022 16:36:26 +0800
Message-Id: <20220929083631.61899-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929083631.61899-1-faithilikerun@gmail.com>
References: <20220929083631.61899-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use get_sysfs_str_val() to get the string value of device
zoned model. Then get_sysfs_zoned_model() can convert it to
BlockZoneModel type of QEMU.

Use get_sysfs_long_val() to get the long value of zoned device
information.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 block/file-posix.c               | 121 ++++++++++++++++++++++---------
 include/block/block_int-common.h |   3 +
 2 files changed, 88 insertions(+), 36 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..0a8b4b426e 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1210,66 +1210,109 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
 #endif
 }
 
-static int hdev_get_max_segments(int fd, struct stat *st)
-{
+/*
+ * Get a sysfs attribute value as character string.
+ */
+static int get_sysfs_str_val(struct stat *st, const char *attribute,
+                             char **val) {
 #ifdef CONFIG_LINUX
-    char buf[32];
-    const char *end;
-    char *sysfspath = NULL;
+    g_autofree char *sysfspath = NULL;
     int ret;
-    int sysfd = -1;
-    long max_segments;
+    size_t len;
 
-    if (S_ISCHR(st->st_mode)) {
-        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
-            return ret;
-        }
+    if (!S_ISBLK(st->st_mode)) {
         return -ENOTSUP;
     }
 
-    if (!S_ISBLK(st->st_mode)) {
-        return -ENOTSUP;
+    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
+                                major(st->st_rdev), minor(st->st_rdev),
+                                attribute);
+    ret = g_file_get_contents(sysfspath, val, &len, NULL);
+    if (ret == -1) {
+        return -ENOENT;
     }
 
-    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
-                                major(st->st_rdev), minor(st->st_rdev));
-    sysfd = open(sysfspath, O_RDONLY);
-    if (sysfd == -1) {
-        ret = -errno;
-        goto out;
+    /* The file is ended with '\n' */
+    char *p;
+    p = *val;
+    if (*(p + len - 1) == '\n') {
+        *(p + len - 1) = '\0';
     }
-    do {
-        ret = read(sysfd, buf, sizeof(buf) - 1);
-    } while (ret == -1 && errno == EINTR);
+    return ret;
+#else
+    return -ENOTSUP;
+#endif
+}
+
+static int get_sysfs_zoned_model(struct stat *st, BlockZoneModel *zoned) {
+    g_autofree char *val = NULL;
+    int ret;
+
+    ret = get_sysfs_str_val(st, "zoned", &val);
     if (ret < 0) {
-        ret = -errno;
-        goto out;
-    } else if (ret == 0) {
-        ret = -EIO;
-        goto out;
+        return ret;
     }
-    buf[ret] = 0;
-    /* The file is ended with '\n', pass 'end' to accept that. */
-    ret = qemu_strtol(buf, &end, 10, &max_segments);
-    if (ret == 0 && end && *end == '\n') {
-        ret = max_segments;
+
+    if (strcmp(val, "host-managed") == 0) {
+        *zoned = BLK_Z_HM;
+    } else if (strcmp(val, "host-aware") == 0) {
+        *zoned = BLK_Z_HA;
+    } else if (strcmp(val, "none") == 0) {
+        *zoned = BLK_Z_NONE;
+    } else {
+        return -ENOTSUP;
     }
+    return 0;
+}
 
-out:
-    if (sysfd != -1) {
-        close(sysfd);
+/*
+ * Get a sysfs attribute value as a long integer.
+ */
+static long get_sysfs_long_val(struct stat *st, const char *attribute) {
+#ifdef CONFIG_LINUX
+    g_autofree char *str = NULL;
+    const char *end;
+    long val;
+    int ret;
+
+    ret = get_sysfs_str_val(st, attribute, &str);
+    if (ret < 0) {
+        return ret;
+    }
+
+    /* The file is ended with '\n', pass 'end' to accept that. */
+    ret = qemu_strtol(str, &end, 10, &val);
+    if (ret == 0 && end && *end == '\0') {
+        ret = val;
     }
-    g_free(sysfspath);
     return ret;
 #else
     return -ENOTSUP;
 #endif
 }
 
+static int hdev_get_max_segments(int fd, struct stat *st) {
+#ifdef CONFIG_LINUX
+    int ret;
+
+    if (S_ISCHR(st->st_mode)) {
+        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
+            return ret;
+        }
+        return -ENOTSUP;
+    }
+    return get_sysfs_long_val(st, "max_segments");
+#else
+    return -ENOTSUP;
+#endif
+}
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
     struct stat st;
+    int ret;
+    BlockZoneModel zoned;
 
     s->needs_alignment = raw_needs_alignment(bs);
     raw_probe_alignment(bs, s->fd, errp);
@@ -1307,6 +1350,12 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
             bs->bl.max_hw_iov = ret;
         }
     }
+
+    ret = get_sysfs_zoned_model(&st, &zoned);
+    if (ret < 0) {
+        zoned = BLK_Z_NONE;
+    }
+    bs->bl.zoned = zoned;
 }
 
 static int check_for_dasd(int fd)
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..7f7863cc9e 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -825,6 +825,9 @@ typedef struct BlockLimits {
 
     /* maximum number of iovec elements */
     int max_iov;
+
+    /* device zone model */
+    BlockZoneModel zoned;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
-- 
2.37.3


