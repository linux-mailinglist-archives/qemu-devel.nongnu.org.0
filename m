Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1136EA2D7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 06:35:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppiTN-0001vx-Oc; Fri, 21 Apr 2023 00:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ppiTL-0001ub-FZ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:34:11 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ppiTJ-0000wF-Mi
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:34:11 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6a5fe1ebc42so705952a34.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 21:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682051647; x=1684643647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RwSCQfIoxwZHV5yRukQLqqjnVzmwC3pnEmDxrlERD7o=;
 b=TRKoRmI4RG3NQn3kyXcRn6uwE1bnFdnEOwgyaGXqxFUejGsdJcVLK2ubl+PZ1asv67
 wCgh12Jj7wsZ0X7jLiVZdcySpvOf6npzDZxykm/YbEIaR29eJx9VR/ocLyYO4N8PuUwh
 mclix8bia33IvpjhIxz64X4qMW7Nuu7C6xLXMeJQGJciC8kG1oxemVPJ2ZhEwzXZruuh
 oJY/1FNDvk92Q+lzL9sirw8o9Haxjb+MbjhdvSnYYElh66RkMJIezWMh8PGzc+0GTg1a
 F6OnxtkPqr0ioJ3lqYDAujFXy7UQWjP2xV3NJQobHHsVXq+g0TbPK5XiMmiBCc3bzhCU
 4vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682051647; x=1684643647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RwSCQfIoxwZHV5yRukQLqqjnVzmwC3pnEmDxrlERD7o=;
 b=SerBJdfRJ/oEsvkF21qGS6iLb/mg6adIWQ09jKyvlgM/7kcOnMze4+3C82HL8Y/2JW
 aGgIIEXSu53d/EPTAC9CBRqxXOMMtfURFRtsVJUekYmfiy7SJi4v1zgwZp5ZKSZ/lf7t
 vzay2hyAcNoCC+NVkWcW+uE4fit4pK9xiNLzxoSI086Z9iSRW9geTmeWE0q8Ado0snv9
 yjosCu4Iexmr6XRJXJtjtkRKRqTSnS5LMMV+Zf8jovMtLOONk48BLpqf8Dh7upId035Q
 FQja/1zCzosnPzdzdaeTO/gKtosXNECS22pgA8+n5lwrWnCw/DVhlp++fcJWZypMsPx7
 eFUA==
X-Gm-Message-State: AAQBX9dyti0IlAFZppWE1dXe56vzXhrYBaaC13fOVXaeT7Vx+BxC1oKF
 BHqtWF0AiR7bvKi99hfBm9wZFA==
X-Google-Smtp-Source: AKy350ZmFUxwU7H6cC9QMYBHHT40ej7WzKzdbvLLin9M1hORKepx2qP0NIsGhdMUY+OrKCsFwFXs7w==
X-Received: by 2002:a05:6808:2907:b0:386:f86c:53ee with SMTP id
 ev7-20020a056808290700b00386f86c53eemr2014701oib.1.1682051647517; 
 Thu, 20 Apr 2023 21:34:07 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.184.50])
 by smtp.gmail.com with ESMTPSA id
 w83-20020aca6256000000b003874e6dfeefsm1302905oib.37.2023.04.20.21.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 21:34:07 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH] hw/riscv: virt: Enable booting M-mode or S-mode FW from
 pflash0
Date: Fri, 21 Apr 2023 10:03:53 +0530
Message-Id: <20230421043353.125701-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-ot1-x330.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently, virt machine supports two pflash instances each with
32MB size. However, the first pflash is always assumed to
contain M-mode firmware and reset vector is set to this if
enabled. Hence, for S-mode payloads like EDK2, only one pflash
instance is available for use. This means both code and NV variables
of EDK2 will need to use the same pflash.

The OS distros keep the EDK2 FW code as readonly. When non-volatile
variables also need to share the same pflash, it is not possible
to keep it as readonly since variables need write access.

To resolve this issue, the code and NV variables need to be separated.
But in that case we need an extra flash. Hence, modify the convention
such that pflash0 will contain the M-mode FW only when "-bios none"
option is used. Otherwise, pflash0 will contain the S-mode payload FW.
This enables both pflash instances available for EDK2 use.

Example usage:
1) pflash0 containing M-mode FW
qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
or
qemu-system-riscv64 -bios none \
-drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt

2) pflash0 containing S-mode payload like EDK2
qemu-system-riscv64 -pflash <smode_fw_code> -pflash <smode_vars> -machine  virt
or
qemu-system-riscv64 -bios <opensbi_fw> \
-pflash <smode_fw_code> \
-pflash <smode_vars> \
-machine  virt
or
qemu-system-riscv64 -bios <opensbi_fw> \
-drive file=<smode_fw_code>,if=pflash,format=raw,unit=0,readonly=on \
-drive file=<smode_fw_vars>,if=pflash,format=raw,unit=1 \
-machine virt

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 hw/riscv/virt.c | 51 ++++++++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..1187a60d6e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1245,7 +1245,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
     target_ulong firmware_end_addr, kernel_start_addr;
     const char *firmware_name = riscv_default_firmware_name(&s->soc[0]);
     uint32_t fdt_load_addr;
-    uint64_t kernel_entry;
+    uint64_t kernel_entry = 0;
 
     /*
      * Only direct boot kernel is currently supported for KVM VM,
@@ -1266,42 +1266,29 @@ static void virt_machine_done(Notifier *notifier, void *data)
     firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
                                                      start_addr, NULL);
 
-    if (drive_get(IF_PFLASH, 0, 1)) {
-        /*
-         * S-mode FW like EDK2 will be kept in second plash (unit 1).
-         * When both kernel, initrd and pflash options are provided in the
-         * command line, the kernel and initrd will be copied to the fw_cfg
-         * table and opensbi will jump to the flash address which is the
-         * entry point of S-mode FW. It is the job of the S-mode FW to load
-         * the kernel and initrd using fw_cfg table.
-         *
-         * If only pflash is given but not -kernel, then it is the job of
-         * of the S-mode firmware to locate and load the kernel.
-         * In either case, the next_addr for opensbi will be the flash address.
-         */
-        riscv_setup_firmware_boot(machine);
-        kernel_entry = virt_memmap[VIRT_FLASH].base +
-                       virt_memmap[VIRT_FLASH].size / 2;
-    } else if (machine->kernel_filename) {
+    if (drive_get(IF_PFLASH, 0, 0)) {
+        if (machine->firmware && !strcmp(machine->firmware, "none")) {
+            /*
+             * Pflash was supplied but bios is none, let's overwrite the
+             * address we jump to after reset to the base of the flash.
+             */
+            start_addr = virt_memmap[VIRT_FLASH].base;
+        } else {
+            /*
+             * Pflash was supplied but bios is not none. In this case,
+             * base of the flash would contain S-mode payload.
+             */
+            riscv_setup_firmware_boot(machine);
+            kernel_entry = virt_memmap[VIRT_FLASH].base;
+        }
+    }
+
+    if (machine->kernel_filename && !kernel_entry) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc[0],
                                          kernel_start_addr, true, NULL);
-    } else {
-       /*
-        * If dynamic firmware is used, it doesn't know where is the next mode
-        * if kernel argument is not set.
-        */
-        kernel_entry = 0;
-    }
-
-    if (drive_get(IF_PFLASH, 0, 0)) {
-        /*
-         * Pflash was supplied, let's overwrite the address we jump to after
-         * reset to the base of the flash.
-         */
-        start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
     fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
-- 
2.34.1


