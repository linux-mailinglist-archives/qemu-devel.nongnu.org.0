Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A6E30416B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:06:31 +0100 (CET)
Received: from localhost ([::1]:48156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PvK-0004G3-QL
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEe-0001ND-5y
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEV-0006bP-K3
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXpQ32MWWW65e8kdJRIqTJuSu1JGex+SxJ1YibLXwbc=;
 b=SHPPNWa1dmijGxSRaE9NjyfA5m1P05+7wOuE2nq9a/mFZH+Og8TyXzpjLRtjScrEm9ntPu
 lr1sBbytW/5jsJszQVj0qsMKseH2vLHGnptWbkGrC0kx7WuLaEZdLXIwWJDwj2gSJFi/Ze
 gZao2vsqmrwVcMiz6Zy1BivBVdTYNcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-zZsOzJIqMNiWCYOWMltWuw-1; Tue, 26 Jan 2021 09:22:04 -0500
X-MC-Unique: zZsOzJIqMNiWCYOWMltWuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0F8510054FF;
 Tue, 26 Jan 2021 14:22:03 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69B9D10023B9;
 Tue, 26 Jan 2021 14:22:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 46/53] block/block-copy: drop unused argument of block_copy()
Date: Tue, 26 Jan 2021 15:20:09 +0100
Message-Id: <20210126142016.806073-47-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-21-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h |  2 +-
 block/backup-top.c         |  2 +-
 block/block-copy.c         | 10 ++--------
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 1cbea0b79b..338f2ea7fd 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -35,7 +35,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
-                            bool ignore_ratelimit, bool *error_is_read);
+                            bool ignore_ratelimit);
 
 /*
  * Run block-copy in a coroutine, create corresponding BlockCopyCallState
diff --git a/block/backup-top.c b/block/backup-top.c
index 779956ddc2..6e7e7bf340 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -61,7 +61,7 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     off = QEMU_ALIGN_DOWN(offset, s->cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, s->cluster_size);
 
-    return block_copy(s->bcs, off, end - off, true, NULL);
+    return block_copy(s->bcs, off, end - off, true);
 }
 
 static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
diff --git a/block/block-copy.c b/block/block-copy.c
index 2ea8b28684..39ae481c8b 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -723,7 +723,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 }
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
-                            bool ignore_ratelimit, bool *error_is_read)
+                            bool ignore_ratelimit)
 {
     BlockCopyCallState call_state = {
         .s = s,
@@ -733,13 +733,7 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
         .max_workers = BLOCK_COPY_MAX_WORKERS,
     };
 
-    int ret = block_copy_common(&call_state);
-
-    if (error_is_read && ret < 0) {
-        *error_is_read = call_state.error_is_read;
-    }
-
-    return ret;
+    return block_copy_common(&call_state);
 }
 
 static void coroutine_fn block_copy_async_co_entry(void *opaque)
-- 
2.29.2


