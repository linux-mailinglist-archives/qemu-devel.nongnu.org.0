Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2071D3D9559
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:36:28 +0200 (CEST)
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oPr-0005w1-63
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLh-0005ty-QK
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLd-00074t-2M
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZYp/arNlLB7CqHGh2xkLop1S0WBzyFyzBFrA9ouUuQ=;
 b=e5iMZo77op+On9Vk43O5u4lJGVL9/WAWoZW7Th9LmyE9BCOV7rMLOQSI+9+3AJSu9B+WH+
 jfNzMjGWDiVykYoVugy9Cs4J0Fwa5SQl2xU03/IXI/Jyiu35vrUaXFbbDLRtbj0GwUGX6a
 IDgDtoehjuFiYXZN0K4esai/ILaYrHk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-mSwf1zMhMZitO-rm1cr_UQ-1; Wed, 28 Jul 2021 14:32:03 -0400
X-MC-Unique: mSwf1zMhMZitO-rm1cr_UQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 b9-20020a05620a1269b02903b8bd5c7d95so2159204qkl.12
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZYp/arNlLB7CqHGh2xkLop1S0WBzyFyzBFrA9ouUuQ=;
 b=eQdf/ra+NNEj2lViTGeVFWLWgkeXU5KYiQ9KjP3jT9eCBgc3pjjw/x8LvTGBVC9Uw9
 EQ9epuA6j4/MlnBj8kpAeVHCnHz4cA+srbsCtTxpOIEjw2NbDSTPWRhufIEaMG1Zp3fA
 vmSpb9S5prWiDBJ5HJ9uV0ps3aJMLEud7/Q1C5Lfuj1E3ORnlPDf5tLYpMqjtdUCNxrU
 DdXsjxXZ586PcqsD0LpCMtrmtq/Rs5kVulfOAwJYVt0J/si+EIznIYPWi877jrzxzCEK
 yaPE+ttaWd267VXO81xZVT2Pd/YRskhsDiu+T9FuuF9byte0fXwsrpI64DLETHLKr5H+
 12oA==
X-Gm-Message-State: AOAM532T5WiLYiTNUHCsumHLA0gHFirRcRewyfoCV7vfrbjZhZRdpfdZ
 YSgFiNi/sMTFca5x0EN9GGPyIqrxTkRqIAAskJVYlCGCk1jdKVDZMBA2539SZIneTRxQtp/Y374
 LijiSTM+o5FH+8/fx/xRqS9OdzeNhE8LvqgrhKyGsdSvBQEe8V+XZqGEAVpYuKpZt
X-Received: by 2002:a05:6214:948:: with SMTP id
 dn8mr1432986qvb.30.1627497122002; 
 Wed, 28 Jul 2021 11:32:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkgQB1tM8v5jUcFkzgaQyc1V8f0EjTx+96KjHCwXEHG/IIy7RocZvRZKjT6hW0VGsagYSwTQ==
X-Received: by 2002:a05:6214:948:: with SMTP id
 dn8mr1432962qvb.30.1627497121740; 
 Wed, 28 Jul 2021 11:32:01 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n5sm417528qkp.116.2021.07.28.11.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:32:01 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/8] memory: Don't do topology update in memory finalize()
Date: Wed, 28 Jul 2021 14:31:47 -0400
Message-Id: <20210728183151.195139-5-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728183151.195139-1-peterx@redhat.com>
References: <20210728183151.195139-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, David Hildenbrand <david@redhat.com>
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
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 725d57ec17..35b2568fc2 100644
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
+     * Use depth_inc()/depth_dec() instead of begin()/commit() to make sure
+     * below block won't trigger any topology update (which should never
+     * happen, but it's still a safety belt).
+     */
+    memory_region_transaction_depth_inc();
     while (!QTAILQ_EMPTY(&mr->subregions)) {
         MemoryRegion *subregion = QTAILQ_FIRST(&mr->subregions);
         memory_region_del_subregion(mr, subregion);
     }
-    memory_region_transaction_commit();
+    memory_region_transaction_depth_dec();
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


