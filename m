Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E403717E6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 14:16:43 +0200 (CEST)
Received: from localhost ([::1]:42018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hptik-0007A1-81
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 08:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38007)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hptiK-0006Mc-8c
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 08:16:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hptiJ-00009U-CG
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 08:16:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36716)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hptiJ-00008o-7G
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 08:16:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8DCA181F11
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 12:16:14 +0000 (UTC)
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E306952FA0;
 Tue, 23 Jul 2019 12:16:08 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 16:16:04 +0400
Message-Id: <20190723121605.491-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 23 Jul 2019 12:16:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] configure: remove AUTOCONF_HOST
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a left-over from commit
c12b6d70e384c769ca372e15ffd19b3e9f563662 ("pixman: drop submodule")

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 configure | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/configure b/configure
index ad0b8582bf..82c65ab46a 100755
--- a/configure
+++ b/configure
@@ -7351,11 +7351,6 @@ if test "$sparse" =3D "yes" ; then
   echo "HOST_CC      :=3D REAL_CC=3D\"\$(HOST_CC)\" cgcc"  >> $config_ho=
st_mak
   echo "QEMU_CFLAGS  +=3D -Wbitwise -Wno-transparent-union -Wno-old-init=
ializer -Wno-non-pointer-null" >> $config_host_mak
 fi
-if test "$cross_prefix" !=3D ""; then
-  echo "AUTOCONF_HOST :=3D --host=3D${cross_prefix%-}"     >> $config_ho=
st_mak
-else
-  echo "AUTOCONF_HOST :=3D "                             >> $config_host=
_mak
-fi
 echo "LDFLAGS=3D$LDFLAGS" >> $config_host_mak
 echo "LDFLAGS_NOPIE=3D$LDFLAGS_NOPIE" >> $config_host_mak
 echo "QEMU_LDFLAGS=3D$QEMU_LDFLAGS" >> $config_host_mak
--=20
2.22.0.545.g9c9b961d7e


