Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2979E674E3D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:41:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0V-00081i-An; Fri, 20 Jan 2023 02:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0S-0007yh-Pb
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:12 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0Q-0004pk-Rx
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200410; x=1705736410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EKhIL3sB0YjS2Y3opUv91e1iD5x/vPCaXL4hCE6m1ms=;
 b=n2Y0e/CnFhC+/OpNTdrucEqYtdF3//doRNZ57RyZyusS7E5MYVsBFdHC
 e19IzDujkJQ03224qNuqKw8POrM4xlhKdqE3Vsru2B4M+S74hgYpvze3o
 l69vryYVej+m9CuauhUkJXL74FJKoWFrJJYli6NgArfCG+vUD1NYV3h48
 9rD8A87Ja1ZIJKjfWXF+Ef7T5x1YRwJCmjIKF8LJMxDgxTdkuRj6wYH0g
 Pj4guHCYmod2dOYVewFHIMtjjPtttf/8gj/OIGVBIj1v/eMXr33SLHhqi
 ssur773EortXZXQpWLeeZwm+QSQTECZOPoHHP1dvbQ+43dWG09iDTxI/7 Q==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176709"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:53 +0800
IronPort-SDR: 7q5KJdekQRl+iQPU3/IGl70yP7pijLzbPRpzK+WZYG+cR6IGZvvPXHqkvwOE7fc8fqBrt7/2om
 anpEcYCPT2f4ZdJXDAqFrfc5a//kpCMPHQBcSvC+aAEWyKc+sXWPkaVL3IhTHCF4/OS6w2sOb3
 5xyVHvrS/6/KMx+1qOxPrGL/D7QlOFEZmAqbLtWAyAzlymD1pYzZjpa2IWMlExludVlt67W9KX
 8Igc1CZAIcFTsYo05yoZ+z/Ph0HyE7CoM66KHzBHuVr0mOAJHj3GGZTs/Yrlo0VF9Y9vIoQRl1
 FSw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:31 -0800
IronPort-SDR: GBd6zQGGSiWvakYhRnLkyMbZl6O7cGJrJ0ziOIOx9+AI3t7ajBh2fbcU8ZN1uYdwVWmdGqbyRy
 50YANw8yRXJhBikHAlSSYU/qvTxnRJxpudLVfusmrKabxdleglOkvuLCj16pXQkIzAo6sM4Z3Z
 Quh30bE6tmWaxdH5RYghiW6zbXzrU5yvhIP9m0mcVNxBKbuGD67GjHVHZidnlnW80V0h5HvNsO
 neBKgA18UoL9i3Ny3nzicUjUug8joR/3Iri/WmELnFAIt2b1X2AxrAs2R5cQrjmrLuhabVaP7A
 euE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyrxN688Lz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:52 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200392; x=1676792393; bh=EKhIL3s
 B0YjS2Y3opUv91e1iD5x/vPCaXL4hCE6m1ms=; b=ccOexEEdSeWu6AkfaNnW3pb
 mZMUzzvkC0y/LvebgWIIqkMQH2oBY4AASCdKX8u7DP2F1kfEXIne9wWh2abrVY7n
 VkOe8WzJLX7pz8J4z8mnCbSPsjQTyR/xhmmX1FYdV6144H92mrxi5UWrfqM15LYE
 tiAYO5/7XKHg93V6GnVaHy7iKsmQ8sayG03b3h/dl3sjP1A6COJ8x8vPdfiZ94GL
 c2JaiiPy2G/FeUr8zFKzTrLsr5nqN3ZuOvKV8ixyP/6+7eeCoFcP1m9MrneMTUEq
 0OE0qA4FOzHEcW8ikvlsKyMHgwHndf1SB6QDIdgQsmcA7oewFasW75V/Mjo5KvQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id OShwcz4YQRxu for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:52 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NyrxL56BBz1RvLy;
 Thu, 19 Jan 2023 23:39:50 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PULL 15/37] hw/riscv/spike: use 'fdt' from MachineState
Date: Fri, 20 Jan 2023 17:38:51 +1000
Message-Id: <20230120073913.1028407-16-alistair.francis@opensource.wdc.com>
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

The MachineState object provides a 'fdt' pointer that is already being
used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
command.

Remove the 'fdt' pointer from SpikeState and use MachineState::fdt
instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-Id: <20230102115241.25733-3-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/spike.h |  2 --
 hw/riscv/spike.c         | 12 +++++-------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index 73bf2a9aad..0c2a223763 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -37,8 +37,6 @@ struct SpikeState {
=20
     /*< public >*/
     RISCVHartArrayState soc[SPIKE_SOCKETS_MAX];
-    void *fdt;
-    int fdt_size;
 };
=20
 enum {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1679c325d5..25c5420ee6 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -53,6 +53,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
                        bool is_32_bit, bool htif_custom_base)
 {
     void *fdt;
+    int fdt_size;
     uint64_t addr, size;
     unsigned long clint_addr;
     int cpu, socket;
@@ -65,7 +66,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
         "sifive,clint0", "riscv,clint0"
     };
=20
-    fdt =3D s->fdt =3D create_device_tree(&s->fdt_size);
+    fdt =3D mc->fdt =3D create_device_tree(&fdt_size);
     if (!fdt) {
         error_report("create_device_tree() failed");
         exit(1);
@@ -327,18 +328,15 @@ static void spike_board_init(MachineState *machine)
         hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
                                        machine->ram_size, kernel_entry,
                                        &start);
-        qemu_fdt_setprop_cell(s->fdt, "/chosen",
+        qemu_fdt_setprop_cell(machine->fdt, "/chosen",
                               "linux,initrd-start", start);
-        qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+        qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end=
",
                               end);
     }
=20
     /* Compute the fdt load address in dram */
     fdt_load_addr =3D riscv_load_fdt(memmap[SPIKE_DRAM].base,
-                                   machine->ram_size, s->fdt);
-
-    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
-    machine->fdt =3D s->fdt;
+                                   machine->ram_size, machine->fdt);
=20
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].ba=
se,
--=20
2.39.0


