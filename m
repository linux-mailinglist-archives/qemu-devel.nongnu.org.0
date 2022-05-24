Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856A2533372
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:22:27 +0200 (CEST)
Received: from localhost ([::1]:44578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntcv4-0007uO-Hb
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclE-0001GE-7d
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclC-0005hQ-3m
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653430333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PP34hCiOQqIQhpwQJUsnUJOY7SkVaeEclyW8Yww4kX8=;
 b=Rf5D77h30e5tZJQ3q4zBAlfMv4x4fom3boq6/PLNu7o3q9qaOIOBv1Ry00T3XkV1GiU2z4
 08+OmYY1yubIDPlqMeGw85T9ltmQROWh6MA1r9wMVBlw86ZGrsyFO+QrLXmalBxR8cCVgm
 xoHu8K3mWIWE8L83cvw+mvivf5RTSTk=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-u2bh9RAeOXWE2rlGd621XQ-1; Tue, 24 May 2022 18:12:12 -0400
X-MC-Unique: u2bh9RAeOXWE2rlGd621XQ-1
Received: by mail-io1-f72.google.com with SMTP id
 x13-20020a0566022c4d00b0065491fa5614so10611275iov.9
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PP34hCiOQqIQhpwQJUsnUJOY7SkVaeEclyW8Yww4kX8=;
 b=qCd6Bfp4OW7LrUga+mnx0dObeRGZ3M0jA1VC4vojJM8IRugZUBAdLPpOtpm3maJ1W0
 5gsHLgDWqTNnA8VPHUrT/rZvXDbt1PgdD1ISw2VALpxl+lEyvocb1NWwREEKUhTX9kOV
 jz1JyEZ8ut6KiVzve4IJtZUu9Lo74DCFaGYx3v5nhiBSmXslqnTc6S19/jml63We9hFF
 1XMT+T+2fDxQ3ufZb/JI2aIXhEj0aiE5pJjS2IEs75m7lvh34DDulE3HQ0p2Yc4TpgPB
 5srZ1st5uJILKqp2W8dv9RtcZe65IIVE0yZyf7D4gF1LYm2rAsEIdBXxevtxOPZvmuxQ
 z+og==
X-Gm-Message-State: AOAM531KVSlxNzSlLy4rk+QkQKrpSLLkGdZxl9i8jg0WEqAQQrUGLvAs
 DOUQdVhcwrsVbnsNIl/VZ5ZeOmKGoZaqYnzGwvZzJJqINj21k3bZoXhX14EYhk0hsmoVqb22rt7
 ploC2nI+eLBneVQjb16KrLu9IJ1mhOthHTaYfLUaHk5S2u+YAzjuPLOSFDEW6NgBz
X-Received: by 2002:a05:6e02:16cc:b0:2d1:9a4c:db79 with SMTP id
 12-20020a056e0216cc00b002d19a4cdb79mr8281542ilx.175.1653430330604; 
 Tue, 24 May 2022 15:12:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjzUbjjjftzNlxTLNro1mHLo+q1h38ZCi/a+bEs5FuJF5RcQprn6XIJUHvggqPdzPm58w+mA==
X-Received: by 2002:a05:6e02:16cc:b0:2d1:9a4c:db79 with SMTP id
 12-20020a056e0216cc00b002d19a4cdb79mr8281525ilx.175.1653430330180; 
 Tue, 24 May 2022 15:12:10 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 6-20020a021d06000000b0032e2d3cc08csm3738045jaj.132.2022.05.24.15.12.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 May 2022 15:12:09 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com
Subject: [PATCH v7 10/14] migration: Respect postcopy request order in
 preemption mode
Date: Tue, 24 May 2022 18:11:47 -0400
Message-Id: <20220524221151.18225-11-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524221151.18225-1-peterx@redhat.com>
References: <20220524221151.18225-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URG_BIZ=0.573 autolearn=ham autolearn_force=no
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

With preemption mode on, when we see a postcopy request that was requesting
for exactly the page that we have preempted before (so we've partially sent
the page already via PRECOPY channel and it got preempted by another
postcopy request), currently we drop the request so that after all the
other postcopy requests are serviced then we'll go back to precopy stream
and start to handle that.

We dropped the request because we can't send it via postcopy channel since
the precopy channel already contains partial of the data, and we can only
send a huge page via one channel as a whole.  We can't split a huge page
into two channels.

That's a very corner case and that works, but there's a change on the order
of postcopy requests that we handle since we're postponing this (unlucky)
postcopy request to be later than the other queued postcopy requests.  The
problem is there's a possibility that when the guest was very busy, the
postcopy queue can be always non-empty, it means this dropped request will
never be handled until the end of postcopy migration. So, there's a chance
that there's one dest QEMU vcpu thread waiting for a page fault for an
extremely long time just because it's unluckily accessing the specific page
that was preempted before.

The worst case time it needs can be as long as the whole postcopy migration
procedure.  It's extremely unlikely to happen, but when it happens it's not
good.

The root cause of this problem is because we treat pss->postcopy_requested
variable as with two meanings bound together, as the variable shows:

  1. Whether this page request is urgent, and,
  2. Which channel we should use for this page request.

With the old code, when we set postcopy_requested it means either both (1)
and (2) are true, or both (1) and (2) are false.  We can never have (1)
and (2) to have different values.

However it doesn't necessarily need to be like that.  It's very legal that
there's one request that has (1) very high urgency, but (2) we'd like to
use the precopy channel.  Just like the corner case we were discussing
above.

To differenciate the two meanings better, introduce a new field called
postcopy_target_channel, showing which channel we should use for this page
request, so as to cover the old meaning (2) only.  Then we leave the
postcopy_requested variable to stand only for meaning (1), which is the
urgency of this page request.

With this change, we can easily boost priority of a preempted precopy page
as long as we know that page is also requested as a postcopy page.  So with
the new approach in get_queued_page() instead of dropping that request, we
send it right away with the precopy channel so we get back the ordering of
the page faults just like how they're requested on dest.

Reported-by: Manish Mishra <manish.mishra@nutanix.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 65 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 13 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 9d76db8491..fe302e7734 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -441,8 +441,28 @@ struct PageSearchStatus {
     unsigned long page;
     /* Set once we wrap around */
     bool         complete_round;
-    /* Whether current page is explicitly requested by postcopy */
+    /*
+     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
+     * postcopy.  When set, the request is "urgent" because the dest QEMU
+     * threads are waiting for us.
+     */
     bool         postcopy_requested;
+    /*
+     * [POSTCOPY-ONLY] The target channel to use to send current page.
+     *
+     * Note: This may _not_ match with the value in postcopy_requested
+     * above. Let's imagine the case where the postcopy request is exactly
+     * the page that we're sending in progress during precopy. In this case
+     * we'll have postcopy_requested set to true but the target channel
+     * will be the precopy channel (so that we don't split brain on that
+     * specific page since the precopy channel already contains partial of
+     * that page data).
+     *
+     * Besides that specific use case, postcopy_target_channel should
+     * always be equal to postcopy_requested, because by default we send
+     * postcopy pages via postcopy preempt channel.
+     */
+    bool         postcopy_target_channel;
 };
 typedef struct PageSearchStatus PageSearchStatus;
 
@@ -496,6 +516,9 @@ static QemuCond decomp_done_cond;
 static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf);
 
