Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854095FBDAB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:10:14 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNS1-0008K6-IY
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEY-0001if-Ee
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEW-0003We-E8
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bbh+5cOdAgAg8ohxLZtNxbjBjhrO6S04LcCKSTi0LvM=;
 b=IdfIvC6Q1RqlPR1EBRwLDVEUXPKAI8Gx++VhEVm5xlLtRFeIqUanlKBh8Da593P20/FJ80
 uBV1eIOe8RfFVP3i7pqx1DOAm0kSLo7DMBNBtNOKsEEcJIYQJ0Uu6XKEpP2Q3G9Exk4356
 1uPlys0Szy6jmMxgH6vxDF9vT14jyMQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-281-WnczVfoCNj-MM0r3mmLRfw-1; Tue, 11 Oct 2022 17:56:14 -0400
X-MC-Unique: WnczVfoCNj-MM0r3mmLRfw-1
Received: by mail-qk1-f200.google.com with SMTP id
 bq17-20020a05620a469100b006d2c613ebcbso12784610qkb.19
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bbh+5cOdAgAg8ohxLZtNxbjBjhrO6S04LcCKSTi0LvM=;
 b=mtTrkNtincjzr1zfo8bAyOcfBPIG1JlwgYld5/Qn0iHhEfX3iNA+/uuFlIMHjGKgq0
 T+Mk3hZ/J3mZQ5aK9TJ3+h/NlfjXkUo8jTFf00qirmUV1pqwxUhFXUWOXNfxwIZJ+5V4
 CKQQIOAGyUooC9RMOfnFaKnDB300IbVuJTkJ84neinNocfIMkljvjshIE740F/fcahvb
 id1zcMVpMykQCYG/01gdOS+JMK7cj/Jrvl6114JkFV6K3TGjpVaWuKbX5WnMJXOTtTQJ
 CVhvVrvt/xvAqwnH39bhcXKqV+ljdAS2JUVn919r3JAb41tW3oiDuxCHpRoVvNijLsTS
 4Diw==
X-Gm-Message-State: ACrzQf3ujXyDRKxYrteL74ZXC3lyRLhNse+91S/f6cx+PlKIZUaAShXH
 /3/WuiJW7tsv60nRZ+VgcGlZ228qknEjIpXQ0iSnaMqr8yx6aqb3v9tqqDk4ghIo5IdQrhhxc8G
 gPJIVoSDqM0ydgKjJnx8H3BTjFZRNbbAghE/tSgqYh/l2pgfvA4jhmvp9QxmMQj+z
X-Received: by 2002:a05:622a:92:b0:35d:58bc:4a4a with SMTP id
 o18-20020a05622a009200b0035d58bc4a4amr21737639qtw.391.1665525373713; 
 Tue, 11 Oct 2022 14:56:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4YIUD/A56uDUGKjXwzbsoO9FtSPXhwDN5zO+UNDUEcNlb7LDFKmwYRHrasqz4pbBge/kGYJw==
X-Received: by 2002:a05:622a:92:b0:35d:58bc:4a4a with SMTP id
 o18-20020a05622a009200b0035d58bc4a4amr21737624qtw.391.1665525373363; 
 Tue, 11 Oct 2022 14:56:13 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:12 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 09/15] migration: Introduce pss_channel
Date: Tue, 11 Oct 2022 17:55:53 -0400
Message-Id: <20221011215559.602584-10-peterx@redhat.com>
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

Introduce pss_channel for PageSearchStatus, define it as "the migration
channel to be used to transfer this host page".

We used to have rs->f, which is a mirror to MigrationState.to_dst_file.

After postcopy preempt initial version, rs->f can be dynamically changed
depending on which channel we want to use.

But that later work still doesn't grant full concurrency of sending pages
in e.g. different threads, because rs->f can either be the PRECOPY channel
or POSTCOPY channel.  This needs to be per-thread too.

