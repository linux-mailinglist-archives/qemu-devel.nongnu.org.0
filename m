Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5100555590
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 22:56:57 +0200 (CEST)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47PE-000883-PS
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 16:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IG-0002ZG-QW
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IE-0004H5-Td
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655930982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvhsLJiKfouFIpkmKsyLkMu1rJlWCcBPJQZZsJh3KVI=;
 b=CGbCRTt4n1whPZtZvr+lpBwBnQll08uuL3uAMOreT6coR81UVDSeChNDTtZsDdwfchatNJ
 qvJ/ETN+9Q+iS4133nPKQ5mgo1cYl3dCeZNnkumI8qH8QfhUtTVcypRr4o+I7dpFkPcSvN
 EuKjjizsTArzgKYO5jB4iT1BH9SPxMY=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-wT0hhUzrPb25ES2hSXAutg-1; Wed, 22 Jun 2022 16:49:41 -0400
X-MC-Unique: wT0hhUzrPb25ES2hSXAutg-1
Received: by mail-il1-f197.google.com with SMTP id
 w15-20020a056e021a6f00b002d8eef284f0so9158005ilv.6
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xvhsLJiKfouFIpkmKsyLkMu1rJlWCcBPJQZZsJh3KVI=;
 b=m9bPwASCX4t+lbnedtJWKkLqLnFPpXwN7QoJSGxbnkpPd71/IJ2ljyOJRo8SjM+Nlz
 5ajsLXFXCFOLIdLt3WQHWsDw+GL2EOD643NEstdsr46x7thbas6/eiy9URi2UskRvxyl
 6Q5fsPhaAwYgXe0syBsHG9Ikd3f3z9sew86RBYJ8qJy8qzTBikDnAwkxAYMMNcg0mStH
 /RgiSGsN664k17+BZWoLuYbDyU8NPAspXCUsFc70Q8zCXKgr2YJ3I1f3YUtP67Hk0FZY
 KSDsp8p6hOb1u68F5uKOoZqVdNUSAdT7449ZESDQDL6k8WytWKoOKUir+XGDnzz4H2v6
 GGGg==
X-Gm-Message-State: AJIora9OdaYyeWNpM0jTILfdef1YgB+QQdN69KgJgb258fIClK1wBm3X
 d1BOt0kNguyXLNU054clvVzPImjgBtl+tnpVQssXkh/Jsqau6r65ZAIrNdbOkEJlKesi65+L3j6
 IoJ/iv/elk9DXnH0dW4vCDnUcUJAOFk2FEvih1yeJx1sUXE2W8pUJRg9KaHARvUDt
X-Received: by 2002:a05:6602:2d44:b0:669:ef11:523a with SMTP id
 d4-20020a0566022d4400b00669ef11523amr2792316iow.44.1655930980109; 
 Wed, 22 Jun 2022 13:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v+XEAJfyzPxgXTvBKxPXJpSF/C9TWfdlBtrRfOwx2zQyv5JXwgxBltGIpMb5LGztOdykmNaA==
X-Received: by 2002:a05:6602:2d44:b0:669:ef11:523a with SMTP id
 d4-20020a0566022d4400b00669ef11523amr2792305iow.44.1655930979800; 
 Wed, 22 Jun 2022 13:49:39 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.49.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:49:38 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 06/15] migration: Create the postcopy preempt channel
 asynchronously
Date: Wed, 22 Jun 2022 16:49:11 -0400
Message-Id: <20220622204920.79061-7-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622204920.79061-1-peterx@redhat.com>
References: <20220622204920.79061-1-peterx@redhat.com>
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

This patch allows the postcopy preempt channel to be created
asynchronously.  The benefit is that when the connection is slow, we won't
take the BQL (and potentially block all things like QMP) for a long time
without releasing.

A function postcopy_preempt_wait_channel() is introduced, allowing the
migration thread to be able to wait on the channel creation.  The channel
is always created by the main thread, in which we'll kick a new semaphore
to tell the migration thread that the channel has created.

We'll need to wait for the new channel in two places: (1) when there's a
new postcopy migration that is starting, or (2) when there's a postcopy
migration to resume.

For the start of migration, we don't need to wait for this channel until
when we want to start postcopy, aka, postcopy_start().  We'll fail the
migration if we found that the channel creation failed (which should
probably not happen at all in 99% of the cases, because the main channel is
using the same network topology).

For a postcopy recovery, we'll need to wait in postcopy_pause().  In that
case if the channel creation failed, we can't fail the migration or we'll
crash the VM, instead we keep in PAUSED state, waiting for yet another
recovery.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    | 16 ++++++++++++
 migration/migration.h    |  7 +++++
 migration/postcopy-ram.c | 56 +++++++++++++++++++++++++++++++---------
 migration/postcopy-ram.h |  1 +
 4 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index db82ecbdcd..5d113bd5cc 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3052,6 +3052,12 @@ static int postcopy_start(MigrationState *ms)
     int64_t bandwidth = migrate_max_postcopy_bandwidth();
     bool restart_block = false;
     int cur_state = MIGRATION_STATUS_ACTIVE;
