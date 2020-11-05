Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB02A8578
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 18:58:41 +0100 (CET)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kajWy-0002ye-Lb
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 12:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kajQl-00046U-27
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 12:52:15 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kajQh-0004pG-LF
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 12:52:14 -0500
Received: by mail-wm1-x343.google.com with SMTP id a65so2111162wme.1
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 09:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Nz9MSyQVsT6uTf5IolftpS8uipcBc27d6vn+zZBZfo=;
 b=jJV7REPO8q4WmM1H5lmQh9/AM0xYpocZfjtmflTPhdHgB3yHf/m4EbvsaMwERdNQr5
 2HEAZOrQbvaRGUqOHJE87g9Tw90NVrWfeHZa8PmM4gTqHSQ/nIuWtroFrSmCoFUoCdaB
 yohJm/MTa4NCbM5nBR15YI8/5utt/Zj+og8qY7mdXgYjpV5x+d59xT8nzm3Ghavy01B4
 Eves61Q2M6c6MDOv/5pLHjVNtRlkbsa0ixd7ofY30vdMNMGXb1l7XH8NEmxuoAq8wHk4
 Qme+lTnpnqIkOFTSXd/fRbjl7kYARcHb9JUsGvOUP9ZEzXgN7mIOI7SyNoibzLX/q4+B
 JQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Nz9MSyQVsT6uTf5IolftpS8uipcBc27d6vn+zZBZfo=;
 b=VQ3b7J+MQHEDLOZvNFNMMZvwwEt3tsq8sT/3chN2bVaauOTP4zWFjjo09CVEMu/rDQ
 KFBzJPhG5JQkOQxKcDg85Np+b1E5U5pIP3Mp3XHwMgGDOVAKg5bJf83Z3r/KYF+N5NjQ
 97DSh44PdijTU7tM1JMyyGJHwDUeVGwMR4S7xIWha1/CiuS0yj/fourwd2ByETXXRMqE
 GKx3GZqnYxgKvCfUIjuOrquKh4OODpoeXla3yuzub4LlFkXghRZCf3hbBLaFdXBkfrDf
 dD+RREszP88DKC2vFiQEqvBUX0CZ2f60w1qVTg5YkYQ8gTbmUyDjFkcaG0nAjAAqDKal
 6Bug==
X-Gm-Message-State: AOAM530gNCHvyGFqf30eJK8U83DqTMuQm1/bStup89O+mVrrEYV+GDg8
 1EsGpcxC1aUmC3ke35c15hS3pg==
X-Google-Smtp-Source: ABdhPJxNAznyHZH2z8txC5rGzDF+wYG6dyDEXUtddVc/PLnSS/9cuaXMg7iGYfQAR4ipPU8MhonmtA==
X-Received: by 2002:a05:600c:2110:: with SMTP id
 u16mr3997847wml.4.1604598721029; 
 Thu, 05 Nov 2020 09:52:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o184sm3590398wmo.37.2020.11.05.09.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:51:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E0D441FF8C;
 Thu,  5 Nov 2020 17:51:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/15] hw/riscv: migrate fdt field to generic MachineState
Date: Thu,  5 Nov 2020 17:51:40 +0000
Message-Id: <20201105175153.30489-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201105175153.30489-1-alex.bennee@linaro.org>
References: <20201105175153.30489-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: julien@xen.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 masami.hiramatsu@linaro.org, andre.przywara@arm.com,
 stefano.stabellini@linaro.org, takahiro.akashi@linaro.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, stefano.stabellini@xilinx.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a mechanical change to make the fdt available through
MachineState.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20201021170842.25762-3-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/riscv/virt.h |  1 -
 hw/riscv/virt.c         | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b4ed9a32eb..6505ae8d23 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -41,7 +41,6 @@ struct RISCVVirtState {
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
 
-    void *fdt;
     int fdt_size;
 };
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 25cea7aa67..377400e02a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -197,14 +197,14 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
 
     dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
     if (dtb_filename) {
-        fdt = s->fdt = load_device_tree(dtb_filename, &s->fdt_size);
+        fdt = mc->fdt = load_device_tree(dtb_filename, &s->fdt_size);
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
@@ -442,12 +442,12 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
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
@@ -654,11 +654,11 @@ static void virt_machine_init(MachineState *machine)
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, s->fdt);
+                                   machine->ram_size, machine->fdt);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(start_addr, virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, s->fdt);
+                              fdt_load_addr, machine->fdt);
 
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
-- 
2.20.1


