Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2530D155095
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 03:11:29 +0100 (CET)
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izt7A-0001cw-4n
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 21:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1izsvm-0006K3-Gr
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 20:59:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1izsvj-0001Ma-NW
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 20:59:42 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:53230 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1izsvj-0001AT-CN
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 20:59:39 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 0C75A1A20F2;
 Fri,  7 Feb 2020 02:58:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id CE6D01A20E9;
 Fri,  7 Feb 2020 02:58:23 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH rc5 31/32] target/avr: Simplify sections in MAINTAINERS file
Date: Fri,  7 Feb 2020 02:57:59 +0100
Message-Id: <1581040680-308-32-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581040680-308-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1581040680-308-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Rolnik <mrolnik@gmail.com>

Simplify sections for AVR maintanenance in MAINTAINERS file.

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
[rth: Squash ordering fixes from f4bug]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Reviewed-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 MAINTAINERS | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 33ddbcc..a8e2144 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -167,19 +167,9 @@ AVR TCG CPUs
 M: Michael Rolnik <mrolnik@gmail.com>
 R: Sarah Harris <S.E.Harris@kent.ac.uk>
 S: Maintained
+F: target/avr/
+F: default-configs/avr-softmmu.mak
 F: gdb-xml/avr-cpu.xml
-F: target/avr/Makefile.objs
-F: target/avr/cpu-param.h
-F: target/avr/cpu-qom.h
-F: target/avr/cpu.h
-F: target/avr/cpu.c
-F: target/avr/disas.c
-F: target/avr/helper.h
-F: target/avr/helper.c
-F: target/avr/gdbstub.c
-F: target/avr/machine.c
-F: target/avr/translate.c
-F: target/avr/insn.decode
 F: tests/acceptance/machine_avr6.py
=20
 CRIS TCG CPUs
@@ -914,13 +904,7 @@ AVR MCUs
 M: Michael Rolnik <mrolnik@gmail.com>
 R: Sarah Harris <S.E.Harris@kent.ac.uk>
 S: Maintained
-F: default-configs/avr-softmmu.mak
-F: hw/avr/Kconfig
-F: hw/avr/Makefile.objs
-F: hw/avr/boot.h
-F: hw/avr/boot.c
-F: hw/avr/atmega.h
-F: hw/avr/atmega.c
+F: hw/avr/
 F: include/hw/char/avr_usart.h
 F: hw/char/avr_usart.c
 F: include/hw/timer/avr_timer16.h
--=20
2.7.4


