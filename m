Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208E55A530C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:23:24 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSiTq-0001JA-QV
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4f-0002eu-1n
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4d-0008Gp-9V
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661792238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Bs72gDpZQsQ5D8YLbgg7KPsy2uWBo73grO+mJOIV5o=;
 b=ha7hz5urDeSlKCZTMoIu7Ir23JLf/UAnAps4HdEBzpz2xUT28rSVpB7AjzEYHcea258mmz
 34ahNaQdb5FqzBV1Se1Zs4c/eUsvO+7/XBnKUMPFSdmJ9bvdrFAsCJST4tTb4PjcWjXLd0
 VyGLfLgHriGWI4TpHS8USLc33tBotyU=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-5i_4Oph0NQaGMiLbEYiGlg-1; Mon, 29 Aug 2022 12:57:17 -0400
X-MC-Unique: 5i_4Oph0NQaGMiLbEYiGlg-1
Received: by mail-il1-f200.google.com with SMTP id
 x7-20020a056e021ca700b002ea01be6018so6337470ill.18
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/Bs72gDpZQsQ5D8YLbgg7KPsy2uWBo73grO+mJOIV5o=;
 b=DUgrfFiFlEYMCmQaGwwlIkmysVVSImQkuMqq88jfgJZJ1ZxYqXpyqVtbMSuxWvqXoL
 d3oBWgcz4jd6nu8gwo6Sty3X9n32eQdRVFfFRWKSehN1EbO08UeXe8P246kloxz8vi0F
 JgcGxpRiO9vFptlGcpUgMt9WklYZk/SrDcUZGkL8r/jAqZft0RSjeu4veYcg9uTHWoXO
 +QUEIMPP6+EuPDrxG/aOaIdUU3m+HA9gMTSctXmhSfHAQSQYZPstGvxa5yBIx4MxMZ0w
 OkndeAAhVKk+0EdlQqN8/WN+ilhrI6UVrR3JzpDWUU6dUF3bkjshRiIcp0otbw+Joeug
 EYzQ==
X-Gm-Message-State: ACgBeo2mROXg96vedOXJiCbX+6pboV1scXM39TOuK8vMeCfPMj/Qszxm
 S0Y9coz8Yh/p7fBFi9L6/uLf1pgP6wufaDsmI/jPqrkrHuH5IYLogfBPc7elqKz+ag5qaDNPdgj
 Sha0UGSye4qxoQkCox+BeoZZwt0J4X+PrOPr6dX7o47B69MDfo3CWXHEjfxWwvpfl
X-Received: by 2002:a05:6602:3cc:b0:678:eb57:5eb with SMTP id
 g12-20020a05660203cc00b00678eb5705ebmr8765829iov.125.1661792235239; 
 Mon, 29 Aug 2022 09:57:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4uqVkBZMYVaOFNPuul+BSN6lFO6VNnljefQhoTSCblj4Uv7yVfgHvtWwoIluLq/lC5VRdhNA==
X-Received: by 2002:a05:6602:3cc:b0:678:eb57:5eb with SMTP id
 g12-20020a05660203cc00b00678eb5705ebmr8765806iov.125.1661792234815; 
 Mon, 29 Aug 2022 09:57:14 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b00344c3de5ec7sm4404709jas.150.2022.08.29.09.57.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Aug 2022 09:57:14 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 08/13] migration: Teach PSS about host page
Date: Mon, 29 Aug 2022 12:56:54 -0400
Message-Id: <20220829165659.96046-9-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220829165659.96046-1-peterx@redhat.com>
References: <20220829165659.96046-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Migration code has a lot to do with host pages.  Teaching PSS core about
the idea of host page helps a lot and makes the code clean.  Meanwhile,
this prepares for the future changes that can leverage the new PSS helpers
that this patch introduces to send host page in another thread.

Three more fields are introduced for this:

  (1) host_page_sending: this is set to true when QEMU is sending a host
      page, false otherwise.

  (2) host_page_{start|end}: this points to the end of host page, and it's
      only valid when host_page_sending==true.

For example, when we look up the next dirty page on the ramblock, with
host_page_sending==true, we'll not even try to look for anything beyond the
current host page.  This can be efficient than current code because
currently we'll set pss->page to next dirty bit (which can be over current
host page) and reset it to host page boundary if we found overflow.  The
latter is not efficient as we don't need to scan over host page boundary.

Meanwhile with above, we can easily make migration_bitmap_find_dirty() self
contained by updating pss->page properly.  rs* parameter is removed because
it's not even used in old code.

When sending a host page, we should use the pss helpers like this:

  - pss_host_page_prepare(pss): called before sending host page
  - pss_within_range(pss): whether we're still working on the cur host page?
  - pss_host_page_finish(pss): called after sending a host page

