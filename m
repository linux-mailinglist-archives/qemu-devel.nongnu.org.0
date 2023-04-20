Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0D96E95AB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:19:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUBD-0001rE-HK; Thu, 20 Apr 2023 09:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUB3-0001b0-4T
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAz-0005jS-Ru
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=beNK2HPiTfpmckPKYaYFis9YWA71zWB5eliN1H6DlkQ=;
 b=JlhY+klgkLnkRI0LcXUXPTgFA2sEyyPzI5/3t7/7pjDMZDmEzhzq46xAMKX5+HT9sKXO/L
 OmRUZKmP+JM8ZfQTUnjfB/u+GbxCTmHikpvRrdZwS2+uPk4PDkcFmgpeEGVczVPLD+kd0Z
 abGhz2rq7uvfmRtzQV+HRKv9jKEhLzs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-sLhkT5ABNjC5aAccZ6WbXg-1; Thu, 20 Apr 2023 09:18:16 -0400
X-MC-Unique: sLhkT5ABNjC5aAccZ6WbXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E8B4884EC0;
 Thu, 20 Apr 2023 13:18:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBB08C16026;
 Thu, 20 Apr 2023 13:18:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 19/20] migration: rename enabled_capabilities to capabilities
Date: Thu, 20 Apr 2023 15:17:50 +0200
Message-Id: <20230420131751.28534-20-quintela@redhat.com>
In-Reply-To: <20230420131751.28534-1-quintela@redhat.com>
References: <20230420131751.28534-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It is clear from the context what that means, and such a long name
with the extra long names of the capabilities make very difficilut to
stay inside the 80 columns limit.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 52 +++++++++++++++++++++----------------------
 migration/migration.h |  2 +-
 migration/rdma.c      |  4 ++--
 migration/savevm.c    |  6 ++---
 4 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index d630193272..0c2376bc7e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -364,8 +364,7 @@ static bool migrate_late_block_activate(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[
-        MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE];
+    return s->capabilities[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE];
 }
 
 /*
@@ -944,7 +943,7 @@ MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
 #endif
         caps = g_malloc0(sizeof(*caps));
         caps->capability = i;
-        caps->state = s->enabled_capabilities[i];
+        caps->state = s->capabilities[i];
         QAPI_LIST_APPEND(tail, caps);
     }
 
@@ -1495,13 +1494,13 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
         return;
     }
 
-    memcpy(cap_list, s->enabled_capabilities, sizeof(cap_list));
+    memcpy(cap_list, s->capabilities, sizeof(cap_list));
     if (!migrate_caps_check(cap_list, params, errp)) {
         return;
     }
 
     for (cap = params; cap; cap = cap->next) {
-        s->enabled_capabilities[cap->value->capability] = cap->value->state;
+        s->capabilities[cap->value->capability] = cap->value->state;
     }
 }
 
@@ -2570,7 +2569,7 @@ bool migrate_release_ram(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_RELEASE_RAM];
+    return s->capabilities[MIGRATION_CAPABILITY_RELEASE_RAM];
 }
 
 bool migrate_postcopy_ram(void)
@@ -2579,7 +2578,7 @@ bool migrate_postcopy_ram(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
+    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
 }
 
 bool migrate_postcopy(void)
@@ -2593,7 +2592,7 @@ bool migrate_auto_converge(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
+    return s->capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
 }
 
 bool migrate_zero_blocks(void)
@@ -2602,7 +2601,7 @@ bool migrate_zero_blocks(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_ZERO_BLOCKS];
+    return s->capabilities[MIGRATION_CAPABILITY_ZERO_BLOCKS];
 }
 
 bool migrate_postcopy_blocktime(void)
@@ -2611,7 +2610,7 @@ bool migrate_postcopy_blocktime(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME];
+    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME];
 }
 
 bool migrate_use_compression(void)
@@ -2620,7 +2619,7 @@ bool migrate_use_compression(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_COMPRESS];
+    return s->capabilities[MIGRATION_CAPABILITY_COMPRESS];
 }
 
 int migrate_compress_level(void)
@@ -2665,7 +2664,7 @@ bool migrate_dirty_bitmaps(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
+    return s->capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
 }
 
 bool migrate_ignore_shared(void)
@@ -2674,7 +2673,7 @@ bool migrate_ignore_shared(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_X_IGNORE_SHARED];
+    return s->capabilities[MIGRATION_CAPABILITY_X_IGNORE_SHARED];
 }
 
 bool migrate_validate_uuid(void)
@@ -2683,7 +2682,7 @@ bool migrate_validate_uuid(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_VALIDATE_UUID];
+    return s->capabilities[MIGRATION_CAPABILITY_VALIDATE_UUID];
 }
 
 bool migrate_use_events(void)
@@ -2692,7 +2691,7 @@ bool migrate_use_events(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_EVENTS];
+    return s->capabilities[MIGRATION_CAPABILITY_EVENTS];
 }
 
 bool migrate_use_multifd(void)
@@ -2701,7 +2700,7 @@ bool migrate_use_multifd(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
+    return s->capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
 bool migrate_pause_before_switchover(void)
@@ -2710,8 +2709,7 @@ bool migrate_pause_before_switchover(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[
-        MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
+    return s->capabilities[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
 }
 
 int migrate_multifd_channels(void)
@@ -2758,7 +2756,7 @@ bool migrate_use_zero_copy_send(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
+    return s->capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
 }
 #endif
 
@@ -2777,7 +2775,7 @@ int migrate_use_xbzrle(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_XBZRLE];
+    return s->capabilities[MIGRATION_CAPABILITY_XBZRLE];
 }
 
 uint64_t migrate_xbzrle_cache_size(void)
@@ -2804,7 +2802,7 @@ bool migrate_use_block(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_BLOCK];
+    return s->capabilities[MIGRATION_CAPABILITY_BLOCK];
 }
 
 bool migrate_use_return_path(void)
@@ -2813,7 +2811,7 @@ bool migrate_use_return_path(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_RETURN_PATH];
+    return s->capabilities[MIGRATION_CAPABILITY_RETURN_PATH];
 }
 
 bool migrate_use_block_incremental(void)
@@ -2831,7 +2829,7 @@ bool migrate_background_snapshot(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
+    return s->capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
 bool migrate_postcopy_preempt(void)
@@ -2840,7 +2838,7 @@ bool migrate_postcopy_preempt(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
+    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
 }
 
 /* migration thread support */
