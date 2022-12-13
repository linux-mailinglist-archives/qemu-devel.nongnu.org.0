Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68AC64BEA2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:41:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Czl-0000NI-S9; Tue, 13 Dec 2022 16:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzY-0000Hd-MU
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzW-0007fn-OG
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670967550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AlvnR1gWb8O/mfxcecLMZW7H10/RtoTDPsSF5rFLWVk=;
 b=fyaPdo+GVsJydqzJkpN3PQjXKUF6YsUHvd81utmqQlbKXc037joUQfpH2dSCPPKw2Q4oub
 SEFsCMpQN7zCbAiVDmKYt9w1Aarj0AeR3j2phbPRmpcFTaw+0y+mmyfq/JoTEBza1D/tsD
 sRcvuuxTt5yIsVKoniG2UKGqgh6Ox/U=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-133-j18HXkIsN96uGW8t508YgA-1; Tue, 13 Dec 2022 16:39:08 -0500
X-MC-Unique: j18HXkIsN96uGW8t508YgA-1
Received: by mail-qv1-f69.google.com with SMTP id
 jh2-20020a0562141fc200b004c74bbb0affso15862513qvb.21
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AlvnR1gWb8O/mfxcecLMZW7H10/RtoTDPsSF5rFLWVk=;
 b=glvxj7TbXmZkaJ2QNrGwiE/ePmKG0IjUujXVT+NGNFik+mRHowLjuBTqs+Q2kNZy71
 Vhb3F+6kuIGqFOhgiJ1xsvVNoZK9c5T1MBZGNc5V2GWc1bSnqnCUaIX2NNd31vGYNtB+
 b6n8Kuq4fuiBCrEwnvOaMKu5V6L8t8DQaHW3zJx6xTxK52G+F/TH398a21nzxCAgK6pE
 ww2D3uAS3mWR3sufpQlckFGYJKvCGz6E/K+gtFNh0wFQZbWc65LDOsNzVbanOJ/r6Ml8
 GWlBsHXOtPZuIsbl+/LLaeis4b2Mm7C85jYAG32j6PsafYDM0LdAv0DDg6KsEV5/2GA+
 e4yA==
X-Gm-Message-State: ANoB5pmRg9+fcSP9elsjgMcXClUJ34+v92MyHevd4cHdFZDdIGwnDOw4
 TWPThRmUvAGoNlMMVwp+Fiz/tbsBvbRcirdCNRt8wf2TKi0NGevWCJQ+1SvNQpVxMc9EAr8+PQ0
 4IgQk8dvpr4pjYQYc2sf9l46JV3G/peO0c4JoOvsV3sDpfc8201Zma8pj+ZUNwUe5
X-Received: by 2002:a05:622a:ce:b0:3a5:fe93:7df9 with SMTP id
 p14-20020a05622a00ce00b003a5fe937df9mr40478974qtw.31.1670967545569; 
 Tue, 13 Dec 2022 13:39:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6/2POGgkWcpBOkk6QtNLdw+Yh18tWi4+WBM/nkal7TuZ0gXESr5y/fDXg8AC2ZxuOJep406w==
X-Received: by 2002:a05:622a:ce:b0:3a5:fe93:7df9 with SMTP id
 p14-20020a05622a00ce00b003a5fe937df9mr40478935qtw.31.1670967545145; 
 Tue, 13 Dec 2022 13:39:05 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006feb158e5e7sm8607487qkp.70.2022.12.13.13.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:39:04 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH 5/5] migration: Postpone postcopy preempt channel to be after
 main
Date: Tue, 13 Dec 2022 16:38:50 -0500
Message-Id: <20221213213850.1481858-6-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221213213850.1481858-1-peterx@redhat.com>
References: <20221213213850.1481858-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Postcopy with preempt-mode enabled needs two channels to communicate.  The
order of channel establishment is not guaranteed.  It can happen that the
dest QEMU got the preempt channel connection request before the main
channel is established, then the migration may make no progress even during
precopy due to the wrong order.

To fix it, create the preempt channel only if we know the main channel is
established.

