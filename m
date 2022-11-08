Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6B621178
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:53:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osO5v-0000jf-ID; Tue, 08 Nov 2022 07:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1osO5o-0000hv-Id; Tue, 08 Nov 2022 07:52:40 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1osO5m-0004az-FW; Tue, 08 Nov 2022 07:52:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id bk15so20773547wrb.13;
 Tue, 08 Nov 2022 04:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYHFQoAZk6Td/wFnj+B7LtUjfpHcV2mva19ZbWS+dHc=;
 b=YBF2FiDQBMj0G30Y07wPWFxXXGZLCCzwBeBva5vBOOZgIARCiWrsEMxNH43VTVK+4Y
 WMfShBXK4nvQfYkqbkU7J+J3rHuZExGLfncGiaP50JHdLNs0uq+peo6U7ca6vp8ib9bL
 +rfARVExt2mbKSDnwfgvfDXYeNpMnaoiVBjrtrxxU+9bUizUiWQ2+BACRB6nshmI83IN
 QXp5dn1tuiYk7efwCRekGp6VgXE4adKi5sQfw15hyR377JP/NnXFnrXo65Dzh5XN+Ngy
 S6xp2b7JSKPYsvmJ+0TGEXENd5qwhVYPJ/U9nrrhcmqRDT1b/sbIR6ZBp6aWCgI3WlLb
 baNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yYHFQoAZk6Td/wFnj+B7LtUjfpHcV2mva19ZbWS+dHc=;
 b=VYXdwOnLGJ+2/ycRIHQII3hbUGptVCuoeVcPCuBBognXfPmVFl6YOS2TfkIFr3Wg9p
 XbX/+b4i83otJxKTg+BYtW6v7v87WnvrhHqRUgtUu9x2LObMlUeNXVkfgJ8jQmocjXXT
 aWNN0Lzb6HzCj38L9DopP4JXoq6x2mgla8+0WHcn/+kaGuB8IB83SrN5uZaLLQsqfhFL
 ew/BMIbgejZ0xwfHFWnRU3RbC9kEJPCzfTYty0y2i43ZPyB4H6ot/fvEyZTTVbatcqhQ
 l6QP7xbyqSy1TZhU7mgdVfyaWJFPKRE/CKgcMKlt7wVEh812rvy0zDxzXLmAvDCKNAcQ
 /bZA==
X-Gm-Message-State: ACrzQf2gWPxfm4W/VBLzBNDItuafLDWDTG4KfZFP/HCHs2EoMR2ZhrCy
 PV/WTnX8idAX8jajj++TLAmzv1H9EzBjbw9s+H4=
X-Google-Smtp-Source: AMsMyM5bHHv13uV1OxBCHPFUEaCdtDeF3ZAzpndR7U/4MZMp0G6WUr11K3gJEx21Ibdgk2k0cq60MVlHd1+th3S9RA8=
X-Received: by 2002:a05:6000:24f:b0:236:76e8:33fd with SMTP id
 m15-20020a056000024f00b0023676e833fdmr34387877wrz.215.1667911954313; Tue, 08
 Nov 2022 04:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
In-Reply-To: <87fsetg5xh.fsf@linaro.org>
From: Schspa Shi <schspa@gmail.com>
Date: Tue, 8 Nov 2022 20:52:22 +0800
Message-ID: <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=schspa@gmail.com; helo=mail-wr1-x429.google.com
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Schspa Shi <schspa@gmail.com> writes:
>
>> We use 32bit value for linux,initrd-[start/end], when we have
>> loader_start > 4GB, there will be a wrong initrd_start passed
>> to the kernel, and the kernel will report the following warning.
>>
>> [    0.000000] ------------[ cut here ]------------
>> [    0.000000] initrd not fully accessible via the linear mapping -- ple=
ase check your bootloader ...
>> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/init.c:355 arm64_=
memblock_init+0x158/0x244
>> [    0.000000] Modules linked in:
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          =
6.1.0-rc3-13250-g30a0b95b1335-dirty #28
>> [    0.000000] Hardware name: Horizon Sigi Virtual development board
>> (DT)
>
> Is this an out-of-tree board model?
>

Yes, this is a virtual board created by myself.

>> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTY=
PE=3D--)
>> [    0.000000] pc : arm64_memblock_init+0x158/0x244
>> [    0.000000] lr : arm64_memblock_init+0x158/0x244
>> [    0.000000] sp : ffff800009273df0
>> [    0.000000] x29: ffff800009273df0 x28: 0000001000cc0010 x27: 00008000=
00000000
>> [    0.000000] x26: 000000000050a3e2 x25: ffff800008b46000 x24: ffff8000=
08b46000
>> [    0.000000] x23: ffff800008a53000 x22: ffff800009420000 x21: ffff8000=
08a53000
>> [    0.000000] x20: 0000000004000000 x19: 0000000004000000 x18: 00000000=
ffff1020
>> [    0.000000] x17: 6568632065736165 x16: 6c70202d2d20676e x15: 69707061=
6d207261
>> [    0.000000] x14: 656e696c20656874 x13: 0a2e2e2e20726564 x12: 00000000=
00000000
>> [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 00000000=
00000000
>> [    0.000000] x8 : 0000000000000000 x7 : 796c6c756620746f x6 : 6e206472=
74696e69
>> [    0.000000] x5 : ffff8000093c7c47 x4 : ffff800008a2102f x3 : ffff8000=
09273a88
>> [    0.000000] x2 : 80000000fffff038 x1 : 00000000000000c0 x0 : 00000000=
00000056
>> [    0.000000] Call trace:
>> [    0.000000]  arm64_memblock_init+0x158/0x244
>> [    0.000000]  setup_arch+0x164/0x1cc
>> [    0.000000]  start_kernel+0x94/0x4ac
>> [    0.000000]  __primary_switched+0xb4/0xbc
>> [    0.000000] ---[ end trace 0000000000000000 ]---
>> [    0.000000] Zone ranges:
>> [    0.000000]   DMA      [mem 0x0000001000000000-0x0000001007ffffff]
>>
>> To fix it, we can change it to u64 type.
>>
>> Signed-off-by: Schspa Shi <schspa@gmail.com>
>> ---
>>  hw/arm/boot.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 57efb61ee419..da719a4f8874 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -638,14 +638,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boo=
t_info *binfo,
>>      }
>>
>>      if (binfo->initrd_size) {
>> -        rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-star=
t",
>> +        rc =3D qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-start=
",
>>                                     binfo->initrd_start);
>>          if (rc < 0) {
>>              fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n"=
);
>>              goto fail;
>>          }
>>
>> -        rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end"=
,
>> +        rc =3D qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-end",
>>                                     binfo->initrd_start + binfo->initrd_=
size);
>>          if (rc < 0) {
>>              fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
>
> On the face of things this seems fine because unlike the other linux
> properties they are not specified to be "expressed in #address-cells and
> #size-cells" but I do wonder how we got into the situation where the
> kernel and initrd ended up so high in the physical address space.
>

The reason why I faced this problem is there is no DRAM region below
4GB on the hardware. And I make this virtual board to have the same
memory layout as the hardware.

Although there is no something like #address-cells and #size-cells,
but Linux will handle the size correctly by calling the following code:

prop =3D of_get_flat_dt_prop(node, "linux,initrd-start", &len);

Please check the link at
Link: https://lore.kernel.org/all/20091105074724.10460.4083.stgit@angua/
Every Linux version support fdt on arm[64] platform should work without
problems.

> There is a whole comment in boot.c talking about keeping initrd within
> lowmem:
>
>     /*
>      * We want to put the initrd far enough into RAM that when the
>      * kernel is uncompressed it will not clobber the initrd. However
>      * on boards without much RAM we must ensure that we still leave
>      * enough room for a decent sized initrd, and on boards with large
>      * amounts of RAM we must avoid the initrd being so far up in RAM
>      * that it is outside lowmem and inaccessible to the kernel.
>      * So for boards with less  than 256MB of RAM we put the initrd
>      * halfway into RAM, and for boards with 256MB of RAM or more we put
>      * the initrd at 128MB.
>      * We also refuse to put the initrd somewhere that will definitely
>      * overlay the kernel we just loaded, though for kernel formats which
>      * don't tell us their exact size (eg self-decompressing 32-bit kerne=
ls)
>      * we might still make a bad choice here.
>      */
>

I think this lowmem does not mean below 4GB. and it is to make sure
the initrd_start > memblock_start_of_DRAM for Linux address range check.

> Is this just because the base RAM address of the board is outside of the
> 32 bit address range?

Yes, it is.


--
BRs
Schspa Shi

