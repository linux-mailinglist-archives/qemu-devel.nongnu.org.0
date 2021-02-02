Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0686730C02B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:53:10 +0100 (CET)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6w7A-00012l-PE
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6w3A-0004vJ-KD
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:49:00 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6w37-0002ZB-Vm
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:49:00 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m2so2538161wmm.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eABoWxIu0vBulrtOyOVfFPFiYIEpryeA6wbjtHTgu3I=;
 b=Bv3WEnOf9rfFDLxZi1imPL9/Jbn+vh2/w2Kr9ncrvSX2fIfKdLvw4yVNMoV0vrzQDB
 H4eXaFn7bPqYzC5r7ZcCCHKYDDXigli/Npq4wuhTDCCxQbIPJtclEo7wqWnh26GYGIvR
 1gdhi8058V5a1ctag4JDHUqhZqI5zITrscsX7ZBDM/7G34sT96fdeHRgglpK/r9Jdetj
 MD4m5X/8m88Ain3njioPmKN0MYOXyfD48SPigM/iZ15UKO8Q0jpFSGKq5GhImoO8MqmU
 GbMm2hycWvmpJ3Jt/S0TNYqnXunkcoAlBCrsQZn6h/23zr8Bz5piFccSDncqeJ6UawXk
 o0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eABoWxIu0vBulrtOyOVfFPFiYIEpryeA6wbjtHTgu3I=;
 b=YEuQsLzN6nTs6iLxYHGjlbqTbop8+BPD5FqF8YVrA2FPBk9wsgvE4J66Vv98MbOAbz
 gv3a/iSF/UsNCsExbf5hkWkw4qpa+IWO/xDuFBQKuhlM4lE9+C+zYxBlTx1+NyZw1h49
 54sUdSuVW2JAPILvroZ5x0vHv4T+XGTNYjS1jjNk/6sq0EDbnh20HB5Wk4KMjKQ3r72S
 lJuJ9Hhhregg1z0DG68gjtm33jjDhhlXwUNmkJ4wm9REya5AOdutkav0Xqji7Ctfajo9
 7OLu1Nz1abjk0O5XFAdPhP2gcR9xKO/7aDSvC64GfC9/UcK42BEzaVeMZfp4BhVJhcqi
 7SQg==
X-Gm-Message-State: AOAM533FaaJDHEynn02b2g0YAC0pgaAK2CVR2euBgyAIIRub3HGPkals
 nwmSmPKSuQE9lEcFU+XR6mR33A==
X-Google-Smtp-Source: ABdhPJxkhJ6Wr9ZJv5VCG6fAM5WkvnMYv5GYZkhkyqmeJ5GwbLwRqjw5qw36Y31hUiQNnYdEtFomnw==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr3677058wmi.177.1612273736457; 
 Tue, 02 Feb 2021 05:48:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i59sm34174101wri.3.2021.02.02.05.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:48:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6741A1FF9E;
 Tue,  2 Feb 2021 13:40:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 15/15] docs/system: document an example booting the
 versatilepb machine
Date: Tue,  2 Feb 2021 13:40:00 +0000
Message-Id: <20210202134001.25738-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a bit more out there including Aurelien's excellent write up
and older Debian images here:

  https://www.aurel32.net/info/debian_arm_qemu.php
  https://people.debian.org/~aurel32/qemu/armel/

However the web is transitory and git is forever so lets add something
to the fine manual.

Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  -reword kernel build
---
 docs/system/arm/versatile.rst | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

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


