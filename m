Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8C5BF27E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:57:29 +0200 (CEST)
Received: from localhost ([::1]:45068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oao3M-000699-D9
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam6G-0005Lj-O8
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam6E-0001U3-3S
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663714337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIE9Eu3rV4oMGlwjU8nKQXaX/q5T63VbnqoTQtYRVF8=;
 b=RDwBmEvjkCaDKO8IrrDY39Icceom3FJlk9lR3gllWJ1kgGmSGmp6cLIqYGdSobZ2E/oJy2
 PV9oc5FeYmVldBIk5AywXgo92vXExYRNqdzzyhvRPzdIqJ1fGcFp8ecsSyTtigSKXxsnJZ
 LSuOnTKnp9PKAZZq3Iwb2lA0nf2xvy8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-XH2fB0rvPQ2WWFKS-S4Hvg-1; Tue, 20 Sep 2022 18:52:16 -0400
X-MC-Unique: XH2fB0rvPQ2WWFKS-S4Hvg-1
Received: by mail-qt1-f198.google.com with SMTP id
 g21-20020ac87d15000000b0035bb6f08778so2898307qtb.2
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VIE9Eu3rV4oMGlwjU8nKQXaX/q5T63VbnqoTQtYRVF8=;
 b=QxDUL5I1DfeiGay8fwNDtcR/k7fz9GSurovmgM6/tbzImzUesh9GyYnqZokVmU4EoZ
 GMBmsf7SN/1UwCHKRzEiHld6XwUXCOLkGwBufZrcl36G/eZ1z7QpIqw2IL+PtFujDm4x
 d7Oonq7lqAEhqK1RapJXr8CkQwQ0OZlKHW9TTryRZIm9txDjcEEUUkoTN9FJdPpL6Csc
 6RLSsIIFR6j0O1DKY6zti2nRH/GgV+2F2LvJzkQ6UJt5VezNVY4pXNVi9Bj2kSzykaol
 jOq18C1mzkWOKalJrM7+AFHSJZvb3ASUNwKlbqoc1mhkmQLCDeAxQN+UmaDJawawJIc1
 wf8A==
X-Gm-Message-State: ACrzQf0PoDCywl8UuYfWc6zx38hHOr7jTDdqxwGQ17YobYibrNu5M7SK
 8fokjKO5vbJFIEys3TdvFyGqaT5p9mW7jalJju8UCJEtOcUD7VKf7WyMowxB1t1L4t2KTJYlO+9
 aVbeNiSydwVZhPvpbBznTpigBI1s330Wvep10l7jSx3fMKK7VUDsQOVJQVdqbR4v3
X-Received: by 2002:a05:620a:22c5:b0:6ce:8e1:fd8c with SMTP id
 o5-20020a05620a22c500b006ce08e1fd8cmr18364903qki.393.1663714335307; 
 Tue, 20 Sep 2022 15:52:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5spK43AIwkYj0RqUP5nFBePEnJ/WNweV5FDkEcZBAFmE9yjH9h6nnQGReocljTXLgxptgQtA==
X-Received: by 2002:a05:620a:22c5:b0:6ce:8e1:fd8c with SMTP id
 o5-20020a05620a22c500b006ce08e1fd8cmr18364884qki.393.1663714335011; 
 Tue, 20 Sep 2022 15:52:15 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 e3-20020ac84e43000000b0031f0b43629dsm619185qtw.23.2022.09.20.15.52.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:52:14 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 06/14] migration: Use atomic ops properly for page accountings
Date: Tue, 20 Sep 2022 18:52:12 -0400
Message-Id: <20220920225212.48785-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920225106.48451-1-peterx@redhat.com>
References: <20220920225106.48451-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

To prepare for thread-safety on page accountings, at least below counters
need to be accessed only atomically, they are:

        ram_counters.transferred
        ram_counters.duplicate
        ram_counters.normal
        ram_counters.postcopy_bytes

There are a lot of other counters but they won't be accessed outside
migration thread, then they're still safe to be accessed without atomic
ops.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 10 +++++-----
 migration/multifd.c   |  2 +-
 migration/ram.c       | 29 +++++++++++++++--------------
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 07c74a79a2..0eacc0c99b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1048,13 +1048,13 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
 
     info->has_ram = true;
     info->ram = g_malloc0(sizeof(*info->ram));
-    info->ram->transferred = ram_counters.transferred;
+    info->ram->transferred = qatomic_read(&ram_counters.transferred);
     info->ram->total = ram_bytes_total();
-    info->ram->duplicate = ram_counters.duplicate;
+    info->ram->duplicate = qatomic_read(&ram_counters.duplicate);
     /* legacy value.  It is not used anymore */
     info->ram->skipped = 0;
