Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FAD64BE9F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:41:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Czf-0000IW-T2; Tue, 13 Dec 2022 16:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzP-0000FN-K9
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzN-0007eV-DG
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670967540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZuvU4QeBogKbaQl5ZIKjeZ9crvrQIVntMvHBMji+Pk=;
 b=MsWntry+uf+S3HCp4fLcKuT1L4mn3/VDWoEiuNXzU1MhSCuvd+/UhMOJF4yrPAIHhOM6s9
 +aAjJ75pATJKp2oKklLlamncU6sxFII2MsJgYir5anGooA0Dzg5rv1JGUvFkxyYYmWSHil
 20gV6LhqG1Ra6KSex2Z9l51lkB2+tCI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-LIrI21TSNBavYdqWT0gX7A-1; Tue, 13 Dec 2022 16:38:59 -0500
X-MC-Unique: LIrI21TSNBavYdqWT0gX7A-1
Received: by mail-qk1-f200.google.com with SMTP id
 h13-20020a05620a244d00b006fb713618b8so1194318qkn.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZuvU4QeBogKbaQl5ZIKjeZ9crvrQIVntMvHBMji+Pk=;
 b=fTyA9oDanqag6FJk51+dbRg2mY+x0Q7cMwvhD7s2Dw4bviyKE2UdgvbyHnotngnbrj
 bwyILGp7CBkZB3E9xqrGGqeJl0X9qCewMv5lei1Pu+7G6Yo2H606WK9dOb2rx1pbfzcU
 RdLHTvGYwOCgaRdQdg2hCiJ0MHMkQ7TSzep8EVSH4NKLDPDT75CIqfYBNBJ/SS2riHsU
 iA/p3Su1VtQp22ohgvd+ip3Hd02NlJNVQ21fFTg/Z4rBwLmxuRJlCQsQfi9EwHFEkks3
 FUjj2X5Bcxqip4snbMlySr8eNmHvvroCdwrXrCNZGs4redublyx3DiyTRj6brEdBrWOz
 W7Ug==
X-Gm-Message-State: ANoB5pk/GetfVbge3lewaRDAVaBUwPV99ATIe3HZJdtnMxk3M85TH3uu
 ij6ihVG0IjlI5ZyzzegTzWAWNfAPVe+lLtjc5V0kSPRWeodeG5KxHrOi87KQTncsBvCPeE6o8Qj
 1R9pGfnzQGNzXRN1p/N0A8LVyo9r+LNDcuWaMETfMB7JYmLfTRv6jwifjg7TCjUnl
X-Received: by 2002:a05:622a:5da9:b0:3a8:28a4:c4be with SMTP id
 fu41-20020a05622a5da900b003a828a4c4bemr2082435qtb.0.1670967537671; 
 Tue, 13 Dec 2022 13:38:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6+PwCcF8YVKrp2VD/kBYL9U2QqyxSwoRXJHYk4BhEhrQpapVEbMqgDGgBMsfeH3bjNJ0/OBQ==
X-Received: by 2002:a05:622a:5da9:b0:3a8:28a4:c4be with SMTP id
 fu41-20020a05622a5da900b003a828a4c4bemr2082402qtb.0.1670967537256; 
 Tue, 13 Dec 2022 13:38:57 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006feb158e5e7sm8607487qkp.70.2022.12.13.13.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:38:55 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH 2/5] migration: check magic value for deciding the mapping of
 channels
Date: Tue, 13 Dec 2022 16:38:47 -0500
Message-Id: <20221213213850.1481858-3-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221213213850.1481858-1-peterx@redhat.com>
References: <20221213213850.1481858-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: "manish.mishra" <manish.mishra@nutanix.com>

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses read peek to check the magic number of
channels so that current data/control stream management remains
un-effected.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
Suggested-by: Daniel P. Berrangé <berrange@redhat.com
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/channel.c      | 45 ++++++++++++++++++++++++++++++++++++++++
 migration/channel.h      |  5 +++++
 migration/migration.c    | 45 +++++++++++++++++++++++++++++-----------
 migration/multifd.c      | 12 ++++-------
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.c |  5 +----
 migration/postcopy-ram.h |  2 +-
 7 files changed, 90 insertions(+), 26 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index 1b0815039f..270b7acca2 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -92,3 +92,48 @@ void migration_channel_connect(MigrationState *s,
     migrate_fd_connect(s, error);
     error_free(error);
 }
