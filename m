Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E179C476954
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 06:03:01 +0100 (CET)
Received: from localhost ([::1]:33490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxiuz-0000PX-1y
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 00:03:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinb-0003oE-3n
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:23 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:6632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinZ-0003vx-Bl
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630521; x=1671166521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MnhhwwWUBIbanfdWHL+OfAzPVNg/HXqFMlEvvWVDFQU=;
 b=TrltC2QepPF0cY/nxv/TaZK3+x5IhD4Y7nG6vTh9pGavJ1HXuAOKSZf1
 Xv5b+aEJ2JQw/RUXhkSxO3nbxnHYDsej/jOaD7VBIf885bP3Fq6MOEs8X
 6dKM/zn+F6egeQlNtzuX30wKymSVCij+RV1k67qhTLFHU0S7sPhAibezA
 p0RPN8pg9MoQZqOFpU5wwduG2OSRMumBGW3InZJnkikGTUz7Ms1ZxfS1Q
 hbE/+gW1Nr+d3FJ4gdiiAnSRdzhOmEu1Dub6d18tnlrRvIuVzHmchWapB
 NXr2eMOq7ESThroqxu/03JJVFnPaamsUa01n8kZr93r6KGmyuayUS9JQ6 A==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="300226972"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:55:17 +0800
IronPort-SDR: amIP/pA5lclc7vesAe4opMQakKIGnzF37dKcpWKg7ulLeZMciWg6VmomSN5NsN3Pmw770pMxkW
 OjZ8AV+k9enT8/NHBuCwZLFPlC3ONtQrgmhmblCxjyj7+kttEHlk0esc46mVPdjMARYxtgJGjb
 pkHeijDY0XOSOMiEjI5lh066xzi87hcfTHY9nwHfKGrBqWBUjNdRSx9VEIkPXaiBNYIthHfmpM
 +Bp1qFXhWDfOPd9Sdea14dcX5/m5ffZ6zQEqc45EOdDrUHt0aeqO0WrP6ZlO0mx1jVXNNVjnI8
 wi/2SUqxKi39b1iZj+8NeO96
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:29:40 -0800
IronPort-SDR: WYJzi0kHVnPAId2ttfrg4gEwCrH8rz+tMUOPu4N0EM1s9rKxvTCbGYQrtUfzQ1k5bG0ijYEqGQ
 oKRgJJpPgPl5J+zpBABON1JNkiY0y0ZJdJ4AUavBY7eyL1kVOnAVv4G0bCti+a3RIzN4bvZ2zo
 qpeTgUWgkbfzc+cK4jrgsFChtF+HSR27FufjIUi6kuWUgPNzXYD8TXEAM7GJV/nKisioRKeOZT
 01b7RTqZeeZhOpekt5KNo19t6mBxFkbxrjKE7gkKaQ4kPGf7XvxCQd5zwMMCfiwbi5nRvrzLs9
 5XU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:55:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0D55NDGz1RwFN
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 20:55:17 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1639630517; x=1642222518; bh=MnhhwwW
 UBIbanfdWHL+OfAzPVNg/HXqFMlEvvWVDFQU=; b=QErgPZXwJvdLGUlB1yhjnY3
 jeyAD4nso5di+mVh+aqUT05Xr9tL20iCI6+s1iIkCfMyMKdgl5JuQdkdmrfZqosI
 HRmoVaZyFsYnZwhEByB7aWU7voN0THi7pzUrTl6UPVf1iNOkhg911wEM6cjSMYgh
 3IS15nIX883WWwajC8RntyZ3Yn+6eyJmizWTqt08jfQ2dCpm3NnhA9HlAMy2+T1h
 7pvCOinjjGlEt6HwQWx7ffFOj9u1Wjm2k+Y8UTthR10dg7wu6XeZWjz0g1lQHfAT
 /L2skqtsFVKyHX9rJZtrm2aRT9fRANcjOhTqe7YXdvuaC+LmX2CaB88nLex1wug=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Z_1ZY3cBqfVR for <qemu-devel@nongnu.org>;
 Wed, 15 Dec 2021 20:55:17 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0Cz4VRxz1RtVG;
 Wed, 15 Dec 2021 20:55:11 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 7/9] hw/riscv: Use error_fatal for SoC realisation
Date: Thu, 16 Dec 2021 14:54:25 +1000
Message-Id: <20211216045427.757779-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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


