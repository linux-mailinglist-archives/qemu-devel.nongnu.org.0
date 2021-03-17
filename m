Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3C33F0C4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:56:49 +0100 (CET)
Received: from localhost ([::1]:49258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVjE-0000VL-Nh
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1lMVi6-00085g-CC
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:55:38 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:41549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1lMVhp-0004XA-T1
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:55:31 -0400
Received: by mail-lj1-x22e.google.com with SMTP id f26so2986129ljp.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 05:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pixOirCX6zcbMFelvM1RT+OnO4nSfJyBvfN0OdCJOAI=;
 b=aHBsyw5KcBsQiPZ60y9Z66e0if4kZ57Li3OMGLmpp6H2MKv45O5hof1ho7xtyhI3lA
 FOn6RJeRjkjvTPQPhRu12z+CGiAMnwlSixCM2F7QaKIplduqtBfJfQpFqv3rk3tEBOJO
 Yi1fJO5xgIWe6MvG421sZG8Xz0Zl3kpmsgnymR2+sWP0MUuS2zzuRk+y2FzRnVysLu7t
 rXwu/DsYc9ybXdky8caZemYlh1MdrKcB7plmnF17ly8+3kdAVhx7h1sZ4dRLlYZCT1si
 BYQu6GYUF4xI9daNCbg7XnpuUGc/6duM4FYgJbDED4SJZ8wdAy5/wtZppsqsTDnbDdY8
 HCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pixOirCX6zcbMFelvM1RT+OnO4nSfJyBvfN0OdCJOAI=;
 b=A7nleId7Yo5p5m+JK2M8mGURWNuuqlozAMKNlz/HVpePJ0A8iDA2Rm6T8thI1uzZDf
 kqbRv7c7LoiOerQrWtKpV+KqHylEGlI5slx2pYrvzoTqf52ax2zPOB3P2ZPTGYIK9N3d
 fwFwGOUTtpqZ+T29/idJC8hcgAwwpzN4S2+CRvdj41lI02Dt9y7CsXav6hQXlRbAlHLC
 Y4+W1h5iSaUNXIWEY0pLNErp1p7IPrUdDu+9rwfsOnRZVXlXZF01GCH1feAcYF7CqkMU
 VXdDvoG39dFXol+89b8nzyCDpeJKpnCX2Z8mRTckeQ/4HN8gOhVFNHM12Nm9T5iBHn0q
 bp8Q==
X-Gm-Message-State: AOAM53284f2lHA5ijs3E90mwyguMaOiHELRY2P0U1krYt5xbgr+G0dNK
 cqpdGt9UuH2+/1m2PAGAD35vVsCg+GQx6Q==
X-Google-Smtp-Source: ABdhPJwf0L2VyagZP7DMbjA9uD00j2NSTzBQFD49UVhB6aL15Jy49Xj2P+73vqaHgcU7bov5PrtneQ==
X-Received: by 2002:a2e:9195:: with SMTP id f21mr2367803ljg.340.1615985717089; 
 Wed, 17 Mar 2021 05:55:17 -0700 (PDT)
Received: from localhost.localdomain ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id d8sm3437382lfm.160.2021.03.17.05.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 05:55:16 -0700 (PDT)
From: Arkadiy <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] block: increased maximum size of vvfat devices
Date: Wed, 17 Mar 2021 15:54:57 +0300
Message-Id: <20210317125457.5733-1-arkaisp2021@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, f4bug@amsat.org, mreitz@redhat.com,
 NDNF <arkaisp2021@gmail.com>, Arkasha <ivanovrkasha@gmail.com>,
 pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: NDNF <arkaisp2021@gmail.com>

This fixes the problem of the impossibility to create
FAT16 disks larger than 504 mb:
The change CHS made it possible to obtain a larger disk.
Also, auto-detection of disk parameters was added depending
on the volume of the connected files:
The size of all folders and files on the created disk is calculated
and the size of the FAT table is added.
This size allows to choose the future size of the FAT drive
from the standard limitations.

