Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C806B32DB52
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:48:28 +0100 (CET)
Received: from localhost ([::1]:52816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHutX-00058j-MX
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhb-0001it-9F; Thu, 04 Mar 2021 15:36:10 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhT-0005La-SZ; Thu, 04 Mar 2021 15:36:05 -0500
Received: by mail-ej1-x62d.google.com with SMTP id e19so1134208ejt.3;
 Thu, 04 Mar 2021 12:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b9qEBEsjw3h6ZixY/rrA1wqPt0igetkySkLM2hkCrhc=;
 b=KzOy/wLmUbpwTWJCt5NV+/CPksMnKOtmB83uxQhZs1jhCAo0WR0XpCTRcIMY1xNsnj
 OIHe8ztYmUiJAVfIWsk8JRTJAc5tGoQ9yggm7nzVvi1kakJ/GQK7zRMd1BbRIBYpDqxm
 qYpdAbFBwbhn4slPGfS8QXPuWpttPidCG6oilpqL39t9rlw9C1hIzMt13iutQemLxKVE
 +jEKNAGDkXCetx/6J8XdiuEF9b8Rj5tC3DkyYfFTmdLUT/iad7RBVaTEg28sIloPO8mq
 4q/OYtpneqRFNZt67+2bMPHhAF2MH5/Nuw0YW1eR+UBdy5jCsbJJ1xMPGl/jwAfuKEPQ
 JhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b9qEBEsjw3h6ZixY/rrA1wqPt0igetkySkLM2hkCrhc=;
 b=RuXKiBhDl50g+xiZ4sOtwZODYflsLBR13vyoIUAIIxS9o1O++q7qgd3vjuto3Gf+IV
 +kuIyiqRy0TXWtNvRvsikt70nI9uRagemtvUH+HmS1PE5rSRct6lrE8sJcnQAIz1+HA7
 jjRWzapQEeeHwijdKQnZvJZfD05EolwOwik95OKGwmvAcF6iCgY5N07JdZ14e1dpynGM
 lvcyLbbFZIhtYkPWDE69PjLltxmpv8x1Z4pHfVbNTp3AT2a+eSXJFRqBX6jTc50Q8Jlf
 qXjgTO2V6D8msfwPc6I8S6CN6j+n7JKq9eGvdj9woeODMdcMDnX3ITyy8ZVosVdeqceG
 OZlg==
X-Gm-Message-State: AOAM532BdFcZgCRMSZsuovYBeqYueQnFtSF3dmHhNoJcYvv1oi8NfaeX
 DdUiQpoA6Y0O5MV3d32kpcrHyePnfzqF/Q==
X-Google-Smtp-Source: ABdhPJwjcWVIqYw83o+0iNRyybXEiO7f8NzZhiqdGHbuuPTJ1QNW6vE6Tmkzbf8ff7q/j6qKvpf+rQ==
X-Received: by 2002:a17:906:4f02:: with SMTP id
 t2mr6219169eju.121.1614890158113; 
 Thu, 04 Mar 2021 12:35:58 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-ebf2-7b2-6f3d-5954.fixed6.kpn.net.
 [2a02:a456:6be8:1:ebf2:7b2:6f3d:5954])
 by smtp.gmail.com with ESMTPSA id t8sm289956edv.16.2021.03.04.12.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 12:35:57 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] tests/acceptance: drop ARMBIAN_ARTIFACTS_CACHED
 condition for orangepi-pc, cubieboard tests
Date: Thu,  4 Mar 2021 21:35:40 +0100
Message-Id: <20210304203540.41614-6-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304203540.41614-1-nieklinnenbank@gmail.com>
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously the ARMBIAN_ARTIFACTS_CACHED pre-condition was added to allow running
tests that have already existing armbian.com artifacts stored in the local avocado cache,
but do not have working URLs to download a fresh copy.

At this time of writing the URLs for artifacts on the armbian.com server are updated and working.
Any future broken URLs will result in a skipped acceptance test, for example:

 (1/5) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
  CANCEL: Missing asset https://apt.armbian.com/pool/main/l/linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb (0.53 s)

This commits removes the ARMBIAN_ARTIFACTS_CACHED pre-condition such that
the acceptance tests for the orangepi-pc and cubieboard machines can run.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 12 ------------
 tests/acceptance/replay_kernel.py      |  2 --
 2 files changed, 14 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 04a8b23352..1ca32ecf25 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -507,8 +507,6 @@ def test_arm_exynos4210_initrd(self):
         self.wait_for_console_pattern('Boot successful.')
         # TODO user command, for now the uart is stuck
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_initrd(self):
         """
         :avocado: tags=arch:arm
@@ -549,8 +547,6 @@ def test_arm_cubieboard_initrd(self):
                                                 'system-control@1c00000')
         # cubieboard's reboot is not functioning; omit reboot test.
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_sata(self):
         """
         :avocado: tags=arch:arm
@@ -678,8 +674,6 @@ def test_arm_quanta_gsj_initrd(self):
         self.wait_for_console_pattern(
                 'Give root password for system maintenance')
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi(self):
         """
         :avocado: tags=arch:arm
@@ -705,8 +699,6 @@ def test_arm_orangepi(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi_initrd(self):
         """
         :avocado: tags=arch:arm
@@ -749,8 +741,6 @@ def test_arm_orangepi_initrd(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi_sd(self):
         """
         :avocado: tags=arch:arm
@@ -802,8 +792,6 @@ def test_arm_orangepi_sd(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_orangepi_bionic_20_08(self):
         """
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 8c68caae31..71facdaa75 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -177,8 +177,6 @@ def test_arm_virt(self):
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=1)
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_initrd(self):
         """
         :avocado: tags=arch:arm
-- 
2.25.1


