Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9FC5BF27F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:58:46 +0200 (CEST)
Received: from localhost ([::1]:44478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oao4b-0007kC-Gg
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam6J-0005W2-CP
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:52:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam6E-0001Tz-0C
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663714334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gj0iWJQkmOoJ+o3+SQ0GN4gCpxOsbiA4mOzqzJHbSgA=;
 b=Cvwg99MCh0r4Jqfw2FEGpKlwDSK3CDY08blDOnrWI2AjzmspVv7ySviePmA0VHyNRKbec9
 Zrb6ZSxPxC/c3pqIsiQmpF8ZdBEINhRYkcCMR9GpVF0QrrvsYnocWeO4LealpD+NjdRyvz
 Wuwa9rVLir4xLfaqMe3YdWH4T/0G8MM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-FNgCS9riNEKPZSDK3JB2hg-1; Tue, 20 Sep 2022 18:52:13 -0400
X-MC-Unique: FNgCS9riNEKPZSDK3JB2hg-1
Received: by mail-qt1-f200.google.com with SMTP id
 n16-20020ac85b50000000b0035ce9e26eb1so2881672qtw.8
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gj0iWJQkmOoJ+o3+SQ0GN4gCpxOsbiA4mOzqzJHbSgA=;
 b=n1MsanUM9c8aiLA9bvYix86EeOBg2WLp3TLlXiuJE3pzxaYCcW6VTenOC8RhhK8Lx9
 Pc91PaqLGbN/eOSlc2f8h0x95GYqcjl9KKQCPHA55VSghulEm3KOIrHhRCE6DMvvkyS1
 LeyDHu6As+gTFrPbZmVEYpPOB4RD1cA/jHvMniTPJ7HYdps8Sc3+MmQRZfyALwUbqpX4
 FbO8/NJrjEAaEOfBW/EvlVGXnnIxc20kvO8MNQOr4VhlFom985aZ1OR35H3gHVhg7vWG
 utlI/aCGjAdheUelfuQ9fbUWqY6xvgHOuetDCpOSkBMqOwpnu7ugNTnE69YY2SCbHF7r
 JvCA==
X-Gm-Message-State: ACrzQf2uXo3AxiSv2lxjf+VbinELjH7cY6czN5u2wNkPsm7DzK5mXQ1c
 bdyJbpVj9nTX95uI3sXd1yXBTjSh468zanYR7E2ppPjKYC035sMo/reKHWQJY9t/+iR8lwXB34z
 15M2kP2cAvQrk92EmGIXraPP7x7L2A2pzNn4I1Z780E1I5DI4NzdN25ZJfj59UqEg
X-Received: by 2002:a05:620a:2b86:b0:6ce:ee47:f733 with SMTP id
 dz6-20020a05620a2b8600b006ceee47f733mr11574412qkb.398.1663714332918; 
 Tue, 20 Sep 2022 15:52:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Ux5Y7oOKfto9JJ+ql2Ln3pKgMnfbk5BzAHoYDtF/h5+SKSKpsrv3Ka5Ii/0QVPrgG+QxoIg==
X-Received: by 2002:a05:620a:2b86:b0:6ce:ee47:f733 with SMTP id
 dz6-20020a05620a2b8600b006ceee47f733mr11574397qkb.398.1663714332616; 
 Tue, 20 Sep 2022 15:52:12 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 bk14-20020a05620a1a0e00b006b5df4d2c81sm611226qkb.94.2022.09.20.15.52.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:52:12 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 05/14] migration: Yield bitmap_mutex properly when
 sending/sleeping
Date: Tue, 20 Sep 2022 18:52:10 -0400
Message-Id: <20220920225210.48732-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920225106.48451-1-peterx@redhat.com>
References: <20220920225106.48451-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
index 8303252b6d..6e7de6087a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2463,6 +2463,7 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
  */
 static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
 {
+    bool page_dirty, release_lock = postcopy_preempt_active();
     int tmppages, pages = 0;
     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
@@ -2486,22 +2487,41 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
             break;
         }
 
+        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
+        /*
+         * Properly yield the lock only in postcopy preempt mode because
+         * both migration thread and rp-return thread can operate on the
+         * bitmaps.
+         */
+        if (release_lock) {
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
+        if (release_lock) {
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


