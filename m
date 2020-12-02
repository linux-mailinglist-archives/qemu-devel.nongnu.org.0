Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFA12CBB5F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:17:39 +0100 (CET)
Received: from localhost ([::1]:50516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQ8f-0007Qn-Uh
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPuq-0002lI-KV
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:03:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPun-0002pd-GS
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606906996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kU8LLfrD++DTckVdz92f3StgJjIwiPAzY3tPlKdDYNE=;
 b=QgGVqSj9/vY/ScIXZHkFg4nZ9FcUjBaACW3UWckIw63R6YVdpeSZVGykWVEhhnGSOIeuFv
 fLLh/2HSZSbzWoMur+6oF0y8FYfbQfsQGy5IJLvbFKHZ01czicaqRDM+M1OKfBCVFU+/ME
 w2CM/bIMZ5Fgbj47B8VsOLoZi9gqKlw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-T2oOe9cqM9a4gWcPu2XnPQ-1; Wed, 02 Dec 2020 06:03:15 -0500
X-MC-Unique: T2oOe9cqM9a4gWcPu2XnPQ-1
Received: by mail-wr1-f71.google.com with SMTP id x16so3359200wrm.20
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 03:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kU8LLfrD++DTckVdz92f3StgJjIwiPAzY3tPlKdDYNE=;
 b=ukN9dIwPecAa3KRylm/rTYELrZVk/kRXM0/HmANaiBXsjyOcZeVzsbDslqAtHYunhG
 kW/9uGLfud46TwVD2pDc7rYasvgmQmHVEPCwT8J6aGKa5AJVjnELG0MUaZe6q+eo8xlA
 Rok4hyIkLv7UwZTdfombF6ECSkjd/zSTCemboo8pV4TSkhlZbPRERX2n63R1GpGsWOsf
 oi3w7Tnl0bUMpJuXoiRPma4KIaxCbQZP+A1fxqwEcsy4CAPeUMB8h6g/Di0RkWTS7mdx
 XIiue/l6n2Q4hBQr6NxXrONAoj9UeO6KBYN/6vpEdbBNeR8s6bHsQDxe4iC3ZPGdOYLh
 qF1w==
X-Gm-Message-State: AOAM532vizXShYpWWif9EtHJjJWIVPK43QM5JMM+UayIGv6a4JQr8lMe
 8XFWoyTYV8vAFnuWtd+11YTAKucZnzchVF3C8ClGWbNyng3o9hkdEj7ECkjRzFfugsag4NfXFMH
 JCx7DXSNzfpCh7CflSUrHJ4igRn697ZlAUqXLtAWw5BpcqjsoxR0gzsKH8Qj0
X-Received: by 2002:adf:dd52:: with SMTP id u18mr2655924wrm.44.1606906993426; 
 Wed, 02 Dec 2020 03:03:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLXfbjaUo36hYtWvriXUWkOg2QNha+37bTIwj/wt+9KuyVS7IqSZJqGxDFM8IQe79vodgwpA==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr2655877wrm.44.1606906993068; 
 Wed, 02 Dec 2020 03:03:13 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id k6sm1496829wmf.25.2020.12.02.03.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 03:03:12 -0800 (PST)
Date: Wed, 2 Dec 2020 06:03:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] memory: Rename memory_region_notify_one to
 memory_region_notify_iommu_one
Message-ID: <20201202101655.122214-3-mst@redhat.com>
References: <20201202101655.122214-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201202101655.122214-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Previous name didn't reflect the iommu operation.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20201116165506.31315-2-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/exec/memory.h | 6 +++---
 hw/arm/smmu-common.c  | 2 +-
 hw/arm/smmuv3.c       | 2 +-
 hw/i386/intel_iommu.c | 4 ++--
 softmmu/memory.c      | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0f3e6bcd5e..d8456ccf52 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -236,7 +236,7 @@ enum IOMMUMemoryRegionAttr {
  * The IOMMU implementation must use the IOMMU notifier infrastructure
  * to report whenever mappings are changed, by calling
  * memory_region_notify_iommu() (or, if necessary, by calling
- * memory_region_notify_one() for each registered notifier).
+ * memory_region_notify_iommu_one() for each registered notifier).
  *
  * Conceptually an IOMMU provides a mapping from input address
  * to an output TLB entry. If the IOMMU is aware of memory transaction
@@ -1346,7 +1346,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
                                 IOMMUTLBEntry entry);
 
 /**
- * memory_region_notify_one: notify a change in an IOMMU translation
+ * memory_region_notify_iommu_one: notify a change in an IOMMU translation
  *                           entry to a single notifier
  *
  * This works just like memory_region_notify_iommu(), but it only
@@ -1357,7 +1357,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
  *         replaces all old entries for the same virtual I/O address range.
  *         Deleted entries have .@perm == 0.
  */
-void memory_region_notify_one(IOMMUNotifier *notifier,
+void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
                               IOMMUTLBEntry *entry);
 
 /**
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 3838db1395..88d2c454f0 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -472,7 +472,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
     entry.perm = IOMMU_NONE;
     entry.addr_mask = n->end - n->start;
 
-    memory_region_notify_one(n, &entry);
+    memory_region_notify_iommu_one(n, &entry);
 }
 
 /* Unmap all notifiers attached to @mr */
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 22607c3784..273f5f7dce 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -828,7 +828,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.addr_mask = num_pages * (1 << granule) - 1;
     entry.perm = IOMMU_NONE;
 
-    memory_region_notify_one(n, &entry);
+    memory_region_notify_iommu_one(n, &entry);
 }
 
 /* invalidate an asid/iova range tuple in all mr's */
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 70ac837733..067593b9e4 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3497,7 +3497,7 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
         /* This field is meaningless for unmap */
         entry.translated_addr = 0;
 
-        memory_region_notify_one(n, &entry);
+        memory_region_notify_iommu_one(n, &entry);
 
         start += mask;
         remain -= mask;
@@ -3535,7 +3535,7 @@ static void vtd_address_space_refresh_all(IntelIOMMUState *s)
 
 static int vtd_replay_hook(IOMMUTLBEntry *entry, void *private)
 {
-    memory_region_notify_one((IOMMUNotifier *)private, entry);
+    memory_region_notify_iommu_one((IOMMUNotifier *)private, entry);
     return 0;
 }
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 11ca94d037..44de610c72 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1942,8 +1942,8 @@ void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
     memory_region_update_iommu_notify_flags(iommu_mr, NULL);
 }
 
-void memory_region_notify_one(IOMMUNotifier *notifier,
-                              IOMMUTLBEntry *entry)
+void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
+                                    IOMMUTLBEntry *entry)
 {
     IOMMUNotifierFlag request_flags;
     hwaddr entry_end = entry->iova + entry->addr_mask;
@@ -1979,7 +1979,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
 
     IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
         if (iommu_notifier->iommu_idx == iommu_idx) {
-            memory_region_notify_one(iommu_notifier, &entry);
+            memory_region_notify_iommu_one(iommu_notifier, &entry);
         }
     }
 }
-- 
MST


