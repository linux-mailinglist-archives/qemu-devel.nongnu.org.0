Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553535FDA06
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:12:27 +0200 (CEST)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiy0g-0001ui-Dz
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTH-0001ez-QW
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTF-00049K-11
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3atP9m9y4dWbFKHTecCO4OZPzDMHdkM+aumNDlBfb94=;
 b=Xhg5WLCHEIo7OUlwX4H7XeZ1qr4nGi2vjXdamiLMo7zpfPZ0PlwctJBKPqKZRpjPWbiUNa
 cGuk7hKtnb6TaigSRF3iEHFuBgCcP5lqDxWBlHcEPcm+UWm2ZkYnk8E9ISvhPWTNqFDXPW
 57GmZfx+f9OjxZVm4z5zV+b2q4vlwaY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-eX0rTaRGMiiv3JWh_FM45A-1; Thu, 13 Oct 2022 08:37:51 -0400
X-MC-Unique: eX0rTaRGMiiv3JWh_FM45A-1
Received: by mail-ej1-f72.google.com with SMTP id
 dt13-20020a170907728d00b007825956d979so833741ejc.15
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3atP9m9y4dWbFKHTecCO4OZPzDMHdkM+aumNDlBfb94=;
 b=J5uYgqHs5/GMaVrnrtDZWE+B9j7+1jg0qBPCY9RHVVilWafHejNdHAU36jT7bUDzlj
 s2Z3CY3qkUrZdf+4YyVLmoqHnSN2zlseF44F5APnppnNNJvk/28HM7sLIGcREBwamn6H
 XTE5ro2d2qhISeBQXUjG065t21ksVA8PcrfBW7gCgx1h35LeHDK0c0QpCT4NSErivJhP
 ZhFFW+2+TufUcMDTEscDV6qJlzNlpMnfeaVgOcYovoglUL37I5H+QtBfMzO8gX21ltSO
 gnin43CHCm9OmV0OxdTFdS5G24vSjd15MIa87UXNnLWnPDN+btlPKvDF6e6+K1IoueB3
 BWow==
X-Gm-Message-State: ACrzQf31ReEZ1DJUq7WNdXxPiTDvVZwGSOlceAZvuzSWXbPu0U6ctm6Y
 fyaXF/imeuNWDQCUGE1N7BxqyMCv8AXsxUMfSqhIwTmME9r78zX63fBQ3CgzdiHji5RB5f/4HgJ
 ul6PnKjgwXO5P2Nc+P+cpeT0DoTrBKV+PVHU9J4ljse8uUNX7NoKw2SoxcHUV6q2Zv6w=
X-Received: by 2002:a05:6402:84d:b0:454:f41d:6ccf with SMTP id
 b13-20020a056402084d00b00454f41d6ccfmr31054022edz.129.1665664669425; 
 Thu, 13 Oct 2022 05:37:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6PdbKDI81TsZgDzKTM1NEvJSo0FNqWLEJQi8AfEB9WFVqiIJLs+YHBrTGRsGFyaxRnJOUmHQ==
X-Received: by 2002:a05:6402:84d:b0:454:f41d:6ccf with SMTP id
 b13-20020a056402084d00b00454f41d6ccfmr31054000edz.129.1665664669139; 
 Thu, 13 Oct 2022 05:37:49 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a17090676d100b0074136cac2e7sm2958207ejn.81.2022.10.13.05.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 12/24] qcow2: manually add more coroutine_fn annotations
Date: Thu, 13 Oct 2022 14:36:59 +0200
Message-Id: <20221013123711.620631-13-pbonzini@redhat.com>
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

The validity of these was double-checked with Alberto Faria's static analyzer.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qcow2-bitmap.c   |  4 ++--
 block/qcow2-cluster.c  | 18 +++++++++---------
 block/qcow2-refcount.c |  8 ++++----
 block/qcow2.h          | 18 +++++++++---------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 7197754843..1ff127647a 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -955,8 +955,8 @@ static void set_readonly_helper(gpointer bitmap, gpointer value)
  * If header_updated is not NULL then it is set appropriately regardless of
  * the return value.
  */
-bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
-                              Error **errp)
+bool coroutine_fn qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
+                                           Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2BitmapList *bm_list;
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 0f293950a1..523c37215a 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -31,7 +31,7 @@
 #include "qemu/memalign.h"
 #include "trace.h"
 
