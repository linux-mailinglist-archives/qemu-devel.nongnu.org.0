Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E049366E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:39:26 +0100 (CET)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6V3-0008Hy-VE
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:39:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA63Q-0007Xt-N4
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA63N-0001PU-54
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvxtDnSFugefeJRTXG50co54t5xlvxJzvdP+AwPfn6M=;
 b=EBzTKyzYei1CuIYb6sHWWNI4PQzjyvd4pqdmRo8TJU9IPx+njUi3o4vRcSO8FlEGaJF10r
 /niL0n+90KU8aSmXx8zvQcx77apd5kMI7TRxfRwD5dJi5oWQ0oiqzMmeSwKQsyheuz4miu
 sw/dzczZiYNmiUSRJ0NaVWyfecruwhI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-g81Pft65PQ2rHuRmbOK1vw-1; Wed, 19 Jan 2022 03:10:40 -0500
X-MC-Unique: g81Pft65PQ2rHuRmbOK1vw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c62-20020a1c9a41000000b0034da9d62199so604426wme.7
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tvxtDnSFugefeJRTXG50co54t5xlvxJzvdP+AwPfn6M=;
 b=73rhoDlKhZ1hYmi2daF9EZZ5QNiSq1W089eqsBbwdfrrf35ml2OvJ07xzOv3NKg6RB
 ZfBkjkRD6L6V49KJJJy5VzFd+dDd/Ur4B9s26NK3eXfVJu65kA8thRQU9dB4QDoCzq4Z
 88MqurbTpWHZ6iOC4HjuLiVmcxd7M2QT99PljA884JFac0SS9FT4mt/bQ9sOVe2zbT22
 UOkXzHaaxqY9X00HJK0p2NpA+PIF0qnGfai9wNdeXtiu5Cwyfi+mMbx0zeV5Rjzx/fsm
 fF6LeMZlvm8M2uhP80iAmf3tZYjDv8jWmFHtzAzAjfupl13IYtxzRU8KiOaTTLHc4h82
 NRuA==
X-Gm-Message-State: AOAM531NJ9R0ImsXk8s2l+FkYoBHGtPZEmUFgbzpFHkvySn/Q3OAn7KA
 zsDPns7CCmSTzvS4HJjOH5GGGdBikbeWooaYpmhi1ANBbD4LFYiewOVxlwFCMsqmJAOZvma3NFw
 pVtjlJdzNGGQWmbaIRz/Boh+FowEaygFrLJ35/7oMVNdkKPlHQ/lMfyudsZ4rSYoy
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr6624607wrx.514.1642579838724; 
 Wed, 19 Jan 2022 00:10:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqN8JMG/bAanfSVUvEF4KcIhbxKKLk7PMjVdQ340e0vFUTyXHt2ZS6QPCshadBEKog7C/T/A==
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr6624552wrx.514.1642579837968; 
 Wed, 19 Jan 2022 00:10:37 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.10.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:10:37 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 14/15] migration: Postcopy preemption on separate channel
Date: Wed, 19 Jan 2022 16:09:28 +0800
Message-Id: <20220119080929.39485-15-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This patch enables postcopy-preempt feature.

It contains two major changes to the migration logic:

  (1) Postcopy requests are now sent via a different socket from precopy
      background migration stream, so as to be isolated from very high page
      request delays

  (2) For huge page enabled hosts: when there's postcopy requests, they can now
      intercept a partial sending of huge host pages on src QEMU.

After this patch, we'll have two "channels" (or say, sockets, because it's only
supported on socket-based channels) for postcopy: (1) PRECOPY channel (which is
the default channel that transfers background pages), and (2) POSTCOPY
channel (which only transfers requested pages).

On the source QEMU, when we found a postcopy request, we'll interrupt the
PRECOPY channel sending process and quickly switch to the POSTCOPY channel.
After we serviced all the high priority postcopy pages, we'll switch back to
PRECOPY channel so that we'll continue to send the interrupted huge page again.
There's no new thread introduced.

