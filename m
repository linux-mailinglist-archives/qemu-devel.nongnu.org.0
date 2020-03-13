Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F489183E3D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 02:05:20 +0100 (CET)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCYlL-0005uI-GS
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 21:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43807)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1jCYix-0002dI-3l
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:02:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1jCYiv-000478-Of
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:02:51 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:42276 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1jCYiv-0002yl-9L
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:02:49 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 5E3BF1A44F4;
 Fri, 13 Mar 2020 02:01:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from localhost.localdomain (226.87.148.91.adsl.dyn.beotel.net
 [91.148.87.226])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 5B2E41A4173;
 Fri, 13 Mar 2020 02:01:43 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 2/3] MAINTAINERS: Adjust maintainer's email
Date: Fri, 13 Mar 2020 02:00:51 +0100
Message-Id: <1584061252-16635-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584061252-16635-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1584061252-16635-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>

For some longish time I've been using multiple email addresses
for mailing list communication, and would like to consolidate it
into a single email address that is the most convenient to me.
My other emails, from rt-rk.com and wavecomp.com domains remain
active and I will respond from them too, if needed, but I would
like to manage almost all communication using gmail.com account.

Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 .mailmap    |  5 +++--
 MAINTAINERS | 12 ++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/.mailmap b/.mailmap
index 76154c7..e431d1f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -39,8 +39,9 @@ Julia Suvorova <jusual@mail.ru> Julia Suvorova via Qemu=
-devel <qemu-devel@nongnu
 Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via Qemu-dev=
el <qemu-devel@nongnu.org>
=20
 # Next, replace old addresses by a more recent one.
-Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@mips.c=
om>
-Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@imgtec=
.com>
+Aleksandar Markovic <aleksandar.m.mail@gmail.com> <aleksandar.markovic@m=
ips.com>
+Aleksandar Markovic <aleksandar.m.mail@gmail.com> <aleksandar.markovic@i=
mgtec.com>
+Aleksandar Markovic <aleksandar.m.mail@gmail.com> <amarkovic@wavecomp.co=
m>
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm=
.com>
 James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 4fba8b8..8411c96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -209,7 +209,7 @@ F: hw/microblaze/
 F: disas/microblaze.c
=20
 MIPS TCG CPUs
-M: Aleksandar Markovic <amarkovic@wavecomp.com>
+M: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
 R: Aurelien Jarno <aurelien@aurel32.net>
 R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Maintained
@@ -1016,7 +1016,7 @@ F: hw/display/jazz_led.c
 F: hw/dma/rc4030.c
=20
 Malta
-M: Aleksandar Markovic <amarkovic@wavecomp.com>
+M: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
 M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
 S: Maintained
@@ -1029,14 +1029,14 @@ F: tests/acceptance/linux_ssh_mips_malta.py
 F: tests/acceptance/machine_mips_malta.py
=20
 Mipssim
-M: Aleksandar Markovic <amarkovic@wavecomp.com>
+M: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Odd Fixes
 F: hw/mips/mips_mipssim.c
 F: hw/net/mipsnet.c
=20
 R4000
-M: Aleksandar Markovic <amarkovic@wavecomp.com>
+M: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
 R: Aurelien Jarno <aurelien@aurel32.net>
 R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Obsolete
@@ -1044,7 +1044,7 @@ F: hw/mips/mips_r4k.c
=20
 Fulong 2E
 M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
-M: Aleksandar Markovic <amarkovic@wavecomp.com>
+M: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
 S: Odd Fixes
 F: hw/mips/mips_fulong2e.c
 F: hw/isa/vt82c686.c
@@ -2508,7 +2508,7 @@ F: tcg/i386/
 F: disas/i386.c
=20
 MIPS TCG target
-M: Aleksandar Markovic <amarkovic@wavecomp.com>
+M: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
 R: Aurelien Jarno <aurelien@aurel32.net>
 R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Maintained
--=20
2.7.4


