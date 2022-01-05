Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95D7485B79
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 23:16:08 +0100 (CET)
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5EZj-0004ZX-R0
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 17:16:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EQy-0007sq-19
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:07:04 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:1943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EQw-0007uv-5A
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641420422; x=1672956422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qihKQJFa1ma+57SqXXU0PIiok5kIt8Hb57cmcXqJS7U=;
 b=ds3g5CkAB6HXtJyUCaclN9m01+yDXp9ypi65HPJ9wRv/hhzizjB8N356
 sqXx4wp2Z10twDWLH6uUj6xVlZ4eEgqVqYAvUi2s8O8YDKKauuRqkXYjp
 6zHxLzJsEVBU5qqrlUpJZSnOE41noqumXW2ctZgjclvfVi9GlEZRhZVaN
 XJ1ggQYVRzhlPHKXLdnDsOzMmX+JIEBi4mJVpOqTydflvTmZo52vRcymb
 Cj2JgNgh6ztc2D8d0+aWMMp2ktigIZ+z23LRifLAIbBG8zZXrlp1OBdlc
 6r4kPg1ZYthrKCcgevT+1H+0xTWDUpODTDSM4WKfp41gsXMSfVL02K4KI A==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="188746576"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:40:33 +0800
IronPort-SDR: 6eSeZl+XqHDP1xYGIH4ebkLe2fQaYyAV1r1uwDHmFHJ5zmjCj7D8QnoaMuyvcLI2JFHiRNkaY6
 TXCnp9qAxtCdj4MSMYIEPhJrrqEoTO4KTFGX8Pgp3Ab7G0GYIoN5+WhN+p5NZFd/GarTkbKCwP
 rwf+OLR6bv6n5pGaIkIirl+10ECN64MoFy8AKV/MwO6XvWcVMy1XQrNMGWCkbOs/+96Rr4AJy+
 hT/691P7CFR9BA2u6ej7+JFQQDQ7AHw9IoC64XNMK9Re6RHcHbTFxLx6ZxEDPpSAumaFnfm16P
 rVJ1/P/aMxdRlRMeOOTA5tC4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:14:24 -0800
IronPort-SDR: sy2EslR1tkNst/lJbc0Otd8nAS4q6xxDW39fJWhjQJxVMrwkL6OhJLVuCnBZUYUQTes+OE+ZBX
 4NkI0bJVnMt7cTXkPBHJWD/193at2fvKdt/1W5jkzKfqmbVl6i+I68R0RCzAlJssg8yWOMYcgp
 igFfvKKiet8ddw6FZsvcH6CMuL1n5P68BdE3/zcsbprmTM4LzPQRWlU/t+foc6A/ngh93Z3a4D
 +YfOriiJOos5SwYcRtAKyQPmic6QVgwf+YHKjLXQf6Gv52GC3RXqv0rZuHJYfjefyFtj3rnhxc
 Sb0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:40:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjZm5k9pz1VprN
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 13:40:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641418832; x=1644010833; bh=qihKQJF
 a1ma+57SqXXU0PIiok5kIt8Hb57cmcXqJS7U=; b=gZR7IQCy7bP0E7+TkrEXOgm
 FLBkqjjpHc39mKYeEM3ySZymLVrxE8s1HL6iHTeAGpXi+JEUb8hzp6nGwgdr0tug
 GyQIRFs2q3IOJn6FeVPhugAybUVpGgmsmJC4wOrJjuD2Rj+jmoUN7nvblXdThbb7
 1acSozjopqpy4mMLRhKthQ9c2Uh04xb/LXEX2YbBQ7rHkDbU6U6F30gZ/B6ghvz+
 wl3r5PV/pgMSPMho2XHYvYu0FZRuvGr6YxFSTzjncBKWk/01oRzheICfysitdTaZ
 rWD5J3ygqTskkbUpiHX3zrGBbA9a387HqhtohAO42yarDlB/3RGEiCIqf/wpyqA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id JqimBxjSD8x0 for <qemu-devel@nongnu.org>;
 Wed,  5 Jan 2022 13:40:32 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjZf3RcNz1VSkV;
 Wed,  5 Jan 2022 13:40:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 7/8] hw/riscv: Use error_fatal for SoC realisation
Date: Thu,  6 Jan 2022 07:39:36 +1000
Message-Id: <20220105213937.1113508-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
References: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
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

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/riscv/microchip_pfsoc.c | 2 +-
 hw/riscv/opentitan.c       | 2 +-
 hw/riscv/sifive_e.c        | 2 +-
 hw/riscv/sifive_u.c        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index d1d065efbc..cafd1fc9ae 100644
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
index aa74e67889..7fbc7dea42 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -547,7 +547,7 @@ static void sifive_u_machine_init(MachineState *machi=
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


