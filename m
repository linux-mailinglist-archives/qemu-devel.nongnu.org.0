Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AA86E7FA5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:30:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAhI-0001X3-Et; Wed, 19 Apr 2023 12:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAh5-0001Wb-FL
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAh2-00011w-Gi
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y0dZg58tRMXQ4MvavCmmQmnruG9c+QmEihiDD4OHKXc=;
 b=deBLZ+AaytiPD3CVfXVeIhkO7UFG7a4INjZwKszUcBitrNkf/C3o1i8uPSFikpDw8HZrmK
 /nEJ8QBUvOGsWw/UxxE7Iu3yfeD1s+pHV0z7mgWZs72AlA8pTG56vJYMjIw/fOZBgp/dkZ
 Hpu8wt1uJ5sG3jWNqEAg+aoMCC2b4pk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-87oRT_-EPLKcHjuvZ2ntVg-1; Wed, 19 Apr 2023 12:29:59 -0400
X-MC-Unique: 87oRT_-EPLKcHjuvZ2ntVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6574B85A5B1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 16:29:59 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 917ED408572A;
 Wed, 19 Apr 2023 16:29:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH] MAINTAINERS: Add Leonardo and Peter as reviewers
Date: Wed, 19 Apr 2023 18:29:57 +0200
Message-Id: <20230419162957.16696-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Now that David has stepped down with Migration maintainership,
Leonardo and Peter has volunteer to review the migration patches.
This way they got CC'd on every migration patch.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c2068ea5c..4171f47253 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3149,6 +3149,8 @@ F: scripts/checkpatch.pl
 
 Migration
 M: Juan Quintela <quintela@redhat.com>
+R: Peter Xu <peterx@redhat.com>
+R: Leonardo Bras <leobras@redhat.com>
 S: Maintained
 F: hw/core/vmstate-if.c
 F: include/hw/vmstate-if.h
-- 
2.39.2


