Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456866FDDC9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:26:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwipO-00029F-UK; Wed, 10 May 2023 08:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipH-00026w-NS
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipC-0007de-SK
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcRNvZSPnrgA8YiicWbaOcxWwhN1YUXNnWyb8q0QHvM=;
 b=GEVxdlXIq2iatPzqaHbf+v9d1zPKKrc8cyOAI5TnbrRxXyBaOKaNJ39K9jKzWtiNlkAopg
 DbWfBzhncw6oLoagmqXFHYF+RxhNYgqK+cvk4Yk5ktgTiMRJktplDEUIUM/0eZCXrPvXWW
 uheLUFdaSselClcbQ+m0SB6H+cYwkHU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-K-JtKfxaNnOb3pGS4142Ng-1; Wed, 10 May 2023 08:21:38 -0400
X-MC-Unique: K-JtKfxaNnOb3pGS4142Ng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E4411C087AB;
 Wed, 10 May 2023 12:21:38 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAF3918EC1;
 Wed, 10 May 2023 12:21:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 02/28] block: add missing coroutine_fn annotations
Date: Wed, 10 May 2023 14:20:45 +0200
Message-Id: <20230510122111.46566-3-kwolf@redhat.com>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

After the recent introduction of many new coroutine callbacks,
a couple calls from non-coroutine_fn to coroutine_fn have sneaked
in; fix them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230406101752.242125-1-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/graph-lock.h | 4 ++--
 block/mirror.c             | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 18cc14de22..ac0fef8605 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -208,14 +208,14 @@ typedef struct GraphLockable { } GraphLockable;
  * unlocked. TSA_ASSERT() makes sure that the following calls know that we
  * hold the lock while unlocking is left unchecked.
  */
-static inline GraphLockable * TSA_ASSERT(graph_lock) TSA_NO_TSA
+static inline GraphLockable * TSA_ASSERT(graph_lock) TSA_NO_TSA coroutine_fn
 graph_lockable_auto_lock(GraphLockable *x)
 {
     bdrv_graph_co_rdlock();
     return x;
 }
 
-static inline void TSA_NO_TSA
+static inline void TSA_NO_TSA coroutine_fn
 graph_lockable_auto_unlock(GraphLockable *x)
 {
     bdrv_graph_co_rdunlock();
diff --git a/block/mirror.c b/block/mirror.c
index af9bbd23d4..80fa345071 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -270,8 +270,8 @@ static inline int64_t mirror_clip_bytes(MirrorBlockJob *s,
 
 /* Round offset and/or bytes to target cluster if COW is needed, and
  * return the offset of the adjusted tail against original. */
-static int mirror_cow_align(MirrorBlockJob *s, int64_t *offset,
-                            uint64_t *bytes)
+static int coroutine_fn mirror_cow_align(MirrorBlockJob *s, int64_t *offset,
+                                         uint64_t *bytes)
 {
     bool need_cow;
     int ret = 0;
-- 
2.40.1


