Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CB23D2BCD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:17:49 +0200 (CEST)
Received: from localhost ([::1]:33486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6dGW-0006vl-M8
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cyF-0005CL-Gg
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:58:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cyB-00066F-0s
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d/YJ+I59XhsY2Uttqc/MajgUDnI5kxf+zGYbKg5ksfU=;
 b=cq5s2e27/8+ORjY1ZAbg/peoi+OWI/fNemqriEvG1brZaKUsmIWWDTG3D1nc30Xpm+A3Ut
 xaZMJYiQcg3Bx7tnIw9Zyqt7HO7pt6HncZ5gppbASImR+2xiaEHUase+cnGjLVA572JcUH
 XBTuMm6eUno9TyG/SYJT1iGrmIYVtwE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-_PL1Src3P2i4olC3Sf_J7A-1; Thu, 22 Jul 2021 13:58:49 -0400
X-MC-Unique: _PL1Src3P2i4olC3Sf_J7A-1
Received: by mail-qk1-f198.google.com with SMTP id
 bk12-20020a05620a1a0cb02903b899a4309cso4680387qkb.14
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/YJ+I59XhsY2Uttqc/MajgUDnI5kxf+zGYbKg5ksfU=;
 b=lMyij/b7F0y1ImV7FwThwIE5WBO7PHI64lnEnXkXIPEHrBZ9xnv8QXtiMMNIaaA3NY
 WVnLkUOHWI9qNoWx1mfjMcWCr6t3kMJ9jM1wXEh2zzxHQ/zp3Qfp7jOlmojOVijR8ME2
 ANJPBfd7SEHK4f9Cbdnc0SsT32BGPKuqYhin673nxS949DkRDd49vxgh/Tk0RqVnyZft
 /l0RWqnLukEvy1HBzUHTe1igjXksy0cLrJdSwxdgq/iu0dbx9dgwpdXSnFKWbjQOd+XC
 TKIh8KxyDUElK1CJk3SpylRjfYmbEXLxDsaOGVrLUC3YRIaJwmbVkb8CkCjHffx2lbhY
 07xQ==
X-Gm-Message-State: AOAM531aDVR99RmllgRCjzFl9ZQ5lBcqvqD89oFnJnIHGAjfESgp1DHJ
 6d3PTYTpudcbt21eynxEZhinE1YVQ9dsYjmYqGZqosRe63C4Y2xJPmt2nFNneLJ++v0/hz3LuII
 vNOcUVxn78s0kmufnhgREkrJa3OlInpsOryBevuqkmSp45pASXysoawYAE+IxjcOO
X-Received: by 2002:a05:620a:c9b:: with SMTP id
 q27mr840496qki.131.1626976728630; 
 Thu, 22 Jul 2021 10:58:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0HreYA7CoBJQHo2dYJA2hzujLds+gTNSygqj7keixrYreZYrGpJRDvTDf7G+ZkuKwcLIeXg==
X-Received: by 2002:a05:620a:c9b:: with SMTP id
 q27mr840463qki.131.1626976728330; 
 Thu, 22 Jul 2021 10:58:48 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j20sm10418018qtq.14.2021.07.22.10.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:58:47 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] migration: Make from_dst_file accesses thread-safe
Date: Thu, 22 Jul 2021 13:58:38 -0400
Message-Id: <20210722175841.938739-3-peterx@redhat.com>
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

Accessing from_dst_file is potentially racy in current code base like below:

  if (s->from_dst_file)
    do_something(s->from_dst_file);

Because from_dst_file can be reset right after the check in another
thread (rp_thread).  One example is migrate_fd_cancel().

Use the same qemu_file_lock to protect it too, just like to_dst_file.

When it's safe to access without lock, comment it.

There's one special reference in migration_thread() that can be replaced by
the newly introduced rp_thread_created flag.

Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 39 +++++++++++++++++++++++++++++----------
 migration/migration.h |  8 +++++---
 migration/ram.c       |  1 +
 3 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 21b94f75a3..b2c48b7e17 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1879,9 +1879,11 @@ static void migrate_fd_cancel(MigrationState *s)
     QEMUFile *f = migrate_get_current()->to_dst_file;
     trace_migrate_fd_cancel();
 
