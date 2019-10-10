Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE08D2DB8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 17:28:28 +0200 (CEST)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIaMd-0008O2-Id
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 11:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60767)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIaJv-0006Bu-1N
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:25:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIaJu-0004WK-1u
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:25:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60676)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIaJq-0004VT-Qg; Thu, 10 Oct 2019 11:25:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0DD3818C8933;
 Thu, 10 Oct 2019 15:25:34 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7922060C18;
 Thu, 10 Oct 2019 15:25:33 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 11/23] iotests/182: Create socket in $SOCK_DIR
Date: Thu, 10 Oct 2019 17:24:45 +0200
Message-Id: <20191010152457.17713-12-mreitz@redhat.com>
In-Reply-To: <20191010152457.17713-1-mreitz@redhat.com>
References: <20191010152457.17713-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Thu, 10 Oct 2019 15:25:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/182 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/182 b/tests/qemu-iotests/182
index 7f494eb9bb..1ccb850055 100755
--- a/tests/qemu-iotests/182
+++ b/tests/qemu-iotests/182
@@ -31,7 +31,7 @@ _cleanup()
 {
     _cleanup_test_img
     rm -f "$TEST_IMG.overlay"
-    rm -f "$TEST_DIR/nbd.socket"
+    rm -f "$SOCK_DIR/nbd.socket"
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
=20
@@ -133,7 +133,7 @@ success_or_failure=3Dy _send_qemu_cmd $QEMU_HANDLE \
           'addr': {
               'type': 'unix',
               'data': {
-                  'path': '$TEST_DIR/nbd.socket'
+                  'path': '$SOCK_DIR/nbd.socket'
               } } } }" \
     'return' \
     'error'
--=20
2.21.0


