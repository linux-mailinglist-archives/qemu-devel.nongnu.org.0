Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E67F6A446A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:30:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeER-0000PY-Lv; Mon, 27 Feb 2023 09:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeD1-0007Fk-Ri
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeD0-0000uG-81
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:31 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso2617385wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DX0+YXyuyC7bCbAN48oSNcnK6nwWOgos2TH5GHnP6Kw=;
 b=M9nEvIDlekQcT9r7mh6gdpw+A8qiUckhK3i1zSaK+3OxtFv+8yhL/yTivzL8jHtlnq
 +Dtt0lowzp7nWePiWWoYR8fZxMIz8T4557GbieiRdFl2yuVp9IivG6aXhVzkLUoB7rzA
 SfZC/SDVvFRy68CtfuyIuvQc7LwMxQwgyEHEetlnTtyrF+o/1qzjlxLurFrt13O/CoX2
 AG5bh4CDqgcuwBQVJm6rWQ/rf5kSR0XVadMHBzy1wOTVequLMjHesYr1sL9clDqjtOVh
 vo95aPM8HrzrPvB7Ak+5uADfrUA8IGksXejHN93+ArqkRCRKgZdA2fcIF72hEepVc3si
 fzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DX0+YXyuyC7bCbAN48oSNcnK6nwWOgos2TH5GHnP6Kw=;
 b=aSk7hWrAIsTcxicj901lCmepb7PBZ++yjK5QZFBtD2g7yMNNLHTIs4mbghrOQG5Y+S
 9XaOQMuB2xfMN57ZTPPsUruZHRF7TlloYNsc7CxCcLa9T2wlpXA/4Ki92GwmUDFWpIDJ
 YIMLKKQzSFQLqVmafipjBAggSoaVLwNPdilS5IoYvDqcOZ1yjZ1UWXv9fupEDjcWnMwp
 sJP++jycNiVvxxZYqlLXOuXp5QCcc6R1v8idMHzD8QUxwoISucXBei2gEgQgbobWBrmi
 sJ1CQNBT5ZCDK15bQ0MEuIaJ52qvMUUVfcNA4DIOK4CxxpuGU5pkeC328jP6xoqW5JdQ
 5chg==
X-Gm-Message-State: AO0yUKUFgvoCrEnkFViS503sv6AWeK0F5pOAUxZBwc8i+iSQKRWTgLBB
 9SvFoBgBtejQjEKSkYHQYsAEinhZhO021wjl
X-Google-Smtp-Source: AK7set+IWpGjzsqI5Fs1u+t06DMKrVJMjGM1g/Oba81ralK6bBSZCVpsKY26HQNyFFHCqzLklbWVTw==
X-Received: by 2002:a05:600c:a295:b0:3eb:29fe:70ec with SMTP id
 hu21-20020a05600ca29500b003eb29fe70ecmr8418496wmb.27.1677507028746; 
 Mon, 27 Feb 2023 06:10:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a7bcbc4000000b003dc3f3d77e3sm8785650wmi.7.2023.02.27.06.10.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:10:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 100/126] hw/ide/mmio: Extract TYPE_MMIO_IDE declarations to
 'hw/ide/mmio.h'
Date: Mon, 27 Feb 2023 15:01:47 +0100
Message-Id: <20230227140213.35084-91-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"hw/ide.h" is a mixed bag of lost IDE declarations.

Extract mmio_ide_init_drives() and the TYPE_MMIO_IDE QOM
declarations to a new "hw/ide/mmio.h" header.

Document the SysBus interface.

Message-Id: <20230215112712.23110-4-philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/mmio.c         |  5 +----
 hw/sh4/r2d.c          |  2 +-
 include/hw/ide.h      |  3 ---
 include/hw/ide/mmio.h | 26 ++++++++++++++++++++++++++
 4 files changed, 28 insertions(+), 8 deletions(-)
 create mode 100644 include/hw/ide/mmio.h

diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index 08493930b7..6bf9048b1e 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -29,9 +29,9 @@
 #include "qemu/module.h"
 #include "sysemu/dma.h"
 
+#include "hw/ide/mmio.h"
 #include "hw/ide/internal.h"
 #include "hw/qdev-properties.h"
-#include "qom/object.h"
 
 /***********************************************************/
 /* MMIO based ide port
@@ -39,9 +39,6 @@
  * dedicated ide controller, which is often seen on embedded boards.
  */
 
-#define TYPE_MMIO_IDE "mmio-ide"
-OBJECT_DECLARE_SIMPLE_TYPE(MMIOIDEState, MMIO_IDE)
-
 struct MMIOIDEState {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index d7020d6d2b..826a0a31b5 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -38,7 +38,7 @@
 #include "hw/qdev-properties.h"
 #include "net/net.h"
 #include "sh7750_regs.h"
-#include "hw/ide.h"
+#include "hw/ide/mmio.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
 #include "hw/usb.h"
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 60f1f4f714..5f8c36b2aa 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -8,9 +8,6 @@
 ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
                         DriveInfo *hd0, DriveInfo *hd1);
 
-/* ide-mmio.c */
-void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1);
-
 int ide_get_geometry(BusState *bus, int unit,
                      int16_t *cyls, int8_t *heads, int8_t *secs);
 int ide_get_bios_chs_trans(BusState *bus, int unit);
diff --git a/include/hw/ide/mmio.h b/include/hw/ide/mmio.h
new file mode 100644
index 0000000000..d726a49848
--- /dev/null
+++ b/include/hw/ide/mmio.h
@@ -0,0 +1,26 @@
+/*
+ * QEMU IDE Emulation: mmio support (for embedded).
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2006 Openedhand Ltd.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#ifndef HW_IDE_MMIO_H
+#define HW_IDE_MMIO_H
+
+#include "qom/object.h"
+
+/*
+ * QEMU interface:
+ *  + sysbus IRQ 0: asserted by the IDE channel
+ *  + sysbus MMIO region 0: data registers
+ *  + sysbus MMIO region 1: status & control registers
+ */
+#define TYPE_MMIO_IDE "mmio-ide"
+OBJECT_DECLARE_SIMPLE_TYPE(MMIOIDEState, MMIO_IDE)
+
+void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1);
+
+#endif
-- 
2.38.1


