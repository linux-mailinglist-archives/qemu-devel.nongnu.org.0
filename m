Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F475ADE8C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 06:36:19 +0200 (CEST)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVQJo-0000k8-Oy
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 00:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ98-0007UI-Fb
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 00:25:10 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ96-00073Z-RY
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 00:25:10 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so4478756pjm.1
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 21:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=K9wefkWGERlorpQlskTuOFMvFh9QknFkKJmCeKsqGFs=;
 b=HTLujvj53ViJ3NOAzY9LZKAptUnvqErsi9Tg9fpG/Sf8I7Oe3Paf365q4iZmno2acR
 xEqG4ba3lI/oneW3OvbTj7EOSpWOgz1iS7T7GGl/wc+cClH6gy4rOVgVVMUhT3Dssrp1
 w8XMfCxsDwtDsdHoy5v2qKWn3sbltaSQkJvN8Q/zm0KXBjlckpjGYaNvgxffBwZjHHCD
 PBEsAXaqJuABCQQGAbGr/f3bFV/0ZdPaJ9iMEf+aSTjm3fsLJcBV/4n6n3QrFZ/2IOdM
 E7J/CPJaPx6d7LGhmTuPOn3MGw3uhtJ0+MlThgYoMHy3scdhWPsGdITAmFntkg6nl1qN
 uiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=K9wefkWGERlorpQlskTuOFMvFh9QknFkKJmCeKsqGFs=;
 b=IJg+5UyDSg5zcEU6Pd5eJtaNP1/psVSJqYMkw262ye0k1BLskC8ypQoye2lawZtuq9
 GU7qw76BTlxntQhNLTbhOJajtjYlzPDHRP/f28/LDMYuVmxICcTMaCjRvHdJ+INaxSIf
 +xYCqgPPkjlPNKYPmagDU9nZxKPLIsPuV8nxSGqYVjhTEVxN2ysSwJ2cyjgrFldgtr30
 OpwgHBke/VPMPbK1NMnK1WBPticabMkSDWpvqNZl/o2uVYi1ygNaXBSP+ZhtYvsktTLx
 4EhJW4RHr2f1utafBpRMPS8Hz80k2+rXkQuRLRspYz+n0nkAe3gHWZw6chve0imwV41o
 SbgQ==
X-Gm-Message-State: ACgBeo3HZ1mss6xrjiaGdc5dRxHg/M0nK5MaGdyZwx4DuWSzR1HPZreH
 1dPAjZ6H8WLyMj8IwNc8PtVUww==
X-Google-Smtp-Source: AA6agR4pIxkoTStNse70DJsozeEqFrbBNNK782iKzYZ06Nma6QVQRFYTWypKBJpS/RQDgoQtBwYKrA==
X-Received: by 2002:a17:902:edd5:b0:174:a6e6:51f4 with SMTP id
 q21-20020a170902edd500b00174a6e651f4mr42534339plk.82.1662438307603; 
 Mon, 05 Sep 2022 21:25:07 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 g10-20020aa796aa000000b00537f029c94bsm8724967pfk.183.2022.09.05.21.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 21:25:07 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V3 2/3] hw/riscv: virt: Move create_fw_cfg() prior to loading
 kernel
Date: Tue,  6 Sep 2022 09:54:50 +0530
Message-Id: <20220906042451.379611-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906042451.379611-1-sunilvl@ventanamicro.com>
References: <20220906042451.379611-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To enable both -kernel and -pflash options, the fw_cfg needs to be
created prior to loading the kernel.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ff8c0df5cd..b6bbf03f61 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1251,6 +1251,13 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                     RISCV64_BIOS_BIN, start_addr, NULL);
     }
 
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg = create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
@@ -1284,13 +1291,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
-    /*
-     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
-     * tree cannot be altered and we get FDT_ERR_NOSPACE.
-     */
-    s->fw_cfg = create_fw_cfg(machine);
-    rom_set_fw(s->fw_cfg);
-
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, machine->fdt);
-- 
2.25.1


