Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157575FBDA9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:09:00 +0200 (CEST)
Received: from localhost ([::1]:46624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNQp-0006SN-1b
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEb-0001kl-Ah
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEY-0003Wu-Ql
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tat2JQZLD/IPyTBFrKEfM41kbJ+PcH6ibpRcVlMaUSA=;
 b=WaIkDff3OgIt+l8gz0cJBcl332qDLTH4pfuOOl+4sUaGQymEK6NtWOdGdupzVQ2J++aumu
 5qeJd7arVl/Zacwieo4Gt/YkZ8yZ1xa3jC5P3jfEa947NK6H+D0ddmlCe0l5L7dtVje3Vy
 PK1WHwkrHymxM1aBglOt+Ym5uq/4oPA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-uU-FAt2SMPG9J3ukrC__CA-1; Tue, 11 Oct 2022 17:56:17 -0400
X-MC-Unique: uU-FAt2SMPG9J3ukrC__CA-1
Received: by mail-qv1-f70.google.com with SMTP id
 jn13-20020ad45ded000000b004b1d055fbc7so8685578qvb.2
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tat2JQZLD/IPyTBFrKEfM41kbJ+PcH6ibpRcVlMaUSA=;
 b=b/l7SAzG7sNGcPt4UGAdO/84AQfV28n71i6dERqrGfmgi7DwIOQK3CStxinycFkjsY
 4V3LEgXX31MYPY9Qtu7N0Ef3f9/X+5Pi2v1p38oDFqRvFl248Gr/OIVWNUl6jCbo4Liy
 IL3oG+BhEVb48iFQFStai6fgWOZsb+sDrSYpotcTOONARw066MoaPQjFsWmto9OucYvF
 AlF/3YhAg2kkf9AR1Zif+PvyXNBPCHSw2LkZUsrRh66hJnUukyAcoKPW5omaTEjyh7Vt
 nWD5QcF+SqKXOI2GGL2pxQYocGhxTlSMml+DRP3H3ThagVQ3UNGvkxx7DK4KzNojfshl
 0KBA==
X-Gm-Message-State: ACrzQf0xL8bmOnQGwUiTeO2DOFuHbMuwlbt9b+FakTXbtlFp4GuNqrX2
 RBGl/qFYh/z/L9AGvzM/uPEUREgOqKEzQ0PkYKf+MepflDgmI5vR3A3L9UKVWN76p52PWNiIx0V
 1Nv/V/lSh2GwSl8SGIuoPPnCsUBkQ3AF/xoLQ7TfYWyQcub5jgivDkKGJ33L3oUCQ
X-Received: by 2002:a05:620a:bc3:b0:6b6:5746:f91f with SMTP id
 s3-20020a05620a0bc300b006b65746f91fmr18469796qki.391.1665525376347; 
 Tue, 11 Oct 2022 14:56:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM66W3U9u1cg19G7Zn0NTMm0NFJmCfRah0dxn/Xw5zfaes05Thsgmlg2+qM55PfrZTYmn25Wkg==
X-Received: by 2002:a05:620a:bc3:b0:6b6:5746:f91f with SMTP id
 s3-20020a05620a0bc300b006b65746f91fmr18469777qki.391.1665525376002; 
 Tue, 11 Oct 2022 14:56:16 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:15 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 11/15] migration: Make PageSearchStatus part of RAMState
Date: Tue, 11 Oct 2022 17:55:55 -0400
Message-Id: <20221011215559.602584-12-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011215559.602584-1-peterx@redhat.com>
References: <20221011215559.602584-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We used to allocate PSS structure on the stack for precopy when sending
pages.  Make it static, so as to describe per-channel ram migration status.

Here we declared RAM_CHANNEL_MAX instances, preparing for postcopy to use
it, even though this patch has not yet to start using the 2nd instance.

This should not have any functional change per se, but it already starts to
export PSS information via the RAMState, so that e.g. one PSS channel can
start to reference the other PSS channel.

Always protect PSS access using the same RAMState.bitmap_mutex.  We already
do so, so no code change needed, just some comment update.  Maybe we should
consider renaming bitmap_mutex some day as it's going to be a more commonly
and big mutex we use for ram states, but just leave it for later.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 112 ++++++++++++++++++++++++++----------------------
 1 file changed, 61 insertions(+), 51 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 44967e72b2..486dc47583 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -85,6 +85,46 @@
 
 XBZRLECacheStats xbzrle_counters;
 
