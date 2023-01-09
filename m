Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7526663583
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 00:43:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF1nM-0001IO-L9; Mon, 09 Jan 2023 18:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pF1nG-0001I4-S9
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 18:43:07 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pF1nF-00070r-3Y
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 18:43:06 -0500
Received: by mail-ej1-x634.google.com with SMTP id fc4so24277543ejc.12
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 15:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=37HMN0QmCcLo9JBthPm+nIDcsCLgX9QZZVl6nf3a5Tk=;
 b=AuVHbJ5e3eK1eBu9BRLKdOJW+wAgV8JrvNpGGpftqJ4Vy/YhScz2g35147Y8s+lNS7
 DqmGgunPdNgD99H3oFOQ2lMx8mxc/VebOCUyMC4q6U0+i4uLDf5ZncEPk//gFmCmOsIz
 dozT/xd8/qE577AvPSVdkSD0SbQf0DeBUTMxxD6/7pxv+lOegDhb9N1YINmnCvhVm1JY
 gxPOg6QzhoGU5QZUt7eQkayITb5Pej7SuF1d/uDj33vFyXn1/vxt16lTeXa+hmLWqV2h
 uVUtjcI6JCXkQwzDXC8p163FR3qm/oxVD02FnPT47TsQQDPVVXeGefOXDejjzK4URS13
 AVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=37HMN0QmCcLo9JBthPm+nIDcsCLgX9QZZVl6nf3a5Tk=;
 b=DYRm5SRkxshwcNVUcPHh+mptEGEfuf6GelCO0i+UmA2Yn0IL4LvJsCLyyUJhzbQGD/
 +NJl8K8nAKUisA7URrgdfjgTv9UaECslVBW1CgxgoL3/p75OpJ3WwIiVcm9ISb8/YmmF
 UpvzeE//goOfq6/zjdcpkfy55ommrTvFfsaz/N4sXtvxFjVqKlaUHoTjbAGA8m/kJCbe
 1+UVbJxSr3RwAj90GRapGmb+GC/oI3cYLFG1kUBZ5K1iUOMf/nlYYjqPgu+iJBaeUhja
 pAGrwaa0kYqCjhN8pbLRlIA+2/8EMC2yv+GeycfcOwjB/RrgfEuy0UcglHFwmWGAM4nG
 2IKA==
X-Gm-Message-State: AFqh2koUc5qIVmiNjfuTL6nrU6UMydsIO8Mw576peKaAFLypFr9XKz2X
 A/KF78wBv/gs7xLE6k5APJ+KeqwTMFE=
X-Google-Smtp-Source: AMrXdXsbOE0eIApCqQ9XVCgjjX+E0FQNCxNuIdTa0Zx/E4LlT2c1BlVC2u7jJgjTauL5pRRL0EBaBQ==
X-Received: by 2002:a17:906:cd0b:b0:84d:463f:3787 with SMTP id
 oz11-20020a170906cd0b00b0084d463f3787mr5011320ejb.5.1673307783272; 
 Mon, 09 Jan 2023 15:43:03 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-014-050.78.54.pool.telefonica.de.
 [78.54.14.50]) by smtp.gmail.com with ESMTPSA id
 q5-20020aa7d445000000b00482b3d0e1absm4248535edr.87.2023.01.09.15.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 15:43:02 -0800 (PST)
Date: Mon, 09 Jan 2023 23:42:57 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: Bin Meng <bmeng.cn@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_04/21=5D_hw/block=3A_Pass_De?=
 =?US-ASCII?Q?viceState_to_pflash=5Fcfi01=5Fget=5Fmemory=28=29?=
In-Reply-To: <20230109120833.3330-5-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-5-philmd@linaro.org>
Message-ID: <49C85A05-2BE5-4D9B-A08A-B93039669BD8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 9=2E Januar 2023 12:08:16 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>The point of a getter() function is to not expose the structure
>internal fields=2E Otherwise callers could simply access the
>PFlashCFI01::mem field=2E

The getter also works with a typedef which doesn't need the structure expo=
sed=2E

>Have the callers pass a DeviceState* argument=2E The QOM
>type check is done in the callee=2E

Performing the cast inside the getter is essentially "lying" about the get=
ter's real interface which requires a PFlashCFI01 type to work properly=2E =
Weakening the typing to the super type also weakens the compiler's ability =
to catch mistakes at compile time=2E These mistakes can now only be found b=
y actually running the code or by analyzing the code very, very carefully=
=2E

For refactoring purposes as well as for code comprehensibility I actually =
prefer the old interface because the code is clearly annotedad with PFlashC=
FI01 types=2E With the new interface I need to manually track down each Dev=
iceState pointer passed to a getter to verify that it is actually a PFlashC=
FI01 pointer=2E This causes considerably more cognitive load than before wh=
ich I'd rather spend on the problem I'm trying to solve=2E

