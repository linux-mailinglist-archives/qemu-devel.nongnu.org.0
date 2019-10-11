Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEA2D468A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 19:23:43 +0200 (CEST)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIydi-0007ix-46
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 13:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQw-0006Gz-Sg
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQv-0004UT-Os
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:26 -0400
Received: from relay.sw.ru ([185.231.240.75]:47878)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQv-00046T-Go; Fri, 11 Oct 2019 12:06:25 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQa-0003XG-3v; Fri, 11 Oct 2019 19:06:04 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 019/126] include/block/snapshot.h: rename Error ** parameter
 to more common errp
Date: Fri, 11 Oct 2019 19:04:05 +0300
Message-Id: <20191011160552.22907-20-vsementsov@virtuozzo.com>
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
 include/block/snapshot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/snapshot.h b/include/block/snapshot.h
index b5d5084a12..2bfcd57578 100644
--- a/include/block/snapshot.h
+++ b/include/block/snapshot.h
@@ -78,7 +78,7 @@ int bdrv_snapshot_load_tmp_by_id_or_name(BlockDriverState *bs,
 
 bool bdrv_all_can_snapshot(BlockDriverState **first_bad_bs);
 int bdrv_all_delete_snapshot(const char *name, BlockDriverState **first_bsd_bs,
-                             Error **err);
+                             Error **errp);
 int bdrv_all_goto_snapshot(const char *name, BlockDriverState **first_bad_bs,
                            Error **errp);
 int bdrv_all_find_snapshot(const char *name, BlockDriverState **first_bad_bs);
-- 
2.21.0


