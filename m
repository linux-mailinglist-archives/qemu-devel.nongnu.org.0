Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888E62620F8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 22:21:32 +0200 (CEST)
Received: from localhost ([::1]:33490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFk7P-00037X-Ds
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 16:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kFjxq-0003YE-5l
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 16:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kFjxm-0005Vj-AB
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 16:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599595893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BXuRcRLMTbXUoHfT8lfyy/r7PwPbnUCYbnx/1Sn718A=;
 b=E0wLL/0C2LAOFH3Q8aoGBkPXAd/TQBfZ7p9zTcWOfUcUwEUzQv5NBECOCzuVTtIcYAmCC2
 wTTbb+OwwkMfGDvBNsuZwieJn9TOJq1iMlmjLUOU3kHuM/45ftiJDCfKJDqoh+mq5xtlRU
 UckJTQw1tONAWRwHn/7XtIuLThMdPW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-XZm5jBdfMWqVlQwztfZ9eA-1; Tue, 08 Sep 2020 16:11:31 -0400
X-MC-Unique: XZm5jBdfMWqVlQwztfZ9eA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A9FD18B9ED3;
 Tue,  8 Sep 2020 20:11:30 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 363D6838A6;
 Tue,  8 Sep 2020 20:11:30 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] memory: Convert IOMMUMemoryRegionClass doc comment to
 kernel-doc
Date: Tue,  8 Sep 2020 16:11:29 -0400
Message-Id: <20200908201129.3407568-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the existing documentation comments of
IOMMUMemoryRegionClass to kernel-doc format so their contents
will appear in the API reference at docs/devel/memory.html.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/exec/memory.h | 52 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index f1bb2a7df5..c01475a4e9 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -211,7 +211,7 @@ enum IOMMUMemoryRegionAttr {
     IOMMU_ATTR_SPAPR_TCE_FD
 };
 
-/*
+/**
  * IOMMUMemoryRegionClass:
  *
  * All IOMMU implementations need to subclass TYPE_IOMMU_MEMORY_REGION
@@ -228,8 +228,11 @@ enum IOMMUMemoryRegionAttr {
  * attributes and the output TLB entry depends on the transaction
  * attributes, we represent this using IOMMU indexes. Each index
  * selects a particular translation table that the IOMMU has:
+ *
  *   @attrs_to_index returns the IOMMU index for a set of transaction attributes
+ *
  *   @translate takes an input address and an IOMMU index
+ *
  * and the mapping returned can only depend on the input address and the
  * IOMMU index.
  *
@@ -238,10 +241,13 @@ enum IOMMUMemoryRegionAttr {
  * for secure transactions and one for non-secure transactions.
  */
 struct IOMMUMemoryRegionClass {
-    /* private */
+    /* private: */
     MemoryRegionClass parent_class;
 
-    /*
+    /* public: */
+    /**
+     * @translate:
+     *
      * Return a TLB entry that contains a given address.
      *
      * The IOMMUAccessFlags indicated via @flag are optional and may
@@ -262,26 +268,38 @@ struct IOMMUMemoryRegionClass {
      * information when the IOMMU mapping changes.
      *
      * @iommu: the IOMMUMemoryRegion
+     *
      * @hwaddr: address to be translated within the memory region
-     * @flag: requested access permissions
+     *
+     * @flag: requested access permission
+     *
      * @iommu_idx: IOMMU index for the translation
      */
     IOMMUTLBEntry (*translate)(IOMMUMemoryRegion *iommu, hwaddr addr,
                                IOMMUAccessFlags flag, int iommu_idx);
-    /* Returns minimum supported page size in bytes.
+    /**
+     * @get_min_page_size:
+     *
+     * Returns minimum supported page size in bytes.
+     *
      * If this method is not provided then the minimum is assumed to
      * be TARGET_PAGE_SIZE.
      *
      * @iommu: the IOMMUMemoryRegion
      */
     uint64_t (*get_min_page_size)(IOMMUMemoryRegion *iommu);
-    /* Called when IOMMU Notifier flag changes (ie when the set of
+    /**
+     * @notify_flag_changed:
+     *
+     * Called when IOMMU Notifier flag changes (ie when the set of
      * events which IOMMU users are requesting notification for changes).
      * Optional method -- need not be provided if the IOMMU does not
      * need to know exactly which events must be notified.
      *
      * @iommu: the IOMMUMemoryRegion
+     *
      * @old_flags: events which previously needed to be notified
+     *
      * @new_flags: events which now need to be notified
      *
      * Returns 0 on success, or a negative errno; in particular
@@ -293,7 +311,10 @@ struct IOMMUMemoryRegionClass {
                                IOMMUNotifierFlag old_flags,
                                IOMMUNotifierFlag new_flags,
                                Error **errp);
-    /* Called to handle memory_region_iommu_replay().
+    /**
+     * @replay:
+     *
+     * Called to handle memory_region_iommu_replay().
      *
      * The default implementation of memory_region_iommu_replay() is to
      * call the IOMMU translate method for every page in the address space
@@ -310,7 +331,10 @@ struct IOMMUMemoryRegionClass {
      */
     void (*replay)(IOMMUMemoryRegion *iommu, IOMMUNotifier *notifier);
 
-    /* Get IOMMU misc attributes. This is an optional method that
+    /**
+     * @get_attr:
+     *
+     * Get IOMMU misc attributes. This is an optional method that
      * can be used to allow users of the IOMMU to get implementation-specific
      * information. The IOMMU implements this method to handle calls
      * by IOMMU users to memory_region_iommu_get_attr() by filling in
@@ -319,7 +343,9 @@ struct IOMMUMemoryRegionClass {
      * memory_region_iommu_get_attr() will always return -EINVAL.
      *
      * @iommu: the IOMMUMemoryRegion
+     *
      * @attr: attribute being queried
+     *
      * @data: memory to fill in with the attribute data
      *
      * Returns 0 on success, or a negative errno; in particular
@@ -328,7 +354,10 @@ struct IOMMUMemoryRegionClass {
     int (*get_attr)(IOMMUMemoryRegion *iommu, enum IOMMUMemoryRegionAttr attr,
                     void *data);
 
-    /* Return the IOMMU index to use for a given set of transaction attributes.
+    /**
+     * @attrs_to_index:
+     *
+     * Return the IOMMU index to use for a given set of transaction attributes.
      *
      * Optional method: if an IOMMU only supports a single IOMMU index then
      * the default implementation of memory_region_iommu_attrs_to_index()
@@ -341,7 +370,10 @@ struct IOMMUMemoryRegionClass {
      */
     int (*attrs_to_index)(IOMMUMemoryRegion *iommu, MemTxAttrs attrs);
 
-    /* Return the number of IOMMU indexes this IOMMU supports.
+    /**
+     * @num_indexes:
+     *
+     * Return the number of IOMMU indexes this IOMMU supports.
      *
      * Optional method: if this method is not provided, then
      * memory_region_iommu_num_indexes() will return 1, indicating that
-- 
2.26.2


