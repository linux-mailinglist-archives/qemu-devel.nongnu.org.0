Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5209450ECDB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:51:27 +0200 (CEST)
Received: from localhost ([::1]:44838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8UI-000282-F8
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IO-0007Il-QW
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IM-0007kk-Al
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCLjsViY5BxwJ6GhW+PS5cj/nCYo8CydPsCmpu5mEz4=;
 b=ZjKAFbvl/sdWN1EX1I9VfZmRilj0ADpd1zZuURfsY4eN6mpL0WFT3x/Rrj77/GX1cyJWE+
 OAWgGN15kPcHeEf+QuTZOTUrtK4NjdRR4hJEpNViJ6lqmhooKS1musZ8dOqRYp3F6eCe+m
 8v05GTGikJ4NkPAQqt9aSoaqiYj22Kk=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-12rjUF2mMSWmGUktvl3Iqw-1; Mon, 25 Apr 2022 19:39:04 -0400
X-MC-Unique: 12rjUF2mMSWmGUktvl3Iqw-1
Received: by mail-il1-f199.google.com with SMTP id
 i22-20020a056e021d1600b002cd69a8f421so4772234ila.6
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZCLjsViY5BxwJ6GhW+PS5cj/nCYo8CydPsCmpu5mEz4=;
 b=aVsrW9I9B/IExP9dK9PJTAE8mcnVZdZQKKJX2Dq9Bn+aj7YTVLz+KGCCWjT/82mgXK
 9FHX5l21rrnT0shKmrciVb4s+F9JjbtX4+Zmlb5WnhmBZo4+KJGY52LCFFKoTH+Jzbbn
 rYlz1pzdNMZfRqyRo+tokod0EVbUwk/xAAG31t2NFJk2nZgDnomot0P44aIoBBNZlvPs
 1VcioKnyYModerCxMP/sdqag5t3tBWxzbPIeuNtdPQv9ug4sQYvviECpBs6P/2ShqT8i
 Y9yXECkt66IqSKHn98YP4l041xuITxnRAH/PsoHVbz5uoyqTjeCqdCyCY3FGLG6qfPJx
 1Olg==
X-Gm-Message-State: AOAM530e8Xr2Bo6pNrMAL3Zdc7Z1vs3+pHQmq+QHCwGFqEHgxw3dZChw
 ++NsJ0Bl89t2Kn4tNCfBGb64qJ7PKvsz81Why8Pmi+ODy8iIzF4XVgFADXTvu+6dPP15/7vYsFa
 Z2kHn3RPXzce747eAn6+s1JnBnl8oUS3r9bCYgYSvc36g12jhcu0OAbO04xyBJC+K
X-Received: by 2002:a92:6e11:0:b0:2c7:a32b:733d with SMTP id
 j17-20020a926e11000000b002c7a32b733dmr7711739ilc.196.1650929942988; 
 Mon, 25 Apr 2022 16:39:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGnPkNXF1Ezz51zOnfZdd+e5dmGFI4hrTin9nStm/qBXi6ccYAXoflKJC8G14/0H1VwbahWA==
X-Received: by 2002:a92:6e11:0:b0:2c7:a32b:733d with SMTP id
 j17-20020a926e11000000b002c7a32b733dmr7711717ilc.196.1650929942400; 
 Mon, 25 Apr 2022 16:39:02 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.39.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:39:02 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/21] migration: Postcopy preemption preparation on
 channel creation
Date: Mon, 25 Apr 2022 19:38:37 -0400
Message-Id: <20220425233847.10393-12-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 URG_BIZ=0.573 autolearn=no autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a new socket for postcopy to be prepared to send postcopy requested
pages via this specific channel, so as to not get blocked by precopy pages.

A new thread is also created on dest qemu to receive data from this new channel
based on the ram_load_postcopy() routine.

The ram_load_postcopy(POSTCOPY) branch and the thread has not started to
function, and that'll be done in follow up patches.

