Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE8B331062
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:08:26 +0100 (CET)
Received: from localhost ([::1]:33288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGYb-0002zi-79
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:08:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGO5-0007JT-Re
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:57:33 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGO3-0003vb-VJ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:57:33 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u14so11573173wri.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p+5D2HHD+BVS0BJkIQMQ27L655/TTuIBhMWPQAKF8AU=;
 b=eGtMdgxhkh/REo354iMrO/HadqCk26xEkTQGhn10jgukuD5v6/rBS71VTlIiakcdLA
 Ta9dCU64K+ygKrjAzLxHkB4gPYQA4fnzYoP30VLc6kx7VLZnY7LQG4rHXM0E1H+zIrld
 mb8JfoBX1fvZeZUeycjkPON68Fe//MDCKB6jV+/DoPUdPgAiIPJxfykBRJZTvE8YdxuN
 kN2zJM5JON2nqPQKVOOm8vW30G+4GxoloC422ZKg1fAohyCSbuIbSDlM06mToDk/9YrT
 xT972naNqdmEbKwUj+6eNK2ytT0nxNx9F7/fkdfiRQqaAvwhKmJ47XZq6DWSkTKhqTjM
 QKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p+5D2HHD+BVS0BJkIQMQ27L655/TTuIBhMWPQAKF8AU=;
 b=EVYv0lFQDH/aNxew/Xv/8/SnvkR6dmxJ51uIV7uSwI0bZ4nZQXx//sfO4j7AVJwdFJ
 bVjJLCa6mBaSEFL+mHpQZ1/DdEaAAiczg1ePqk385MY5FBwuuO23qLlKCEoH4zqO5EfK
 GUTgV+oreGdFi0zqGLTeji4uyBzOPPMBqkHw/om4sZ90M0wa5m/usfYKt/46b0+CPtq4
 41b57SIO2sjADxLxXSQ2RBWDWbpNAffo6q7iEgsCNXVCj81xc1cgh/h/XejC5UtDU0SV
 7Zd3UYhLgN8TgruItH70U4sFWrGpYL77WIOAo48lswfbfSPepIGDtpuMmfW7nThZMdOb
 mA0g==
X-Gm-Message-State: AOAM531bsfA3jdrfI8CzgRYx9d9bkGKx8IYBY1NbnbFWN3RiuF6HfOTK
 nXUsnIRnd7JqqX0l5mJp8Gb/duyYla9cnQ==
X-Google-Smtp-Source: ABdhPJyq4yFtAdhDa1jUX9o9UNHLqBN0Mim19yX/B1uZZiSCKhyd9w8edhE7SxxX5RkiMKsRGb21ag==
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr12797505wrq.41.1615211850396; 
 Mon, 08 Mar 2021 05:57:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i26sm21238747wmb.18.2021.03.08.05.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:57:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4CA101FF9E;
 Mon,  8 Mar 2021 13:51:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/18] docs: add some documentation for the guest-loader
Date: Mon,  8 Mar 2021 13:51:01 +0000
Message-Id: <20210308135104.24903-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210303173642.3805-7-alex.bennee@linaro.org>

diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
new file mode 100644
index 0000000000..37d03cbd89
--- /dev/null
+++ b/docs/system/guest-loader.rst
@@ -0,0 +1,54 @@
+..
+   Copyright (c) 2020, Linaro
+
+Guest Loader
+------------
+
+The guest loader is similar to the `generic-loader` although it is
+aimed at a particular use case of loading hypervisor guests. This is
+useful for debugging hypervisors without having to jump through the
+hoops of firmware and boot-loaders.
+
+The guest loader does two things:
+
+  - load blobs (kernels and initial ram disks) into memory
+  - sets platform FDT data so hypervisors can find and boot them
+
+This is what is typically done by a boot-loader like grub using it's
+multi-boot capability. A typical example would look like:
+
+.. parsed-literal::
+
+  |qemu_system| -kernel ~/xen.git/xen/xen \
+    -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
+    -device guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro console=hvc0 earlyprintk=xen" \
+    -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
+
+In the above example the Xen hypervisor is loaded by the -kernel
+parameter and passed it's boot arguments via -append. The Dom0 guest
+is loaded into the areas of memory. Each blob will get
+`/chosen/module@<addr>` entry in the FDT to indicate it's location and
+size. Additional information can be passed with by using additional
+arguments.
+
+Currently the only supported machines which use FDT data to boot are
+the ARM and RiscV `virt` machines.
+
+Arguments
+^^^^^^^^^
+
+The full syntax of the guest-loader is::
+
+  -device guest-loader,addr=<addr>[,kernel=<file>,[bootargs=<args>]][,initrd=<file>]
+
+``addr=<addr>``
+  This is mandatory and indicates the start address of the blob.
+
+``kernel|initrd=<file>``
+  Indicates the filename of the kernel or initrd blob. Both blobs will
+  have the "multiboot,module" compatibility string as well as
+  "multiboot,kernel" or "multiboot,ramdisk" as appropriate.
+
+``bootargs=<args>``
+  This is an optional field for kernel blobs which will pass command
+  like via the `/chosen/module@<addr>/bootargs` node.
diff --git a/docs/system/index.rst b/docs/system/index.rst
index cee1c83540..6ad9c93806 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -26,6 +26,7 @@ Contents:
    ivshmem
    linuxboot
    generic-loader
+   guest-loader
    vnc-security
    tls
    gdb
diff --git a/MAINTAINERS b/MAINTAINERS
index 7a37599427..6bebd5279b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2022,6 +2022,7 @@ Guest Loader
 M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
+F: docs/system/guest-loader.rst
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
-- 
2.20.1


