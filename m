Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0AB55558A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 22:54:16 +0200 (CEST)
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47Md-0002Rm-94
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 16:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47ID-0002QB-1c
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IA-0004Gb-HL
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655930978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4/qTm2SCK1BnbfPBTGBw+6SL12ZkJrdh6H0UeTw2hc=;
 b=G+AXS5wCocSOLLoj+B68bRjnapjW/vimhdoFvKvsfPiZ/K0vqrOvSFe6lM/8MuBhKZxnzZ
 WXqU+H4BmMZ00QuCF9mdgLeXeh8KhTxmknr4AQ5KbJFcV8dRdfScjk8aGUsxNJQ0zLgMuY
 TPX7TBvR5ycfQjJYBLA3u9hk1x4Q+Ow=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-aXyS0JBHNQ6OQj73WlPDFQ-1; Wed, 22 Jun 2022 16:49:37 -0400
X-MC-Unique: aXyS0JBHNQ6OQj73WlPDFQ-1
Received: by mail-il1-f198.google.com with SMTP id
 s6-20020a056e021a0600b002d8fcba296aso7973544ild.20
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4/qTm2SCK1BnbfPBTGBw+6SL12ZkJrdh6H0UeTw2hc=;
 b=WH8b7G4Ew4iY1gevVrRPgJxD5p2o/vjPfTYL+D4AS+HV1KnqBPD2Q2GCsA31lFjIa4
 WrQFaZckdHFLGeT0pv1xmkXHoUNwH87hLyYmAFh8gHqb0dCtNFhoH39dzQlSh7QB//uw
 Hd+4UYZyLuKozewbNe0XyzFT+4niKc+hR3+RDhEmnDMT6ioeEyej4JqL9kx+qMyQnrYF
 V44QVdDgA1fXCQ9dmDEPurxh98n7beFOvYywWvzBIVoBgvtT6Couxdi8gFTmOn8mZ7by
 MW0396Rg/FS11T1uIOl4UqhE4c38U6SdH0dFAm+iSfWzXGVrOjs0biRDzbMg8mzKx1vK
 HHSw==
X-Gm-Message-State: AJIora8u3uz7r7WFYMaJ+LVjpy07z3eF3OHVdFtB4QmYXsXBD9TaL2sL
 JF5v+szjHsJApviHE/evj2Nz56cnt0/7pMqNeGu4MJ0732WOYdseDVbHqmYZuYrmDkfR4JyelxJ
 IZv5gqMZcpoml/V/9rUX6S8boaGmZY5rfXBRMPetKFUJmxKoUDiDEtqkpEmd1h7QE
X-Received: by 2002:a05:6602:13c3:b0:672:6e5b:f91d with SMTP id
 o3-20020a05660213c300b006726e5bf91dmr2281104iov.68.1655930975881; 
 Wed, 22 Jun 2022 13:49:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sAbrbI4DIUxGM20WHOIegv/fKzQUzuK902PuSUUEgzLu6mLKyUv+rpBVwe3cO2DxCK5HCajw==
X-Received: by 2002:a05:6602:13c3:b0:672:6e5b:f91d with SMTP id
 o3-20020a05660213c300b006726e5bf91dmr2281083iov.68.1655930975275; 
 Wed, 22 Jun 2022 13:49:35 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.49.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:49:34 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 04/15] migration: Postcopy preemption enablement
Date: Wed, 22 Jun 2022 16:49:09 -0400
Message-Id: <20220622204920.79061-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622204920.79061-1-peterx@redhat.com>
References: <20220622204920.79061-1-peterx@redhat.com>
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

This patch enables postcopy-preempt feature.

It contains two major changes to the migration logic:

(1) Postcopy requests are now sent via a different socket from precopy
    background migration stream, so as to be isolated from very high page
    request delays.

(2) For huge page enabled hosts: when there's postcopy requests, they can now
    intercept a partial sending of huge host pages on src QEMU.

After this patch, we'll live migrate a VM with two channels for postcopy: (1)
PRECOPY channel, which is the default channel that transfers background pages;
and (2) POSTCOPY channel, which only transfers requested pages.

