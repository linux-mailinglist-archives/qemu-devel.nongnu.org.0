Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB60DD949
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 17:14:19 +0200 (CEST)
Received: from localhost ([::1]:56538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLqQr-000330-OL
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 11:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45695)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqNt-0001G5-8v
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:11:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqNr-000720-JC
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:11:13 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35802)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqNr-000713-9T
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:11:11 -0400
Received: by mail-wr1-x444.google.com with SMTP id l10so8774599wrb.2
 for <qemu-devel@nongnu.org>; Sat, 19 Oct 2019 08:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QBTrUBOd5GMcqdYIUb+wluk81oA9TycjHbQQeiTj8kE=;
 b=c/+gGNPi6rALWQeGTOOfJ7tWIfXb1oAb+fxPcUiEPZCZsPYKE0gWzyb7/ueccBGaZV
 iW7x0zg1pwzsCkw/KoQi/PPP+PunyuUr531UZToojcfPuAynA7qCM19WSeg+TlAwVabw
 WB07dR+auP0dXV7KMGhVfksgCYrSz7yQv43Ogp6OW8M55NT7S/zv+0M9KdLNUag8C3Z5
 n7gKNwfF7qet/rqgVm/tH87SzFJBdQ9tsUi07uTD57nC7H+6NJm5FM7FWrxiixcTB0Fd
 TtL9HwJU96p1nvaixNjbSWcQrSdqWC7/Ymls9DYX6PCSiO1iV1wnPb8RjMoipG0USdbW
 LSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QBTrUBOd5GMcqdYIUb+wluk81oA9TycjHbQQeiTj8kE=;
 b=nLv4yaQE6JAQX54hT9mEL5vWYmCfTJzauQNF9mFHUeR/3i7RUIGnBp6cDGzSDwgqGP
 mirSz2hkguU16/aM7S+6C8HXeL/71GW/XN5biUsvHfOGYWDf1Mb4nX0IjWZ8iSG81YAG
 wWpYmZ7zR3ryqtwwRZnIsFUFV/Uv/6fZSAdXb0isOcf0S7+8n2aApLjuLYzWAV3EA4v2
 GeKnpAWlrw+T3p1/SR5O+HpM1XOiu7Y3gTgkJdrb/KtO4sKhLklLhZhpvGg6dPNSth9o
 FgfWi74mV8Kp8enq/OMsVkeVKUd22fOOZiyJtVKEFRJ4vJzRcO9aRtw6np1cAh/HPT5Z
 fHrg==
X-Gm-Message-State: APjAAAWSxo0WD6w8VKGdrS8sV71PDmgeQq++ioZIv+E4bixfneenArCv
 VVACXWla83kOuW1apc6Yv1K9sYxB
X-Google-Smtp-Source: APXvYqyyRAJdAIW5ctdC309sfD8F6IQmrYnDw2gYNyS/1mGam0SgfQt0kzJ+3uJ58ZeNh7cK/HW5iw==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr12385649wru.120.1571497869818; 
 Sat, 19 Oct 2019 08:11:09 -0700 (PDT)
Received: from x1w.redhat.com (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id t13sm10753964wra.70.2019.10.19.08.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 08:11:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] tests/boot_linux_console: Run BusyBox on 5KEc 64-bit cpu
Date: Sat, 19 Oct 2019 17:10:53 +0200
Message-Id: <20191019151058.31733-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019151058.31733-1-f4bug@amsat.org>
References: <20191019151058.31733-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Cleber Rosa <crosa@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This tests boots a Linux kernel on a Malta machine up to a
busybox shell on the serial console. Few commands are executed
before halting the machine (via reboot).

We use the Fedora 24 kernel extracted from the image at:
https://fedoraproject.org/wiki/Architectures/MIPS
and the initrd cpio image from the kerneltests project:
https://kerneltests.org/

If MIPS is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:mips" tags.

Alternatively, this test can be run using:

  $ avocado --show=console run -t arch:mips64el tests/acceptance/boot_linux_console.py
  console: [    0.000000] Linux version 3.19.3.mtoman.20150408 (mtoman@debian-co3-1) (gcc version 5.0.0 20150316 (Red Hat 5.0.0-0.20) (GCC) ) #3 Wed Apr 8 14:32:50 UTC 2015
  console: [    0.000000] Early serial console at I/O port 0x3f8 (options '38400n8')
  console: [    0.000000] bootconsole [uart0] enabled
  console: [    0.000000] CPU0 revision is: 00018900 (MIPS 5KE)
  console: [    0.000000] Checking for the multiply/shift bug... no.
  console: [    0.000000] Checking for the daddiu bug... no.
  [...]
  console: Boot successful.
  console: cat /proc/cpuinfo
  console: / # cat /proc/cpuinfo
  console: system type            : MIPS Malta
  console: machine                        : Unknown
  console: processor              : 0
  console: cpu model              : MIPS 5KE V0.0
  console: : 1616.89
  console: wait instruction       : nouname -a
  console: microsecond timers     : yes
  console: tlb_entries            : 32
  console: extra interrupt vector : yes
  console: hardware watchpoint    : yes, count: 1, address/irw mask: [0x0ff8]
  console: isa                    : mips1 mips2 mips3 mips4 mips5 mips32r1 mips32r2 mips64r1 mips64r2
  console: ASEs implemented       :
  console: shadow register sets   : 1
  console: kscratch registers     : 0
  console: package                        : 0
  console: core                   : 0
  console: VCED exceptions                : not available
  console: VCEI exceptions                : not available
  console: / #
  console: / # uname -a
  console: Linux buildroot 3.19.3.mtoman.20150408 #3 Wed Apr 8 14:32:50 UTC 2015 mips64 GNU/Linux
  console: reboot
  console: / #
  console: / # reboot
  console: / #
  console: / # reboot: Restarting system
  PASS (7.04 s)
  JOB TIME   : 7.20 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 67d7e96d98..e505a41eed 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -166,6 +166,46 @@ class BootLinuxConsole(Test):
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
 
+    def test_mips64el_malta_5KEc_cpio(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:malta
+        :avocado: tags=endian:little
+        """
+        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
+                      'raw/9ad2df38/mips/malta/mips64el/'
+                      'vmlinux-3.19.3.mtoman.20150408')
+        kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+        initrd_url = ('https://github.com/groeck/linux-build-test/'
+                      'raw/8584a59e/rootfs/'
+                      'mipsel64/rootfs.mipsel64r1.cpio.gz')
+        initrd_hash = '1dbb8a396e916847325284dbe2151167'
+        initrd_path_gz = self.fetch_asset(initrd_url, algorithm='md5',
+                                          asset_hash=initrd_hash)
+        initrd_path = self.workdir + "rootfs.cpio"
+        archive.gzip_uncompress(initrd_path_gz, initrd_path)
+
+        self.vm.set_machine('malta')
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
+                               + 'console=ttyS0 console=tty '
+                               + 'rdinit=/sbin/init noreboot')
+        self.vm.add_args('-cpu', '5KEc',
+                         '-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Boot successful.')
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'MIPS 5KE')
+        exec_command_and_wait_for_pattern(self, 'uname -a',
+                                                '3.19.3.mtoman.20150408')
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+
     def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
         kernel_path_xz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
         kernel_path = self.workdir + "kernel"
-- 
2.21.0


