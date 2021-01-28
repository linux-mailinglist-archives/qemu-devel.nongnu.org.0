Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B3D307E72
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:54:30 +0100 (CET)
Received: from localhost ([::1]:32858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5CR3-0000tW-8G
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5CPo-0000FT-HT
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:53:12 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5CPm-0000PI-5W
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:53:12 -0500
Received: by mail-wr1-x434.google.com with SMTP id g10so6490755wrx.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 10:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xtj/YspweNDXNSalS9uwvsWmvlz2awO1cN3TGJ6zgII=;
 b=C1qfoXcqK+zisS1rqAJiqCI6nBw9ZFxubXhLHX/0TU0e8ki77GADE4u8tfar9HjzrU
 4e676oxmC4Na1HvehEKg22TjgnG12ftDpoxQZ7XUAjAxHF+POPRd7Dm1s34JYVziHjXq
 GHWBVaN7PHsrwDAzWTSi7ipEYwzKoTtR6qZBqdVHTR9D382UDevEJvzv/aBISbyEjbsW
 Im5nXCTsB8LPQCR0PFU39EI+evAe301ddJUXxafQo+XGzVUKAQ2Hx5nhZ6L4XAoHp3bq
 u9vjNvVB3zWj56ckdPczRBcntF2O+q5deh3YB+0CuM9PqhoN998W6PpewukhqUrk6LiA
 9+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xtj/YspweNDXNSalS9uwvsWmvlz2awO1cN3TGJ6zgII=;
 b=HZJeeB7QSD7zbUsiIirno0czYOTL2u5mESS14AvtL5jlHh70MvGBURXyQC/4NJ4neM
 fZTzuyl+2Zt8kfj45hL4oAw6YAwE+LGEwqaV/PbO8zvgRCYAsNFm5gke9DInUBJgHStd
 J85NllV7MtSevMePXbVO1ghxlHxHpkjgRzq+qhfKBaWgn5dO82bBRdy5jMH0vhOXyL06
 SYp/muXTqpBLlfeH+iom+9OVky2pYRu4fsFEeUPKAq+QjXtk4G3oUuorELSn2oT+O64c
 svquUto8hiTceKRYhMSTTPm18Uz5ZQlWDpmZXPHlRQPae+CiYOG5ntfTwUjYMVRk5I0j
 di+w==
X-Gm-Message-State: AOAM5317HtwV0e5BFjX2HErFE2ZXR5z/llQzMLMxOQBh/mNZ9rrWzVSW
 yUd8SPM8FrJQqYVlZgPmGkW1ng==
X-Google-Smtp-Source: ABdhPJwW/Wt91j0NvQ+g/Vzv5FBrIsaN4Iw9oZd7gioHCJtpuV5ctMGCtUr788VCxglRKPUGb+ksZA==
X-Received: by 2002:a05:6000:1543:: with SMTP id
 3mr559903wry.254.1611859988612; 
 Thu, 28 Jan 2021 10:53:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v6sm8019721wrx.32.2021.01.28.10.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 10:53:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE9FD1FF7E;
 Thu, 28 Jan 2021 18:53:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/system: document an example vexpress-a15 invocation
Date: Thu, 28 Jan 2021 18:53:00 +0000
Message-Id: <20210128185300.2875-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The wiki and the web are curiously absent of the right runes to boot a
vexpress model so I had to work from first principles to work it out.
Use the more modern -drive notation so alternative backends can be
used (unlike the hardwired -sd mode).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
index 7f1bcbef07..30b1823b95 100644
--- a/docs/system/arm/vexpress.rst
+++ b/docs/system/arm/vexpress.rst
@@ -58,3 +58,29 @@ Other differences between the hardware and the QEMU model:
   ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
   provided on the command line then QEMU will edit it to include
   suitable entries describing these transports for the guest.
+
+Booting a Linux kernel
+----------------------
+
+Building a current Linux kernel with ``multi_v7_defconfig`` should be
+enough to get something running.
+
+.. code-block:: bash
+
+  $ export ARCH=arm
+  $ export CROSS_COMPILE=arm-linux-gnueabihf-
+  $ make multi_v7_defconfig
+  $ make
+
+By default you will want to boot your rootfs of the sdcard interface.
+Your rootfs will need to be padded to the right size. With a suitable
+DTB you could also add devices to the virtio-mmio bus.
+
+.. code-block:: bash
+
+  $ qemu-system-arm -cpu cortex-a15 -smp 4 -m 4096 \
+      -machine type=vexpress-a15 -serial mon:stdio \
+      -drive if=sd,driver=file,filename=armel-rootfs.ext4 \
+      -kernel zImage  \
+      -dtb vexpress-v2p-ca15-tc1.dtb \
+      -append "console=ttyAMA0 root=/dev/mmcblk0 ro"
-- 
2.20.1