Cleanup the new sockets on both src/dst QEMUs, meanwhile look after the new
thread too to make sure it'll be recycled properly.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/migration.c    | 62 +++++++++++++++++++++++----
 migration/migration.h    |  8 ++++
 migration/postcopy-ram.c | 92 ++++++++++++++++++++++++++++++++++++++--
 migration/postcopy-ram.h | 10 +++++
 migration/ram.c          | 25 ++++++++---
 migration/ram.h          |  4 +-
 migration/savevm.c       | 20 ++++-----
 migration/socket.c       | 22 +++++++++-
 migration/socket.h       |  1 +
 migration/trace-events   |  5 ++-
 10 files changed, 218 insertions(+), 31 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 75d9185c3a..e27aa306bc 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -321,6 +321,12 @@ void migration_incoming_state_destroy(void)
         mis->page_requested = NULL;
     }
 
+    if (mis->postcopy_qemufile_dst) {
+        migration_ioc_unregister_yank_from_file(mis->postcopy_qemufile_dst);
+        qemu_fclose(mis->postcopy_qemufile_dst);
+        mis->postcopy_qemufile_dst = NULL;
+    }
+
     yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
 
@@ -714,15 +720,21 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
     migration_incoming_process();
 }
 
+static bool migration_needs_multiple_sockets(void)
+{
+    return migrate_use_multifd() || migrate_postcopy_preempt();
+}
+
 void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
     bool start_migration;
+    QEMUFile *f;
 
     if (!mis->from_src_file) {
         /* The first connection (multifd may have multiple) */
-        QEMUFile *f = qemu_fopen_channel_input(ioc);
+        f = qemu_fopen_channel_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
@@ -730,13 +742,18 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 
         /*
          * Common migration only needs one channel, so we can start
-         * right now.  Multifd needs more than one channel, we wait.
+         * right now.  Some features need more than one channel, we wait.
          */
-        start_migration = !migrate_use_multifd();
+        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
-        assert(migrate_use_multifd());
-        start_migration = multifd_recv_new_channel(ioc, &local_err);
+        assert(migration_needs_multiple_sockets());
+        if (migrate_use_multifd()) {
+            start_migration = multifd_recv_new_channel(ioc, &local_err);
+        } else if (migrate_postcopy_preempt()) {
+            f = qemu_fopen_channel_input(ioc);
+            start_migration = postcopy_preempt_new_channel(mis, f);
+        }
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -761,11 +778,20 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 bool migration_has_all_channels(void)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
-    bool all_channels;
 
-    all_channels = multifd_recv_all_channels_created();
+    if (!mis->from_src_file) {
+        return false;
+    }
+
+    if (migrate_use_multifd()) {
+        return multifd_recv_all_channels_created();
+    }
+
+    if (migrate_postcopy_preempt()) {
+        return mis->postcopy_qemufile_dst != NULL;
+    }
 
-    return all_channels && mis->from_src_file != NULL;
+    return true;
 }
 
 /*
@@ -1862,6 +1888,12 @@ static void migrate_fd_cleanup(MigrationState *s)
         qemu_fclose(tmp);
     }
 
+    if (s->postcopy_qemufile_src) {
+        migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
+        qemu_fclose(s->postcopy_qemufile_src);
+        s->postcopy_qemufile_src = NULL;
+    }
+
     assert(!migration_is_active(s));
 
     if (s->state == MIGRATION_STATUS_CANCELLING) {
@@ -3237,6 +3269,11 @@ static void migration_completion(MigrationState *s)
         qemu_savevm_state_complete_postcopy(s->to_dst_file);
         qemu_mutex_unlock_iothread();
 
+        /* Shutdown the postcopy fast path thread */
+        if (migrate_postcopy_preempt()) {
+            postcopy_preempt_shutdown_file(s);
+        }
+
         trace_migration_completion_postcopy_end_after_complete();
     } else {
         goto fail;
@@ -4124,6 +4161,15 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         }
     }
 
