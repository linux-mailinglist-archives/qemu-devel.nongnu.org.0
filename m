Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F94351E370
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:06:28 +0200 (CEST)
Received: from localhost ([::1]:33834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn9pz-0001Dx-Cy
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9iq-0006Hi-SE
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:59:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9ip-0006lx-9D
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651888742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j41EFxZl48K8PzXKwjw+VPUyqLUUbXh0uI/r17CYUNI=;
 b=PEPqO3pLkQ1TdhO7Ogz8kJZXgj24nQQAEf7otQI7xJMvpi4Un7grHov7cTUfMZANOksMOO
 8IwzNCJFK0fxd2s8sljQwzIbnMUvC0medGK4s+OeOk1HjUhLFEA9hhGHlzocROe0pqcCPg
 iYoiheRCjd2Eas+mbYIqkoTkPhdtw9Q=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-RYVTe6PENpu5Wn9GP1LYTQ-1; Fri, 06 May 2022 21:58:54 -0400
X-MC-Unique: RYVTe6PENpu5Wn9GP1LYTQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 c20-20020a056830349400b0060659610972so2050541otu.3
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 18:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j41EFxZl48K8PzXKwjw+VPUyqLUUbXh0uI/r17CYUNI=;
 b=YfjvsG3w8H1lOIXb9aUDZs/AcuCk5W4e9HUOyStGy3YYKRxJcZIbA+GPGlQcvu2Nq7
 C749uC+YUp3kxtDjjfxKQDSxV5ILlPxbZaiNs3PGJtxzon+Hz3yr9OKSZ4BmGlLU9Sln
 s2cgcIM/A2tgE2Nq4d5OvP9l9uZw2sFWGtzbama/nVv8B2uleOtMKKRJPymG8cBVvLXn
 K/tz/kiM/k8yX24jRsca0gZoVxTp43ZLKtdLQzjjuAnQNvNd08oRR4m5CNCQ4vzF1mpW
 yPEo2XwK+5QJUqTJtWfqUeOkaMYMXlMaZaiML4ucinVRHcjpIMYtG0FNT7O5Oe7nrsNv
 eSSQ==
X-Gm-Message-State: AOAM531Tw14Y5wE9vkEMw0LPM8FuEfFbuJn73OkfPjHPGTt0mXes60bD
 lnYeGtF4ZkhnmSJ0hUarBSwfcnAhzrUC8pxYi5UpSmAp5DazghyFJm2kKhsvHeAG1wEauvZeDV1
 gDdocZ3IIoX3yvg8=
X-Received: by 2002:a05:6870:5707:b0:de:2cb8:7759 with SMTP id
 k7-20020a056870570700b000de2cb87759mr5785838oap.20.1651888733444; 
 Fri, 06 May 2022 18:58:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY0PPqFxy+3E3QSqrMkpF7aaFWfuJFWlKT3Ol7IzEtiTtjzhXdhfJt0m08lK1dLk0T7Fy0MQ==
X-Received: by 2002:a05:6870:5707:b0:de:2cb8:7759 with SMTP id
 k7-20020a056870570700b000de2cb87759mr5785834oap.20.1651888733242; 
 Fri, 06 May 2022 18:58:53 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:55e:b3e6:9ebe:4b75:fe72])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a056830141200b0060603221281sm2218124otp.81.2022.05.06.18.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 18:58:52 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v12 7/7] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Date: Fri,  6 May 2022 22:57:59 -0300
Message-Id: <20220507015759.840466-8-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220507015759.840466-1-leobras@redhat.com>
References: <20220507015759.840466-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Implement zero copy send on nocomp_send_write(), by making use of QIOChannel
writev + flags & flush interface.

Change multifd_send_sync_main() so flush_zero_copy() can be called
after each iteration in order to make sure all dirty pages are sent before
a new iteration is started. It will also flush at the beginning and at the
end of migration.

Also make it return -1 if flush_zero_copy() fails, in order to cancel
the migration process, and avoid resuming the guest in the target host
without receiving all current RAM.

