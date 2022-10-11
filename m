Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3FA5FBDC2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:18:55 +0200 (CEST)
Received: from localhost ([::1]:57098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNaQ-000519-Ga
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEd-0001p9-NC
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEb-0003XH-7r
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VauCSCaXVpy+H2PmbvFmd+mT5AO5oyp8sr/leFDlpGk=;
 b=JZ4ix8RWuLndKkgSlqG70e3siSQPAPLTYlGWI1iPe4OnmMaWLJdrsPLw8Swv59cl6ERSIf
 97Pz1F85mV8usTKxzxwbNmSMfgv+ags1ixGhNXi9NUUWpS4YACa1+CZAXgFZZSrd85ekYv
 KXB2W2S/lNkol59D0mI+FWvmL7B+ZOU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-3yB7iMe9P6uXYBd7jyj3UQ-1; Tue, 11 Oct 2022 17:56:19 -0400
X-MC-Unique: 3yB7iMe9P6uXYBd7jyj3UQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 bs30-20020a05620a471e00b006ed2a84071bso5024789qkb.0
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VauCSCaXVpy+H2PmbvFmd+mT5AO5oyp8sr/leFDlpGk=;
 b=GyyKE1FoKC0Xfz+x6D4dm1yiDiwPdJ4BHsINghufCJ7/45DmIdJ4Tu9MjikJ3aUB62
 /7cESPUH7uXaQ4rQ0gHtal2FWiCrIvDACW92VqJx+gxM0qr2FOwA1CvOl++THzqKwxyp
 ZARHbVOQSKZ/auHl1wZVE7gWygn7qBiTWrM7txWKpxL223Y1wP5v5ahHjkre+3BZI6Vy
 BQoMjo/4pMr26kvyyKoz/SkVp/c0lwx4VbUhL3bj1TLF8eSPQySaKppkaQWgkf753ZqL
 PskOVLSGn9d21gGbGlKV1xmUQDp7FOTfNQGGkZpa58wnLxySnhcYf8kQrcGekxXlwNJX
 dRDg==
X-Gm-Message-State: ACrzQf1UN7NzEWfwOfNpwiWnpGrnOk++fu9ME9fYMIQKEXdQDUEWqhli
 w7X5uaCbR5U5eakpkD02WS5b6qm341LPNY8bdYxHMsEtK3gHo6gQDppE62G+CtunlaaTDEb2SQ1
 OXW+p+fjS++4dexjshzbOXF98PLrkQA7L60QbOUmZGLCw7Arvj1cF3pG/+fUTLS6X
X-Received: by 2002:a05:6214:550a:b0:4b4:dd2:be99 with SMTP id
 mb10-20020a056214550a00b004b40dd2be99mr8692410qvb.123.1665525378671; 
 Tue, 11 Oct 2022 14:56:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ntKar1ROHG3VxZkU9spjQT49BVXQODyNkvKi60mRJlqZwtSwJfaiRkoJQdzK8Svp559tNKQ==
X-Received: by 2002:a05:6214:550a:b0:4b4:dd2:be99 with SMTP id
 mb10-20020a056214550a00b004b40dd2be99mr8692382qvb.123.1665525378356; 
 Tue, 11 Oct 2022 14:56:18 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:17 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 13/15] migration: Send requested page directly in rp-return
 thread
Date: Tue, 11 Oct 2022 17:55:57 -0400
Message-Id: <20221011215559.602584-14-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011215559.602584-1-peterx@redhat.com>
References: <20221011215559.602584-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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

With all the facilities ready, send the requested page directly in the
rp-return thread rather than queuing it in the request queue, if and only
if postcopy preempt is enabled.  It can achieve so because it uses separate
channel for sending urgent pages.  The only shared data is bitmap and it's
protected by the bitmap_mutex.

