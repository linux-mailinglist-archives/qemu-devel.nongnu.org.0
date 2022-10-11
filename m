Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCE85FBDA2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:06:50 +0200 (CEST)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNOi-0002Xc-Ut
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEV-0001gA-Lx
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNET-0003WE-NV
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyCTybZa1i/wY9A4srjTud0msjBpnlVizEohyZvnA0g=;
 b=ShAmzA2gZ2HBEDrAzb0M8EggNT07eailTqtXmS1YYpGdZe7REqEoAk+HXaRO7UbxX2E0KR
 x5ZuS5MTSgIOBliC9rgUf3D7DTDk8ZtKdZ294Ip5iI4pdR9rPYCKJmDiUOBcGmAE91LDqM
 F8E4TKFqXhZyUjLH3TgjJb75SbRpQuM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-u4L65gEWMQq8QU51zQTPAw-1; Tue, 11 Oct 2022 17:56:12 -0400
X-MC-Unique: u4L65gEWMQq8QU51zQTPAw-1
Received: by mail-qk1-f197.google.com with SMTP id
 h9-20020a05620a244900b006ee944ec451so435907qkn.13
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CyCTybZa1i/wY9A4srjTud0msjBpnlVizEohyZvnA0g=;
 b=4PoTHFUBildem+cQhS+k8+MxrAAbx4VwUmv1kRiJdWH8ha4+3TNRCSJ8j4xnW6ycyk
 WDQxlnLwkOa13277UaJogcpeB6UZDkYKoNEPgUoifhN5QOZrrcQBfnydrVLn9MGyFhPC
 Qz7slyrSys6quOA18LpZuP2iNAFyvCsIJ7USz11w6B1/0H8uW/F15N85xydjgT94w4J5
 e08bQZ61Tm7DBsy2voM9ENaWCYdC7wMx19zuOye6Md7x0W1RHMFE32owop/C3IaFXbHJ
 FfXx3LcR+BdqZNmjUv0bBlEb+NbhgzdJysKTmwfiBhygXNqc9cZ28yKPgKYATr3gjKqg
 pe0g==
X-Gm-Message-State: ACrzQf1RNhIpwfZQ4wulCjfFGNrU3cByqoD/xTek8ymOlgwMROnTFiE+
 /Bdjp8+ie5yHgOr03I2Eq/QU1ExScNIO2m/LqRwr0IUMIqVI3c7I0ZnK4xCsd16am//LIQFZQtF
 7fQJdB9xK4REmnVTLsXeVqMV2RjPr5t1xMTZ7bjYqGRqes1+hU8jOTAyqiDw2xakz
X-Received: by 2002:ac8:5947:0:b0:399:67fa:652 with SMTP id
 7-20020ac85947000000b0039967fa0652mr11657681qtz.519.1665525371237; 
 Tue, 11 Oct 2022 14:56:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4gXIaoQ9MPBcALjZFt9tJ6wGE2WvOm1Za+mZhcvTzrEoqwYZa5NFn+VIKS2TEckDR429z5PA==
X-Received: by 2002:ac8:5947:0:b0:399:67fa:652 with SMTP id
 7-20020ac85947000000b0039967fa0652mr11657660qtz.519.1665525370927; 
 Tue, 11 Oct 2022 14:56:10 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:10 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 07/15] migration: Use atomic ops properly for page
 accountings
Date: Tue, 11 Oct 2022 17:55:51 -0400
Message-Id: <20221011215559.602584-8-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011215559.602584-1-peterx@redhat.com>
References: <20221011215559.602584-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

To prepare for thread-safety on page accountings, at least below counters
need to be accessed only atomically, they are:

        ram_counters.transferred
        ram_counters.duplicate
        ram_counters.normal
        ram_counters.postcopy_bytes

There are a lot of other counters but they won't be accessed outside
migration thread, then they're still safe to be accessed without atomic
ops.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 10 +++++-----
 migration/multifd.c   |  4 ++--
 migration/ram.c       | 40 ++++++++++++++++++++++++----------------
 migration/ram.h       | 20 ++++++++++++++++++++
 4 files changed, 51 insertions(+), 23 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index ef00bff0b3..4364813d82 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1048,13 +1048,13 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
 
     info->has_ram = true;
     info->ram = g_malloc0(sizeof(*info->ram));
