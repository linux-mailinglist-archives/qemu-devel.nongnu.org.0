Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D8536F990
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:47:58 +0200 (CEST)
Received: from localhost ([::1]:36848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRcj-0000RI-Jl
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQmA-0005ib-OQ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm7-00037W-Ri
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MDWZp3HzCkJwBfHbLhe5vVY6KKgbFjAKsRMiajceFcA=;
 b=e6TVpMjGXc+8UZ6PCQ/GuDjYpKVvlDi+eWq5Vz4cK/9l56HktpCr8l0w818ffcZ+EJIYN8
 u8HPaNejGk4G0IwXKkbdro2QpxzbaAxUkl5S83BaGgLI105IQmHmrTXOdU0s32b/Nub/ds
 a7xqczQRKPGxkkP/+d/Wkkwcpd/Z4HI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-xYteID1FOnqJBJU3QQQPJw-1; Fri, 30 Apr 2021 06:53:31 -0400
X-MC-Unique: xYteID1FOnqJBJU3QQQPJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 749A6100725C;
 Fri, 30 Apr 2021 10:53:18 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8387C17177;
 Fri, 30 Apr 2021 10:53:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 31/39] block: drop unused permission update functions
Date: Fri, 30 Apr 2021 12:51:39 +0200
Message-Id: <20210430105147.125840-32-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-32-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 103 --------------------------------------------------------
 1 file changed, 103 deletions(-)

diff --git a/block.c b/block.c
index ffaa367a1b..bf7c187435 100644
--- a/block.c
+++ b/block.c
@@ -1987,11 +1987,6 @@ static int bdrv_fill_options(QDict **options, const char *filename,
     return 0;
 }
 
-static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                                  uint64_t new_used_perm,
-                                  uint64_t new_shared_perm,
-                                  Error **errp);
-
 typedef struct BlockReopenQueueEntry {
      bool prepared;
      bool perms_checked;
@@ -2426,56 +2421,12 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
-static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                           uint64_t cumulative_perms,
-                           uint64_t cumulative_shared_perms, Error **errp)
-{
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-    return bdrv_check_perm_common(list, q, true, cumulative_perms,
-                                  cumulative_shared_perms, NULL, errp);
-}
-
 static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
                                    Transaction *tran, Error **errp)
 {
     return bdrv_check_perm_common(list, q, false, 0, 0, tran, errp);
 }
 
-/*
- * Notifies drivers that after a previous bdrv_check_perm() call, the
- * permission update is not performed and any preparations made for it (e.g.
- * taken file locks) need to be undone.
- */
-static void bdrv_node_abort_perm_update(BlockDriverState *bs)
-{
-    BlockDriver *drv = bs->drv;
-    BdrvChild *c;
-
-    if (!drv) {
-        return;
-    }
-
-    bdrv_drv_set_perm_abort(bs);
-
-    QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_set_perm_abort(c);
-    }
-}
-
-static void bdrv_list_abort_perm_update(GSList *list)
-{
-    for ( ; list; list = list->next) {
-        bdrv_node_abort_perm_update((BlockDriverState *)list->data);
-    }
-}
-
-__attribute__((unused))
-static void bdrv_abort_perm_update(BlockDriverState *bs)
-{
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-    return bdrv_list_abort_perm_update(list);
-}
-
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
@@ -2557,60 +2508,6 @@ char *bdrv_perm_names(uint64_t perm)
     return g_string_free(result, FALSE);
 }
 
-/*
- * Checks whether a new reference to @bs can be added if the new user requires
- * @new_used_perm/@new_shared_perm as its permissions. If @ignore_children is
- * set, the BdrvChild objects in this list are ignored in the calculations;
- * this allows checking permission updates for an existing reference.
- *
- * Needs to be followed by a call to either bdrv_set_perm() or
- * bdrv_abort_perm_update(). */
-__attribute__((unused))
-static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                                  uint64_t new_used_perm,
-                                  uint64_t new_shared_perm,
-                                  Error **errp)
-{
-    BdrvChild *c;
-    uint64_t cumulative_perms = new_used_perm;
-    uint64_t cumulative_shared_perms = new_shared_perm;
-
-
-    /* There is no reason why anyone couldn't tolerate write_unchanged */
-    assert(new_shared_perm & BLK_PERM_WRITE_UNCHANGED);
-
-    QLIST_FOREACH(c, &bs->parents, next_parent) {
-        if ((new_used_perm & c->shared_perm) != new_used_perm) {
-            char *user = bdrv_child_user_desc(c);
-            char *perm_names = bdrv_perm_names(new_used_perm & ~c->shared_perm);
-
-            error_setg(errp, "Conflicts with use by %s as '%s', which does not "
-                             "allow '%s' on %s",
-                       user, c->name, perm_names, bdrv_get_node_name(c->bs));
-            g_free(user);
-            g_free(perm_names);
-            return -EPERM;
-        }
-
-        if ((c->perm & new_shared_perm) != c->perm) {
-            char *user = bdrv_child_user_desc(c);
-            char *perm_names = bdrv_perm_names(c->perm & ~new_shared_perm);
-
-            error_setg(errp, "Conflicts with use by %s as '%s', which uses "
-                             "'%s' on %s",
-                       user, c->name, perm_names, bdrv_get_node_name(c->bs));
-            g_free(user);
-            g_free(perm_names);
-            return -EPERM;
-        }
-
-        cumulative_perms |= c->perm;
-        cumulative_shared_perms &= c->shared_perm;
-    }
-
-    return bdrv_check_perm(bs, q, cumulative_perms, cumulative_shared_perms,
-                           errp);
-}
 
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
-- 
2.30.2