-    info->ram->normal = ram_counters.normal;
-    info->ram->normal_bytes = ram_counters.normal * page_size;
+    info->ram->normal = qatomic_read(&ram_counters.normal);
+    info->ram->normal_bytes = info->ram->normal * page_size;
     info->ram->mbps = s->mbps;
     info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
     info->ram->dirty_sync_missed_zero_copy =
@@ -1065,7 +1065,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->pages_per_second = s->pages_per_second;
     info->ram->precopy_bytes = ram_counters.precopy_bytes;
     info->ram->downtime_bytes = ram_counters.downtime_bytes;
-    info->ram->postcopy_bytes = ram_counters.postcopy_bytes;
+    info->ram->postcopy_bytes = qatomic_read(&ram_counters.postcopy_bytes);
 
     if (migrate_use_xbzrle()) {
         info->has_xbzrle_cache = true;
diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d65..460326acd4 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -437,7 +437,7 @@ static int multifd_send_pages(QEMUFile *f)
                 + p->packet_len;
     qemu_file_acct_rate_limit(f, transferred);
     ram_counters.multifd_bytes += transferred;
-    ram_counters.transferred += transferred;
+    qatomic_add(&ram_counters.transferred, transferred);
     qemu_mutex_unlock(&p->mutex);
     qemu_sem_post(&p->sem);
 
diff --git a/migration/ram.c b/migration/ram.c
index 6e7de6087a..5bd3d76bf0 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -432,11 +432,11 @@ static void ram_transferred_add(uint64_t bytes)
     if (runstate_is_running()) {
         ram_counters.precopy_bytes += bytes;
     } else if (migration_in_postcopy()) {
-        ram_counters.postcopy_bytes += bytes;
+        qatomic_add(&ram_counters.postcopy_bytes, bytes);
     } else {
         ram_counters.downtime_bytes += bytes;
     }
-    ram_counters.transferred += bytes;
+    qatomic_add(&ram_counters.transferred, bytes);
 }
 
 void dirty_sync_missed_zero_copy(void)
@@ -725,7 +725,7 @@ void mig_throttle_counter_reset(void)
 
     rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     rs->num_dirty_pages_period = 0;
-    rs->bytes_xfer_prev = ram_counters.transferred;
+    rs->bytes_xfer_prev = qatomic_read(&ram_counters.transferred);
 }
 
 /**
@@ -1085,8 +1085,9 @@ uint64_t ram_pagesize_summary(void)
 
 uint64_t ram_get_total_transferred_pages(void)
 {
-    return  ram_counters.normal + ram_counters.duplicate +
-                compression_counters.pages + xbzrle_counters.pages;
+    return  qatomic_read(&ram_counters.normal) +
+        qatomic_read(&ram_counters.duplicate) +
+        compression_counters.pages + xbzrle_counters.pages;
 }
 
 static void migration_update_rates(RAMState *rs, int64_t end_time)
@@ -1145,8 +1146,8 @@ static void migration_trigger_throttle(RAMState *rs)
 {
     MigrationState *s = migrate_get_current();
     uint64_t threshold = s->parameters.throttle_trigger_threshold;
-
-    uint64_t bytes_xfer_period = ram_counters.transferred - rs->bytes_xfer_prev;
+    uint64_t bytes_xfer_period =
+        qatomic_read(&ram_counters.transferred) - rs->bytes_xfer_prev;
     uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
     uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
 
@@ -1285,7 +1286,7 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
     int len = save_zero_page_to_file(rs, rs->f, block, offset);
 
     if (len) {
-        ram_counters.duplicate++;
+        qatomic_inc(&ram_counters.duplicate);
         ram_transferred_add(len);
         return 1;
     }
@@ -1322,9 +1323,9 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     }
 
     if (bytes_xmit > 0) {
-        ram_counters.normal++;
+        qatomic_inc(&ram_counters.normal);
     } else if (bytes_xmit == 0) {
-        ram_counters.duplicate++;
+        qatomic_inc(&ram_counters.duplicate);
     }
 
     return true;
@@ -1354,7 +1355,7 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
         qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
     }
     ram_transferred_add(TARGET_PAGE_SIZE);
-    ram_counters.normal++;
+    qatomic_inc(&ram_counters.normal);
     return 1;
 }
 
@@ -1448,7 +1449,7 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
     ram_transferred_add(bytes_xmit);
 
     if (param->zero_page) {
-        ram_counters.duplicate++;
+        qatomic_inc(&ram_counters.duplicate);
         return;
     }
 
@@ -2620,9 +2621,9 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     uint64_t pages = size / TARGET_PAGE_SIZE;
 
     if (zero) {
-        ram_counters.duplicate += pages;
+        qatomic_add(&ram_counters.duplicate, pages);
     } else {
-        ram_counters.normal += pages;
+        qatomic_add(&ram_counters.normal, pages);
         ram_transferred_add(size);
         qemu_file_credit_transfer(f, size);
     }
-- 
2.32.0


