Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13420AB749
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 13:41:15 +0200 (CEST)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6Cc5-0003iv-UK
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 07:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i6CaO-00030b-Ow
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 07:39:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i6CaN-0002QE-P3
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 07:39:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42024)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1i6CaL-0002Mu-2R; Fri, 06 Sep 2019 07:39:25 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 15FE918C4274;
 Fri,  6 Sep 2019 11:39:24 +0000 (UTC)
Received: from thuth.com (ovpn-116-159.ams2.redhat.com [10.36.116.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99B195D9CA;
 Fri,  6 Sep 2019 11:39:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Date: Fri,  6 Sep 2019 13:39:20 +0200
Message-Id: <20190906113920.11271-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 06 Sep 2019 11:39:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests/qemu-iotests/check: Replace "tests" with
 "iotests" in final status text
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running "make check -j8" or something similar, the iotests are
running in parallel with the other tests. So when they are printing
out "Passed all xx tests" or a similar status message at the end,
it might not be quite clear that this message belongs to the iotests,
since the output might be mixed with the other tests. Thus change the
word "tests" here to "iotests" instead to avoid confusion.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/check | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index c24874ff4a..2f1cf72abc 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -694,12 +694,12 @@ END        { if (NR > 0) {
         if [ ! -z "$n_bad" -a $n_bad != 0 ]
         then
             echo "Failures:$bad"
-            echo "Failed $n_bad of $try tests"
+            echo "Failed $n_bad of $try iotests"
             echo "Failures:$bad" | fmt >>check.log
-            echo "Failed $n_bad of $try tests" >>check.log
+            echo "Failed $n_bad of $try iotests" >>check.log
         else
-            echo "Passed all $try tests"
-            echo "Passed all $try tests" >>check.log
+            echo "Passed all $try iotests"
+            echo "Passed all $try iotests" >>check.log
         fi
         needwrap=false
     fi
-- 
2.18.1


