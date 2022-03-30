Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA494ECC8A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:42:05 +0200 (CEST)
Received: from localhost ([::1]:54498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdGe-0003IN-N2
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:42:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd6R-00062p-I8
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:31:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd6P-0006VY-TY
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648665088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4hRd/1JFpc+TVhaJIVv0c3bcCXb/Sz/bn/9yvm/rPhA=;
 b=UKCcTCvnNd7sWn0yM8cm1qprBDA9oQEo8cMle0gLXxqv/jugOv48dmWOILuSzxyVH9LhpH
 4akK8Ce0SUmc5hl/pJmF1qu7Z11yfUAi2YN2GU6afENICZDMU479Ldgu2XQGppqt04fHyo
 oAdYozOOGbEQNlt+p7BbtA1mcmUse8U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-gnPYKkJSNDqPzP3ZoH8XGw-1; Wed, 30 Mar 2022 14:31:26 -0400
X-MC-Unique: gnPYKkJSNDqPzP3ZoH8XGw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 675B33802AD4;
 Wed, 30 Mar 2022 18:31:26 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B3BB57ECEF;
 Wed, 30 Mar 2022 18:31:23 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 01/19] util: Return void on iova_tree_remove
Date: Wed, 30 Mar 2022 20:30:58 +0200
Message-Id: <20220330183116.358598-2-eperezma@redhat.com>
In-Reply-To: <20220330183116.358598-1-eperezma@redhat.com>
References: <20220330183116.358598-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It always returns IOVA_OK so nobody uses it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/qemu/iova-tree.h | 4 +---
 util/iova-tree.c         | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index c938fb0793..16bbfdf5f8 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -72,10 +72,8 @@ int iova_tree_insert(IOVATree *tree, const DMAMap *map);
  * provided.  The range does not need to be exactly what has inserted,
  * all the mappings that are included in the provided range will be
  * removed from the tree.  Here map->translated_addr is meaningless.
- *
- * Return: 0 if succeeded, or <0 if error.
  */
-int iova_tree_remove(IOVATree *tree, const DMAMap *map);
+void iova_tree_remove(IOVATree *tree, const DMAMap *map);
 
 /**
  * iova_tree_find:
diff --git a/util/iova-tree.c b/util/iova-tree.c
index 6dff29c1f6..fee530a579 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -164,15 +164,13 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
     g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
 }
 
-int iova_tree_remove(IOVATree *tree, const DMAMap *map)
+void iova_tree_remove(IOVATree *tree, const DMAMap *map)
 {
     const DMAMap *overlap;
 
     while ((overlap = iova_tree_find(tree, map))) {
         g_tree_remove(tree->tree, overlap);
     }
-
-    return IOVA_OK;
 }
 
 /**
-- 
2.27.0


