Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10492EA313
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 02:55:08 +0100 (CET)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwbYx-0002oa-Hi
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 20:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kwbXm-0002A5-BJ
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 20:53:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:49594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kwbXi-0001B6-J4
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 20:53:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CED8B2226A
 for <qemu-devel@nongnu.org>; Tue,  5 Jan 2021 01:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609811626;
 bh=8q/pd/xhDwIlokVRUJvxCXYZi2s8oP2bMUi6TsHs624=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZreAznJJkYDF5KORio+vuepJbCmzvzefVy5pBX3lfcowqoZ500sbUwfSccLlfE8kl
 mc9ccDEftvwPSarP/a9mGzqycCQFwSxtI9LKVq22mHH0fuJ2NqmswacTfL9aYoKzNe
 7WD2N8U+8CFqTzhiPstBSdIWiNAcp5YXStQWONkUXplj//BKMJ/SaSYH6jDRpiAS/b
 o7to0VmTQxvYOXQm0s3V7pV3PKKBPJmQtrVdT+Gxs5kUGeI29MeNx3JYxPN7QOFplC
 NbkbcfOoMxPmgx/SeNXVR0m5BYCGH4caRLm5dPbVotShnsj2//0Aju2q5kze6vFocf
 RK2eKK+XPc60g==
Received: by mail-il1-f177.google.com with SMTP id u12so27197283ilv.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 17:53:46 -0800 (PST)
X-Gm-Message-State: AOAM531E2cKxXVWIQfLWWyhtqj2AixjdVfuQVzzHyhUYLYrDfukO/uEy
 Ss0wjzDKnJTce8/QxNTeZk1Fmohtchl741ZOKlw=
X-Google-Smtp-Source: ABdhPJy83XSxLa4XALBWj/JCgraKo4nC/2WeY2/EFHYsWCApUlQVtxEAeSXVnpz2nn7mk9/y/4rry40YdGjEPvoOgLU=
X-Received: by 2002:a92:c990:: with SMTP id y16mr74377780iln.35.1609811626348; 
 Mon, 04 Jan 2021 17:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
 <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
 <790b031a-2be6-82d0-565d-f7595e95c077@amsat.org>
 <CAAdtpL53Ngj3zc0ZtxEvHed0hAxYN0RZ7G2eiL_izuTSWBMM2A@mail.gmail.com>
 <CAFEAcA-mTCyahsvVaD3PsOA4P8erDXmbLJCDtWaUFFoFiR4r=Q@mail.gmail.com>
 <47b22eb2-8600-b34f-371f-517804b9cb49@amsat.org>
 <1b7c8f3c-f124-ad59-6eb0-ce29803b1327@amsat.org>
 <61fb784c-0e96-b1ad-31c1-4ada4e849864@amsat.org>
In-Reply-To: <61fb784c-0e96-b1ad-31c1-4ada4e849864@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 5 Jan 2021 09:53:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H53bDKK0ndOsNZbOtJ-NBNhdvG186GfRv8tSq9XsU3Y+w@mail.gmail.com>
Message-ID: <CAAhV-H53bDKK0ndOsNZbOtJ-NBNhdvG186GfRv8tSq9XsU3Y+w@mail.gmail.com>
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe and Peter,

On Tue, Jan 5, 2021 at 2:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 1/4/21 7:24 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 1/4/21 6:39 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 1/4/21 4:01 PM, Peter Maydell wrote:
> >>> On Mon, 4 Jan 2021 at 13:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >>>> I don't have access to OSX host. I'll see to install an aarch32 chro=
ot and
> >>>> keep testing (not sure what can differ from an i386 guest).
> >>>> If I can't find anything I'll resend the same series without the Loo=
ngson-3
> >>>> machine, which is the single part adding QOM objects.
> >
> > OK I guess I found the problem, we have:
> >
> > struct LoongsonMachineState {
> >     MachineState parent_obj;
> >     MemoryRegion *pio_alias;
> >     MemoryRegion *mmio_alias;
> >     MemoryRegion *ecam_alias;
> > };
> >
> > Then:
> >
> > static inline void loongson3_virt_devices_init(MachineState *machine,
> >                                                DeviceState *pic)
> > {
> >     int i;
> >     qemu_irq irq;
> >     PCIBus *pci_bus;
> >     DeviceState *dev;
> >     MemoryRegion *mmio_reg, *ecam_reg;
> >     LoongsonMachineState *s =3D LOONGSON_MACHINE(machine);
> >
> > LoongsonMachineState is never allocated... Accessing its MR lead
> > to BOF.
>
> I'm going to respin with this (pass 32-bit tests):
>
> -- >8 --
> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> index e3723d3dd0f..d4a82fa5367 100644
> --- a/hw/mips/loongson3_virt.c
> +++ b/hw/mips/loongson3_virt.c
> @@ -612,8 +612,10 @@ static void mips_loongson3_virt_init(MachineState
> *machine)
>      loongson3_virt_devices_init(machine, liointc);
>  }
>
> -static void mips_loongson3_virt_machine_init(MachineClass *mc)
> +static void loongson3v_machine_class_init(ObjectClass *oc, void *data)
>  {
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
>      mc->desc =3D "Loongson-3 Virtualization Platform";
>      mc->init =3D mips_loongson3_virt_init;
>      mc->block_default_type =3D IF_IDE;
> @@ -624,4 +626,13 @@ static void
> mips_loongson3_virt_machine_init(MachineClass *mc)
>      mc->minimum_page_bits =3D 14;
>  }
>
> -DEFINE_MACHINE("loongson3-virt", mips_loongson3_virt_machine_init)
> +static const TypeInfo loongson3_machine_types[] =3D {
> +    {
> +        .name           =3D TYPE_LOONGSON_MACHINE,
> +        .parent         =3D TYPE_MACHINE,
> +        .instance_size  =3D sizeof(LoongsonMachineState),
> +        .class_init     =3D loongson3v_machine_class_init,
> +    }
> +};
> +
> +DEFINE_TYPES(loongson3_machine_types)
> ---
>
> Thanks Peter for catching this (we really need a 32-bit host runner
> on GitLab...).
>
Should I send a new version?

Huacai
> Phil.

