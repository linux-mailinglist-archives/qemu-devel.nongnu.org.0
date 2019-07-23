Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300CD717BC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 14:08:27 +0200 (CEST)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hptaj-00008X-Tg
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 08:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36249)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hptaY-0008C6-S6
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 08:08:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hptaX-0002xv-Tm
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 08:08:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50488)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hptaX-0002wd-Oj
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 08:08:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 096913082120
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 12:08:12 +0000 (UTC)
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88E1C5C221;
 Tue, 23 Jul 2019 12:08:08 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 16:08:04 +0400
Message-Id: <20190723120804.29565-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 23 Jul 2019 12:08:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] docs: correct kconfig option
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

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 docs/devel/kconfig.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index d6f8eb0977..b7bca44704 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -267,7 +267,7 @@ the default configuration by uncommenting lines in th=
e first group,
 or commenting out lines in the second group.
=20
 It is also possible to run QEMU's configure script with the
-``--with-default-devices`` option.  When this is done, everything defaul=
ts
+``--without-default-devices`` option.  When this is done, everything def=
aults
 to ``n`` unless it is ``select``ed or explicitly switched on in the
 ``.mak`` files.  In other words, ``default`` and ``imply`` directives
 are disabled.  When QEMU is built with this option, the user will probab=
ly
--=20
2.22.0.545.g9c9b961d7e


