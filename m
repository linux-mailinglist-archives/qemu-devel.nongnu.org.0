Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1BE56AB30
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:03:06 +0200 (CEST)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9WmH-0006d1-EX
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wew-0005xR-V2
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Weu-0001lV-Iw
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657220128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwUnbHjViPt/gSGud2YLDmF4j1h1MIToXoGJAjea+To=;
 b=cHtSnGFhShjvmB9ZWZ850hAWkWzcuIjZiNnDnut1CuJJrG6kZAjAueAukSprV38TRU0N5z
 N5kqHasGl7ov4wzgfqrMxDQyf6bb3W+Eop+CVqNQoQTXHFQnXx5L3DBDFk5+pXyn9/WGY/
 oM5VAo9OtrQ5+3+/KNE9V5NhzCCgHxU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-942nfO2FPIyE0AkMVMkmHw-1; Thu, 07 Jul 2022 14:55:21 -0400
X-MC-Unique: 942nfO2FPIyE0AkMVMkmHw-1
Received: by mail-qk1-f197.google.com with SMTP id
 t203-20020a3746d4000000b006af1d3e8068so18643733qka.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 11:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jwUnbHjViPt/gSGud2YLDmF4j1h1MIToXoGJAjea+To=;
 b=txFiITOqxfe4LOp58F4lJeM/JMJvU5dNbodmjhIpQONtRpdgfLiZwSpSJ23SbrS/jm
 EO5A8QbDa4CBX+Ob8rgBVx+it+JckwP2ngnF72KyrYvsY1Sg8xuW0rHy1qW4UbP1YMYy
 NHwXX2Yohtn8VMYQCtfSFpaGc0GEFaO3pYo6O0t/N25Pwp7eAux+mQ2stMS/XeqXnQKk
 MZItYKuQ7477NA3GM8Af0tAeLRsG6eutKoZJCf9mYxKZ7We4mCTZo4WO9F98p6csRlTM
 hIGRoaYdyihvvddsBuHW7+LvtaAKELdc788P95g+rj/eCgGYshct/UABrOYK0AaapIdi
 TERg==
X-Gm-Message-State: AJIora/IAFmHaZg95LfjhoBHTuQ202REY0qm7E9I9Tpr8QxxDOJZA0QO
 xlPUZXuYqIXwWulvQ9fQQgv2ag5cgk7F39krFUOeRuqB97PkM7IEQR/HsD/wgY1nk49b0nejbJG
 uLG9tzAbGxoZooVvYgVxR+VZtYKDPHTTAD5GgULbe5Wk29Un8uwBmMCGYS7x3+Wlg
X-Received: by 2002:a05:6214:4005:b0:472:be5a:810d with SMTP id
 kd5-20020a056214400500b00472be5a810dmr31684907qvb.36.1657220120770; 
 Thu, 07 Jul 2022 11:55:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tvd/wyeg2daJAjhF3RSZ0UhGWxypF7BNDl3ljR9gCkeLO6mIdUa8KgnZHBIboLRTq0TyQ3oA==
X-Received: by 2002:a05:6214:4005:b0:472:be5a:810d with SMTP id
 kd5-20020a056214400500b00472be5a810dmr31684878qvb.36.1657220120362; 
 Thu, 07 Jul 2022 11:55:20 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 b13-20020ac85bcd000000b00304ea0a86cesm29241229qtb.81.2022.07.07.11.55.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Jul 2022 11:55:19 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v9 09/14] migration: Enable TLS for preempt channel
Date: Thu,  7 Jul 2022 14:55:18 -0400
Message-Id: <20220707185518.27529-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707185342.26794-1-peterx@redhat.com>
References: <20220707185342.26794-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 57 ++++++++++++++++++++++++++++++++++------
 migration/trace-events   |  1 +
 2 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 70b21e9d51..b9a37ef255 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -36,6 +36,7 @@
 #include "socket.h"
 #include "qemu-file.h"
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
+    if (migrate_channel_requires_tls_upgrade(ioc)) {
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


