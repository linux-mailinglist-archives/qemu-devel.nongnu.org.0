Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D8533373
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:23:20 +0200 (CEST)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntcvv-0000VC-9G
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclJ-0001Wf-CH
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclH-0005iK-K2
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653430339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACpbji9CEUbV/4+bJ4n9VCUjNxHAs1mA9NJVTM7OOOc=;
 b=RfTN3iBivOn5Vf49ukNAiQLUpiKKptWE43KH5K4zh3aNy6mgWGyjSKrV+dbIvri/Kjzvzy
 WvvmhpIBdgE3UD89p9Ttt2zDbQyovN7W4WYB+7asmgn2gUxR0rAtkGBvilBDFeXVepkTDb
 Dq0S+O6ImcEsiRp+efddDALPxiBMBb4=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-fAk4f7SfN4OtefmjdYLdTg-1; Tue, 24 May 2022 18:12:10 -0400
X-MC-Unique: fAk4f7SfN4OtefmjdYLdTg-1
Received: by mail-io1-f69.google.com with SMTP id
 i189-20020a6bb8c6000000b0065e475f5ca9so9558087iof.15
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ACpbji9CEUbV/4+bJ4n9VCUjNxHAs1mA9NJVTM7OOOc=;
 b=YxsTZtzHFwXIQ68FhH6+XYm1ccvFYXWM1+vmgGjLg+1BEWfdFk2NGeuVnxu9elCAFY
 BT+ZOj9vS9VzxIhtcTsrbO5RmlkX8Q3xD968hO4NzR58v9CUoaFDsLxi1wm4YV/SHikn
 zGjimTMCii/gHrK5+vFjhZBUCMRvWjWlTrJHp7xYrhz44RgzDnZT5UA0GDrc/qPH+w8z
 cs7tqAVpfPlwhCldj2kWg0b/L3v/skZXUTPBkxqUmGDFf0xN0g/72cmE5cT3oLRSaj0r
 lixWkSBcwSGBRwb1Qy2bBErwt2nM5mlz+KJdSDY4fHTi8eEpqr1pKsxPrN3U5IM7E3hx
 AMIA==
X-Gm-Message-State: AOAM531Tn2L1CJY+neLtAhHTn8nHHWvpiuWq1S2uFmta+cgI2tP3cyWO
 zMv5kaq90VVDe3+8HRgU1I8HTi2gUmh0iBB1ZM/rTpDd+dhvy7QPvJMfsLEF/XgjAIDeg/BO7Bf
 YLRezrT0wTiSqKMh3qNcqdEZWNURvOUDqizE60wZX7obHsZ+604dPXhGd7qHpgVMg
X-Received: by 2002:a05:6638:1694:b0:32e:a734:d63 with SMTP id
 f20-20020a056638169400b0032ea7340d63mr10111040jat.242.1653430328912; 
 Tue, 24 May 2022 15:12:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEn5RVL074DX0GpoPgxLIM/InGG26C6/8OQhfoxgEgfbhSMJKei6o1S7cwMw5gjPt0DaSTbA==
X-Received: by 2002:a05:6638:1694:b0:32e:a734:d63 with SMTP id
 f20-20020a056638169400b0032ea7340d63mr10111025jat.242.1653430328622; 
 Tue, 24 May 2022 15:12:08 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 6-20020a021d06000000b0032e2d3cc08csm3738045jaj.132.2022.05.24.15.12.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 May 2022 15:12:08 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com
Subject: [PATCH v7 09/14] migration: Enable TLS for preempt channel
Date: Tue, 24 May 2022 18:11:46 -0400
Message-Id: <20220524221151.18225-10-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524221151.18225-1-peterx@redhat.com>
References: <20220524221151.18225-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 57 ++++++++++++++++++++++++++++++++++------
 migration/trace-events   |  1 +
 2 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 1bb603051a..54f05fc2fb 100644
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


