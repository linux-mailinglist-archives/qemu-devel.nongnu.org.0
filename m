Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F943190F8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:27:13 +0100 (CET)
Received: from localhost ([::1]:45850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFk9-0001z0-3g
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFdG-0005cH-6z
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:19:58 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFdC-0005EC-OV
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:19:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id l12so4964601wry.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t3OFT8GZLSx2s8PIhoV1MKY+HG2WX+w1muUkEk+uEOc=;
 b=jnYha8oxul2sAT33I9n4HYxvBHkU2m5Ig+7LY2M8FP5oTyPkTxZqkWq0YskaDNTih8
 c+0L5cLBONtsrnosF1zy0IMr8LGqeJz56dDlyhZunnPOwuCmxuIb5yjKfReU4Uuv9Ncj
 9/Tski3heTi6sJHoSBenr9YOau3WJ1IAT81dnpNhPG5Ex7vobdrmjYJCorJQ0djlFslO
 6jsJLRrc+fHLa5wKBjH6Zr76+Q1LZZRJERou7VROlcFMIk13/hzX74p341ufYzF5vnQb
 rfGyqPcaeylmOMId3yH+OGjX1PUviN/O18i6+6NuuCjUIKAPW0rxn6ZQY3WS88DITgHp
 l0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3OFT8GZLSx2s8PIhoV1MKY+HG2WX+w1muUkEk+uEOc=;
 b=BZA8PTO+Brl7puE2aExcahaBBSnGmDjhjYWkLVKJd0OyE2B0t3j3HMGU+ovbF7eMin
 D+Ele1baMTgvmtX/ZULAUUep1cd9Az3f4Q/XaK/9m1VvP5IQLQVsV4hNRc+V6n50/g6a
 Zoa8W2TgFwU5oYPncAyuTMLGg0gF9RytGq9IsuKFRK44IckCBsJG8MnXGoNZM1EW4Fzf
 9RSgRa8yB5z9LGtdWNIBP/V+Vq8HZcAXbnzy33uwG9z+pXK/3GLaTRMBEkcTSjQ2P1nA
 V4V+XUcJeuI1sbi/I+SokCd88GHhKcxJY7jLQRQk771zrZ6yAImtoL5J9nGFZcCDqWZw
 PPkQ==
X-Gm-Message-State: AOAM533JvRTwvtYpPLhJSoKLJOtPKvTfblcOAz7UfkdbOfIcC3ExuPHf
 45Yh4+XoNsjKyI1JJAUKxcLUeQ==
X-Google-Smtp-Source: ABdhPJy4hZBqYwg1DtCBsL0Xs3oZtCMSprNtTXkS5l8GCnYIalW6zmV+LmO6HhXEH1pfTWKXxOsi3A==
X-Received: by 2002:adf:bb54:: with SMTP id x20mr6691695wrg.112.1613063993294; 
 Thu, 11 Feb 2021 09:19:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm9819414wmi.48.2021.02.11.09.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE1E91FF8C;
 Thu, 11 Feb 2021 17:19:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 2/7] hw/riscv: migrate fdt field to generic MachineState
Date: Thu, 11 Feb 2021 17:19:40 +0000
Message-Id: <20210211171945.18313-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211171945.18313-1-alex.bennee@linaro.org>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: julien@xen.org, "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, andre.przywara@arm.com,
 stefano.stabellini@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a mechanical change to make the fdt available through
MachineState.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201021170842.25762-3-alex.bennee@linaro.org>
Message-Id: <20201105175153.30489-3-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/riscv/virt.h |  1 -
 hw/riscv/virt.c         | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 84b7a3848f..632da52018 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -41,7 +41,6 @@ struct RISCVVirtState {
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
 
-    void *fdt;
     int fdt_size;
 };
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2299b3a6be..8d0ba72d78 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -189,14 +189,14 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
     if (mc->dtb) {
-        fdt = s->fdt = load_device_tree(mc->dtb, &s->fdt_size);
+        fdt = mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
         if (!fdt) {
             error_report("load_device_tree() failed");
             exit(1);
         }
         goto update_bootargs;
     } else {
-        fdt = s->fdt = create_device_tree(&s->fdt_size);
+        fdt = mc->fdt = create_device_tree(&s->fdt_size);
         if (!fdt) {
             error_report("create_device_tree() failed");
             exit(1);
@@ -434,12 +434,12 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     g_free(name);
 
     name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
-    qemu_fdt_add_subnode(s->fdt, name);
-    qemu_fdt_setprop_string(s->fdt, name, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
                                  2, flashbase, 2, flashsize,
                                  2, flashbase + flashsize, 2, flashsize);
-    qemu_fdt_setprop_cell(s->fdt, name, "bank-width", 4);
+    qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
     g_free(name);
 
 update_bootargs:
@@ -631,9 +631,9 @@ static void virt_machine_init(MachineState *machine)
             hwaddr end = riscv_load_initrd(machine->initrd_filename,
                                            machine->ram_size, kernel_entry,
                                            &start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
                                   "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
                                   end);
         }
     } else {
@@ -654,12 +654,12 @@ static void virt_machine_init(MachineState *machine)
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, s->fdt);
+                                   machine->ram_size, machine->fdt);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, s->fdt);
+                              fdt_load_addr, machine->fdt);
 
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
-- 
2.20.1


