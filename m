Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD345AD90F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:34:13 +0200 (CEST)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVGvD-0004V9-IA
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVGko-0002I6-F5
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 14:23:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVGkf-00027m-K2
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 14:23:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so3586621pjm.1
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=K9wefkWGERlorpQlskTuOFMvFh9QknFkKJmCeKsqGFs=;
 b=OOFTByAdtVlyQA5+j3potRq1HWmA+aWLFfQOrO9L3HDGVXRdmsrVhrdt4Ws58QiIma
 1cSaqwQQdFaG42Sie6jpQwAecW3x9v09gW6Gpi02doSou3w8S/nrjUQ+aocvaL/q9XuE
 HccPeV2yYExmUJBl9Cj7uly7NzxcdAZHuinaYg+GmxJXFuEJ/hB7Nn9lPhrhmho/p6Nm
 WWo/dGdyavoiPV1ZToeh1eQRqxHMq8Ym1j4kJy4svoTUd/nmKBrYUVDx5jNs9EA9OqMN
 9JlFKn1vIlZF+H5NRZ7zMtqvzAAvKKUZudIiifrahffeiXTrxiwQzKl9HLvRztBhEAX5
 DnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=K9wefkWGERlorpQlskTuOFMvFh9QknFkKJmCeKsqGFs=;
 b=ig4JUnBEt222Ru3G9khiaXLD+AQ2kHTApHdR5uCtm4Tg32c+UjsFQSmfM5gu2d/48S
 bEYoEUCklyw0s3XQJE2kqTgaHpQStRSOe5UpxBOop9Z6x7HfuJ7b9Y4q8zB+VRxq3Nrg
 ekOYx8ZAyZ4/Uk/xqCJbRAcE0HPSSbPbCm8POaZXpQgOf7Qv3Ih5VJnshDpU3ANEJpYK
 QiVNndl0hUYzQbSs2ipx/UB8JU8CiZLt9HXKdWKEBnOIVbKR6TH2EXXTTrkVEENocSyH
 Wt5ksZbvV7c/7kbwVZDyUZ+uIsbPlS4zSrztb5m2hVqM1xdCble0IlTh6J0IOGbdQmg3
 XQrw==
X-Gm-Message-State: ACgBeo2ysSwV0FWaRIQ/ZPqMHjsI6BCwhia92p/Y1Ql8xuAQFdiWLQhL
 Kj2PPfZkj6o47h6tWyP4a4p4Rg==
X-Google-Smtp-Source: AA6agR7FajmxkKPzEOR0GwHi6znkqbKFVJttC0RTBPjoEiYm/q3ccKcF8K0/LkEthRQNKdxss0ussQ==
X-Received: by 2002:a17:902:710e:b0:170:8d34:9447 with SMTP id
 a14-20020a170902710e00b001708d349447mr50248196pll.126.1662402196308; 
 Mon, 05 Sep 2022 11:23:16 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa79587000000b005321340753fsm8046724pfj.103.2022.09.05.11.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 11:23:16 -0700 (PDT)
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
Subject: [PATCH V2 2/3] hw/riscv: virt: Move create_fw_cfg() prior to loading
 kernel
Date: Mon,  5 Sep 2022 23:52:37 +0530
Message-Id: <20220905182238.374545-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905182238.374545-1-sunilvl@ventanamicro.com>
References: <20220905182238.374545-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1029.google.com
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