Note that since we're moving the ownership of the urgent channel from the
migration thread to rp thread it also means the rp thread is responsible
for managing the qemufile, e.g. properly close it when pausing migration
happens.  For this, let migration_release_from_dst_file to cover shutdown
of the urgent channel too, renaming it as migration_release_dst_files() to
better show what it does.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c |  35 +++++++------
 migration/ram.c       | 112 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+), 16 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4364813d82..c0fd6588a4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2847,8 +2847,11 @@ static int migrate_handle_rp_resume_ack(MigrationState *s, uint32_t value)
     return 0;
 }
 
-/* Release ms->rp_state.from_dst_file in a safe way */
-static void migration_release_from_dst_file(MigrationState *ms)
+/*
+ * Release ms->rp_state.from_dst_file (and postcopy_qemufile_src if
+ * existed) in a safe way.
+ */
+static void migration_release_dst_files(MigrationState *ms)
 {
     QEMUFile *file;
 
@@ -2861,6 +2864,18 @@ static void migration_release_from_dst_file(MigrationState *ms)
         ms->rp_state.from_dst_file = NULL;
     }
 
+    /*
+     * Do the same to postcopy fast path socket too if there is.  No
+     * locking needed because this qemufile should only be managed by
+     * return path thread.
+     */
+    if (ms->postcopy_qemufile_src) {
+        migration_ioc_unregister_yank_from_file(ms->postcopy_qemufile_src);
+        qemu_file_shutdown(ms->postcopy_qemufile_src);
+        qemu_fclose(ms->postcopy_qemufile_src);
+        ms->postcopy_qemufile_src = NULL;
+    }
+
     qemu_fclose(file);
 }
 
@@ -3005,7 +3020,7 @@ out:
              * Maybe there is something we can do: it looks like a
              * network down issue, and we pause for a recovery.
              */
-            migration_release_from_dst_file(ms);
+            migration_release_dst_files(ms);
             rp = NULL;
             if (postcopy_pause_return_path_thread(ms)) {
                 /*
@@ -3023,7 +3038,7 @@ out:
     }
 
     trace_source_return_path_thread_end();
-    migration_release_from_dst_file(ms);
+    migration_release_dst_files(ms);
     rcu_unregister_thread();
     return NULL;
 }
@@ -3546,18 +3561,6 @@ static MigThrError postcopy_pause(MigrationState *s)
         qemu_file_shutdown(file);
         qemu_fclose(file);
 
-        /*
-         * Do the same to postcopy fast path socket too if there is.  No
-         * locking needed because no racer as long as we do this before setting
-         * status to paused.
-         */
-        if (s->postcopy_qemufile_src) {
-            migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
-            qemu_file_shutdown(s->postcopy_qemufile_src);
-            qemu_fclose(s->postcopy_qemufile_src);
-            s->postcopy_qemufile_src = NULL;
-        }
-
         migrate_set_state(&s->state, s->state,
                           MIGRATION_STATUS_POSTCOPY_PAUSED);
 
diff --git a/migration/ram.c b/migration/ram.c
index cbaa5650b8..d5a3fd610f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -546,6 +546,8 @@ static QemuThread *decompress_threads;
 static QemuMutex decomp_done_lock;
 static QemuCond decomp_done_cond;
 
+static int ram_save_host_page_urgent(PageSearchStatus *pss);
+
 static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf);
 
@@ -560,6 +562,16 @@ static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
     pss->complete_round = false;
 }
 
+/*
+ * Check whether two PSSs are actively sending the same page.  Return true
+ * if it is, false otherwise.
+ */
+static bool pss_overlap(PageSearchStatus *pss1, PageSearchStatus *pss2)
+{
+    return pss1->host_page_sending && pss2->host_page_sending &&
+        (pss1->host_page_start == pss2->host_page_start);
+}
+
 static void *do_data_compress(void *opaque)
 {
     CompressParam *param = opaque;
@@ -2260,6 +2272,57 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
         return -1;
     }
 
