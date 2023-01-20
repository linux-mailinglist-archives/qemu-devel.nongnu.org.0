Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9172674E92
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:46:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0h-0000Iy-8u; Fri, 20 Jan 2023 02:40:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0e-0000EC-Qo
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:24 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0d-0004pk-2c
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200423; x=1705736423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3r3qd9gKr5XuyreyqrQ3c1TdaeXE99+XWhmc9m9PM2k=;
 b=p+uLUvixkOVxQvLNJyPTuFSSyeA1rK3bce3aeYDBmPkvS5rHmyoGhsQZ
 nU607Z4ti9+p/H6puBWlPr+IgRFuCSmpedeY6iWFk9/JjDWN3NM0Ne7oH
 pnvm5Oc9yAF7HNcKCVvKI4ugkyFvveVNOLrE37fesZxgxxEef+qAhQgbO
 oNjvzsapTOneM9cXbo3P9QEWQPSLMXTcMXUmEISFgSfiOXQ9HdJj/4qbA
 JYHUw6ANbhDw91Eem17XyzUYhF4hF6p+4dRa6ZeEf2hYIYHRf30HnPLL2
 NUoKcpxVevLV+rNh3MssBvSCfMO1xniH8lUtHrYMoOnRJETk26SxqQnT9 A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176723"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:59 +0800
IronPort-SDR: j4Rn+pXNABtmXa9IszXBJYOuGRR6M1JmRHMXaPhiHBhOBUmFTDXzMlOcrROW0BEDlrKZdsy9Dd
 pg5PCTQSDS31qPZQmDIk9Bgb+l1zH/UOEQpekJcZiWFCA0s/miz5aBZF7BMUEd8PRK5YlM4nkv
 Pd8EkFFbMuwkXTL1bcdmJGbLDlWe9SSdw/We0ULtrGVfo1ZKT0uMt0Q9O1qaKkW7yUN64CFAVf
 4pJqUXb4G1Kkc3jNe7WfJpgHnuVBy65XIDVWlvhu4KG3wzkFblGF0UzHpTdS54yvUC23ccZfkg
 mj0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:37 -0800
IronPort-SDR: Se6FfcQGWKuALdpxFqm2QOtgmh3G7Oy1U2S8AyrP1LMM02XqvepxwmPKFe+zJtUKdUMlyJlTfZ
 R3K9+3QbL32m5OU9Ag9F+By2h5AxaxBI6fERIZHK3tvB32r49WUUdK6q+bNR1fNOMgd540445l
 xvDa6lkiylsT5YPk681bKpLoWqCGB58W8oHfWY8JPbr7Y2lGLJkCvD5ubNiKx6i9YH1TO/FO2c
 0KgelqURku3d9BChq6Z59WaqEGGNv1LECWJbhMl0hW4zHhBQXLGHR/HRMI1QCYUke7SZNV0Itn
 0Tw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:59 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyrxW0zl4z1RwqL
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200398; x=1676792399; bh=3r3qd9g
 Kr5XuyreyqrQ3c1TdaeXE99+XWhmc9m9PM2k=; b=tF2qoDQysE1A79JturiGXmU
 aC399igVpR6TCD8ADA5t5tbgTW8mvpbrnilgEPL/JwA+jbMQm5tpGFYxv2Ao7BMv
 005ZN9ZHN5snVxstZk0DR3yERU4VYv8NuEcdQOaulHtKD+ZTLgpotEdo74wcUQI7
 5zx9aiic+vPtomqxIg6YZ+P3Wni9nCb+g0P15v//8Kukjb/GbPDQA+eeciCWbdmV
 MU/Fb9yxsNHcS6buYpkYhIGJeL/g/UgbYB4UnTxtkxr0nArfkoYdA0rLCnphIx9Z
 /gwJRcqUCqCg2ZcNd+E5KEAMdi//lvj8dtBXVwOLMigr/nQu+SfTYquxc0FXTsw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3UL9RZko1U4V for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:58 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NyrxS6v8qz1RvTp;
 Thu, 19 Jan 2023 23:39:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PULL 18/37] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
Date: Fri, 20 Jan 2023 17:38:54 +1000
Message-Id: <20230120073913.1028407-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

This will make the code more in line with what the other boards are
doing. We'll also avoid an extra check to machine->kernel_filename since
we already checked that before executing riscv_load_kernel().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-Id: <20230102115241.25733-6-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 25c5420ee6..004dfb2d5b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -302,6 +302,10 @@ static void spike_board_init(MachineState *machine)
         g_free(firmware_name);
     }
=20
+    /* Create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]), htif_custom_base);
+
     /* Load kernel */
     if (machine->kernel_filename) {
         kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
@@ -310,6 +314,17 @@ static void spike_board_init(MachineState *machine)
         kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
                                          kernel_start_addr,
                                          htif_symbol_callback);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_ent=
ry,
+                                           &start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd=
-end",
+                                  end);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next=
 mode
@@ -318,22 +333,6 @@ static void spike_board_init(MachineState *machine)
         kernel_entry =3D 0;
     }
=20
-    /* Create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]), htif_custom_base);
-
-    /* Load initrd */
-    if (machine->kernel_filename && machine->initrd_filename) {
-        hwaddr start;
-        hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
-                                       machine->ram_size, kernel_entry,
-                                       &start);
-        qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                              "linux,initrd-start", start);
-        qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end=
",
-                              end);
-    }
-
     /* Compute the fdt load address in dram */
     fdt_load_addr =3D riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, machine->fdt);
--=20
2.39.0


