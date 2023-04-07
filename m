Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44A56DAFBC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:34:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pko5f-0007jJ-Up; Fri, 07 Apr 2023 11:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5d-0007i5-Hd
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5b-0003r4-JE
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680881602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svRGxi9rNMfS0EMcrewTPayf3gkwjgF3u0W1ESXi1b8=;
 b=YOHeafxarxB5+4esx8ZVF90nAqNWNHNcSgmRvNxXB9q81K9efLA0uCIIo1H1O0cCWJeWbZ
 qXdWwpJjWgrV+6ibFqKAypViYH0CvOrnHXCLrkpMjsrwvk+RoKTTKp4OwS3VXwW1FWi2hj
 EThFHD8u3u9CiwyxWG593dI6BwdH35g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-PQ93GlX3NMG8fmE1dOARCA-1; Fri, 07 Apr 2023 11:33:21 -0400
X-MC-Unique: PQ93GlX3NMG8fmE1dOARCA-1
Received: by mail-wm1-f72.google.com with SMTP id
 u12-20020a05600c19cc00b003f07be0e96bso629534wmq.7
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 08:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680881600; x=1683473600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=svRGxi9rNMfS0EMcrewTPayf3gkwjgF3u0W1ESXi1b8=;
 b=rHVrgukAjZMU0C27w5c5Eh1xAoGaCCfaJwLa9+AAqw7LThYNT+vBafORm8WbrM58G/
 nMWf98FVeoDW2vgz7AwvDtD3uD+uO4CJk3RXlwDxvHWWvAHO+OzOiWS8FZXQ+l31KLeT
 qc3vN8X/C9eLrtjoAB9NODf+WTy6DdnAAKDf5gKx6ywp8ossePoranhT/k+flah4f+Zv
 Pop8eXCsxY6MBbptA5a8vNZB+ibT8S/k0jKzKbkLvq+G9kE/FmCOZUO406Jl/PQV+wro
 7B2mZffeCY0sb79l2c4xdGj9Ji/Y7FKYWpcM5xT7AWJjGGCExhi2pUnQabXUhdCxwFJo
 si2g==
X-Gm-Message-State: AAQBX9ecZBOa96agUJvjSwhatmZkUh91k/9WBJJF/MFkARgsIyaoxieV
 f+bqJjKJVnMqNJ/3ZjL/L4nuKh1bvRfzqFQGOeHAmexFo0OgTfqiN8UBX9ohBZKm5PAXNzox1pi
 BwNsk9N1wOCqRbvAi16FcIW6glzeMRKcaMxKSF4XNAqQs9nrHKA4lwy7ZDjQ5qLDD050fm/nK9W
 0=
X-Received: by 2002:a5d:4fca:0:b0:2ef:18fa:47ca with SMTP id
 h10-20020a5d4fca000000b002ef18fa47camr1555032wrw.47.1680881599980; 
 Fri, 07 Apr 2023 08:33:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZP1fO3IB8zm/6xTxHnhdCPbbdOoUoGJGbEeY3SnsptQqSjnvIcV/gXKsV3kOKQHCQDFINmiw==
X-Received: by 2002:a5d:4fca:0:b0:2ef:18fa:47ca with SMTP id
 h10-20020a5d4fca000000b002ef18fa47camr1555015wrw.47.1680881599589; 
 Fri, 07 Apr 2023 08:33:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4c90000000b002cf1c435afcsm4792154wrs.11.2023.04.07.08.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:33:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 hreitz@redhat.com
Subject: [PATCH 8/8] block,
 block-backend: write some hot coroutine wrappers by hand
Date: Fri,  7 Apr 2023 17:33:03 +0200
Message-Id: <20230407153303.391121-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407153303.391121-1-pbonzini@redhat.com>
References: <20230407153303.391121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The introduction of the graph lock is causing blk_get_geometry, a hot function
used in the I/O path, to create a coroutine.  However, the only part that really
needs to run in coroutine context is the call to bdrv_co_refresh_total_sectors,
which in turn only happens in the rare case of host CD-ROM devices.

