Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D61DD956
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 17:22:57 +0200 (CEST)
Received: from localhost ([::1]:56634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLqZE-0003Su-Q4
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 11:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqNz-0001KB-16
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:11:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqNw-00076q-Gg
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:11:18 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34028)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqNv-00074p-26
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:11:15 -0400
Received: by mail-wr1-x443.google.com with SMTP id t16so4060028wrr.1
 for <qemu-devel@nongnu.org>; Sat, 19 Oct 2019 08:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7O/r4jTySGSLTjP6nvBKNHUVX0/r7KaAP+5isYafiU=;
 b=GCb2jPfVwVKi5lHREKLUegIzMfFr6BROmCF3ZMRXVu2+ZPz18Bv8Gt0vmu/yNENGX/
 r/YG+zU3XyhI1s2DQOWHXjSxgZj6POAZrLfXgTKUR+aKj+uH0P2w4LtOme1CvEQ1BGIn
 ROobjW7S08DyuN6XriqXTYCTvun9nO+/Yb8Gbh0EmNT+vKWRMHhPMtfonOnvu0Nu2y3b
 maSHStyTEgft5eETUUDea7zDUFtaPqbrYEvS87goXnXZPYafyHYk+tBBtcsPD1wa3Oe9
 uCzYoF+kQ0Fv8DZpom8h1Z8HDUAofW1m6ovoc2FRaSpayzK0zlkXwvQZhoUYKMnOT+rF
 0+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V7O/r4jTySGSLTjP6nvBKNHUVX0/r7KaAP+5isYafiU=;
 b=RT/i5qy1pFOsHT8eImDBqHT9UMeSjRKAa6UaOsme2y90xrybhIrm/WNtMgxkynAbR4
 wQKXD/05LGedY0CuyvYp77a27/uY51Qp8uXnIPX0Zgnvs2qIAdeM2MkxftFmL+il0trB
 4bnACjmVGjZCxxN7XpHEVdcWWQeJ3QgAp05zZkU44CssG/mu7LvbfNRNbrL8Bx4mArWR
 X2RiUsK4yQUz+8PhX74qH1RXbg0RCZahrJufgW+llvBwR/Q3XzmWZYLd790QAth/EeqO
 bjregkXwh0q0EVNfyr8lYn8l7HFlYe1B6TEBeji4by7IvlauBQRI7NWRwBBvACpOM6rp
 BhBw==
X-Gm-Message-State: APjAAAVPMvsJf+mjdr+1BZuNH/uVmEMRdxQyeG5uYyDB4wVBA+SKovvR
 NqLYrnS4j59EEy+fgiD/pkm/muo/
X-Google-Smtp-Source: APXvYqxzAytrZVGQk2X5AQfaHGRA5yQ5qgJ6rszPBY5Yg8t+WGcPPaFHfyzMdu4fEaVhl3TWvejV0A==
X-Received: by 2002:a5d:5705:: with SMTP id a5mr12638997wrv.112.1571497873813; 
 Sat, 19 Oct 2019 08:11:13 -0700 (PDT)
Received: from x1w.redhat.com (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id t13sm10753964wra.70.2019.10.19.08.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 08:11:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] tests/ssh_linux_malta: Match stricter console output
Date: Sat, 19 Oct 2019 17:10:56 +0200
Message-Id: <20191019151058.31733-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019151058.31733-1-f4bug@amsat.org>
References: <20191019151058.31733-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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

Match on stricter console output.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/linux_ssh_mips_malta.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
index 5523ae2144..822b0553ff 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -127,19 +127,19 @@ class LinuxSSH(Test):
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
@@ -151,13 +151,13 @@ class LinuxSSH(Test):
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
@@ -167,7 +167,7 @@ class LinuxSSH(Test):
         self.ssh_command_output_contains(
             'cat /proc/mtd',
             'YAMON')
-        # Empty 'Board Config'
+        # Empty 'Board Config' (64KB)
         self.ssh_command_output_contains(
             'md5sum /dev/mtd2ro',
             '0dfbe8aa4c20b52e1b8bf3cb6cbdf193')
-- 
2.21.0


