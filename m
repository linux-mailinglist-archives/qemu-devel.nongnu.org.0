Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC0FCB7BB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 11:57:46 +0200 (CEST)
Received: from localhost ([::1]:43956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKLI-0007qW-H7
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 05:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52535)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2O-00052d-EX
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2M-0005BE-Td
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42557 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK2M-00058q-HM; Fri, 04 Oct 2019 05:38:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YK04Khz9sRm; Fri,  4 Oct 2019 19:37:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181877;
 bh=oFOUAI0FQ1OPjYv4ZCW6kaltnufymeOV+pdcvMdgoCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dJyv8Yi+pWTpa0GAdxbHUq/88k2/AWcBv9aEngXy/K3EvM3kNchsPGRKQ5MceAD2p
 8R6WOBh31axES2aK6ilp+SNxKFXQFoSk9JU3O3Ubpuj3k9+2tNcdvGMsm+HIe2gJav
 LdAa9t9XO6IkTc5LF5x3+hgLhW3K0/rCjKd2zgTs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 21/53] pseries: Update SLOF firmware image
Date: Fri,  4 Oct 2019 19:37:15 +1000
Message-Id: <20191004093747.31350-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

This fixes USB host bus adapter name in the device tree to match QEMU's
one.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 930656 -> 930640 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/pc-bios/README b/pc-bios/README
index ad78f6dc49..0b0b5d42ad 100644
--- a/pc-bios/README
+++ b/pc-bios/README
@@ -17,7 +17,7 @@
 - SLOF (Slimline Open Firmware) is a free IEEE 1275 Open Firmware
   implementation for certain IBM POWER hardware.  The sources are at
   https://github.com/aik/SLOF, and the image currently in qemu is
-  built from git tag qemu-slof-20190827.
+  built from git tag qemu-slof-20190911.
=20
 - sgabios (the Serial Graphics Adapter option ROM) provides a means for
   legacy x86 software to communicate with an attached serial console as
diff --git a/pc-bios/slof.bin b/pc-bios/slof.bin
index a3a3e4933278461a08c8b58ad0da6741bb6b3d1b..2af0c5d5fc0c6aa06c34016f6=
deb767700ad4d3f 100644
GIT binary patch
delta 329
zcmaFx%;Lf`iwWjp0qL0~x=3DG2&#>pnBrpZQziG``Tr3RA~8D-fNBsm4eR3;XP@Lb<`
zv*14z0Hypk-dkiZfUL>D&@^rH1cxn57Qv|n3WkOXMh1qK3WjD@MkZE9hP+$~Zs7`H
zsYS(^`FRSq3g}jXb=3DNq1A0=3DCN`+p8bAZ7w$W*}w(Vpbq#+y0+}ed9$bjjSK(%0kNn
zO^x%LuLq|Ec!*A#>F(@orJyl=3Dtsb9j`}14uK+FNeoIuP4#N6AT-{P5Yo3n!f44A#A
cH*Di|V=3Dq=3DxC@oG>+J1K%Z+#8Rvgsum0R3EcBme*a

delta 345
zcmccc%;Lc_iwWjp3F(<7x~YjqMuuhv28o7-W`(J_r3RA~8D-fNBstW@%qJFz@LZZ%
z`13y$0Hypk-dkiZfUL>F!q{;01cxn57LKLq3P$D%Mh1qK3WjD@#^zQAmb_dFZs7`H
zsYS(^`FRSq3g}jXb=3DNq1A0=3DCN`+p8bAZ7w$W*}w(Vpbq#+y0+}ed9$bN9!%GngbU&
zADehRaI;IBl7`udz3$G=3DRtg%^=3Dj!pvwm-kc4#XTl%n8I?K+L`U`7NFaw>f7pfB|##
t^oDJ`ZsJM`rNv1~3PvfV1qvytWtqvTx_ODYsoT$P<E^h@VfK2g4FEIEd71zK

diff --git a/roms/SLOF b/roms/SLOF
index ea221600a1..bcc3c4e5c2 160000
--- a/roms/SLOF
+++ b/roms/SLOF
@@ -1 +1 @@
-Subproject commit ea221600a116883137ef90b2b7ab7d2472bc4f10
+Subproject commit bcc3c4e5c21a015f4680894c4ec978a90d4a2d69
--=20
2.21.0


