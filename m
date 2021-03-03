Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAB732B989
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:41:13 +0100 (CET)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVUm-0005iS-Sp
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQc-00004r-PY
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:36:54 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQa-0002qF-Cn
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:36:54 -0500
Received: by mail-wm1-x32c.google.com with SMTP id u187so5840505wmg.4
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 09:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C4OH1UjeiJ8djx+g35HMcQPeesTsGZkmXqfeV0TYj8w=;
 b=hqMX4fq3KsnQxGP8BBbiWE1wlucQW1oImfKMxmvKEQ4odjpL3OdCWEyNW3CotSt1F+
 OCB7717CSyr+j5hITkVxfeu4gxQmRZ/BsjL3k6NRecPFX3uN7YTqCVHBEkGA3XyXzDoa
 SpRMDdIGFCArKaSZRq9XMzuNzX73KWPz43f8SUX/r6osS4tADxqeazpkRL5w/Alevla3
 W3UtUAVaGGSxUMvWbj3nsYVMEuM9l/Wexlh900j9Gpu/5szDLUXPW7VyGovCzrr+mfbA
 cQ4hBIaSrqcZz8EcUOh294ouF4s+bDgWEIojyaqJJYxuSLvgipF0gqm3iPyfmZ50wSS+
 T8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4OH1UjeiJ8djx+g35HMcQPeesTsGZkmXqfeV0TYj8w=;
 b=huRyI+EEzxeKFr5r17d5iIsNWaX4VXehg49ZzgdNirdqxegTDzgvxIrGJtpviu3dqq
 p89lpF/vGgxbLLqCwT3XmC6tJ5GWQ4xcitWMT1nfJ/Iy7/fctWOyo18Whps6gMVGMCEt
 /awhuQLLrB/EIlx2z8rB7fjjkVEih99ltyKQ9MRdVJhE9WltTHMHk0hTuPvaRnnjowWF
 g4UotPrCU1Tld5oEHVIDt6vS2mDkAy7IUK/Yz/557AMfAyaaykFbUcoZfv6VkGRx6R/H
 dhjlL/0OQjz4Lf19rf6aCzrWetcDs3duBNKCgIU81NNXdoJ/rop7ybVPtpFWX6vUzCNs
 ZDIg==
X-Gm-Message-State: AOAM532+dWU0c6uDobDvBY/cHwW4Q/JlAcU/hG+1tj8SWsL2TXu1q+eU
 QRQbLpsGskVrSEq7jtLnjrjsPw==
X-Google-Smtp-Source: ABdhPJwk3n+g1rRKcRyIHHEWTYD1lV/s+k61cAclZDa1OpP7L7vMHec8bTu03E8Vj36KyQVMN0oxgQ==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr91022wmj.67.1614793010784;
 Wed, 03 Mar 2021 09:36:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x13sm32378438wrt.75.2021.03.03.09.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:36:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CD7991FF91;
 Wed,  3 Mar 2021 17:36:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] docs: move generic-loader documentation into the main
 manual
Date: Wed,  3 Mar 2021 17:36:40 +0000
Message-Id: <20210303173642.3805-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303173642.3805-1-alex.bennee@linaro.org>
References: <20210303173642.3805-1-alex.bennee@linaro.org>
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
Cc: Alistair Francis <alistair@alistair23.me>, julien@xen.org,
 andre.przywara@arm.com, stefano.stabellini@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org,
 stefano.stabellini@xilinx.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We might as well surface this useful information in the manual so
users can find it easily. It is a fairly simple conversion to rst with
the only textual fixes being QemuOps to QemuOpts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20201105175153.30489-6-alex.bennee@linaro.org>
Message-Id: <20210211171945.18313-6-alex.bennee@linaro.org>
---
 docs/generic-loader.txt        |  92 --------------------------
 docs/system/generic-loader.rst | 117 +++++++++++++++++++++++++++++++++
 docs/system/index.rst          |   1 +
 MAINTAINERS                    |   2 +-
 4 files changed, 119 insertions(+), 93 deletions(-)
 delete mode 100644 docs/generic-loader.txt
 create mode 100644 docs/system/generic-loader.rst

