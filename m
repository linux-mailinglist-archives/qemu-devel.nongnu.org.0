Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413C96B1E93
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:47:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBtf-0000FG-Lg; Thu, 09 Mar 2023 03:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBta-0000DH-MC
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtY-0008TO-D4
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wui4DGcWr65hFfF1Xw5hpHWkyQT47TcYO6zNbQJNigk=;
 b=h9d6/rAjHvsHiCLtfxPeTaD+wEmQ9G9X4ClJXnkENimuuBJh6ne+Cow286jKBfhbTr+fWW
 7nXiSOGFLpTbf+IlV65QHyLb875AjkcStg4CSsnnIZ7nhQZwzvQoT/DD1zbm2866ffE7aM
 IESZ9REkbKAzKyf84OaUMbtTZpKBXoE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-5gDKl82rPMOX301kPvDp9g-1; Thu, 09 Mar 2023 03:45:01 -0500
X-MC-Unique: 5gDKl82rPMOX301kPvDp9g-1
Received: by mail-ed1-f69.google.com with SMTP id
 v11-20020a056402348b00b004ce34232666so1914568edc.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wui4DGcWr65hFfF1Xw5hpHWkyQT47TcYO6zNbQJNigk=;
 b=EIAEASYebYzxwifbBVuAmTBdqDDjLxnd9qQ6qTrXWSV2yGhz5SiaXbXvAVGCMf8T1r
 9QZ0fscdpYxJE6fU8hEuwUmEFi3d3vZDDV7gXgrYkEJXV45iWBSter0PuGrbk7yEqbku
 uBM3W06BJp51yJAci+0+0/UWREpYs7923bxKQZzrxZBL1UEsXjifRA/ML3a3yM/e2Qy3
 rVmmgFwv6QUZKq4h3NpzGRAs3RGIqqN86Z8VhuyWqTTrtky0/XGKiFYJgDdZeWtiG9M7
 H8DYKlws2P74VQff1njtxTSmpkZ/eRdtohtCymjE6XrcXa8AlDHoffBUHfFHvQWPZspL
 T87Q==
X-Gm-Message-State: AO0yUKW4YtU6F9AU93aXx9daXYpioe1nvT9LPS89uvzHpBBgT07/eat/
 1LEVOgyOJg3/wEpVFrinERA4jkboTQg1TV2QsQk4JUEyz19exxK8WiX9orT59p8UewoYmS6HzRq
 Rh8Tr1bZC1cOy6T/4/np+lDZM4nwPsKRXV23ZDUSGCpLpcsAuAqnQH3FANis24ETbKgsqDDLdrI
 U=
X-Received: by 2002:a17:907:20f8:b0:88e:d435:3fd6 with SMTP id
 rh24-20020a17090720f800b0088ed4353fd6mr19600464ejb.63.1678351499799; 
 Thu, 09 Mar 2023 00:44:59 -0800 (PST)
X-Google-Smtp-Source: AK7set9Ml6R2GkLQZZ0T1DIRCoM/FIYIhMftcYzzNc50ajCs0/jSdLyN2rp3SsXdqYsQdh3Jrh4NWQ==
X-Received: by 2002:a17:907:20f8:b0:88e:d435:3fd6 with SMTP id
 rh24-20020a17090720f800b0088ed4353fd6mr19600454ejb.63.1678351499430; 
 Thu, 09 Mar 2023 00:44:59 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a170906d18600b0090e0a4e1bacsm6819728ejz.159.2023.03.09.00.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:44:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 1/9] vvfat: mark various functions as coroutine_fn
Date: Thu,  9 Mar 2023 09:44:48 +0100
Message-Id: <20230309084456.304669-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309084456.304669-1-pbonzini@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Functions that can do I/O are prime candidates for being coroutine_fns.  Make the
change for those that are themselves called only from coroutine_fns.