+    /* This needs to be done before resuming a postcopy */
+    if (postcopy_preempt_setup(s, &local_err)) {
+        error_report_err(local_err);
+        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
+                          MIGRATION_STATUS_FAILED);
+        migrate_fd_cleanup(s);
+        return;
+    }
+
     if (resume) {
         /* Wakeup the main migration thread to do the recovery */
         migrate_set_state(&s->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
diff --git a/migration/migration.h b/migration/migration.h
index af4bcb19c2..caa910d956 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -23,6 +23,7 @@
 #include "io/channel-buffer.h"
 #include "net/announce.h"
 #include "qom/object.h"
+#include "postcopy-ram.h"
 
 struct PostcopyBlocktimeContext;
 
@@ -112,6 +113,11 @@ struct MigrationIncomingState {
      * enabled.
      */
     unsigned int postcopy_channels;
+    /* QEMUFile for postcopy only; it'll be handled by a separate thread */
+    QEMUFile *postcopy_qemufile_dst;
+    /* Postcopy priority thread is used to receive postcopy requested pages */
+    QemuThread postcopy_prio_thread;
+    bool postcopy_prio_thread_created;
     /*
      * An array of temp host huge pages to be used, one for each postcopy
      * channel.
@@ -192,6 +198,8 @@ struct MigrationState {
     QEMUBH *cleanup_bh;
     /* Protected by qemu_file_lock */
     QEMUFile *to_dst_file;
+    /* Postcopy specific transfer channel */
+    QEMUFile *postcopy_qemufile_src;
     QIOChannelBuffer *bioc;
     /*
      * Protects to_dst_file/from_dst_file pointers.  We need to make sure we
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index a66dd536d9..e92db0556b 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -33,6 +33,9 @@
 #include "trace.h"
 #include "hw/boards.h"
 #include "exec/ramblock.h"
+#include "socket.h"
+#include "qemu-file-channel.h"
+#include "yank_functions.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
@@ -567,6 +570,11 @@ int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
 {
     trace_postcopy_ram_incoming_cleanup_entry();
 
+    if (mis->postcopy_prio_thread_created) {
+        qemu_thread_join(&mis->postcopy_prio_thread);
+        mis->postcopy_prio_thread_created = false;
+    }
+
     if (mis->have_fault_thread) {
         Error *local_err = NULL;
 
@@ -1102,8 +1110,13 @@ static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
     int err, i, channels;
     void *temp_page;
 
-    /* TODO: will be boosted when enable postcopy preemption */
-    mis->postcopy_channels = 1;
+    if (migrate_postcopy_preempt()) {
+        /* If preemption enabled, need extra channel for urgent requests */
+        mis->postcopy_channels = RAM_CHANNEL_MAX;
+    } else {
+        /* Both precopy/postcopy on the same channel */
+        mis->postcopy_channels = 1;
+    }
 
     channels = mis->postcopy_channels;
     mis->postcopy_tmp_pages = g_malloc0_n(sizeof(PostcopyTmpPage), channels);
@@ -1170,7 +1183,7 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
         return -1;
     }
 
-    postcopy_thread_create(mis, &mis->fault_thread, "postcopy/fault",
+    postcopy_thread_create(mis, &mis->fault_thread, "fault-default",
                            postcopy_ram_fault_thread, QEMU_THREAD_JOINABLE);
     mis->have_fault_thread = true;
 
@@ -1185,6 +1198,16 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
         return -1;
     }
 
+    if (migrate_postcopy_preempt()) {
+        /*
+         * This thread needs to be created after the temp pages because
+         * it'll fetch RAM_CHANNEL_POSTCOPY PostcopyTmpPage immediately.
+         */
+        postcopy_thread_create(mis, &mis->postcopy_prio_thread, "fault-fast",
+                               postcopy_preempt_thread, QEMU_THREAD_JOINABLE);
+        mis->postcopy_prio_thread_created = true;
+    }
+
     trace_postcopy_ram_enable_notify();
 
     return 0;
@@ -1514,3 +1537,66 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
         }
     }
 }
