Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D4151ADCB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 21:28:49 +0200 (CEST)
Received: from localhost ([::1]:57584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmKg3-00030e-V3
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 15:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nmKXs-0006O3-5u
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:20:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nmKXp-0005BZ-NF
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651692016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j41EFxZl48K8PzXKwjw+VPUyqLUUbXh0uI/r17CYUNI=;
 b=YT9MXxiqHM/YfbNfR979mqdqH2SXWtZJX9RR+dkfl3/CiXyGBXlbAUDqaH+XSxrlNeQLaZ
 ZpDbtprBQFJXx0eOpnKCUIzUat7j3K0uatKXLXL71SgmfdG3yJgqQlnxs0j+GtmdEqXSC9
 JgImA/6mnPl2PANK0apZppaWC2kO4S0=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-rCNf2OHOMD-DNWQpz5yWmA-1; Wed, 04 May 2022 15:20:15 -0400
X-MC-Unique: rCNf2OHOMD-DNWQpz5yWmA-1
Received: by mail-ua1-f71.google.com with SMTP id
 r4-20020ab06604000000b00360317232f6so934999uam.6
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 12:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j41EFxZl48K8PzXKwjw+VPUyqLUUbXh0uI/r17CYUNI=;
 b=jCqsSmB9r+5i0goeo/b9mjuV2dEPTS6avsPdNoShSkUkcsUrDOelyKX0XpDCE3sagB
 Xa/2iGOnNoCTYwfEEWLNIV1E+By4/hykj4pV9R7kNnKzAsN0+nTXYrL/R/CwXompIjvs
 KaPjHMIP+UyjsbzsYdFR2StH1ptWa27oXl77xPFzUqllMvNHchcUNTyrHQflTwV409mR
 uvqez5QV2hNzVCFbRClSkcytdRdVhw+M0fgSULUxm1AtU72ihCWLCwWJUnlcflFgO6Ch
 CbH/AkHmbQqXvTlrxBMpjWovSR74dvNDOu1/Z3eH7xew5ECtWJSvzpUttT0pzN7HtGeW
 5eiQ==
X-Gm-Message-State: AOAM531a6Q4RrIFBhMvfrFV6uLxQyIUjuimORSGMuKhK0nA4h7qWOo9u
 Y4Kp5ubCIy7mOjsIaegAuSSmxUONyJjhNCmom/Nz/zR8BqQnQBySahhiPK/ar3ZBihr78ZIFr6O
 Slaj5QPyeo1FBZxw=
X-Received: by 2002:a67:fd76:0:b0:32c:c03f:284 with SMTP id
 h22-20020a67fd76000000b0032cc03f0284mr6934578vsa.9.1651692014762; 
 Wed, 04 May 2022 12:20:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh1iN2lT+v20n1pvy1K4324VTS63ihv3qfTgvaFYkG9Z7vDl+tx33aTn89ucaVgQSjoHEqkA==
X-Received: by 2002:a67:fd76:0:b0:32c:c03f:284 with SMTP id
 h22-20020a67fd76000000b0032cc03f0284mr6934570vsa.9.1651692014549; 
 Wed, 04 May 2022 12:20:14 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:1312:73ed:3343:f316:7ef5])
 by smtp.gmail.com with ESMTPSA id
 o80-20020a1fa553000000b0034e6f1fd04esm1647302vke.24.2022.05.04.12.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 12:20:14 -0700 (PDT)
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
Subject: [PATCH v11 7/7] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Date: Wed,  4 May 2022 16:18:36 -0300
Message-Id: <20220504191835.791580-8-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504191835.791580-1-leobras@redhat.com>
References: <20220504191835.791580-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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


