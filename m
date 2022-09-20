Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2545BF157
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:37:53 +0200 (CEST)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamoK-0006u2-WA
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsh-0006xH-1t
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsZ-00083a-0Y
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663713490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uCb2yxc2rwK/M7X4ZHbaziR3/FCtU0FEFxkcoR5+zKo=;
 b=ZG8KwKAFMM1RXg+aOQuRWQrD0/UAkTlAC9Rv8xZdwr/sTTOSVl9Sj2Bj0wdOsfWKp5F3bX
 RNq16u2oupH7Lc3mWN4+DjhVS3U5uH/QcZKhJtfp9A6P1Qx0cTQCc55j3cZfz9f3sshjpp
 XwUTqxv+AVsNTMHFGBOLG6VebH/aJss=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-ERSL1uYIMwCZy1fI8iy1HA-1; Tue, 20 Sep 2022 18:38:09 -0400
X-MC-Unique: ERSL1uYIMwCZy1fI8iy1HA-1
Received: by mail-qv1-f70.google.com with SMTP id
 kl19-20020a056214519300b004ad1c1ad474so3045479qvb.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uCb2yxc2rwK/M7X4ZHbaziR3/FCtU0FEFxkcoR5+zKo=;
 b=yhOXzTvIPz4skXd2rRgROnSOjHU19Ar+enM+TvaI3Cabk/3RqFKdkHx89lEXs2GtjH
 W4HZYUakDL8iyG9S69qqYdqaFk478GMy6CyR7Yg9bWSGRG7kqfsvMSF3+/BUr7P7CO6L
 XRdXLdTzIw2UZ4hsFWP0DZWdPam2sF2kBGi6jeSWcTj/N/aC+YUu0suX8M9lX626lETE
 +Vb64yib5eK/2eug9yeb2twXy1rgWgbvQ1qbCQD5GV4+9OPIb/42dhZYmpjQ4aEZAvzH
 8tsKps7btE3simEzlTlNaMg+qXESkjQ25oUNrTODNjU1v7WitmeF8v8GB3x3yMOsuU8m
 v7Eg==
X-Gm-Message-State: ACrzQf3b+DvvB1G+lgyL27SRALeMsvfr0figilASHKPU0Cc1jdbcEJpb
 Vg9+RUjJs9x5qcCKlJCXAOSk+YBMZfpI2FBERF/P0d9BAoq9VcNZBNgcLmEWfuqxsjhNq0Xpg0S
 06j8ARpc7D6gjAusnl5kPuvmgSKBDw0GQaTaOqJIQUnA6TSKA1CpE286yAIzN9awo
X-Received: by 2002:a05:6214:4106:b0:4ac:9160:747b with SMTP id
 kc6-20020a056214410600b004ac9160747bmr21152949qvb.28.1663713488346; 
 Tue, 20 Sep 2022 15:38:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7JS4Ewus8qm8AYU9E4MyrjgDqXhtjiFCtJ7ollEyzhfifS0JCb3yHAj95pYpf9AYUBSPaXvA==
X-Received: by 2002:a05:6214:4106:b0:4ac:9160:747b with SMTP id
 kc6-20020a056214410600b004ac9160747bmr21152932qvb.28.1663713488085; 
 Tue, 20 Sep 2022 15:38:08 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 de4-20020a05620a370400b006bbb07ebd83sm697499qkb.108.2022.09.20.15.38.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:38:07 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 5/5] migration: Use non-atomic ops for clear log bitmap
Date: Tue, 20 Sep 2022 18:38:00 -0400
Message-Id: <20220920223800.47467-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920223800.47467-1-peterx@redhat.com>
References: <20220920223800.47467-1-peterx@redhat.com>
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
2.32.0