For a general postcopy migration, we delay it until postcopy_start(),
that's where we already went through some part of precopy on the main
channel.  To make sure dest QEMU has already established the channel, we
wait until we got the first PONG received.  That's something we do at the
start of precopy when postcopy enabled so it's guaranteed to happen sooner
or later.

For a postcopy recovery, we delay it to qemu_savevm_state_resume_prepare()
where we'll have round trips of data on bitmap synchronizations, which
means the main channel must have been established.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    | 72 ++++++++++++++++++++++++++++++----------
 migration/migration.h    |  6 ++++
 migration/postcopy-ram.c | 17 ++++++++--
 migration/postcopy-ram.h |  2 +-
 migration/savevm.c       |  6 +++-
 5 files changed, 82 insertions(+), 21 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index fa59846717..a85f0a092d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -232,6 +232,8 @@ void migration_object_init(void)
     qemu_sem_init(&current_incoming->postcopy_pause_sem_dst, 0);
     qemu_sem_init(&current_incoming->postcopy_pause_sem_fault, 0);
     qemu_sem_init(&current_incoming->postcopy_pause_sem_fast_load, 0);
+    qemu_sem_init(&current_incoming->postcopy_qemufile_dst_done, 0);
+
     qemu_mutex_init(&current_incoming->page_request_mutex);
     current_incoming->page_requested = g_tree_new(page_request_addr_cmp);
 
@@ -738,6 +740,31 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
     migration_incoming_process();
 }
 
+/*
+ * Returns true when we want to start a new incoming migration process,
+ * false otherwise.
+ */
+static bool migration_should_start_incoming(bool main_channel)
+{
+    /* Multifd doesn't start unless all channels are established */
+    if (migrate_use_multifd()) {
+        return migration_has_all_channels();
+    }
+
+    /* Preempt channel only starts when the main channel is created */
+    if (migrate_postcopy_preempt()) {
+        return main_channel;
+    }
+
+    /*
+     * For all the rest types of migration, we should only reach here when
+     * it's the main channel that's being created, and we should always
+     * proceed with this channel.
+     */
+    assert(main_channel);
+    return true;
+}
+
 void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
@@ -794,7 +821,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (migration_has_all_channels()) {
+    if (migration_should_start_incoming(default_channel)) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
@@ -3115,6 +3142,13 @@ static int await_return_path_close_on_source(MigrationState *ms)
     return ms->rp_state.error;
 }
 
+static inline void
+migration_wait_main_channel(MigrationState *ms)
+{
+    /* Wait until one PONG message received */
+    qemu_sem_wait(&ms->rp_state.rp_pong_acks);
+}
+
 /*
  * Switch from normal iteration to postcopy
  * Returns non-0 on error
@@ -3129,9 +3163,12 @@ static int postcopy_start(MigrationState *ms)
     bool restart_block = false;
     int cur_state = MIGRATION_STATUS_ACTIVE;
 
-    if (postcopy_preempt_wait_channel(ms)) {
-        migrate_set_state(&ms->state, ms->state, MIGRATION_STATUS_FAILED);
-        return -1;
+    if (migrate_postcopy_preempt()) {
+        migration_wait_main_channel(ms);
+        if (postcopy_preempt_establish_channel(ms)) {
+            migrate_set_state(&ms->state, ms->state, MIGRATION_STATUS_FAILED);
+            return -1;
+        }
     }
 
     if (!migrate_pause_before_switchover()) {
@@ -3542,6 +3579,20 @@ static int postcopy_do_resume(MigrationState *s)
         return ret;
     }
 
+    /*
+     * If preempt is enabled, re-establish the preempt channel.  Note that
+     * we do it after resume prepare to make sure the main channel will be
+     * created before the preempt channel.  E.g. with weak network, the
+     * dest QEMU may get messed up with the preempt and main channels on
+     * the order of connection setup.  This guarantees the correct order.
+     */
+    ret = postcopy_preempt_establish_channel(s);
+    if (ret) {
+        error_report("%s: postcopy_preempt_establish_channel(): %d",
+                     __func__, ret);
+        return ret;
+    }
+
     /*
      * Last handshake with destination on the resume (destination will
      * switch to postcopy-active afterwards)
@@ -3603,14 +3654,6 @@ static MigThrError postcopy_pause(MigrationState *s)
         if (s->state == MIGRATION_STATUS_POSTCOPY_RECOVER) {
             /* Woken up by a recover procedure. Give it a shot */
 
