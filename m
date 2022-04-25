Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160FB50ECF3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:54:03 +0200 (CEST)
Received: from localhost ([::1]:53404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8Wo-0007y0-5s
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8Ia-0007c8-08
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IT-0007mA-8O
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97LnQX+iWnm8/SAWY3ZLNjNkHl1aDQ7WHKhz4ajwKNo=;
 b=K1sVJfsRTcch0X5Aaxd63pnJuhkaFaRNA+mbP2YO5e7aCn+4SjxIsFb/H03GUoOCUlftuZ
 wuBsYo3tLEJXFLEiUWfFJe52Ewi9877/jTJ4eZsWqw+RMIhPCVif65XKekOVxo2ZvG68FJ
 XDII6rKPMA0uCU9MCZ+I/FGkbPnpn+0=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-RzXLxdRDO4ahEMPC8jxIjA-1; Mon, 25 Apr 2022 19:39:11 -0400
X-MC-Unique: RzXLxdRDO4ahEMPC8jxIjA-1
Received: by mail-io1-f71.google.com with SMTP id
 m206-20020a6b3fd7000000b00657a48f1a70so7547ioa.4
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97LnQX+iWnm8/SAWY3ZLNjNkHl1aDQ7WHKhz4ajwKNo=;
 b=Ke5c6MxafOLRTETODnR73wQmgxYAjg5dE+D2TVX26F7smAaP+mEYsIPqTQ0reLUdzN
 CaIh2nx9qlBDmm6vX2UWC7rsBtQK5j+aFOwV290kNMOGf1d9NWqXg5OGiU8l/FnlvmJ+
 caGYluzLorm4OY0B9jIUCOCY5WCAHxir3P1JZVnlY8xQHjPMNEThKtI8EImRA1dhp2sX
 JdA/wqg7ccj50D+/BHTZ7yjNTeEnVJdyosgDNl/eLP16Kxasb5XfHpKnU1EH6o52nJMp
 owiiSFJuePvqFfmSC3NsTxMLAubfplmZKaZZoezqUIE1Gruy7PMK6MPuOjWJF5TcrtAH
 lunw==
X-Gm-Message-State: AOAM531sJGGBwjOS8fHCOkLmkZ+MpkO74WKfLTSMxfa1FxMHYilVKr2l
 X3JzlD5gxo1wa9RZ3Kd+edJzXB3dxj7KhBdTcZGa4E2A3fowo2lEEPQF/a9gfbzXQyjtz1yM+CJ
 H1EAsq17PfMRQ+UvlkM4SFVePmPHS5GnBhnOyg6K1B7RmeKsDi8SBsMdy6hCNCMKo
X-Received: by 2002:a02:a68d:0:b0:32a:f755:821f with SMTP id
 j13-20020a02a68d000000b0032af755821fmr2212534jam.185.1650929950812; 
 Mon, 25 Apr 2022 16:39:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBI9Tad2Ea8iLqabEDhBhnV3YgRlRuyEp2TN2pH/tEs8NZvWtyUW8E96wg0M2atjA2Bgc6cw==
X-Received: by 2002:a02:a68d:0:b0:32a:f755:821f with SMTP id
 j13-20020a02a68d000000b0032af755821fmr2212520jam.185.1650929950479; 
 Mon, 25 Apr 2022 16:39:10 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.39.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:39:10 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/21] migration: Enable TLS for preempt channel
Date: Mon, 25 Apr 2022 19:38:44 -0400
Message-Id: <20220425233847.10393-19-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is based on the async preempt channel creation.  It continues
wiring up the new channel with TLS handshake to destionation when enabled.

Note that only the src QEMU needs such operation; the dest QEMU does not
need any change for TLS support due to the fact that all channels are
established synchronously there, so all the TLS magic is already properly
handled by migration_tls_channel_process_incoming().

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 57 ++++++++++++++++++++++++++++++++++------
 migration/trace-events   |  1 +
 2 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 1bb603051a..4a4da16389 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -36,6 +36,7 @@
 #include "socket.h"
 #include "qemu-file-channel.h"
 #include "yank_functions.h"
+#include "tls.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
@@ -1552,15 +1553,15 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     return true;
 }
 
+/*
+ * Setup the postcopy preempt channel with the IOC.  If ERROR is specified,
+ * setup the error instead.  This helper will free the ERROR if specified.
+ */
 static void
-postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
+postcopy_preempt_send_channel_done(MigrationState *s,
+                                   QIOChannel *ioc, Error *local_err)
 {
-    MigrationState *s = opaque;
-    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
-    Error *local_err = NULL;
-
-    if (qio_task_propagate_error(task, &local_err)) {
-        /* Something wrong happened.. */
+    if (local_err) {
         migrate_set_error(s, local_err);
         error_free(local_err);
     } else {
@@ -1574,7 +1575,47 @@ postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
      * postcopy_qemufile_src to know whether it failed or not.
      */
     qemu_sem_post(&s->postcopy_qemufile_src_sem);
-    object_unref(OBJECT(ioc));
+}
+
+static void
+postcopy_preempt_tls_handshake(QIOTask *task, gpointer opaque)
+{
+    g_autoptr(QIOChannel) ioc = QIO_CHANNEL(qio_task_get_source(task));
+    MigrationState *s = opaque;
+    Error *local_err = NULL;
+
+    qio_task_propagate_error(task, &local_err);
+    postcopy_preempt_send_channel_done(s, ioc, local_err);
+}
+
+static void
+postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
+{
+    g_autoptr(QIOChannel) ioc = QIO_CHANNEL(qio_task_get_source(task));
+    MigrationState *s = opaque;
+    QIOChannelTLS *tioc;
+    Error *local_err = NULL;
+
+    if (qio_task_propagate_error(task, &local_err)) {
+        goto out;
+    }
+
+    if (migrate_channel_requires_tls(ioc)) {
+        tioc = migration_tls_client_create(s, ioc, s->hostname, &local_err);
+        if (!tioc) {
+            goto out;
+        }
+        trace_postcopy_preempt_tls_handshake();
+        qio_channel_set_name(QIO_CHANNEL(tioc), "migration-tls-preempt");
+        qio_channel_tls_handshake(tioc, postcopy_preempt_tls_handshake,
+                                  s, NULL, NULL);
+        /* Setup the channel until TLS handshake finished */
+        return;
+    }
+
+out:
+    /* This handles both good and error cases */
+    postcopy_preempt_send_channel_done(s, ioc, local_err);
 }
 
 /* Returns 0 if channel established, -1 for error. */
diff --git a/migration/trace-events b/migration/trace-events
index 0e385c3a07..a34afe7b85 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -287,6 +287,7 @@ postcopy_request_shared_page(const char *sharer, const char *rb, uint64_t rb_off
 postcopy_request_shared_page_present(const char *sharer, const char *rb, uint64_t rb_offset) "%s already %s offset 0x%"PRIx64
 postcopy_wake_shared(uint64_t client_addr, const char *rb) "at 0x%"PRIx64" in %s"
 postcopy_page_req_del(void *addr, int count) "resolved page req %p total %d"
+postcopy_preempt_tls_handshake(void) ""
 postcopy_preempt_new_channel(void) ""
 postcopy_preempt_thread_entry(void) ""
 postcopy_preempt_thread_exit(void) ""
-- 
2.32.0


