Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BD852AC68
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:04:00 +0200 (CEST)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3Q7-0003UW-MD
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 16:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KM-0003Bp-RC
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KG-0002LR-LS
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0oXRaHqrIlv7G6Q7tst3GNwnsfe46kf5Cf//5Q3T+8=;
 b=D5f1wuQnu14RRTc7l/XxEE1hFX2suO1FTnHad6FxgynfSTSe9sTWcaIvbSuRZ67eku/CmN
 6k4BLWGefooVf0xlOYbUMFTfZ4v7qcTX9fAbAnBmxvuAaPX6aQ4hVd8GbHC9TXnGwbh4qI
 mKpV0dTngzv+uIgMBuy23CegN9fcJ3s=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-avUBDG52MF6K-hP0EZGiRw-1; Tue, 17 May 2022 15:57:42 -0400
X-MC-Unique: avUBDG52MF6K-hP0EZGiRw-1
Received: by mail-io1-f70.google.com with SMTP id
 y13-20020a056602164d00b0065a9dec1ef2so13035644iow.23
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0oXRaHqrIlv7G6Q7tst3GNwnsfe46kf5Cf//5Q3T+8=;
 b=TCosm0kjqmqbduqrr8X7SX8j8DDGwlM2lQvNj3ympoV0sMbJWtl6tnzXZ46F+ue8xm
 wWL5cZklf0OWwJykCSLEqDVJerPzhMb9DRwTtcxsf956qXJkYl7QxHKj3MnP/NR+oBUC
 +ZKkB3L6tn9U4lIq8DkXjDvTjkwRvtc1iovjqTckDCtsX9Xfl7rjRu+D2mXENthYIvXR
 7jho2zBfkIj9x+mEpm3R7Z8w4GJA796IiDxqLOByVf/lz7QOOEOJG13vj4X5+zmYhD/M
 swrxkzw5cSXwHW2r5/y7l1P8Stoe0V8JiXfa/5ZUkBL9csIztJ/bOlMMja6Cafl5Gbo8
 72Hw==
X-Gm-Message-State: AOAM533fUkqn5UtGJL56VixXIM4muxQUftIFBJy9AQKTkPl3QQUlxy3s
 CKSGGwaZGCc205+fniATx6Lv5MueXD0cLX+n9fMJepE3CryD3zzw3ibgFSfaIcIBuOFMz42dGFp
 y0TEJbErj0Hrx+5lAAG9G8yXcoCrW69GYVePoF48UbddesVBTIixqkCkLa5qCnjDQ
X-Received: by 2002:a05:6e02:1808:b0:2cf:41d7:7a20 with SMTP id
 a8-20020a056e02180800b002cf41d77a20mr11839386ilv.300.1652817460987; 
 Tue, 17 May 2022 12:57:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf03d3/1QdZheliLsk2HLPVtrrInE3p1warntGYVErbTo0aj247AHJgX9hTmC7haUGO/vpUw==
X-Received: by 2002:a05:6e02:1808:b0:2cf:41d7:7a20 with SMTP id
 a8-20020a056e02180800b002cf41d77a20mr11839364ilv.300.1652817460515; 
 Tue, 17 May 2022 12:57:40 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020b4f00b002d125725709sm59575ilu.28.2022.05.17.12.57.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 May 2022 12:57:39 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 04/13] migration: Postcopy recover with preempt enabled
Date: Tue, 17 May 2022 15:57:21 -0400
Message-Id: <20220517195730.32312-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517195730.32312-1-peterx@redhat.com>
References: <20220517195730.32312-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

To allow postcopy recovery, the ram fast load (preempt-only) dest QEMU thread
needs similar handling on fault tolerance.  When ram_load_postcopy() fails,
instead of stopping the thread it halts with a semaphore, preparing to be
kicked again when recovery is detected.

A mutex is introduced to make sure there's no concurrent operation upon the
socket.  To make it simple, the fast ram load thread will take the mutex during
its whole procedure, and only release it if it's paused.  The fast-path socket
will be properly released by the main loading thread safely when there's
network failures during postcopy with that mutex held.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    | 27 +++++++++++++++++++++++----
 migration/migration.h    | 19 +++++++++++++++++++
 migration/postcopy-ram.c | 25 +++++++++++++++++++++++--
 migration/qemu-file.c    | 27 +++++++++++++++++++++++++++
 migration/qemu-file.h    |  1 +
 migration/savevm.c       | 26 ++++++++++++++++++++++++--
 migration/trace-events   |  2 ++
 7 files changed, 119 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 57cc8bc029..8679fc6407 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -215,9 +215,11 @@ void migration_object_init(void)
     current_incoming->postcopy_remote_fds =
         g_array_new(FALSE, TRUE, sizeof(struct PostCopyFD));
     qemu_mutex_init(&current_incoming->rp_mutex);
