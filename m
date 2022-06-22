Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD7554DF9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 16:53:50 +0200 (CEST)
Received: from localhost ([::1]:37982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o41jp-0000Nv-OW
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 10:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o41hj-0006yH-83
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:51:39 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o41hh-0001Ez-CO
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:51:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id o8so23796425wro.3
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 07:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMocS6L1qwHpmbFESWio4zzDBe8eQUr43gocqOuiXc8=;
 b=zHjnIGebfGPXlJz8q551msoxX/3inlRyYvFi+HF0s11jW6zURzvtX9jDbpXxnH+t0K
 hZyD4gIfjgwrW6qxSA35b6Z8vqjjuc3VU97tmAy4xBoxdY8txos+UqK/YjazEV7Jv3pA
 GEYCugLp817IbeMqs7iidfNDIgnpClJaLqQWtwzmTj0av25DKO1pD23V1Hmt9X1GMvqA
 lEo+VhO++6K/CYF+LX+I6bwzzx6ighDR7QeiCU6UShLnZ9AJgnZxEQJIUQih5JjAEGZ9
 PU4mEcREaPFoHYgMmlKhifw/xA8G2oBlpziqAXe+luEhRhVfLtBVqq+tjxwGcxPbYV/T
 FIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMocS6L1qwHpmbFESWio4zzDBe8eQUr43gocqOuiXc8=;
 b=vtHslXkBO+UggjYVzRDUzHGEsCg71/TgVb8s2YluvMgMymiTGYD806NP/SUe50yT9i
 92A/zBTiinaiH7yvf4IyDRtWoYUY71X4AupkXiFrHPEUJCo+dKpfbP/FjKiP02gQQf7R
 +K2hKPG2Kbwrry4vEAacoXFJPGZmpK4YDom/+mTESMi4vs+fPTG4dkaV2WsdiNes2Wv4
 3se4YCxR+sx2Vu1HHnn4Bag8ZKCmu7Hegd9wiJZUJeqbJ44ejvXUrX6kJlpnKKkCrms3
 Hh+0UsFALxU8cNuErADZb3ORFtmQc/u0bYgGsBItm2TSWULFLONHKsujJCPXwGDrNnIY
 U0cQ==
X-Gm-Message-State: AJIora/tKkan1M1ZdCJFlMrkYa7hDQ4TuQl8CJlhV1p4JD4YntYfx8Si
 pc6cUkgh7EHGzgyQePgUXgPgRg==
X-Google-Smtp-Source: AGRyM1uLMuchfeGz0uL0pygPBhUnOtRcqCYsV9ogIKPbWCK1jnDaCKi99HVN6oc2gr3zvzchVNQi1w==
X-Received: by 2002:a5d:64ab:0:b0:219:ab70:c4ea with SMTP id
 m11-20020a5d64ab000000b00219ab70c4eamr3593378wrp.479.1655909495528; 
 Wed, 22 Jun 2022 07:51:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a1c6a06000000b003a0231af43csm3151064wmc.48.2022.06.22.07.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 07:51:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD1421FFB7;
 Wed, 22 Jun 2022 15:51:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [RFC PATCH] qemu-options: bring the kernel and image options together
Date: Wed, 22 Jun 2022 15:50:52 +0100
Message-Id: <20220622145052.4012981-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
appropriate.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>
---
 qemu-options.hx | 80 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 18 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 377d22fbd8..9b0242f0ef 100644
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
@@ -3680,12 +3673,51 @@ DEFHEADING()
 
 #endif
 
-DEFHEADING(Linux/Multiboot boot specific:)
+DEFHEADING(Boot Image or Kernel specific:)
+SRST
+There are broadly 4 ways you can boot a system with QEMU.
+
+ - specify a firmware and let it control finding a kernel
+ - specify a firmware and pass a hint to the kernel to boot
+ - direct kernel image boot
+ - manually load files into the guests address space
+
+The last method is useful for quickly testing kernels but as there is
+no firmware to pass configuration information to the kernel it must
+either be built for the exact configuration or be handed a DTB blob
+which tells the kernel what drivers it needs.
+
+ERST
+
+SRST
+
+For x86 machines ``-bios`` will generally do the right thing with
+whatever it is given. For non-x86 machines the more strict ``-pflash``
+option needs an image that is sized for the flash device for the given
+machine type.
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
+SRST
+``-pflash file``
+    Use file as a parallel flash image.
+ERST
+
 SRST
-When using these options, you can use a given Linux or Multiboot kernel
-without installing it in the disk image. It can be useful for easier
-testing of various kernels.
 
+The kernel options were designed to work with Linux kernels although
+other things (like hypervisors) can be packaged up as a kernel
+executable image. The exact format of a executable image is usually
+architecture specific.
 
 ERST
 
@@ -3725,6 +3757,25 @@ SRST
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
@@ -4175,13 +4226,6 @@ SRST
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


