Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054234881BD
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:02:43 +0100 (CET)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64oM-0008AQ-32
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:02:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dr-0007wq-5t
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:51 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dp-0006qG-F9
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621109; x=1673157109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m5CEKe9tyo8ilSE2fKRAEQfs4XqicZkCkC8JNhuR1aY=;
 b=XiB28vHOMj/E5k9rmMeFBc49VGPUQbGXcO191KUYnNCDFEx+yFYy2+uJ
 sfsLQVgHzjdBoLYH09QoI7+pfTmRnnD/BCPwW4EEXF14plLt6X4ackH4O
 7jqEYGOaNZzYWz/Gd7A/ZdqZgRMxrP9za5HFkwoXQDAJe2fF78XooTaWH
 R5zfSO7Zw4j9wmm8iiNYCdlNd3Uk7qRLFEb+E88Sqaf0jMMH3oCX9c0Yh
 j6t0GQgXtX3FTEJXzFaNZuwi0PvPZL/unQiJWFRKn6Y4I5JGLgob7QiL6
 0elsnHdn2QjoHz3pop1igK5xYBSieW16WpTJLs0w+HX+MZ6bOai6a6JiV A==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027355"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:48 +0800
IronPort-SDR: RvA97eLChYgmajXLqnbHZbIzjNlO/C3Ab57FcTjcFVjzSfW+5jYky3hcN0MDvUhkO+kCwSgTgO
 PqgYHpdjXnYsU29AiIdZgOA61LDF3EV4qNZ+g57ESlZvOc2nA3ucZztP1Q/CXu6Se5/QRBtwdC
 ZTJPlRlnfT50zfeH7OMkN8+xzzAsMev35DQjRqy5P4uYjVTOS5HcA8QoT6Vrt9i9qvem+wpc7U
 3Sx/6G1+4F02Oew4pJ5avx2pH9CSAxezC0nLH0eBg+tLMo7srHzEzEBz/Rvpdep/NM/5ws4jP0
 d/KKYcwCkKVYikDh+9JlC2Vs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:36 -0800
IronPort-SDR: y5mUJ+cZUdGACWwir/1TUJrwlR9mkNBJV7ZZklEsMeu2+4ZDEn+H26shLBqGbzkalo0xw7o8ue
 yOfebHk/ie8AmsjplU4owXZJYD5pRISigfbtRhnARdcbrBed0A2xP2z47PfgE70/v0kCYy+Q7b
 RdukL1dABHIXFUH3NeOQejrqbnH5wYZLkUzEVNVh8UP5la3B78RV1ATYM68XDEUVUCrONEcJHc
 jjQbBZ3P2odv6heKLf95P3aNVS2NIU+F5v/+R1J2NCJzhPAuisb/jEhe2AXpBDGUICwiJx7Vy0
 F7w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Nh17nQz1VSkX
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621107; x=1644213108; bh=m5CEKe9
 tyo8ilSE2fKRAEQfs4XqicZkCkC8JNhuR1aY=; b=ARB0xjhsYeZWhXXPO9F7uwV
 Cu50Ux2mnAAGItMGRcEPLzRpFivux5dqKu2YvsqzaNPw5CcwCEHTnBbft+vp8RgZ
 Si7KIRdjMUrc+NPiA3d0cLlz8Zke06Uc2wsRH5NxD7JNkWOTpIftvt7dgaFuV1f9
 1BfxRTxU+Uvzj4IpuYCzr6ZU670dWEjHLIiBr8d9SVkGIkWU1ZPCVCc4idZ/fENY
 EvWVi5FUrLstNjZsNxrEiav3wgDezg+VRN66gAfOXVxgKdtWynkmy54LL08rctlj
 cna0qq3FM90fgzTgwShxUtAuM03XgX9cgGt+zOT1OtPNw9UrCBMJATF2EUzMNZA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id JQuZqUDKLVTN for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:47 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Nb6kyvz1VSkV;
 Fri,  7 Jan 2022 21:51:43 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 10/37] hw/riscv: Use error_fatal for SoC realisation
Date: Sat,  8 Jan 2022 15:50:21 +1000
Message-Id: <20220108055048.3512645-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
Message-Id: <20220105213937.1113508-8-alistair.francis@opensource.wdc.com=
>
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


