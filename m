Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B11125EB7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 11:17:32 +0100 (CET)
Received: from localhost ([::1]:38256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihss7-0000EP-Im
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 05:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihsqv-0007pb-GK
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:16:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihsqu-0005UO-49
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:16:17 -0500
Received: from relay.sw.ru ([185.231.240.75]:58130)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihsqt-0005Jp-Qm; Thu, 19 Dec 2019 05:16:16 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihsqh-0004pg-9T; Thu, 19 Dec 2019 13:16:03 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: fix qcow2-bitmap.c under Dirty Bitmaps header
Date: Thu, 19 Dec 2019 13:16:03 +0300
Message-Id: <20191219101603.25508-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
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
Cc: vsementsov@virtuozzo.com, jsnow@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Somehow I wrote not full path to the file. Fix that.

Also, while being here, rearrange entries, so that includes go first,
then block, than migration, than util.

Fixes: 052db8e71444d
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

If you don't like rearrangement, keep just
s/qcow2-bitmap.c/block\/qcow2-bitmap.c/

 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 740401bcbb..dc81c89ccb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1870,12 +1870,12 @@ M: John Snow <jsnow@redhat.com>
 R: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 L: qemu-block@nongnu.org
 S: Supported
-F: util/hbitmap.c
-F: block/dirty-bitmap.c
 F: include/qemu/hbitmap.h
 F: include/block/dirty-bitmap.h
-F: qcow2-bitmap.c
+F: block/dirty-bitmap.c
+F: block/qcow2-bitmap.c
 F: migration/block-dirty-bitmap.c
+F: util/hbitmap.c
 F: tests/test-hbitmap.c
 F: docs/interop/bitmaps.rst
 T: git https://github.com/jnsnow/qemu.git bitmaps
-- 
2.21.0


