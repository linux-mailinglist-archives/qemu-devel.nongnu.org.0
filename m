Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C6A3897A9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 22:14:56 +0200 (CEST)
Received: from localhost ([::1]:43954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljSal-00007B-4a
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 16:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljSVz-0001qg-0g; Wed, 19 May 2021 16:09:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljSVx-0003Sj-Gs; Wed, 19 May 2021 16:09:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id x8so15288420wrq.9;
 Wed, 19 May 2021 13:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+1cCgzdNERUA2fldYa5OSx6THJ2HPT3UIVGVPz585YA=;
 b=IZR6cLq7TbuRY68MoX65C0CZ/KAgrRugZ51VO0KqROTql3Fk6WOfZJBlZsZ+xXBiGc
 xqUED0sDabeX/vgGtnE6kgQOGHB41pxwe2TxotFmTUQcGPMVO6Aip68DaqjNAuIHIjjZ
 Vr6r+JcMkfnPmGxrdVODDIsacyFM1AUM81HhmQABl/s+NzcB3bdAIMagY7HT7A24oVoM
 yIZywsuUep3E0dPujGf/mAp2s8Rp50e5ahLvqsjR8xsfMrjszbf4MOJ5a6smlaE6ZojG
 SpDG+I7kuOYnwK6+jP6nhnmsSh5ilf9hAN6s3E1Kg1CzVQZZnLt3oiKbJuzcqA9uEWMw
 +hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+1cCgzdNERUA2fldYa5OSx6THJ2HPT3UIVGVPz585YA=;
 b=LtOUyLueSd1cBjMKRl8HJ8OCuBN9zffM3F8GuALYIrKrs6KPwmLmt14hlViP0Yyb7V
 zxZzoEDaTVRjLlDS4TGzIW64nKs4RmniJrLlXAx+LHhH9nsPDZbIsJzyoiQJawFjTY/j
 1AmFhd35p5EdV93+Tom6CnpsYXnT+zunj2AlCwpgx5/vNtLN5HGH2aKT5zIK0klC+g4c
 MKASuGbn4aPA+GJluqkDMhBW2ccxFRxoipE8iK7u6EOjBVFwGP2k2q59tPStDNR6cno2
 +lqkgWAQ86DLXD/TdeDn1pbf9HfoRAW0LXriJzJrU+xsxPrK6aWkBrod8HGreWYEp0US
 zY6A==
X-Gm-Message-State: AOAM533cPZK+zMT8HmsY1if8V6QwhncL4iEMlT+P7iJ1rtSkRio1EO0n
 f1ah3EL8s5xRS0eovLi5zU/IisUzAh+3uw==
X-Google-Smtp-Source: ABdhPJzn2tYBjTKXrP8LVS7dGBjeHdZeYqXJ7K2/7c4V4BFGEGVwpRuJw7u4+RYyLuYwUEEMM4XdtA==
X-Received: by 2002:adf:e291:: with SMTP id v17mr660239wri.149.1621454995510; 
 Wed, 19 May 2021 13:09:55 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id h14sm7682484wmb.1.2021.05.19.13.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:09:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/arm/Kconfig: Add missing dependency ZYNQ ->
 USB_CHIPIDEA
Date: Wed, 19 May 2021 22:09:41 +0200
Message-Id: <20210519200942.2223292-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519200942.2223292-1-f4bug@amsat.org>
References: <20210519200942.2223292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using a binary built using --without-default-devices we get:

  $ qemu-system-arm -M xilinx-zynq-a9
  **
  ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)
  Bail out! ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)

Looking at the stack trace:

(gdb) bt
  #3  0x00007ffff6e229ff in g_assertion_message_expr () at /lib64/libglib-2.0.so.0
  #4  0x00005555558d3f01 in object_new_with_type (type=<optimized out>) at qom/object.c:714
  #5  0x00005555558d3f59 in object_new (typename=typename@entry=0x555555ad4545 "usb-chipidea") at qom/object.c:747
  #6  0x00005555558cd526 in qdev_new (name=name@entry=0x555555ad4545 "usb-chipidea") at hw/core/qdev.c:153
  #7  0x0000555555739fc6 in sysbus_create_varargs (name=name@entry=0x555555ad4545 "usb-chipidea", addr=addr@entry=3758104576) at hw/core/sysbus.c:234
  #8  0x0000555555796b57 in sysbus_create_simple (irq=<optimized out>, addr=3758104576, name=0x555555ad4545 "usb-chipidea") at include/hw/sysbus.h:104
  #9  zynq_init (machine=0x555555de07a0) at hw/arm/xilinx_zynq.c:254
  #10 0x000055555573707c in machine_run_board_init (machine=machine@entry=0x555555de07a0) at hw/core/machine.c:1238

When replacing the xlnx,ps7-usb device by the IDEA one in commit
616ec12d0fc ("hw/arm/xilinx_zynq: Fix USB port instantiation") we
forgot to add the Kconfig dependency on the new device. Do it now.

Fixes: 616ec12d0fc ("hw/arm/xilinx_zynq: Fix USB port instantiation")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 585de92f00a..838737656f7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -292,6 +292,7 @@ config ZYNQ
     select XILINX_SPI
     select XILINX_SPIPS
     select ZYNQ_DEVCFG
+    select USB_CHIPIDEA
 
 config ARM_V7M
     bool
-- 
2.26.3


