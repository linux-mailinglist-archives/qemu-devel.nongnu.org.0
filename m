Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9861D4DCF
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 08:56:37 +0200 (CEST)
Received: from localhost ([::1]:59150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJBKO-0005te-P3
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 02:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iJBIb-0004Ga-Rj
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 02:54:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iJBIa-0006Ht-LY
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 02:54:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38036)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iJBIY-0006H0-6W; Sat, 12 Oct 2019 02:54:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6ED2310DCCA4;
 Sat, 12 Oct 2019 06:54:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-46.brq.redhat.com [10.40.204.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DBB65D6C8;
 Sat, 12 Oct 2019 06:54:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] MAINTAINERS: Move the OMAP section inside the ARM
 Machines one
Date: Sat, 12 Oct 2019 08:54:26 +0200
Message-Id: <20191012065426.10772-4-philmd@redhat.com>
In-Reply-To: <20191012065426.10772-1-philmd@redhat.com>
References: <20191012065426.10772-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Sat, 12 Oct 2019 06:54:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the Siemens SX1 (OMAP310) machines with the other ARM machines.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65fbc6d7b4..87afc1126a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -558,6 +558,13 @@ F: include/hw/arm/digic.h
 F: hw/*/digic*
 F: include/hw/*/digic*
=20
+OMAP
+M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/*/omap*
+F: include/hw/arm/omap.h
+
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
@@ -1351,13 +1358,6 @@ F: include/hw/block/fdc.h
 F: tests/fdc-test.c
 T: git https://github.com/jnsnow/qemu.git ide
=20
-OMAP
-M: Peter Maydell <peter.maydell@linaro.org>
-L: qemu-arm@nongnu.org
-S: Maintained
-F: hw/*/omap*
-F: include/hw/arm/omap.h
-
 IPack
 M: Alberto Garcia <berto@igalia.com>
 S: Odd Fixes
--=20
2.21.0


