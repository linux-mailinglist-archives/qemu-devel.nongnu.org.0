Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540925E5EDD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:47:10 +0200 (CEST)
Received: from localhost ([::1]:45884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obInU-0001ta-Qb
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu6-0004SB-UZ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu5-0003Dx-4C
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z170oJoKSKZDpg7rTxvcQkX8GrHO+LozmHjN9GFYeEU=;
 b=JrQ6P6dXE9GSwMMNstnwADglOhCXq+GjuCbCTlDLENxb2+dKSJMQlKbkEYgoqSiCKxGCse
 16/U60PSLfQcxB7Mz4Vv8OCTA1AJlSEmikVlAnuBUfbaC98WdcBEYWBXNhXprmdocqLktR
 LYVFtAEZGBeBosaTHDMfVRYvIvKgfG0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-R3QSiDPBPTCDKl4zTfvCMQ-1; Thu, 22 Sep 2022 04:49:48 -0400
X-MC-Unique: R3QSiDPBPTCDKl4zTfvCMQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 qb30-20020a1709077e9e00b0077d1271283eso4142890ejc.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=z170oJoKSKZDpg7rTxvcQkX8GrHO+LozmHjN9GFYeEU=;
 b=wWWR/EXgeW5T6rs8qq/XCd+rIqmXvR4MNOZERue99SSaRX8ksU23SrMZ3fBDeacg6U
 2fmHQ3NpuQH//QWNuUms7RfAB+AHG/p4ZJnxbJ1bHq1eJ8pyFsA/bYyDDhgR5pHa3kvX
 VaVWVtt7V/FDEFiNgKJ2nFEQy0s0r9XkFL3LicBjAzpfHU/WSqbYtSqT6VO1mUtaknro
 0AX0qi4NMS3gdVrOgBdvB4+6OOG1W3MFoNl7YDjsZYmOVnwOyMrDySqRt3TOc/T6bAQW
 UxZ2Onqfgopb9EzY0DW5eehXQWggQZTpAkC4iZoS7Xtog1rX+4TucT7x5uHD2t2VLWlI
 g9ow==
X-Gm-Message-State: ACrzQf2S2iJ5c63fKkenSQQOxg+fey7g1oxeMrC5wUNxnCBLR30BpS//
 eZGgAvWnPQDkXFgQuMx8AQRfz+ZQzParoLZ26kTCcwf3T4eVyauagcm+mq5wgnPzYAwuOsV0qh0
 34DnC0K2lxPOHka2MQtQGjl6AgOb7qcMToAA0OFak2Ruc+fx8+PWBLfFlenxv3Q+nqig=
X-Received: by 2002:aa7:c849:0:b0:453:9543:6ef3 with SMTP id
 g9-20020aa7c849000000b0045395436ef3mr2165288edt.105.1663836586920; 
 Thu, 22 Sep 2022 01:49:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Ano8/YtlsfI/MjgIvxdBNgYwYzmOYSuluImiPTRUp44OOmcj+0J+r7iDuczBZS5o+5s1tlg==
X-Received: by 2002:aa7:c849:0:b0:453:9543:6ef3 with SMTP id
 g9-20020aa7c849000000b0045395436ef3mr2165260edt.105.1663836586644; 
 Thu, 22 Sep 2022 01:49:46 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a17090630d500b0071cef6c53aesm2356943ejb.0.2022.09.22.01.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 14/26] qcow2: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:12 +0200
Message-Id: <20220922084924.201610-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qcow2-cluster.c  | 18 +++++++++---------
 block/qcow2-refcount.c |  2 +-
 block/qcow2.c          |  4 ++--
 block/qcow2.h          | 14 +++++++-------
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index fd32316d6f..f6a12ed510 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -884,7 +884,7 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
     return 0;
 }
 