On the destination QEMU, one new thread is introduced to receive page data from
the postcopy specific socket.

This patch has a side effect.  After sending postcopy pages, previously we'll
assume the guest will access follow up pages so we'll keep sending from there.
Now it's changed.  Instead of going on with a postcopy requested page, we'll go
back and continue sending the precopy huge page (which can be intercepted by a
postcopy request so the huge page can be sent partially before).

Whether that's a problem is debatable, because "assuming the guest will
continue to access the next page" doesn't really suite when huge pages are
used, especially if the huge page is large (e.g. 1GB pages).  So that locality
hint is much meaningless if huge pages are used.

If postcopy preempt is enabled, a separate channel is created for it so that it
can be used later for postcopy specific page requests.  On dst node, a
standalone thread is used to receive postcopy requested pages.  The thread is
created along with the ram listen thread during POSTCOPY_LISTEN phase.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    |  62 +++++++--
 migration/migration.h    |  10 +-
 migration/postcopy-ram.c |  65 ++++++++-
 migration/postcopy-ram.h |  10 ++
 migration/ram.c          | 294 +++++++++++++++++++++++++++++++++++++--
 migration/ram.h          |   2 +
 migration/socket.c       |  18 +++
 migration/socket.h       |   1 +
 migration/trace-events   |  10 ++
 9 files changed, 445 insertions(+), 27 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 84a8fbd80d..13dc6ecd37 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -315,6 +315,12 @@ void migration_incoming_state_destroy(void)
         mis->socket_address_list = NULL;
     }
 
+    if (mis->postcopy_qemufile_dst) {
+        migration_ioc_unregister_yank_from_file(mis->postcopy_qemufile_dst);
+        qemu_fclose(mis->postcopy_qemufile_dst);
+        mis->postcopy_qemufile_dst = NULL;
+    }
+
     yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
 
@@ -708,15 +714,21 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
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
 
         /* If it's a recovery, we're done */
         if (postcopy_try_recover(f)) {
@@ -729,13 +741,18 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 
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
@@ -756,11 +773,20 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
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
@@ -1850,6 +1876,11 @@ static void migrate_fd_cleanup(MigrationState *s)
         qemu_fclose(tmp);
     }
 
+    if (s->postcopy_qemufile_src) {
+        qemu_fclose(s->postcopy_qemufile_src);
+        s->postcopy_qemufile_src = NULL;
+    }
+
     assert(!migration_is_active(s));
 
     if (s->state == MIGRATION_STATUS_CANCELLING) {
@@ -3122,6 +3153,8 @@ static int postcopy_start(MigrationState *ms)
                               MIGRATION_STATUS_FAILED);
     }
 
+    trace_postcopy_preempt_enabled(migrate_postcopy_preempt());
+
     return ret;
 
 fail_closefb:
@@ -3234,6 +3267,11 @@ static void migration_completion(MigrationState *s)
         qemu_savevm_state_complete_postcopy(s->to_dst_file);
         qemu_mutex_unlock_iothread();
 
+        /* Shutdown the postcopy fast path thread */
+        if (migrate_postcopy_preempt()) {
+            postcopy_preempt_shutdown_file(s);
+        }
+
         trace_migration_completion_postcopy_end_after_complete();
     } else if (s->state == MIGRATION_STATUS_CANCELLING) {
         goto fail;
@@ -4143,6 +4181,14 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         return;
     }
 