+
+bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+{
+    /*
+     * The new loading channel has its own threads, so it needs to be
+     * blocked too.  It's by default true, just be explicit.
+     */
+    qemu_file_set_blocking(file, true);
+    mis->postcopy_qemufile_dst = file;
+    trace_postcopy_preempt_new_channel();
+
+    /* Start the migration immediately */
+    return true;
+}
+
+int postcopy_preempt_setup(MigrationState *s, Error **errp)
+{
+    QIOChannel *ioc;
+
+    if (!migrate_postcopy_preempt()) {
+        return 0;
+    }
+
+    if (!migrate_multi_channels_is_allowed()) {
+        error_setg(errp, "Postcopy preempt is not supported as current "
+                   "migration stream does not support multi-channels.");
+        return -1;
+    }
+
+    ioc = socket_send_channel_create_sync(errp);
+
+    if (ioc == NULL) {
+        return -1;
+    }
+
+    migration_ioc_register_yank(ioc);
+    s->postcopy_qemufile_src = qemu_fopen_channel_output(ioc);
+
+    trace_postcopy_preempt_new_channel();
+
+    return 0;
+}
+
+void *postcopy_preempt_thread(void *opaque)
+{
+    MigrationIncomingState *mis = opaque;
+    int ret;
+
+    trace_postcopy_preempt_thread_entry();
+
+    rcu_register_thread();
+
+    qemu_sem_post(&mis->thread_sync_sem);
+
+    /* Sending RAM_SAVE_FLAG_EOS to terminate this thread */
+    ret = ram_load_postcopy(mis->postcopy_qemufile_dst, RAM_CHANNEL_POSTCOPY);
+
+    rcu_unregister_thread();
+
+    trace_postcopy_preempt_thread_exit();
+
+    return ret == 0 ? NULL : (void *)-1;
+}
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 07684c0e1d..34b1080cde 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -183,4 +183,14 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd, uint64_t client_addr,
 int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
                                  uint64_t client_addr, uint64_t offset);
 
+/* Hard-code channels for now for postcopy preemption */
+enum PostcopyChannels {
+    RAM_CHANNEL_PRECOPY = 0,
+    RAM_CHANNEL_POSTCOPY = 1,
+    RAM_CHANNEL_MAX,
+};
+
+bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+int postcopy_preempt_setup(MigrationState *s, Error **errp);
+
 #endif
diff --git a/migration/ram.c b/migration/ram.c
index a2489a2699..f5615e0a76 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3644,15 +3644,15 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis)
  * rcu_read_lock is taken prior to this being called.
  *
  * @f: QEMUFile where to send the data
+ * @channel: the channel to use for loading
  */
