Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F62282096
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 04:43:41 +0200 (CEST)
Received: from localhost ([::1]:41548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOXWN-00049S-R4
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 22:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kOXUN-0002R9-JQ
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 22:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kOXUL-0002gP-Vu
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 22:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601692893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VXfXRoELIFszkw+f0Ls5+aw7iUG5vmbgXIN3bdgSt0=;
 b=fbsWAjnrEm+Tpr6e6XyeoqOoeWz6bkXMR0picwRHks4iI7Eo0C6TYZFR79NPIsxcc8BrKX
 Wsw0TfiTrq5LQJf+3fbHDvSebw3mbjQEbJQfwLvul7ZflNOaH9R/e8RJJ5oA6Pt54siIpF
 98B0d2P91fvFNXQsuy/fb1gm22s9k9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-TWyXorWVNeyqRc23t3262g-1; Fri, 02 Oct 2020 22:41:31 -0400
X-MC-Unique: TWyXorWVNeyqRc23t3262g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 124191853DA5;
 Sat,  3 Oct 2020 02:41:30 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCDD575261;
 Sat,  3 Oct 2020 02:41:29 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] memory: Explicitly tag doc comments for structs
Date: Fri,  2 Oct 2020 22:41:22 -0400
Message-Id: <20201003024123.193840-5-ehabkost@redhat.com>
In-Reply-To: <20201003024123.193840-1-ehabkost@redhat.com>
References: <20201003024123.193840-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 21:51:44
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to remove the QEMU-specific
$decl_type='type name' hack from the kernel-doc script.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/exec/memory.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index dee09851622..622207bde12 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -443,7 +443,7 @@ struct IOMMUMemoryRegion {
     QLIST_FOREACH((n), &(mr)->iommu_notify, node)
 
 /**
- * MemoryListener: callbacks structure for updates to the physical memory map
+ * struct MemoryListener: callbacks structure for updates to the physical memory map
  *
  * Allows a component to adjust to changes in the guest-visible memory map.
  * Use with memory_listener_register() and memory_listener_unregister().
@@ -681,7 +681,7 @@ struct MemoryListener {
 };
 
 /**
- * AddressSpace: describes a mapping of addresses to #MemoryRegion objects
+ * struct AddressSpace: describes a mapping of addresses to #MemoryRegion objects
  */
 struct AddressSpace {
     /* private: */
@@ -721,7 +721,7 @@ static inline FlatView *address_space_to_flatview(AddressSpace *as)
 
 
 /**
- * MemoryRegionSection: describes a fragment of a #MemoryRegion
+ * struct MemoryRegionSection: describes a fragment of a #MemoryRegion
  *
  * @mr: the region, or %NULL if empty
  * @fv: the flat view of the address space the region is mapped in
-- 
2.26.2


