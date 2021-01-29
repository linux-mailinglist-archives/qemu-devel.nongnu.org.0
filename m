Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBCB308C2E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 19:14:41 +0100 (CET)
Received: from localhost ([::1]:40468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5YI3-0008IP-Tg
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 13:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5YH3-0007Gb-SQ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 13:13:37 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5YGz-0007O5-39
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 13:13:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id z6so9721125wrq.10
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 10:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zdmfvGuYJTDTydgoHUl776axD7+1d+L0GaH+C6UnN1Q=;
 b=mBJQ6nkTV0dcchXG5RWLxk3Vnrn6dvswGyIrEQm6o4VToE1XJ/OEpWd1yV/htOzZXm
 KRZAniTNx/NpckeLTK+sr2YOvAz7miq3TQmEqDyPYW6//zhREmlKmXh4zzZ3DmeN6c03
 0mGM8kYWeCFYUT9rBuuOvLJHL3hf4o4y2V70hJlUazIN13rnwBeUYLbgfMeD5qKyGq59
 c/yKDDeiRmflV4LwgDLLK9g7V2RIsnM2c/Nfg+EYTQ3wVuqCMBO8+tyqgAS79UEPr0cW
 INvzKft0aa8YSUdron7AptCM94771SHCumjuym+/KWSWLvpsW0evtQ9f0lUKDu3AxUHf
 9RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zdmfvGuYJTDTydgoHUl776axD7+1d+L0GaH+C6UnN1Q=;
 b=QFoI5oi+hSE1VcEPDg6UuXVHanjkkHvZaGINZ+sGIN0I6DTVhxSuRea+oyoX0+e6AK
 3zQGE/OLTWZXfYNFzv6M0RLlD3rkRwx5Ql/BiYtnyy7xCg5Y8Tr6b9vMKHPuoP51X9lE
 o2/R0oHP0S2PVW5RUVHCNOXY/vOXs0QNCoiDPoZGwtBe+aPA6jmQvET5gehhDHdPwy/L
 3huN3aSKK+2N71u8sl3aBO5LE+aNWPOAtScqkOxfLV323+e50555GkIkCt3YaRS4MBzl
 Z8P0uLz6wsQL5yZMK7rBp0D0H4Ek5HYBAPtpNJyWzHEAbPCYK3fJbtR9AtWYRQPLyzof
 HKzw==
X-Gm-Message-State: AOAM533AIXeOo/vZ3vJQVaaxmYVj42dn8r3j/UAU7Fe5mOqfjypzdy8W
 HZtGVZFBCgo4Cy8I4TR7Z83zXQ==
X-Google-Smtp-Source: ABdhPJwNQxI2kVJBC9oJMsrfPu1dfceaZLpwCiFtHbM8ddkA0zQoaFXG561bvIr26FKXIQubbC0Dbw==
X-Received: by 2002:adf:fd52:: with SMTP id h18mr5973311wrs.295.1611944008477; 
 Fri, 29 Jan 2021 10:13:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m10sm12337769wro.7.2021.01.29.10.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 10:13:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBCED1FF7E;
 Fri, 29 Jan 2021 18:13:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/system: document an example booting the versatilepb
 machine
Date: Fri, 29 Jan 2021 18:13:19 +0000
Message-Id: <20210129181319.2992-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Anders Roxell <anders.roxell@linaro.org>, qemu-arm@nongnu.org,
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
 docs/system/arm/versatile.rst | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/docs/system/arm/versatile.rst b/docs/system/arm/versatile.rst
index 51221c30a4..d16f20ccae 100644
--- a/docs/system/arm/versatile.rst
+++ b/docs/system/arm/versatile.rst
@@ -27,3 +27,35 @@ The Arm Versatile baseboard is emulated with the following devices:
    devices.
 
 -  PL181 MultiMedia Card Interface with SD card.
+
+Booting a Linux kernel
+----------------------
+
+Building a current Linux kernel with ``versatile_defconfig`` should be
+enough to get something running.
+
+.. code-block:: bash
+
+  $ export ARCH=arm
+  $ export CROSS_COMPILE=arm-linux-gnueabihf-
+  $ make versatile_defconfig
+  $ make
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


