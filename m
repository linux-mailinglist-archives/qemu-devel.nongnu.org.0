Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCD152AC66
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:03:52 +0200 (CEST)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3Q2-0003J9-Or
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 16:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KO-0003FV-4B
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KK-0002Ls-Sp
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97LnQX+iWnm8/SAWY3ZLNjNkHl1aDQ7WHKhz4ajwKNo=;
 b=Pm0z5kJFhbphRskaItd1f3Bx2DEhhVflNlAHc2uLJv3uRt4RgEJ1UNZWNMgyTOPn1tmdgj
 2TOFcPBoxUdqigWvyMbMZ+tqDIG/cjr0sfsOuFavKYe3ZxRohux3qZ604RDS5se5hPJw8c
 sOAVWR0Z9rQOzbqFofnAyJUlcDwsh0A=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-sLtcm7rTMse62wgpc4QKQQ-1; Tue, 17 May 2022 15:57:50 -0400
X-MC-Unique: sLtcm7rTMse62wgpc4QKQQ-1
Received: by mail-io1-f70.google.com with SMTP id
 k2-20020a0566022d8200b0065ad142f8c1so13082199iow.12
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97LnQX+iWnm8/SAWY3ZLNjNkHl1aDQ7WHKhz4ajwKNo=;
 b=tSxruCf/aLUoWZHli3Uc4XiFfoR7BrYsUTc1btRiCjqlDS8IK9RcUr3c299PbTehpa
 kuCIaNtyd1Is9eK4q5zv/lG8OkGIbLgK+61LZA+k59aQBkqsEGFZb3fdvImanMXsrM/8
 UKoqf36hD6RG7e6p1iKYP2QR3hcMdU3jkDSvpCG1QGc3S86ztmSsfN+F8m7splhFebgg
 4zx+2oel0awbNEzbOczqmGad674x+sYv4ZDSEqB/l7zthkMR519BCdLf5XifQCBxUcy2
 V8OUFmB41+agAqf0uqOTN7dBG/2OIuEYTDlbhEvAYwlbPQsriwMvlk71BJZ+SXvlmqIn
 wRPA==
X-Gm-Message-State: AOAM532Yef4quGo7OajpapmiDOwoBD9cw8idL8co/Q1sQSj7NAMTCXxB
 eUjD0GLFspzaN0eSShdvKtzCu5NI+AT9PjqtEEYse2FYc67540WOIwtMq++sc6nkNPklCJt3k4R
 sIRNs3LAES5kuF7vR4bKnrrwBsLQrBGuyXjkUMue19B8CczFeqobgBflX6iioohE7
X-Received: by 2002:a05:6e02:68c:b0:2d1:188f:ec74 with SMTP id
 o12-20020a056e02068c00b002d1188fec74mr7198511ils.157.1652817469687; 
 Tue, 17 May 2022 12:57:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMAq/GTfBWwByIr1/l7lQRlu19i8XpsDzXRhsy2Sr+vwlxF32QendSPYmIZsqOkguzzP1N8w==
X-Received: by 2002:a05:6e02:68c:b0:2d1:188f:ec74 with SMTP id
 o12-20020a056e02068c00b002d1188fec74mr7198493ils.157.1652817469333; 
 Tue, 17 May 2022 12:57:49 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020b4f00b002d125725709sm59575ilu.28.2022.05.17.12.57.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 May 2022 12:57:48 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 09/13] migration: Enable TLS for preempt channel
Date: Tue, 17 May 2022 15:57:26 -0400
Message-Id: <20220517195730.32312-10-peterx@redhat.com>
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


