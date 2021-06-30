Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8103B898B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 22:09:15 +0200 (CEST)
Received: from localhost ([::1]:38928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lygWI-000593-9r
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 16:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lygVN-0004TP-Du
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 16:08:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lygVI-0000ac-7E
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 16:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625083690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fWALF14RBBBjio94vTqqk04Er57LDeUDxaZzNvfC/6E=;
 b=h1gbRSpFmJJfFTaOmzXwNjX9LHdj9ma7JO0VG82bBvHFlV2T0yCwo8tBzu7F/t5SS7aGu5
 Jr3iVw5+18dpyfyePQ5JeNfKxJfJ0qOrKX3TN84Ef0jsY0TLoKgvwFtvMVsvZ5yyCiw/Oi
 uOpPcYmk5eyrAQYcEI2TBQRbKgYyBy8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-GcDqOIpQPE-yRXhJie7CMA-1; Wed, 30 Jun 2021 16:08:09 -0400
X-MC-Unique: GcDqOIpQPE-yRXhJie7CMA-1
Received: by mail-qv1-f71.google.com with SMTP id
 y17-20020ad445b10000b029027389e9530fso1518331qvu.4
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 13:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fWALF14RBBBjio94vTqqk04Er57LDeUDxaZzNvfC/6E=;
 b=FCN6qL3BPp+IRLZutC0EShmzWOhYhVKKgZRb4sy4+TV6Ut/ThhLmGpn47GaLOIa5kO
 Kse6txcSkMTAdywODCX+TlsmEp9aZpu6H+zzjFPhKX//YGESGjmuwTDO4ntTNkQpB1gq
 FxA9eWvFR4i7lltMWP8Mt0oiPcPfYpZhNU8onEYvt3TM2ULgtqU+W3iAY1aZOLSQGoGF
 tawxyyoygYVikvmelG+fIgac3peTtrxwPLGd/ol6DAu80c90YZztry7bWvH5sLq7E9be
 hw5OHcPr4E9mKotcdvQisl1fHMHOqXk6k5SCmR6rRDvYCA+D3LqrjyoPSfAroyZ8GTmR
 r9Tg==
X-Gm-Message-State: AOAM532RCMPRSMFz5y8YVPtyV/N7c4SniyInY8876No7wWIGtaDaSYjV
 032p4h5neMarIe9ZBt4UeBtMEUJOty/rgfm5MZ6C4B/mNR7Ikegu9Y8q6uHHJMBCu6IBSKxRJAR
 PKQEHn9GJM35daQYPubJ51hb18KLRD3Y5/Kg1dxcT91cK8e9wTgBFTPtGwHyty9qG
X-Received: by 2002:a05:6214:1c46:: with SMTP id
 if6mr38967873qvb.41.1625083688111; 
 Wed, 30 Jun 2021 13:08:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVxEC0+NKSkHZqx0MvUABLgH1w4EkWjgfP4g5OAFPHOe5Zqhm4fmb8c7Z1x4s0uIOHtJCDDw==
X-Received: by 2002:a05:6214:1c46:: with SMTP id
 if6mr38967838qvb.41.1625083687839; 
 Wed, 30 Jun 2021 13:08:07 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id 145sm5688476qkg.59.2021.06.30.13.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 13:08:07 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Date: Wed, 30 Jun 2021 16:08:05 -0400
Message-Id: <20210630200805.280905-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Wei Wang <wei.w.wang@intel.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Taking the mutex every time for each dirty bit to clear is too slow, especially
we'll take/release even if the dirty bit is cleared.  So far it's only used to
sync with special cases with qemu_guest_free_page_hint() against migration
thread, nothing really that serious yet.  Let's move the lock to be upper.

There're two callers of migration_bitmap_clear_dirty().

For migration, move it into ram_save_iterate().  With the help of MAX_WAIT
logic, we'll only run ram_save_iterate() for no more than 50ms-ish time, so
taking the lock once there at the entry.  It also means any call sites to
qemu_guest_free_page_hint() can be delayed; but it should be very rare, only
during migration, and I don't see a problem with it.

For COLO, move it up to colo_flush_ram_cache().  I think COLO forgot to take
that lock even when calling ramblock_sync_dirty_bitmap(), where another example
is migration_bitmap_sync() who took it right.  So let the mutex cover both the
ramblock_sync_dirty_bitmap() and migration_bitmap_clear_dirty() calls.

It's even possible to drop the lock so we use atomic operations upon rb->bmap
and the variable migration_dirty_pages.  I didn't do it just to still be safe,
also not predictable whether the frequent atomic ops could bring overhead too
e.g. on huge vms when it happens very often.  When that really comes, we can
keep a local counter and periodically call atomic ops.  Keep it simple for now.

Cc: Wei Wang <wei.w.wang@intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 723af67c2e..9f2965675d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -795,8 +795,6 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
 {
     bool ret;
 
-    QEMU_LOCK_GUARD(&rs->bitmap_mutex);
-
     /*
      * Clear dirty bitmap if needed.  This _must_ be called before we
      * send any of the page in the chunk because we need to make sure
@@ -2834,6 +2832,14 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
         goto out;
     }
 
+    /*
+     * We'll take this lock a little bit long, but it's okay for two reasons.
+     * Firstly, the only possible other thread to take it is who calls
+     * qemu_guest_free_page_hint(), which should be rare; secondly, see
+     * MAX_WAIT (if curious, further see commit 4508bd9ed8053ce) below, which
+     * guarantees that we'll at least released it in a regular basis.
+     */
+    qemu_mutex_lock(&rs->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
         if (ram_list.version != rs->last_version) {
             ram_state_reset(rs);
@@ -2893,6 +2899,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
             i++;
         }
     }
+    qemu_mutex_unlock(&rs->bitmap_mutex);
 
     /*
      * Must occur before EOS (or any QEMUFile operation)
@@ -3682,6 +3689,7 @@ void colo_flush_ram_cache(void)
     unsigned long offset = 0;
 
     memory_global_dirty_log_sync();
+    qemu_mutex_lock(&ram_state->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(ram_state, block);
@@ -3710,6 +3718,7 @@ void colo_flush_ram_cache(void)
         }
     }
     trace_colo_flush_ram_cache_end();
+    qemu_mutex_unlock(&ram_state->bitmap_mutex);
 }
 
 /**
-- 
2.31.1


