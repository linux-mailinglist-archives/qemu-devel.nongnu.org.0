Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431F30C063
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:56:49 +0100 (CET)
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wAi-0004Zy-G5
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6w3B-0004xW-GO
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:49:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6w38-0002ZT-SQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:49:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id 190so2538795wmz.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7t4BNORgy1dae3kq2wXQigCulzaDzMkv3Wc+M7mZQsE=;
 b=eOzdxj2Y6rhe3hsu1m0wFXVhYNMcMwB1fdPniua3PS2ux7Eloeek4n5hRPD70tZCec
 UDASZt5o63fzVvsWAdRWBAEmnmHoSlEIumulMWx9cXnDar+mipHkh1bK+s/GWSU+njW+
 38++yMvFmAPyE6NFZU4uF6oAqZoFeauUmXXfyFvt2Z1lNIf+IN3Zw37vkvDmgh/oN+jf
 jVtJWrotmUx6kNssNijst+Px6yeIYN/PbN5D7GkaYlaXOmTixKjhhjD+XTmOUO5ueILp
 9gZcC1Y52cM407ZCM/hU25fyOPtQH9WnztOasRJuSko6mFcPxj2GiyR/+95COFX0jbx+
 5N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7t4BNORgy1dae3kq2wXQigCulzaDzMkv3Wc+M7mZQsE=;
 b=dbSA9aVoEKYuTkz1mE0bXeDDE3OGlk2msr3wtJyrHzq1H4ncxgQxavhd5c5z8jzfrH
 K6MmAqivr3XHOxCDv/qns+6s5aebFrr3RpVXeclbx84YsQuHdIqZOlJh+w4kfnbmzo0W
 S8WGCbqrPZEM6quGXK2/sEzezbgoQKyoQ0dRvCJwQvo/sUx/1HOupjBx/SU2NF3pJ8kw
 i3Qm7eVgWQ0g1oNQGN3fM1PMpUwWN591ud/BvmSZwS3z1YUJ9N8Vs6Flr6I0um85cIIg
 82sXGjKxk9oGgnpUe1KMu6Rg4svedNUtM70OILgHk+7B2kqKPUnvw/vy+UQuQxEK7jCz
 5h5A==
X-Gm-Message-State: AOAM533tOFA1OFIuU5/KQ6CfMO6dyZNS34GqZCvwKErx5EQJ+YgtTXOD
 eCg2ukPsjDqKmv6xtmP5toZtow==
X-Google-Smtp-Source: ABdhPJzXUMshn80AGdYrI/g5yE2ba4IzLRZ+m30Byu2P7SirOyzjmQweIzqthIqr3ZnSz0aEn/DN1A==
X-Received: by 2002:a7b:c395:: with SMTP id s21mr3725774wmj.97.1612273737494; 
 Tue, 02 Feb 2021 05:48:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m22sm33154710wrh.66.2021.02.02.05.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:48:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 51B8D1FF9D;
 Tue,  2 Feb 2021 13:40:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 14/15] docs/system: document an example vexpress-a15
 invocation
Date: Tue,  2 Feb 2021 13:39:59 +0000
Message-Id: <20210202134001.25738-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
 "open list:Versatile Express" <qemu-arm@nongnu.org>,
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
v2
  - reword kernel build.
---
 docs/system/arm/vexpress.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

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


