Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A532339DEDD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:35:00 +0200 (CEST)
Received: from localhost ([::1]:40432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGLD-0005rv-KY
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJY-000348-5L
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJU-0000Lw-Q0
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso2505039wmg.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rI0R4bYUescEvm/efc4mHQ4PtU1tZsq80hE1w0dikSA=;
 b=jTj+49CmrF0Bpd7w92PvAGhREAFj3MCbj/cR0PpArEt2SkHIU/henAbpaSU92gKU8v
 RT9RfFdIEsK86N4O9dGj2+lRvzS4wkvMaHDCfi5jNa8aoqtRmDxnOK75hvb/2VGTFlKj
 xcu21ey30Iv+NauqbAOeYO2HaSArEwcr6P6PK43KRDJWwZIeZMQAzghEZZoHvsaYNQ+a
 gxW5BopsvOuEQ0DrW5nPQ2kcAkXXeieT0kAKnQFXg5o9NGFPwdA8e2zXXZYE2I3FI9Xa
 j6looGx0BLwKKnaqnGGx6dpxiVCR5Ew4gEvVqLgqC226i0gVYpnUC7sHiO0eF00v5ihn
 87lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rI0R4bYUescEvm/efc4mHQ4PtU1tZsq80hE1w0dikSA=;
 b=OuZiv4Ewi9K3n8zvCgBGZTtasNSb0Sb+QtXjFN2DQfa72ne/2vseqy0KdkGZCmmyrs
 UpM2Ozmg/LHWNRQ3JDFVIJl0j15qvLV14O6isAmYrTiuCM5P1UwjqmxEoMCid4/v3zy2
 9i24UIKtoTdb26tSc6QN+TwBwmK4Qdi48ACL3ykoTpFLXLXTS5Nxc6Kyb2R/hgk9eJEN
 n2EsoiUdqxVEXBDglOZArza8pzXMG33WxH5EW5OAPaiku8zZUNWGzOMK7keIQyY8bUDq
 fTk27wQhvGLWo9LawL7gS8qLzGkzhXSV/DP4Qnxiz/FyG1ue2Oi8A0YHKHvrTgvWQwQA
 XA3A==
X-Gm-Message-State: AOAM532Kb1tu94crjBhg0SC2+jCfSrEi3+lYADeLyMIwWM01EDPe03s6
 bu23NuBgSuyYVMJwtlMF2BvxaA==
X-Google-Smtp-Source: ABdhPJyM8QWu7QUovWbTh06yA9Opi7mnHOkh6TPdp1ZJPpyPZxbkYRILa6CqpcxqJqM6koHDp3FIWg==
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr891502wmq.172.1623076391501; 
 Mon, 07 Jun 2021 07:33:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm18144201wmj.47.2021.06.07.07.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 07:33:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E98B01FF90;
 Mon,  7 Jun 2021 15:33:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 4/8] tests/acceptance: tag various arm tests as TCG only
Date: Mon,  7 Jun 2021 15:32:59 +0100
Message-Id: <20210607143303.28572-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607143303.28572-1-alex.bennee@linaro.org>
References: <20210607143303.28572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should never be trying to run most of these models under a KVM
environment.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210527160319.19834-7-alex.bennee@linaro.org>

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