+/* used by the search for pages to send */
+struct PageSearchStatus {
+    /* The migration channel used for a specific host page */
+    QEMUFile    *pss_channel;
+    /* Current block being searched */
+    RAMBlock    *block;
+    /* Current page to search from */
+    unsigned long page;
+    /* Set once we wrap around */
+    bool         complete_round;
+    /*
+     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
+     * postcopy.  When set, the request is "urgent" because the dest QEMU
+     * threads are waiting for us.
+     */
+    bool         postcopy_requested;
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
+    /* Whether we're sending a host page */
+    bool          host_page_sending;
+    /* The start/end of current host page.  Invalid if host_page_sending==false */
+    unsigned long host_page_start;
+    unsigned long host_page_end;
+};
+typedef struct PageSearchStatus PageSearchStatus;
+
 /* struct contains XBZRLE cache and a static page
    used by the compression */
 static struct {
@@ -319,6 +359,11 @@ typedef struct {
 struct RAMState {
     /* QEMUFile used for this migration */
     QEMUFile *f;
+    /*
+     * PageSearchStatus structures for the channels when send pages.
+     * Protected by the bitmap_mutex.
+     */
+    PageSearchStatus pss[RAM_CHANNEL_MAX];
     /* UFFD file descriptor, used in 'write-tracking' migration */
     int uffdio_fd;
     /* Last block that we have visited searching for dirty pages */
@@ -362,7 +407,12 @@ struct RAMState {
     uint64_t target_page_count;
     /* number of dirty bits in the bitmap */
     uint64_t migration_dirty_pages;
-    /* Protects modification of the bitmap and migration dirty pages */
+    /*
+     * Protects:
+     * - dirty/clear bitmap
+     * - migration_dirty_pages
+     * - pss structures
+     */
     QemuMutex bitmap_mutex;
     /* The RAMBlock used in the last src_page_requests */
     RAMBlock *last_req_rb;
@@ -451,46 +501,6 @@ void dirty_sync_missed_zero_copy(void)
     ram_counters.dirty_sync_missed_zero_copy++;
 }
 
-/* used by the search for pages to send */
-struct PageSearchStatus {
-    /* The migration channel used for a specific host page */
-    QEMUFile    *pss_channel;
-    /* Current block being searched */
-    RAMBlock    *block;
-    /* Current page to search from */
-    unsigned long page;
-    /* Set once we wrap around */
-    bool         complete_round;
-    /*
-     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
-     * postcopy.  When set, the request is "urgent" because the dest QEMU
-     * threads are waiting for us.
-     */
-    bool         postcopy_requested;
-    /*
-     * [POSTCOPY-ONLY] The target channel to use to send current page.
-     *
-     * Note: This may _not_ match with the value in postcopy_requested
-     * above. Let's imagine the case where the postcopy request is exactly
-     * the page that we're sending in progress during precopy. In this case
-     * we'll have postcopy_requested set to true but the target channel
-     * will be the precopy channel (so that we don't split brain on that
-     * specific page since the precopy channel already contains partial of
-     * that page data).
-     *
-     * Besides that specific use case, postcopy_target_channel should
-     * always be equal to postcopy_requested, because by default we send
-     * postcopy pages via postcopy preempt channel.
-     */
-    bool         postcopy_target_channel;
-    /* Whether we're sending a host page */
-    bool          host_page_sending;
-    /* The start/end of current host page.  Only valid if host_page_sending==true */
-    unsigned long host_page_start;
-    unsigned long host_page_end;
-};
-typedef struct PageSearchStatus PageSearchStatus;
-
 CompressionStats compression_counters;
 
 struct CompressParam {
@@ -2632,7 +2642,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
  */
 static int ram_find_and_save_block(RAMState *rs)
 {
-    PageSearchStatus pss;
+    PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
     int pages = 0;
     bool again, found;
 
@@ -2653,11 +2663,11 @@ static int ram_find_and_save_block(RAMState *rs)
         rs->last_page = 0;
     }
 
-    pss_init(&pss, rs->last_seen_block, rs->last_page);
+    pss_init(pss, rs->last_seen_block, rs->last_page);
 
     do {
         again = true;
-        found = get_queued_page(rs, &pss);
+        found = get_queued_page(rs, pss);
 
         if (!found) {
             /*
@@ -2665,27 +2675,27 @@ static int ram_find_and_save_block(RAMState *rs)
              * preempted precopy.  Otherwise find the next dirty bit.
              */
             if (postcopy_preempt_triggered(rs)) {
-                postcopy_preempt_restore(rs, &pss, false);
+                postcopy_preempt_restore(rs, pss, false);
                 found = true;
             } else {
                 /* priority queue empty, so just search for something dirty */
-                found = find_dirty_block(rs, &pss, &again);
+                found = find_dirty_block(rs, pss, &again);
             }
         }
 
         if (found) {
             /* Update rs->f with correct channel */
             if (postcopy_preempt_active()) {
-                postcopy_preempt_choose_channel(rs, &pss);
+                postcopy_preempt_choose_channel(rs, pss);
             }
             /* Cache rs->f in pss_channel (TODO: remove rs->f) */
-            pss.pss_channel = rs->f;
-            pages = ram_save_host_page(rs, &pss);
+            pss->pss_channel = rs->f;
+            pages = ram_save_host_page(rs, pss);
         }
     } while (!pages && again);
 
-    rs->last_seen_block = pss.block;
-    rs->last_page = pss.page;
+    rs->last_seen_block = pss->block;
+    rs->last_page = pss->page;
 
     return pages;
 }
-- 
2.37.3


