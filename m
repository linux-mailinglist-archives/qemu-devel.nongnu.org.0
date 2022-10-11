Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE43E5FBDB6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:14:08 +0200 (CEST)
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNVn-00073a-Tm
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEc-0001lv-2A
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEa-0003X8-0K
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qNprFr/1eDDP3j4T1lBYpK9pi5Brj0EwR/Px1PnJqw=;
 b=DdqFSR1jeSp8VQ54/9+O3DFjbijVDtU0jDYr30vOkJHlhrQQbNUTHIv24IIZCdel2UBHyG
 ICmY58yyx4VYDQzp0HXcDwXxv/V0FM69kWigj3v0Es0IO+d336xET3jL6KRaF/RFASLgCm
 cz+PRTjGuYW99inayyl/awwI3TZOHBU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15-HP-mxFUROUC7v51PU5MuJA-1; Tue, 11 Oct 2022 17:56:18 -0400
X-MC-Unique: HP-mxFUROUC7v51PU5MuJA-1
Received: by mail-qk1-f198.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so12706059qko.18
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qNprFr/1eDDP3j4T1lBYpK9pi5Brj0EwR/Px1PnJqw=;
 b=Yjr79HSEa6JiK/7wKhvNsj8LSaK1BuzX0AbXGc+tJQjPYXpWWyZZbiWg89l5LOYDaV
 GVZ5JNtzmRved8EwAPEoFJpgav1D3dvN8Ly35RBKdun6Qe5u82J0wAlRl5Y2bEqGeD4b
 2W8TieBnoZiLhz2P8BthBCEh9+NSul+4fEOfvzdkrCfPVOzvZeN3QQnZ/9yD8ke4SYL8
 C9WEpUbyB+L94dpNKPPZG52raYUfDQS0unHZ3nDk7vsTQBFjjtavOfbTjN7byz1X3Fhw
 gUaFZmR+NljI5Mg22KNNvG7j5LmVIELTP4S9T4Q2Ccs24ntVKPqE4SYNMmHoAiveWGgT
 ksuA==
X-Gm-Message-State: ACrzQf0pFVvwivwjBxYX9RSLzqa37H+/0VZ01ZyxPnt1uiteOmmyxuA/
 diVXQsTxP8UpRmecaDVBBEl7P8D2DyXa5Nuc7sjI5gqa5wm9OQypXJ1hTuhRCooxaCwwJz56C6+
 JrW2HclQ22GOCCo9VctJHSU3nl/jSfOz0LUMh7XhRURN09f0E4tnQVxRCbrAfgO2l
X-Received: by 2002:a05:620a:1706:b0:6ce:9b88:92a4 with SMTP id
 az6-20020a05620a170600b006ce9b8892a4mr17821553qkb.555.1665525377509; 
 Tue, 11 Oct 2022 14:56:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7zdlJA+P9Y7bD0Dhntin3nK7AWBEovJCVJj6s71/WARyeXUybKoLZ/5hQctECRnwTuDPzttg==
X-Received: by 2002:a05:620a:1706:b0:6ce:9b88:92a4 with SMTP id
 az6-20020a05620a170600b006ce9b8892a4mr17821528qkb.555.1665525377134; 
 Tue, 11 Oct 2022 14:56:17 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:16 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 12/15] migration: Move last_sent_block into PageSearchStatus
Date: Tue, 11 Oct 2022 17:55:56 -0400
Message-Id: <20221011215559.602584-13-peterx@redhat.com>
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

Since we use PageSearchStatus to represent a channel, it makes perfect
sense to keep last_sent_block (aka, leverage RAM_SAVE_FLAG_CONTINUE) to be
per-channel rather than global because each channel can be sending
different pages on ramblocks.