+    qemu_mutex_init(&current_incoming->postcopy_prio_thread_mutex);
     qemu_event_init(&current_incoming->main_thread_load_event, false);
     qemu_sem_init(&current_incoming->postcopy_pause_sem_dst, 0);
     qemu_sem_init(&current_incoming->postcopy_pause_sem_fault, 0);
+    qemu_sem_init(&current_incoming->postcopy_pause_sem_fast_load, 0);
     qemu_mutex_init(&current_incoming->page_request_mutex);
     current_incoming->page_requested = g_tree_new(page_request_addr_cmp);
 
@@ -697,9 +699,9 @@ static bool postcopy_try_recover(void)
 
         /*
          * Here, we only wake up the main loading thread (while the
-         * fault thread will still be waiting), so that we can receive
+         * rest threads will still be waiting), so that we can receive
          * commands from source now, and answer it if needed. The
-         * fault thread will be woken up afterwards until we are sure
+         * rest threads will be woken up afterwards until we are sure
          * that source is ready to reply to page requests.
          */
         qemu_sem_post(&mis->postcopy_pause_sem_dst);
@@ -3513,6 +3515,18 @@ static MigThrError postcopy_pause(MigrationState *s)
         qemu_file_shutdown(file);
         qemu_fclose(file);
 
+        /*
+         * Do the same to postcopy fast path socket too if there is.  No
+         * locking needed because no racer as long as we do this before setting
+         * status to paused.
+         */
+        if (s->postcopy_qemufile_src) {
+            migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
+            qemu_file_shutdown(s->postcopy_qemufile_src);
+            qemu_fclose(s->postcopy_qemufile_src);
+            s->postcopy_qemufile_src = NULL;
+        }
+
         migrate_set_state(&s->state, s->state,
                           MIGRATION_STATUS_POSTCOPY_PAUSED);
 
@@ -3568,8 +3582,13 @@ static MigThrError migration_detect_error(MigrationState *s)
         return MIG_THR_ERR_FATAL;
     }
 
-    /* Try to detect any file errors */
-    ret = qemu_file_get_error_obj(s->to_dst_file, &local_error);
+    /*
+     * Try to detect any file errors.  Note that postcopy_qemufile_src will
+     * be NULL when postcopy preempt is not enabled.
+     */
+    ret = qemu_file_get_error_obj_any(s->to_dst_file,
+                                      s->postcopy_qemufile_src,
+                                      &local_error);
     if (!ret) {
         /* Everything is fine */
         assert(!local_error);
diff --git a/migration/migration.h b/migration/migration.h
index ff714c235f..9220cec6bd 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -118,6 +118,18 @@ struct MigrationIncomingState {
     /* Postcopy priority thread is used to receive postcopy requested pages */
     QemuThread postcopy_prio_thread;
     bool postcopy_prio_thread_created;
+    /*
+     * Used to sync between the ram load main thread and the fast ram load
+     * thread.  It protects postcopy_qemufile_dst, which is the postcopy
+     * fast channel.
+     *
+     * The ram fast load thread will take it mostly for the whole lifecycle
+     * because it needs to continuously read data from the channel, and
+     * it'll only release this mutex if postcopy is interrupted, so that
+     * the ram load main thread will take this mutex over and properly
+     * release the broken channel.
+     */
+    QemuMutex postcopy_prio_thread_mutex;
     /*
      * An array of temp host huge pages to be used, one for each postcopy
      * channel.
@@ -147,6 +159,13 @@ struct MigrationIncomingState {
     /* notify PAUSED postcopy incoming migrations to try to continue */
     QemuSemaphore postcopy_pause_sem_dst;
     QemuSemaphore postcopy_pause_sem_fault;
+    /*
+     * This semaphore is used to allow the ram fast load thread (only when
+     * postcopy preempt is enabled) fall into sleep when there's network
+     * interruption detected.  When the recovery is done, the main load
+     * thread will kick the fast ram load thread using this semaphore.
+     */
+    QemuSemaphore postcopy_pause_sem_fast_load;
 
     /* List of listening socket addresses  */
     SocketAddressList *socket_address_list;
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index e92db0556b..b3c81b46f6 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1580,6 +1580,15 @@ int postcopy_preempt_setup(MigrationState *s, Error **errp)
     return 0;
 }
 
+static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
+{
+    trace_postcopy_pause_fast_load();
+    qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
+    qemu_sem_wait(&mis->postcopy_pause_sem_fast_load);
+    qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
+    trace_postcopy_pause_fast_load_continued();
+}
+
 void *postcopy_preempt_thread(void *opaque)
 {
     MigrationIncomingState *mis = opaque;
@@ -1592,11 +1601,23 @@ void *postcopy_preempt_thread(void *opaque)
     qemu_sem_post(&mis->thread_sync_sem);
 
     /* Sending RAM_SAVE_FLAG_EOS to terminate this thread */
-    ret = ram_load_postcopy(mis->postcopy_qemufile_dst, RAM_CHANNEL_POSTCOPY);
+    qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
+    while (1) {
+        ret = ram_load_postcopy(mis->postcopy_qemufile_dst,
+                                RAM_CHANNEL_POSTCOPY);
+        /* If error happened, go into recovery routine */
+        if (ret) {
+            postcopy_pause_ram_fast_load(mis);
+        } else {
+            /* We're done */
+            break;
+        }
+    }
+    qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
 
     rcu_unregister_thread();
 
     trace_postcopy_preempt_thread_exit();
 
-    return ret == 0 ? NULL : (void *)-1;
+    return NULL;
 }
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 1479cddad9..397652f0ba 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -139,6 +139,33 @@ int qemu_file_get_error_obj(QEMUFile *f, Error **errp)
     return f->last_error;
 }
 
