Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809BF46CE25
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:11:16 +0100 (CET)
Received: from localhost ([::1]:45882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mur6g-0002uN-RT
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:11:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqgI-0002RI-EA
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:44:00 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqgE-0006DW-IC
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638945835; x=1670481835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VoW/APYv+/Addxn8Vl3X/2aFIt0i7U7pteAN7/AtERQ=;
 b=C39I6gHL04/1i4CYMlh/wdTQYNOv/JeUhJrpbepj4b8Z6p4Vklnl6ILJ
 hIKdWk/LqZba50aEsGptZFRgMJeIWcvqi7Qz5TcHKSUq+yI8FhJ4qYXiA
 OsCCzXFf1nOx28AO30T2Ie9entC//tS4vdoPuhorzFzERdJLjqmtkcFed
 cr3Fi9OSykmZKSZ0w1Fl4GaU5oOENumC0VErsr8mLvcOqr6dPc2TFDF2P
 uf42zj1aqzS5WxP0obXmSAum9BsXFgJVH1bn0rNA1to0Ks1v77vvWqAwZ
 HW51HqTlS7t6XnQJHBcxCgBKkBVH8W2+SZevQRLXXxEVFf7aQ4tD3raOw A==;
X-IronPort-AV: E=Sophos;i="5.87,296,1631548800"; d="scan'208";a="188732858"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2021 14:43:54 +0800
IronPort-SDR: Rp7ISK194bOkpz/1GPdDEhYTs9e5E7dxvFZtvkL7Z/xXQLJYSNa89i8+g2iSWqIoak7LM2rv0y
 XBmzBqYSXpoBKtHEL2QjicyYFhDf9hv3WrDkGKUoSsiOOHtsN6juV1FupYkoaR3bPm8s6+dHea
 AB8pS4oJFh7GXGMrhlxOARGovWI+MW2LbIE8Lj83KJR+yRcTGyW77RksOcJb0m3mE8gm4/0X8p
 llsCMbuslEvtLDeEYEKVycLh+QEvtpPBP8Wqm3x7nGIlCrK51ebZeevs0yIGDWq6hvhMu/eQTj
 fb6ky2lyAGkAuWsz6m5L72qy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:16:57 -0800
IronPort-SDR: 8FcvJ1Poy8BjH7/IDC5lv9EqmLXHmK8nv0maBU0TFH0IW4NdVJNwImFEYHowqND4r1i6g19Q4b
 Siwa8/ZQhYJq+c3JMiNixB2ceYnZdAUOlzYbx5Ou43ovrtwJVsADdqPEvrm1bl+DqtKCcNC0tY
 1VK2Rt7Kk4Kr1vdo/gKLEv+4XTeDEHtsGnbx1Gl5nVT4Oxje6kNY1Fzmv/cPmSKWbJScsU952T
 cMEh3c0CW44u6dzr6dzlt2GGZDh0WIZy345rxtQLRoRDublsTrr6tvhzoCvq5qKIebS5nH3uMV
 FLY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:43:54 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J87144D9gz1Rwvf
 for <qemu-devel@nongnu.org>; Tue,  7 Dec 2021 22:43:52 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1638945831; x=1641537832; bh=VoW/APYv+/Addxn8Vl
 3X/2aFIt0i7U7pteAN7/AtERQ=; b=LPyKdl/thFiYYsrqa2HsmVjGcKx8ztmdna
 hMgFKyibdWZp9rlfdBm82dO3PUsuGd42E+R+89lDPuloO4SCklwC0puW//rrW1Ec
 uCLA/H57YXK/U+8JpHwe2r1RGDgcypIlyBj1yfObHncTiYRL1G4PjFonHd7MHsI8
 Zi7cAD+OqlR3dc3wBUx27r5QeJqzkZ3iUD0jMyNU0dsEyKdCfCtRS46w912mbUo0
 uuylJFvKDKXz5PrpWgc73L5YOlVp5KWs2HmJoLfF8Drmb75gNY707WCcFm7rJteZ
 zxVTe1aJswpWMkiYzuVokPEBZ/FCCD1iC66jUISOfgNzVIHj/AfA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id LJ8nis2b2rFN for <qemu-devel@nongnu.org>;
 Tue,  7 Dec 2021 22:43:51 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J870y59VKz1RtVG;
 Tue,  7 Dec 2021 22:43:46 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 7/7] hw/riscv: Use error_fatal for SoC realisation
Date: Wed,  8 Dec 2021 16:42:52 +1000
Message-Id: <20211208064252.375360-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=96943765b=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

When realising the SoC use error_fatal instead of error_abort as the
process can fail and report useful information to the user.

Currently a user can see this:

   $ ../qemu/bld/qemu-system-riscv64 -M sifive_u -S -monitor stdio -displ=
ay none -drive if=3Dpflash
    QEMU 6.1.93 monitor - type 'help' for more information
    (qemu) Unexpected error in sifive_u_otp_realize() at ../hw/misc/sifiv=
e_u_otp.c:229:
    qemu-system-riscv64: OTP drive size < 16K
    Aborted (core dumped)

Which this patch addresses

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reported-by: Markus Armbruster <armbru@redhat.com>
---
 hw/riscv/microchip_pfsoc.c | 2 +-
 hw/riscv/opentitan.c       | 2 +-
 hw/riscv/sifive_e.c        | 2 +-
 hw/riscv/sifive_u.c        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 57d779fb55..f16e4d10eb 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -471,7 +471,7 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
                             TYPE_MICROCHIP_PFSOC);
-    qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
+    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
=20
     /* Split RAM into low and high regions using aliases to machine->ram=
 */
     mem_low_size =3D memmap[MICROCHIP_PFSOC_DRAM_LO].size;
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index c531450b9f..0856c347e8 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -80,7 +80,7 @@ static void opentitan_board_init(MachineState *machine)
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
                             TYPE_RISCV_IBEX_SOC);
-    qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
+    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
=20
     memory_region_add_subregion(sys_mem,
         memmap[IBEX_DEV_RAM].base, machine->ram);
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 9b206407a6..dcb87b6cfd 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -88,7 +88,7 @@ static void sifive_e_machine_init(MachineState *machine=
)
=20
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_=
E_SOC);
-    qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
+    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
=20
     /* Data Tightly Integrated Memory */
     memory_region_add_subregion(sys_mem,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 589ae72a59..d576484851 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -545,7 +545,7 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
                              &error_abort);
     object_property_set_str(OBJECT(&s->soc), "cpu-type", machine->cpu_ty=
pe,
                              &error_abort);
-    qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
+    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
=20
     /* register RAM */
     memory_region_add_subregion(system_memory, memmap[SIFIVE_U_DEV_DRAM]=
.base,
--=20
2.31.1


