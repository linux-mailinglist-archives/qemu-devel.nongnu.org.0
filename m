Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1707D52AC74
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:06:38 +0200 (CEST)
Received: from localhost ([::1]:50932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3Sd-0000hj-3F
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 16:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KO-0003GG-KP
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KM-0002NE-Ik
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iBcBro84IFzTJeBEVxCMOgCjCLhBW0lBYCKZRwj4WV0=;
 b=SrXzVwBM5LFa9ucxTt3b/a1gK0azTEtqeuBt9c1BZcPVBAXX8XTV8yhPmspLxLoIKziUGx
 /+1XIdVf0zhSN0SiqtPtY88juxvsXWsiDQRKKQrTUIivM1MNcv38yjhcpHVjHpx1xUlrRH
 HLWPz03+Ea4W6qn5RrXqtNhTl6wU8Yw=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-FQpaJP6hMoerjjAhtBgYKw-1; Tue, 17 May 2022 15:57:52 -0400
X-MC-Unique: FQpaJP6hMoerjjAhtBgYKw-1
Received: by mail-io1-f70.google.com with SMTP id
 y13-20020a056602164d00b0065a9dec1ef2so13035897iow.23
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iBcBro84IFzTJeBEVxCMOgCjCLhBW0lBYCKZRwj4WV0=;
 b=6B6S/XVl4c/lIJBnGUtuFnrzheOrBD+HeVxxQ3XDDxs8CL9MJk6CV9fSZ3DTYnTzqy
 KFlv6bwZYbDil+dr/s7qtMyR2X+6xDxbHaWulg7yzPfZ4y0Teo3rBMuo0AJ3yVJPDoeS
 Pp5/lKhOG5W3e601s+tEF1HWqUTjESY2vTQ+eBlzhkUd4k8Fb4ToIsM6rt9/YhqwmcpT
 dn4Vo/Ktp4aTsdgJ31tx2agxccr+rByC5l8PckuWunZes0CL0Nk2gTez0fwZpBA0Juto
 GaXKkYl7y9Z9fMJwCsPRYg7bROrkLWl6qNkihuaP4AvrhJc/XHBn8lZ4ckZINrnLiG1z
 tKNQ==
X-Gm-Message-State: AOAM530cJjrcfz60l2zm8O88oXEPkov6PogGJy+70AYyOQEuav5i6PnC
 Uf9wUEhM57F/yVQDSOdbVMlUlhN4Qy8xwJGODo5O5Qx03I8qIiiBVY2GOsDAb+U2rYAY0LsAShI
 jN0dSLLdC0JjOgkrfLsidi3Zb+CEi/SUVG94tglT6NcIDsgS/3+LaqdVfm707FqBF
X-Received: by 2002:a05:6e02:1c07:b0:2cf:d71:a788 with SMTP id
 l7-20020a056e021c0700b002cf0d71a788mr12425684ilh.45.1652817471506; 
 Tue, 17 May 2022 12:57:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR1ALNj7ohUBPDRzzF/9mNzhljn+Da8mjar7Uia0yhweetn79Ube2TNB2JkcSNbXXQCzhOSA==
X-Received: by 2002:a05:6e02:1c07:b0:2cf:d71:a788 with SMTP id
 l7-20020a056e021c0700b002cf0d71a788mr12425662ilh.45.1652817471033; 
 Tue, 17 May 2022 12:57:51 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020b4f00b002d125725709sm59575ilu.28.2022.05.17.12.57.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 May 2022 12:57:50 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 10/13] migration: Respect postcopy request order in
 preemption mode
Date: Tue, 17 May 2022 15:57:27 -0400
Message-Id: <20220517195730.32312-11-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517195730.32312-1-peterx@redhat.com>
References: <20220517195730.32312-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Alongside, I touched up find_dirty_block() to only set the postcopy fields
in the pss section if we're going through a postcopy migration.  That's a
very light optimization and shouldn't affect much.

Reported-by: manish.mishra@nutanix.com
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 69 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 55 insertions(+), 14 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 9d76db8491..fdcd9984fa 100644
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
@@ -1516,8 +1539,14 @@ retry:
  */
 static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
 {
-    /* This is not a postcopy requested page */
-    pss->postcopy_requested = false;
+    if (migration_in_postcopy()) {
+        /*
+         * This is not a postcopy requested page, mark it "not urgent", and
+         * use precopy channel to send it.
+         */
+        pss->postcopy_requested = false;
+        pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
+    }
 
     pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
     if (pss->complete_round && pss->block == rs->last_seen_block &&
@@ -2038,15 +2067,20 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
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
@@ -2070,7 +2104,9 @@ again:
          * really rare.
          */
         pss->complete_round = false;
+        /* Mark it an urgent request, meanwhile using POSTCOPY channel */
         pss->postcopy_requested = true;
+        pss->postcopy_target_channel = RAM_CHANNEL_POSTCOPY;
     }
 
     return !!block;
@@ -2324,7 +2360,8 @@ static bool postcopy_preempt_triggered(RAMState *rs)
     return rs->postcopy_preempt_state.preempted;
 }
 
-static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
+static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
+                                     bool postcopy_requested)
 {
     PostcopyPreemptState *state = &rs->postcopy_preempt_state;
 
@@ -2332,8 +2369,15 @@ static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
 
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
 
@@ -2344,12 +2388,9 @@ static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss)
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
@@ -2505,7 +2546,7 @@ static int ram_find_and_save_block(RAMState *rs)
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