+
+    if (postcopy_preempt_wait_channel(ms)) {
+        migrate_set_state(&ms->state, ms->state, MIGRATION_STATUS_FAILED);
+        return -1;
+    }
+
     if (!migrate_pause_before_switchover()) {
         migrate_set_state(&ms->state, MIGRATION_STATUS_ACTIVE,
                           MIGRATION_STATUS_POSTCOPY_ACTIVE);
@@ -3533,6 +3539,14 @@ static MigThrError postcopy_pause(MigrationState *s)
         if (s->state == MIGRATION_STATUS_POSTCOPY_RECOVER) {
             /* Woken up by a recover procedure. Give it a shot */
 
+            if (postcopy_preempt_wait_channel(s)) {
+                /*
+                 * Preempt enabled, and new channel create failed; loop
+                 * back to wait for another recovery.
+                 */
+                continue;
+            }
+
             /*
              * Firstly, let's wake up the return path now, with a new
              * return path channel.
@@ -4397,6 +4411,7 @@ static void migration_instance_finalize(Object *obj)
     qemu_sem_destroy(&ms->postcopy_pause_sem);
     qemu_sem_destroy(&ms->postcopy_pause_rp_sem);
     qemu_sem_destroy(&ms->rp_state.rp_sem);
+    qemu_sem_destroy(&ms->postcopy_qemufile_src_sem);
     error_free(ms->error);
 }
 
@@ -4443,6 +4458,7 @@ static void migration_instance_init(Object *obj)
     qemu_sem_init(&ms->rp_state.rp_sem, 0);
     qemu_sem_init(&ms->rate_limit_sem, 0);
     qemu_sem_init(&ms->wait_unplug_sem, 0);
+    qemu_sem_init(&ms->postcopy_qemufile_src_sem, 0);
     qemu_mutex_init(&ms->qemu_file_lock);
 }
 
diff --git a/migration/migration.h b/migration/migration.h
index 9220cec6bd..ae4ffd3454 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -219,6 +219,13 @@ struct MigrationState {
     QEMUFile *to_dst_file;
     /* Postcopy specific transfer channel */
     QEMUFile *postcopy_qemufile_src;
+    /*
+     * It is posted when the preempt channel is established.  Note: this is
+     * used for both the start or recover of a postcopy migration.  We'll
+     * post to this sem every time a new preempt channel is created in the
+     * main thread, and we keep post() and wait() in pair.
+     */
+    QemuSemaphore postcopy_qemufile_src_sem;
     QIOChannelBuffer *bioc;
     /*
      * Protects to_dst_file/from_dst_file pointers.  We need to make sure we
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 84f7b1526e..70b21e9d51 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1552,10 +1552,50 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     return true;
 }
 
-int postcopy_preempt_setup(MigrationState *s, Error **errp)
+static void
+postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
 {
-    QIOChannel *ioc;
+    MigrationState *s = opaque;
+    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
+    Error *local_err = NULL;
+
+    if (qio_task_propagate_error(task, &local_err)) {
+        /* Something wrong happened.. */
+        migrate_set_error(s, local_err);
+        error_free(local_err);
+    } else {
+        migration_ioc_register_yank(ioc);
+        s->postcopy_qemufile_src = qemu_file_new_output(ioc);
+        trace_postcopy_preempt_new_channel();
+    }
+
+    /*
+     * Kick the waiter in all cases.  The waiter should check upon
+     * postcopy_qemufile_src to know whether it failed or not.
+     */
+    qemu_sem_post(&s->postcopy_qemufile_src_sem);
+    object_unref(OBJECT(ioc));
+}
 
+/* Returns 0 if channel established, -1 for error. */
+int postcopy_preempt_wait_channel(MigrationState *s)
+{
+    /* If preempt not enabled, no need to wait */
+    if (!migrate_postcopy_preempt()) {
+        return 0;
+    }
+
+    /*
+     * We need the postcopy preempt channel to be established before
+     * starting doing anything.
+     */
+    qemu_sem_wait(&s->postcopy_qemufile_src_sem);
+
+    return s->postcopy_qemufile_src ? 0 : -1;
+}
+
+int postcopy_preempt_setup(MigrationState *s, Error **errp)
+{
     if (!migrate_postcopy_preempt()) {
         return 0;
     }
@@ -1566,16 +1606,8 @@ int postcopy_preempt_setup(MigrationState *s, Error **errp)
         return -1;
     }
 
-    ioc = socket_send_channel_create_sync(errp);
-
-    if (ioc == NULL) {
-        return -1;
-    }
-
-    migration_ioc_register_yank(ioc);
-    s->postcopy_qemufile_src = qemu_file_new_output(ioc);
-
-    trace_postcopy_preempt_new_channel();
+    /* Kick an async task to connect */
+    socket_send_channel_create(postcopy_preempt_send_channel_new, s);
 
     return 0;
 }
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 34b1080cde..6147bf7d1d 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -192,5 +192,6 @@ enum PostcopyChannels {
 
 bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
+int postcopy_preempt_wait_channel(MigrationState *s);
 
 #endif
-- 
2.32.0


