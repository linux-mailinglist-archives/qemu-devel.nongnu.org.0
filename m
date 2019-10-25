Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD48E51CE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 18:59:36 +0200 (CEST)
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO2w2-0001uF-Ge
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 12:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40686)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iO2ij-0005AS-Fk
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 12:45:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iO2ii-0002MO-4k
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 12:45:49 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:34474 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iO2ih-0002F0-Oj
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 12:45:47 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 3D7881A2289;
 Fri, 25 Oct 2019 18:44:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 0F6221A21F7;
 Fri, 25 Oct 2019 18:44:30 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/20] tests/ssh_linux_malta: Match stricter console output
Date: Fri, 25 Oct 2019 18:44:20 +0200
Message-Id: <1572021862-28273-19-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572021862-28273-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1572021862-28273-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Match on stricter console output.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20191019153437.9820-10-f4bug@amsat.org>
---
 tests/acceptance/linux_ssh_mips_malta.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/=
linux_ssh_mips_malta.py
index 007bcdb..b19598e 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -139,19 +139,19 @@ class LinuxSSH(Test):
             '3.2.0-4-4kc-malta')
         self.ssh_command_output_contains(
             'cat /proc/interrupts',
-            'timer')
+            'XT-PIC  timer')
         self.ssh_command_output_contains(
             'cat /proc/interrupts',
-            'i8042')
+            'XT-PIC  i8042')
         self.ssh_command_output_contains(
             'cat /proc/interrupts',
-            'serial')
+            'XT-PIC  serial')
         self.ssh_command_output_contains(
             'cat /proc/interrupts',
-            'ata_piix')
+            'XT-PIC  ata_piix')
         self.ssh_command_output_contains(
             'cat /proc/interrupts',
-            'eth0')
+            'XT-PIC  eth0')
         self.ssh_command_output_contains(
             'cat /proc/devices',
             'input')
@@ -163,13 +163,13 @@ class LinuxSSH(Test):
             'fb')
         self.ssh_command_output_contains(
             'cat /proc/ioports',
-            'serial')
+            ' : serial')
         self.ssh_command_output_contains(
             'cat /proc/ioports',
-            'ata_piix')
+            ' : ata_piix')
         self.ssh_command_output_contains(
             'cat /proc/ioports',
-            'piix4_smbus')
+            ' : piix4_smbus')
         self.ssh_command_output_contains(
             'lspci -d 11ab:4620',
             'GT-64120')
@@ -179,7 +179,7 @@ class LinuxSSH(Test):
         self.ssh_command_output_contains(
             'cat /proc/mtd',
             'YAMON')
-        # Empty 'Board Config'
+        # Empty 'Board Config' (64KB)
         self.ssh_command_output_contains(
             'md5sum /dev/mtd2ro',
             '0dfbe8aa4c20b52e1b8bf3cb6cbdf193')
--=20
2.7.4


