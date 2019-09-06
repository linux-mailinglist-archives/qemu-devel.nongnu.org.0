Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12FDABC74
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 17:27:26 +0200 (CEST)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6G90-0006VN-1p
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 11:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i6G8C-000646-1T
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 11:26:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i6G8A-0006uq-G3
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 11:26:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41716)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1i6G8A-0006uH-AV; Fri, 06 Sep 2019 11:26:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 533DF3082E40;
 Fri,  6 Sep 2019 15:26:33 +0000 (UTC)
Received: from thuth.com (ovpn-116-159.ams2.redhat.com [10.36.116.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19E645D9E1;
 Fri,  6 Sep 2019 15:26:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Sep 2019 17:26:24 +0200
Message-Id: <20190906152624.14784-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 06 Sep 2019 15:26:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests/Makefile: test-char does not need
 libqtest
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to link the libqtest objects here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index a35431ca0a..7ee2f9cb5d 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -525,7 +525,7 @@ tests/check-qlit$(EXESUF): tests/check-qlit.o $(test-util-obj-y)
 tests/check-qom-interface$(EXESUF): tests/check-qom-interface.o $(test-qom-obj-y)
 tests/check-qom-proplist$(EXESUF): tests/check-qom-proplist.o $(test-qom-obj-y)
 
-tests/test-char$(EXESUF): tests/test-char.o $(test-util-obj-y) $(qtest-obj-y) $(test-io-obj-y) $(chardev-obj-y) tests/socket-helpers.o
+tests/test-char$(EXESUF): tests/test-char.o $(test-util-obj-y) $(test-io-obj-y) $(chardev-obj-y) tests/socket-helpers.o
 tests/test-coroutine$(EXESUF): tests/test-coroutine.o $(test-block-obj-y)
 tests/test-aio$(EXESUF): tests/test-aio.o $(test-block-obj-y)
 tests/test-aio-multithread$(EXESUF): tests/test-aio-multithread.o $(test-block-obj-y)
-- 
2.18.1


