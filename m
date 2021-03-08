Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E129F3310C5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:29:28 +0100 (CET)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGsy-0008TH-0M
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGIC-0006dc-09
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:28 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGI7-0001GO-20
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:27 -0500
Received: by mail-wr1-x435.google.com with SMTP id e10so11493570wro.12
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e2s2r/+NfeVKeys87ugSZc5DKzDIrEIIPjFuy/f+xuQ=;
 b=xxV1L6f+Lv5a9baKHjvRRjoxFbkvWdJ6X/5/uFwUSVU+mEJCEbAg/fonTfH0vtfowZ
 a9TU6aRzgOTB9SoODZpWFv3V79ButsPcZXyF12tpVYthOcHWzjXo8PW0kYjItJgywB2o
 7ruldkd8gU5Ex+YgtCOsWPsxZXnA85vEdcHgOxb8G+9MoP2fkCVod1XSstrtmptbQXwB
 E+DJueGlps0mqDUMrqrdaaeYA+oi7TZNx7wOcEnGBl3dzE6bO6uN2TILxR7dVzGZ2iZ3
 5z5xlruA0bXq23fjdmOcrJr+QrICpbRYn+SMSBN3lBG9HahRnsAzbTiiqcj4uidLcGV3
 xJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e2s2r/+NfeVKeys87ugSZc5DKzDIrEIIPjFuy/f+xuQ=;
 b=DOjnB0bIWyfnVUV/yCeSp5cQUPFyY+bbESZc3yvlQVgqC9M1xRDIUrnxM/KxlvG752
 QWgzejIX+53JvnLdLoFqNnZq/2ZCrnL7idECt88OQpvdJ8w/9A+5qO/zx6pD+yOQTJX3
 HqwYuAPSgkUmAxMZhMD69i/0v8584uRI3zA9v8i3osAPyZX8XXhw5lgnldmLcIixTzV8
 lVcmxknYSn2LFDzKahAJctto10bjK9ii3kWI5B1KePowimkCyHGF3SMYjsVQYx9KbjXE
 ZtJbvPWHkjX5qLitvLvnSomASM+ivCypeFlRV61B9gj4pBBSXvdVjiG8NaGbuImgcwSg
 kP7A==
X-Gm-Message-State: AOAM533tT+UaTkRUaQXHPHDL3+3jNgSBEhzwWJEhw+75mw3bb65FPA6P
 EQw0c/Gilg3xKojKDouCfhQeew==
X-Google-Smtp-Source: ABdhPJxoCTfzwEev49WQprc+OL+8piHAkz0kvPFlDW82GeRCudpjYfjGPKreA7or/d6XJeZDvcsSHQ==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr22730679wrn.59.1615211481357; 
 Mon, 08 Mar 2021 05:51:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s9sm4589633wmh.31.2021.03.08.05.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:51:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 339591FF9D;
 Mon,  8 Mar 2021 13:51:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/18] docs: move generic-loader documentation into the main
 manual
Date: Mon,  8 Mar 2021 13:51:00 +0000
Message-Id: <20210308135104.24903-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We might as well surface this useful information in the manual so
users can find it easily. It is a fairly simple conversion to rst with
the only textual fixes being QemuOps to QemuOpts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210303173642.3805-6-alex.bennee@linaro.org>

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
index 0134cad491..7a37599427 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2016,7 +2016,7 @@ M: Alistair Francis <alistair@alistair23.me>
 S: Maintained
 F: hw/core/generic-loader.c
 F: include/hw/core/generic-loader.h
-F: docs/generic-loader.txt
+F: docs/system/generic-loader.rst
 
 Guest Loader
 M: Alex Bennée <alex.bennee@linaro.org>
-- 
2.20.1