PageSearchStatus is actually a good piece of struct which we can leverage
if we want to have multiple threads sending pages.  Sending a single guest
page may not make sense, so we make the granule to be "host page", and in
the PSS structure we allow specify a QEMUFile* to migrate a specific host
page.  Then we open the possibility to specify different channels in
different threads with different PSS structures.

The PSS prefix can be slightly misleading here because e.g. for the
upcoming usage of postcopy channel/thread it's not "searching" (or,
scanning) at all but sending the explicit page that was requested.  However
since PSS existed for some years keep it as-is until someone complains.

This patch mostly (simply) replace rs->f with pss->pss_channel only. No
functional change intended for this patch yet.  But it does prepare to
finally drop rs->f, and make ram_save_guest_page() thread safe.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 70 +++++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index ebb4737deb..d81dd3fdac 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -453,6 +453,8 @@ void dirty_sync_missed_zero_copy(void)
 
 /* used by the search for pages to send */
 struct PageSearchStatus {
+    /* The migration channel used for a specific host page */
+    QEMUFile    *pss_channel;
     /* Current block being searched */
     RAMBlock    *block;
     /* Current page to search from */
@@ -775,9 +777,9 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
-                            ram_addr_t current_addr, RAMBlock *block,
-                            ram_addr_t offset)
+static int save_xbzrle_page(RAMState *rs, QEMUFile *file,
+                            uint8_t **current_data, ram_addr_t current_addr,
+                            RAMBlock *block, ram_addr_t offset)
 {
     int encoded_len = 0, bytes_xbzrle;
     uint8_t *prev_cached_page;
@@ -845,11 +847,11 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
     }
 
     /* Send XBZRLE based compressed page */