If there'll be another function to send host page (e.g. in return path
thread) in the future, it should follow the same style.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 91 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 73 insertions(+), 18 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 2f37520be4..e2b922ad59 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -474,6 +474,11 @@ struct PageSearchStatus {
      * postcopy pages via postcopy preempt channel.
      */
     bool         postcopy_target_channel;
+    /* Whether we're sending a host page */
+    bool          host_page_sending;
+    /* The start/end of current host page.  Invalid if host_page_sending==false */
+    unsigned long host_page_start;
+    unsigned long host_page_end;
 };
 typedef struct PageSearchStatus PageSearchStatus;
 
@@ -851,26 +856,36 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
 }
 
 /**
- * migration_bitmap_find_dirty: find the next dirty page from start
+ * pss_find_next_dirty: find the next dirty page of current ramblock
  *
- * Returns the page offset within memory region of the start of a dirty page
+ * This function updates pss->page to point to the next dirty page index
+ * within the ramblock, or the end of ramblock when nothing found.
  *
  * @rs: current RAM state
- * @rb: RAMBlock where to search for dirty pages
- * @start: page where we start the search
+ * @pss: the current page search status
  */
-static inline
-unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
-                                          unsigned long start)
+static void pss_find_next_dirty(PageSearchStatus *pss)
 {
+    RAMBlock *rb = pss->block;
     unsigned long size = rb->used_length >> TARGET_PAGE_BITS;
     unsigned long *bitmap = rb->bmap;
 
     if (ramblock_is_ignored(rb)) {
-        return size;
+        /* Points directly to the end, so we know no dirty page */
+        pss->page = size;
+        return;
     }
 
-    return find_next_bit(bitmap, size, start);
+    /*
+     * If during sending a host page, only look for dirty pages within the
+     * current host page being send.
+     */
+    if (pss->host_page_sending) {
+        assert(pss->host_page_end);
+        size = MIN(size, pss->host_page_end);
+    }
+
+    pss->page = find_next_bit(bitmap, size, pss->page);
 }
 
 static void migration_clear_memory_region_dirty_bitmap(RAMBlock *rb,
@@ -1555,7 +1570,9 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
     pss->postcopy_requested = false;
     pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
 
-    pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
+    /* Update pss->page for the next dirty bit in ramblock */
+    pss_find_next_dirty(pss);
+
     if (pss->complete_round && pss->block == rs->last_seen_block &&
         pss->page >= rs->last_page) {
         /*
@@ -2445,6 +2462,44 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
     }
 }
 
+/* Should be called before sending a host page */
+static void pss_host_page_prepare(PageSearchStatus *pss)
+{
+    /* How many guest pages are there in one host page? */
+    size_t guest_pfns = qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
+
+    pss->host_page_sending = true;
+    pss->host_page_start = ROUND_DOWN(pss->page, guest_pfns);
+    pss->host_page_end = ROUND_UP(pss->page + 1, guest_pfns);
+}
+
+/*
+ * Whether the page pointed by PSS is within the host page being sent.
+ * Must be called after a previous pss_host_page_prepare().
+ */
+static bool pss_within_range(PageSearchStatus *pss)
+{
+    ram_addr_t ram_addr;
+
+    assert(pss->host_page_sending);
+
+    /* Over host-page boundary? */
+    if (pss->page >= pss->host_page_end) {
+        return false;
+    }
+
+    ram_addr = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
+
+    return offset_in_ramblock(pss->block, ram_addr);
+}
+
+static void pss_host_page_finish(PageSearchStatus *pss)
+{
+    pss->host_page_sending = false;
+    /* This is not needed, but just to reset it */
+    pss->host_page_end = 0;
+}
+
 /**
  * ram_save_host_page: save a whole host page
  *
@@ -2466,8 +2521,6 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     int tmppages, pages = 0;
     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
-    unsigned long hostpage_boundary =
-        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
     unsigned long start_page = pss->page;
     bool page_dirty;
     int res;
@@ -2481,6 +2534,9 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         postcopy_preempt_choose_channel(rs, pss);
     }
 
+    /* Update host page boundary information */
+    pss_host_page_prepare(pss);
+
     do {
         if (postcopy_needs_preempt(rs, pss)) {
             postcopy_do_preempt(rs, pss);
@@ -2519,15 +2575,14 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         }
 
         if (tmppages < 0) {
+            pss_host_page_finish(pss);
             return tmppages;
         }
 
-        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
-    } while ((pss->page < hostpage_boundary) &&
-             offset_in_ramblock(pss->block,
-                                ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
-    /* The offset we leave with is the min boundary of host page and block */
-    pss->page = MIN(pss->page, hostpage_boundary);
+        pss_find_next_dirty(pss);
+    } while (pss_within_range(pss));
+
+    pss_host_page_finish(pss);
 
     /*
      * When with postcopy preempt mode, flush the data as soon as possible for
-- 
2.32.0


