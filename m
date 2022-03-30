Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D344ECEF3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:46:43 +0200 (CEST)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZg9K-0001W3-DS
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:46:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2K-00060U-0h
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2I-0005Fu-1E
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffvhKWyfzJn2iowy5Yr0REXiZWOmBeW+MY7e6yM3urw=;
 b=VrUDfCPT0ew2C1p5QijB6ngaa+/VtsZIY6ElFu8KdJspiSpBBhr9TxO+X2EUB548dNaOx4
 oRCMu/UtSwoPaHSZB2uwNgQ2EJ7UcoupUkmTbptGW6FMO/oimfny7ijU2KHKLUZuhQFrvQ
 q5zdY+na/5LyIxov2yX3SuUqm0QKIg4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-Ts_oVX2tNt-BO7nDeglC7Q-1; Wed, 30 Mar 2022 17:39:24 -0400
X-MC-Unique: Ts_oVX2tNt-BO7nDeglC7Q-1
Received: by mail-qv1-f71.google.com with SMTP id
 g13-20020ad4480d000000b004436a155886so4970623qvy.2
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffvhKWyfzJn2iowy5Yr0REXiZWOmBeW+MY7e6yM3urw=;
 b=mYrFvEjIk+8xR1CulDwdpej9n1XNFAsaduEkR5gpyh4e0HUMkufrLzID5rYpO6nO83
 0KRZtRr80nmSCPmMeqE34bV9aUtILEbtx3X1seVAIKpi1uFPpQ7i/pbMOx0HQ1Y8ET4D
 HZic7vGsM0dssHk8bkULOKgvakJABQfq5Z4+iMVv0hVo1apXuGCn/moe4XP2Nfg4o+Tf
 GvABCUrv3q3w3LL0Z+TIZflTYPaVtCVNtfQkmeVHTfisfNjJAh0jzcRX4c2AZZfQzPV4
 772lSs1pBxRaGuys7awpDGjK+i3zd3akVrpROco/Mmi3BmADPTqMcHKA0jwwdLWzOXtb
 XiOQ==
X-Gm-Message-State: AOAM531FTCV8zeD4bJ0DhgKK0dFNICiGDEwYxBRALswiYcDztW8gX/0J
 HCvxKhCP/1ukOhItg6bQ0iBa6P18nxDslpOTq1nzBk9KvIVBhb2xtUXRzTN1V2ZIJg//fu57LHP
 +ZYkCKT5TMIOUWwbKK9XB671wxSg8ixfIBCWpWD5044J9Io6TU5CdkvA8Osrj2J7T
X-Received: by 2002:a05:6214:5088:b0:441:3f3:a3d1 with SMTP id
 kk8-20020a056214508800b0044103f3a3d1mr1178553qvb.104.1648676363643; 
 Wed, 30 Mar 2022 14:39:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVHhiGYI0qTaLwds+P4MWS0Dk3TfbbZrNxW8ITviAdVEQe/8PPrMRd0EiPuVgAFvU2eepMPA==
X-Received: by 2002:a05:6214:5088:b0:441:3f3:a3d1 with SMTP id
 kk8-20020a056214508800b0044103f3a3d1mr1178524qvb.104.1648676363253; 
 Wed, 30 Mar 2022 14:39:23 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:22 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/19] migration: Create the postcopy preempt channel
 asynchronously
Date: Wed, 30 Mar 2022 17:39:01 -0400
Message-Id: <20220330213908.26608-13-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330213908.26608-1-peterx@redhat.com>
References: <20220330213908.26608-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
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

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    | 16 ++++++++++++
 migration/migration.h    |  7 +++++
 migration/postcopy-ram.c | 56 +++++++++++++++++++++++++++++++---------
 migration/postcopy-ram.h |  1 +
 4 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 157a34c844..33faa0ff6e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3021,6 +3021,12 @@ static int postcopy_start(MigrationState *ms)
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
@@ -3502,6 +3508,14 @@ static MigThrError postcopy_pause(MigrationState *s)
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
@@ -4361,6 +4375,7 @@ static void migration_instance_finalize(Object *obj)
     qemu_sem_destroy(&ms->postcopy_pause_sem);
     qemu_sem_destroy(&ms->postcopy_pause_rp_sem);
     qemu_sem_destroy(&ms->rp_state.rp_sem);
+    qemu_sem_destroy(&ms->postcopy_qemufile_src_sem);
     error_free(ms->error);
 }
 
@@ -4407,6 +4422,7 @@ static void migration_instance_init(Object *obj)
     qemu_sem_init(&ms->rp_state.rp_sem, 0);
     qemu_sem_init(&ms->rate_limit_sem, 0);
     qemu_sem_init(&ms->wait_unplug_sem, 0);
+    qemu_sem_init(&ms->postcopy_qemufile_src_sem, 0);
     qemu_mutex_init(&ms->qemu_file_lock);
 }
 
diff --git a/migration/migration.h b/migration/migration.h
index 91f845e9e4..f898b8547a 100644
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
index e20305a9e2..ab2a50cf45 100644
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
+        s->postcopy_qemufile_src = qemu_fopen_channel_output(ioc);
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
-    s->postcopy_qemufile_src = qemu_fopen_channel_output(ioc);
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