-            if (postcopy_preempt_wait_channel(s)) {
-                /*
-                 * Preempt enabled, and new channel create failed; loop
-                 * back to wait for another recovery.
-                 */
-                continue;
-            }
-
             /*
              * Firstly, let's wake up the return path now, with a new
              * return path channel.
@@ -4293,11 +4336,6 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         }
     }
 
-    /* This needs to be done before resuming a postcopy */
-    if (migrate_postcopy_preempt()) {
-        postcopy_preempt_setup(s);
-    }
-
     if (resume) {
         /* Wakeup the main migration thread to do the recovery */
         migrate_set_state(&s->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
diff --git a/migration/migration.h b/migration/migration.h
index 61dc2c81df..5674a13876 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -115,6 +115,12 @@ struct MigrationIncomingState {
     unsigned int postcopy_channels;
     /* QEMUFile for postcopy only; it'll be handled by a separate thread */
     QEMUFile *postcopy_qemufile_dst;
+    /*
+     * When postcopy_qemufile_dst is properly setup, this sem is posted.
+     * One can wait on this semaphore to wait until the preempt channel is
+     * properly setup.
+     */
+    QemuSemaphore postcopy_qemufile_dst_done;
     /* Postcopy priority thread is used to receive postcopy requested pages */
     QemuThread postcopy_prio_thread;
     bool postcopy_prio_thread_created;
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 7872b4fdd3..2c86bfc091 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1200,6 +1200,11 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
     }
 
     if (migrate_postcopy_preempt()) {
+        /*
+         * The preempt channel is established in asynchronous way.  Wait
+         * for its completion.
+         */
+        qemu_sem_wait(&mis->postcopy_qemufile_dst_done);
         /*
          * This thread needs to be created after the temp pages because
          * it'll fetch RAM_CHANNEL_POSTCOPY PostcopyTmpPage immediately.
@@ -1547,6 +1552,7 @@ void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
      */
     qemu_file_set_blocking(file, true);
     mis->postcopy_qemufile_dst = file;
+    qemu_sem_post(&mis->postcopy_qemufile_dst_done);
     trace_postcopy_preempt_new_channel();
 }
 
@@ -1615,14 +1621,21 @@ out:
     postcopy_preempt_send_channel_done(s, ioc, local_err);
 }
 
-/* Returns 0 if channel established, -1 for error. */
-int postcopy_preempt_wait_channel(MigrationState *s)
+/*
+ * This function will kick off an async task to establish the preempt
+ * channel, and wait until the connection setup completed.  Returns 0 if
+ * channel established, -1 for error.
+ */
+int postcopy_preempt_establish_channel(MigrationState *s)
 {
     /* If preempt not enabled, no need to wait */
     if (!migrate_postcopy_preempt()) {
         return 0;
     }
 
+    /* Kick off async task to establish preempt channel */
+    postcopy_preempt_setup(s);
+
     /*
      * We need the postcopy preempt channel to be established before
      * starting doing anything.
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index d5604cbcf1..b4867a32d5 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -192,6 +192,6 @@ enum PostcopyChannels {
 
 void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 void postcopy_preempt_setup(MigrationState *s);
-int postcopy_preempt_wait_channel(MigrationState *s);
+int postcopy_preempt_establish_channel(MigrationState *s);
 
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..881dce4647 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2118,7 +2118,11 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
     qemu_sem_post(&mis->postcopy_pause_sem_fault);
 
     if (migrate_postcopy_preempt()) {
-        /* The channel should already be setup again; make sure of it */
+        /*
+         * The preempt channel will be created in async manner, now let's
+         * wait for it and make sure it's created.
+         */
+        qemu_sem_wait(&mis->postcopy_qemufile_dst_done);
         assert(mis->postcopy_qemufile_dst);
         /* Kick the fast ram load thread too */
         qemu_sem_post(&mis->postcopy_pause_sem_fast_load);
-- 
2.37.3


