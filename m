Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A471EB3CF7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 16:56:05 +0200 (CEST)
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9sQ7-00017I-W3
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 10:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i9ruA-0002sV-4P
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:23:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i9ru9-0000be-2W
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:23:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i9ru6-0000aK-KO; Mon, 16 Sep 2019 10:22:58 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EEE4A18CB8F5;
 Mon, 16 Sep 2019 14:22:57 +0000 (UTC)
Received: from localhost (unknown [10.40.205.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8633A196AE;
 Mon, 16 Sep 2019 14:22:57 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 16 Sep 2019 16:22:33 +0200
Message-Id: <20190916142246.31474-4-mreitz@redhat.com>
In-Reply-To: <20190916142246.31474-1-mreitz@redhat.com>
References: <20190916142246.31474-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Mon, 16 Sep 2019 14:22:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 03/16] tests/qemu-iotests/check: Replace "tests"
 with "iotests" in final status text
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

From: Thomas Huth <thuth@redhat.com>

When running "make check -j8" or something similar, the iotests are
running in parallel with the other tests. So when they are printing
out "Passed all xx tests" or a similar status message at the end,
it might not be quite clear that this message belongs to the iotests,
since the output might be mixed with the other tests. Thus change the
word "tests" here to "iotests" instead to avoid confusion.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-id: 20190906113920.11271-1-thuth@redhat.com
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/check | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index a58232eefb..875399d79f 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -694,12 +694,12 @@ END        { if (NR > 0) {
         if [ ! -z "$n_bad" -a $n_bad !=3D 0 ]
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
         needwrap=3Dfalse
     fi
--=20
2.21.0


