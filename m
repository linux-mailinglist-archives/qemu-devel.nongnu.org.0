Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5577F56A6B8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:11:50 +0200 (CEST)
Received: from localhost ([::1]:44174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9TAT-0005Qk-74
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o9T9W-0004fM-Gh
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:10:50 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o9T9U-0004xV-H7
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:10:50 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a5so12076260wrx.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/X41hikxicf6cJFH2ei+cubHI00ZbRD0LsxsqDTMRIg=;
 b=zPwXmihwHOgWRJw2jwNAjeQX6PaO4pHFy21ljGQpKXbkla6LzzrT8+sX3MNKycW61j
 ouUBA2Q5M5HdDGbenSJ12DGNuJ2rX/xCcoQiyKl2N3s1KLYJ+YUcmLRViKHCnA/uYwfS
 eakR18z/kok1UA1IlSUwZ4h6mzoOGDs5TKMRZEitT+ZeONHPIUDfkkuh9ikVlvTs9QTS
 hGyTAmRIWN2m/3xvCJa26sstjnQMElaymTxVDiYFVg9HZCB+W+H90xg7Yct/MzkhOQEq
 DnPyUL2dWtzIZlrggwQLxlUyvTbPADWTidzTZiX+uAxPEyaI+Xf4VdYLXrqjMmu7YnYA
 gYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/X41hikxicf6cJFH2ei+cubHI00ZbRD0LsxsqDTMRIg=;
 b=7tRNVgW3Y6O0BJWSOVMGyRz/GMh69TDQULHtVXUuJehxtEkAopd4PIkp+jBISFHpNg
 5l8RrNWuIEeta/gPdspjaTjhQzCvc9thzUPm7EswW0kv7TeMFaQ0xqSHPebJKxqLrhfm
 HIx8WF/2qrR9pcASYAbDhFEuelEMz+9UOOMrg+rTQL9i+waS+AAGHDnt9BMlnGd5SU5T
 KKqdMIognYZJesT5KF8FYZITFR40rbBZ9SZ2IJN5gZSpaQPnz77P/1Via0ImMq0bgrPw
 dJSGfySfGXJHxc+uUoI06iCP+lsZR0Epzaqu6EI330TvU1E/Rgv8kSkHZQRvn9xCieZW
 UoTA==
X-Gm-Message-State: AJIora8zi+AOZwVozHBEU9XYQSz9lw+Lkkl0id3a9Fws3O3yo8zZ2MDc
 460Vk/YJe5M0lRyYp5z6nRpnuw==
X-Google-Smtp-Source: AGRyM1uM4GWz98K20xXfVjpjPZ+3e98o2ZHD4tiZMSHoCjMK6ZwdEUgmes63Z8NtS6NjwBpgHNRy5w==
X-Received: by 2002:adf:c64c:0:b0:21a:7a3:54a4 with SMTP id
 u12-20020adfc64c000000b0021a07a354a4mr43769722wrg.163.1657206646488; 
 Thu, 07 Jul 2022 08:10:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 az42-20020a05600c602a00b003a1a02c6d7bsm14574146wmb.35.2022.07.07.08.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 08:10:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 800A41FFB7;
 Thu,  7 Jul 2022 16:10:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2] qemu-options: bring the kernel and image options together
Date: Thu,  7 Jul 2022 16:10:37 +0100
Message-Id: <20220707151037.397324-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

How to control the booting of QEMU is often a source of confusion for
users. Bring the options that control this together in the manual
pages and add some verbiage to describe when each option is
appropriate. This attempts to codify some of the knowledge expressed
in:

  https://stackoverflow.com/questions/58420670/qemu-bios-vs-kernel-vs-device-loader-file/58434837#58434837

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220622145052.4012981-1-alex.bennee@linaro.org>

---
v2
  - fix third and last reference for kernel and generic loader
  - more verbiage following feedback from Peter
  - mention Peter's write up in the commit message
