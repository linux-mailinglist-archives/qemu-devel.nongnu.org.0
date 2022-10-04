Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2936B5F4955
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 20:36:51 +0200 (CEST)
Received: from localhost ([::1]:39742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofmmg-0008Ap-34
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 14:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmb3-0007Sr-AJ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmax-0005f7-7E
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664907878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfnQWUDa5K7pjPq/3m1YfD6y3lwpZcpfMbX0SIbFgHE=;
 b=XwsPmxjApwVF7YgwQ7J7QMo2amF/L0wU09sFDJbpZAyKEkHnoi2UJseRBsOI9PT8QzQtSR
 0OxjGUnCIAlZ5WyxHXZQGfrU8ZMlftHK+upvYZBbHwO7Gbj3cYmEtc7YRtk7KWCzMojxoO
 oQlk9gcfzLeFPgVhHdpx2KyzSwudPvs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-Hl6E-ifRPqKSSwPowT1ASw-1; Tue, 04 Oct 2022 14:24:37 -0400
X-MC-Unique: Hl6E-ifRPqKSSwPowT1ASw-1
Received: by mail-qk1-f197.google.com with SMTP id
 d18-20020a05620a241200b006ce80a4d74aso12250137qkn.6
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 11:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qfnQWUDa5K7pjPq/3m1YfD6y3lwpZcpfMbX0SIbFgHE=;
 b=zwvtsjP+2cwXR3cMXf6bW0U7k9GPKw51cs+B1VtmDsjHvTvytzDBWKDDDoDu/WrZQv
 F6r+j0LpQ8Q0RSPhb0WulJQDEUvw0c+DbFy5afeDgvATvU4axQc887yZ15i2o+ZYu4eO
 MGmigPbdMkVXZseKGfGePDmRgDs7aloQ1dv/EgLSlnl7ilmTR2AJdzynGYSzdO/hnUgP
 0i4Ygk/XnNG7x+7QMABuuxibgIdKUWlllIQnBABRGLc825bCm0D7q6cwbwyXISvAV1al
 fMrwhrf0RwWGTA1epLVQ5hx5ATn09HFmasLYOT79iR+2uvUuP+Y00SrGI2vnAWPhym+e
 mUNQ==
X-Gm-Message-State: ACrzQf39s/NCweqLKEB3NjoC5tDbGp30p+vwV6HfL7kp9x+nInfXIY9v
 1h4vrFzUuXxB3GeDHoTgoCRHB79CZhp1DzuEOyeXxiKHRPqCOpuup0SDn245td4+o1EVmy2Z3ch
 zaQRwRUN9wyMKufvOH9uHpblr6HmD321MigwQmhDx2bpYgaK+zav29cRbqL0qJOaF
X-Received: by 2002:a05:620a:1926:b0:6ce:ee58:1b12 with SMTP id
 bj38-20020a05620a192600b006ceee581b12mr17644510qkb.80.1664907877134; 
 Tue, 04 Oct 2022 11:24:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6UVBMbajgtBKGOHLmluVa5YtWGpEAA/G/10oEw+eq5ejeDgD7YwTt6LEa6PEoEcRc58EsKMg==
X-Received: by 2002:a05:620a:1926:b0:6ce:ee58:1b12 with SMTP id
 bj38-20020a05620a192600b006ceee581b12mr17644475qkb.80.1664907876676; 
 Tue, 04 Oct 2022 11:24:36 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 i1-20020ac813c1000000b0035c1e18762csm12334514qtj.84.2022.10.04.11.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 11:24:36 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v2 4/5] migration: Use non-atomic ops for clear log bitmap
Date: Tue,  4 Oct 2022 14:24:29 -0400
Message-Id: <20221004182430.97638-5-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004182430.97638-1-peterx@redhat.com>
References: <20221004182430.97638-1-peterx@redhat.com>
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

Since we already have bitmap_mutex to protect either the dirty bitmap or
the clear log bitmap, we don't need atomic operations to set/clear/test on
the clear log bitmap.  Switching all ops from atomic to non-atomic
versions, meanwhile touch up the comments to show which lock is in charge.