In addition, coroutine_fns should do I/O using bdrv_co_*() functions, for
which it is required to hold the BlockDriverState graph lock.  So also nnotate
functions on the I/O path with TSA attributes, making it possible to
switch them to use bdrv_co_*() functions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vvfat.c | 58 ++++++++++++++++++++++++++-------------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index fd45e86416b2..0ddc91fc096a 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1053,7 +1053,7 @@ static BDRVVVFATState *vvv = NULL;
 #endif
 
 static int enable_write_target(BlockDriverState *bs, Error **errp);
-static int is_consistent(BDRVVVFATState *s);
+static int coroutine_fn is_consistent(BDRVVVFATState *s);
 
 static QemuOptsList runtime_opts = {
     .name = "vvfat",
@@ -1469,8 +1469,8 @@ static void print_mapping(const mapping_t* mapping)
 }
 #endif
 
-static int vvfat_read(BlockDriverState *bs, int64_t sector_num,
-                    uint8_t *buf, int nb_sectors)
+static int coroutine_fn GRAPH_RDLOCK
+vvfat_read(BlockDriverState *bs, int64_t sector_num, uint8_t *buf, int nb_sectors)
 {
     BDRVVVFATState *s = bs->opaque;
     int i;
@@ -1490,8 +1490,8 @@ static int vvfat_read(BlockDriverState *bs, int64_t sector_num,
                 DLOG(fprintf(stderr, "sectors %" PRId64 "+%" PRId64
                              " allocated\n", sector_num,
                              n >> BDRV_SECTOR_BITS));
-                if (bdrv_pread(s->qcow, sector_num * BDRV_SECTOR_SIZE, n,
-                               buf + i * 0x200, 0) < 0) {
+                if (bdrv_co_pread(s->qcow, sector_num * BDRV_SECTOR_SIZE, n,
+                                  buf + i * 0x200, 0) < 0) {
                     return -1;
                 }
                 i += (n >> BDRV_SECTOR_BITS) - 1;
@@ -1532,7 +1532,7 @@ static int vvfat_read(BlockDriverState *bs, int64_t sector_num,
     return 0;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vvfat_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
@@ -1796,8 +1796,8 @@ static inline uint32_t modified_fat_get(BDRVVVFATState* s,
     }
 }
 
-static inline bool cluster_was_modified(BDRVVVFATState *s,
-                                        uint32_t cluster_num)
+static inline bool coroutine_fn GRAPH_RDLOCK
+cluster_was_modified(BDRVVVFATState *s, uint32_t cluster_num)
 {
     int was_modified = 0;
     int i;
@@ -1852,8 +1852,8 @@ typedef enum {
  * Further, the files/directories handled by this function are
  * assumed to be *not* deleted (and *only* those).
  */
-static uint32_t get_cluster_count_for_direntry(BDRVVVFATState* s,
-        direntry_t* direntry, const char* path)
+static uint32_t coroutine_fn GRAPH_RDLOCK
+get_cluster_count_for_direntry(BDRVVVFATState* s, direntry_t* direntry, const char* path)
 {
     /*
      * This is a little bit tricky:
@@ -1979,9 +1979,9 @@ static uint32_t get_cluster_count_for_direntry(BDRVVVFATState* s,
                         if (res) {
                             return -1;
                         }
-                        res = bdrv_pwrite(s->qcow, offset * BDRV_SECTOR_SIZE,
-                                          BDRV_SECTOR_SIZE, s->cluster_buffer,
-                                          0);
+                        res = bdrv_co_pwrite(s->qcow, offset * BDRV_SECTOR_SIZE,
+                                             BDRV_SECTOR_SIZE, s->cluster_buffer,
+                                             0);
                         if (res < 0) {
                             return -2;
                         }
@@ -2011,8 +2011,8 @@ static uint32_t get_cluster_count_for_direntry(BDRVVVFATState* s,
  * It returns 0 upon inconsistency or error, and the number of clusters
  * used by the directory, its subdirectories and their files.
  */
-static int check_directory_consistency(BDRVVVFATState *s,
-        int cluster_num, const char* path)
+static int coroutine_fn GRAPH_RDLOCK
+check_directory_consistency(BDRVVVFATState *s, int cluster_num, const char* path)
 {
     int ret = 0;
     unsigned char* cluster = g_malloc(s->cluster_size);
@@ -2138,7 +2138,8 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 }
 
 /* returns 1 on success */
-static int is_consistent(BDRVVVFATState* s)
+static int coroutine_fn GRAPH_RDLOCK
+is_consistent(BDRVVVFATState* s)
 {
     int i, check;
     int used_clusters_count = 0;
@@ -2414,8 +2415,8 @@ static int commit_mappings(BDRVVVFATState* s,
     return 0;
 }
 
-static int commit_direntries(BDRVVVFATState* s,
-        int dir_index, int parent_mapping_index)
+static int coroutine_fn GRAPH_RDLOCK
+commit_direntries(BDRVVVFATState* s, int dir_index, int parent_mapping_index)
 {
     direntry_t* direntry = array_get(&(s->directory), dir_index);
     uint32_t first_cluster = dir_index == 0 ? 0 : begin_of_direntry(direntry);
@@ -2504,8 +2505,8 @@ static int commit_direntries(BDRVVVFATState* s,
 
 /* commit one file (adjust contents, adjust mapping),
    return first_mapping_index */
-static int commit_one_file(BDRVVVFATState* s,
-        int dir_index, uint32_t offset)
+static int coroutine_fn GRAPH_RDLOCK
+commit_one_file(BDRVVVFATState* s, int dir_index, uint32_t offset)
 {
     direntry_t* direntry = array_get(&(s->directory), dir_index);
     uint32_t c = begin_of_direntry(direntry);
@@ -2770,7 +2771,7 @@ static int handle_renames_and_mkdirs(BDRVVVFATState* s)
 /*
  * TODO: make sure that the short name is not matching *another* file
  */
-static int handle_commits(BDRVVVFATState* s)
+static int coroutine_fn GRAPH_RDLOCK handle_commits(BDRVVVFATState* s)
 {
     int i, fail = 0;
 
@@ -2913,7 +2914,7 @@ static int handle_deletes(BDRVVVFATState* s)
  * - recurse direntries from root (using bs->bdrv_pread)
  * - delete files corresponding to mappings marked as deleted
  */
-static int do_commit(BDRVVVFATState* s)
+static int coroutine_fn GRAPH_RDLOCK do_commit(BDRVVVFATState* s)
 {
     int ret = 0;
 
@@ -2963,7 +2964,7 @@ DLOG(checkpoint());
     return 0;
 }
 
-static int try_commit(BDRVVVFATState* s)
+static int coroutine_fn GRAPH_RDLOCK try_commit(BDRVVVFATState* s)
 {
     vvfat_close_current_file(s);
 DLOG(checkpoint());
@@ -2972,8 +2973,9 @@ DLOG(checkpoint());
     return do_commit(s);
 }
 
-static int vvfat_write(BlockDriverState *bs, int64_t sector_num,
-                    const uint8_t *buf, int nb_sectors)
+static int coroutine_fn GRAPH_RDLOCK
+vvfat_write(BlockDriverState *bs, int64_t sector_num,
+            const uint8_t *buf, int nb_sectors)
 {
     BDRVVVFATState *s = bs->opaque;
     int i, ret;
@@ -3082,8 +3084,8 @@ DLOG(checkpoint());
      * Use qcow backend. Commit later.
      */
 DLOG(fprintf(stderr, "Write to qcow backend: %d + %d\n", (int)sector_num, nb_sectors));
-    ret = bdrv_pwrite(s->qcow, sector_num * BDRV_SECTOR_SIZE,
-                      nb_sectors * BDRV_SECTOR_SIZE, buf, 0);
+    ret = bdrv_co_pwrite(s->qcow, sector_num * BDRV_SECTOR_SIZE,
+                         nb_sectors * BDRV_SECTOR_SIZE, buf, 0);
     if (ret < 0) {
         fprintf(stderr, "Error writing to qcow backend\n");
         return ret;
@@ -3103,7 +3105,7 @@ DLOG(checkpoint());
     return 0;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vvfat_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
                  QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
-- 
2.39.2


