Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FCB59E4C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 16:56:58 +0200 (CEST)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgsJ7-0004YJ-8z
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 10:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59615)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hgrCn-0002Q5-Vr
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 09:46:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hgrCm-0004lb-Li
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 09:46:21 -0400
Received: from relay.sw.ru ([185.231.240.75]:41288)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hgrCm-0004i7-B9; Fri, 28 Jun 2019 09:46:20 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hgrCi-0008NT-Gc; Fri, 28 Jun 2019 16:46:16 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Fri, 28 Jun 2019 16:46:10 +0300
Message-Id: <1561729574-530879-4-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561729574-530879-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1561729574-530879-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v3 3/7] iotests: Add casenotrun report to bash
 tests
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new function _casenotrun() is to be invoked if a test case cannot
be run for some reason. The user will be notified by a message passed
to the function.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/common.rc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 6e461a1..1089050 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -428,6 +428,13 @@ _notrun()
     exit
 }
 
+# bail out, setting up .casenotrun file
+#
+_casenotrun()
+{
+    echo "    [case not run] $*" >>"$OUTPUT_DIR/$seq.casenotrun"
+}
+
 # just plain bail out
 #
 _fail()
-- 
1.8.3.1


