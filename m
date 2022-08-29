Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5475A5281
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:03:11 +0200 (CEST)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSiAI-0000H3-BJ
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4X-0002d6-It
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4U-0008Fl-Kt
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661792229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2a+RxJMAC8kQq3wYpNHzFC5aT7sCj9AyeAPBtAZ223E=;
 b=O2hKxpsTf2bWzsk8v6qVgacut8QMzc99IgD8G2I4ZdxkMLepf2/MkrCMTlyTqswR1Z9yYw
 8h/j/fLX4G9DNIsCnyLWPXESAp3IGiBok0zYgK7x7XReT/Nge/Lsad1XF1TeVanAJXKkaJ
 zXxGBQk31bLN+CGZcu0zRQEeJwyilZw=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-on3qCicGOTuUHnUru_LxJA-1; Mon, 29 Aug 2022 12:57:08 -0400
X-MC-Unique: on3qCicGOTuUHnUru_LxJA-1
Received: by mail-il1-f197.google.com with SMTP id
 i13-20020a056e02152d00b002e97839ff00so6346998ilu.15
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2a+RxJMAC8kQq3wYpNHzFC5aT7sCj9AyeAPBtAZ223E=;
 b=me3t/McXEv1cPxTvk4nOl3i8U028e+ZH7OZlV3CY+PY3vmM/JHjvbY8yQtkrhXBGBN
 IRAKgpahXBsGn9K9JucIEHlaTjyolRLV8qFpdV9TBtIHK5pITzFsPiZBSjBPbeRhUcEI
 4najqcsipU2YNxUg/iPUmDZopOXVE2k+dpdlYz86kV0s4gjwNEHIlM4i8EHzjnP5C9/G
 tW1CsEMs7N2FrKVamlfAdnJ1VCjst7mThf52d1hL0IyFF2Nk0OWG3K/kfO0+Is8wnOxa
 IDTRpZEpQTt5tPauY/Dx1KGTfez04X68rBNW+mzxye8mkaFPkW9GBZQ7gTCb14t+5N7V
 3L7g==
X-Gm-Message-State: ACgBeo2Vl8wxafbR0MBGhrgAP0zsyWmML/zDapG0l+v9H/iRDIFXK7g5
 JY21D9MT6S+zvaLvVtjZ5Io1qRjeP2sNJ8iYEDhlX2t4S/Cabm1hbAH1OzE3F+h5cO6hhYkEEgS
 QwLwXQ5RkjmDn93zsWyAjeaJcAEa339t/UuohV+YX3cAUcI41QzxOmHgT1WGuSw57
X-Received: by 2002:a05:6602:1681:b0:678:9e4e:cd76 with SMTP id
 s1-20020a056602168100b006789e4ecd76mr8940604iow.80.1661792227722; 
 Mon, 29 Aug 2022 09:57:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR40d95gvGIKlXJ2Zc5qiJqspihaPdTCeEtF5kerzlYI48vv8iYv4EOyn89lFTFsKM8tx6z/FA==
X-Received: by 2002:a05:6602:1681:b0:678:9e4e:cd76 with SMTP id
 s1-20020a056602168100b006789e4ecd76mr8940590iow.80.1661792227437; 
 Mon, 29 Aug 2022 09:57:07 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b00344c3de5ec7sm4404709jas.150.2022.08.29.09.57.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Aug 2022 09:57:07 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 03/13] migration: Yield bitmap_mutex properly when
 sending/sleeping
Date: Mon, 29 Aug 2022 12:56:49 -0400
Message-Id: <20220829165659.96046-4-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220829165659.96046-1-peterx@redhat.com>
References: <20220829165659.96046-1-peterx@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 migration/ram.c | 42 +++++++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 8c5d5332e8..9e96a46323 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2470,6 +2470,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     unsigned long hostpage_boundary =
         QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
     unsigned long start_page = pss->page;
+    bool page_dirty;
     int res;
 
     if (ramblock_is_ignored(pss->block)) {
@@ -2487,22 +2488,41 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
             break;
         }
 
+        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
+        /*
+         * Properly yield the lock only in postcopy preempt mode because
+         * both migration thread and rp-return thread can operate on the
+         * bitmaps.
+         */
+        if (postcopy_preempt_active()) {
+            qemu_mutex_unlock(&rs->bitmap_mutex);
+        }
+
         /* Check the pages is dirty and if it is send it */
-        if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
+        if (page_dirty) {
             tmppages = ram_save_target_page(rs, pss);
-            if (tmppages < 0) {
-                return tmppages;
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
+        } else {
+            tmppages = 0;
+        }
 
-            pages += tmppages;
-            /*
-             * Allow rate limiting to happen in the middle of huge pages if
-             * something is sent in the current iteration.
-             */
-            if (pagesize_bits > 1 && tmppages > 0) {
-                migration_rate_limit();
-            }
+        if (postcopy_preempt_active()) {
+            qemu_mutex_lock(&rs->bitmap_mutex);
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
2.32.0