There's no strict rule of which channel to use, e.g., if a requested page is
already being transferred on precopy channel, then we will keep using the same
precopy channel to transfer the page even if it's explicitly requested.  In 99%
of the cases we'll prioritize the channels so we send requested page via the
postcopy channel as long as possible.

On the source QEMU, when we found a postcopy request, we'll interrupt the
PRECOPY channel sending process and quickly switch to the POSTCOPY channel.
After we serviced all the high priority postcopy pages, we'll switch back to
PRECOPY channel so that we'll continue to send the interrupted huge page again.
There's no new thread introduced on src QEMU.

On the destination QEMU, one new thread is introduced to receive page data from
the postcopy specific socket (done in the preparation patch).

This patch has a side effect: after sending postcopy pages, previously we'll
assume the guest will access follow up pages so we'll keep sending from there.
Now it's changed.  Instead of going on with a postcopy requested page, we'll go
back and continue sending the precopy huge page (which can be intercepted by a
postcopy request so the huge page can be sent partially before).

Whether that's a problem is debatable, because "assuming the guest will
continue to access the next page" may not really suite when huge pages are
used, especially if the huge page is large (e.g. 1GB pages).  So that locality
hint is much meaningless if huge pages are used.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c  |   2 +
 migration/migration.h  |   2 +-
 migration/ram.c        | 251 +++++++++++++++++++++++++++++++++++++++--
 migration/trace-events |   7 ++
 4 files changed, 253 insertions(+), 9 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 9484fec0b2..5e20d1c941 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3189,6 +3189,8 @@ static int postcopy_start(MigrationState *ms)
                               MIGRATION_STATUS_FAILED);
     }
 
+    trace_postcopy_preempt_enabled(migrate_postcopy_preempt());
+
     return ret;
 
 fail_closefb:
