Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E9313B6C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:49:34 +0100 (CET)
Received: from localhost ([::1]:34644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AfF-0004OT-IT
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95uX-0004M0-Iw
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:45:03 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95uQ-0000eW-9y
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:45:01 -0500
Received: by mail-wr1-x431.google.com with SMTP id l12so16970290wry.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6bc9E/qj8MVrG1lrbbnDCW0cq4qlP1ZjoNfCdUMbKio=;
 b=fLQ61n/+ea7zzB/PphMljhmU63cmAiwMCJDFiLca2nKvdJPeFMxQlEmdpnNCvobsSS
 ekKH8ye+Ft5X88617gJxZIkmBVjqjEyIilTMx7icOnxMrcyMYqi/R75Zr7HHrUw+Zcw7
 hSpdANhvu+r20WxVJjjeOgGs2Q4xN13Y9krbp95Oi1SFQulS4wZP/RrCTVhRuXSobM9x
 8bMVq7xMzbPsOv/6aaF2bMlGS0muBGAk/tXKV7qAFtTnhcI/jpxwECDlhZQhibxKFAzv
 fwFSUtWB6RFKDLH3C5Lxzt9XuY0u72/Df9c21XwGCX33QZQLkSHMFO9sXfkoeYr2gGN5
 T6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6bc9E/qj8MVrG1lrbbnDCW0cq4qlP1ZjoNfCdUMbKio=;
 b=cB9VC1hP03scwcWP+M6ZJY5WQnfpW46SEBkgOK1PDgSakGMcyWJb+fmfOXmLbqn1gh
 5SpmByaFJE8jLBPC84LovXDXrVynqSGR7EKfJL/0bwlXD3T9zcrYDgkJOWAE5GcKfym4
 UlJniy9tmxr3IXlcWiB/6La99aXmUmREgQp9dOmV+m+cvP9Jw7z1Wr5U+CfuApLMhV+a
 yPv3hQvfnCq3pxH+cbrh698XJLQ3LeIcidisJAG2tgGTjZEZ4qMM4DhPC61+zJznQrpv
 5k+gKdPESoGNHxLcoGj4MUsaiOZJzDe/qHmsF7SlXq1a0jlMsOism8K7NGkmxAgDgQom
 mwYw==
X-Gm-Message-State: AOAM5326tL/57ynEqB8qqvuWRBmjhW4kqYKIssez8I12P6evANz6qCd8
 WTgjDIlukoBHolkp77gNowIdY/nmfTa4BsC0
X-Google-Smtp-Source: ABdhPJyeVKvpQwhiccuH7/wmEk9sCXbrY45cT05PcEPhvQz97Vefx1HUIOGf99pY+i4hTQjVjbqgtQ==
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr19956836wry.301.1612788292622; 
 Mon, 08 Feb 2021 04:44:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c11sm27764528wrs.28.2021.02.08.04.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:44:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2737B1FF9E;
 Mon,  8 Feb 2021 12:38:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/16] docs/system: document an example vexpress-a15 invocation
Date: Mon,  8 Feb 2021 12:38:20 +0000
Message-Id: <20210208123821.19818-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 "open list:Versatile Express" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The wiki and the web are curiously absent of the right runes to boot a
vexpress model so I had to work from first principles to work it out.
Use the more modern -drive notation so alternative backends can be
used (unlike the hardwired -sd mode).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
Message-Id: <20210202134001.25738-15-alex.bennee@linaro.org>

diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
index 7f1bcbef07..3e3839e923 100644
--- a/docs/system/arm/vexpress.rst
+++ b/docs/system/arm/vexpress.rst
@@ -58,3 +58,31 @@ Other differences between the hardware and the QEMU model:
   ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
   provided on the command line then QEMU will edit it to include
   suitable entries describing these transports for the guest.
+
+Booting a Linux kernel
+----------------------
+
+Building a current Linux kernel with ``multi_v7_defconfig`` should be
+enough to get something running. Nowadays an out-of-tree build is
+recommended (and also useful if you build a lot of different targets).
+In the following example $BLD points to the build directory and $SRC
+points to the root of the Linux source tree. You can drop $SRC if you
+are running from there.
+
+.. code-block:: bash
+
+  $ make O=$BLD -C $SRC ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- multi_v7_defconfig
+  $ make O=$BLD -C $SRC ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
+
+By default you will want to boot your rootfs off the sdcard interface.
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


