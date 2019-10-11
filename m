Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C6DD45B4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 18:48:59 +0200 (CEST)
Received: from localhost ([::1]:54134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIy64-0003wS-Mm
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 12:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35987)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQZ-0005d0-4Q
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQY-00044c-4z
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:03 -0400
Received: from relay.sw.ru ([185.231.240.75]:47830)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQX-00043e-Ti; Fri, 11 Oct 2019 12:06:02 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQW-0003XG-8v; Fri, 11 Oct 2019 19:06:00 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 011/126] block/snapshot: rename Error ** parameter to more
 common errp
Date: Fri, 11 Oct 2019 19:03:57 +0300
Message-Id: <20191011160552.22907-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/snapshot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index 8081616ae9..bd9fb01817 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -426,7 +426,7 @@ fail:
 }
 
 int bdrv_all_delete_snapshot(const char *name, BlockDriverState **first_bad_bs,
-                             Error **err)
+                             Error **errp)
 {
     int ret = 0;
     BlockDriverState *bs;
@@ -441,7 +441,7 @@ int bdrv_all_delete_snapshot(const char *name, BlockDriverState **first_bad_bs,
             bdrv_snapshot_find(bs, snapshot, name) >= 0)
         {
             ret = bdrv_snapshot_delete(bs, snapshot->id_str,
-                                       snapshot->name, err);
+                                       snapshot->name, errp);
         }
         aio_context_release(ctx);
         if (ret < 0) {
-- 
2.21.0