Hence move it from RAMState into PageSearchStatus.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 71 ++++++++++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 30 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 486dc47583..cbaa5650b8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -89,6 +89,8 @@ XBZRLECacheStats xbzrle_counters;
 struct PageSearchStatus {
     /* The migration channel used for a specific host page */
     QEMUFile    *pss_channel;
+    /* Last block from where we have sent data */
+    RAMBlock *last_sent_block;
     /* Current block being searched */
     RAMBlock    *block;
     /* Current page to search from */
@@ -368,8 +370,6 @@ struct RAMState {
     int uffdio_fd;
     /* Last block that we have visited searching for dirty pages */
     RAMBlock *last_seen_block;
-    /* Last block from where we have sent data */
-    RAMBlock *last_sent_block;
     /* Last dirty target page we have sent */
     ram_addr_t last_page;
     /* last ram version we have seen */
@@ -684,16 +684,17 @@ exit:
  *
  * Returns the number of bytes written
  *
- * @f: QEMUFile where to send the data
+ * @pss: current PSS channel status
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  *          in the lower bits, it contains flags
  */
-static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
+static size_t save_page_header(PageSearchStatus *pss, RAMBlock *block,
                                ram_addr_t offset)
 {
     size_t size, len;
-    bool same_block = (block == rs->last_sent_block);
+    bool same_block = (block == pss->last_sent_block);
+    QEMUFile *f = pss->pss_channel;
 
     if (same_block) {
         offset |= RAM_SAVE_FLAG_CONTINUE;
@@ -706,7 +707,7 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
         qemu_put_byte(f, len);
         qemu_put_buffer(f, (uint8_t *)block->idstr, len);
         size += 1 + len;
-        rs->last_sent_block = block;
+        pss->last_sent_block = block;
     }
     return size;
 }
@@ -790,17 +791,19 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
  *          -1 means that xbzrle would be longer than normal
  *
  * @rs: current RAM state
+ * @pss: current PSS channel
  * @current_data: pointer to the address of the page contents
  * @current_addr: addr of the page
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_xbzrle_page(RAMState *rs, QEMUFile *file,
+static int save_xbzrle_page(RAMState *rs, PageSearchStatus *pss,
                             uint8_t **current_data, ram_addr_t current_addr,
                             RAMBlock *block, ram_addr_t offset)
 {
     int encoded_len = 0, bytes_xbzrle;
     uint8_t *prev_cached_page;
+    QEMUFile *file = pss->pss_channel;
 
     if (!cache_is_cached(XBZRLE.cache, current_addr,
                          ram_counters.dirty_sync_count)) {
@@ -865,7 +868,7 @@ static int save_xbzrle_page(RAMState *rs, QEMUFile *file,
     }
 
     /* Send XBZRLE based compressed page */
-    bytes_xbzrle = save_page_header(rs, file, block,
+    bytes_xbzrle = save_page_header(pss, block,
                                     offset | RAM_SAVE_FLAG_XBZRLE);
     qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
     qemu_put_be16(file, encoded_len);
@@ -1296,19 +1299,19 @@ static void ram_release_page(const char *rbname, uint64_t offset)
  * Returns the size of data written to the file, 0 means the page is not
  * a zero page
  *
- * @rs: current RAM state
- * @file: the file where the data is saved
+ * @pss: current PSS channel
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
+static int save_zero_page_to_file(PageSearchStatus *pss,
                                   RAMBlock *block, ram_addr_t offset)
 {
     uint8_t *p = block->host + offset;
+    QEMUFile *file = pss->pss_channel;
     int len = 0;
 
     if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
-        len += save_page_header(rs, file, block, offset | RAM_SAVE_FLAG_ZERO);
+        len += save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZERO);
         qemu_put_byte(file, 0);
         len += 1;
         ram_release_page(block->idstr, offset);
@@ -1321,14 +1324,14 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
  *
  * Returns the number of pages written.
  *
- * @rs: current RAM state
+ * @pss: current PSS channel
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
+static int save_zero_page(PageSearchStatus *pss, RAMBlock *block,
                           ram_addr_t offset)
 {
-    int len = save_zero_page_to_file(rs, file, block, offset);
+    int len = save_zero_page_to_file(pss, block, offset);
 
     if (len) {
         stat64_add(&ram_atomic_counters.duplicate, 1);
@@ -1381,16 +1384,18 @@ static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
  *
  * Returns the number of pages written.
  *
- * @rs: current RAM state
+ * @pss: current PSS channel
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  * @buf: the page to be sent
  * @async: send to page asyncly
  */
-static int save_normal_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
+static int save_normal_page(PageSearchStatus *pss, RAMBlock *block,
                             ram_addr_t offset, uint8_t *buf, bool async)
 {
-    ram_transferred_add(save_page_header(rs, file, block,
+    QEMUFile *file = pss->pss_channel;
+
+    ram_transferred_add(save_page_header(pss, block,
                                          offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
         qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
@@ -1430,7 +1435,7 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 
     XBZRLE_cache_lock();
     if (rs->xbzrle_enabled && !migration_in_postcopy()) {
-        pages = save_xbzrle_page(rs, pss->pss_channel, &p, current_addr,
+        pages = save_xbzrle_page(rs, pss, &p, current_addr,
                                  block, offset);
         if (!rs->last_stage) {
             /* Can't send this cached data async, since the cache page
@@ -1442,8 +1447,7 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
 
     /* XBZRLE overflow or normal page */
     if (pages == -1) {
-        pages = save_normal_page(rs, pss->pss_channel, block, offset,
-                                 p, send_async);
+        pages = save_normal_page(pss, block, offset, p, send_async);
     }
 
     XBZRLE_cache_unlock();
@@ -1466,14 +1470,15 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf)
 {
     RAMState *rs = ram_state;
+    PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
     uint8_t *p = block->host + offset;
     int ret;
 
-    if (save_zero_page_to_file(rs, f, block, offset)) {
+    if (save_zero_page_to_file(pss, block, offset)) {
         return true;
     }
 
-    save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
+    save_page_header(pss, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
 
     /*
      * copy it to a internal buffer to avoid it being modified by VM
@@ -2293,7 +2298,8 @@ static bool save_page_use_compression(RAMState *rs)
  * has been properly handled by compression, otherwise needs other
  * paths to handle it
  */
-static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
+static bool save_compress_page(RAMState *rs, PageSearchStatus *pss,
+                               RAMBlock *block, ram_addr_t offset)
 {
     if (!save_page_use_compression(rs)) {
         return false;
@@ -2309,7 +2315,7 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
      * We post the fist page as normal page as compression will take
      * much CPU resource.
      */
-    if (block != rs->last_sent_block) {
+    if (block != pss->last_sent_block) {
         flush_compressed_data(rs);
         return false;
     }
@@ -2340,11 +2346,11 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
         return res;
     }
 
-    if (save_compress_page(rs, block, offset)) {
+    if (save_compress_page(rs, pss, block, offset)) {
         return 1;
     }
 
-    res = save_zero_page(rs, pss->pss_channel, block, offset);
+    res = save_zero_page(pss, block, offset);
     if (res > 0) {
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
@@ -2475,7 +2481,7 @@ static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
          * If channel switched, reset last_sent_block since the old sent block
          * may not be on the same channel.
          */
-        rs->last_sent_block = NULL;
+        pss->last_sent_block = NULL;
 
         trace_postcopy_preempt_switch_channel(channel);
     }
@@ -2809,8 +2815,13 @@ static void ram_save_cleanup(void *opaque)
 
 static void ram_state_reset(RAMState *rs)
 {
+    int i;
+
+    for (i = 0; i < RAM_CHANNEL_MAX; i++) {
+        rs->pss[i].last_sent_block = NULL;
+    }
+
     rs->last_seen_block = NULL;
-    rs->last_sent_block = NULL;
     rs->last_page = 0;
     rs->last_version = ram_list.version;
     rs->xbzrle_enabled = false;
@@ -3004,8 +3015,8 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms)
     migration_bitmap_sync(rs);
 
     /* Easiest way to make sure we don't resume in the middle of a host-page */
+    rs->pss[RAM_CHANNEL_PRECOPY].last_sent_block = NULL;
     rs->last_seen_block = NULL;
-    rs->last_sent_block = NULL;
     rs->last_page = 0;
 
     postcopy_each_ram_send_discard(ms);
-- 
2.37.3