+    /*
+     * When with postcopy preempt, we send back the page directly in the
+     * rp-return thread.
+     */
+    if (postcopy_preempt_active()) {
+        ram_addr_t page_start = start >> TARGET_PAGE_BITS;
+        size_t page_size = qemu_ram_pagesize(ramblock);
+        PageSearchStatus *pss = &ram_state->pss[RAM_CHANNEL_POSTCOPY];
+        int ret = 0;
+
+        qemu_mutex_lock(&rs->bitmap_mutex);
+
+        pss_init(pss, ramblock, page_start);
+        /*
+         * Always use the preempt channel, and make sure it's there.  It's
+         * safe to access without lock, because when rp-thread is running
+         * we should be the only one who operates on the qemufile
+         */
+        pss->pss_channel = migrate_get_current()->postcopy_qemufile_src;
+        pss->postcopy_requested = true;
+        assert(pss->pss_channel);
+
+        /*
+         * It must be either one or multiple of host page size.  Just
+         * assert; if something wrong we're mostly split brain anyway.
+         */
+        assert(len % page_size == 0);
+        while (len) {
+            if (ram_save_host_page_urgent(pss)) {
+                error_report("%s: ram_save_host_page_urgent() failed: "
+                             "ramblock=%s, start_addr=0x"RAM_ADDR_FMT,
+                             __func__, ramblock->idstr, start);
+                ret = -1;
+                break;
+            }
+            /*
+             * NOTE: after ram_save_host_page_urgent() succeeded, pss->page
+             * will automatically be moved and point to the next host page
+             * we're going to send, so no need to update here.
+             *
+             * Normally QEMU never sends >1 host page in requests, so
+             * logically we don't even need that as the loop should only
+             * run once, but just to be consistent.
+             */
+            len -= page_size;
+        };
+        qemu_mutex_unlock(&rs->bitmap_mutex);
+
+        return ret;
+    }
+
     struct RAMSrcPageRequest *new_entry =
         g_new0(struct RAMSrcPageRequest, 1);
     new_entry->rb = ramblock;
@@ -2537,6 +2600,55 @@ static void pss_host_page_finish(PageSearchStatus *pss)
     pss->host_page_start = pss->host_page_end = 0;
 }
 
+/*
+ * Send an urgent host page specified by `pss'.  Need to be called with
+ * bitmap_mutex held.
+ *
+ * Returns 0 if save host page succeeded, false otherwise.
+ */
+static int ram_save_host_page_urgent(PageSearchStatus *pss)
+{
+    bool page_dirty, sent = false;
+    RAMState *rs = ram_state;
+    int ret = 0;
+
+    trace_postcopy_preempt_send_host_page(pss->block->idstr, pss->page);
+    pss_host_page_prepare(pss);
+
+    /*
+     * If precopy is sending the same page, let it be done in precopy, or
+     * we could send the same page in two channels and none of them will
+     * receive the whole page.
+     */
+    if (pss_overlap(pss, &ram_state->pss[RAM_CHANNEL_PRECOPY])) {
+        trace_postcopy_preempt_hit(pss->block->idstr,
+                                   pss->page << TARGET_PAGE_BITS);
+        return 0;
+    }
+
+    do {
+        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
+
+        if (page_dirty) {
+            /* Be strict to return code; it must be 1, or what else? */
+            if (ram_save_target_page(rs, pss) != 1) {
+                error_report_once("%s: ram_save_target_page failed", __func__);
+                ret = -1;
+                goto out;
+            }
+            sent = true;
+        }
+        pss_find_next_dirty(pss);
+    } while (pss_within_range(pss));
+out:
+    pss_host_page_finish(pss);
+    /* For urgent requests, flush immediately if sent */
+    if (sent) {
+        qemu_fflush(pss->pss_channel);
+    }
+    return ret;
+}
+
 /**
  * ram_save_host_page: save a whole host page
  *
-- 
2.37.3


