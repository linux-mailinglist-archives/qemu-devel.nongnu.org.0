Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E41A1198
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 08:14:57 +0200 (CEST)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3Dhw-0001Hi-8y
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 02:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dc0-0004Cr-E6
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dby-0003gU-5o
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:48 -0400
Received: from ozlabs.org ([203.11.71.1]:53931)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i3Dbx-0003an-Bk; Thu, 29 Aug 2019 02:08:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46JscM695mz9sNm; Thu, 29 Aug 2019 16:08:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1567058915;
 bh=WM51eU6vWwyC8U78xgMnWL3Pvd8ZXXmqNs5ivePxRYk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MQixGeBuQqC9o+JxxhMkHLsj/EeuOg8rQAqW+bJ1nqOnqSvaM/eHfAGuSZ+e+150R
 ky3tCs37axX1XRwBiUAFJAAGWS1b12EtTW8IxjWtE7nPVv46zeyCHUOY+KnABTJpmx
 lD+jI6qNv/fWyXTiePCA4zFORYqgD0q0jPB59aQU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Thu, 29 Aug 2019 16:08:14 +1000
Message-Id: <20190829060827.25731-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829060827.25731-1-david@gibson.dropbear.id.au>
References: <20190829060827.25731-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 06/19] tests/boot-serial-test: add support for
 all the PowerNV machines
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, groug@kaod.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

Use the machine names specifiying the CPU type, POWER8 and POWER9.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190731141233.1340-3-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 tests/boot-serial-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
index 24852d4c7d..a54d007298 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -103,7 +103,8 @@ static testdef_t tests[] =3D {
     { "ppc64", "pseries",
       "-machine cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=3Dbroken",
       "Open Firmware" },
-    { "ppc64", "powernv", "-cpu POWER8", "OPAL" },
+    { "ppc64", "powernv8", "", "OPAL" },
+    { "ppc64", "powernv9", "", "OPAL" },
     { "ppc64", "sam460ex", "-device e1000", "8086  100e" },
     { "i386", "isapc", "-cpu qemu32 -device sga", "SGABIOS" },
     { "i386", "pc", "-device sga", "SGABIOS" },
--=20
2.21.0


