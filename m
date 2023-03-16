Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C126BD315
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpHb-0001Ub-SJ; Thu, 16 Mar 2023 11:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHS-0001RN-Tt
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHR-0003Ii-FG
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678979556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWhea6iw3dwLxvuEPeKR6oDJbMOZb9wjBsr0s6KkMNE=;
 b=f7ZSy6iSfMbinCnju732LPv+YPp8sGM2ZjKqSdB4uWQYNgcvIUBkmWTZLingJGeIbQXK7v
 06cYJMWOD1tWYSp1qPg7pYL+6KBD/0ziOdPd5uD/z04ZTND3rtJcsAeDH+PUUpryq2czf4
 8KsJCtLTQE3YxsPB0Lfp7AGr40Irkvg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-tam3AYlvPxeRKxQBpIy-XA-1; Thu, 16 Mar 2023 11:12:33 -0400
X-MC-Unique: tam3AYlvPxeRKxQBpIy-XA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F24C811E7B;
 Thu, 16 Mar 2023 15:12:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E724E492B00;
 Thu, 16 Mar 2023 15:12:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Li Zhijian <lizhijian@fujitsu.com>
Subject: [PULL 5/7] migration/rdma: Remove deprecated variable rdma_return_path
Date: Thu, 16 Mar 2023 16:12:23 +0100
Message-Id: <20230316151225.11362-6-quintela@redhat.com>
In-Reply-To: <20230316151225.11362-1-quintela@redhat.com>
References: <20230316151225.11362-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Li Zhijian <lizhijian@fujitsu.com>

It's no longer needed since commit
44bcfd45e98 ("migration/rdma: destination: create the return patch after the first accept")

Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/rdma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 9d70e9885b..df646be35e 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -4111,7 +4111,7 @@ static void rdma_accept_incoming_migration(void *opaque)
 void rdma_start_incoming_migration(const char *host_port, Error **errp)
 {
     int ret;
-    RDMAContext *rdma, *rdma_return_path = NULL;
+    RDMAContext *rdma;
     Error *local_err = NULL;
 
     trace_rdma_start_incoming_migration();
@@ -4157,7 +4157,6 @@ err:
         g_free(rdma->host_port);
     }
     g_free(rdma);
-    g_free(rdma_return_path);
 }
 
 void rdma_start_outgoing_migration(void *opaque,
-- 
2.39.2