diff --git a/docs/generic-loader.txt b/docs/generic-loader.txt
deleted file mode 100644
index a9603a2af7..0000000000
--- a/docs/generic-loader.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-Copyright (c) 2016 Xilinx Inc.
-
-This work is licensed under the terms of the GNU GPL, version 2 or later.  See
-the COPYING file in the top-level directory.
-
-
-The 'loader' device allows the user to load multiple images or values into
-QEMU at startup.
-
-Loading Data into Memory Values
--------------------------------
-The loader device allows memory values to be set from the command line. This
-can be done by following the syntax below:
-
-     -device loader,addr=<addr>,data=<data>,data-len=<data-len>
-                   [,data-be=<data-be>][,cpu-num=<cpu-num>]
-
-    <addr>      - The address to store the data in.
-    <data>      - The value to be written to the address. The maximum size of
-                  the data is 8 bytes.
-    <data-len>  - The length of the data in bytes. This argument must be
-                  included if the data argument is.
-    <data-be>   - Set to true if the data to be stored on the guest should be
-                  written as big endian data. The default is to write little
-                  endian data.
-    <cpu-num>   - The number of the CPU's address space where the data should
-                  be loaded. If not specified the address space of the first
-                  CPU is used.
-
-All values are parsed using the standard QemuOps parsing. This allows the user
-to specify any values in any format supported. By default the values
-will be parsed as decimal. To use hex values the user should prefix the number
-with a '0x'.
-
-An example of loading value 0x8000000e to address 0xfd1a0104 is:
-    -device loader,addr=0xfd1a0104,data=0x8000000e,data-len=4
-
-Setting a CPU's Program Counter
--------------------------------
-The loader device allows the CPU's PC to be set from the command line. This
-can be done by following the syntax below:
-
-     -device loader,addr=<addr>,cpu-num=<cpu-num>
-
-    <addr>      - The value to use as the CPU's PC.
-    <cpu-num>   - The number of the CPU whose PC should be set to the
-                  specified value.
-
-All values are parsed using the standard QemuOps parsing. This allows the user
-to specify any values in any format supported. By default the values
-will be parsed as decimal. To use hex values the user should prefix the number
-with a '0x'.
-
-An example of setting CPU 0's PC to 0x8000 is:
-    -device loader,addr=0x8000,cpu-num=0
-
-Loading Files
--------------
-The loader device also allows files to be loaded into memory. It can load ELF,
-U-Boot, and Intel HEX executable formats as well as raw images.  The syntax is
-shown below:
-
-    -device loader,file=<file>[,addr=<addr>][,cpu-num=<cpu-num>][,force-raw=<raw>]
-
-    <file>      - A file to be loaded into memory
-    <addr>      - The memory address where the file should be loaded. This is
-                  required for raw images and ignored for non-raw files.
-    <cpu-num>   - This specifies the CPU that should be used. This is an
-                  optional argument and will cause the CPU's PC to be set to
-                  the memory address where the raw file is loaded or the entry
-                  point specified in the executable format header. This option
-                  should only be used for the boot image.
-                  This will also cause the image to be written to the specified
-                  CPU's address space. If not specified, the default is CPU 0.
-    <force-raw> - Setting force-raw=on forces the file to be treated as a raw
-                  image.  This can be used to load supported executable formats
-                  as if they were raw.
-
-All values are parsed using the standard QemuOps parsing. This allows the user
-to specify any values in any format supported. By default the values
-will be parsed as decimal. To use hex values the user should prefix the number
-with a '0x'.
-
-An example of loading an ELF file which CPU0 will boot is shown below:
-    -device loader,file=./images/boot.elf,cpu-num=0
-
-Restrictions and ToDos
-----------------------
- - At the moment it is just assumed that if you specify a cpu-num then you
-   want to set the PC as well. This might not always be the case. In future
-   the internal state 'set_pc' (which exists in the generic loader now) should
-   be exposed to the user so that they can choose if the PC is set or not.
diff --git a/docs/system/generic-loader.rst b/docs/system/generic-loader.rst
new file mode 100644
index 0000000000..6bf8a4eb48
--- /dev/null
+++ b/docs/system/generic-loader.rst
@@ -0,0 +1,117 @@
+..
+   Copyright (c) 2016, Xilinx Inc.
+
+This work is licensed under the terms of the GNU GPL, version 2 or later.  See
+the COPYING file in the top-level directory.
+
+Generic Loader
+--------------
+
+The 'loader' device allows the user to load multiple images or values into
+QEMU at startup.
+
+Loading Data into Memory Values
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+The loader device allows memory values to be set from the command line. This
+can be done by following the syntax below::
+
+   -device loader,addr=<addr>,data=<data>,data-len=<data-len> \
+                   [,data-be=<data-be>][,cpu-num=<cpu-num>]
+
+``<addr>``
+  The address to store the data in.
+
+``<data>``
+  The value to be written to the address. The maximum size of the data
+  is 8 bytes.
+
+``<data-len>``
+  The length of the data in bytes. This argument must be included if
+  the data argument is.
+
+``<data-be>``
+  Set to true if the data to be stored on the guest should be written
+  as big endian data. The default is to write little endian data.
+
+``<cpu-num>``
+  The number of the CPU's address space where the data should be
+  loaded. If not specified the address space of the first CPU is used.
+
+All values are parsed using the standard QemuOps parsing. This allows the user
+to specify any values in any format supported. By default the values
+will be parsed as decimal. To use hex values the user should prefix the number
+with a '0x'.
+
+An example of loading value 0x8000000e to address 0xfd1a0104 is::
+
+    -device loader,addr=0xfd1a0104,data=0x8000000e,data-len=4
+
+Setting a CPU's Program Counter
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The loader device allows the CPU's PC to be set from the command line. This
+can be done by following the syntax below::
+
+     -device loader,addr=<addr>,cpu-num=<cpu-num>
+
+``<addr>``
+  The value to use as the CPU's PC.
+
+``<cpu-num>``
+  The number of the CPU whose PC should be set to the specified value.
+
+All values are parsed using the standard QemuOpts parsing. This allows the user
+to specify any values in any format supported. By default the values
+will be parsed as decimal. To use hex values the user should prefix the number
+with a '0x'.
+
+An example of setting CPU 0's PC to 0x8000 is::
+
+    -device loader,addr=0x8000,cpu-num=0
+
+Loading Files
+^^^^^^^^^^^^^
+
+The loader device also allows files to be loaded into memory. It can load ELF,
+U-Boot, and Intel HEX executable formats as well as raw images.  The syntax is
+shown below:
+
+    -device loader,file=<file>[,addr=<addr>][,cpu-num=<cpu-num>][,force-raw=<raw>]
+
+``<file>``
+  A file to be loaded into memory
+
+``<addr>``
+  The memory address where the file should be loaded. This is required
+  for raw images and ignored for non-raw files.
+
+``<cpu-num>``
+  This specifies the CPU that should be used. This is an
+  optional argument and will cause the CPU's PC to be set to the
+  memory address where the raw file is loaded or the entry point
+  specified in the executable format header. This option should only
+  be used for the boot image. This will also cause the image to be
+  written to the specified CPU's address space. If not specified, the
+  default is CPU 0. <force-raw> - Setting force-raw=on forces the file
+  to be treated as a raw image. This can be used to load supported
+  executable formats as if they were raw.
+
+All values are parsed using the standard QemuOpts parsing. This allows the user
+to specify any values in any format supported. By default the values
+will be parsed as decimal. To use hex values the user should prefix the number
+with a '0x'.
+
+An example of loading an ELF file which CPU0 will boot is shown below::
+
+    -device loader,file=./images/boot.elf,cpu-num=0
+
+Restrictions and ToDos
+^^^^^^^^^^^^^^^^^^^^^^
+
+At the moment it is just assumed that if you specify a cpu-num then
+you want to set the PC as well. This might not always be the case. In
+future the internal state 'set_pc' (which exists in the generic loader
+now) should be exposed to the user so that they can choose if the PC
+is set or not.
+
+
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 625b494372..cee1c83540 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -25,6 +25,7 @@ Contents:
    usb
    ivshmem
    linuxboot
+   generic-loader
    vnc-security
    tls
    gdb
diff --git a/MAINTAINERS b/MAINTAINERS
index a5b87d5e30..34cdd20672 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2005,7 +2005,7 @@ M: Alistair Francis <alistair@alistair23.me>
 S: Maintained
 F: hw/core/generic-loader.c
 F: include/hw/core/generic-loader.h
-F: docs/generic-loader.txt
+F: docs/system/generic-loader.rst
 
 Guest Loader
 M: Alex Bennée <alex.bennee@linaro.org>
-- 
2.20.1