-    info->ram->transferred = ram_counters.transferred;
+    info->ram->transferred = stat64_get(&ram_atomic_counters.transferred);
     info->ram->total = ram_bytes_total();
-    info->ram->duplicate = ram_counters.duplicate;
+    info->ram->duplicate = stat64_get(&ram_atomic_counters.duplicate);
     /* legacy value.  It is not used anymore */
     info->ram->skipped = 0;
-    info->ram->normal = ram_counters.normal;
-    info->ram->normal_bytes = ram_counters.normal * page_size;
+    info->ram->normal = stat64_get(&ram_atomic_counters.normal);
+    info->ram->normal_bytes = info->ram->normal * page_size;
     info->ram->mbps = s->mbps;
     info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
     info->ram->dirty_sync_missed_zero_copy =
@@ -1065,7 +1065,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->pages_per_second = s->pages_per_second;
     info->ram->precopy_bytes = ram_counters.precopy_bytes;
     info->ram->downtime_bytes = ram_counters.downtime_bytes;
-    info->ram->postcopy_bytes = ram_counters.postcopy_bytes;
+    info->ram->postcopy_bytes = stat64_get(&ram_atomic_counters.postcopy_bytes);
 
     if (migrate_use_xbzrle()) {
         info->has_xbzrle_cache = true;
diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d65..6b1dc7c889 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -437,7 +437,7 @@ static int multifd_send_pages(QEMUFile *f)
                 + p->packet_len;
     qemu_file_acct_rate_limit(f, transferred);
     ram_counters.multifd_bytes += transferred;
-    ram_counters.transferred += transferred;
+    stat64_add(&ram_atomic_counters.transferred, transferred);
     qemu_mutex_unlock(&p->mutex);
     qemu_sem_post(&p->sem);
 
@@ -612,7 +612,7 @@ int multifd_send_sync_main(QEMUFile *f)
         p->pending_job++;
         qemu_file_acct_rate_limit(f, p->packet_len);
         ram_counters.multifd_bytes += p->packet_len;
-        ram_counters.transferred += p->packet_len;
+        stat64_add(&ram_atomic_counters.transferred, p->packet_len);
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
 
diff --git a/migration/ram.c b/migration/ram.c
index 578ad8d70a..f5a86265c7 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -425,18 +425,25 @@ uint64_t ram_bytes_remaining(void)
                        0;
 }
 
+/*
+ * NOTE: not all stats in ram_counters are used in reality.  See comments
+ * for struct MigrationAtomicStats.  The ultimate result of ram migration
+ * counters will be a merged version with both ram_counters and the atomic
+ * fields in ram_atomic_counters.
+ */
 MigrationStats ram_counters;
+MigrationAtomicStats ram_atomic_counters;
 
 static void ram_transferred_add(uint64_t bytes)
 {
     if (runstate_is_running()) {
         ram_counters.precopy_bytes += bytes;
     } else if (migration_in_postcopy()) {
-        ram_counters.postcopy_bytes += bytes;
+        stat64_add(&ram_atomic_counters.postcopy_bytes, bytes);
     } else {
         ram_counters.downtime_bytes += bytes;
     }
-    ram_counters.transferred += bytes;
+    stat64_add(&ram_atomic_counters.transferred, bytes);
 }
 
 void dirty_sync_missed_zero_copy(void)
@@ -725,7 +732,7 @@ void mig_throttle_counter_reset(void)
 
     rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     rs->num_dirty_pages_period = 0;
