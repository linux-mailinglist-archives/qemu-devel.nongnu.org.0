Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141005FDA15
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:15:01 +0200 (CEST)
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiy3A-000710-6i
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixUC-0001pw-Gr
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixU9-0004HB-6V
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ikEvi53dha0Sk0fNu/zC5nmA0EkgX1CV2qFD4podpc=;
 b=OvabVst4qdslunfjypts1I2xru4ywpDXq9MixeZ3tbPeffqZbL+GQx9t+DuaJOfO3lqWkD
 BYoLL79UajydNb+w5uwgGAd5U2J2BpjmzW4leyQx73aEpMya1yCE5CfbqRGI7CVB7miNWy
 bBSYEy2Wg0zCGw6wgO4IGFmBFvY+4/Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-508-GHYB5kGGOCqyvD31j8tRmw-1; Thu, 13 Oct 2022 08:38:10 -0400
X-MC-Unique: GHYB5kGGOCqyvD31j8tRmw-1
Received: by mail-ed1-f70.google.com with SMTP id
 v4-20020a056402348400b0045bd50cb9adso1442243edc.0
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ikEvi53dha0Sk0fNu/zC5nmA0EkgX1CV2qFD4podpc=;
 b=Wikxlmgx6yCqHtqW5PCbIRh5xO4Q+eQLjyiqCyyAKkuYwdWkXuQ8n31aC0brV1CUbM
 cXaR3rS4DqGfF2ucG80T8M7u9re7ERxBdxY+jUgnraOuTg4VuyXEKIwg54ojdlSFZWuK
 OdlLd8rSRNrQ5Kv8FN1fJGVVQ44pNbbQISMp7jOdk6KpUVSwBjQFs8tJaNgWtMUEVDgT
 OKzNqHT9jn/m2B3CQLBy3onbIorK8DFbU+mi6k8MEmxh0GZcc9w8YI0F9yHvOElvlXA+
 vZQprK/HkS0w0MVsmG/BeJDgVaoqW9yntDkoJoOoOfsa1a3t+nOREt2kqUFRmwvAPmYw
 NpCA==
X-Gm-Message-State: ACrzQf2ZF5chTKS0+AglBvNI+vLcIlq8OPzMyMbKxzxjJSJBMiEo4hHb
 JVCSDiG5Gg7auj0kz/4wHWqVoeJb5I3qaYlg0KjRTGzSYDlUKxwLTDHeoAaVaWiH4QbsyKu2bU7
 ExeaStPaWGztQpaqnxje1NXZ27JP6zJ5RfEymsz0LYNi8d1DWz8+ap/KSKVuBpWttsbY=
X-Received: by 2002:a17:906:5daa:b0:78d:fa76:f837 with SMTP id
 n10-20020a1709065daa00b0078dfa76f837mr4927003ejv.239.1665664689235; 
 Thu, 13 Oct 2022 05:38:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5jHXVYrfUBPCTuIXujmfwsaQxxVUZx3rTPvV+zWZiye/eMPbnzAZwyO9DDgnwM+Svu38xrIg==
X-Received: by 2002:a17:906:5daa:b0:78d:fa76:f837 with SMTP id
 n10-20020a1709065daa00b0078dfa76f837mr4926982ejv.239.1665664688819; 
 Thu, 13 Oct 2022 05:38:08 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a1709060cca00b0078a543e9301sm2897244ejh.200.2022.10.13.05.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:38:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 19/24] qcow2: switch to *_co_* functions
Date: Thu, 13 Oct 2022 14:37:06 +0200
Message-Id: <20221013123711.620631-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qcow2-cluster.c  |  8 ++++----
 block/qcow2-refcount.c | 10 +++++-----
 block/qcow2-snapshot.c |  6 +++---
 block/qcow2.c          | 24 ++++++++++++------------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 523c37215a..f480a29ae3 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -47,14 +47,14 @@ int coroutine_fn qcow2_shrink_l1_table(BlockDriverState *bs, uint64_t exact_size
 #endif
 
     BLKDBG_EVENT(bs->file, BLKDBG_L1_SHRINK_WRITE_TABLE);
-    ret = bdrv_pwrite_zeroes(bs->file, s->l1_table_offset +
-                                       new_l1_size * L1E_SIZE,
-                             (s->l1_size - new_l1_size) * L1E_SIZE, 0);
+    ret = bdrv_co_pwrite_zeroes(bs->file, s->l1_table_offset +
+                                new_l1_size * L1E_SIZE,
+                                (s->l1_size - new_l1_size) * L1E_SIZE, 0);
     if (ret < 0) {
         goto fail;
     }
 
-    ret = bdrv_flush(bs->file->bs);
+    ret = bdrv_co_flush(bs->file->bs);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 38861ed7c8..c7cb48b0c4 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -118,8 +118,8 @@ int coroutine_fn qcow2_refcount_init(BlockDriverState *bs)
             goto fail;
         }
         BLKDBG_EVENT(bs->file, BLKDBG_REFTABLE_LOAD);
