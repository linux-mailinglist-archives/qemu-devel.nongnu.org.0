Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5A35ADE94
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 06:39:18 +0200 (CEST)
Received: from localhost ([::1]:39158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVQMn-0005zA-Ok
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 00:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ9Q-0007vb-6o
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 00:25:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ9B-00074Y-0K
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 00:25:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f24so10156535plr.1
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 21:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/Hfi1dqn7aBKUskyIzQv2SXHLLV50tRsQ66eiL+Qum8=;
 b=b8wQs6xbUu2WQuAhtQWF3RfAkahCEeTHL+Yczjj37AFturpo6wUjBUnvmR4yf3dtVN
 H0VcO4qdmOsKucQGBu4tV8TVW9hFm/KPUGo9EtvAQ67cLvL5vHgtzRi8L1jIyQK9j1YP
 9xt7A1n57Kau5TqvLUHzHwdQt48zF81/v3LjLx8gd9aSh94/gdusrd9UpNMNn8t8idl/
 VcD5ODsftWagrNT7ILOrA8l0A2wuSNTXbtLe6ZfQf+Tni+VLAmivBPw6VJ/1e9VH2vXT
 IK4vtm2uXQss5RziPLVuzAN2l1QhQKTSm+PbSbTXPd++6QIZMhjHAiDfPO+8Vxqo+YIk
 aV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/Hfi1dqn7aBKUskyIzQv2SXHLLV50tRsQ66eiL+Qum8=;
 b=QV1e8ghHpLfyHIz6Oo56dBcsNnlc8lx2maSb9p3+NpK4bxmJJPSgYMrb9wFz02H3Bl
 dkHabvEhm+kFyhJoN2jKsauTZ5ywYNGhfwjylTkmJyihH1iGewgqdlH3mOO2euxw1skW
 dP3R9SuubxzlWfLpxyztZIADOoH13PfWXxRV1FSM1+inTCiw95mbDss+zH92Z5plko/i
 C5jO3PeRotERYy/5TUdVJ2DCFKfdtcBOE8bI9D1p0NrqUlS3/NEOUC/onQ8g06tFTIAV
 UELogikSO7MurliCu/EHwF3rwCv3u6cAeky53a6VvMgaaHW4i88nvUI0++vll29xKCyC
 b2Vg==
X-Gm-Message-State: ACgBeo0EyVgiJypkWbCUoAqkWjXW481gvKz4hUg8TheOKv/uJddCEXEo
 LXLHPh5/kTnGqKIs34dbRnc5FA==
X-Google-Smtp-Source: AA6agR7LeFpJMNtM6c9XUiw/J7IbjRVlCBe8VY64cYOis9bqpXVB4Axf5LmtfzwzYOzM1CWatp1piQ==
X-Received: by 2002:a17:903:2282:b0:174:f9e1:b08c with SMTP id
 b2-20020a170903228200b00174f9e1b08cmr37203688plh.121.1662438311721; 
 Mon, 05 Sep 2022 21:25:11 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 g10-20020aa796aa000000b00537f029c94bsm8724967pfk.183.2022.09.05.21.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 21:25:11 -0700 (PDT)
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
Subject: [PATCH V3 3/3] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Tue,  6 Sep 2022 09:54:51 +0530
Message-Id: <20220906042451.379611-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906042451.379611-1-sunilvl@ventanamicro.com>
References: <20220906042451.379611-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

To boot S-mode firmware payload like EDK2 from persistent
flash storage, qemu needs to pass the flash address as the
next_addr in fw_dynamic_info to the opensbi.

When both -kernel and -pflash options are provided in command line,
the kernel (and initrd if -initrd) will be copied to fw_cfg table.
The S-mode FW will load the kernel/initrd from fw_cfg table.

If only pflash is given but not -kernel, then it is the job of
of the S-mode firmware to locate and load the kernel.

In either case, update the kernel_entry with the flash address
so that the opensbi can jump to the entry point of the S-mode
firmware.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/boot.c         | 28 ++++++++++++++++++++++++++++
 hw/riscv/virt.c         | 17 ++++++++++++++++-
 include/hw/riscv/boot.h |  1 +
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1ae7596873..39436b8d56 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -338,3 +338,31 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
         riscv_cpu->env.fdt_addr = fdt_addr;
     }
 }
+
+void riscv_setup_firmware_boot(MachineState *machine)
+{
+    if (machine->kernel_filename) {
+        FWCfgState *fw_cfg;
+        fw_cfg = fw_cfg_find();
+
+        assert(fw_cfg);
+        /*
+         * Expose the kernel, the command line, and the initrd in fw_cfg.
+         * We don't process them here at all, it's all left to the
+         * firmware.
+         */
+        load_image_to_fw_cfg(fw_cfg,
+                             FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
+                             machine->kernel_filename,
+                             true);
+        load_image_to_fw_cfg(fw_cfg,
+                             FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
+                             machine->initrd_filename, false);
+        if (machine->kernel_cmdline) {
+            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
+                           strlen(machine->kernel_cmdline) + 1);
+            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
+                              machine->kernel_cmdline);
+        }
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b6bbf03f61..b985df9b16 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1258,7 +1258,22 @@ static void virt_machine_done(Notifier *notifier, void *data)
     s->fw_cfg = create_fw_cfg(machine);
     rom_set_fw(s->fw_cfg);
 
-    if (machine->kernel_filename) {
+    if (drive_get(IF_PFLASH, 0, 1)) {
+        /*
+         * S-mode FW like EDk2 will be kept in second plash (unit 1). When
+         * both -kernel and -pflash options are provided in command line,
+         * the kernel, initrd will be copied to fw_cfg table and opensbi
+         * will jump to flash address which is the entry point of S-mode FW.
+         * It is the job of the S-mode FW to load the kernel/initrd and launch.
+         *
+         * If only pflash is given but not -kernel, then it is the job of
+         * of the S-mode firmware to locate and load the kernel.
+         * In either case, the next_addr for opensbi will be the flash address.
+         */
+        riscv_setup_firmware_boot(machine);
+        kernel_entry = virt_memmap[VIRT_FLASH].base +
+                         virt_memmap[VIRT_FLASH].size / 2;
+    } else if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index a36f7618f5..93e5f8760d 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -57,5 +57,6 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
                                   uint32_t reset_vec_size,
                                   uint64_t kernel_entry);
 void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr);
+void riscv_setup_firmware_boot(MachineState *machine);
 
 #endif /* RISCV_BOOT_H */
-- 
2.25.1


