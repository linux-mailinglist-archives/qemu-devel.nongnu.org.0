Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3663D2BC7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:14:40 +0200 (CEST)
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6dDT-0002Wj-6n
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cyD-00055G-Pg
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cy9-00064n-AF
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psIdSZ42TG6zIOWJSN4HC5NZuEOzx+F89j4lZhOXZEk=;
 b=TmBFRX0BSWPYvCyY95dpHOuMdfDCFibysBfh3Udku4ARNVUenRb6Qmxz6nWKpmAGBpKOJo
 wo5HNG87NjRBSryaq7Sfzx1tUkdvyfZCh06s5+mau/mtijyPNI4CjjiBa3IVZ7IJ5Q1wRs
 T88j7WFVecIrkpmmzp1EzYtRdaAC40o=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-WZ26pYvpNfak9Sm10mDh4w-1; Thu, 22 Jul 2021 13:58:47 -0400
X-MC-Unique: WZ26pYvpNfak9Sm10mDh4w-1
Received: by mail-qt1-f198.google.com with SMTP id
 j10-20020ac8440a0000b02902647b518455so3821481qtn.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=psIdSZ42TG6zIOWJSN4HC5NZuEOzx+F89j4lZhOXZEk=;
 b=AuRllzS4ETVksFsJ7sRw5KVg1wOHddSAR/AYCEWRzgFkXfP+kVpp3p4bc4k6encGJJ
 I0vlPBwFjVKTNB0/uhqNyPcgodMgD7t4syOm1RYmG9U5QOQn0PRRJZumMEm0Lq0f5ndi
 a2dCri7Z3Cdr/9tp0NJBD9KmS0qijoCC9xihctiACAGEinvkcACrau1cmBoTyu+fWzN7
 Qttpzq4dXgFuQrlsJhkdLqxRdmBy3681NItlaS4LWPjW5UWbDIkxTnPpYBLZfb3cAeus
 KQ0TTwBArGwd44UFl36Piw60qF9JYlvXP9yRNmOp2JBfM4OJ410SZmcckUBwBisT+F/c
 9+4g==
X-Gm-Message-State: AOAM533r4/jGNzzN8xuvwPbov9+ADQD+1WB4huHUu+f6nW1Rg4rOcal1
 Y5o0RU4i9snnbidFLaJuCwNeuQstHvcVkUQgCGRjaBs+Mxh4sYeZ1rh5pocFLODHYgXv5DLypyg
 qPG0ZLoy7MS+XS8p4Cl5Yj9s7G3gXoBz/VryJDhaWb4HfH0B7TSRf8bidFGaf9cbM
X-Received: by 2002:a05:622a:491:: with SMTP id
 p17mr768458qtx.107.1626976726826; 
 Thu, 22 Jul 2021 10:58:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAyECFT5+u102yYRUrAeI+TrUes/gX4O1xUA9LSbKnyYmTKMIZGJ2Guwk2AUOVdxq3aMA4+g==
X-Received: by 2002:a05:622a:491:: with SMTP id
 p17mr768425qtx.107.1626976726521; 
 Thu, 22 Jul 2021 10:58:46 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j20sm10418018qtq.14.2021.07.22.10.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:58:45 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] migration: Fix missing join() of rp_thread
Date: Thu, 22 Jul 2021 13:58:37 -0400
Message-Id: <20210722175841.938739-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722175841.938739-1-peterx@redhat.com>
References: <20210722175841.938739-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's possible that the migration thread skip the join() of the rp_thread in
below race and crash on src right at finishing migration:

       migration_thread                     rp_thread
       ----------------                     ---------
    migration_completion()
                                        (before rp_thread quits)
                                        from_dst_file=NULL
                                        [thread got scheduled out]
      s->rp_state.from_dst_file==NULL
        (skip join() of rp_thread)
    migrate_fd_cleanup()
      qemu_fclose(s->to_dst_file)
      yank_unregister_instance()
        assert(yank_find_entry())  <------- crash

It could mostly happen with postcopy, but that shouldn't be required, e.g., I
think it could also trigger with MIGRATION_CAPABILITY_RETURN_PATH set.

It's suspected that above race could be the root cause of a recent (but rare)
migration-test break reported by either Dave or PMM:

https://lore.kernel.org/qemu-devel/YPamXAHwan%2FPPXLf@work-vm/

The issue is: from_dst_file is reset in the rp_thread, so if the thread reset
it to NULL fast enough then the migration thread will assume there's no
rp_thread at all.

This could potentially cause more severe issue (e.g. crash) after the yank code.

Fix it by using a boolean to keep "whether we've created rp_thread".

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 4 +++-
 migration/migration.h | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2d306582eb..21b94f75a3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2867,6 +2867,7 @@ static int open_return_path_on_source(MigrationState *ms,
 
     qemu_thread_create(&ms->rp_state.rp_thread, "return path",
                        source_return_path_thread, ms, QEMU_THREAD_JOINABLE);
+    ms->rp_state.rp_thread_created = true;
 
     trace_open_return_path_on_source_continue();
 
@@ -2891,6 +2892,7 @@ static int await_return_path_close_on_source(MigrationState *ms)
     }
     trace_await_return_path_close_on_source_joining();
     qemu_thread_join(&ms->rp_state.rp_thread);
+    ms->rp_state.rp_thread_created = false;
     trace_await_return_path_close_on_source_close();
     return ms->rp_state.error;
 }
@@ -3170,7 +3172,7 @@ static void migration_completion(MigrationState *s)
      * it will wait for the destination to send it's status in
      * a SHUT command).
      */
-    if (s->rp_state.from_dst_file) {
+    if (s->rp_state.rp_thread_created) {
         int rp_error;
         trace_migration_return_path_end_before();
         rp_error = await_return_path_close_on_source(s);
diff --git a/migration/migration.h b/migration/migration.h
index 2ebb740dfa..c302879fad 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -195,6 +195,13 @@ struct MigrationState {
         QEMUFile     *from_dst_file;
         QemuThread    rp_thread;
         bool          error;
+        /*
+         * We can also check non-zero of rp_thread, but there's no "official"
+         * way to do this, so this bool makes it slightly more elegant.
+         * Checking from_dst_file for this is racy because from_dst_file will
+         * be cleared in the rp_thread!
+         */
+        bool          rp_thread_created;
         QemuSemaphore rp_sem;
     } rp_state;
 
-- 
2.31.1


