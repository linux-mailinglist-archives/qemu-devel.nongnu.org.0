Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F22F8888
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:39:16 +0100 (CET)
Received: from localhost ([::1]:39564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0XkR-0007GU-I2
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0XiE-0006Ni-PJ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:36:58 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:43351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0XiD-0001XD-2L
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:36:58 -0500
Received: by mail-io1-xd36.google.com with SMTP id x21so2995868iog.10
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PWXuQa1WGSkTEgwnJb4YDD1polKZQP6lZ+/68H0jZ+g=;
 b=O8hsc7QooS4lccMkK2WmJXXO78yzaDQ2o3y5vVHgsB4Pqzij2x8Wr5E95coXBxqbrn
 WDySVGL/EPptFcBx417VO52YTKtk8kp1jNwFy/no0/emHUtM1KTr5OVi+5yNiPEa1q5R
 mX/D1v3dHkdlbiKB8PkUCR0RD92H18E7UIAxonkgiBT+kYLwkF/S13ChtzD1SmQJOzgw
 cnvelFD3b1Ywl0dBeXpKA/Jcq0O7hyUMUhoE315tznZf8kWtG11zKRX2GHi6oeX+fxI/
 Ms7bQz/+3R0F6aUA0FLDPuFaUvSZO+QQhD71lbZISJwMqbgQPBvCNg5jb3w+PjZIvwJI
 sNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PWXuQa1WGSkTEgwnJb4YDD1polKZQP6lZ+/68H0jZ+g=;
 b=TfEKQNP315dq/Tx/f9KVBLlqm8xALiKKPZPYyMUaWSEfBJ3fEBzy0dpGomUszJusBJ
 Yztw7JIiBhqjv1ThOboRuYq5uh+JONWanzaHgg51cYQF6gVVKKPqKF6J0yowPLfKs/iu
 wpLyp4K0t0VH7Ft3rQ7xslvln+wBkPR3ng8SGI1T+XLhTi1IcvpZjXW0MjPkB5XpIc/4
 BdNvMqfNzefUpj5uJnvBXXMMCearIH7dCkzAaFe98Fb8ouOLzMzZdy2chWsV0sOGjfTD
 XmufCvmml9qXL9jn3IGzl/FqLuSXjwoE8fBS1Z52mhYYCAWpsIOI0oknKNvBnFoaBGF1
 5T9w==
X-Gm-Message-State: AOAM531gFTlY0qZJDEBt5OFnfaHzVhyPV21cJkisov3Cye5KldIFcoFC
 bbwmwI9lhl21T8AJOESe5BEMUT+STtg5x/kT6Us=
X-Google-Smtp-Source: ABdhPJz3qmyx0daQZ5EhxlSxM/4d7peVvrJqStWjSbetcizAmm8BO554e1Aeq0ae2Ta0Hda0IwWEIIWK8hnZPQuqqNM=
X-Received: by 2002:a05:6638:11d0:: with SMTP id
 g16mr12279251jas.26.1610750215906; 
 Fri, 15 Jan 2021 14:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20201219002430.18481-1-vitaly.wool@konsulko.com>
 <CAEUhbmVvC7AFmCHJhZMS7KGaAXWFR1dMaghrWM3MyLapR7ycDg@mail.gmail.com>
 <CAM4kBBJEc6kcKR0XAw9t3ioT4A5CmoDwaDhprMX_SCOYRzjJqg@mail.gmail.com>
In-Reply-To: <CAM4kBBJEc6kcKR0XAw9t3ioT4A5CmoDwaDhprMX_SCOYRzjJqg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 14:36:28 -0800
Message-ID: <CAKmqyKPUEqVL2rPCOrfUhTZ1-JbziwS1HKaA0WqPGvTHUQitQg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: microchip_pfsoc: specify XIP image
To: Vitaly Wool <vitaly.wool@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 4:11 AM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> Hi Bin,
>
> On Tue, Jan 5, 2021 at 7:27 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > +Alistair Francis
> >
> > On Sat, Dec 19, 2020 at 8:24 AM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> > >
> > > Add command line parameter to microchip_pfsoc machine to be able
> > > to specify XIP kernel image file. To pass over XIP image file, it
> > > will be enough to run
> > >
> > > $ qemu-system-riscv64 -M microchip-icicle-kit,xipImage=<image> ...
> > >
> > > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> > > ---
> > >  hw/riscv/microchip_pfsoc.c         | 42 +++++++++++++++++++++++++++---
> > >  include/hw/riscv/microchip_pfsoc.h |  1 +
> > >  2 files changed, 39 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> > > index e952b49e8c..04d81d52fe 100644
> > > --- a/hw/riscv/microchip_pfsoc.c
> > > +++ b/hw/riscv/microchip_pfsoc.c
> > > @@ -181,6 +181,7 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
> > >  static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
> > >  {
> > >      MachineState *ms = MACHINE(qdev_get_machine());
> > > +    MicrochipIcicleKitState *mks = MICROCHIP_ICICLE_KIT_MACHINE(ms);
> > >      MicrochipPFSoCState *s = MICROCHIP_PFSOC(dev);
> > >      const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
> > >      MemoryRegion *system_memory = get_system_memory();
> > > @@ -415,10 +416,19 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
> > >                      memmap[MICROCHIP_PFSOC_IOSCB].base);
> > >
> > >      /* QSPI Flash */
> > > -    memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
> >
> > I believe we only need to change this to memory_region_init_ram(),
> > then use the device loader the load the XIP image into this space. The
> > remove the need to introduce the XIP image property as you did.
>
> I think it should be possible to use the device loader with rom as
> well, and in this case we can skip this patch altogether. However, my
> idea was that specifying explicitly it's not just a random data being
> loaded but a kernel image in the XIP format would make things clearer.
> OTOH, I would then introduce a property that isn't strictly speaking
> necessary. I'll let Alistair decide what is the best way to go :)

In general I would say let's avoid machine properties. The more
aligned we can be to general QEMU arguments the better. That way
someone swapping from some other platform shouldn't have too much
trouble getting started.

Ideally we want to use either the device loader or the `-drive`
argument for loading these images. The RISC-V virt machine has -drive
support, maybe that is what you want here instead?

Alistair

>
> ~Vitaly
>
> >
> > > -                           "microchip.pfsoc.qspi_xip",
> > > -                           memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
> > > -                           &error_fatal);
> > > +    if (mks->xip_image) {
> > > +        memory_region_init_ram_from_file(qspi_xip_mem, OBJECT(dev),
> > > +                                         "microchip.pfsoc.qspi_xip",
> > > +                                         memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
> > > +                                         0x10000 /* align */, 0 /* ram_flags */,
> > > +                                         mks->xip_image, &error_fatal);
> > > +        qspi_xip_mem->readonly = true;
> > > +    } else {
> > > +        memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
> > > +                               "microchip.pfsoc.qspi_xip",
> > > +                               memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
> > > +                               &error_fatal);
> > > +    }
> > >      memory_region_add_subregion(system_memory,
> > >                                  memmap[MICROCHIP_PFSOC_QSPI_XIP].base,
> > >                                  qspi_xip_mem);
> > > @@ -517,6 +527,24 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
> > >      }
> > >  }
> > >
> >
> > Regards,
> > Bin
>

