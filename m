Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B372EF5FE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:49:32 +0100 (CET)
Received: from localhost ([::1]:48554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxux9-0005xX-H1
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuu7-0004B9-2z
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:46:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxutx-0003k7-RE
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XP+ch9DopkIwLK8sMynXGI2J3pEPHcTHE3OJ/jRr6Dk=;
 b=K/0BjQCUhZX2ThNxhckdCiCX63wl/8KcA7puvi0Ln9yU3k2skkPugcaL9yxm5ESW6ftuQ+
 mXcol6p+VX145ecFmdCWqIu+EYMYFgoKt8Bva3p4deSB1bAT/cZNxJwjtvh0n9kSoexxXw
 tV+PtSx4MTpfZwvk8/EgJP0uZScqytA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-US4K6bpPNJyqQS5ydn2k3A-1; Fri, 08 Jan 2021 11:46:09 -0500
X-MC-Unique: US4K6bpPNJyqQS5ydn2k3A-1
Received: by mail-qt1-f200.google.com with SMTP id l7so8685232qth.15
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:46:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XP+ch9DopkIwLK8sMynXGI2J3pEPHcTHE3OJ/jRr6Dk=;
 b=HNVCGlKgmCmeFNNERLdwhJXkXtg+/wYTEQ6VA6k7TqaqGYGqVK48Fghqqj5Utks9yt
 53iuPL7Wdm5c/Oh1CrtzIqeNtasv4cUKdAJ9GDx2EAQIN7lrg84nW5Ce6bWJtf8/S7LP
 sjSg+/9oMPxQ3jvKFhQrmm08CqmvTZCXRZIwFdi/Yb50oTWQkGPY701XCHMYcqdybsfB
 IwnYLhdpoucj7lwkVdUrpDIrq1pgDR2E0GL7QkCY78aKDE92wQdCu7iE1QqMNgIF+UJT
 Walyy353JpGo3UUhzNYxmBrTTi/rdnPryJv719lamy1uxHvPwqgknqIi+7fdM02M9Tii
 HX8w==
X-Gm-Message-State: AOAM532TOVWl16rcQ1CShlGWQa3ekZVsjJ+LHIjVUkkoQLRpxJ9i4Wb0
 BYgHhKVeBb3fywbOe18eiyc97Mt/tYG46gymzcMPmTuTrMLhm+UXH/nRAYEr4OGuQkGaGq1mCQC
 2m16ZPP7kX8ZsF6rlZiKi96qHkNItRpKhPscvwDi8k/64npvl6dWh1P621Nypa+fZ
X-Received: by 2002:ac8:5514:: with SMTP id j20mr4281769qtq.387.1610124367758; 
 Fri, 08 Jan 2021 08:46:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwI1GG2Qasb0h7rpNV4ftzW2DJkpTgpnFIuR+/eDfgdl2wS6yeUBs226Q7pywrUIm/89Og55g==
X-Received: by 2002:ac8:5514:: with SMTP id j20mr4281745qtq.387.1610124367463; 
 Fri, 08 Jan 2021 08:46:07 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id c139sm5067437qke.24.2021.01.08.08.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:46:06 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/13] memory: Introduce log_sync_global() to memory
 listener
Date: Fri,  8 Jan 2021 11:45:51 -0500
Message-Id: <20210108164601.406146-4-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108164601.406146-1-peterx@redhat.com>
References: <20210108164601.406146-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of the memory listener may want to do log synchronization without
being able to specify a range of memory to sync but always globally.
Such a memory listener should provide this new method instead of the
log_sync() method.

Obviously we can also achieve similar thing when we put the global
sync logic into a log_sync() handler. However that's not efficient
enough because otherwise memory_global_dirty_log_sync() may do the
global sync N times, where N is the number of flat ranges in the
address space.

Make this new method be exclusive to log_sync().

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory.h | 12 ++++++++++++
 softmmu/memory.c      | 33 +++++++++++++++++++++++----------
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 521d9901d7..f80b68f1e3 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -610,6 +610,18 @@ struct MemoryListener {
      */
     void (*log_sync)(MemoryListener *listener, MemoryRegionSection *section);
 
+    /**
+     * @log_sync_global:
+     *
+     * This is the global version of @log_sync when the listener does
+     * not have a way to synchronize the log with finer granularity.
+     * When the listener registers with @log_sync_global defined, then
+     * its @log_sync must be NULL.  Vice versa.
+     *
+     * @listener: The #MemoryListener.
+     */
+    void (*log_sync_global)(MemoryListener *listener);
+
     /**
      * @log_clear:
      *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 333e1ed7b0..824abe3c7a 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2052,6 +2052,10 @@ void memory_region_set_dirty(MemoryRegion *mr, hwaddr addr,
                                         memory_region_get_dirty_log_mask(mr));
 }
 
+/*
+ * If memory region `mr' is NULL, do global sync.  Otherwise, sync
+ * dirty bitmap for the specified memory region.
+ */
 static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
 {
     MemoryListener *listener;
@@ -2065,18 +2069,24 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
      * address space once.
      */
     QTAILQ_FOREACH(listener, &memory_listeners, link) {
-        if (!listener->log_sync) {
-            continue;
-        }
-        as = listener->address_space;
-        view = address_space_get_flatview(as);
-        FOR_EACH_FLAT_RANGE(fr, view) {
-            if (fr->dirty_log_mask && (!mr || fr->mr == mr)) {
-                MemoryRegionSection mrs = section_from_flat_range(fr, view);
-                listener->log_sync(listener, &mrs);
+        if (listener->log_sync) {
+            as = listener->address_space;
+            view = address_space_get_flatview(as);
+            FOR_EACH_FLAT_RANGE(fr, view) {
+                if (fr->dirty_log_mask && (!mr || fr->mr == mr)) {
+                    MemoryRegionSection mrs = section_from_flat_range(fr, view);
+                    listener->log_sync(listener, &mrs);
+                }
             }
+            flatview_unref(view);
+        } else if (listener->log_sync_global) {
+            /*
+             * No matter whether MR is specified, what we can do here
+             * is to do a global sync, because we are not capable to
+             * sync in a finer granularity.
+             */
+            listener->log_sync_global(listener);
         }
-        flatview_unref(view);
     }
 }
 
@@ -2764,6 +2774,9 @@ void memory_listener_register(MemoryListener *listener, AddressSpace *as)
 {
     MemoryListener *other = NULL;
 
+    /* Only one of them can be defined for a listener */
+    assert(!(listener->log_sync && listener->log_sync_global));
+
     listener->address_space = as;
     if (QTAILQ_EMPTY(&memory_listeners)
         || listener->priority >= QTAILQ_LAST(&memory_listeners)->priority) {
-- 
2.26.2


