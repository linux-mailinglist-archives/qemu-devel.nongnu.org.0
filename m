Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624EDE598E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Oct 2019 12:14:06 +0200 (CEST)
Received: from localhost ([::1]:39538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOJ5A-00042f-VU
	for lists+qemu-devel@lfdr.de; Sat, 26 Oct 2019 06:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iOJ3g-0002kx-97
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 06:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iOJ3e-0006Vx-Bv
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 06:12:32 -0400
Received: from relay.sw.ru ([185.231.240.75]:38060)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iOJ3a-0006Ty-Dd; Sat, 26 Oct 2019 06:12:26 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iOJ3W-0003wH-4z; Sat, 26 Oct 2019 13:12:22 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] qemu-iotests/iotests.py: improve assert_qmp message
Date: Sat, 26 Oct 2019 13:12:21 +0300
Message-Id: <20191026101221.5506-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make it obvious, from the two values which is found at path and which
is expected.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

It's a pain, I can never remember it, and checking each time in source
code who is who is boring.

 tests/qemu-iotests/iotests.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 709def4d5d..e805b9ab14 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -729,8 +729,8 @@ class QMPTestCase(unittest.TestCase):
             self.fail('no match for "%s" in %s' % (str(result), str(value)))
         else:
             self.assertEqual(result, value,
-                             'values not equal "%s" and "%s"'
-                                 % (str(result), str(value)))
+                             '"%s" is "%s", expected "%s"'
+                                 % (path, str(result), str(value)))
 
     def assert_no_active_block_jobs(self):
         result = self.vm.qmp('query-block-jobs')
-- 
2.21.0