Signed-off-by: Arkasha <ivanovrkasha@gmail.com>
---
 block/vvfat.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 9 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 54807f82ca..b9e3d7e003 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -932,8 +932,6 @@ static int init_directories(BDRVVVFATState* s,
     /* Now build FAT, and write back information into directory */
     init_fat(s);
 
-    /* TODO: if there are more entries, bootsector has to be adjusted! */
-    s->root_entries = 0x02 * 0x10 * s->sectors_per_cluster;
     s->cluster_count=sector2cluster(s, s->sector_count);
 
     mapping = array_get_next(&(s->mapping));
@@ -1133,11 +1131,52 @@ static void vvfat_parse_filename(const char *filename, QDict *options,
     qdict_put_bool(options, "rw", rw);
 }
 
+static bool check_size(uint32_t offset_to_bootsector, int cyls, int heads,
+                      int secs, uint8_t sectors_per_cluster, int fat_type,
+                      uint64_t sum, uint64_t size_disk)
+{
+    uint32_t sector_count = cyls * heads * secs - offset_to_bootsector;
+    int i = 1 + sectors_per_cluster * 0x200 * 8 / fat_type;
+    uint16_t sectors_per_fat = (sector_count + i) / i;
+    /*size + FAT1 and FAT2 table size*/
+    if ((sum + sectors_per_fat * 512 * 2) < size_disk) {
+        return true;
+    }
+    return false;
+}
+
+static uint64_t find_size(const char *dirname, unsigned int cluster)
+{
+    uint64_t sum = 0;
+    DIR *dir = opendir(dirname);
+    struct dirent *entry;
+    while ((entry = readdir(dir))) {
+        uint16_t length = strlen(dirname) + 2 + strlen(entry->d_name);
+        char *buffer;
+        struct stat st;
+        buffer = g_malloc(length);
+        snprintf(buffer, length, "%s/%s", dirname, entry->d_name);
+        if (stat(buffer, &st) < 0) {
+            g_free(buffer);
+            continue;
+        }
+        if (strcmp(entry->d_name, ".") && strcmp(entry->d_name, "..")
+                                            && S_ISDIR(st.st_mode)) {
+            sum += find_size(buffer, cluster);
+        }
+        g_free(buffer);
+        sum += (st.st_size + cluster - 1) / (cluster) * (cluster);
+    }
+    closedir(dir);
+    return sum;
+}
+
 static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
                       Error **errp)
 {
     BDRVVVFATState *s = bs->opaque;
     int cyls, heads, secs;
+    uint64_t size_disk;
     bool floppy;
     const char *dirname, *label;
     QemuOpts *opts;
@@ -1163,6 +1202,28 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
     s->fat_type = qemu_opt_get_number(opts, "fat-type", 0);
     floppy = qemu_opt_get_bool(opts, "floppy", false);
 
+    uint64_t sum = 0;
+    if (floppy) {
+        if (!s->fat_type) {
+            s->sectors_per_cluster = 2;
+        } else {
+            s->sectors_per_cluster = 1;
+        }
+    } else if (s->fat_type == 12) {
+        s->offset_to_bootsector = 0x3f;
+        s->sectors_per_cluster = 0x10;
+    } else {
+        s->offset_to_bootsector = 0x3f;
+        /* LATER TODO: if FAT32, adjust */
+        s->sectors_per_cluster = 0x80;
+    }
+
+    sum += find_size(dirname, s->sectors_per_cluster * 0x200);
+    /* TODO: if there are more entries, bootsector has to be adjusted! */
+    s->root_entries = 0x02 * 0x10 * s->sectors_per_cluster;
+    /*File size + boot sector size + root directory size*/
+    sum += 512 + s->root_entries * 32;
+
     memset(s->volume_label, ' ', sizeof(s->volume_label));
     label = qemu_opt_get(opts, "label");
     if (label) {
@@ -1182,22 +1243,40 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
         if (!s->fat_type) {
             s->fat_type = 12;
             secs = 36;
-            s->sectors_per_cluster = 2;
         } else {
             secs = s->fat_type == 12 ? 18 : 36;
-            s->sectors_per_cluster = 1;
         }
         cyls = 80;
         heads = 2;
     } else {
-        /* 32MB or 504MB disk*/
         if (!s->fat_type) {
             s->fat_type = 16;
         }
-        s->offset_to_bootsector = 0x3f;
+        size_disk = 528482304;
         cyls = s->fat_type == 12 ? 64 : 1024;
         heads = 16;
         secs = 63;
+        if (!check_size(s->offset_to_bootsector, cyls, heads, secs,
+                      s->sectors_per_cluster, s->fat_type, sum, 
+                      size_disk)) {
+            if (s->fat_type > 12) {
+                size_disk = 4294950912;
+                cyls = 8322;
+                heads = 16;
+                secs = 63;
+
+            } else {
+                fprintf(stderr, "Requires Fat16 or Fat32\n");
+                return -2;
+            }
+            if (!check_size(s->offset_to_bootsector, cyls, heads,
+                                   secs, s->sectors_per_cluster,
+                                   s->fat_type, sum, size_disk)) {
+                fprintf(stderr, "Folder is larger than %f GB\n",
+                                (float)size_disk / 1073741824);
+                return -2;
+            }
+        }
     }
 
     switch (s->fat_type) {
@@ -1216,9 +1295,6 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
 
     s->bs = bs;
 
-    /* LATER TODO: if FAT32, adjust */
-    s->sectors_per_cluster=0x10;
-
     s->current_cluster=0xffffffff;
 
     s->qcow = NULL;
-- 
2.17.1


