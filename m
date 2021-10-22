Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA81343788E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:58:12 +0200 (CEST)
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdv3j-0000vE-T8
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunM-000334-G8
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:16 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:41273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunJ-0001mw-CU
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910074; x=1666446074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rPjjK1gvg0RMuW22DWI8n00ZARjgB6RxXQcqp1EYboU=;
 b=mLsJcQ0bhAB+WZsQJAgJZ+vfUdVj8jCvZFqCVqSmFLD6IlYtPwZXCMOn
 f6pOliKa9yezI6LsYaqIyJVpG0jX4raqwnRhzEuA8e1Sk0x31ZHo09B8R
 kANpKJcbWBkzpOaezukg7Ty/phMb6dBp5vKB+FdomuMKZ1V/CJfBR0Nj5
 Hab5Mb0o/xBgw1VfgDlDWdReV5b7Yp+7yFoE4kIioS3sbHDu20lksXLQR
 TgPnOXmqD4/Jlgf38NGKghVqWOCUQIM9qo6xGIoSFPa0yPmG9vEF4gg0Y
 /G+WNBj5ZfeX1h3zKWBLowRpOxIFniWYhxKPh2zMuWqxebujG6tQruRPo A==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="184556419"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:41:12 +0800
IronPort-SDR: FTzo2A7aXDjDdqvlzG4zbeCw8YAlV0X5whTF5ip5Bc+03njngQGrIAymifMHdOWRSd0vo6aVaU
 mU40PxWTW54H1L1qeZvLgRh+X/65PRFR5usPRXl0+v1K/vBX+90MEtFjDa1x9/4nhVHy7hRaTG
 CC+CwEv0ETQkesxikBEnGQ5obpGJzlKH9yINdRVYPp+r2ptZbYLwMF9tT6fLYoY5UxqzNwZqcL
 CY6BlKNJXdOPPw6BHNZejYUVBfD6xE3jx6oT1DI+J02GjuUVL39Tg9LjXZsv79j5ka4Axme+Uq
 Iq6orHlV8nZ4N8is4KlfqoVo
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:16:46 -0700
IronPort-SDR: EEYevrvArfGlkX8o4xUOUPGdSnbpvjPOOLRHPnAn+pv8HWe9KPZ5NuLo/j/wXWly3TDhznERhM
 WgfNioVzbQ7vNFa1qrnPO00fDGyLpHCZW2HuEDfuyO9hlg1oQDiGKE0c37T8zJnLZedGzEhsTH
 ERlmrrAA5z+gE5lDiqOL81mlp2MJd+y34r2w+Sto0oSrSNZD0JfKhj3F5XHIC5rtyQzmGST80f
 sCy/4zm8uBdN8s6e5LXv41fLSaR1cOLiNd5u8mWEk/LWjO/N1SkM4K5mxUHMN7rIYqmMsdDyXC
 nHc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:41:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQVH5sSfz1RtVt
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:41:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1634910071; x=1637502072; bh=rPjjK1g
 vg0RMuW22DWI8n00ZARjgB6RxXQcqp1EYboU=; b=VbI73JmM72K1bbPn8xZulBV
 rkg5s/Kif5lvmpPdjOH+FaIEW23SSjsy9ax90N7OUF8AiqhP7TCyuHLbOMyqliI0
 TDJOsFije9/QAtjRRh6CuelgYVswPekO+iymocdEghYxyYZOeGx5t6CpuzJvJgA7
 wKwzFPgYmRp9zuhgG4eaHgAUDvpStXrtjqHBj2XlPjLYeIj1SFvYC4Q9tt0BGby7
 deSvf5ZApzi9gdad4Vj8t9sf3725Y41j91kBWlcDEJYNqHnO42lFtuUpK79XYGYt
 wDK9x7DPmNQkmzVlpAlZRUyc/7PYyov8lGlBp8PUc3g0o5BWm1N6KvAZ7mod2xQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 10HbcwNhF_Do for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:41:11 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQVB5RhTz1RtVl;
 Fri, 22 Oct 2021 06:41:06 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 30/33] hw/riscv: shakti_c: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Fri, 22 Oct 2021 23:38:09 +1000
Message-Id: <20211022133812.3972903-31-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Bin Meng <bmeng.cn@gmail.com>

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211020014112.7336-4-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/shakti_c.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index d7d1f91fa5..90e2cf609f 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -45,7 +45,6 @@ static void shakti_c_machine_state_init(MachineState *m=
state)
 {
     ShaktiCMachineState *sms =3D RISCV_SHAKTI_MACHINE(mstate);
     MemoryRegion *system_memory =3D get_system_memory();
-    MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
=20
     /* Allow only Shakti C CPU for this platform */
     if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) !=3D 0) {
@@ -59,11 +58,9 @@ static void shakti_c_machine_state_init(MachineState *=
mstate)
     qdev_realize(DEVICE(&sms->soc), NULL, &error_abort);
=20
     /* register RAM */
-    memory_region_init_ram(main_mem, NULL, "riscv.shakti.c.ram",
-                           mstate->ram_size, &error_fatal);
     memory_region_add_subregion(system_memory,
                                 shakti_c_memmap[SHAKTI_C_RAM].base,
-                                main_mem);
+                                mstate->ram);
=20
     /* ROM reset vector */
     riscv_setup_rom_reset_vec(mstate, &sms->soc.cpus,
@@ -88,6 +85,7 @@ static void shakti_c_machine_class_init(ObjectClass *kl=
ass, void *data)
     mc->desc =3D "RISC-V Board compatible with Shakti SDK";
     mc->init =3D shakti_c_machine_state_init;
     mc->default_cpu_type =3D TYPE_RISCV_CPU_SHAKTI_C;
+    mc->default_ram_id =3D "riscv.shakti.c.ram";
 }
=20
 static const TypeInfo shakti_c_machine_type_info =3D {
--=20
2.31.1