+    if (postcopy_preempt_setup(s, &local_err)) {
+        error_report_err(local_err);
+        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
+                          MIGRATION_STATUS_FAILED);
+        migrate_fd_cleanup(s);
+        return;
+    }
+
     if (migrate_background_snapshot()) {
         qemu_thread_create(&s->thread, "bg_snapshot",
                 bg_migration_thread, s, QEMU_THREAD_JOINABLE);
diff --git a/migration/migration.h b/migration/migration.h
index 9d39ccfcf5..8786785b1f 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -23,6 +23,7 @@
 #include "io/channel-buffer.h"
 #include "net/announce.h"
 #include "qom/object.h"
+#include "postcopy-ram.h"
 
 struct PostcopyBlocktimeContext;
 
@@ -67,7 +68,7 @@ typedef struct {
 struct MigrationIncomingState {
     QEMUFile *from_src_file;
     /* Previously received RAM's RAMBlock pointer */
-    RAMBlock *last_recv_block;
+    RAMBlock *last_recv_block[RAM_CHANNEL_MAX];
     /* A hook to allow cleanup at the end of incoming migration */
     void *transport_data;
     void (*transport_cleanup)(void *data);
@@ -109,6 +110,11 @@ struct MigrationIncomingState {
      * enabled.
      */
     int       postcopy_channels;
+    /* QEMUFile for postcopy only; it'll be handled by a separate thread */
+    QEMUFile *postcopy_qemufile_dst;
+    /* Postcopy priority thread is used to receive postcopy requested pages */
+    QemuThread     postcopy_prio_thread;
+    bool           postcopy_prio_thread_created;
     /*
      * An array of temp host huge pages to be used, one for each postcopy
      * channel.
@@ -189,6 +195,8 @@ struct MigrationState {
     QEMUBH *cleanup_bh;
     /* Protected by qemu_file_lock */
     QEMUFile *to_dst_file;
+    /* Postcopy specific transfer channel */
+    QEMUFile *postcopy_qemufile_src;
     QIOChannelBuffer *bioc;
     /*
      * Protects to_dst_file/from_dst_file pointers.  We need to make sure we
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 88c832eeba..9006e68fd1 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -32,6 +32,8 @@
 #include "trace.h"
 #include "hw/boards.h"
 #include "exec/ramblock.h"
+#include "socket.h"
+#include "qemu-file-channel.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
@@ -562,6 +564,11 @@ int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
 {
     trace_postcopy_ram_incoming_cleanup_entry();
 
+    if (mis->postcopy_prio_thread_created) {
+        qemu_thread_join(&mis->postcopy_prio_thread);
+        mis->postcopy_prio_thread_created = false;
+    }
+
     if (mis->have_fault_thread) {
         Error *local_err = NULL;
 
@@ -1114,8 +1121,13 @@ static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
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
     mis->postcopy_tmp_pages = g_malloc0(sizeof(PostcopyTmpPage) * channels);
@@ -1182,7 +1194,7 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
         return -1;
     }
 
-    postcopy_thread_create(mis, &mis->fault_thread, "postcopy/fault",
+    postcopy_thread_create(mis, &mis->fault_thread, "qemu/fault-default",
                            postcopy_ram_fault_thread, QEMU_THREAD_JOINABLE);
     mis->have_fault_thread = true;
 
@@ -1197,6 +1209,16 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
         return -1;
     }
 
+    if (migrate_postcopy_preempt()) {
+        /*
+         * This thread needs to be created after the temp pages because it'll fetch
+         * RAM_CHANNEL_POSTCOPY PostcopyTmpPage immediately.
+         */
+        postcopy_thread_create(mis, &mis->postcopy_prio_thread, "qemu/fault-fast",
+                               postcopy_preempt_thread, QEMU_THREAD_JOINABLE);
+        mis->postcopy_prio_thread_created = true;
+    }
+
     trace_postcopy_ram_enable_notify();
 
     return 0;
@@ -1516,3 +1538,40 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
         }
     }
 }