@@ -3582,7 +3580,7 @@ fail:
 bool migrate_colo_enabled(void)
 {
     MigrationState *s = migrate_get_current();
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_X_COLO];
+    return s->capabilities[MIGRATION_CAPABILITY_X_COLO];
 }
 
 typedef enum MigThrError {
@@ -4448,7 +4446,7 @@ void migration_global_dump(Monitor *mon)
 }
 
 #define DEFINE_PROP_MIG_CAP(name, x)             \
-    DEFINE_PROP_BOOL(name, MigrationState, enabled_capabilities[x], false)
+    DEFINE_PROP_BOOL(name, MigrationState, capabilities[x], false)
 
 static Property migration_properties[] = {
     DEFINE_PROP_BOOL("store-global-state", MigrationState,
@@ -4647,7 +4645,7 @@ static bool migration_object_check(MigrationState *ms, Error **errp)
     }
 
     for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
-        if (ms->enabled_capabilities[i]) {
+        if (ms->capabilities[i]) {
             QAPI_LIST_PREPEND(head, migrate_cap_add(i, true));
         }
     }
diff --git a/migration/migration.h b/migration/migration.h
index 310ae8901b..04e0860b4e 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -310,7 +310,7 @@ struct MigrationState {
     int64_t downtime_start;
     int64_t downtime;
     int64_t expected_downtime;
-    bool enabled_capabilities[MIGRATION_CAPABILITY__MAX];
+    bool capabilities[MIGRATION_CAPABILITY__MAX];
     int64_t setup_time;
     /*
      * Whether guest was running when we enter the completion stage.
diff --git a/migration/rdma.c b/migration/rdma.c
index df646be35e..f35f021963 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -4179,7 +4179,7 @@ void rdma_start_outgoing_migration(void *opaque,
     }
 
     ret = qemu_rdma_source_init(rdma,
-        s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
+        s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
 
     if (ret) {
         goto err;
@@ -4201,7 +4201,7 @@ void rdma_start_outgoing_migration(void *opaque,
         }
 
         ret = qemu_rdma_source_init(rdma_return_path,
-            s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
+            s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
 
         if (ret) {
             goto return_path_err;
diff --git a/migration/savevm.c b/migration/savevm.c
index aa54a67fda..589ef926ab 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -253,7 +253,7 @@ static uint32_t get_validatable_capabilities_count(void)
     uint32_t result = 0;
     int i;
     for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
-        if (should_validate_capability(i) && s->enabled_capabilities[i]) {
+        if (should_validate_capability(i) && s->capabilities[i]) {
             result++;
         }
     }
@@ -275,7 +275,7 @@ static int configuration_pre_save(void *opaque)
     state->capabilities = g_renew(MigrationCapability, state->capabilities,
                                   state->caps_count);
     for (i = j = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
-        if (should_validate_capability(i) && s->enabled_capabilities[i]) {
+        if (should_validate_capability(i) && s->capabilities[i]) {
             state->capabilities[j++] = i;
         }
     }
@@ -325,7 +325,7 @@ static bool configuration_validate_capabilities(SaveState *state)
             continue;
         }
         source_state = test_bit(i, source_caps_bm);
-        target_state = s->enabled_capabilities[i];
+        target_state = s->capabilities[i];
         if (source_state != target_state) {
             error_report("Capability %s is %s, but received capability is %s",
                          MigrationCapability_str(i),
-- 
2.39.2


