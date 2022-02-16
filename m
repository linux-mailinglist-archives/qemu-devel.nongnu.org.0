Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFEC4B80D8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:55:03 +0100 (CET)
Received: from localhost ([::1]:50518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEDN-0002Uv-Gs
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoQ-0004A3-HI
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoO-0006Fc-Pq
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Dc2Vi2zj/693dIJ2nS//TnSj/P3rpIaVxMb6s1Xx0U=;
 b=IfjbCz5Q7CHUPy3tczOoWrJYj4ldeXRuuC75joqprDdjHlJaJ22kW5P39P7NgdCng7QU3i
 mCnky8bZpc97thDLduNQr27iKxX/6GAn13DJr3JYH2v2dGV+L2QQotOKxoGqJUFPz1UVDC
 9icUbNSf6tdfIxsiLpy6PxyNy7RM7Gs=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-fu2_qw0COyuFjw1DujZzqA-1; Wed, 16 Feb 2022 01:29:10 -0500
X-MC-Unique: fu2_qw0COyuFjw1DujZzqA-1
Received: by mail-pj1-f72.google.com with SMTP id
 g19-20020a17090a579300b001b9d80f3714so938922pji.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Dc2Vi2zj/693dIJ2nS//TnSj/P3rpIaVxMb6s1Xx0U=;
 b=Pf5UI6YOZUufr0p7CNPWvNQeexkNWUAJ24jpEgEPtQQqK1PWplRDpdculiWHNvILz3
 UAgSuJ/YNJ/HlkuakcQRoKr6n3ilNq6mJWKQb3QCA7ZXeOmvz6Y6IKDoCwMHFCq5giqn
 0bx9A5uzkkMJciADgSNgCqZBpz6yaSic5RCAo33IulV5mxUh4DcblQV8ng/DLnuyWKWh
 ssFkNblUOYXukbCgY5VGzb9jG7Tv6m5o7Dip/DEYBUMgGnrDAj9zWO3GwKu1nZbDYKIE
 XxYq9RlPK0jBTkvr50jaYNagbZnFJTgDxgprlWp+NzoYbgfTU8hxfuocK9uUV4vO3G5i
 cQxw==
X-Gm-Message-State: AOAM532KJqKTe2iail47k8KoN9OWjsE+G5Hn/42h7qmPEMcR1+Eyu91U
 gLBzQqEZJRjN6XUyvNBpgR0AoOdEYZm15svKesGf+cmCqoAB5qpKZUDyBz4eQNx+Uruz7lo+Ywb
 +yehq2Mg5pShpdiXmLlvxQCRkgdkdbrdkIRLdzYGpb6/6nl5UxdkanVMaZZoRv81d
X-Received: by 2002:a17:902:9f96:b0:14f:1b7f:d5 with SMTP id
 g22-20020a1709029f9600b0014f1b7f00d5mr1439142plq.126.1644992948896; 
 Tue, 15 Feb 2022 22:29:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn7fuCz3WIYS+/waBLZ7Yr/451j0PJTgscnUQaZyZjZACXg1XBc1Qu+l8j5mVh4PxsmOLUOQ==
X-Received: by 2002:a17:902:9f96:b0:14f:1b7f:d5 with SMTP id
 g22-20020a1709029f9600b0014f1b7f00d5mr1439114plq.126.1644992948428; 
 Tue, 15 Feb 2022 22:29:08 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.29.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:29:08 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/20] migration: Add postcopy_thread_create()
Date: Wed, 16 Feb 2022 14:27:55 +0800
Message-Id: <20220216062809.57179-7-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Postcopy create threads. A common manner is we init a sem and use it to sync
with the thread.  Namely, we have fault_thread_sem and listen_thread_sem and
they're only used for this.

