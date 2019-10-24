Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7951E327F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 14:37:45 +0200 (CEST)
Received: from localhost ([::1]:41194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNcN6-0007Ld-Iw
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 08:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60274)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNaz6-0002do-91
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNaz4-0007ZT-88
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:08:51 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:50372 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iNaz3-00072e-TP
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:08:50 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 05B101A21E0;
 Thu, 24 Oct 2019 13:07:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id CF9BC1A21B9;
 Thu, 24 Oct 2019 13:07:44 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] MAINTAINERS: Update mail address of Aleksandar Rikalo
Date: Thu, 24 Oct 2019 13:06:27 +0200
Message-Id: <1571915195-4381-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571915195-4381-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1571915195-4381-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Aleksandar Rikalo wishes to change his primary mail address for QEMU.
Some minor line order is corrected in .mailmap to be alphabetical,
too.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1571826227-10583-4-git-send-email-aleksandar.markovic@rt-rk.=
com>
---
 .mailmap    |  5 +++--
 MAINTAINERS | 18 +++++++++---------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/.mailmap b/.mailmap
index 0756a0b..3816e4e 100644
--- a/.mailmap
+++ b/.mailmap
@@ -39,10 +39,11 @@ Julia Suvorova <jusual@mail.ru> Julia Suvorova via Qe=
mu-devel <qemu-devel@nongnu
 Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via Qemu-dev=
el <qemu-devel@nongnu.org>
=20
 # Next, replace old addresses by a more recent one.
-Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm=
.com>
-James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@mips.c=
om>
 Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@imgtec=
.com>
+Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
+Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm=
.com>
+James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
 Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
 Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index ed41d7d..92cec69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -208,7 +208,7 @@ F: disas/microblaze.c
 MIPS TCG CPUs
 M: Aurelien Jarno <aurelien@aurel32.net>
 M: Aleksandar Markovic <amarkovic@wavecomp.com>
-R: Aleksandar Rikalo <arikalo@wavecomp.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Maintained
 F: target/mips/
 F: default-configs/*mips*
@@ -363,7 +363,7 @@ F: target/arm/kvm.c
=20
 MIPS KVM CPUs
 M: James Hogan <jhogan@kernel.org>
-R: Aleksandar Rikalo <arikalo@wavecomp.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Maintained
 F: target/mips/kvm.c
=20
@@ -934,7 +934,7 @@ MIPS Machines
 -------------
 Jazz
 M: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
-R: Aleksandar Rikalo <arikalo@wavecomp.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Maintained
 F: hw/mips/mips_jazz.c
 F: hw/display/jazz_led.c
@@ -942,7 +942,7 @@ F: hw/dma/rc4030.c
=20
 Malta
 M: Aurelien Jarno <aurelien@aurel32.net>
-R: Aleksandar Rikalo <arikalo@wavecomp.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Maintained
 F: hw/mips/mips_malta.c
 F: hw/mips/gt64xxx_pci.c
@@ -950,20 +950,20 @@ F: tests/acceptance/linux_ssh_mips_malta.py
=20
 Mipssim
 M: Aleksandar Markovic <amarkovic@wavecomp.com>
-R: Aleksandar Rikalo <arikalo@wavecomp.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Odd Fixes
 F: hw/mips/mips_mipssim.c
 F: hw/net/mipsnet.c
=20
 R4000
 M: Aurelien Jarno <aurelien@aurel32.net>
-R: Aleksandar Rikalo <arikalo@wavecomp.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Maintained
 F: hw/mips/mips_r4k.c
=20
 Fulong 2E
 M: Aleksandar Markovic <amarkovic@wavecomp.com>
-R: Aleksandar Rikalo <arikalo@wavecomp.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Odd Fixes
 F: hw/mips/mips_fulong2e.c
 F: hw/isa/vt82c686.c
@@ -972,7 +972,7 @@ F: include/hw/isa/vt82c686.h
=20
 Boston
 M: Paul Burton <pburton@wavecomp.com>
-R: Aleksandar Rikalo <arikalo@wavecomp.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Maintained
 F: hw/core/loader-fit.c
 F: hw/mips/boston.c
@@ -2352,7 +2352,7 @@ F: disas/i386.c
=20
 MIPS TCG target
 M: Aurelien Jarno <aurelien@aurel32.net>
-R: Aleksandar Rikalo <arikalo@wavecomp.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
 S: Maintained
 F: tcg/mips/
=20
--=20
2.7.4


