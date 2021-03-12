Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9AE338F6D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:07:45 +0100 (CET)
Received: from localhost ([::1]:56686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiS8-0005bF-08
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDE-00034l-Jy
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:21 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCt-00020G-Pr
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:20 -0500
Received: by mail-wr1-x444.google.com with SMTP id b18so4846467wrn.6
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rqgRn30ihK8sLz2bM4wW5K6pkyogKwdpGYv8tux8VjQ=;
 b=YvPuRwPYGp3GGSPmnkE6u6fzo91mJUvYeyHUM2b8ZOQ4xr+8zbXa6dXTxzTIELexeb
 aBWNb011z48XcarFi4AmuCF1UDTeaYL5119mQF/gt83lLSm7ARUf9Qt+kzoBgj6NHG9s
 iaEUI0gYwPydpizvPu8yt4wjHPl1Wsf2tshh047iUsz9YeRz7AtBGj9IFYZKUPRJLQr0
 zOvUD6X3m7GFbkXU3Og8IT+kM/JnLpx5k455uKW7sv7HkKzb/Z6OmQm5qrP8lk4ROInw
 NRtZXzOsn+O9GiFFoDwbw/N8jV/xbDS8YBhItbauJI9nqrxemCduu6m5GQRD6Uod7QkQ
 U9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rqgRn30ihK8sLz2bM4wW5K6pkyogKwdpGYv8tux8VjQ=;
 b=dNVRTeAv72A+GvCLWO9ybYKmH8Fa08oSdbSIn2c47H09AKMa1KIRo1dtIVh4Aow36w
 euQkPGXvT6iVNBtR4xsTaQjwoEh1KUlh/nyUMQI3+MO6JAZ3zGv6Y2UXWFtMrk5NbMCI
 k8LTQCZyNc1hb0Y6GMRnxs8d1xeXWxfIACb6Gti/f6CPP89IE6QxpqAt/R2WVjdyZX9H
 2Mu9Ebeh6hpYFAa1Gn/HLkzHhK57L6JvAwltjNZg1J1WHPxwVEo9W1BzcCKaa/fUD25f
 tEZDZ7vyCGkqC26z2Y9q+pgkdGSxrzbw2QVTIoLNeeMTnP5MfPMiAhJ5DTbkP2pAmd+0
 MJIQ==
X-Gm-Message-State: AOAM5305CbZkCF6zFoX6mWXYh9php2SEI9hzitja8/TXlIvhZ3zVeOvV
 F/F5KTP1D6pWY0bzVW8wVxmmcvOx/bunJjVt
X-Google-Smtp-Source: ABdhPJxIkg48n3OFI92urMJZYex86fdNbwa6D6IULo8NMwFg09IcxWM0Sgfw3avmTOK6msDG1hLgRQ==
X-Received: by 2002:adf:b30f:: with SMTP id j15mr14162569wrd.132.1615557117516; 
 Fri, 12 Mar 2021 05:51:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/39] tests/acceptance: drop ARMBIAN_ARTIFACTS_CACHED
 condition for orangepi-pc, cubieboard tests
Date: Fri, 12 Mar 2021 13:51:23 +0000
Message-Id: <20210312135140.1099-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Niek Linnenbank <nieklinnenbank@gmail.com>

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
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-id: 20210310195820.21950-6-nieklinnenbank@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/acceptance/boot_linux_console.py | 12 ------------
 tests/acceptance/replay_kernel.py      |  2 --
 2 files changed, 14 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 04a8b233526..1ca32ecf253 100644
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
index 8c68caae317..71facdaa752 100644
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
2.20.1


