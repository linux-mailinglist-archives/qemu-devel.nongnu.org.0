Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01556742B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 19:28:11 +0200 (CEST)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlzL8-0000E2-89
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 13:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37284)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hlzKt-000884-2V
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:27:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hlzKs-00039V-59
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:27:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36208)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hlzKr-00033p-VV
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:27:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4DE17C057F30
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 17:27:51 +0000 (UTC)
Received: from localhost (ovpn-112-50.ams2.redhat.com [10.36.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BA845D756;
 Fri, 12 Jul 2019 17:27:47 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 21:27:43 +0400
Message-Id: <20190712172743.17632-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 12 Jul 2019 17:27:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] build-sys: remove slirp cflags from main-loop.o
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Left over from c2d63650d962612cfa1b21302782d4cd12142c74.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 util/Makefile.objs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/Makefile.objs b/util/Makefile.objs
index 38178201ff..68af3cd5e9 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -3,7 +3,6 @@ util-obj-y +=3D bufferiszero.o
 util-obj-y +=3D lockcnt.o
 util-obj-y +=3D aiocb.o async.o aio-wait.o thread-pool.o qemu-timer.o
 util-obj-y +=3D main-loop.o iohandler.o
-main-loop.o-cflags :=3D $(SLIRP_CFLAGS)
 util-obj-$(call lnot,$(CONFIG_ATOMIC64)) +=3D atomic64.o
 util-obj-$(CONFIG_POSIX) +=3D aio-posix.o
 util-obj-$(CONFIG_POSIX) +=3D compatfd.o
--=20
2.22.0.428.g6d5b264208