-    rs->bytes_xfer_prev = ram_counters.transferred;
+    rs->bytes_xfer_prev = stat64_get(&ram_atomic_counters.transferred);
 }
 
 /**
@@ -1085,8 +1092,9 @@ uint64_t ram_pagesize_summary(void)
 
 uint64_t ram_get_total_transferred_pages(void)
 {
-    return  ram_counters.normal + ram_counters.duplicate +
-                compression_counters.pages + xbzrle_counters.pages;
+    return  stat64_get(&ram_atomic_counters.normal) +
+        stat64_get(&ram_atomic_counters.duplicate) +
+        compression_counters.pages + xbzrle_counters.pages;
 }
 
 static void migration_update_rates(RAMState *rs, int64_t end_time)
@@ -1145,8 +1153,8 @@ static void migration_trigger_throttle(RAMState *rs)
 {
     MigrationState *s = migrate_get_current();
     uint64_t threshold = s->parameters.throttle_trigger_threshold;
-
-    uint64_t bytes_xfer_period = ram_counters.transferred - rs->bytes_xfer_prev;
+    uint64_t bytes_xfer_period =
+        stat64_get(&ram_atomic_counters.transferred) - rs->bytes_xfer_prev;
     uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
     uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
 
@@ -1209,7 +1217,7 @@ static void migration_bitmap_sync(RAMState *rs)
         /* reset period counters */
         rs->time_last_bitmap_sync = end_time;
         rs->num_dirty_pages_period = 0;
-        rs->bytes_xfer_prev = ram_counters.transferred;
+        rs->bytes_xfer_prev = stat64_get(&ram_atomic_counters.transferred);
     }
     if (migrate_use_events()) {
         qapi_event_send_migration_pass(ram_counters.dirty_sync_count);
@@ -1285,7 +1293,7 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
     int len = save_zero_page_to_file(rs, rs->f, block, offset);
 
     if (len) {
-        ram_counters.duplicate++;
+        stat64_add(&ram_atomic_counters.duplicate, 1);
         ram_transferred_add(len);
         return 1;
     }
@@ -1322,9 +1330,9 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     }
 
     if (bytes_xmit > 0) {
-        ram_counters.normal++;
+        stat64_add(&ram_atomic_counters.normal, 1);
     } else if (bytes_xmit == 0) {
-        ram_counters.duplicate++;
+        stat64_add(&ram_atomic_counters.duplicate, 1);
     }
 
     return true;
@@ -1354,7 +1362,7 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
         qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
     }
     ram_transferred_add(TARGET_PAGE_SIZE);
-    ram_counters.normal++;
+    stat64_add(&ram_atomic_counters.normal, 1);
     return 1;
 }
 
@@ -1410,7 +1418,7 @@ static int ram_save_multifd_page(RAMState *rs, RAMBlock *block,
     if (multifd_queue_page(rs->f, block, offset) < 0) {
         return -1;
     }
-    ram_counters.normal++;
+    stat64_add(&ram_atomic_counters.normal, 1);
 
     return 1;
 }
@@ -1448,7 +1456,7 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
     ram_transferred_add(bytes_xmit);
 
     if (param->zero_page) {
-        ram_counters.duplicate++;
+        stat64_add(&ram_atomic_counters.duplicate, 1);
         return;
     }
 
@@ -2618,9 +2626,9 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     uint64_t pages = size / TARGET_PAGE_SIZE;
 
     if (zero) {
-        ram_counters.duplicate += pages;
+        stat64_add(&ram_atomic_counters.duplicate, pages);
     } else {
-        ram_counters.normal += pages;
+        stat64_add(&ram_atomic_counters.normal, pages);
         ram_transferred_add(size);
         qemu_file_credit_transfer(f, size);
     }
diff --git a/migration/ram.h b/migration/ram.h
index c7af65ac74..9331ef5e04 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -32,7 +32,27 @@
 #include "qapi/qapi-types-migration.h"
 #include "exec/cpu-common.h"
 #include "io/channel.h"
+#include "qemu/stats64.h"
 
+/*
+ * These are the migration statistic counters that need to be updated using
+ * atomic ops (can be accessed by more than one thread).  Here since we
+ * cannot modify MigrationStats directly to use Stat64 as it was defined in
+ * the QAPI scheme, we define an internal structure to hold them, and we
+ * propagate the real values when QMP queries happen.
+ *
+ * IOW, the corresponding fields within ram_counters on these specific
+ * fields will be always zero and not being used at all; they're just
+ * placeholders to make it QAPI-compatible.
+ */
+typedef struct {
+    Stat64 transferred;
+    Stat64 duplicate;
+    Stat64 normal;
+    Stat64 postcopy_bytes;
+} MigrationAtomicStats;
+
+extern MigrationAtomicStats ram_atomic_counters;
 extern MigrationStats ram_counters;
 extern XBZRLECacheStats xbzrle_counters;
 extern CompressionStats compression_counters;
-- 
2.37.3