+
+bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+{
+    mis->postcopy_qemufile_dst = file;
+
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
+    s->postcopy_qemufile_src = qemu_fopen_channel_output(ioc);
+
+    trace_postcopy_preempt_new_channel();
+
+    return 0;
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
index b7d17613e8..6a1ef86eca 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -294,6 +294,20 @@ struct RAMSrcPageRequest {
     QSIMPLEQ_ENTRY(RAMSrcPageRequest) next_req;
 };
 
+typedef struct {
+    /*
+     * Cached ramblock/offset values if preempted.  They're only meaningful if
+     * preempted==true below.
+     */
+    RAMBlock *ram_block;
+    unsigned long ram_page;
+    /*
+     * Whether a postcopy preemption just happened.  Will be reset after
+     * precopy recovered to background migration.
+     */
+    bool preempted;
+} PostcopyPreemptState;
+
 /* State of RAM for migration */
 struct RAMState {
     /* QEMUFile used for this migration */
@@ -347,6 +361,14 @@ struct RAMState {
     /* Queue of outstanding page requests from the destination */
     QemuMutex src_page_req_mutex;
     QSIMPLEQ_HEAD(, RAMSrcPageRequest) src_page_requests;
+
+    /* Postcopy preemption informations */
+    PostcopyPreemptState postcopy_preempt_state;
+    /*
+     * Current channel we're using on src VM.  Only valid if postcopy-preempt
+     * is enabled.
+     */
+    int postcopy_channel;
 };
 typedef struct RAMState RAMState;
 
@@ -354,6 +376,11 @@ static RAMState *ram_state;
 
 static NotifierWithReturnList precopy_notifier_list;
 
+static void postcopy_preempt_reset(RAMState *rs)
+{
+    memset(&rs->postcopy_preempt_state, 0, sizeof(PostcopyPreemptState));
+}
+
 /* Whether postcopy has queued requests? */
 static bool postcopy_has_request(RAMState *rs)
 {
@@ -1937,6 +1964,55 @@ void ram_write_tracking_stop(void)
 }
 #endif /* defined(__linux__) */
 
+/*
+ * Check whether two addr/offset of the ramblock falls onto the same host huge
+ * page.  Returns true if so, false otherwise.
+ */
+static bool offset_on_same_huge_page(RAMBlock *rb, uint64_t addr1,
+                                     uint64_t addr2)
+{
+    size_t page_size = qemu_ram_pagesize(rb);
+
+    addr1 = ROUND_DOWN(addr1, page_size);
+    addr2 = ROUND_DOWN(addr2, page_size);
+
+    return addr1 == addr2;
+}
+
+/*
+ * Whether a previous preempted precopy huge page contains current requested
+ * page?  Returns true if so, false otherwise.
+ *
+ * This should really happen very rarely, because it means when we were sending
+ * during background migration for postcopy we're sending exactly the page that
+ * some vcpu got faulted on on dest node.  When it happens, we probably don't
+ * need to do much but drop the request, because we know right after we restore
+ * the precopy stream it'll be serviced.  It'll slightly affect the order of
+ * postcopy requests to be serviced (e.g. it'll be the same as we move current
+ * request to the end of the queue) but it shouldn't be a big deal.  The most
+ * imporant thing is we can _never_ try to send a partial-sent huge page on the
+ * POSTCOPY channel again, otherwise that huge page will got "split brain" on
+ * two channels (PRECOPY, POSTCOPY).
+ */
+static bool postcopy_preempted_contains(RAMState *rs, RAMBlock *block,
+                                        ram_addr_t offset)
+{
+    PostcopyPreemptState *state = &rs->postcopy_preempt_state;
+
+    /* No preemption at all? */
+    if (!state->preempted) {
+        return false;
+    }
+
+    /* Not even the same ramblock? */
+    if (state->ram_block != block) {
+        return false;
+    }
+
+    return offset_on_same_huge_page(block, offset,
+                                    state->ram_page << TARGET_PAGE_BITS);
+}
+
 /**
  * get_queued_page: unqueue a page from the postcopy requests
  *
@@ -1952,9 +2028,17 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
     RAMBlock  *block;
     ram_addr_t offset;
 
+again:
     block = unqueue_page(rs, &offset);
 
-    if (!block) {
+    if (block) {
+        /* See comment above postcopy_preempted_contains() */
+        if (postcopy_preempted_contains(rs, block, offset)) {
+            trace_postcopy_preempt_hit(block->idstr, offset);
+            /* This request is dropped */
+            goto again;
+        }
+    } else {
         /*
          * Poll write faults too if background snapshot is enabled; that's
          * when we have vcpus got blocked by the write protected pages.
@@ -2173,6 +2257,114 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
     return ram_save_page(rs, pss, last_stage);
 }
 
+static bool postcopy_needs_preempt(RAMState *rs, PageSearchStatus *pss)
+{
+    /* Not enabled eager preempt?  Then never do that. */
+    if (!migrate_postcopy_preempt()) {
+        return false;
+    }
+
+    /* If the ramblock we're sending is a small page?  Never bother. */
+    if (qemu_ram_pagesize(pss->block) == TARGET_PAGE_SIZE) {
+        return false;
+    }
+
+    /* Not in postcopy at all? */
+    if (!migration_in_postcopy()) {
+        return false;
+    }
+
+    /*
+     * If we're already handling a postcopy request, don't preempt as this page
+     * has got the same high priority.
+     */
+    if (pss->postcopy_requested) {
+        return false;
+    }
+
+    /* If there's postcopy requests, then check it up! */
+    return postcopy_has_request(rs);
+}
+
+/* Returns true if we preempted precopy, false otherwise */
+static void postcopy_do_preempt(RAMState *rs, PageSearchStatus *pss)
+{
+    PostcopyPreemptState *p_state = &rs->postcopy_preempt_state;
+
+    trace_postcopy_preempt_triggered(pss->block->idstr, pss->page);
+
+    /*
+     * Time to preempt precopy. Cache current PSS into preempt state, so that
+     * after handling the postcopy pages we can recover to it.  We need to do
+     * so because the dest VM will have partial of the precopy huge page kept
+     * over in its tmp huge page caches; better move on with it when we can.
+     */
+    p_state->ram_block = pss->block;
+    p_state->ram_page = pss->page;
+    p_state->preempted = true;
+}
+
+/* Whether we're preempted by a postcopy request during sending a huge page */
+static bool postcopy_preempt_triggered(RAMState *rs)
+{
+    return rs->postcopy_preempt_state.preempted;
+}
+
+static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
+{
+    PostcopyPreemptState *state = &rs->postcopy_preempt_state;
+
+    assert(state->preempted);
+
+    pss->block = state->ram_block;
+    pss->page = state->ram_page;
+    /* This is not a postcopy request but restoring previous precopy */
+    pss->postcopy_requested = false;
+
+    trace_postcopy_preempt_restored(pss->block->idstr, pss->page);
+
+    /* Reset preempt state, most importantly, set preempted==false */
+    postcopy_preempt_reset(rs);
+}
+
+static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
+{
+    int channel = pss->postcopy_requested ? RAM_CHANNEL_POSTCOPY : RAM_CHANNEL_PRECOPY;
+    MigrationState *s = migrate_get_current();
+    QEMUFile *next;
+
+    if (channel != rs->postcopy_channel) {
+        if (channel == RAM_CHANNEL_PRECOPY) {
+            next = s->to_dst_file;
+        } else {
+            next = s->postcopy_qemufile_src;
+        }
+        /* Update and cache the current channel */
+        rs->f = next;
+        rs->postcopy_channel = channel;
+
+        /*
+         * If channel switched, reset last_sent_block since the old sent block
+         * may not be on the same channel.
+         */
+        rs->last_sent_block = NULL;
+
+        trace_postcopy_preempt_switch_channel(channel);
+    }
+
+    trace_postcopy_preempt_send_host_page(pss->block->idstr, pss->page);
+}
+
+/* We need to make sure rs->f always points to the default channel elsewhere */
+static void postcopy_preempt_reset_channel(RAMState *rs)
+{
+    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
+        rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
+        rs->f = migrate_get_current()->to_dst_file;
+        trace_postcopy_preempt_reset_channel();
+    }
+}
+
 /**
  * ram_save_host_page: save a whole host page
  *
@@ -2207,7 +2399,16 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
         return 0;
     }
 
+    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
+        postcopy_preempt_choose_channel(rs, pss);
+    }
+
     do {
+        if (postcopy_needs_preempt(rs, pss)) {
+            postcopy_do_preempt(rs, pss);
+            break;
+        }
+
         /* Check the pages is dirty and if it is send it */
         if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
             tmppages = ram_save_target_page(rs, pss, last_stage);
