Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B432E8E5D
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:19:33 +0100 (CET)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAmi-00032m-IW
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwANH-0005RE-Iy
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:53:16 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwANF-0006XG-Nc
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:53:15 -0500
Received: by mail-wm1-x329.google.com with SMTP id c124so15940977wma.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=my6K0NqjNxjwesMHeWH/nrBf3hS8ACbQAhuQ5qNjI9U=;
 b=BaBLUCrnYR+B4v33nLFz8D8IMXxaQbgN46mPqbG8l3aAVRbmU6HDzWGc8jqObTvUQD
 f4RWNBwpqIpwaXk2NAc0/laA5iZEqPCK4UYRHPEVOgesWXSwMXeaIDuu2GUr+UedsZBq
 3Z2EHIpGdfenRkyGpQCfLjBHD6CmLVNiiZG3zbl6egEiSI067FAhN13eAjaDxu0LzxDR
 Z2ro/qq8WPFOj3GULnUsAGm82LSLl6bB47zZL764lwXX8cNfBrXx9+A07aI+0ezEbIeZ
 3LJ9b/tZ1Nz70+ci8YXazPM5pJTk6PGnx8ap5mOmSXWjG20KiEsI9UNzuzhJ5kXsEKun
 A93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=my6K0NqjNxjwesMHeWH/nrBf3hS8ACbQAhuQ5qNjI9U=;
 b=gZerGYfUMZzCzlZDAlglcoWKLHU+eAO/gxGtum4mqfnSwoM+JGc5r9Qn82y9fyu4d/
 Omc/D1G9dpFiP8YGUXSvTbmCq2POBsaQ6pIHFhhDyUT1e/r14sQARaE51QFhZrkHhUed
 1xNJMu77JYpM+lHhiiyCGhxBbe9uyhw89UVcV79K9lFzCvpfrFA0uJeTcsD1WJkd75JU
 ldXPkbQivzNRy56O+xs/XeZDskp9byNoDS2I89bnzfKM4zNCTg6QBP/SzXNvDSdgPTx/
 88rqEKKNzf4rmKmTWy8EO+Lq9HKS6b3pHEm70KCabAW0xlcyZ/mUyKVEGVpuhPBPvLA0
 uVtg==
X-Gm-Message-State: AOAM531ruHzjf0oHlE8G01IYXPgVaIHcD9LVSL0VTBP2DfM1B3vq1f8X
 bSbKV/l17nPuNYkyUUFTRHifXtaUZf4=
X-Google-Smtp-Source: ABdhPJz0kwQk7cscAxNXjjxIj23ALFIM9Mf3WzW5tIIuCf+iZ8cIOS4Y9xCUuWx2kBQ1/Mf3iTZjkg==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr23909157wmi.164.1609707192192; 
 Sun, 03 Jan 2021 12:53:12 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id u66sm30239300wmg.30.2021.01.03.12.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:53:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/35] tests/acceptance: Test boot_linux_console for fuloong2e
Date: Sun,  3 Jan 2021 21:50:21 +0100
Message-Id: <20210103205021.2837760-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

The kernel comes from debian archive so it's trusted.

Invoking the test can be done as follows:

  $ avocado --show=app,console run -t machine:fuloong2e tests/acceptance/
   (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_fuloong2e:
  console: [    0.000000] Initializing cgroup subsys cpuset
  console: [    0.000000] Initializing cgroup subsys cpu
  console: [    0.000000] Initializing cgroup subsys cpuacct
  console: [    0.000000] Linux version 3.16.0-6-loongson-2e (debian-kernel@lists.debian.org) (gcc version 4.8.4 (Debian 4.8.4-1) ) #1 Debian 3.16.56-1+deb8u1 (2018-05-08)
  console: [    0.000000] memsize=256, highmemsize=0
  console: [    0.000000] CpuClock = 533080000
  console: [    0.000000] bootconsole [early0] enabled
  console: [    0.000000] CPU0 revision is: 00006302 (ICT Loongson-2)
  console: [    0.000000] FPU revision is: 00000501
  console: [    0.000000] Checking for the multiply/shift bug... no.
  console: [    0.000000] Checking for the daddiu bug... no.
  console: [    0.000000] Determined physical RAM map:
  console: [    0.000000]  memory: 0000000010000000 @ 0000000000000000 (usable)
  console: [    0.000000]  memory: 0000000004000000 @ 0000000010000000 (reserved)
  console: [    0.000000]  memory: 0000000003ffffff @ 000000001c000001 (reserved)
  console: [    0.000000] Initrd not found or empty - disabling initrd
  console: [    0.000000] Zone ranges:
  console: [    0.000000]   DMA      [mem 0x00000000-0x00ffffff]
  console: [    0.000000]   Normal   [mem 0x01000000-0x0fffffff]
  console: [    0.000000] Movable zone start for each node
  console: [    0.000000] Early memory node ranges
  console: [    0.000000]   node   0: [mem 0x00000000-0x0fffffff]
  console: [    0.000000] Reserving 0MB of memory at 0MB for crashkernel
  console: [    0.000000] Primary instruction cache 64kB, VIPT, direct mapped, linesize 32 bytes.
  console: [    0.000000] Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 32 bytes
  console: [    0.000000] Unified secondary cache 512kB 4-way, linesize 32 bytes.
  console: [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16327
  console: [    0.000000] Kernel command line: printk.time=0 console=ttyS0
  PASS (2.27 s)

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201224031750.52146-9-jiaxun.yang@flygoat.com>
[PMD: Added command line example]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index cc6ec0f8c15..fb41bb7144b 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -170,6 +170,27 @@ def test_mips64el_malta(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_mips64el_fuloong2e(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:fuloong2e
+        :avocado: tags=endian:little
+        """
+        deb_url = ('http://archive.debian.org/debian/pool/main/l/linux/'
+                   'linux-image-3.16.0-6-loongson-2e_3.16.56-1+deb8u1_mipsel.deb')
+        deb_hash = 'd04d446045deecf7b755ef576551de0c4184dd44'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinux-3.16.0-6-loongson-2e')
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
     def test_mips_malta_cpio(self):
         """
         :avocado: tags=arch:mips
-- 
2.26.2