-int ram_load_postcopy(QEMUFile *f)
+int ram_load_postcopy(QEMUFile *f, int channel)
 {
     int flags = 0, ret = 0;
     bool place_needed = false;
     bool matches_target_page_size = false;
     MigrationIncomingState *mis = migration_incoming_get_current();
-    /* Currently we only use channel 0.  TODO: use all the channels */
-    PostcopyTmpPage *tmp_page = &mis->postcopy_tmp_pages[0];
+    PostcopyTmpPage *tmp_page = &mis->postcopy_tmp_pages[channel];
 
     while (!ret && !(flags & RAM_SAVE_FLAG_EOS)) {
         ram_addr_t addr;
@@ -3676,7 +3676,7 @@ int ram_load_postcopy(QEMUFile *f)
         flags = addr & ~TARGET_PAGE_MASK;
         addr &= TARGET_PAGE_MASK;
 
-        trace_ram_load_postcopy_loop((uint64_t)addr, flags);
+        trace_ram_load_postcopy_loop(channel, (uint64_t)addr, flags);
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE)) {
             block = ram_block_from_stream(mis, f, flags);
@@ -3717,10 +3717,10 @@ int ram_load_postcopy(QEMUFile *f)
             } else if (tmp_page->host_addr !=
                        host_page_from_ram_block_offset(block, addr)) {
                 /* not the 1st TP within the HP */
-                error_report("Non-same host page detected.  "
+                error_report("Non-same host page detected on channel %d: "
                              "Target host page %p, received host page %p "
                              "(rb %s offset 0x"RAM_ADDR_FMT" target_pages %d)",
-                             tmp_page->host_addr,
+                             channel, tmp_page->host_addr,
                              host_page_from_ram_block_offset(block, addr),
                              block->idstr, addr, tmp_page->target_pages);
                 ret = -EINVAL;
@@ -4107,7 +4107,12 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
      */
     WITH_RCU_READ_LOCK_GUARD() {
         if (postcopy_running) {
-            ret = ram_load_postcopy(f);
+            /*
+             * Note!  Here RAM_CHANNEL_PRECOPY is the precopy channel of
+             * postcopy migration, we have another RAM_CHANNEL_POSTCOPY to
+             * service fast page faults.
+             */
+            ret = ram_load_postcopy(f, RAM_CHANNEL_PRECOPY);
         } else {
             ret = ram_load_precopy(f);
         }
@@ -4269,6 +4274,12 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
     return 0;
 }
 
+void postcopy_preempt_shutdown_file(MigrationState *s)
+{
+    qemu_put_be64(s->postcopy_qemufile_src, RAM_SAVE_FLAG_EOS);
+    qemu_fflush(s->postcopy_qemufile_src);
+}
+
 static SaveVMHandlers savevm_ram_handlers = {
     .save_setup = ram_save_setup,
     .save_live_iterate = ram_save_iterate,
diff --git a/migration/ram.h b/migration/ram.h
index ded0a3a086..5d90945a6e 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -61,7 +61,7 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms);
 /* For incoming postcopy discard */
 int ram_discard_range(const char *block_name, uint64_t start, size_t length);
 int ram_postcopy_incoming_init(MigrationIncomingState *mis);
-int ram_load_postcopy(QEMUFile *f);
+int ram_load_postcopy(QEMUFile *f, int channel);
 
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
 
@@ -73,6 +73,8 @@ int64_t ramblock_recv_bitmap_send(QEMUFile *file,
                                   const char *block_name);
 int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *rb);
 bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t start);
+void postcopy_preempt_shutdown_file(MigrationState *s);
+void *postcopy_preempt_thread(void *opaque);
 
 /* ram cache */
 int colo_init_ram_cache(void);
diff --git a/migration/savevm.c b/migration/savevm.c
index d9076897b8..ecee05e631 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2575,16 +2575,6 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
 {
     int i;
 
-    /*
-     * If network is interrupted, any temp page we received will be useless
-     * because we didn't mark them as "received" in receivedmap.  After a
-     * proper recovery later (which will sync src dirty bitmap with receivedmap
-     * on dest) these cached small pages will be resent again.
-     */
-    for (i = 0; i < mis->postcopy_channels; i++) {
-        postcopy_temp_page_reset(&mis->postcopy_tmp_pages[i]);
-    }
-
     trace_postcopy_pause_incoming();
 
     assert(migrate_postcopy_ram());
@@ -2613,6 +2603,16 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
     /* Notify the fault thread for the invalidated file handle */
     postcopy_fault_thread_notify(mis);
 
+    /*
+     * If network is interrupted, any temp page we received will be useless
+     * because we didn't mark them as "received" in receivedmap.  After a
+     * proper recovery later (which will sync src dirty bitmap with receivedmap
+     * on dest) these cached small pages will be resent again.
+     */
+    for (i = 0; i < mis->postcopy_channels; i++) {
+        postcopy_temp_page_reset(&mis->postcopy_tmp_pages[i]);
+    }
+
     error_report("Detected IO failure for postcopy. "
                  "Migration paused.");
 
diff --git a/migration/socket.c b/migration/socket.c
index 05705a32d8..a7f345b353 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -26,7 +26,7 @@
 #include "io/channel-socket.h"
 #include "io/net-listener.h"
 #include "trace.h"
-
+#include "postcopy-ram.h"
 
 struct SocketOutgoingArgs {
     SocketAddress *saddr;
@@ -39,6 +39,24 @@ void socket_send_channel_create(QIOTaskFunc f, void *data)
                                      f, data, NULL, NULL);
 }
 
