Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D943A93B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 02:29:33 +0200 (CEST)
Received: from localhost ([::1]:39342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfALN-0008QL-0S
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 20:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mfAFz-0002Xk-S2
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 20:23:59 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:40838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mfAFy-0008Ol-6I
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 20:23:59 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 s18-20020a0568301e1200b0054e77a16651so17305810otr.7
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 17:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sp+xZsyopFZ2T6IJKWb8wBn8wTMxA4UWheot3sKW/F4=;
 b=Fny340p7AiznfiGZm5Ab0bgUqUPQonj2at1RUosk0gdZ/p+3XBGUhyvNz8OvRwsOT9
 uHEoG+8K8PR5i/WmHJ+DRCLjTzxuGdhathymEtz8gd2KrOwOvTPB9+lS/ZBbIqpdpMr3
 m9P/6sA08I18J98/OQ5oS04rgmigf3y90Mvn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sp+xZsyopFZ2T6IJKWb8wBn8wTMxA4UWheot3sKW/F4=;
 b=jNBY09w7TZNbmVs6JXlBdQRC6OOaO20Stw4yTe+E+WZWbhv9VjOFXbngGf0nWmJHhL
 Jqo0hTkauQ+rhNkAxrCGqnc72IqMkmsLl5oX0IKoxvMXCUrEg76yS2Cj8lxbSLLdUJrH
 E0ownqsQd70kubrbl87P0zxgEp9G/E7ERfqkGanhbRg0324wpydF6QTD0rGSMBY/w8gi
 J2uKdWOU0z+xFSWCOcAKGTUIAaPDI8YexCYttLIZvDn7uDOWs8qPVatj7vwlm7fnnv1+
 7EcogE0/tONWX8Ke1cKP9sbVxaEGDgJj7twkHcJxaa5qh+MTA8u3qlYAF/QWx4oc++Cv
 jWNQ==
X-Gm-Message-State: AOAM532SC+OYYm/X8oDeU6IecOaqpY//jUgI15T33Pm/aaXXjZeBuZDo
 TbaEHqpZ+H9CkzbIj8VdOcYDUQ==
X-Google-Smtp-Source: ABdhPJxGlqYVbG1U06sMaVd2mTUaddx7ijkxjoysMsc9/qeRCuS/+F5OR1Tq28EgMQZJ4iHa5xM18Q==
X-Received: by 2002:a05:6830:124d:: with SMTP id
 s13mr17123900otp.336.1635207836900; 
 Mon, 25 Oct 2021 17:23:56 -0700 (PDT)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id v24sm3331926oou.45.2021.10.25.17.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:23:56 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH v5 04/26] arm: riscv: qemu: Explain how to extract the
 generated dt
Date: Mon, 25 Oct 2021 18:23:22 -0600
Message-Id: <20211026002344.405160-5-sjg@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026002344.405160-1-sjg@chromium.org>
References: <20211026002344.405160-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=sjg@chromium.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Tom Rini <trini@konsulko.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 Sean Anderson <seanga2@gmail.com>, Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU currently generates a devicetree for use with U-Boot. Explain how to
obtain it.

Also explain how to merge it to produce a devicetree with the U-Boot
features included.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v5:
- Merge RISC-V and ARM patches since they are similar

 doc/board/emulation/qemu-arm.rst   |  3 ++
 doc/board/emulation/qemu-riscv.rst |  3 ++
 doc/develop/devicetree/dt_qemu.rst | 48 ++++++++++++++++++++++++++++++
 doc/develop/devicetree/index.rst   |  1 +
 4 files changed, 55 insertions(+)
 create mode 100644 doc/develop/devicetree/dt_qemu.rst

diff --git a/doc/board/emulation/qemu-arm.rst b/doc/board/emulation/qemu-arm.rst
index 97b6ec64905..a39df046fc3 100644
--- a/doc/board/emulation/qemu-arm.rst
+++ b/doc/board/emulation/qemu-arm.rst
@@ -21,6 +21,9 @@ The 'virt' platform provides the following as the basic functionality:
 
 Additionally, a number of optional peripherals can be added to the PCI bus.
 
