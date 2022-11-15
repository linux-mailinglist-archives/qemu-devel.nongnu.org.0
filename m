Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C08A629E29
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 16:55:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouxzx-0006r8-9g; Tue, 15 Nov 2022 10:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxzn-0006aj-1n
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxzf-0000NY-L2
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668526619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shYvfY1m4aFGTKlg3Ec60OJ8M+Vs1dd+K/kBHRLF7PM=;
 b=aYoFRRjG/+lp+/aGWL/dFw1rJeZl3aZ/yIHbN6LuF5/Pro7y/1gIDVQuWNT/fWscMdSsrk
 RYwJa9RwzY7sadLrYxwWnsDAJhh0n2VX+OVMSGoI/VMjx3aVPp3nDzzpuWxylitKmUKRnT
 1ycd1hY9KhIzPNm9odTBhQjsKj0MdF4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-onBYmOvePEeY8T-9yrgpEw-1; Tue, 15 Nov 2022 10:36:55 -0500
X-MC-Unique: onBYmOvePEeY8T-9yrgpEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 658F8811E75;
 Tue, 15 Nov 2022 15:36:54 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D99982166B2B;
 Tue, 15 Nov 2022 15:36:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>
Subject: [PULL 30/30] migration: Block migration comment or code is wrong
Date: Tue, 15 Nov 2022 16:35:14 +0100
Message-Id: <20221115153514.28003-31-quintela@redhat.com>
In-Reply-To: <20221115153514.28003-1-quintela@redhat.com>
References: <20221115153514.28003-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

And it appears that what is wrong is the code. During bulk stage we
need to make sure that some block is dirty, but no games with
max_size at all.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 migration/block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 3577c815a9..4347da1526 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -880,8 +880,8 @@ static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
     blk_mig_unlock();
 
     /* Report at least one block pending during bulk phase */
-    if (pending <= max_size && !block_mig_state.bulk_completed) {
-        pending = max_size + BLK_MIG_BLOCK_SIZE;
+    if (!pending && !block_mig_state.bulk_completed) {
+        pending = BLK_MIG_BLOCK_SIZE;
     }
 
     trace_migration_block_save_pending(pending);
-- 
2.38.1