@@ -2229,6 +2430,19 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
              offset_in_ramblock(pss->block,
                                 ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
 
+    /*
+     * When with postcopy preempt mode, flush the data as soon as possible for
+     * postcopy requests, because we've already sent a whole huge page, so the
+     * dst node should already have enough resource to atomically filling in
+     * the current missing page.
+     *
+     * More importantly, when using separate postcopy channel, we must do
+     * explicit flush or it won't flush until the buffer is full.
+     */
+    if (migrate_postcopy_preempt() && pss->postcopy_requested) {
+        qemu_fflush(rs->f);
+    }
+
     res = ram_save_release_protection(rs, pss, start_page);
     return (res < 0 ? res : pages);
 }
@@ -2272,8 +2486,17 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
         found = get_queued_page(rs, &pss);
 
         if (!found) {
-            /* priority queue empty, so just search for something dirty */
-            found = find_dirty_block(rs, &pss, &again);
+            /*
+             * Recover previous precopy ramblock/offset if postcopy has
+             * preempted precopy.  Otherwise find the next dirty bit.
+             */
+            if (postcopy_preempt_triggered(rs)) {
+                postcopy_preempt_restore(rs, &pss);
+                found = true;
+            } else {
+                /* priority queue empty, so just search for something dirty */
+                found = find_dirty_block(rs, &pss, &again);
+            }
         }
 
         if (found) {
@@ -2401,6 +2624,8 @@ static void ram_state_reset(RAMState *rs)
     rs->last_page = 0;
     rs->last_version = ram_list.version;
     rs->xbzrle_enabled = false;
+    postcopy_preempt_reset(rs);
+    rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
 }
 
 #define MAX_WAIT 50 /* ms, half buffered_file limit */