diff --git a/migration/migration.h b/migration/migration.h
index 941c61e543..ff714c235f 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -68,7 +68,7 @@ typedef struct {
 struct MigrationIncomingState {
     QEMUFile *from_src_file;
     /* Previously received RAM's RAMBlock pointer */
-    RAMBlock *last_recv_block;
+    RAMBlock *last_recv_block[RAM_CHANNEL_MAX];
     /* A hook to allow cleanup at the end of incoming migration */
     void *transport_data;
     void (*transport_cleanup)(void *data);
diff --git a/migration/ram.c b/migration/ram.c
index e4364c0bff..65b08c4edb 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -296,6 +296,20 @@ struct RAMSrcPageRequest {
     QSIMPLEQ_ENTRY(RAMSrcPageRequest) next_req;
 };
 
+typedef struct {
+    /*
+     * Cached ramblock/offset values if preempted.  They're only meaningful if
+     * preempted==true below.
+     */
+    RAMBlock *ram_block;
+    unsigned long ram_page;
+    /*
+     * Whether a postcopy preemption just happened.  Will be reset after
+     * precopy recovered to background migration.
+     */
+    bool preempted;
+} PostcopyPreemptState;
+
 /* State of RAM for migration */
 struct RAMState {
     /* QEMUFile used for this migration */
@@ -350,6 +364,14 @@ struct RAMState {
     /* Queue of outstanding page requests from the destination */
     QemuMutex src_page_req_mutex;
     QSIMPLEQ_HEAD(, RAMSrcPageRequest) src_page_requests;
+
+    /* Postcopy preemption informations */
+    PostcopyPreemptState postcopy_preempt_state;
+    /*
+     * Current channel we're using on src VM.  Only valid if postcopy-preempt
+     * is enabled.
+     */
+    unsigned int postcopy_channel;
 };
 typedef struct RAMState RAMState;
 
@@ -357,6 +379,11 @@ static RAMState *ram_state;
 
 static NotifierWithReturnList precopy_notifier_list;
 
+static void postcopy_preempt_reset(RAMState *rs)
+{
+    memset(&rs->postcopy_preempt_state, 0, sizeof(PostcopyPreemptState));
+}
+
 /* Whether postcopy has queued requests? */
 static bool postcopy_has_request(RAMState *rs)
 {
@@ -1947,6 +1974,55 @@ void ram_write_tracking_stop(void)
 }
 #endif /* defined(__linux__) */
 
+/*
+ * Check whether two addr/offset of the ramblock falls onto the same host huge
+ * page.  Returns true if so, false otherwise.
+ */
+static bool offset_on_same_huge_page(RAMBlock *rb, uint64_t addr1,
+                                     uint64_t addr2)
+{
+    size_t page_size = qemu_ram_pagesize(rb);
+
+    addr1 = ROUND_DOWN(addr1, page_size);
+    addr2 = ROUND_DOWN(addr2, page_size);
+
+    return addr1 == addr2;
+}
+
+/*
+ * Whether a previous preempted precopy huge page contains current requested
+ * page?  Returns true if so, false otherwise.
+ *
+ * This should really happen very rarely, because it means when we were sending
+ * during background migration for postcopy we're sending exactly the page that
+ * some vcpu got faulted on on dest node.  When it happens, we probably don't
+ * need to do much but drop the request, because we know right after we restore
+ * the precopy stream it'll be serviced.  It'll slightly affect the order of
+ * postcopy requests to be serviced (e.g. it'll be the same as we move current
+ * request to the end of the queue) but it shouldn't be a big deal.  The most
+ * imporant thing is we can _never_ try to send a partial-sent huge page on the
+ * POSTCOPY channel again, otherwise that huge page will got "split brain" on
+ * two channels (PRECOPY, POSTCOPY).
+ */
+static bool postcopy_preempted_contains(RAMState *rs, RAMBlock *block,
+                                        ram_addr_t offset)
+{
+    PostcopyPreemptState *state = &rs->postcopy_preempt_state;
+
+    /* No preemption at all? */
+    if (!state->preempted) {
+        return false;
+    }
+
+    /* Not even the same ramblock? */
+    if (state->ram_block != block) {
+        return false;
+    }
+
+    return offset_on_same_huge_page(block, offset,
+                                    state->ram_page << TARGET_PAGE_BITS);
+}
+
 /**
  * get_queued_page: unqueue a page from the postcopy requests
  *
@@ -1962,9 +2038,17 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
     RAMBlock  *block;
     ram_addr_t offset;
 
+again:
     block = unqueue_page(rs, &offset);
 
-    if (!block) {
+    if (block) {
+        /* See comment above postcopy_preempted_contains() */
+        if (postcopy_preempted_contains(rs, block, offset)) {
+            trace_postcopy_preempt_hit(block->idstr, offset);
+            /* This request is dropped */
+            goto again;
+        }
+    } else {
         /*
          * Poll write faults too if background snapshot is enabled; that's
          * when we have vcpus got blocked by the write protected pages.
@@ -2180,6 +2264,117 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
     return ram_save_page(rs, pss);
 }
 
+static bool postcopy_needs_preempt(RAMState *rs, PageSearchStatus *pss)
+{
+    /* Not enabled eager preempt?  Then never do that. */
+    if (!migrate_postcopy_preempt()) {
+        return false;
+    }
+
+    /* If the ramblock we're sending is a small page?  Never bother. */
+    if (qemu_ram_pagesize(pss->block) == TARGET_PAGE_SIZE) {
+        return false;
+    }
+
+    /* Not in postcopy at all? */
+    if (!migration_in_postcopy()) {
+        return false;
+    }
+
+    /*
+     * If we're already handling a postcopy request, don't preempt as this page
+     * has got the same high priority.
+     */
+    if (pss->postcopy_requested) {
+        return false;
+    }
+
+    /* If there's postcopy requests, then check it up! */
+    return postcopy_has_request(rs);
+}
+
+/* Returns true if we preempted precopy, false otherwise */
+static void postcopy_do_preempt(RAMState *rs, PageSearchStatus *pss)
+{
+    PostcopyPreemptState *p_state = &rs->postcopy_preempt_state;
+
+    trace_postcopy_preempt_triggered(pss->block->idstr, pss->page);
+
+    /*
+     * Time to preempt precopy. Cache current PSS into preempt state, so that
+     * after handling the postcopy pages we can recover to it.  We need to do
+     * so because the dest VM will have partial of the precopy huge page kept
+     * over in its tmp huge page caches; better move on with it when we can.
+     */
+    p_state->ram_block = pss->block;
+    p_state->ram_page = pss->page;
+    p_state->preempted = true;
+}
+
+/* Whether we're preempted by a postcopy request during sending a huge page */
+static bool postcopy_preempt_triggered(RAMState *rs)
+{
+    return rs->postcopy_preempt_state.preempted;
+}
+
+static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
+{
+    PostcopyPreemptState *state = &rs->postcopy_preempt_state;
+
+    assert(state->preempted);
+
+    pss->block = state->ram_block;
+    pss->page = state->ram_page;
+    /* This is not a postcopy request but restoring previous precopy */
+    pss->postcopy_requested = false;
+
+    trace_postcopy_preempt_restored(pss->block->idstr, pss->page);
+
+    /* Reset preempt state, most importantly, set preempted==false */
+    postcopy_preempt_reset(rs);
+}
+
+static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
+{
+    MigrationState *s = migrate_get_current();
+    unsigned int channel;
+    QEMUFile *next;
+
+    channel = pss->postcopy_requested ?
+        RAM_CHANNEL_POSTCOPY : RAM_CHANNEL_PRECOPY;
+
+    if (channel != rs->postcopy_channel) {
+        if (channel == RAM_CHANNEL_PRECOPY) {
+            next = s->to_dst_file;
+        } else {
+            next = s->postcopy_qemufile_src;
+        }
+        /* Update and cache the current channel */
+        rs->f = next;
+        rs->postcopy_channel = channel;
+
+        /*
+         * If channel switched, reset last_sent_block since the old sent block
+         * may not be on the same channel.
+         */
+        rs->last_sent_block = NULL;
+
+        trace_postcopy_preempt_switch_channel(channel);
+    }
+
+    trace_postcopy_preempt_send_host_page(pss->block->idstr, pss->page);
+}
+
+/* We need to make sure rs->f always points to the default channel elsewhere */
+static void postcopy_preempt_reset_channel(RAMState *rs)
+{
+    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
+        rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
+        rs->f = migrate_get_current()->to_dst_file;
+        trace_postcopy_preempt_reset_channel();
+    }
+}
+
 /**
  * ram_save_host_page: save a whole host page
  *
@@ -2211,7 +2406,16 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         return 0;
     }
 
+    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
+        postcopy_preempt_choose_channel(rs, pss);
+    }
+
     do {
+        if (postcopy_needs_preempt(rs, pss)) {
+            postcopy_do_preempt(rs, pss);
+            break;
+        }
+
         /* Check the pages is dirty and if it is send it */
         if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
             tmppages = ram_save_target_page(rs, pss);
@@ -2235,6 +2439,19 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     /* The offset we leave with is the min boundary of host page and block */
     pss->page = MIN(pss->page, hostpage_boundary);
 
+    /*
+     * When with postcopy preempt mode, flush the data as soon as possible for
+     * postcopy requests, because we've already sent a whole huge page, so the
+     * dst node should already have enough resource to atomically filling in
+     * the current missing page.
+     *
+     * More importantly, when using separate postcopy channel, we must do
+     * explicit flush or it won't flush until the buffer is full.
+     */
+    if (migrate_postcopy_preempt() && pss->postcopy_requested) {
+        qemu_fflush(rs->f);
+    }
+
     res = ram_save_release_protection(rs, pss, start_page);
     return (res < 0 ? res : pages);
 }
