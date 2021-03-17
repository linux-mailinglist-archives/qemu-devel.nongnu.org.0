Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7997C33F3EE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:20:10 +0100 (CET)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXxs-0008J0-7m
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1lMXLQ-0008Tb-Hc
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:40:20 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:42097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1lMXLM-0000Vc-Bd
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:40:20 -0400
Received: by mail-lf1-x132.google.com with SMTP id v2so3316642lft.9
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pixOirCX6zcbMFelvM1RT+OnO4nSfJyBvfN0OdCJOAI=;
 b=KDN30902f7KtRZ2nYQZqwCgmm65qqtig/0539LmQfjRXl02CaTE2o2pztFjGs6HqJW
 NrPO5qVOP2gfHQ/mBdCK93KEZ97mzMeyacGPTGZ8wxJGXInmdQ0PCqh1JNFYEu1WHLzn
 tSS5WXHxZE1HxsWPgMXzHRDDKXAY7mcu7uXMUGca53ghB5Df6ltnryaUZGAU1CRN4kqm
 wJHKj/kgyjBKtxSerSYsRZdPuIf2OxARNaLEVmm9gHTz80agLtP7ebr6okvdWSfjxTBY
 QvKFgdTpPZQ9NlZfTiClS2kbmiPgBasgh7PHhOLXVHzGydlfkRV4jEDv9gS8Aj4asgFt
 LMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pixOirCX6zcbMFelvM1RT+OnO4nSfJyBvfN0OdCJOAI=;
 b=j3LUxQj0eqBG5kNp+pbWPka8ZVpXeD3dlamByu2A54mY1Rd7OmmFHWvAVknFaDRDw0
 hFEGiwNK/KKQqUfqLphIG5eSTKkoSXlKMJtwfl/okCs/JyV/M7R4qOG3PosRRQnmDywO
 dyXV5HlDgdyZk+jPduXyjAsongGEmuMJum9rFIclJgYMQN8mqeePSUb1VnUGggbQT/kn
 C76BjbaE3Ov2GY9HJ6U3rPzYXv5IH4Jm+6a3GQGgopWMZh7gcmrA15MMcB8cOh878hCz
 73/FbhicAOdbFoO+rRYz6foI/p17Tyv1NP8JaTGzVguF64tJiQnY1IWBWPaWqwxsJVgT
 MZKg==
X-Gm-Message-State: AOAM5332kI2rtTCRhh7nH2sDTI4Kgl0+pSmVHQWpq8DO8mlpqI1sU86M
 HmQnArTDV3EN+OUfs4dWZU7Ka/kbV+GL0g==
X-Google-Smtp-Source: ABdhPJxl62WVn1j0rZ2xBiYxOHgIg5n29Dh+z40l0UyrmsYTt113XS6+t5P+vzZU/td8zUURk7jvlg==
X-Received: by 2002:ac2:5144:: with SMTP id q4mr2676748lfd.145.1615992014008; 
 Wed, 17 Mar 2021 07:40:14 -0700 (PDT)
Received: from localhost.localdomain ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id l21sm3442507lfg.300.2021.03.17.07.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:40:13 -0700 (PDT)
From: Arkadiy <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2] block: increased maximum size of vvfat devices
Date: Wed, 17 Mar 2021 17:39:45 +0300
Message-Id: <20210317143945.15140-1-arkaisp2021@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lf1-x132.google.com
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