What do you think?

Best regards,
Bernhard

>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>Reviewed-by: Bin Meng <bmeng=2Ecn@gmail=2Ecom>
>---
> hw/block/pflash_cfi01=2Ec  | 4 +++-
> hw/i386/pc_sysfw=2Ec       | 2 +-
> hw/mips/malta=2Ec          | 3 ++-
> hw/ppc/e500=2Ec            | 2 +-
> hw/xtensa/xtfpga=2Ec       | 2 +-
> include/hw/block/flash=2Eh | 2 +-
> 6 files changed, 9 insertions(+), 6 deletions(-)
>
>diff --git a/hw/block/pflash_cfi01=2Ec b/hw/block/pflash_cfi01=2Ec
>index 8beba24989=2E=2E866ea596ea 100644
>--- a/hw/block/pflash_cfi01=2Ec
>+++ b/hw/block/pflash_cfi01=2Ec
>@@ -991,8 +991,10 @@ BlockBackend *pflash_cfi01_get_blk(DeviceState *dev)
>     return fl->blk;
> }
>=20
>-MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl)
>+MemoryRegion *pflash_cfi01_get_memory(DeviceState *dev)
> {
>+    PFlashCFI01 *fl =3D PFLASH_CFI01(dev);
>+
>     return &fl->mem;
> }
>=20
>diff --git a/hw/i386/pc_sysfw=2Ec b/hw/i386/pc_sysfw=2Ec
>index c08cba6628=2E=2E60db0efb41 100644
>--- a/hw/i386/pc_sysfw=2Ec
>+++ b/hw/i386/pc_sysfw=2Ec
>@@ -187,7 +187,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
>                         0x100000000ULL - total_size);
>=20
>         if (i =3D=3D 0) {
>-            flash_mem =3D pflash_cfi01_get_memory(system_flash);
>+            flash_mem =3D pflash_cfi01_get_memory(DEVICE(system_flash));
>             pc_isa_bios_init(rom_memory, flash_mem, size);
>=20
>             /* Encrypt the pflash boot ROM */
>diff --git a/hw/mips/malta=2Ec b/hw/mips/malta=2Ec
>index e645ba1322=2E=2E9657f7f6da 100644
>--- a/hw/mips/malta=2Ec
>+++ b/hw/mips/malta=2Ec
>@@ -1292,7 +1292,8 @@ void mips_malta_init(MachineState *machine)
>                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL=
,
>                                FLASH_SECTOR_SIZE,
>                                4, 0x0000, 0x0000, 0x0000, 0x0000, be);
>-    bios =3D pflash_cfi01_get_memory(fl);
>+    dev =3D DEVICE(fl);
>+    bios =3D pflash_cfi01_get_memory(dev);
>     fl_idx++;
>     if (kernel_filename) {
>         ram_low_size =3D MIN(ram_size, 256 * MiB);
>diff --git a/hw/ppc/e500=2Ec b/hw/ppc/e500=2Ec
>index 9fa1f8e6cf=2E=2Eb127068431 100644
>--- a/hw/ppc/e500=2Ec
>+++ b/hw/ppc/e500=2Ec
>@@ -1144,7 +1144,7 @@ void ppce500_init(MachineState *machine)
>         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>=20
>         memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
>-                                    pflash_cfi01_get_memory(PFLASH_CFI01=
(dev)));
>+                                    pflash_cfi01_get_memory(dev));
>     }
>=20
>     /*
>diff --git a/hw/xtensa/xtfpga=2Ec b/hw/xtensa/xtfpga=2Ec
>index 2a5556a35f=2E=2Ebce3a543b0 100644
>--- a/hw/xtensa/xtfpga=2Ec
>+++ b/hw/xtensa/xtfpga=2Ec
>@@ -459,7 +459,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board,=
 MachineState *machine)
>         }
>     } else {
>         if (flash) {
>-            MemoryRegion *flash_mr =3D pflash_cfi01_get_memory(flash);
>+            MemoryRegion *flash_mr =3D pflash_cfi01_get_memory(DEVICE(fl=
ash));
>             MemoryRegion *flash_io =3D g_malloc(sizeof(*flash_io));
>             uint32_t size =3D env->config->sysrom=2Elocation[0]=2Esize;
>=20
>diff --git a/include/hw/block/flash=2Eh b/include/hw/block/flash=2Eh
>index 701a2c1701=2E=2E25affdf7a5 100644
>--- a/include/hw/block/flash=2Eh
>+++ b/include/hw/block/flash=2Eh
>@@ -22,7 +22,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
>                                    uint16_t id2, uint16_t id3,
>                                    int be);
> BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
>-MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
>+MemoryRegion *pflash_cfi01_get_memory(DeviceState *dev);
> void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
>=20
> /* pflash_cfi02=2Ec */