-int qcow2_shrink_l1_table(BlockDriverState *bs, uint64_t exact_size)
+int coroutine_fn qcow2_shrink_l1_table(BlockDriverState *bs, uint64_t exact_size)
 {
     BDRVQcow2State *s = bs->opaque;
     int new_l1_size, i, ret;
@@ -823,10 +823,10 @@ static int get_cluster_table(BlockDriverState *bs, uint64_t offset,
  *
  * Return 0 on success and -errno in error cases
  */
-int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
-                                          uint64_t offset,
-                                          int compressed_size,
-                                          uint64_t *host_offset)
+int coroutine_fn qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
+                                                       uint64_t offset,
+                                                       int compressed_size,
+                                                       uint64_t *host_offset)
 {
     BDRVQcow2State *s = bs->opaque;
     int l2_index, ret;
@@ -1488,7 +1488,7 @@ static int coroutine_fn handle_dependencies(BlockDriverState *bs,
  *
  *  -errno: in error cases
  */
-static int handle_copied(BlockDriverState *bs, uint64_t guest_offset,
+static int coroutine_fn handle_copied(BlockDriverState *bs, uint64_t guest_offset,
     uint64_t *host_offset, uint64_t *bytes, QCowL2Meta **m)
 {
     BDRVQcow2State *s = bs->opaque;
@@ -1653,7 +1653,7 @@ static int do_alloc_cluster_offset(BlockDriverState *bs, uint64_t guest_offset,
  *
  *  -errno: in error cases
  */
-static int handle_alloc(BlockDriverState *bs, uint64_t guest_offset,
+static int coroutine_fn handle_alloc(BlockDriverState *bs, uint64_t guest_offset,
     uint64_t *host_offset, uint64_t *bytes, QCowL2Meta **m)
 {
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 1fbb07ca77..38861ed7c8 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -97,7 +97,7 @@ static void update_max_refcount_table_index(BDRVQcow2State *s)
     s->max_refcount_table_index = i;
 }
 
-int qcow2_refcount_init(BlockDriverState *bs)
+int coroutine_fn qcow2_refcount_init(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     unsigned int refcount_table_size2, i;
@@ -3559,8 +3559,8 @@ static int64_t get_refblock_offset(BlockDriverState *bs, uint64_t offset)
     return covering_refblock_offset;
 }
 
-static int qcow2_discard_refcount_block(BlockDriverState *bs,
-                                        uint64_t discard_block_offs)
+static int coroutine_fn qcow2_discard_refcount_block(BlockDriverState *bs,
+                                                     uint64_t discard_block_offs)
 {
     BDRVQcow2State *s = bs->opaque;
     int64_t refblock_offs;
@@ -3616,7 +3616,7 @@ static int qcow2_discard_refcount_block(BlockDriverState *bs,
     return 0;
 }
 
-int qcow2_shrink_reftable(BlockDriverState *bs)
+int coroutine_fn qcow2_shrink_reftable(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t *reftable_tmp =
diff --git a/block/qcow2.h b/block/qcow2.h
index ad6e7f65bd..32612e53e5 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -846,7 +846,7 @@ int qcow2_validate_table(BlockDriverState *bs, uint64_t offset,
                          Error **errp);
 
 /* qcow2-refcount.c functions */
-int qcow2_refcount_init(BlockDriverState *bs);
+int coroutine_fn qcow2_refcount_init(BlockDriverState *bs);
 void qcow2_refcount_close(BlockDriverState *bs);
 
 int qcow2_get_refcount(BlockDriverState *bs, int64_t cluster_index,
@@ -893,14 +893,14 @@ int qcow2_inc_refcounts_imrt(BlockDriverState *bs, BdrvCheckResult *res,
 int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
                                 BlockDriverAmendStatusCB *status_cb,
                                 void *cb_opaque, Error **errp);
-int qcow2_shrink_reftable(BlockDriverState *bs);
+int coroutine_fn qcow2_shrink_reftable(BlockDriverState *bs);
 int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
 int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
                         bool exact_size);
-int qcow2_shrink_l1_table(BlockDriverState *bs, uint64_t max_size);
+int coroutine_fn qcow2_shrink_l1_table(BlockDriverState *bs, uint64_t max_size);
 int qcow2_write_l1_entry(BlockDriverState *bs, int l1_index);
 int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
                           uint8_t *buf, int nb_sectors, bool enc, Error **errp);
@@ -911,10 +911,10 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
 int coroutine_fn qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
                                          unsigned int *bytes,
                                          uint64_t *host_offset, QCowL2Meta **m);
-int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
-                                          uint64_t offset,
-                                          int compressed_size,
-                                          uint64_t *host_offset);
+int coroutine_fn qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
+                                                       uint64_t offset,
+                                                       int compressed_size,
+                                                       uint64_t *host_offset);
 void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
                                      uint64_t *coffset, int *csize);
 
@@ -982,8 +982,8 @@ void qcow2_cache_discard(Qcow2Cache *c, void *table);
 int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                                   void **refcount_table,
                                   int64_t *refcount_table_size);
-bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
-                              Error **errp);
+bool coroutine_fn qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
+                                           Error **errp);
 bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                 Qcow2BitmapInfoList **info_list, Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
-- 
2.37.3