-    if (s->rp_state.from_dst_file) {
-        /* shutdown the rp socket, so causing the rp thread to shutdown */
-        qemu_file_shutdown(s->rp_state.from_dst_file);
+    WITH_QEMU_LOCK_GUARD(&s->qemu_file_lock) {
+        if (s->rp_state.from_dst_file) {
+            /* shutdown the rp socket, so causing the rp thread to shutdown */
+            qemu_file_shutdown(s->rp_state.from_dst_file);
+        }
     }
 
     do {
@@ -2686,6 +2688,23 @@ static int migrate_handle_rp_resume_ack(MigrationState *s, uint32_t value)
     return 0;
 }
 
+/* Release ms->rp_state.from_dst_file in a safe way */
+static void migration_release_from_dst_file(MigrationState *ms)
+{
+    QEMUFile *file;
+
+    WITH_QEMU_LOCK_GUARD(&s->qemu_file_lock) {
+        /*
+         * Reset the from_dst_file pointer first before releasing it, as we
+         * can't block within lock section
+         */
+        file = ms->rp_state.from_dst_file;
+        ms->rp_state.from_dst_file = NULL;
+    }
+
+    qemu_fclose(file);
+}
+
 /*
  * Handles messages sent on the return path towards the source VM
  *
@@ -2827,11 +2846,13 @@ out:
              * Maybe there is something we can do: it looks like a
              * network down issue, and we pause for a recovery.
              */
-            qemu_fclose(rp);
-            ms->rp_state.from_dst_file = NULL;
+            migration_release_from_dst_file(ms);
             rp = NULL;
             if (postcopy_pause_return_path_thread(ms)) {
-                /* Reload rp, reset the rest */
+                /*
+                 * Reload rp, reset the rest.  Referencing it is safe since
+                 * it's reset only by us above, or when migration completes
+                 */
                 rp = ms->rp_state.from_dst_file;
                 ms->rp_state.error = false;
                 goto retry;
@@ -2843,8 +2864,7 @@ out:
     }
 
     trace_source_return_path_thread_end();
-    ms->rp_state.from_dst_file = NULL;
-    qemu_fclose(rp);
+    migration_release_from_dst_file(ms);
     rcu_unregister_thread();
     return NULL;
 }
@@ -2852,7 +2872,6 @@ out:
 static int open_return_path_on_source(MigrationState *ms,
                                       bool create_thread)
 {
-
     ms->rp_state.from_dst_file = qemu_file_get_return_path(ms->to_dst_file);
     if (!ms->rp_state.from_dst_file) {
         return -1;
@@ -3746,7 +3765,7 @@ static void *migration_thread(void *opaque)
      * If we opened the return path, we need to make sure dst has it
      * opened as well.
      */
-    if (s->rp_state.from_dst_file) {
+    if (s->rp_state.rp_thread_created) {
         /* Now tell the dest that it should open its end so it can reply */
         qemu_savevm_send_open_return_path(s->to_dst_file);
 
diff --git a/migration/migration.h b/migration/migration.h
index c302879fad..7a5aa8c2fd 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -154,12 +154,13 @@ struct MigrationState {
     QemuThread thread;
     QEMUBH *vm_start_bh;
     QEMUBH *cleanup_bh;
+    /* Protected by qemu_file_lock */
     QEMUFile *to_dst_file;
     QIOChannelBuffer *bioc;
     /*
-     * Protects to_dst_file pointer.  We need to make sure we won't
-     * yield or hang during the critical section, since this lock will
-     * be used in OOB command handler.
+     * Protects to_dst_file/from_dst_file pointers.  We need to make sure we
+     * won't yield or hang during the critical section, since this lock will be
+     * used in OOB command handler.
      */
     QemuMutex qemu_file_lock;
 
@@ -192,6 +193,7 @@ struct MigrationState {
 
     /* State related to return path */
     struct {
+        /* Protected by qemu_file_lock */
         QEMUFile     *from_dst_file;
         QemuThread    rp_thread;
         bool          error;
diff --git a/migration/ram.c b/migration/ram.c
index b5fc454b2f..f728f5072f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4012,6 +4012,7 @@ static void ram_dirty_bitmap_reload_notify(MigrationState *s)
 int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
 {
     int ret = -EINVAL;
+    /* from_dst_file is always valid because we're within rp_thread */
     QEMUFile *file = s->rp_state.from_dst_file;
     unsigned long *le_bitmap, nbits = block->used_length >> TARGET_PAGE_BITS;
     uint64_t local_size = DIV_ROUND_UP(nbits, 8);
-- 
2.31.1


