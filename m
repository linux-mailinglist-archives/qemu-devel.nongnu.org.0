Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18694B965F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 19:13:09 +0200 (CEST)
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBMSy-0006Zx-6u
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 13:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iBMRz-0005rA-O0
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 13:12:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iBMRy-0005HD-RQ
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 13:12:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8626)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iBMRy-0005Gm-Mb; Fri, 20 Sep 2019 13:12:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B9194796EF;
 Fri, 20 Sep 2019 17:12:05 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 121A55D6B0;
 Fri, 20 Sep 2019 17:12:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] roms: Add a 'make help' target alias
Date: Fri, 20 Sep 2019 19:11:59 +0200
Message-Id: <20190920171159.18633-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 20 Sep 2019 17:12:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various C projects provide a 'make help' target. Our root directory
does so. The roms/ directory lacks a such rule, but already displays
a help output when the default target is called.
Add a 'help' target aliased to the default one, to avoid:

  $ make -C roms help
  make: *** No rule to make target 'help'.  Stop.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 roms/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/Makefile b/roms/Makefile
index 6cf07d3b44..3ffd13cc7e 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -51,7 +51,7 @@ SEABIOS_EXTRAVERSION=3D"-prebuilt.qemu.org"
 #
 EDK2_EFIROM =3D edk2/BaseTools/Source/C/bin/EfiRom
=20
-default:
+default help:
 	@echo "nothing is build by default"
 	@echo "available build targets:"
 	@echo "  bios               -- update bios.bin (seabios)"
--=20
2.20.1