+See :doc:`../../develop/devicetree/dt_qemu` for information on how to see
+the devicetree actually generated by QEMU.
+
 Building U-Boot
 ---------------
 Set the CROSS_COMPILE environment variable as usual, and run:
diff --git a/doc/board/emulation/qemu-riscv.rst b/doc/board/emulation/qemu-riscv.rst
index 4b8e104a215..3409fff8117 100644
--- a/doc/board/emulation/qemu-riscv.rst
+++ b/doc/board/emulation/qemu-riscv.rst
@@ -13,6 +13,9 @@ The QEMU virt machine models a generic RISC-V virtual machine with support for
 the VirtIO standard networking and block storage devices. It has CLINT, PLIC,
 16550A UART devices in addition to VirtIO and it also uses device-tree to pass
 configuration information to guest software. It implements RISC-V privileged
+
+See :doc:`../../develop/devicetree/dt_qemu` for information on how to see
+the devicetree actually generated by QEMU.
 architecture spec v1.10.
 
 Building U-Boot
diff --git a/doc/develop/devicetree/dt_qemu.rst b/doc/develop/devicetree/dt_qemu.rst
new file mode 100644
index 00000000000..1392a2cae97
--- /dev/null
+++ b/doc/develop/devicetree/dt_qemu.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Devicetree in QEMU
+==================
+
+For QEMU on ARM, RISC-V and one PPC target, the devicetree is created on the
+fly by QEMU. It is intended for use in Linux but can be used by U-Boot also,
+so long as any nodes/properties needed by U-Boot are merged in.
+
+When `CONFIG_OF_BOARD` is enabled
+
+
+Obtaining the QEMU devicetree
+-----------------------------
+
+Where QEMU generates its own devicetree to pass to U-Boot tou can use
+`-dtb u-boot.dtb` to force QEMU to use U-Boot's in-tree version.
+
+To obtain the devicetree that qemu generates, add `-machine dumpdtb=qemu.dtb`,
+e.g.::
+
+    qemu-system-arm -machine virt -machine dumpdtb=qemu.dtb
+
+    qemu-system-aarch64 -machine virt -machine dumpdtb=qemu.dtb
+
+    qemu-system-riscv64 -machine virt -machine dumpdtb=qemu.dtb
+
+
+Merging in U-Boot nodes/properties
+----------------------------------
+
+Various U-Boot features require nodes and properties in the U-Boot devicetree
+and at present QEMU is unaware of these. To use these you must manually merge
+in the appropriate pieces.
+
+One way to do this is with dtc. This command runs dtc on each .dtb file in turn,
+to produce a text file. It drops the duplicate header on the qemu one. Then it
+joins them up and runs them through dtc to compile the output::
+
+    qemu-system-arm -machine virt -machine dumpdtb=qemu.dtb
+    cat  <(dtc -I dtb qemu.dtb) <(dtc -I dtb  u-boot.dtb |grep -v /dts-v1/) |dtc - -o merged.dtb
+
+You can then run qemu with the merged devicetree, e.g.::
+
+    qemu-system-arm -machine virt -nographic -bios u-boot.bin -dtb merged.dtb
+
+Note that there seems to be a bug in some versions of qemu where the output of
+dumpdtb does not quite match what is provided to U-Boot.
diff --git a/doc/develop/devicetree/index.rst b/doc/develop/devicetree/index.rst
index b5b33dfea0f..fc2fb41b1bb 100644
--- a/doc/develop/devicetree/index.rst
+++ b/doc/develop/devicetree/index.rst
@@ -12,3 +12,4 @@ build-time and runtime configuration.
    intro
    control
    dt_update
+   dt_qemu
-- 
2.33.0.1079.g6e70778dc9-goog