+QIOChannel *socket_send_channel_create_sync(Error **errp)
+{
+    QIOChannelSocket *sioc = qio_channel_socket_new();
+
+    if (!outgoing_args.saddr) {
+        object_unref(OBJECT(sioc));
+        error_setg(errp, "Initial sock address not set!");
+        return NULL;
+    }
+
+    if (qio_channel_socket_connect_sync(sioc, outgoing_args.saddr, errp) < 0) {
+        object_unref(OBJECT(sioc));
+        return NULL;
+    }
+
+    return QIO_CHANNEL(sioc);
+}
+
 int socket_send_channel_destroy(QIOChannel *send)
 {
     /* Remove channel */
@@ -158,6 +176,8 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
 
     if (migrate_use_multifd()) {
         num = migrate_multifd_channels();
+    } else if (migrate_postcopy_preempt()) {
+        num = RAM_CHANNEL_MAX;
     }
 
     if (qio_net_listener_open_sync(listener, saddr, num, errp) < 0) {
diff --git a/migration/socket.h b/migration/socket.h
index 891dbccceb..dc54df4e6c 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -21,6 +21,7 @@
 #include "io/task.h"
 
 void socket_send_channel_create(QIOTaskFunc f, void *data);
+QIOChannel *socket_send_channel_create_sync(Error **errp);
 int socket_send_channel_destroy(QIOChannel *send);
 
 void socket_start_incoming_migration(const char *str, Error **errp);
diff --git a/migration/trace-events b/migration/trace-events
index 1aec580e92..4bc787cf0c 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -91,7 +91,7 @@ migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, unsigned
 migration_throttle(void) ""
 ram_discard_range(const char *rbname, uint64_t start, size_t len) "%s: start: %" PRIx64 " %zx"
 ram_load_loop(const char *rbname, uint64_t addr, int flags, void *host) "%s: addr: 0x%" PRIx64 " flags: 0x%x host: %p"
-ram_load_postcopy_loop(uint64_t addr, int flags) "@%" PRIx64 " %x"
+ram_load_postcopy_loop(int channel, uint64_t addr, int flags) "chan=%d addr=0x%" PRIx64 " flags=0x%x"
 ram_postcopy_send_discard_bitmap(void) ""
 ram_save_page(const char *rbname, uint64_t offset, void *host) "%s: offset: 0x%" PRIx64 " host: %p"
 ram_save_queue_pages(const char *rbname, size_t start, size_t len) "%s: start: 0x%zx len: 0x%zx"
@@ -278,6 +278,9 @@ postcopy_request_shared_page(const char *sharer, const char *rb, uint64_t rb_off
 postcopy_request_shared_page_present(const char *sharer, const char *rb, uint64_t rb_offset) "%s already %s offset 0x%"PRIx64
 postcopy_wake_shared(uint64_t client_addr, const char *rb) "at 0x%"PRIx64" in %s"
 postcopy_page_req_del(void *addr, int count) "resolved page req %p total %d"
+postcopy_preempt_new_channel(void) ""
+postcopy_preempt_thread_entry(void) ""
+postcopy_preempt_thread_exit(void) ""
 
 get_mem_fault_cpu_index(int cpu, uint32_t pid) "cpu: %d, pid: %u"
 
-- 
2.32.0


