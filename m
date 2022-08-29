Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B75A530E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:23:29 +0200 (CEST)
Received: from localhost ([::1]:58766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSiTw-0001SV-Ul
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4k-0002ms-Ty
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4j-0008Hj-58
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661792244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9PZpoWjSYmjZlpIGj1RNi7dEGqI8ybiJeAb4fl779M=;
 b=P8hVXd+n6nrYYbA1aIh1Cg8+HmmKIVI3bAeRZgWfvf6z6bs42+e7yh+rUelxDUz6mp/yvM
 E5bKNKV0rALzZOnwRAyB5ZGEkbw560oYjYAp2CaWLj+dx4a9kmaGryNxBztA1S4wvhD0yg
 714UdNXmcoPVH2p2TVrLmfXD7yKbMcs=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-177-GfX_TjFUMNOIyglj3adIRg-1; Mon, 29 Aug 2022 12:57:23 -0400
X-MC-Unique: GfX_TjFUMNOIyglj3adIRg-1
Received: by mail-io1-f71.google.com with SMTP id
 q10-20020a0566022f0a00b00688d703717bso5017407iow.9
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=q9PZpoWjSYmjZlpIGj1RNi7dEGqI8ybiJeAb4fl779M=;
 b=DlcN7P35Hwvw7IxuP2JsksGyDCu87CphQfPB8F8cKGbpCDbawN0Ih08g+81UfKVOnF
 h3daqhvjYKbAEOsgU6rLSQketdXYe2GQZBIkTe47xprb3WS1rtn1Y71YPHq7tDxrcH03
 jJ5OKK78e5sC9uW/B1GjVMNbt/71ZXhAum5v44dXAS/68poXunjnEuMM2VtJ9H95RiYp
 PAervHj2vT6okelLQNFANowcAA+zU0P9mpmqlBiSgBHoAoXrKnpKKqZvr7GZ+fltBdvf
 ZBTV1ndUNZB7z/H728Ps1Nlj/6J53Nre51iVOyCLHnNKNMgEZDr21Lz6iDzTrHeEtZQl
 jMkA==
X-Gm-Message-State: ACgBeo1t5Hgutg2kay9Sjsei6amdUk7Wa0vPct+7ePO6cmiyCSz8PuCb
 GEGiOBhn6/vlrPHKTTM/T0Hw+JmYvRNnuIm5itk4wN6x5NKfaUHzarNbnPebMKd9sPZp+5N8JWk
 lYuwbCIET3T15KeOT2p9qgOCYpN5avziIB+w9pBz3pYgxJHB+RMhlM6zBboAVsHoT
X-Received: by 2002:a05:6638:160b:b0:346:ab00:9c7c with SMTP id
 x11-20020a056638160b00b00346ab009c7cmr10273050jas.241.1661792242575; 
 Mon, 29 Aug 2022 09:57:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7LXTMEZbQKBsGRxf5U15xCJH9zAWN2Ne1b08UiB7Y2RtP0U7tSyYtIk7Pc1faNuzukpMmV6Q==
X-Received: by 2002:a05:6638:160b:b0:346:ab00:9c7c with SMTP id
 x11-20020a056638160b00b00346ab009c7cmr10273037jas.241.1661792242268; 
 Mon, 29 Aug 2022 09:57:22 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b00344c3de5ec7sm4404709jas.150.2022.08.29.09.57.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Aug 2022 09:57:21 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 13/13] migration: Send requested page directly in
 rp-return thread
Date: Mon, 29 Aug 2022 12:56:59 -0400
Message-Id: <20220829165659.96046-14-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220829165659.96046-1-peterx@redhat.com>
References: <20220829165659.96046-1-peterx@redhat.com>
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

With all the facilities ready, send the requested page directly in the
rp-return thread rather than queuing it in the request queue, if and only
if postcopy preempt is enabled.  It can achieve so because it uses separate
channel for sending urgent pages.  The only shared data is bitmap and it's
protected by the bitmap_mutex.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index ef89812c69..e731a70255 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -539,6 +539,8 @@ static QemuThread *decompress_threads;
 static QemuMutex decomp_done_lock;
 static QemuCond decomp_done_cond;
 
+static int ram_save_host_page_urgent(PageSearchStatus *pss);
+
 static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf);
 
@@ -553,6 +555,16 @@ static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
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
@@ -2250,6 +2262,53 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
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
+        /* Always use the preempt channel, and make sure it's there */
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
@@ -2528,6 +2587,55 @@ static void pss_host_page_finish(PageSearchStatus *pss)
     pss->host_page_end = 0;
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
2.32.0