+/*
+ * Get last error for either stream f1 or f2 with optional Error*.
+ * The error returned (non-zero) can be either from f1 or f2.
+ *
+ * If any of the qemufile* is NULL, then skip the check on that file.
+ *
+ * When there is no error on both qemufile, zero is returned.
+ */
+int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp)
+{
+    int ret = 0;
+
+    if (f1) {
+        ret = qemu_file_get_error_obj(f1, errp);
+        /* If there's already error detected, return */
+        if (ret) {
+            return ret;
+        }
+    }
+
+    if (f2) {
+        ret = qemu_file_get_error_obj(f2, errp);
+    }
+
+    return ret;
+}
+
 /*
  * Set the last error for stream f with optional Error*
  */
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 3f36d4dc8c..2564e5e1c7 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -156,6 +156,7 @@ void qemu_file_update_transfer(QEMUFile *f, int64_t len);
 void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
 int64_t qemu_file_get_rate_limit(QEMUFile *f);
 int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
+int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp);
 void qemu_file_set_error_obj(QEMUFile *f, int ret, Error *err);
 void qemu_file_set_error(QEMUFile *f, int ret);
 int qemu_file_shutdown(QEMUFile *f);
diff --git a/migration/savevm.c b/migration/savevm.c
index ecee05e631..050874650a 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2152,6 +2152,13 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
      */
     qemu_sem_post(&mis->postcopy_pause_sem_fault);
 
+    if (migrate_postcopy_preempt()) {
+        /* The channel should already be setup again; make sure of it */
+        assert(mis->postcopy_qemufile_dst);
+        /* Kick the fast ram load thread too */
+        qemu_sem_post(&mis->postcopy_pause_sem_fast_load);
+    }
+
     return 0;
 }
 
@@ -2597,6 +2604,21 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
     mis->to_src_file = NULL;
     qemu_mutex_unlock(&mis->rp_mutex);
 
+    /*
+     * NOTE: this must happen before reset the PostcopyTmpPages below,
+     * otherwise it's racy to reset those fields when the fast load thread
+     * can be accessing it in parallel.
+     */
+    if (mis->postcopy_qemufile_dst) {
+        qemu_file_shutdown(mis->postcopy_qemufile_dst);
+        /* Take the mutex to make sure the fast ram load thread halted */
+        qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
+        migration_ioc_unregister_yank_from_file(mis->postcopy_qemufile_dst);
+        qemu_fclose(mis->postcopy_qemufile_dst);
+        mis->postcopy_qemufile_dst = NULL;
+        qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
+    }
+
     migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
                       MIGRATION_STATUS_POSTCOPY_PAUSED);
 
@@ -2634,8 +2656,8 @@ retry:
     while (true) {
         section_type = qemu_get_byte(f);
 
-        if (qemu_file_get_error(f)) {
-            ret = qemu_file_get_error(f);
+        ret = qemu_file_get_error_obj_any(f, mis->postcopy_qemufile_dst, NULL);
+        if (ret) {
             break;
         }
 
diff --git a/migration/trace-events b/migration/trace-events
index 69f311169a..0e385c3a07 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -270,6 +270,8 @@ mark_postcopy_blocktime_begin(uint64_t addr, void *dd, uint32_t time, int cpu, i
 mark_postcopy_blocktime_end(uint64_t addr, void *dd, uint32_t time, int affected_cpu) "addr: 0x%" PRIx64 ", dd: %p, time: %u, affected_cpu: %d"
 postcopy_pause_fault_thread(void) ""
 postcopy_pause_fault_thread_continued(void) ""
+postcopy_pause_fast_load(void) ""
+postcopy_pause_fast_load_continued(void) ""
 postcopy_ram_fault_thread_entry(void) ""
 postcopy_ram_fault_thread_exit(void) ""
 postcopy_ram_fault_thread_fds_core(int baseufd, int quitfd) "ufd: %d quitfd: %d"
-- 
2.32.0


