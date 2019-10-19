Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9697DD975
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 17:44:45 +0200 (CEST)
Received: from localhost ([::1]:57164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLquK-0007ya-Ow
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 11:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqkn-0005HW-5H
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:34:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqkm-0002vk-2Z
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:34:53 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54042)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqkl-0002vV-TM
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:34:52 -0400
Received: by mail-wm1-x344.google.com with SMTP id i16so8990327wmd.3
 for <qemu-devel@nongnu.org>; Sat, 19 Oct 2019 08:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7O/r4jTySGSLTjP6nvBKNHUVX0/r7KaAP+5isYafiU=;
 b=ouZSdtQKJgmrGz89nYnPMLYt4p60qNxSQ6Kx2+kHPwf5scsR6fllbB9pQF6tF8TyX8
 e77groz5ivcqBfvG6jEm+aDGpednq4Mk0LBko5dyyb1J907pclLjd/ughDKlw9EO5oKx
 wd1jWrh/M2z638QQ2yeOOnG1OO2VhPRdlAu4t2mTdHvWBEMAPwsXAUJ34kFZCVf/6sIf
 qSb3+7b5rPKkMCv9aWe0NhYuFhj1E2lMqMRNTgFVsUPMZamQev7PVB4Mz2/qZVDssvSO
 dlMHFEZx/2JN/he/DA+o9PBQsiz0iOQEHdNsoXITaoq6N3bdL74gu14BUhXkLMcg+tXB
 roMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V7O/r4jTySGSLTjP6nvBKNHUVX0/r7KaAP+5isYafiU=;
 b=h0Qrc177xKt/IgGrMZyRs8u0lenmv9wlUq2gE+OChrF8jJTeFTCz1i801BF3+/7WYx
 Kxi3QJIT9vCrwGQDluCPSHoq/YXcEOI/1KFz3zLoRoQOm/PaMCRLnZOCcpkr81MtXGk0
 CCns9SnKBN926Cj1DDKG6dirZUVl+l2W8NdW1SkOhnmPWN0B7Q3Qec54Bmq37IWILdLx
 nRROsbNAHD1DwhnrjhOKBN7Cd7AoCdGRmFo+TVj4+/kdUyQbIjI2UjWoS3RZZdmDFZs6
 DGN4fJmjuZX4vCQo/kWFF638O+HTa16BQtyGScJ7scUKQIreSSH26/lKc/dYPxu56RBo
 W8mw==
X-Gm-Message-State: APjAAAUXQzjGfzkByY6wR2qnUZj7OrzuQqipaWel8dJCo/TBCZ019OAf
 ys7d+tFk35evg6K5+CCrstq6/Pus
X-Google-Smtp-Source: APXvYqyvDdkXv0SJtMI0ncTLlsJwlefnPc3J+9AKHVmlCsCNDRET5Jc/0VfNrchDoKnDc+JlV4XBjg==
X-Received: by 2002:a05:600c:2107:: with SMTP id
 u7mr12507264wml.86.1571499290793; 
 Sat, 19 Oct 2019 08:34:50 -0700 (PDT)
Received: from x1w.redhat.com (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id j19sm15245605wre.0.2019.10.19.08.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 08:34:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/11] tests/ssh_linux_malta: Match stricter console output
Date: Sat, 19 Oct 2019 17:34:35 +0200
Message-Id: <20191019153437.9820-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019153437.9820-1-f4bug@amsat.org>
References: <20191019153437.9820-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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