@@ -3043,6 +3268,8 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
     }
     qemu_mutex_unlock(&rs->bitmap_mutex);
 
+    postcopy_preempt_reset_channel(rs);
+
     /*
      * Must occur before EOS (or any QEMUFile operation)
      * because of RDMA protocol.
@@ -3110,6 +3337,8 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
     }
 
+    postcopy_preempt_reset_channel(rs);
+
     if (ret >= 0) {
         multifd_send_sync_main(rs->f);
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
@@ -3192,11 +3421,13 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
  * @mis: the migration incoming state pointer
  * @f: QEMUFile where to read the data from
  * @flags: Page flags (mostly to see if it's a continuation of previous block)
+ * @channel: the channel we're using
  */
 static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
-                                              QEMUFile *f, int flags)
+                                              QEMUFile *f, int flags,
+                                              int channel)
 {
-    RAMBlock *block = mis->last_recv_block;
+    RAMBlock *block = mis->last_recv_block[channel];
     char id[256];
     uint8_t len;
 
@@ -3223,7 +3454,7 @@ static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
         return NULL;
     }
 
-    mis->last_recv_block = block;
+    mis->last_recv_block[channel] = block;
 
     return block;
 }
@@ -3642,15 +3873,15 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis)
  * rcu_read_lock is taken prior to this being called.
  *
  * @f: QEMUFile where to send the data
+ * @channel: the channel to use for loading
  */
