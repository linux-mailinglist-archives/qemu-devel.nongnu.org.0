Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBC1149D7E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 00:04:04 +0100 (CET)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ivqwl-0000pY-58
	for lists+qemu-devel@lfdr.de; Sun, 26 Jan 2020 18:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33577)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ivqpz-000627-J2
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:57:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ivqpy-0000ay-9M
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:57:03 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:37961 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ivqpx-0000R4-W6
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:57:02 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id F17D41A1DEE;
 Sun, 26 Jan 2020 23:56:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id D8EC71A1DBD;
 Sun, 26 Jan 2020 23:56:12 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH rc3 22/30] target/avr: Update MAINTAINERS file
Date: Sun, 26 Jan 2020 23:55:03 +0100
Message-Id: <1580079311-20447-23-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580079311-20447-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1580079311-20447-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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

Include AVR maintaners in MAINTAINERS file

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
[rth: Squash ordering fixes from f4bug]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 MAINTAINERS | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f6511d5..0678e12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -163,6 +163,14 @@ S: Maintained
 F: hw/arm/smmu*
 F: include/hw/arm/smmu*
=20
+AVR TCG CPUs
+M: Michael Rolnik <mrolnik@gmail.com>
+R: Sarah Harris <S.E.Harris@kent.ac.uk>
+S: Maintained
+F: target/avr/
+F: default-configs/avr-softmmu.mak
+F: gdb-xml/avr-cpu.xml
+
 CRIS TCG CPUs
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
@@ -880,6 +888,22 @@ F: include/hw/*/nrf51*.h
 F: include/hw/*/microbit*.h
 F: tests/qtest/microbit-test.c
=20
+AVR Machines
+-------------
+
+Atmel MCU
+M: Michael Rolnik <mrolnik@gmail.com>
+R: Sarah Harris <S.E.Harris@kent.ac.uk>
+S: Maintained
+F: hw/avr/
+F: hw/char/atmel_usart.c
+F: include/hw/char/atmel_usart.h
+F: hw/timer/atmel_timer16.c
+F: include/hw/timer/atmel_timer16.h
+F: hw/misc/atmel_power.c
+F: include/hw/misc/atmel_power.h
+F: tests/acceptance/machine_avr6.py
+
 CRIS Machines
 -------------
 Axis Dev88
--=20
2.7.4