This will work fine on RAM migration because the RAM pages are not usually freed,
and there is no problem on changing the pages content between writev_zero_copy() and
the actual sending of the buffer, because this change will dirty the page and
cause it to be re-sent on a next iteration anyway.

A lot of locked memory may be needed in order to use multifd migration
with zero-copy enabled, so disabling the feature should be necessary for
low-privileged users trying to perform multifd migrations.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/multifd.h   |  2 ++
 migration/migration.c | 11 ++++++++++-
 migration/multifd.c   | 37 +++++++++++++++++++++++++++++++++++--
 migration/socket.c    |  5 +++--
 4 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index bcf5992945..4d8d89e5e5 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -92,6 +92,8 @@ typedef struct {
     uint32_t packet_len;
     /* pointer to the packet */
     MultiFDPacket_t *packet;
+    /* multifd flags for sending ram */
+    int write_flags;
     /* multifd flags for each packet */
     uint32_t flags;
     /* size of the next packet that contains pages */
diff --git a/migration/migration.c b/migration/migration.c
index 4b6df2eb5e..31739b2af9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1497,7 +1497,16 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
         return false;
     }
-
+#ifdef CONFIG_LINUX
+    if (params->zero_copy_send &&
+        (!migrate_use_multifd() ||
+         params->multifd_compression != MULTIFD_COMPRESSION_NONE ||
+         (params->tls_creds && *params->tls_creds))) {
+        error_setg(errp,
+                   "Zero copy only available for non-compressed non-TLS multifd migration");
+        return false;
+    }
+#endif
     return true;
 }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 2541cd2322..9282ab6aa4 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -569,6 +569,7 @@ void multifd_save_cleanup(void)
 int multifd_send_sync_main(QEMUFile *f)
 {
     int i;
+    bool flush_zero_copy;
 
     if (!migrate_use_multifd()) {
         return 0;
@@ -579,6 +580,20 @@ int multifd_send_sync_main(QEMUFile *f)
             return -1;
         }
     }
+
+    /*
+     * When using zero-copy, it's necessary to flush the pages before any of
+     * the pages can be sent again, so we'll make sure the new version of the
+     * pages will always arrive _later_ than the old pages.
+     *
+     * Currently we achieve this by flushing the zero-page requested writes
+     * per ram iteration, but in the future we could potentially optimize it
+     * to be less frequent, e.g. only after we finished one whole scanning of
+     * all the dirty bitmaps.
+     */
+
+    flush_zero_copy = migrate_use_zero_copy_send();
+
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
@@ -600,6 +615,17 @@ int multifd_send_sync_main(QEMUFile *f)
         ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
+
+        if (flush_zero_copy && p->c) {
+            int ret;
+            Error *err = NULL;
+
+            ret = qio_channel_flush(p->c, &err);
+            if (ret < 0) {
+                error_report_err(err);
+                return -1;
+            }
+        }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
@@ -684,8 +710,8 @@ static void *multifd_send_thread(void *opaque)
                 p->iov[0].iov_base = p->packet;
             }
 
-            ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
-                                         &local_err);
+            ret = qio_channel_writev_full_all(p->c, p->iov, p->iovs_num, NULL,
+                                              0, p->write_flags, &local_err);
             if (ret != 0) {
                 break;
             }
@@ -913,6 +939,13 @@ int multifd_save_setup(Error **errp)
         /* We need one extra place for the packet header */
         p->iov = g_new0(struct iovec, page_count + 1);
         p->normal = g_new0(ram_addr_t, page_count);
+
+        if (migrate_use_zero_copy_send()) {
+            p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
+        } else {
+            p->write_flags = 0;
+        }
+
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
diff --git a/migration/socket.c b/migration/socket.c
index 3754d8f72c..4fd5e85f50 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -79,8 +79,9 @@ static void socket_outgoing_migration(QIOTask *task,
 
     trace_migration_socket_outgoing_connected(data->hostname);
 
-    if (migrate_use_zero_copy_send()) {
-        error_setg(&err, "Zero copy send not available in migration");
+    if (migrate_use_zero_copy_send() &&
+        !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
+        error_setg(&err, "Zero copy send feature not detected in host kernel");
     }
 
 out:
-- 
2.36.0