+
+
+/**
+ * @migration_channel_read_peek - Read from the peek of migration channel,
+ *    without actually removing it from channel buffer.
+ *
+ * @ioc: the channel object
+ * @buf: the memory region to read data into
+ * @buflen: the number of bytes to read in @buf
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Returns 0 if successful, returns -1 and sets @errp if fails.
+ */
+int migration_channel_read_peek(QIOChannel *ioc,
+                                const char *buf,
+                                const size_t buflen,
+                                Error **errp)
+{
+    ssize_t len = 0;
+    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
+
+    while (true) {
+        len = qio_channel_readv_full(ioc, &iov, 1, NULL,
+                                     NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
+
+        if (len <= 0 && len != QIO_CHANNEL_ERR_BLOCK) {
+            error_setg(errp,
+                       "Failed to read peek of channel");
+            return -1;
+        }
+
+        if (len == buflen) {
+            break;
+        }
+
+        /* 1ms sleep. */
+        if (qemu_in_coroutine()) {
+            qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000);
+        } else {
+            g_usleep(1000);
+        }
+    }
+
+    return 0;
+}
diff --git a/migration/channel.h b/migration/channel.h
index 67a461c28a..5bdb8208a7 100644
--- a/migration/channel.h
+++ b/migration/channel.h
@@ -24,4 +24,9 @@ void migration_channel_connect(MigrationState *s,
                                QIOChannel *ioc,
                                const char *hostname,
                                Error *error_in);
+
+int migration_channel_read_peek(QIOChannel *ioc,
+                                const char *buf,
+                                const size_t buflen,
+                                Error **errp);
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index c3490c495d..35b43d0108 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -31,6 +31,7 @@
 #include "migration.h"
 #include "savevm.h"
 #include "qemu-file.h"
+#include "channel.h"
 #include "migration/vmstate.h"
 #include "block/block.h"
 #include "qapi/error.h"
@@ -733,31 +734,51 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
-    bool start_migration;
     QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
 
-    if (!mis->from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() && !migrate_postcopy_ram() &&
+        qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        /*
+         * With multiple channels, it is possible that we receive channels
+         * out of order on destination side, causing incorrect mapping of
+         * source channels on destination side. Check channel MAGIC to
+         * decide type of channel. Please note this is best effort, postcopy
+         * preempt channel does not send any magic number so avoid it for
+         * postcopy live migration. Also tls live migration already does
+         * tls handshake while initializing main channel so with tls this
+         * issue is not possible.
+         */
+        ret = migration_channel_read_peek(ioc, (void *)&channel_magic,
+                                          sizeof(channel_magic), &local_err);
+
+        if (ret != 0) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else {
+        default_channel = !mis->from_src_file;
+    }
+
+    if (default_channel) {
         f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
-
-        /*
-         * Common migration only needs one channel, so we can start
-         * right now.  Some features need more than one channel, we wait.
-         */
-        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
         if (migrate_use_multifd()) {
-            start_migration = multifd_recv_new_channel(ioc, &local_err);
+            multifd_recv_new_channel(ioc, &local_err);
         } else {
             assert(migrate_postcopy_preempt());
             f = qemu_file_new_input(ioc);
-            start_migration = postcopy_preempt_new_channel(mis, f);
+            postcopy_preempt_new_channel(mis, f);
         }
         if (local_err) {
             error_propagate(errp, local_err);
@@ -765,7 +786,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (start_migration) {
+    if (migration_has_all_channels()) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 17f5730257..4f6028997d 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1228,11 +1228,9 @@ bool multifd_recv_all_channels_created(void)
 
 /*
  * Try to receive all multifd channels to get ready for the migration.
- * - Return true and do not set @errp when correctly receiving all channels;
- * - Return false and do not set @errp when correctly receiving the current one;
- * - Return false and set @errp when failing to receive the current channel.
+ * Sets @errp when failing to receive the current channel.
  */
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
@@ -1245,7 +1243,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                                 "failed to receive packet"
                                 " via multifd channel %d: ",
                                 qatomic_read(&multifd_recv_state->count));
-        return false;
+        return;
     }
     trace_multifd_recv_new_channel(id);
 
@@ -1255,7 +1253,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                    id);
         multifd_recv_terminate_threads(local_err);
         error_propagate(errp, local_err);
-        return false;
+        return;
     }
     p->c = ioc;
     object_ref(OBJECT(ioc));
@@ -1266,6 +1264,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&multifd_recv_state->count);
-    return qatomic_read(&multifd_recv_state->count) ==
-           migrate_multifd_channels();
 }
diff --git a/migration/multifd.h b/migration/multifd.h
index 519f498643..913e4ba274 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..f84f783ab4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     }
 }
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
 {
     /*
      * The new loading channel has its own threads, so it needs to be
@@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     qemu_file_set_blocking(file, true);
     mis->postcopy_qemufile_dst = file;
     trace_postcopy_preempt_new_channel();
-
-    /* Start the migration immediately */
-    return true;
 }
 
 /*
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6147bf7d1d..25881c4127 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -190,7 +190,7 @@ enum PostcopyChannels {
     RAM_CHANNEL_MAX,
 };
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
-- 
2.37.3