So, write by hand the three wrappers on the path from blk_co_get_geometry to
bdrv_co_refresh_total_sectors, so that the coroutine wrapper is only created
if bdrv_nb_sectors actually calls bdrv_refresh_total_sectors.

Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c                           | 22 ++++++++++++++++++++++
 block/block-backend.c             | 27 +++++++++++++++++++++++++++
 
 include/sysemu/block-backend-io.h |  5 ++---
 4 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index dbbc8de30c24..3390efd18cf6 100644
--- a/block.c
+++ b/block.c
@@ -5859,6 +5859,28 @@ int64_t coroutine_fn bdrv_co_nb_sectors(BlockDriverState *bs)
     return bs->total_sectors;
 }
 
+/*
+ * This wrapper is written by hand because this function is in the hot I/O path,
+ * via blk_get_geometry.
+ */
+int64_t coroutine_mixed_fn bdrv_nb_sectors(BlockDriverState *bs)
+{
+    BlockDriver *drv = bs->drv;
+    IO_CODE();
+
+    if (!drv)
+        return -ENOMEDIUM;
+
+    if (!bs->bl.has_variable_length) {
+        int ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    return bs->total_sectors;
+}
+
 /**
  * Return length in bytes on success, -errno on error.
  * The length is always a multiple of BDRV_SECTOR_SIZE.
diff --git a/block/block-backend.c b/block/block-backend.c
index d08e949799ee..a9767466af69 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1641,6 +1641,23 @@ int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk)
     }
 }
 
+/*
+ * This wrapper is written by hand because this function is in the hot I/O path,
+ * via blk_get_geometry.
+ */
+int64_t coroutine_mixed_fn blk_nb_sectors(BlockBackend *blk)
+{
+    BlockDriverState *bs = blk_bs(blk);
+
+    IO_CODE();
+
+    if (!bs) {
+        return -ENOMEDIUM;
+    } else {
+        return bdrv_nb_sectors(blk_bs(blk));
+    }
+}
+
 /* return 0 as number of sectors if no device present or error */
 void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
                                       uint64_t *nb_sectors_ptr)
@@ -1649,6 +1666,16 @@ void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
     *nb_sectors_ptr = ret < 0 ? 0 : ret;
 }
 
+/*
+ * This wrapper is written by hand because this function is in the hot I/O path.
+ */
+void coroutine_mixed_fn blk_get_geometry(BlockBackend *blk,
+                                         uint64_t *nb_sectors_ptr)
+{
+    int64_t ret = blk_nb_sectors(blk);
+    *nb_sectors_ptr = ret < 0 ? 0 : ret;
+}
+
 BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
                            QEMUIOVector *qiov, BdrvRequestFlags flags,
                            BlockCompletionFunc *cb, void *opaque)
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 9e2248a295a6..5dab88521d02 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -79,7 +79,7 @@ bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
                  PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
 
 int64_t coroutine_fn GRAPH_RDLOCK bdrv_co_nb_sectors(BlockDriverState *bs);
-int64_t co_wrapper_mixed_bdrv_rdlock bdrv_nb_sectors(BlockDriverState *bs);
+int64_t coroutine_mixed_fn bdrv_nb_sectors(BlockDriverState *bs);
 
 int64_t coroutine_fn GRAPH_RDLOCK bdrv_co_getlength(BlockDriverState *bs);
 int64_t co_wrapper_mixed_bdrv_rdlock bdrv_getlength(BlockDriverState *bs);
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 9736346d7940..851a44de9642 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -72,11 +72,10 @@ int64_t co_wrapper_mixed blk_getlength(BlockBackend *blk);
 
 void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
                                       uint64_t *nb_sectors_ptr);
-void co_wrapper_mixed blk_get_geometry(BlockBackend *blk,
-                                       uint64_t *nb_sectors_ptr);
+void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr);
 
 int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk);
-int64_t co_wrapper_mixed blk_nb_sectors(BlockBackend *blk);
+int64_t blk_nb_sectors(BlockBackend *blk);
 
 void *blk_try_blockalign(BlockBackend *blk, size_t size);
 void *blk_blockalign(BlockBackend *blk, size_t size);
-- 
2.39.2