-        ret = bdrv_pread(bs->file, s->refcount_table_offset,
-                         refcount_table_size2, s->refcount_table, 0);
+        ret = bdrv_co_pread(bs->file, s->refcount_table_offset,
+                            refcount_table_size2, s->refcount_table, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -3657,9 +3657,9 @@ int coroutine_fn qcow2_shrink_reftable(BlockDriverState *bs)
         reftable_tmp[i] = unused_block ? 0 : cpu_to_be64(s->refcount_table[i]);
     }
 
-    ret = bdrv_pwrite_sync(bs->file, s->refcount_table_offset,
-                           s->refcount_table_size * REFTABLE_ENTRY_SIZE,
-                           reftable_tmp, 0);
+    ret = bdrv_co_pwrite_sync(bs->file, s->refcount_table_offset,
+                              s->refcount_table_size * REFTABLE_ENTRY_SIZE,
+                              reftable_tmp, 0);
     /*
      * If the write in the reftable failed the image may contain a partially
      * overwritten reftable. In this case it would be better to clear the
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index d1d46facbf..62e8a0335d 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -441,9 +441,9 @@ int coroutine_fn qcow2_check_read_snapshot_table(BlockDriverState *bs,
     } QEMU_PACKED snapshot_table_pointer;
 
     /* qcow2_do_open() discards this information in check mode */
-    ret = bdrv_pread(bs->file, offsetof(QCowHeader, nb_snapshots),
-                     sizeof(snapshot_table_pointer), &snapshot_table_pointer,
-                     0);
+    ret = bdrv_co_pread(bs->file, offsetof(QCowHeader, nb_snapshots),
+                        sizeof(snapshot_table_pointer), &snapshot_table_pointer,
+                        0);
     if (ret < 0) {
         result->check_errors++;
         fprintf(stderr, "ERROR failed to read the snapshot table pointer from "
diff --git a/block/qcow2.c b/block/qcow2.c
index b7cac50eb3..8d6e576f28 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1306,7 +1306,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     uint64_t l1_vm_state_index;
     bool update_header = false;
 
-    ret = bdrv_pread(bs->file, 0, sizeof(header), &header, 0);
+    ret = bdrv_co_pread(bs->file, 0, sizeof(header), &header, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not read qcow2 header");
         goto fail;
@@ -1382,9 +1382,9 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     if (header.header_length > sizeof(header)) {
         s->unknown_header_fields_size = header.header_length - sizeof(header);
         s->unknown_header_fields = g_malloc(s->unknown_header_fields_size);
-        ret = bdrv_pread(bs->file, sizeof(header),
-                         s->unknown_header_fields_size,
-                         s->unknown_header_fields, 0);
+        ret = bdrv_co_pread(bs->file, sizeof(header),
+                            s->unknown_header_fields_size,
+                            s->unknown_header_fields, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Could not read unknown qcow2 header "
                              "fields");
@@ -1579,8 +1579,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
             ret = -ENOMEM;
             goto fail;
         }
-        ret = bdrv_pread(bs->file, s->l1_table_offset, s->l1_size * L1E_SIZE,
-                         s->l1_table, 0);
+        ret = bdrv_co_pread(bs->file, s->l1_table_offset, s->l1_size * L1E_SIZE,
+                            s->l1_table, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Could not read L1 table");
             goto fail;
@@ -1699,8 +1699,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
         }
 
         s->image_backing_file = g_malloc(len + 1);
-        ret = bdrv_pread(bs->file, header.backing_file_offset, len,
-                         s->image_backing_file, 0);
+        ret = bdrv_co_pread(bs->file, header.backing_file_offset, len,
+                            bs->auto_backing_file, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Could not read backing file name");
             goto fail;
@@ -3679,7 +3679,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
             cpu_to_be64(QCOW2_INCOMPAT_EXTL2);
     }
 
-    ret = blk_pwrite(blk, 0, cluster_size, header, 0);
+    ret = blk_co_pwrite(blk, 0, cluster_size, header, 0);
     g_free(header);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not write qcow2 header");
@@ -3689,7 +3689,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     /* Write a refcount table with one refcount block */
     refcount_table = g_malloc0(2 * cluster_size);
     refcount_table[0] = cpu_to_be64(2 * cluster_size);
-    ret = blk_pwrite(blk, cluster_size, 2 * cluster_size, refcount_table, 0);
+    ret = blk_co_pwrite(blk, cluster_size, 2 * cluster_size, refcount_table, 0);
     g_free(refcount_table);
 
     if (ret < 0) {
@@ -3744,8 +3744,8 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     }
 
     /* Okay, now that we have a valid image, let's give it the right size */
-    ret = blk_truncate(blk, qcow2_opts->size, false, qcow2_opts->preallocation,
-                       0, errp);
+    ret = blk_co_truncate(blk, qcow2_opts->size, false,
+                          qcow2_opts->preallocation, 0, errp);
     if (ret < 0) {
         error_prepend(errp, "Could not resize image: ");
         goto out;
-- 
2.37.3


