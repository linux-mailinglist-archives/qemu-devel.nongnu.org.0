Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EB443783C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:43:21 +0200 (CEST)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdupM-0007Y4-9N
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulA-0007gT-Ay
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:00 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:64377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdul8-0000u0-Aj
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909938; x=1666445938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B8fyculkXMWel6zy4Nw9UZR6Llei6JBtt8WxRZ5YIFM=;
 b=mlP4xo5gvzAsPt9mCisUt7WavPGgiE8/Wca6NJksdUWgvCnrRdpmg9oG
 rIyqAw3r2nv1XY07xO76y9M/MVMv0x9XB9ByGKMMjwnIzvv/D6N+hEMTb
 xQ8ZvRDzKzNJ/GoTmaSKFSECgQnLba2VqLsinKzN+1RxbHuC/lPOqSYDc
 i8PhhLzus+WqPXj0IlcUPLYuJCX0Qt87HbESs23/7jis8y+I1oMeaag7w
 IGrzbzA4QsqWMX4G7tpbJnUDPULw8liTSr5RO7rdIj72cyE8pkNRL1zrs
 tU+sRfeyn34gKS2ePV7XRfg8KqSAZtkCFnXshVt9J/FpaomqhrZq6XHT9 w==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="182632566"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:38:56 +0800
IronPort-SDR: BGKX4XH/IWGMvuho5bPHRlUOeUbgidsPFVlkv7Z6XtSGq8DvVLLVjDvzfsUw8ON7eNtXidmuzI
 CSyCDmGtlycntfh8a2SdxpSgxCyUM2DQ0jC92OssA0AIZ1PxphXhe5K+udZ9X67BsYqJZgjBhB
 5bT/0j57rux+N9bYmuxPiZKWBCRCzmTbgjlIqYPaIVMVeUe9alxrzCYRZ02yyZaf2XaK81iZiU
 aZ4J9/je6Aa4SPlfK2iMCnY9u15IEO76Rsk5e6kZASNK4KTSImZFHgbY1rZ0v+RSoFn1Le1DuH
 2cKZ9/r/zicuXYDy7O580rAk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:14:31 -0700
IronPort-SDR: L5TjzZZsWsW5jc6OMWoM8npF+ONVImEXTuoAdYquo2mhBOmQubosmaKUHsE3uZ2rZ+aNTVnXAe
 VfcrAiLewYYWujkYgZPHv/+gQO/rjCQ76u3OagW8OfrdBS8RhNd4sTIQH9sE0htnO13rTZyiBE
 BANwkfOpwcbSD5ZTI6nAWLDD3YoFU1J2gxKYgFISWujhy1GtkGeHriW4XBVc7KtMdu6AKnO9++
 HzZo2Z1xnYnTlvu23oNk+OeOu5Vvuj5N/9/4ykw86qdFX07wzwj8AST+vMZgkqVNwwzgQMHMn8
 MpM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:38:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQRh6DnYz1RtVv
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:38:56 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909936; x=1637501937; bh=B8fyculkXMWel6zy4N
 w9UZR6Llei6JBtt8WxRZ5YIFM=; b=iBvK4AVW7FUZ0HoPkqGRmpzH1AcbJ10265
 EYBtikx3smzZ9EcvaunP7Awg57MF0NgUgA5mvWO667JSrZ/1JvS6bwAhOwFExeTD
 pdI1yTIi0LAgGuKU7JP+gOK1KBOfwJ88aAjrcaz2urljTDBl680Rfv1sY3ojkJuA
 3AwkkDX8/GDMFWUw89CD8zB0Qjmcr6vyYLXNgKPmUJygxY8YWTv5zoOFakDN1YVz
 5mWJmB5lfsaV68y3dTSsqg4SOV4c51nkyLvP+zht2R007FslPGYSL2dEyIii3bsP
 J76pcmtzEdw80HW2JlXYrwvwAGDrTLW5FywZGWkPLPEyoH3LQs7g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id fGNQAl6gepeD for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:38:56 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQRb6xd1z1RtVl;
 Fri, 22 Oct 2021 06:38:51 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Mingwang Li <limingwang@huawei.com>,
 Yifei Jiang <jiangyifei@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 04/33] hw/riscv: virt: Use machine->ram as the system memory
Date: Fri, 22 Oct 2021 23:37:43 +1000
Message-Id: <20211022133812.3972903-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mingwang Li <limingwang@huawei.com>

If default main_mem is used to be registered as the system memory,
other memory cannot be initialized. Therefore, the system memory
should be initialized to the machine->ram, which consists of the
default main_mem and other possible memory required by applications,
such as shared hugepage memory in DPDK.

Also, the mc->defaul_ram_id should be set to the default main_mem,
such as "riscv_virt_board.ram" for the virt machine.

Signed-off-by: Mingwang Li <limingwang@huawei.com>
Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211016030908.40480-1-limingwang@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ec0cb69b8c..b3b431c847 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -771,7 +771,6 @@ static void virt_machine_init(MachineState *machine)
     const MemMapEntry *memmap =3D virt_memmap;
     RISCVVirtState *s =3D RISCV_VIRT_MACHINE(machine);
     MemoryRegion *system_memory =3D get_system_memory();
-    MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     char *plic_hart_config, *soc_name;
     target_ulong start_addr =3D memmap[VIRT_DRAM].base;
@@ -890,10 +889,8 @@ static void virt_machine_init(MachineState *machine)
     }
=20
     /* register system main memory (actual RAM) */
-    memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
-                           machine->ram_size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
-        main_mem);
+        machine->ram);
=20
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
@@ -1032,6 +1029,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
     mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported =3D true;
+    mc->default_ram_id =3D "riscv_virt_board.ram";
=20
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
=20
--=20
2.31.1