@@ -2276,8 +2493,17 @@ static int ram_find_and_save_block(RAMState *rs)
         found = get_queued_page(rs, &pss);
 
         if (!found) {
-            /* priority queue empty, so just search for something dirty */
-            found = find_dirty_block(rs, &pss, &again);
+            /*
+             * Recover previous precopy ramblock/offset if postcopy has
+             * preempted precopy.  Otherwise find the next dirty bit.
+             */
+            if (postcopy_preempt_triggered(rs)) {
+                postcopy_preempt_restore(rs, &pss);
+                found = true;
+            } else {
+                /* priority queue empty, so just search for something dirty */
+                found = find_dirty_block(rs, &pss, &again);
+            }
         }
 
         if (found) {
@@ -2405,6 +2631,8 @@ static void ram_state_reset(RAMState *rs)
     rs->last_page = 0;
     rs->last_version = ram_list.version;
     rs->xbzrle_enabled = false;
+    postcopy_preempt_reset(rs);
+    rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
 }
 
 #define MAX_WAIT 50 /* ms, half buffered_file limit */
@@ -3048,6 +3276,8 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
     }
     qemu_mutex_unlock(&rs->bitmap_mutex);
 
+    postcopy_preempt_reset_channel(rs);
+
     /*
      * Must occur before EOS (or any QEMUFile operation)
      * because of RDMA protocol.
@@ -3125,6 +3355,8 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
+    postcopy_preempt_reset_channel(rs);
+
     ret = multifd_send_sync_main(rs->f);
     if (ret < 0) {
         return ret;
@@ -3209,11 +3441,13 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
  * @mis: the migration incoming state pointer
  * @f: QEMUFile where to read the data from
  * @flags: Page flags (mostly to see if it's a continuation of previous block)
+ * @channel: the channel we're using
  */
 static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
