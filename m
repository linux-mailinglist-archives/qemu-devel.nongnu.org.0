Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E98313ED9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:24:41 +0100 (CET)
Received: from localhost ([::1]:39932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9C9I-0001kB-Fu
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95uX-0004Lz-GO
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:45:03 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95uQ-0000e7-DR
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:44:59 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n6so4105148wrv.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rTYVBnC8DeTiikg0oxh33vUffvjFeCYrhhCo0rVxKGM=;
 b=Sv6Ff+jIs8UHD8i8kuRbL+Eb6jMiSVZslttZZkAzq+OGwyjFgLLCAiMtSAWRC09/E2
 A6Y4XvRREF5lIN+8gA4wAJtm3SxY1GkcsMFpkhgEK2lm5wr5GsUtWSaxwYXXDiDgdyx8
 Zn0c30q36HWRmRGEZMf5RRT/NsSpggW5q9V0Vay+D9Vx4tQvFDVxDSnb780ZVjynDODu
 CplMnAcKUd+yJzzw/xr2oQInELQ2g76J+I91X3pZzC4+a5+1fjoRZ5wsjcK7qEuntb2S
 HmJX4cPlxFWoDrb0yZ9zZHZ4/zCXkjA/7+peZ7BJFIloJqB5vlVY3BZO9yfc92rGis5W
 PlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTYVBnC8DeTiikg0oxh33vUffvjFeCYrhhCo0rVxKGM=;
 b=p557hcgEh48mwqOxVx+H1sRu+aoDsJ5gEhC7q5Ii0h0jwIVTlLc+aM87T+Sfebqngl
 2982S9YKmiWAh2bR7wuLkC9+A6lS9uk5qjudi4JMqO/H2ZCCaqupuqXg83oNBFkYO0pT
 75GMFqVZums45nBwqvXlzRiMiGYDvsKuMa8zmC7SXmjwiwgRAnqd50blQlL4OS1hSkOa
 PUBx/1iLvmm1+yQIXFjG1ZrUmpNWv3lQL7hToZ7yUU3pE/NgRgTGJyzzYUZvv4XSuKCp
 L7FashbRAk006M/dwAbPmgHoggaxAZbSqKUL9j+KQV4eV/sBdI4RhOALSyfEo+g1Zvii
 QlLQ==
X-Gm-Message-State: AOAM532tWZdKuUA88MVHxUmk6NMZizePSPXmxNa5bjdjVhSyiFa+WVes
 J/nJh2lFC0cBzU/sKet3VSSOGg==
X-Google-Smtp-Source: ABdhPJz1lO3o6rYRyM7FSwfSy0nD8uXaWB3Vyh1AapqQ9A1sDBKtPUNM+wW2IONA7IxGi6Z4iRBsWw==
X-Received: by 2002:a5d:4c84:: with SMTP id z4mr19246184wrs.289.1612788291490; 
 Mon, 08 Feb 2021 04:44:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x15sm11738456wro.66.2021.02.08.04.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:44:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C2DA1FF9F;
 Mon,  8 Feb 2021 12:38:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/16] docs/system: document an example booting the versatilepb
 machine
Date: Mon,  8 Feb 2021 12:38:21 +0000
Message-Id: <20210208123821.19818-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a bit more out there including Aurelien's excellent write up
and older Debian images here:

  https://www.aurel32.net/info/debian_arm_qemu.php
  https://people.debian.org/~aurel32/qemu/armel/

However the web is transitory and git is forever so lets add something
to the fine manual.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Message-Id: <20210202134001.25738-16-alex.bennee@linaro.org>

diff --git a/docs/system/arm/versatile.rst b/docs/system/arm/versatile.rst
index 51221c30a4..2ae792bac3 100644
--- a/docs/system/arm/versatile.rst
+++ b/docs/system/arm/versatile.rst
@@ -27,3 +27,37 @@ The Arm Versatile baseboard is emulated with the following devices:
    devices.
 
 -  PL181 MultiMedia Card Interface with SD card.
+
+Booting a Linux kernel
+----------------------
+
+Building a current Linux kernel with ``versatile_defconfig`` should be
+enough to get something running. Nowadays an out-of-tree build is
+recommended (and also useful if you build a lot of different targets).
+In the following example $BLD points to the build directory and $SRC
+points to the root of the Linux source tree. You can drop $SRC if you
+are running from there.
+
+.. code-block:: bash
+
+  $ make O=$BLD -C $SRC ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- versatile_defconfig
+  $ make O=$BLD -C $SRC ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
+
+You may want to enable some additional modules if you want to boot
+something from the SCSI interface::
+
+  CONFIG_PCI=y
+  CONFIG_PCI_VERSATILE=y
+  CONFIG_SCSI=y
+  CONFIG_SCSI_SYM53C8XX_2=y
+
+You can then boot with a command line like:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -machine type=versatilepb \
+      -serial mon:stdio \
+      -drive if=scsi,driver=file,filename=debian-buster-armel-rootfs.ext4 \
+      -kernel zImage \
+      -dtb versatile-pb.dtb  \
+      -append "console=ttyAMA0 ro root=/dev/sda"
-- 
2.20.1