Make it a shared infrastructure so it's easier to create yet another thread.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.h    |  8 +++++---
 migration/postcopy-ram.c | 23 +++++++++++++++++------
 migration/postcopy-ram.h |  4 ++++
 migration/savevm.c       | 12 +++---------
 4 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 42c7395094..8445e1d14a 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -70,7 +70,11 @@ struct MigrationIncomingState {
     /* A hook to allow cleanup at the end of incoming migration */
     void *transport_data;
     void (*transport_cleanup)(void *data);
-
+    /*
+     * Used to sync thread creations.  Note that we can't create threads in
+     * parallel with this sem.
+     */
+    QemuSemaphore  thread_sync_sem;
     /*
      * Free at the start of the main state load, set as the main thread finishes
      * loading state.
@@ -83,13 +87,11 @@ struct MigrationIncomingState {
     size_t         largest_page_size;
     bool           have_fault_thread;
     QemuThread     fault_thread;
-    QemuSemaphore  fault_thread_sem;
     /* Set this when we want the fault thread to quit */
     bool           fault_thread_quit;
 
     bool           have_listen_thread;
     QemuThread     listen_thread;
-    QemuSemaphore  listen_thread_sem;
 
     /* For the kernel to send us notifications */
     int       userfault_fd;
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 315f784965..d3ec22e6de 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -77,6 +77,20 @@ int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp)
                                             &pnd);
 }
 
+/*
+ * NOTE: this routine is not thread safe, we can't call it concurrently. But it
+ * should be good enough for migration's purposes.
+ */
+void postcopy_thread_create(MigrationIncomingState *mis,
+                            QemuThread *thread, const char *name,
+                            void *(*fn)(void *), int joinable)
+{
+    qemu_sem_init(&mis->thread_sync_sem, 0);
+    qemu_thread_create(thread, name, fn, mis, joinable);
+    qemu_sem_wait(&mis->thread_sync_sem);
+    qemu_sem_destroy(&mis->thread_sync_sem);
+}
+
 /* Postcopy needs to detect accesses to pages that haven't yet been copied
  * across, and efficiently map new pages in, the techniques for doing this
  * are target OS specific.
@@ -901,7 +915,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
     trace_postcopy_ram_fault_thread_entry();
     rcu_register_thread();
     mis->last_rb = NULL; /* last RAMBlock we sent part of */
-    qemu_sem_post(&mis->fault_thread_sem);
+    qemu_sem_post(&mis->thread_sync_sem);
 
     struct pollfd *pfd;
     size_t pfd_len = 2 + mis->postcopy_remote_fds->len;
@@ -1172,11 +1186,8 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
         return -1;
     }
 
-    qemu_sem_init(&mis->fault_thread_sem, 0);
-    qemu_thread_create(&mis->fault_thread, "postcopy/fault",
-                       postcopy_ram_fault_thread, mis, QEMU_THREAD_JOINABLE);
-    qemu_sem_wait(&mis->fault_thread_sem);
-    qemu_sem_destroy(&mis->fault_thread_sem);
+    postcopy_thread_create(mis, &mis->fault_thread, "postcopy/fault",
+                           postcopy_ram_fault_thread, QEMU_THREAD_JOINABLE);
     mis->have_fault_thread = true;
 
     /* Mark so that we get notified of accesses to unwritten areas */
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6d2b3cf124..07684c0e1d 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -135,6 +135,10 @@ void postcopy_remove_notifier(NotifierWithReturn *n);
 /* Call the notifier list set by postcopy_add_start_notifier */
 int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp);
 
+void postcopy_thread_create(MigrationIncomingState *mis,
+                            QemuThread *thread, const char *name,
+                            void *(*fn)(void *), int joinable);
+
 struct PostCopyFD;
 
 /* ufd is a pointer to the struct uffd_msg *TODO: more Portable! */
diff --git a/migration/savevm.c b/migration/savevm.c
index 0ccd7e5e3f..967ff80547 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1863,7 +1863,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
 
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                                    MIGRATION_STATUS_POSTCOPY_ACTIVE);
-    qemu_sem_post(&mis->listen_thread_sem);
+    qemu_sem_post(&mis->thread_sync_sem);
     trace_postcopy_ram_listen_thread_start();
 
     rcu_register_thread();
@@ -1988,14 +1988,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
     }
 
     mis->have_listen_thread = true;
-    /* Start up the listening thread and wait for it to signal ready */
-    qemu_sem_init(&mis->listen_thread_sem, 0);
-    qemu_thread_create(&mis->listen_thread, "postcopy/listen",
-                       postcopy_ram_listen_thread, NULL,
-                       QEMU_THREAD_DETACHED);
-    qemu_sem_wait(&mis->listen_thread_sem);
-    qemu_sem_destroy(&mis->listen_thread_sem);
-
+    postcopy_thread_create(mis, &mis->listen_thread, "postcopy/listen",
+                           postcopy_ram_listen_thread, QEMU_THREAD_DETACHED);
     trace_loadvm_postcopy_handle_listen("return");
 
     return 0;
-- 
2.32.0


