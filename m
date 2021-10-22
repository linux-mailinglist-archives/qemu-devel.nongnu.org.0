Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4424378AB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:04:47 +0200 (CEST)
Received: from localhost ([::1]:53530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvA6-0002Ec-F9
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunR-0003K4-51
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunO-0001ji-SE
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910078; x=1666446078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q3J/9ZfAtD6dGQ6glAPWxRW9vcBMGsNnHZ+BYS9jqwo=;
 b=WlYSyRfZVF+LvL6ys0/xAnq7j7JNFn7xPZC4z6Bydc5Dr+dspo4Bf9Yp
 J1be5Q/fJ64t3WRLmfQmzTcKvqkMem7nONKzzUkbdNw84t5cVfsjmVn9b
 m6iRer3FV8yVM1oAfI2AcQksnBPA2YB2jxe8/tXUkvjWpqJpCX3AOwXLe
 nB1YETQscdwnm9uc+CdKCJn9sB5VNl6QYx+xz3A1rEljnTqDNUJMqQm0o
 ARLP1RCpq6tCsaLEVlkpyke0uVIDaVdnDbyYCu9AbG8O3BXIoRV9vmcKH
 A3nHy5QkZTMdXzoMD0YvC53zQWzjaBpoyCSsoxzz3xCZ+2BnpDq+Bz+8N A==;
X-IronPort-AV: E=Sophos;i="5.87,173,1631548800"; d="scan'208";a="188392268"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:41:17 +0800
IronPort-SDR: K4H+mYu31Gbzo6rfDM2t7WI442Wuq7pOAFV93pmUbz8C23xgHVHFQz6Zjn8qWtapVrZKTlSZ0E
 LaGWMOwc2jevSh2XXfqowyz+G86D3MgBqKQuz/NCARDJnayysWLCXu+F7WLVx0aWWQZRn/rcAT
 xioI5Z1k9ck5FfrVCuANailzZlgtZWjIDmjS8nAAoDr0niDjDeaRx0cn0Z9Fhp0KayZfZZGof1
 Vxlp9MFWywsuILkN9wW7AA8XmkL70SWTGD8pNskJBVisDtNXnjrJ7WLLBs4gkULg/g/s1BAVIW
 NhJ6PZ/mQI7nOp80yhvWorfC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:16:52 -0700
IronPort-SDR: ResNTv/sf5ZNLhq9+oVhNY76IqNudpaCvVGT3Vfo6oF/vyNmEAy10TJyA2u/gNRJam7JRcTXN+
 0317OgjPTSlBLpzejI6aScKA7jQcO9EK+8q1SsZobNAUegLCO7jDgOBZGdCg2mToN2QR9FNlFo
 5lTnUnD4EHfyxzvfqMAbow+qQjloEG67PPcb51LuANFY9HZitBN+VX+QCCInG/K2ut8JQfv57f
 ay9xx/eeV4ahV0rifvAMdzFMco8R602AC0BZDevRoe7Y/+KdB7pIjXkaT7+BXsA6sD6SxOHxFI
 SJs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:41:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQVP5KVXz1RtVp
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:41:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1634910077; x=1637502078; bh=Q3J/9Zf
 AtD6dGQ6glAPWxRW9vcBMGsNnHZ+BYS9jqwo=; b=sEVIS1Nkp3/9CWBfC6xP6md
 2JtfX2ftpKsIS55olO39awvVQCAj2G8K7zXy0A3GjYNSDxPTueeHdq2H7U06itvB
 ZrHbkiW7GDo3evkXrHlkrhIfcX4DQ5eIKMHoEGmKv8mc+xLmAqeeE2FekaIO3QPt
 Zr0Bi3V80k2W7vgZX74GYjbjBcepwNJSNF05OU9NH/NERPWNyaAtKbqQ4skeDGDm
 482ujtAhMQ9lmoYQPsc8BYnugooqyweHevh7dgsW9cu7+LK6otPDiBzsdM4+awD6
 KGCnre3euU89SJbD0WrQBxNhsoj62rJSPAtGs8iKoMAHeVTFoUYhU/jsow1tqfw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XMvEXIEUDfG1 for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:41:17 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQVJ3Rf7z1RtVl;
 Fri, 22 Oct 2021 06:41:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 31/33] hw/riscv: sifive_e: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Fri, 22 Oct 2021 23:38:10 +1000
Message-Id: <20211022133812.3972903-32-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Bin Meng <bmeng.cn@gmail.com>

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

While at it add check for user supplied RAM size and error out if it
mismatches board expected value.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20211020014112.7336-5-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_e.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 6e95ea5896..9b206407a6 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -29,6 +29,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
@@ -71,22 +72,27 @@ static const MemMapEntry sifive_e_memmap[] =3D {
=20
 static void sifive_e_machine_init(MachineState *machine)
 {
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     const MemMapEntry *memmap =3D sifive_e_memmap;
=20
     SiFiveEState *s =3D RISCV_E_MACHINE(machine);
     MemoryRegion *sys_mem =3D get_system_memory();
-    MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
     int i;
=20
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
+
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_=
E_SOC);
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
=20
     /* Data Tightly Integrated Memory */
-    memory_region_init_ram(main_mem, NULL, "riscv.sifive.e.ram",
-        memmap[SIFIVE_E_DEV_DTIM].size, &error_fatal);
     memory_region_add_subregion(sys_mem,
-        memmap[SIFIVE_E_DEV_DTIM].base, main_mem);
+        memmap[SIFIVE_E_DEV_DTIM].base, machine->ram);
=20
     /* Mask ROM reset vector */
     uint32_t reset_vec[4];
@@ -142,6 +148,8 @@ static void sifive_e_machine_class_init(ObjectClass *=
oc, void *data)
     mc->init =3D sifive_e_machine_init;
     mc->max_cpus =3D 1;
     mc->default_cpu_type =3D SIFIVE_E_CPU;
+    mc->default_ram_id =3D "riscv.sifive.e.ram";
+    mc->default_ram_size =3D sifive_e_memmap[SIFIVE_E_DEV_DTIM].size;
=20
     object_class_property_add_bool(oc, "revb", sifive_e_machine_get_revb=
,
                                    sifive_e_machine_set_revb);
--=20
2.31.1