-static int ram_load_postcopy(QEMUFile *f)
+static int ram_load_postcopy(QEMUFile *f, int channel)
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
@@ -3677,7 +3908,7 @@ static int ram_load_postcopy(QEMUFile *f)
         trace_ram_load_postcopy_loop((uint64_t)addr, flags);
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE)) {
-            block = ram_block_from_stream(mis, f, flags);
+            block = ram_block_from_stream(mis, f, flags, channel);
             if (!block) {
                 ret = -EINVAL;
                 break;
@@ -3715,10 +3946,10 @@ static int ram_load_postcopy(QEMUFile *f)
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
@@ -3818,6 +4049,28 @@ static int ram_load_postcopy(QEMUFile *f)
     return ret;
 }
 
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
+
+
 static bool postcopy_is_advised(void)
 {
     PostcopyState ps = postcopy_state_get();
@@ -3930,7 +4183,7 @@ static int ram_load_precopy(QEMUFile *f)
 
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
-            RAMBlock *block = ram_block_from_stream(mis, f, flags);
+            RAMBlock *block = ram_block_from_stream(mis, f, flags, RAM_CHANNEL_PRECOPY);
 
             host = host_from_ram_block_offset(block, addr);
             /*
@@ -4107,7 +4360,12 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
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
@@ -4269,6 +4527,12 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
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
index 2c6dc3675d..f31b8c0ece 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -72,6 +72,8 @@ int64_t ramblock_recv_bitmap_send(QEMUFile *file,
                                   const char *block_name);
 int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *rb);
 bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t start);
+void postcopy_preempt_shutdown_file(MigrationState *s);
+void *postcopy_preempt_thread(void *opaque);
 
 /* ram cache */
 int colo_init_ram_cache(void);
diff --git a/migration/socket.c b/migration/socket.c
index 05705a32d8..955c5ebb10 100644
--- a/migration/socket.c
+++ b/migration/socket.c
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
index 3a9b3567ae..6452179bee 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -110,6 +110,12 @@ ram_save_iterate_big_wait(uint64_t milliconds, int iterations) "big wait: %" PRI
 ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteration %" PRIu64
 ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
 ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
+postcopy_preempt_triggered(char *str, unsigned long page) "during sending ramblock %s offset 0x%lx"
+postcopy_preempt_restored(char *str, unsigned long page) "ramblock %s offset 0x%lx"
+postcopy_preempt_hit(char *str, uint64_t offset) "ramblock %s offset 0x%"PRIx64
+postcopy_preempt_send_host_page(char *str, uint64_t offset) "ramblock %s offset 0x%"PRIx64
+postcopy_preempt_switch_channel(int channel) "%d"
+postcopy_preempt_reset_channel(void) ""
 
 # multifd.c
 multifd_new_send_channel_async(uint8_t id) "channel %d"
@@ -175,6 +181,7 @@ migration_thread_low_pending(uint64_t pending) "%" PRIu64
 migrate_transferred(uint64_t tranferred, uint64_t time_spent, uint64_t bandwidth, uint64_t size) "transferred %" PRIu64 " time_spent %" PRIu64 " bandwidth %" PRIu64 " max_size %" PRId64
 process_incoming_migration_co_end(int ret, int ps) "ret=%d postcopy-state=%d"
 process_incoming_migration_co_postcopy_end_main(void) ""
+postcopy_preempt_enabled(bool value) "%d"
 
 # channel.c
 migration_set_incoming_channel(void *ioc, const char *ioctype) "ioc=%p ioctype=%s"
@@ -277,6 +284,9 @@ postcopy_request_shared_page(const char *sharer, const char *rb, uint64_t rb_off
 postcopy_request_shared_page_present(const char *sharer, const char *rb, uint64_t rb_offset) "%s already %s offset 0x%"PRIx64
 postcopy_wake_shared(uint64_t client_addr, const char *rb) "at 0x%"PRIx64" in %s"
 postcopy_page_req_del(void *addr, int count) "resolved page req %p total %d"
+postcopy_preempt_new_channel(void) ""
+postcopy_preempt_thread_entry(void) ""
+postcopy_preempt_thread_exit(void) ""
 
 get_mem_fault_cpu_index(int cpu, uint32_t pid) "cpu: %d, pid: %u"
 
-- 
2.32.0


