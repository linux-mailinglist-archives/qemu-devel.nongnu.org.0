Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC486F54A5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:26:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8km-0004ib-2g; Wed, 03 May 2023 05:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8kj-0004hq-TW
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:26:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8ki-00031o-El
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfae15PDbIUOl2CyCIvk9wObK0g/RFtr2m1QrHA2W6Q=;
 b=LxL+nJR0NitjmOi68bKgcoUGcvrqmrsJExiaTFb5PcO/5EcmdHqYkMwYNgKRGRjN+Hf5UQ
 jU4cf0HbddWOeHMgbAZIRVthwPUI0TNX4fL+hyNqFFZvx0lLKGXxf/rYyhe/GHcs7Ztce5
 poTrF/5Nb7BP7WGmP9eTBcnXzYeEkDw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-dUVUv7VoMuOz1jKW2NbP3A-1; Wed, 03 May 2023 05:26:13 -0400
X-MC-Unique: dUVUv7VoMuOz1jKW2NbP3A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9B553822DE4;
 Wed,  3 May 2023 09:26:12 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9743492C3E;
 Wed,  3 May 2023 09:26:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 4/8] migration: Rename RAMStats to MigrationAtomicStats
Date: Wed,  3 May 2023 11:26:02 +0200
Message-Id: <20230503092606.9415-5-quintela@redhat.com>
In-Reply-To: <20230503092606.9415-1-quintela@redhat.com>
References: <20230503092606.9415-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

It is lousely based on MigrationStats, but that name is taken, so this
is the best one that I came with.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>

---

If you have any good suggestion for the name, I am all ears.
---
 migration/migration-stats.c | 2 +-
 migration/migration-stats.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/migration-stats.c b/migration/migration-stats.c
index 8c0af9b80a..2f2cea965c 100644
--- a/migration/migration-stats.c
+++ b/migration/migration-stats.c
@@ -14,4 +14,4 @@
 #include "qemu/stats64.h"
 #include "migration-stats.h"
 
-RAMStats mig_stats;
+MigrationAtomicStats mig_stats;
diff --git a/migration/migration-stats.h b/migration/migration-stats.h
index 197374b4f6..149af932d7 100644
--- a/migration/migration-stats.h
+++ b/migration/migration-stats.h
@@ -34,8 +34,8 @@ typedef struct {
     Stat64 postcopy_requests;
     Stat64 precopy_bytes;
     Stat64 transferred;
-} RAMStats;
+} MigrationAtomicStats;
 
-extern RAMStats mig_stats;
+extern MigrationAtomicStats mig_stats;
 
 #endif
-- 
2.40.0


