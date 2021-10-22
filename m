Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B77F43786F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:53:11 +0200 (CEST)
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mduys-00082V-6v
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunL-00030h-Lr
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:15 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:33650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunD-0001kp-VS
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910067; x=1666446067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1XoLP9T0j3NMHmF4QLtlFon7IH733bYp6g2ve9HWsLM=;
 b=Brp6KA1AdyVdiLe7Q4FzM39dP1djjRfKZ2mnXfADvl84FvsprFoFV93g
 sX/eT+0vEY+xN4K656fKGEMboCyw2Lwy809tzc2Y9sWGLsQZOdaTTQiNX
 PiFIKkYeqePrF5MtMtOv1G2DgG5SQNtvBDnAFvHRd0Ke7blzerrGDhpDy
 aXV6RW3o+86oyR8p+tijpYLd3VJcTeeTeQLkQviHxtiR6xeG04w2SEqQe
 j3K0zZqvL7rvz7iZmh7rSiXV6MBIObCy9Eb8FqRBpLm0tppgO/2D9dd4S
 P8wrs1KlcqrSUbBfhy+hSXyJj1IZKX+/No8HBaTt0zojWqw3y5Tlc0Oh+ Q==;
X-IronPort-AV: E=Sophos;i="5.87,173,1631548800"; d="scan'208";a="295351019"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:41:06 +0800
IronPort-SDR: qpJHzDsSXiiZrp2gg02E8nDo9GJIqMODIogLcc2z+pynQ/AuSI0V6NTrBfIXXe0UPpu9j+zr4z
 TG/6dcjbyx6mhczF24lywKAEnpZh41pcMXYqIbuxy1YhW3iHpbmQFg0/paBSB+no/Pd66rL9eX
 nk05goUA0+b9qv59W+t2R/Z4bn7d3m40vGMz7bToTW6aryYHK706O3scJHDt8GSe4qIOvv4TWO
 uubuVCXnpwR53K5robXOVV9lWJ+B4OhaPrYe01Lm+VAyc2uP5ejhhazCClGS+OTOFT5MITNwWp
 Fw99ZIXgE/vjIZic8Zp0VzpD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:16:41 -0700
IronPort-SDR: KB9fw5OM8pDKSthlm33oajlJhzXvxuZ+DAVFZWWabsThGfwnaLyjjElytZP7IL+srzWvDFtL1g
 0jqw2rALIx3V7VugEeGewqnmfhwzGeJqlWN8vncQkrLkp6Ky29+HeHbWk6u+Gd7XpbMLSIDHgN
 L2Pc28IQj8xAEZtRySGlw4ni+HjUq7QIGtIgkRUjsBwILy6hk241RgdmcMfMeEpVXdgNaOZzIS
 QE74VUJtvl6lcLiQnK7vV9FWuoZf+fgnQgTwtYfpWERxWvvxUqVVPsOlqshHKDaLADez0t7b/N
 NBA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:41:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQVB0hMxz1RtVv
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:41:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1634910065; x=1637502066; bh=1XoLP9T
 0j3NMHmF4QLtlFon7IH733bYp6g2ve9HWsLM=; b=Uk04V4Nfd9wHvBsxQnHpDW9
 ZNddN+0QqsIpylDWGnavLAajthxknYRgr/NRxlCC2wHfTnHZ4EHmOxWcW7D6jhL5
 j/GHrfuC7W4N2xPbpnXOjaa19lOXydCd1qqK4MRidYZRE2LUALlnroOHnSoxEdJy
 u1zoke51BUzqGE5f+5uUyqDzXwWFBMAFjmzT4rOyCwEMjuQgjPA8LqUAl6qlm7mP
 JqLUJTEzHV3Ud6FVDOoq6nEM5oLXZUauA9v6kOfWo5S2Pt6axpO66w1hJQBXVtVJ
 m7RT+6ABgT254JthZ901ARYZkvwqUmrTmvUC0Vo/1wdolneK0A0ALIMX5otxxSg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CeCUGwkugSk5 for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:41:05 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQV46QkSz1RtVl;
 Fri, 22 Oct 2021 06:41:00 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 29/33] hw/riscv: opentitan: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Fri, 22 Oct 2021 23:38:08 +1000
Message-Id: <20211022133812.3972903-30-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Message-id: 20211020014112.7336-3-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 601f8deebe..83e1511f28 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -19,6 +19,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "hw/riscv/opentitan.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
@@ -64,20 +65,25 @@ static const MemMapEntry ibex_memmap[] =3D {
=20
 static void opentitan_board_init(MachineState *machine)
 {
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     const MemMapEntry *memmap =3D ibex_memmap;
     OpenTitanState *s =3D g_new0(OpenTitanState, 1);
     MemoryRegion *sys_mem =3D get_system_memory();
-    MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
+
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
=20
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
                             TYPE_RISCV_IBEX_SOC);
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
=20
-    memory_region_init_ram(main_mem, NULL, "riscv.lowrisc.ibex.ram",
-        memmap[IBEX_DEV_RAM].size, &error_fatal);
     memory_region_add_subregion(sys_mem,
-        memmap[IBEX_DEV_RAM].base, main_mem);
+        memmap[IBEX_DEV_RAM].base, machine->ram);
=20
     if (machine->firmware) {
         riscv_load_firmware(machine->firmware, memmap[IBEX_DEV_RAM].base=
, NULL);
@@ -95,6 +101,8 @@ static void opentitan_machine_init(MachineClass *mc)
     mc->init =3D opentitan_board_init;
     mc->max_cpus =3D 1;
     mc->default_cpu_type =3D TYPE_RISCV_CPU_IBEX;
+    mc->default_ram_id =3D "riscv.lowrisc.ibex.ram";
+    mc->default_ram_size =3D ibex_memmap[IBEX_DEV_RAM].size;
 }
=20
 DEFINE_MACHINE("opentitan", opentitan_machine_init)
--=20
2.31.1