+static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
+                                     bool postcopy_requested);
+
 static void *do_data_compress(void *opaque)
 {
     CompressParam *param = opaque;
@@ -1516,8 +1539,12 @@ retry:
  */
 static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
 {
-    /* This is not a postcopy requested page */
+    /*
+     * This is not a postcopy requested page, mark it "not urgent", and use
+     * precopy channel to send it.
+     */
     pss->postcopy_requested = false;
+    pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
 
     pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
     if (pss->complete_round && pss->block == rs->last_seen_block &&
@@ -2038,15 +2065,20 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
     RAMBlock  *block;
     ram_addr_t offset;
 
-again:
     block = unqueue_page(rs, &offset);
 
     if (block) {
         /* See comment above postcopy_preempted_contains() */
         if (postcopy_preempted_contains(rs, block, offset)) {
             trace_postcopy_preempt_hit(block->idstr, offset);
-            /* This request is dropped */
-            goto again;
+            /*
+             * If what we preempted previously was exactly what we're
+             * requesting right now, restore the preempted precopy
+             * immediately, boosting its priority as it's requested by
+             * postcopy.
+             */
+            postcopy_preempt_restore(rs, pss, true);
+            return true;
         }
     } else {
         /*
@@ -2070,7 +2102,9 @@ again:
          * really rare.
          */
         pss->complete_round = false;
+        /* Mark it an urgent request, meanwhile using POSTCOPY channel */
         pss->postcopy_requested = true;
+        pss->postcopy_target_channel = RAM_CHANNEL_POSTCOPY;
     }
 
     return !!block;
@@ -2324,7 +2358,8 @@ static bool postcopy_preempt_triggered(RAMState *rs)
     return rs->postcopy_preempt_state.preempted;
 }
 
-static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
+static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
+                                     bool postcopy_requested)
 {
     PostcopyPreemptState *state = &rs->postcopy_preempt_state;
 
@@ -2332,8 +2367,15 @@ static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
 
     pss->block = state->ram_block;
     pss->page = state->ram_page;
-    /* This is not a postcopy request but restoring previous precopy */
-    pss->postcopy_requested = false;
+
+    /* Whether this is a postcopy request? */
+    pss->postcopy_requested = postcopy_requested;
+    /*
+     * When restoring a preempted page, the old data resides in PRECOPY
+     * slow channel, even if postcopy_requested is set.  So always use
+     * PRECOPY channel here.
+     */
+    pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
 
     trace_postcopy_preempt_restored(pss->block->idstr, pss->page);
 
@@ -2344,12 +2386,9 @@ static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
 static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
 {
     MigrationState *s = migrate_get_current();
-    unsigned int channel;
+    unsigned int channel = pss->postcopy_target_channel;
     QEMUFile *next;
 
-    channel = pss->postcopy_requested ?
-        RAM_CHANNEL_POSTCOPY : RAM_CHANNEL_PRECOPY;
-
     if (channel != rs->postcopy_channel) {
         if (channel == RAM_CHANNEL_PRECOPY) {
             next = s->to_dst_file;
@@ -2505,7 +2544,7 @@ static int ram_find_and_save_block(RAMState *rs)
              * preempted precopy.  Otherwise find the next dirty bit.
              */
             if (postcopy_preempt_triggered(rs)) {
-                postcopy_preempt_restore(rs, &pss);
+                postcopy_preempt_restore(rs, &pss, false);
                 found = true;
             } else {
                 /* priority queue empty, so just search for something dirty */
-- 
2.32.0