---
 qemu-options.hx | 90 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 72 insertions(+), 18 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 377d22fbd8..70e7f98882 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1585,13 +1585,6 @@ SRST
     Use file as SecureDigital card image.
 ERST
 
-DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
-    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH_ALL)
-SRST
-``-pflash file``
-    Use file as a parallel flash image.
-ERST
-
 DEF("snapshot", 0, QEMU_OPTION_snapshot,
     "-snapshot       write to temporary files instead of disk image files\n",
     QEMU_ARCH_ALL)
@@ -3680,12 +3673,61 @@ DEFHEADING()
 
 #endif
 
-DEFHEADING(Linux/Multiboot boot specific:)
+DEFHEADING(Boot Image or Kernel specific:)
+SRST
+There are broadly 4 ways you can boot a system with QEMU.
+
+ - specify a firmware and let it control finding a kernel
+ - specify a firmware and pass a hint to the kernel to boot
+ - direct kernel image boot
+ - manually load files into the guest's address space
+
+The third method is useful for quickly testing kernels but as there is
+no firmware to pass configuration information to the kernel the
+hardware must either be probable, the kernel built for the exact
+configuration or passed some configuration data (e.g. a DTB blob)
+which tells the kernel what drivers it needs. This exact details are
+often hardware specific.
+
+The final method is the most generic way of loading images into the
+guest address space and used mostly for ``bare metal`` type
+development where the reset vectors of the processor are taken into
+account.
+
+ERST
+
+SRST
+
+For x86 machines and some other architectures ``-bios`` will generally
+do the right thing with whatever it is given. For other machines the
+more strict ``-pflash`` option needs an image that is sized for the
+flash device for the given machine type.
+
+Please see the :ref:`system-targets-ref` section of the manual for
+more detailed documentation.
+
+ERST
+
+DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
+    "-bios file      set the filename for the BIOS\n", QEMU_ARCH_ALL)
+SRST
+``-bios file``
+    Set the filename for the BIOS.
+ERST
+
+DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
+    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH_ALL)
 SRST
-When using these options, you can use a given Linux or Multiboot kernel
-without installing it in the disk image. It can be useful for easier
-testing of various kernels.
+``-pflash file``
+    Use file as a parallel flash image.
+ERST
 
+SRST
+
+The kernel options were designed to work with Linux kernels although
+other things (like hypervisors) can be packaged up as a kernel
+executable image. The exact format of a executable image is usually
+architecture specific.
 
 ERST
 
@@ -3725,6 +3767,25 @@ SRST
     kernel on boot.
 ERST
 
+SRST
+
+Finally you can also manually load images directly into the address
+space of the guest. This is most useful for developers who already
+know the layout of their guest and take care to ensure something sane
+will happen when the reset vector executes.
+
+The generic loader can be invoked by using the loader device:
+
+``-device loader,addr=<addr>,data=<data>,data-len=<data-len>[,data-be=<data-be>][,cpu-num=<cpu-num>]``
+
+there is also the guest loader which operates in a similar way but
+tweaks the DTB so a hypervisor loaded via ``-kernel`` can find where
+the guest image is:
+
+``-device guest-loader,addr=<addr>[,kernel=<path>,[bootargs=<arguments>]][,initrd=<path>]``
+
+ERST
+
 DEFHEADING()
 
 DEFHEADING(Debug/Expert options:)
@@ -4175,13 +4236,6 @@ SRST
     To list all the data directories, use ``-L help``.
 ERST
 
-DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
-    "-bios file      set the filename for the BIOS\n", QEMU_ARCH_ALL)
-SRST
-``-bios file``
-    Set the filename for the BIOS.
-ERST
-
 DEF("enable-kvm", 0, QEMU_OPTION_enable_kvm, \
     "-enable-kvm     enable KVM full virtualization support\n",
     QEMU_ARCH_ARM | QEMU_ARCH_I386 | QEMU_ARCH_MIPS | QEMU_ARCH_PPC |
-- 
2.30.2


