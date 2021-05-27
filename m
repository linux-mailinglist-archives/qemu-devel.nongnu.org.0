Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB539333F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:11:50 +0200 (CEST)
Received: from localhost ([::1]:46818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIbt-0002Oo-H5
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITu-00057s-8L
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:34 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITs-0000NH-0V
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:33 -0400
Received: by mail-wr1-x42d.google.com with SMTP id f11so448298wrq.1
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 09:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SCJwcBVAgyCms60jVhmkcV2f/TFnHD0gKghZiwudA4s=;
 b=LQ53Qks6ia2EP2MB0FRx8BYaErQ4jxNvV8/8tN2CafEc+mmLgDijA6P38CAjCJRP/K
 AUUMLklGplq+bh4Vb7QwYs1uRB054B/1ILYvzIO8GqY5diSHavWgozXXTrhc31fkWV6t
 RIn1nhQdexzzRbUGiYgkYHkn8TMBfUBCegatTERLrypVch5I7SWHU66jo5vMmPqiws/B
 xgg0SXlezfdkf7cgzQ5gBd+UnJIwmuBgP/hk9Y9v+llsJKldug4p/VZZy+v/WTEyfQkD
 aTX2yLEbGbF8rxbW3qdv7qPg8BmmeM/isK4ix8NzU4sTyMdFgaA/qHGQIIf1SOIq9Qaj
 TuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SCJwcBVAgyCms60jVhmkcV2f/TFnHD0gKghZiwudA4s=;
 b=EHe+BBoJZ2FOdW2T8fcpSWD65UjheBuuxz7NZOAX57nnDB1ilYjSV6QYMUnrk7LLVx
 4xGOp3V8zxtuiV0UK9DallWDMNhLADL6MfAhsNoXLl4zy9erdI9GeoJdlFnAGn+/XiD8
 ghGf7geiVQv9/6ZQmqSeJUgUJFdypfgsh35RS77enEWDzYKxNsWL3VGNGESJIZtTdOwn
 AB7rTpXw0JZRZ6m4KAhIItq90QfAP4afoUJJWYhbawssRIrgfybqfD6CytD5zcvkKx4I
 asRjB3l8vnwb/ox8JR9WAB0KzoDy3fWFrUXsGrzPAfFdtqS1aZwEzyN0H93MYf0nuDoc
 90MA==
X-Gm-Message-State: AOAM532NInymCk4ap7ttf5WH22AbjHXpN7hz5dt/YDHjgdZIdNP603Em
 js3vkXyp+ucoLgXAkckEqdGXSw==
X-Google-Smtp-Source: ABdhPJxSr5kVXlWSnFQccFnB5N1CZPLFGw6SIqNOh6/raOawSFCiE6VH4+ngvuIk/UqPLYdZwAB57g==
X-Received: by 2002:a5d:6da8:: with SMTP id u8mr4150267wrs.391.1622131410522; 
 Thu, 27 May 2021 09:03:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x11sm3656206wrl.13.2021.05.27.09.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:03:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 00D251FF92;
 Thu, 27 May 2021 17:03:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/6] tests/acceptance: tag various arm tests as TCG only
Date: Thu, 27 May 2021 17:03:19 +0100
Message-Id: <20210527160319.19834-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210527160319.19834-1-alex.bennee@linaro.org>
References: <20210527160319.19834-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should never be trying to run most of these models under a KVM
environment.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/acceptance/boot_linux_console.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 276a53f146..cded547d1d 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -333,6 +333,7 @@ def test_aarch64_virt(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
+        :avocado: tags=accel:tcg
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
@@ -343,7 +344,9 @@ def test_aarch64_virt(self):
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyAMA0')
+        self.require_accelerator("tcg")
         self.vm.add_args('-cpu', 'cortex-a53',
+                         '-accel', 'tcg',
                          '-kernel', kernel_path,
                          '-append', kernel_command_line)
         self.vm.launch()
@@ -356,6 +359,7 @@ def test_aarch64_xlnx_versal_virt(self):
         :avocado: tags=machine:xlnx-versal-virt
         :avocado: tags=device:pl011
         :avocado: tags=device:arm_gicv3
+        :avocado: tags=accel:tcg
         """
         images_url = ('http://ports.ubuntu.com/ubuntu-ports/dists/'
                       'bionic-updates/main/installer-arm64/'
@@ -370,6 +374,7 @@ def test_aarch64_xlnx_versal_virt(self):
 
         self.vm.set_console()
         self.vm.add_args('-m', '2G',
+                         '-accel', 'tcg',
                          '-kernel', kernel_path,
                          '-initrd', initrd_path)
         self.vm.launch()
@@ -379,6 +384,7 @@ def test_arm_virt(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:virt
+        :avocado: tags=accel:tcg
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/armhfp/os/images/pxeboot'
@@ -401,6 +407,7 @@ def test_arm_emcraft_sf2(self):
         :avocado: tags=machine:emcraft-sf2
         :avocado: tags=endian:little
         :avocado: tags=u-boot
+        :avocado: tags=accel:tcg
         """
         uboot_url = ('https://raw.githubusercontent.com/'
                      'Subbaraya-Sundeep/qemu-test-binaries/'
@@ -429,6 +436,8 @@ def test_arm_emcraft_sf2(self):
 
     def do_test_arm_raspi2(self, uart_id):
         """
+        :avocado: tags=accel:tcg
+
         The kernel can be rebuilt using the kernel source referenced
         and following the instructions on the on:
         https://www.raspberrypi.org/documentation/linux/kernel/building.md
@@ -464,6 +473,7 @@ def test_arm_raspi2_uart0(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:raspi2
         :avocado: tags=device:pl011
+        :avocado: tags=accel:tcg
         """
         self.do_test_arm_raspi2(0)
 
@@ -471,6 +481,7 @@ def test_arm_exynos4210_initrd(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:smdkc210
+        :avocado: tags=accel:tcg
         """
         deb_url = ('https://snapshot.debian.org/archive/debian/'
                    '20190928T224601Z/pool/main/l/linux/'
@@ -511,6 +522,7 @@ def test_arm_cubieboard_initrd(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
+        :avocado: tags=accel:tcg
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
@@ -551,6 +563,7 @@ def test_arm_cubieboard_sata(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
+        :avocado: tags=accel:tcg
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
@@ -595,6 +608,7 @@ def test_arm_quanta_gsj(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:quanta-gsj
+        :avocado: tags=accel:tcg
         """
         # 25 MiB compressed, 32 MiB uncompressed.
         image_url = (
@@ -642,6 +656,7 @@ def test_arm_quanta_gsj_initrd(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:quanta-gsj
+        :avocado: tags=accel:tcg
         """
         initrd_url = (
                 'https://github.com/hskinnemoen/openbmc/releases/download/'
@@ -678,6 +693,7 @@ def test_arm_orangepi(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
+        :avocado: tags=accel:tcg
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
@@ -702,6 +718,7 @@ def test_arm_orangepi(self):
     def test_arm_orangepi_initrd(self):
         """
         :avocado: tags=arch:arm
+        :avocado: tags=accel:tcg
         :avocado: tags=machine:orangepi-pc
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
@@ -744,6 +761,7 @@ def test_arm_orangepi_initrd(self):
     def test_arm_orangepi_sd(self):
         """
         :avocado: tags=arch:arm
+        :avocado: tags=accel:tcg
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
         """
-- 
2.20.1