Introduced non-atomic version of bitmap_test_and_clear_atomic(), mostly the
same as the atomic version but simplified a few places, e.g. dropped the
"old_bits" variable, and also the explicit memory barriers.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/ram_addr.h | 11 +++++-----
 include/exec/ramblock.h |  3 +++
 include/qemu/bitmap.h   |  1 +
 util/bitmap.c           | 45 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f3e0c78161..5092a2e0ff 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -42,7 +42,8 @@ static inline long clear_bmap_size(uint64_t pages, uint8_t shift)
 }
 
 /**
- * clear_bmap_set: set clear bitmap for the page range
+ * clear_bmap_set: set clear bitmap for the page range.  Must be with
+ * bitmap_mutex held.
  *
  * @rb: the ramblock to operate on
  * @start: the start page number
@@ -55,12 +56,12 @@ static inline void clear_bmap_set(RAMBlock *rb, uint64_t start,
 {
     uint8_t shift = rb->clear_bmap_shift;
 
-    bitmap_set_atomic(rb->clear_bmap, start >> shift,
-                      clear_bmap_size(npages, shift));
+    bitmap_set(rb->clear_bmap, start >> shift, clear_bmap_size(npages, shift));
 }
 
 /**
- * clear_bmap_test_and_clear: test clear bitmap for the page, clear if set
+ * clear_bmap_test_and_clear: test clear bitmap for the page, clear if set.
+ * Must be with bitmap_mutex held.
  *
  * @rb: the ramblock to operate on
  * @page: the page number to check
@@ -71,7 +72,7 @@ static inline bool clear_bmap_test_and_clear(RAMBlock *rb, uint64_t page)
 {
     uint8_t shift = rb->clear_bmap_shift;
 
-    return bitmap_test_and_clear_atomic(rb->clear_bmap, page >> shift, 1);
+    return bitmap_test_and_clear(rb->clear_bmap, page >> shift, 1);
 }
 
 static inline bool offset_in_ramblock(RAMBlock *b, ram_addr_t offset)
diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index 6cbedf9e0c..adc03df59c 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -53,6 +53,9 @@ struct RAMBlock {
      * and split clearing of dirty bitmap on the remote node (e.g.,
      * KVM).  The bitmap will be set only when doing global sync.
      *
+     * It is only used during src side of ram migration, and it is
+     * protected by the global ram_state.bitmap_mutex.
+     *
      * NOTE: this bitmap is different comparing to the other bitmaps
      * in that one bit can represent multiple guest pages (which is
      * decided by the `clear_bmap_shift' variable below).  On
diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index 82a1d2f41f..3ccb00865f 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -253,6 +253,7 @@ void bitmap_set(unsigned long *map, long i, long len);
 void bitmap_set_atomic(unsigned long *map, long i, long len);
 void bitmap_clear(unsigned long *map, long start, long nr);
 bool bitmap_test_and_clear_atomic(unsigned long *map, long start, long nr);
+bool bitmap_test_and_clear(unsigned long *map, long start, long nr);
 void bitmap_copy_and_clear_atomic(unsigned long *dst, unsigned long *src,
                                   long nr);
 unsigned long bitmap_find_next_zero_area(unsigned long *map,
diff --git a/util/bitmap.c b/util/bitmap.c
index f81d8057a7..8d12e90a5a 100644
--- a/util/bitmap.c
+++ b/util/bitmap.c
@@ -240,6 +240,51 @@ void bitmap_clear(unsigned long *map, long start, long nr)
     }
 }
 
+bool bitmap_test_and_clear(unsigned long *map, long start, long nr)
+{
+    unsigned long *p = map + BIT_WORD(start);
+    const long size = start + nr;
+    int bits_to_clear = BITS_PER_LONG - (start % BITS_PER_LONG);
+    unsigned long mask_to_clear = BITMAP_FIRST_WORD_MASK(start);
+    bool dirty = false;
+
+    assert(start >= 0 && nr >= 0);
+
+    /* First word */
+    if (nr - bits_to_clear > 0) {
+        if ((*p) & mask_to_clear) {
+            dirty = true;
+        }
+        *p &= ~mask_to_clear;
+        nr -= bits_to_clear;
+        bits_to_clear = BITS_PER_LONG;
+        p++;
+    }
+
+    /* Full words */
+    if (bits_to_clear == BITS_PER_LONG) {
+        while (nr >= BITS_PER_LONG) {
+            if (*p) {
+                dirty = true;
+                *p = 0;
+            }
+            nr -= BITS_PER_LONG;
+            p++;
+        }
+    }
+
+    /* Last word */
+    if (nr) {
+        mask_to_clear &= BITMAP_LAST_WORD_MASK(size);
+        if ((*p) & mask_to_clear) {
+            dirty = true;
+        }
+        *p &= ~mask_to_clear;
+    }
+
+    return dirty;
+}
+
 bool bitmap_test_and_clear_atomic(unsigned long *map, long start, long nr)
 {
     unsigned long *p = map + BIT_WORD(start);
-- 
2.37.3


