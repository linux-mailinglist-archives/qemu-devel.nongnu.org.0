Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81313D40E7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:36:50 +0200 (CEST)
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m70yX-0000lc-Lt
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wo-0006O6-3H
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m70wm-0002QU-JG
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627068900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6S0/tR0WMas8i+0FqgBbnpbGUceg0X5GOSPvU0OplU=;
 b=OtgZvFf8XKu42y1k2b0LqjIKQYuY35SNuvZoU4l27Yr7QTN6SPxQPfjKzsnl2fcfHuQEmQ
 zH3ggpd+1R1g1tj9y9jCAMHWLlGINYoVTmoBPEHmZXyFOkcRH6qsOQFk2jW9XFlJ8g7M+G
 D7WA8WabTY2JnqF2dU1JMsWiu1uhmMw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-I_gMe9HWO3upq10_j3LUXQ-1; Fri, 23 Jul 2021 15:34:57 -0400
X-MC-Unique: I_gMe9HWO3upq10_j3LUXQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 gm10-20020a056214268ab02902eaed054a57so2408925qvb.15
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g6S0/tR0WMas8i+0FqgBbnpbGUceg0X5GOSPvU0OplU=;
 b=H7WBgDwjflz+dCshTOqOqn8yNZruEjhr0FoMn4WbjOyo1uWT98WQEe+dRzFQpAbbpl
 VrvNtoGcY98LI46/uwESGNtveEdcl99aM5X745Zf+RLvcUcDzPTWX3JdwJuoyvept0Ul
 w3VkjgkpZsd85vVetbtWMsl7K5CCLupCarUkvIr3DpI9L4wgxkazCfAKiSvPBee/w745
 uDTnw+K0tUlJ9gye01ZijWJiAPuq1fONe9dXXBIAeE5/gSs9s6R+TKzTUypDIhxjWLWD
 KMRvoBGXW+RzkeBljq9n6qeEGoEcmfV25NL2fjS7ci+Klmth9tbMs4Lf+bdMWKUuG1Kk
 3VAQ==
X-Gm-Message-State: AOAM5323s5KXJ0k7+vsE7jGayap6l019o9Lv+ecKThpLBb/CUUYtf8XK
 IsBHrNzhsQow2mKl7obCqivwBtzBF96WPlVqu+3gvn+rR9l1LgRR4neb7jb7zaGVwXGypGVBpg4
 aXI/9uxib/8n7N/9fmirVmpQ8iY87J+Q6kZh7NWtaxCSOtX1e9LMxw12M/YDJ9/sv
X-Received: by 2002:a05:622a:54e:: with SMTP id
 m14mr5339545qtx.74.1627068896268; 
 Fri, 23 Jul 2021 12:34:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOeO7kYn5EQqrIOVXeXxU0dTmjJmttRBnf4OW4ka4eTc/C1wvtHuAt+YlheW18hqOdTqKuRA==
X-Received: by 2002:a05:622a:54e:: with SMTP id
 m14mr5339523qtx.74.1627068895967; 
 Fri, 23 Jul 2021 12:34:55 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o2sm12659104qkm.109.2021.07.23.12.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:34:55 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] memory: Don't do topology update in memory finalize()
Date: Fri, 23 Jul 2021 15:34:39 -0400
Message-Id: <20210723193444.133412-5-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723193444.133412-1-peterx@redhat.com>
References: <20210723193444.133412-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 peterx@redhat.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Topology update could be wrongly triggered in memory region finalize() if
there's bug somewhere else.  It'll be a very confusing stack when it
happens (e.g., sending KVM ioctl within the RCU thread, and we'll observe it
only until it fails!).

Instead of that, we use the push()/pop() helper to avoid memory transaction
commit, at the same time we use assertions to make sure there's no pending
updates or it's a nested transaction, so it could fail even earlier and in a
more explicit way.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 1a3e9ff8ad..dfce4a2bda 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -170,6 +170,12 @@ struct MemoryRegionIoeventfd {
     EventNotifier *e;
 };
 
+/* Returns whether there's any pending memory updates */
+static bool memory_region_has_pending_update(void)
+{
+    return memory_region_update_pending || ioeventfd_update_pending;
+}
+
 static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd *a,
                                            MemoryRegionIoeventfd *b)
 {
@@ -1756,12 +1762,25 @@ static void memory_region_finalize(Object *obj)
      * and cause an infinite loop.
      */
     mr->enabled = false;
-    memory_region_transaction_begin();
+
+    /*
+     * Use push()/pop() instead of begin()/commit() to make sure below block
+     * won't trigger any topology update (which should never happen, but it's
+     * still a safety belt).
+     */
+    memory_region_transaction_push();
     while (!QTAILQ_EMPTY(&mr->subregions)) {
         MemoryRegion *subregion = QTAILQ_FIRST(&mr->subregions);
         memory_region_del_subregion(mr, subregion);
     }
-    memory_region_transaction_commit();
+    memory_region_transaction_pop();
+
+    /*
+     * Make sure we're either in a nested transaction or there must have no
+     * pending updates due to memory_region_del_subregion() above.
+     */
+    assert(memory_region_transaction_depth ||
+           !memory_region_has_pending_update());
 
     mr->destructor(mr);
     memory_region_clear_coalescing(mr);
-- 
2.31.1