-    bytes_xbzrle = save_page_header(rs, rs->f, block,
+    bytes_xbzrle = save_page_header(rs, file, block,
                                     offset | RAM_SAVE_FLAG_XBZRLE);
-    qemu_put_byte(rs->f, ENCODING_FLAG_XBZRLE);
-    qemu_put_be16(rs->f, encoded_len);
-    qemu_put_buffer(rs->f, XBZRLE.encoded_buf, encoded_len);
+    qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
+    qemu_put_be16(file, encoded_len);
+    qemu_put_buffer(file, XBZRLE.encoded_buf, encoded_len);
     bytes_xbzrle += encoded_len + 1 + 2;
     /*
      * Like compressed_size (please see update_compress_thread_counts),
@@ -1305,9 +1307,10 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
+static int save_zero_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
+                          ram_addr_t offset)
 {
-    int len = save_zero_page_to_file(rs, rs->f, block, offset);
+    int len = save_zero_page_to_file(rs, file, block, offset);
 
     if (len) {
         stat64_add(&ram_atomic_counters.duplicate, 1);
@@ -1324,15 +1327,15 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
  *
  * Return true if the pages has been saved, otherwise false is returned.
  */
-static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
-                              int *pages)
+static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
+                              ram_addr_t offset, int *pages)
 {
     uint64_t bytes_xmit = 0;
     int ret;
 
     *pages = -1;
-    ret = ram_control_save_page(rs->f, block->offset, offset, TARGET_PAGE_SIZE,
-                                &bytes_xmit);
+    ret = ram_control_save_page(pss->pss_channel, block->offset, offset,
+                                TARGET_PAGE_SIZE, &bytes_xmit);
     if (ret == RAM_SAVE_CONTROL_NOT_SUPP) {
         return false;
     }
@@ -1366,17 +1369,17 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
  * @buf: the page to be sent
  * @async: send to page asyncly
  */
-static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
-                            uint8_t *buf, bool async)
+static int save_normal_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
+                            ram_addr_t offset, uint8_t *buf, bool async)
 {
-    ram_transferred_add(save_page_header(rs, rs->f, block,
+    ram_transferred_add(save_page_header(rs, file, block,
                                          offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
-        qemu_put_buffer_async(rs->f, buf, TARGET_PAGE_SIZE,
+        qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
                               migrate_release_ram() &&
                               migration_in_postcopy());
     } else {
-        qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
+        qemu_put_buffer(file, buf, TARGET_PAGE_SIZE);
     }
     ram_transferred_add(TARGET_PAGE_SIZE);
     stat64_add(&ram_atomic_counters.normal, 1);
@@ -1409,8 +1412,8 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 
     XBZRLE_cache_lock();
     if (rs->xbzrle_enabled && !migration_in_postcopy()) {
-        pages = save_xbzrle_page(rs, &p, current_addr, block,
-                                 offset);
+        pages = save_xbzrle_page(rs, pss->pss_channel, &p, current_addr,
+                                 block, offset);
         if (!rs->last_stage) {
             /* Can't send this cached data async, since the cache page
              * might get updated before it gets to the wire
@@ -1421,7 +1424,8 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 
     /* XBZRLE overflow or normal page */
     if (pages == -1) {
-        pages = save_normal_page(rs, block, offset, p, send_async);
+        pages = save_normal_page(rs, pss->pss_channel, block, offset,
+                                 p, send_async);
     }
 
     XBZRLE_cache_unlock();
@@ -1429,10 +1433,10 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
     return pages;
 }
 
-static int ram_save_multifd_page(RAMState *rs, RAMBlock *block,
+static int ram_save_multifd_page(QEMUFile *file, RAMBlock *block,
                                  ram_addr_t offset)
 {
-    if (multifd_queue_page(rs->f, block, offset) < 0) {
+    if (multifd_queue_page(file, block, offset) < 0) {
         return -1;
     }
     stat64_add(&ram_atomic_counters.normal, 1);
@@ -1727,7 +1731,7 @@ static int ram_save_release_protection(RAMState *rs, PageSearchStatus *pss,
         uint64_t run_length = (pss->page - start_page) << TARGET_PAGE_BITS;
 
         /* Flush async buffers before un-protect. */
-        qemu_fflush(rs->f);
+        qemu_fflush(pss->pss_channel);
         /* Un-protect memory range. */
         res = uffd_change_protection(rs->uffdio_fd, page_address, run_length,
                 false, false);
@@ -2314,7 +2318,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
     ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
     int res;
 
-    if (control_save_page(rs, block, offset, &res)) {
+    if (control_save_page(pss, block, offset, &res)) {
         return res;
     }
 
@@ -2322,7 +2326,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
         return 1;
     }
 
-    res = save_zero_page(rs, block, offset);
+    res = save_zero_page(rs, pss->pss_channel, block, offset);
     if (res > 0) {
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
@@ -2342,7 +2346,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
      * still see partially copied pages which is data corruption.
      */
     if (migrate_use_multifd() && !migration_in_postcopy()) {
-        return ram_save_multifd_page(rs, block, offset);
+        return ram_save_multifd_page(pss->pss_channel, block, offset);
     }
 
     return ram_save_page(rs, pss);
@@ -2539,10 +2543,6 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         return 0;
     }
 
-    if (postcopy_preempt_active()) {
-        postcopy_preempt_choose_channel(rs, pss);
-    }
-
     /* Update host page boundary information */
     pss_host_page_prepare(pss);
 
@@ -2602,7 +2602,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
      * explicit flush or it won't flush until the buffer is full.
      */
     if (migrate_postcopy_preempt() && pss->postcopy_requested) {
-        qemu_fflush(rs->f);
+        qemu_fflush(pss->pss_channel);
     }
 
     res = ram_save_release_protection(rs, pss, start_page);
@@ -2668,6 +2668,12 @@ static int ram_find_and_save_block(RAMState *rs)
         }
 
         if (found) {
+            /* Update rs->f with correct channel */
+            if (postcopy_preempt_active()) {
+                postcopy_preempt_choose_channel(rs, &pss);
+            }
+            /* Cache rs->f in pss_channel (TODO: remove rs->f) */
+            pss.pss_channel = rs->f;
             pages = ram_save_host_page(rs, &pss);
         }
     } while (!pages && again);
-- 
2.37.3