-static int perform_cow(BlockDriverState *bs, QCowL2Meta *m)
+static int coroutine_fn perform_cow(BlockDriverState *bs, QCowL2Meta *m)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2COWRegion *start = &m->cow_start;
@@ -1024,7 +1024,7 @@ fail:
     return ret;
 }
 
-int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
+int coroutine_fn qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
 {
     BDRVQcow2State *s = bs->opaque;
     int i, j = 0, l2_index, ret;
@@ -1397,8 +1397,8 @@ static int count_single_write_clusters(BlockDriverState *bs, int nb_clusters,
  *           information on cluster allocation may be invalid now. The caller
  *           must start over anyway, so consider *cur_bytes undefined.
  */
-static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
-    uint64_t *cur_bytes, QCowL2Meta **m)
+static int coroutine_fn handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
+                                            uint64_t *cur_bytes, QCowL2Meta **m)
 {
     BDRVQcow2State *s = bs->opaque;
     QCowL2Meta *old_alloc;
@@ -1772,9 +1772,9 @@ out:
  *
  * Return 0 on success and -errno in error cases
  */
-int qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
-                            unsigned int *bytes, uint64_t *host_offset,
-                            QCowL2Meta **m)
+int coroutine_fn qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
+                                         unsigned int *bytes, uint64_t *host_offset,
+                                         QCowL2Meta **m)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t start, remaining;
@@ -2105,8 +2105,8 @@ out:
     return ret;
 }
 
-int qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
-                             uint64_t bytes, int flags)
+int coroutine_fn qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
+                                          uint64_t bytes, int flags)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t end_offset = offset + bytes;
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 1a6277c783..1fbb07ca77 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -3706,7 +3706,7 @@ int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size)
     return -EIO;
 }
 
-int qcow2_detect_metadata_preallocation(BlockDriverState *bs)
+int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     int64_t i, end_cluster, cluster_count = 0, threshold;
diff --git a/block/qcow2.c b/block/qcow2.c
index c6c6692fb7..b4d04e91fa 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2436,7 +2436,7 @@ static bool merge_cow(uint64_t offset, unsigned bytes,
  * Return 1 if the COW regions read as zeroes, 0 if not, < 0 on error.
  * Note that returning 0 does not guarantee non-zero data.
  */
-static int is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
+static int coroutine_fn is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
 {
     /*
      * This check is designed for optimization shortcut so it must be
@@ -2454,7 +2454,7 @@ static int is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
                                 m->cow_end.nb_bytes);
 }
 
-static int handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
+static int coroutine_fn handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
 {
     BDRVQcow2State *s = bs->opaque;
     QCowL2Meta *m;
diff --git a/block/qcow2.h b/block/qcow2.h
index c8d9e8ea79..36495d9051 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -895,7 +895,7 @@ int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
                                 void *cb_opaque, Error **errp);
 int qcow2_shrink_reftable(BlockDriverState *bs);
 int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
-int qcow2_detect_metadata_preallocation(BlockDriverState *bs);
+int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
@@ -908,9 +908,9 @@ int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
 int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
                           unsigned int *bytes, uint64_t *host_offset,
                           QCow2SubclusterType *subcluster_type);
-int qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
-                            unsigned int *bytes, uint64_t *host_offset,
-                            QCowL2Meta **m);
+int coroutine_fn qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
+                                         unsigned int *bytes, uint64_t *host_offset,
+                                         QCowL2Meta **m);
 int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
                                           int compressed_size,
@@ -918,13 +918,13 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
 void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
                                      uint64_t *coffset, int *csize);
 
-int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
+int coroutine_fn qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
 int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
                           uint64_t bytes, enum qcow2_discard_type type,
                           bool full_discard);
-int qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
-                             uint64_t bytes, int flags);
+int coroutine_fn qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
+                                          uint64_t bytes, int flags);
 
 int qcow2_expand_zero_clusters(BlockDriverState *bs,
                                BlockDriverAmendStatusCB *status_cb,
-- 
2.37.3


