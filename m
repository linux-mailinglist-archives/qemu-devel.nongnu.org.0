Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3530942A8D5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 17:52:47 +0200 (CEST)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maK57-0006g2-Uu
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 11:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maK3G-0004ax-NT
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:50:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maK3E-0001Sk-N6
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634053847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ML4rEtXzdoTx73YugYhZgMy6mnF2jd937q9gmu2w1UE=;
 b=AMzOIxqRax35Z0cIOhY39a07Wc1cpwqieghKcm8CZ0b5WZTT6f/HZTW7rNuaYxCry6XSmK
 KN8hlBUPM8wqIRQaZw2Bi1Ixf8wMMLLVGrzRj1n+MIY9kbpIxpmW5C1JEXZYIWCAEbn3DT
 wLLFHjKhRUj1cOPnh9BK6b+hZr3409A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-CHWYEPsjO1GYM-VzEDNGZQ-1; Tue, 12 Oct 2021 11:50:46 -0400
X-MC-Unique: CHWYEPsjO1GYM-VzEDNGZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 514F21922962;
 Tue, 12 Oct 2021 15:50:45 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BEFD5B826;
 Tue, 12 Oct 2021 15:50:43 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] util: Make some iova_tree parameters const
Date: Tue, 12 Oct 2021 17:50:01 +0200
Message-Id: <20211012155001.811160-2-eperezma@redhat.com>
In-Reply-To: <20211012155001.811160-1-eperezma@redhat.com>
References: <20211012155001.811160-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As qemu guidelines:
Unless a pointer is used to modify the pointed-to storage, give it the
"const" attribute.

In the particular case of iova_tree_find it allows to enforce what is
requested by its comment, since the compiler would shout in case of
modifying or freeing the const-qualified returned pointer.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/qemu/iova-tree.h |  8 ++++----
 hw/i386/intel_iommu.c    |  2 +-
 util/iova-tree.c         | 10 +++++-----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index b66cf93c4b..8249edd764 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -59,7 +59,7 @@ IOVATree *iova_tree_new(void);
  *
  * Return: 0 if succeeded, or <0 if error.
  */
-int iova_tree_insert(IOVATree *tree, DMAMap *map);
+int iova_tree_insert(IOVATree *tree, const DMAMap *map);
 
 /**
  * iova_tree_remove:
@@ -74,7 +74,7 @@ int iova_tree_insert(IOVATree *tree, DMAMap *map);
  *
  * Return: 0 if succeeded, or <0 if error.
  */
-int iova_tree_remove(IOVATree *tree, DMAMap *map);
+int iova_tree_remove(IOVATree *tree, const DMAMap *map);
 
 /**
  * iova_tree_find:
@@ -92,7 +92,7 @@ int iova_tree_remove(IOVATree *tree, DMAMap *map);
  * user is responsible to make sure the pointer is valid (say, no
  * concurrent deletion in progress).
  */
-DMAMap *iova_tree_find(IOVATree *tree, DMAMap *map);
+const DMAMap *iova_tree_find(const IOVATree *tree, const DMAMap *map);
 
 /**
  * iova_tree_find_address:
@@ -105,7 +105,7 @@ DMAMap *iova_tree_find(IOVATree *tree, DMAMap *map);
  *
  * Return: same as iova_tree_find().
  */
-DMAMap *iova_tree_find_address(IOVATree *tree, hwaddr iova);
+const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
 
 /**
  * iova_tree_foreach:
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 75f075547f..33a8af9191 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1105,7 +1105,7 @@ static int vtd_page_walk_one(IOMMUTLBEvent *event, vtd_page_walk_info *info)
         .translated_addr = entry->translated_addr,
         .perm = entry->perm,
     };
-    DMAMap *mapped = iova_tree_find(as->iova_tree, &target);
+    const DMAMap *mapped = iova_tree_find(as->iova_tree, &target);
 
     if (event->type == IOMMU_NOTIFIER_UNMAP && !info->notify_unmap) {
         trace_vtd_page_walk_one_skip_unmap(entry->iova, entry->addr_mask);
diff --git a/util/iova-tree.c b/util/iova-tree.c
index 7990692cbd..8ca6af21cf 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -42,12 +42,12 @@ IOVATree *iova_tree_new(void)
     return iova_tree;
 }
 
-DMAMap *iova_tree_find(IOVATree *tree, DMAMap *map)
+const DMAMap *iova_tree_find(const IOVATree *tree, const DMAMap *map)
 {
     return g_tree_lookup(tree->tree, map);
 }
 
-DMAMap *iova_tree_find_address(IOVATree *tree, hwaddr iova)
+const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova)
 {
     DMAMap map = { .iova = iova, .size = 0 };
 
@@ -60,7 +60,7 @@ static inline void iova_tree_insert_internal(GTree *gtree, DMAMap *range)
     g_tree_insert(gtree, range, range);
 }
 
-int iova_tree_insert(IOVATree *tree, DMAMap *map)
+int iova_tree_insert(IOVATree *tree, const DMAMap *map)
 {
     DMAMap *new;
 
@@ -96,9 +96,9 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
     g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
 }
 
-int iova_tree_remove(IOVATree *tree, DMAMap *map)
+int iova_tree_remove(IOVATree *tree, const DMAMap *map)
 {
-    DMAMap *overlap;
+    const DMAMap *overlap;
 
     while ((overlap = iova_tree_find(tree, map))) {
         g_tree_remove(tree->tree, overlap);
-- 
2.27.0


