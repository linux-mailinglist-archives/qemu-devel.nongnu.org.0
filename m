Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C44936B8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:59:08 +0100 (CET)
Received: from localhost ([::1]:40420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6o7-0001a4-0G
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:59:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62i-00072W-3U
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62f-0000zt-R3
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgXSsm4TobC9VeROQOkPev+2EEsMYK5pH9blVW1j0Ww=;
 b=c4mmYXlj8eB/jv/+qPIXWOOz1TyY8eK60W2UcC4In/Gn2DNFXmZVcmo3QAiuJviBITcycB
 xKMEhhg5BmdRzvLZy/Xl+rmC6ZIM/HHBo9eoL1n++LZWd+jpLBL5qtmN/0yyxbf79ZmXmr
 qZDyt55rt4Rh2fH2od09bSRbjh5VPnM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-1bKFoq8AO-mmyw_7Dh5MxA-1; Wed, 19 Jan 2022 03:10:03 -0500
X-MC-Unique: 1bKFoq8AO-mmyw_7Dh5MxA-1
Received: by mail-wm1-f70.google.com with SMTP id
 f7-20020a1cc907000000b0034b63f314ccso1328196wmb.6
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZgXSsm4TobC9VeROQOkPev+2EEsMYK5pH9blVW1j0Ww=;
 b=jqjGAaoTS7SmSfXhxTRhc1lz+jR+aGT8T1f8NTmIIpWbZ/pvVDNRbQPZ+23hxgNjvP
 4KF7wJpIPlqnHQie0Gc3LqWXxgngDeKZkgGL7N7ZReF7tZWxu/KkI2hFxl1m7CiGSqOW
 5t5ur/Q8h6tWX7pjRcFJUcFQRafUmGZaoI0afGtOroNbr0ExNf62UOfb00r+fTNuAN1e
 xpMlraNNBIvMnl50LS+/cG+yxmX/V+qBV97qivan2nIppPaZUyOMmVffnjdHXYCZUQQz
 aN52Q7wkH0yrK6UFOH1aBA7/QcuJQrvQ9SgzsYiYgIWz9iyoMOgnpQzG+dDjXULpPqan
 FNdQ==
X-Gm-Message-State: AOAM531ZeWHz1S24afYuL5lpvBfigFBJnXKDLBkYBgMNE81LOsu9kt6y
 tCocpjk1oIKY7B3OYQljxtYcJsEZJwG1/62NCJbz2O6FaXGn++eK8Iuv5DAHVONpys1VDiuqNBA
 cRiU3ANXA/t0B09aABIWVIyir4uIv1cqsWID8/Ubil7Jug5idmZuENec6yubeReis
X-Received: by 2002:a5d:4ad2:: with SMTP id y18mr27753902wrs.141.1642579801528; 
 Wed, 19 Jan 2022 00:10:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9HNYyGr7BYHOnFdIxA2U9phmfkzn7k9/TNtuzKUXOKkGo/c9ZyY6ZR0yQMzSpP2DjeCDm3w==
X-Received: by 2002:a5d:4ad2:: with SMTP id y18mr27753882wrs.141.1642579801277; 
 Wed, 19 Jan 2022 00:10:01 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.09.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:10:00 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 05/15] migration: Simplify unqueue_page()
Date: Wed, 19 Jan 2022 16:09:19 +0800
Message-Id: <20220119080929.39485-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch simplifies unqueue_page() on both sides of it (itself, and caller).

Firstly, due to the fact that right after unqueue_page() returned true, we'll
definitely send a huge page (see ram_save_huge_page() call - it will _never_
exit before finish sending that huge page), so unqueue_page() does not need to
jump in small page size if huge page is enabled on the ramblock.  IOW, it's
destined that only the 1st 4K page will be valid, when unqueue the 2nd+ time
we'll notice the whole huge page has already been sent anyway.  Switching to
operating on huge page reduces a lot of the loops of redundant unqueue_page().

Meanwhile, drop the dirty check.  It's not helpful to call test_bit() every
time to jump over clean pages, as ram_save_host_page() has already done so,
while in a faster way (see commit ba1b7c812c ("migration/ram: Optimize
ram_save_host_page()", 2021-05-13)).  So that's not necessary too.

Drop the two tracepoints along the way - based on above analysis it's very
possible that no one is really using it..

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c        | 34 ++++++++--------------------------
 migration/trace-events |  2 --
 2 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index dc6ba041fa..0df15ff663 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1541,6 +1541,7 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
 {
     struct RAMSrcPageRequest *entry;
     RAMBlock *block = NULL;
+    size_t page_size;
 
     if (!postcopy_has_request(rs)) {
         return NULL;
@@ -1557,10 +1558,13 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
     entry = QSIMPLEQ_FIRST(&rs->src_page_requests);
     block = entry->rb;
     *offset = entry->offset;
+    page_size = qemu_ram_pagesize(block);
+    /* Each page request should only be multiple page size of the ramblock */
+    assert((entry->len % page_size) == 0);
 
-    if (entry->len > TARGET_PAGE_SIZE) {
-        entry->len -= TARGET_PAGE_SIZE;
-        entry->offset += TARGET_PAGE_SIZE;
+    if (entry->len > page_size) {
+        entry->len -= page_size;
+        entry->offset += page_size;
     } else {
         memory_region_unref(block->mr);
         QSIMPLEQ_REMOVE_HEAD(&rs->src_page_requests, next_req);
@@ -1942,30 +1946,8 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
 {
     RAMBlock  *block;
     ram_addr_t offset;
-    bool dirty;
 
-    do {
-        block = unqueue_page(rs, &offset);
-        /*
-         * We're sending this page, and since it's postcopy nothing else
-         * will dirty it, and we must make sure it doesn't get sent again
-         * even if this queue request was received after the background
-         * search already sent it.
-         */
-        if (block) {
-            unsigned long page;
-
-            page = offset >> TARGET_PAGE_BITS;
-            dirty = test_bit(page, block->bmap);
-            if (!dirty) {
-                trace_get_queued_page_not_dirty(block->idstr, (uint64_t)offset,
-                                                page);
-            } else {
-                trace_get_queued_page(block->idstr, (uint64_t)offset, page);
-            }
-        }
-
-    } while (block && !dirty);
+    block = unqueue_page(rs, &offset);
 
     if (!block) {
         /*
diff --git a/migration/trace-events b/migration/trace-events
index e165687af2..3a9b3567ae 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -85,8 +85,6 @@ put_qlist_end(const char *field_name, const char *vmsd_name) "%s(%s)"
 qemu_file_fclose(void) ""
 
 # ram.c
-get_queued_page(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
-get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
 migration_bitmap_sync_start(void) ""
 migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
 migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, unsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
-- 
2.32.0


