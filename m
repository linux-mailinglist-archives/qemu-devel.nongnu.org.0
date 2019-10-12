Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A39AD4DD1
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 08:57:40 +0200 (CEST)
Received: from localhost ([::1]:59162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJBLP-0007qD-JW
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 02:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iJBIZ-0004Bb-5s
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 02:54:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iJBIX-0006H6-UM
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 02:54:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34460)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iJBIV-0006Fy-K7; Sat, 12 Oct 2019 02:54:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D403E3003A49;
 Sat, 12 Oct 2019 06:54:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-46.brq.redhat.com [10.40.204.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE0C25D6C8;
 Sat, 12 Oct 2019 06:54:36 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM
 machines
Date: Sat, 12 Oct 2019 08:54:25 +0200
Message-Id: <20191012065426.10772-3-philmd@redhat.com>
In-Reply-To: <20191012065426.10772-1-philmd@redhat.com>
References: <20191012065426.10772-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Sat, 12 Oct 2019 06:54:38 +0000 (UTC)
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

Not all ARM machines sections Cc the qemu-arm@nongnu.org list,
fix this.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 47eae9fc46..65fbc6d7b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -805,6 +805,7 @@ F: hw/arm/virt-acpi-build.c
 STM32F205
 M: Alistair Francis <alistair@alistair23.me>
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/stm32f205_soc.c
 F: hw/misc/stm32f2xx_syscfg.c
@@ -817,12 +818,14 @@ F: include/hw/*/stm32*.h
 Netduino 2
 M: Alistair Francis <alistair@alistair23.me>
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/netduino2.c
=20
 SmartFusion2
 M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/msf2-soc.c
 F: hw/misc/msf2-sysreg.c
@@ -836,6 +839,7 @@ F: include/hw/ssi/mss-spi.h
 Emcraft M2S-FG484
 M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/msf2-som.c
=20
@@ -1349,6 +1353,7 @@ T: git https://github.com/jnsnow/qemu.git ide
=20
 OMAP
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/omap*
 F: include/hw/arm/omap.h
--=20
2.21.0


