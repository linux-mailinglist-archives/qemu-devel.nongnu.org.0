Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E39284208
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 23:20:37 +0200 (CEST)
Received: from localhost ([::1]:43510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPXuO-0003X6-0Z
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 17:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPXkr-0000G9-7C
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 17:10:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPXkn-0007VB-Nx
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 17:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601932241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6mjwRssty9u8VVE9TYy5V6D+c+F3D0e09kwIT5voW4=;
 b=C7IQ4N43+mmmEsZaRKPuXgH2DsrQkOlBNF5AjocGAWaN61k8No4SJFUWOE3WRZD7tmUfKO
 30y1q3F5i5k6Xm7CezzBZNouU3Xg1d8khaKGSPGDVg5xNwPH1zzbFw7OGdIys9KDkKY3aQ
 x719QrSiENrcN4QcZad1tgPlTyajlDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-rhZiGEXEPIKZWgkOsOKOWw-1; Mon, 05 Oct 2020 17:10:39 -0400
X-MC-Unique: rhZiGEXEPIKZWgkOsOKOWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B244925C47;
 Mon,  5 Oct 2020 21:10:38 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD77160C84;
 Mon,  5 Oct 2020 21:10:37 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 20/21] memory: Explicitly tag doc comments for structs
Date: Mon,  5 Oct 2020 17:09:59 -0400
Message-Id: <20201005211000.710404-21-ehabkost@redhat.com>
In-Reply-To: <20201005211000.710404-1-ehabkost@redhat.com>
References: <20201005211000.710404-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to remove the QEMU-specific
$decl_type='type name' hack from the kernel-doc script.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201003024123.193840-5-ehabkost@redhat.com>
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


