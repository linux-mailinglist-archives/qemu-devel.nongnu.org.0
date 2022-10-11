Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80C65FBDB3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:13:34 +0200 (CEST)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNVF-0005XT-NZ
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEd-0001nE-1Q
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEa-0003XB-4H
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kR9egZ9JBYzulwkdfsWySbQN0WL+vswze1lfOjbCC5k=;
 b=LFqFZu7nAXEK46iYmBIu64qvE4NVXkHWcAZCltg0CS9i7CziDQl8mvIjxaFgMWUa7J4+BH
 gWCJ/hQhupXhE5aSY+pYbC1uN0lw8KkKpZjuEYHm46NaJNOMlUQzbz4SlgEuE1uOpeAu6L
 ZN1hgwC75Hbms6kGZZ/WVlSICbkXqbc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-5g0k6xK8M8G68LHJtH8ahQ-1; Tue, 11 Oct 2022 17:56:13 -0400
X-MC-Unique: 5g0k6xK8M8G68LHJtH8ahQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 y2-20020a0ce802000000b004b1ce1c4a70so8699142qvn.9
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kR9egZ9JBYzulwkdfsWySbQN0WL+vswze1lfOjbCC5k=;
 b=kgEcsPUhb/O4Ru5vUJDg3QLfS1L2QRBJfCtMDmBkxkNaXrsStIaz1P7coHhqUQUh5z
 Yl5EmN7EV++0HQOlmTRd54A7ZMrGVgCQDUp+ddkzcc+MJG9Wuie7wFfWGIwn5o/omjIo
 i1xKS03w6ax3o0GjDkmYEJK5u/0jn+VVfSJ7y3BYxXXDXXlJ5cXjtT9b9Nj1O6rvmodv
 zgYFeEsOgDgs/rt+zNRpPjaKxatvtfbSZu0nF94g9sEDWfxRb2frySWH+gZfQG6VRbZb
 ThPtgHIKreL9GTgiq3PRjl+MyLHjXZ4/nEjdSiXicfq12Xz8cKhl86tuGcOFR9+1KXbN
 4lkg==
X-Gm-Message-State: ACrzQf1jIn0vaemm3yOWzQgDLVv0zxGkC8DjnVgBaWxgQ1dnIacn5Gcj
 t0/dWhnkXznHkqMLelBYkg/bJzC8hkVzSeX3R/JgLdVHPaBQWwOsKnX+lZe3GphWynoFc8BXQVz
 Zt1tZoD8qkhWd/gNOyHgizc+yyAwunOmUa+F6rQD09IjA/GHcdgTsT1bTsoXFsdot
X-Received: by 2002:a05:622a:181:b0:39c:bd89:7b9 with SMTP id
 s1-20020a05622a018100b0039cbd8907b9mr862575qtw.590.1665525372438; 
 Tue, 11 Oct 2022 14:56:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uNwwMiFHccYo2+OzyDnw34OwNbloFELgao6KY0T5cgKqn73qGzWA2WtWr94V5my/3Kah+Fg==
X-Received: by 2002:a05:622a:181:b0:39c:bd89:7b9 with SMTP id
 s1-20020a05622a018100b0039cbd8907b9mr862550qtw.590.1665525372091; 
 Tue, 11 Oct 2022 14:56:12 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:11 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 08/15] migration: Teach PSS about host page
Date: Tue, 11 Oct 2022 17:55:52 -0400
Message-Id: <20221011215559.602584-9-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011215559.602584-1-peterx@redhat.com>
References: <20221011215559.602584-1-peterx@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Migration code has a lot to do with host pages.  Teaching PSS core about
the idea of host page helps a lot and makes the code clean.  Meanwhile,
this prepares for the future changes that can leverage the new PSS helpers
that this patch introduces to send host page in another thread.

Three more fields are introduced for this:

  (1) host_page_sending: this is set to true when QEMU is sending a host
      page, false otherwise.

  (2) host_page_{start|end}: these point to the start/end of host page
      we're sending, and it's only valid when host_page_sending==true.

For example, when we look up the next dirty page on the ramblock, with
host_page_sending==true, we'll not try to look for anything beyond the
current host page boundary.  This can be slightly efficient than current
code because currently we'll set pss->page to next dirty bit (which can be
over current host page boundary) and reset it to host page boundary if we
found it goes beyond that.

With above, we can easily make migration_bitmap_find_dirty() self contained
by updating pss->page properly.  rs* parameter is removed because it's not
even used in old code.

When sending a host page, we should use the pss helpers like this:

  - pss_host_page_prepare(pss): called before sending host page
  - pss_within_range(pss): whether we're still working on the cur host page?
  - pss_host_page_finish(pss): called after sending a host page

Then we can use ram_save_target_page() to save one small page.

Currently ram_save_host_page() is still the only user. If there'll be
another function to send host page (e.g. in return path thread) in the
future, it should follow the same style.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 95 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 76 insertions(+), 19 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index f5a86265c7..ebb4737deb 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -481,6 +481,11 @@ struct PageSearchStatus {
      * postcopy pages via postcopy preempt channel.
      */
     bool         postcopy_target_channel;
+    /* Whether we're sending a host page */
+    bool          host_page_sending;
+    /* The start/end of current host page.  Only valid if host_page_sending==true */
+    unsigned long host_page_start;
+    unsigned long host_page_end;
 };
 typedef struct PageSearchStatus PageSearchStatus;
 
@@ -858,26 +863,38 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
 }
 
 /**
- * migration_bitmap_find_dirty: find the next dirty page from start
+ * pss_find_next_dirty: find the next dirty page of current ramblock
  *
- * Returns the page offset within memory region of the start of a dirty page
+ * This function updates pss->page to point to the next dirty page index
+ * within the ramblock to migrate, or the end of ramblock when nothing
+ * found.  Note that when pss->host_page_sending==true it means we're
+ * during sending a host page, so we won't look for dirty page that is
+ * outside the host page boundary.
  *
- * @rs: current RAM state
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
+    }
+
+    /*
+     * If during sending a host page, only look for dirty pages within the
+     * current host page being send.
+     */
+    if (pss->host_page_sending) {
+        assert(pss->host_page_end);
+        size = MIN(size, pss->host_page_end);
     }
 
-    return find_next_bit(bitmap, size, start);
+    pss->page = find_next_bit(bitmap, size, pss->page);
 }
 
 static void migration_clear_memory_region_dirty_bitmap(RAMBlock *rb,
@@ -1563,7 +1580,9 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
     pss->postcopy_requested = false;
     pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
 
-    pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
+    /* Update pss->page for the next dirty bit in ramblock */
+    pss_find_next_dirty(pss);
+
     if (pss->complete_round && pss->block == rs->last_seen_block &&
         pss->page >= rs->last_page) {
         /*
@@ -2452,6 +2471,44 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
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
+    pss->host_page_start = pss->host_page_end = 0;
+}
+
 /**
  * ram_save_host_page: save a whole host page
  *
@@ -2474,8 +2531,6 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     int tmppages, pages = 0;
     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
-    unsigned long hostpage_boundary =
-        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
     unsigned long start_page = pss->page;
     int res;
 
@@ -2488,6 +2543,9 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         postcopy_preempt_choose_channel(rs, pss);
     }
 
+    /* Update host page boundary information */
+    pss_host_page_prepare(pss);
+
     do {
         if (postcopy_needs_preempt(rs, pss)) {
             postcopy_do_preempt(rs, pss);
@@ -2525,15 +2583,14 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
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
2.37.3


