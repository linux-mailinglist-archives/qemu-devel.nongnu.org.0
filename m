Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AAA72A05
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 10:26:24 +0200 (CEST)
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqCbP-0005MF-DU
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 04:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57630)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hqCbD-0004wX-Gu
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 04:26:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hqCbC-0005v4-Ey
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 04:26:11 -0400
Received: from relay.sw.ru ([185.231.240.75]:53828)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hqCbC-0005u4-8C; Wed, 24 Jul 2019 04:26:10 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hqCb8-0002U1-Gp; Wed, 24 Jul 2019 11:26:06 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 24 Jul 2019 11:25:54 +0300
Message-Id: <1563956754-393910-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] Fixes: a6862418fec4072 iotests change in
 051.out
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, mreitz@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, andrey.shinkevich@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch "iotests: Set read-zeroes on in null block driver for Valgrind"
needs the change in 051.out when compared against on the s390 system.

Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/051.out | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/051.out b/tests/qemu-iotests/051.out
index 8993835..554c5ca 100644
--- a/tests/qemu-iotests/051.out
+++ b/tests/qemu-iotests/051.out
@@ -149,23 +149,23 @@ QEMU X.Y.Z monitor - type 'help' for more information
 
 === Cache modes ===
 
-Testing: -drive driver=null-co,cache=none
+Testing: -drive driver=null-co,read-zeroes=on,cache=none
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) quit
 
-Testing: -drive driver=null-co,cache=directsync
+Testing: -drive driver=null-co,read-zeroes=on,cache=directsync
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) quit
 
-Testing: -drive driver=null-co,cache=writeback
+Testing: -drive driver=null-co,read-zeroes=on,cache=writeback
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) quit
 
-Testing: -drive driver=null-co,cache=writethrough
+Testing: -drive driver=null-co,read-zeroes=on,cache=writethrough
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) quit
 
-Testing: -drive driver=null-co,cache=unsafe
+Testing: -drive driver=null-co,read-zeroes=on,cache=unsafe
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) quit
 
-- 
1.8.3.1


