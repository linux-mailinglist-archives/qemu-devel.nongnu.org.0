Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BDC5FBDA1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:06:11 +0200 (CEST)
Received: from localhost ([::1]:40570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNO6-0000hv-Bj
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEV-0001gS-Pw
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEU-0003WJ-6C
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1W8eTe6R8APkrAjKrbrJHIMon0AQ1L7/5Yd/T0XmgZs=;
 b=L5SOT4gZbk/wyrn4Q1i0Nxgs41PNZj13oHUlM1eLHtyTV0y7fudFaYXa54yi+q88TDVt7w
 ZgAHLlc/RC608o6f4a1yWGHM9rQ8tHB8cv3GkdpfRizMPK5v9lBNvT9ujkc03+xrlhHWzz
 86SRPYRwpQGf9RB96R0w7edVGmrvkeI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-332-FTF0VCZYMqSYSYNxXgXalg-1; Tue, 11 Oct 2022 17:56:10 -0400
X-MC-Unique: FTF0VCZYMqSYSYNxXgXalg-1
Received: by mail-qv1-f72.google.com with SMTP id
 jn13-20020ad45ded000000b004b1d055fbc7so8685439qvb.2
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1W8eTe6R8APkrAjKrbrJHIMon0AQ1L7/5Yd/T0XmgZs=;
 b=5k+MpbWRDBEbcJkZ4fUjJG/PY6RnhAnQBs0S/o/tnBsHXp8f0ypjDCVCJvdVlo3tzq
 iOjQ8Ukoztkvkgf7hV/cLtJ6sioL1lHOHZY8GyTrjI/32OV+sTwKF5ZpfVrh9ChAukUD
 /SHdd5dPU750bn7wTWRhYIT2DLiZa8OK+nNE9BT5qrFYv+8EDvQVCXmtj5N4jMT7viQ0
 fz27SsWJbiOjTPVNTzt+bmFEPBEBvrd9dcURgjAlbTNerJ1ogbMWHqELxfpcz16T2jSc
 khiBWh8ceP/REve0QezAKhh2Iiir15m+IFSlfFdMNPHWjZh+q/BTAZknLggBtkctTOjT
 JUkg==
X-Gm-Message-State: ACrzQf3Cu79vqDdpEwk+DmDS3eM/wzMfBJKhmUbEEAsC4YhCu6c3s+rU
 p9pwj7N1pZOCcw2JPU5A19DxNu3k9cMT6sz2WAX28Uo8F7HdWZZGO5INhk/twC4F/lJ9aBW8YU4
 jDd6YcF+qAWbVd41anuk/oud+HV5botpV57gAuKoPGqLAcx28ryB3pGOehTM2YfKt
X-Received: by 2002:a05:620a:2056:b0:6ec:52f0:f2cb with SMTP id
 d22-20020a05620a205600b006ec52f0f2cbmr11051018qka.191.1665525369961; 
 Tue, 11 Oct 2022 14:56:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5VlFAuUgYD9nYhm+oGmleOZKg7M0Xgcg6YhGtsMaf6ZRUnKJnV6E4mlwfyq0PGPQEIcYWZXg==
X-Received: by 2002:a05:620a:2056:b0:6ec:52f0:f2cb with SMTP id
 d22-20020a05620a205600b006ec52f0f2cbmr11051001qka.191.1665525369629; 
 Tue, 11 Oct 2022 14:56:09 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:08 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 06/15] migration: Yield bitmap_mutex properly when
 sending/sleeping
Date: Tue, 11 Oct 2022 17:55:50 -0400
Message-Id: <20221011215559.602584-7-peterx@redhat.com>
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

Don't take the bitmap mutex when sending pages, or when being throttled by
migration_rate_limit() (which is a bit tricky to call it here in ram code,
but seems still helpful).

It prepares for the possibility of concurrently sending pages in >1 threads
using the function ram_save_host_page() because all threads may need the
bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
qemu_sem_wait() blocking for one thread will not block the other from
progressing.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b9ac2d6921..578ad8d70a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2462,6 +2462,7 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
  */
 static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
 {
+    bool page_dirty, preempt_active = postcopy_preempt_active();
     int tmppages, pages = 0;
     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
@@ -2485,22 +2486,40 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
             break;
         }
 
-        /* Check the pages is dirty and if it is send it */
-        if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
-            tmppages = ram_save_target_page(rs, pss);
-            if (tmppages < 0) {
-                return tmppages;
-            }
+        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
 
-            pages += tmppages;
+        /* Check the pages is dirty and if it is send it */
+        if (page_dirty) {
             /*
-             * Allow rate limiting to happen in the middle of huge pages if
-             * something is sent in the current iteration.
+             * Properly yield the lock only in postcopy preempt mode
+             * because both migration thread and rp-return thread can
+             * operate on the bitmaps.
              */
-            if (pagesize_bits > 1 && tmppages > 0) {
-                migration_rate_limit();
+            if (preempt_active) {
+                qemu_mutex_unlock(&rs->bitmap_mutex);
+            }
+            tmppages = ram_save_target_page(rs, pss);
+            if (tmppages >= 0) {
+                pages += tmppages;
+                /*
+                 * Allow rate limiting to happen in the middle of huge pages if
+                 * something is sent in the current iteration.
+                 */
+                if (pagesize_bits > 1 && tmppages > 0) {
+                    migration_rate_limit();
+                }
             }
+            if (preempt_active) {
+                qemu_mutex_lock(&rs->bitmap_mutex);
+            }
+        } else {
+            tmppages = 0;
         }
+
+        if (tmppages < 0) {
+            return tmppages;
+        }
+
         pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
     } while ((pss->page < hostpage_boundary) &&
              offset_in_ramblock(pss->block,
-- 
2.37.3