-                                              QEMUFile *f, int flags)
+                                              QEMUFile *f, int flags,
+                                              int channel)
 {
-    RAMBlock *block = mis->last_recv_block;
+    RAMBlock *block = mis->last_recv_block[channel];
     char id[256];
     uint8_t len;
 
@@ -3240,7 +3474,7 @@ static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
         return NULL;
     }
 
-    mis->last_recv_block = block;
+    mis->last_recv_block[channel] = block;
 
     return block;
 }
@@ -3694,7 +3928,7 @@ int ram_load_postcopy(QEMUFile *f, int channel)
         trace_ram_load_postcopy_loop(channel, (uint64_t)addr, flags);
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE)) {
-            block = ram_block_from_stream(mis, f, flags);
+            block = ram_block_from_stream(mis, f, flags, channel);
             if (!block) {
                 ret = -EINVAL;
                 break;
@@ -3945,7 +4179,8 @@ static int ram_load_precopy(QEMUFile *f)
 
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
-            RAMBlock *block = ram_block_from_stream(mis, f, flags);
+            RAMBlock *block = ram_block_from_stream(mis, f, flags,
+                                                    RAM_CHANNEL_PRECOPY);
 
             host = host_from_ram_block_offset(block, addr);
             /*
diff --git a/migration/trace-events b/migration/trace-events
index 4bc787cf0c..69f311169a 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -111,6 +111,12 @@ ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteration %" PRI
 ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
 ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
 unqueue_page(char *block, uint64_t offset, bool dirty) "ramblock '%s' offset 0x%"PRIx64" dirty %d"
+postcopy_preempt_triggered(char *str, unsigned long page) "during sending ramblock %s offset 0x%lx"
+postcopy_preempt_restored(char *str, unsigned long page) "ramblock %s offset 0x%lx"
+postcopy_preempt_hit(char *str, uint64_t offset) "ramblock %s offset 0x%"PRIx64
+postcopy_preempt_send_host_page(char *str, uint64_t offset) "ramblock %s offset 0x%"PRIx64
+postcopy_preempt_switch_channel(int channel) "%d"
+postcopy_preempt_reset_channel(void) ""
 
 # multifd.c
 multifd_new_send_channel_async(uint8_t id) "channel %u"
@@ -176,6 +182,7 @@ migration_thread_low_pending(uint64_t pending) "%" PRIu64
 migrate_transferred(uint64_t tranferred, uint64_t time_spent, uint64_t bandwidth, uint64_t size) "transferred %" PRIu64 " time_spent %" PRIu64 " bandwidth %" PRIu64 " max_size %" PRId64
 process_incoming_migration_co_end(int ret, int ps) "ret=%d postcopy-state=%d"
 process_incoming_migration_co_postcopy_end_main(void) ""
+postcopy_preempt_enabled(bool value) "%d"
 
 # channel.c
 migration_set_incoming_channel(void *ioc, const char *ioctype) "ioc=%p ioctype=%s"
-- 
2.32.0


