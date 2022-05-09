Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EB251FAC0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:02:25 +0200 (CEST)
Received: from localhost ([::1]:55200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no19h-0006FZ-NP
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fL-0004zS-Kw
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fJ-0002pd-Rj
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzU5IHAzusLhWRGNiU25CUXtF/pymsNhoaAEvkVR6D4=;
 b=YpIc/E9ufIBf7MjM9UdtJpom0lDMR3XxugLlDPSQWo86GNWsmiLvChtx1aQy4waTBFP/co
 WpwN+La18Do84rE5AbGjQ54qMK3FXpjjzzxxFdQjT9cU1bOEy3KHsp2AnRqmwI34hgDDoT
 W6OWmGe18m1UGmRFb7dGq5bR+tYFaAs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-3a0s0TAPONeJauFNw3urLw-1; Mon, 09 May 2022 06:30:56 -0400
X-MC-Unique: 3a0s0TAPONeJauFNw3urLw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n186-20020a1c27c3000000b00392ae974ca1so4667008wmn.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzU5IHAzusLhWRGNiU25CUXtF/pymsNhoaAEvkVR6D4=;
 b=R0qRa9Y6Ll5cOOV9yJ4KCb7/LLbQb7eJ31ykT2Sf8O7sJtrIfTqoY1HyKVuKebSb4L
 A3CEY9ytBamrH/CFHo/D4lwTayyiZ9AAib8o09Jyu4gTQq2c70F7YJd0Mra7b/NNAxzk
 EvwoFn2lm7fIewZUJlLweLJjqdYNWjOH3ejQhNzPx3IUFxII0uf/yLrfxlsVjSUraeJQ
 Mi7Mc5nDpHGclwwD1jsL8gKAIzjKAt1r2kxv/BkjKqcAjVXNT7UL7gRu7sxyjCfMY+HJ
 7uraLUhNmx5KDKuGbHhQNe9+7XmhC8OJMOF6by74ZcpzDVqKRhtQkJ40Ze2WCdGYDTdO
 KKTg==
X-Gm-Message-State: AOAM532s4/Lw708VUattpcWf2bJBQRZRMF7tdKT4z81zIklCNRKuO6N5
 XLq8BYHjmB8ptXJk7S6tWD1ZULXX9OFipFGTHVJ/Szz0MmZvYJdMnkEDNbVQVNhcjxyqv6grXyR
 RbJBlKPbV/zkODhgHztfxg9ndycHGjnSp7a6myc1j9zsYNaHyxnLG2ILUtrebYBN1b8U=
X-Received: by 2002:a05:600c:1c0e:b0:394:66af:ef0c with SMTP id
 j14-20020a05600c1c0e00b0039466afef0cmr15354568wms.85.1652092254207; 
 Mon, 09 May 2022 03:30:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn49IndA3fw/kxSeAgn/nsRJLSf+pwp1ql2pRRS8N13mk2MPg15JQ8f5S3hW7oBiGj0nneVQ==
X-Received: by 2002:a05:600c:1c0e:b0:394:66af:ef0c with SMTP id
 j14-20020a05600c1c0e00b0039466afef0cmr15354528wms.85.1652092253671; 
 Mon, 09 May 2022 03:30:53 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4d8a000000b0020c5253d8f3sm13251637wru.63.2022.05.09.03.30.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/26] qcow2: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:07 +0200
Message-Id: <20220509103019.215041-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qcow2-cluster.c  | 18 +++++++++---------
 block/qcow2-refcount.c |  2 +-
 block/qcow2.c          |  4 ++--
 block/qcow2.h          | 14 +++++++-------
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 20a16ba6ee..37fc7b905a 100644
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
index 404d56e258..17be4425f2 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -3704,7 +3704,7 @@ int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size)
     return -EIO;
 }
 
-int qcow2_detect_metadata_preallocation(BlockDriverState *bs)
+int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     int64_t i, end_cluster, cluster_count = 0, threshold;
diff --git a/block/qcow2.c b/block/qcow2.c
index 4f5e6440fb..62cb153987 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2438,7 +2438,7 @@ static bool merge_cow(uint64_t offset, unsigned bytes,
  * Return 1 if the COW regions read as zeroes, 0 if not, < 0 on error.
  * Note that returning 0 does not guarantee non-zero data.
  */
-static int is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
+static int coroutine_fn is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
 {
     /*
      * This check is designed for optimization shortcut so it must be
@@ -2456,7 +2456,7 @@ static int is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
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
2.35.1


