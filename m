Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4985B3D1BC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 18:08:12 +0200 (CEST)
Received: from localhost ([::1]:60532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hajJj-0005aV-3S
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 12:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57485)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1haie7-0004is-O6
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 11:25:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1haie3-0006UT-VS
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 11:25:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23425)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1haie0-0006Qw-1i
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 11:25:04 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C286F3082208
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 15:24:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B8DB1001B07;
 Tue, 11 Jun 2019 15:24:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DAE291136422; Tue, 11 Jun 2019 17:24:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 17:24:46 +0200
Message-Id: <20190611152448.29436-11-armbru@redhat.com>
In-Reply-To: <20190611152448.29436-1-armbru@redhat.com>
References: <20190611152448.29436-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 11 Jun 2019 15:24:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 10/12] MAINTAINERS: Remove duplicate entries of
 qemu-devel@nongnu.org
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The list is always selected by the 'All patches CC here' section.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[Conflicts resolved by redoing the patch]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ef00e8a70d..869766346b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -110,7 +110,6 @@ L: qemu-s390x@nongnu.org
 Guest CPU cores (TCG):
 ----------------------
 Overall
-L: qemu-devel@nongnu.org
 M: Richard Henderson <rth@twiddle.net>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
@@ -446,19 +445,16 @@ F: util/*posix*.c
 F: include/qemu/*posix*.h
=20
 NETBSD
-L: qemu-devel@nongnu.org
 M: Kamil Rytarowski <kamil@netbsd.org>
 S: Maintained
 K: ^Subject:.*(?i)NetBSD
=20
 OPENBSD
-L: qemu-devel@nongnu.org
 M: Brad Smith <brad@comstyle.com>
 S: Maintained
 K: ^Subject:.*(?i)OpenBSD
=20
 W32, W64
-L: qemu-devel@nongnu.org
 M: Stefan Weil <sw@weilnetz.de>
 S: Maintained
 F: *win32*
@@ -567,7 +563,6 @@ F: include/hw/*/digic*
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
-L: qemu-devel@nongnu.org
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/gumstix.c
@@ -1046,7 +1041,6 @@ F: pc-bios/qemu_vga.ndrv
=20
 PReP
 M: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
-L: qemu-devel@nongnu.org
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/prep.c
@@ -1842,7 +1836,6 @@ S: Supported
 F: scripts/coverity-model.c
=20
 CPU
-L: qemu-devel@nongnu.org
 S: Supported
 F: qom/cpu.c
 F: include/qom/cpu.h
@@ -2577,7 +2570,6 @@ F: qapi/rdma.json
=20
 Semihosting
 M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
-L: qemu-devel@nongnu.org
 S: Maintained
 F: hw/semihosting/
 F: include/hw/semihosting/
@@ -2588,7 +2580,6 @@ Build and test automation
 M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
 M: Fam Zheng <fam@euphon.net>
 R: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
-L: qemu-devel@nongnu.org
 S: Maintained
 F: .travis.yml
 F: scripts/travis/
@@ -2603,7 +2594,6 @@ W: http://patchew.org/QEMU/
 FreeBSD Hosted Continuous Integration
 M: Ed Maste <emaste@freebsd.org>
 M: Li-Wen Hsu <lwhsu@freebsd.org>
-L: qemu-devel@nongnu.org
 S: Maintained
 F: .cirrus.yml
 W: https://cirrus-ci.com/github/qemu/qemu
@@ -2619,7 +2609,6 @@ R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 S: Maintained
 F: tests/tcg/Makefile
 F: tests/tcg/Makefile.include
-L: qemu-devel@nongnu.org
=20
 Documentation
 -------------
--=20
2.21.0


