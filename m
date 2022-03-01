Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4504C879D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:16:34 +0100 (CET)
Received: from localhost ([::1]:52268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOycS-0001eL-Ff
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:16:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3X-0004Oh-SH
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3V-0008Is-DS
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rfgUcZ6X3iys9RVBrxxjEs8zRK1EZ+AtIIFYh53XXwE=;
 b=Q5sZaFbXnXrV6PeptM3dEvyE++2kHppUGhRdZ2raXZmYXlVCSNTqS1sI8irFk1a4aZ4rK/
 43bRBTJW1UVps5MZRC654BkLU9YE8EY5EvRVx1uOjrSv3k21dmahjthTrl0PkiuI7KYs2S
 xnXGv0gcS4YhGis94vOzAJ6uOTI6Viw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-nPdHNtHbM22OOrZlaCP3GA-1; Tue, 01 Mar 2022 03:40:24 -0500
X-MC-Unique: nPdHNtHbM22OOrZlaCP3GA-1
Received: by mail-pj1-f69.google.com with SMTP id
 b9-20020a17090aa58900b001b8b14b4aabso1198728pjq.9
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rfgUcZ6X3iys9RVBrxxjEs8zRK1EZ+AtIIFYh53XXwE=;
 b=R5u1/+zGiiQ3Jop+nRKmhHwcHOUTpwZbLugXBimNDARyN8hzG3iMDlx5VQrvd/6ZDq
 pWOp0qyiBswDEDTsYwuQmaGu34WLwPkWrzef5Eku7kYlc2jltgrYHL87M5/CUug4MQw+
 FGmL8/JbrsTy7SddVqOQu0M64ag0UjD0zV7e9RPiviTNwRiWOwhYbVWjxsUw5XSJ+5nn
 rc4sd9SmMOB8kq6XGlaFqjLm+6jpG1xCcTMmw0cJJVqHyKdSi7ExGYCQ3hiz8t07gSgX
 CsRe7KQKKRapZ993LA0NqXcm0RaHeX8khIM3VCgctbNrD35IhaKKBcCMQhzdBNjMHgbK
 q+uA==
X-Gm-Message-State: AOAM531a6lp5XeANFJ0mAk7lGIMhLd7E/qDU562I26kbz7Z4xIOoMMmZ
 8eZzvw80r3a4FRc8xJ8KCxCBW5g9UI8V8nqNIeETaiujA7L9KlO5QRTR6lrrUieFOAAIzfbQnEl
 t5k0pdyu15aRNcnTgzgDj0Mqh6TwzTn/RVb4zaz+ULqqPV1vOWdiIZie8xs2tG7au
X-Received: by 2002:aa7:8643:0:b0:4d1:d068:ef15 with SMTP id
 a3-20020aa78643000000b004d1d068ef15mr26337817pfo.9.1646124022438; 
 Tue, 01 Mar 2022 00:40:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHifXQDXE6if/zMyhT0BQkGQoXVw8HMOyZpWyppgCGoPQqVNkNgAnV65+MlDowOD1jJGin7w==
X-Received: by 2002:aa7:8643:0:b0:4d1:d068:ef15 with SMTP id
 a3-20020aa78643000000b004d1d068ef15mr26337772pfo.9.1646124021833; 
 Tue, 01 Mar 2022 00:40:21 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:21 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/25] migration: Postcopy preemption preparation on
 channel creation
Date: Tue,  1 Mar 2022 16:39:17 +0800
Message-Id: <20220301083925.33483-18-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
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
---
 migration/migration.c    | 62 +++++++++++++++++++++++----
 migration/migration.h    |  8 ++++
 migration/postcopy-ram.c | 92 ++++++++++++++++++++++++++++++++++++++--
 migration/postcopy-ram.h | 10 +++++
 migration/ram.c          | 25 ++++++++---
 migration/ram.h          |  4 +-
 migration/socket.c       | 22 +++++++++-
 migration/socket.h       |  1 +
 migration/trace-events   |  3 ++
 9 files changed, 207 insertions(+), 20 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4c22bad304..3d7f897b72 100644
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
@@ -1858,6 +1884,12 @@ static void migrate_fd_cleanup(MigrationState *s)
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
@@ -3233,6 +3265,11 @@ static void migration_completion(MigrationState *s)
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
@@ -4120,6 +4157,15 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
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
index 32c52f4b1d..df0c02f729 100644
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
+         * This thread needs to be created after the temp pages because it'll fetch
+         * RAM_CHANNEL_POSTCOPY PostcopyTmpPage immediately.
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
index 5cb5dfc2cc..713ef6e421 100644
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
@@ -3717,10 +3717,10 @@ int ram_load_postcopy(QEMUFile *f)
             } else if (tmp_page->host_addr !=
                        host_page_from_ram_block_offset(block, addr)) {
                 /* not the 1st TP within the HP */
-                error_report("Non-same host page detected.  Target host page %p, "
-                             "received host page %p "
+                error_report("Non-same host page detected on channel %d: "
+                             "Target host page %p, received host page %p "
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
index 1aec580e92..4474a76614 100644
--- a/migration/trace-events
+++ b/migration/trace-events
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


