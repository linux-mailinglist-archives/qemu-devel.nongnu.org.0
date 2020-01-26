Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9156149D86
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 00:07:39 +0100 (CET)
Received: from localhost ([::1]:38098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ivr0E-0007QG-RF
	for lists+qemu-devel@lfdr.de; Sun, 26 Jan 2020 18:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ivqq0-00063h-7q
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:57:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ivqpy-0000aw-9O
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:57:04 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:37958 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ivqpy-0000R2-0A
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:57:02 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 4009F1A1DCB;
 Sun, 26 Jan 2020 23:56:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 1BA371A1DBD;
 Sun, 26 Jan 2020 23:56:10 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH rc3 19/30] target/avr: Add section about AVR into QEMU
 documentation
Date: Sun, 26 Jan 2020 23:55:00 +0100
Message-Id: <1580079311-20447-20-git-send-email-aleksandar.markovic@rt-rk.com>
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

Explains basic ways of using AVR target in QEMU.

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Message-Id: <20200118191416.19934-16-mrolnik@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Fixed typos]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 qemu-doc.texi | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 2328e7e..aaf4e54 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1723,6 +1723,7 @@ differences are mentioned in the following sections=
.
 * Microblaze System emulator::
 * SH4 System emulator::
 * Xtensa System emulator::
+* AVR System emulator::
 @end menu
=20
 @node PowerPC System emulator
@@ -2496,6 +2497,56 @@ so should only be used with trusted guest OS.
=20
 @c man end
=20
+@node AVR System emulator
+@section AVR System emulator
+@cindex system emulation (AVR)
+
+Use the executable @file{qemu-system-avr} to emulates a AVR 8 bit based =
machine
+having one for the following cores: avr1, avr2, avr25, avr3, avr31, avr3=
5, avr4,
+avr5, avr51, avr6, avrtiny, xmega2, xmega3, xmega4, xmega5, xmega6 and x=
mega7.
+
+As for now it supports few Arduino boards for educational and testing pu=
rposes.
+These boards use a ATmega controller, which model is limited to USART & =
16 bit
+timer devices, enought to run FreeRTOS based applications (like this @ur=
l{https://github.com/seharris/qemu-avr-tests/blob/master/free-rtos/Demo/A=
VR_ATMega2560_GCC/demo.elf,,demo})
+
+Following are examples of possible usages, assuming demo.elf is compiled=
 for
+AVR cpu
+@itemize
+
+@item Continuous non interrupted execution
+@example
+qemu-system-avr -machine mega2560 -bios demo.elf
+@end example
+
+@item Continuous non interrupted execution with serial output into telne=
t window
+@example
+qemu-system-avr -machine mega2560 -bios demo.elf -serial tcp::5678,serve=
r,nowait -nographic
+@end example
+and then in another shell
+@example
+telnet localhost 5678
+@end example
+
+@item Debugging wit GDB debugger
+@example
+qemu-system-avr -machine mega2560 -bios demo.elf -s -S
+@end example
+and then in another shell
+@example
+avr-gdb demo.elf
+@end example
+and then within GDB shell
+@example
+target remote :1234
+@end example
+
+@item Print out executed instructions
+@example
+qemu-system-avr -machine mega2560 -bios demo.elf -d in_asm
+@end example
+
+@end itemize
+
 @node QEMU User space emulator
 @chapter QEMU User space emulator
=20
--=20
2.7.4


