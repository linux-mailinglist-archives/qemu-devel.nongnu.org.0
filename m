Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6C2F2EC2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:12:18 +0100 (CET)
Received: from localhost ([::1]:46876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIX3-00065d-5B
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitaly.wool@konsulko.com>)
 id 1kzIVe-0005AL-K7
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:10:50 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:41533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitaly.wool@konsulko.com>)
 id 1kzIVc-0007OG-Q2
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:10:50 -0500
Received: by mail-lj1-x230.google.com with SMTP id f11so2558051ljm.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F8qQ9u4czXUBNSQFXnEzl2llOpCfpuMhAmdLFUrvo6Q=;
 b=dEPufKd29Ril3srTvffPn3C1PtO6n6LFUqCsi9wjUzLOCKDAf1BcfAtGqvtmhOdgF+
 BAy2qn6Fiwk7rT6JKt4z4+txKafw7N4A2iE/TNOj3AicFBMJrGvoM/Ghjva8tlhlyxxz
 3Cj82lE4/QYMccEv80KsRO9PwDrXskGvSkUHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F8qQ9u4czXUBNSQFXnEzl2llOpCfpuMhAmdLFUrvo6Q=;
 b=KtirgfusMrdmEFgq/4MYZeyvglO4M2Tz+A4hg1NiLrAgA2CeUpmrVp2RCeDhvG1tS5
 usOv9CJs1YUw5ihmRIVUopFS/Blv8k6Ld925sGCZjht+Q80R9x2ZPo21Xs0+ETagHabg
 04p/mtaFnu/NnoGqN3cihitTf6d7CnZvuULQQeNxmauQT/RyuWiv5rO+6UsVQTy/l7Cf
 mSSOjDJTdKqVkzj/5h46vzR2UYWCuNm7UlyaK8gEuz8kLcYVyivYvtcOwXuGapbDrIYs
 Qo9u3iS9ttXDvVH+oXttoLUcHyo3FlOAgQFxJSjqE4M2RDyyEhU5e/v9A9cW3o7Acp/o
 NRug==
X-Gm-Message-State: AOAM5327xhwdRerdilHsAl50S+hMzEDW4H4l7YniltK5O4zslmqEsDgj
 zrYL4o3rdEUFsdPaJnUKmkhaU8/beob/5k/9eH9kzw==
X-Google-Smtp-Source: ABdhPJyfvVcjEP/YJfCbASJIQpglexF7hNDLQIkzW009mAYJHrR1QOriUXhTIoemG3zuHzTa3fgK+L6zkZl8Cw6hdfo=
X-Received: by 2002:a05:651c:1a5:: with SMTP id
 c5mr1961419ljn.172.1610453446053; 
 Tue, 12 Jan 2021 04:10:46 -0800 (PST)
MIME-Version: 1.0
References: <20201219002430.18481-1-vitaly.wool@konsulko.com>
 <CAEUhbmVvC7AFmCHJhZMS7KGaAXWFR1dMaghrWM3MyLapR7ycDg@mail.gmail.com>
In-Reply-To: <CAEUhbmVvC7AFmCHJhZMS7KGaAXWFR1dMaghrWM3MyLapR7ycDg@mail.gmail.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Tue, 12 Jan 2021 13:10:35 +0100
Message-ID: <CAM4kBBJEc6kcKR0XAw9t3ioT4A5CmoDwaDhprMX_SCOYRzjJqg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: microchip_pfsoc: specify XIP image
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=vitaly.wool@konsulko.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin,

On Tue, Jan 5, 2021 at 7:27 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> +Alistair Francis
>
> On Sat, Dec 19, 2020 at 8:24 AM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> >
> > Add command line parameter to microchip_pfsoc machine to be able
> > to specify XIP kernel image file. To pass over XIP image file, it
> > will be enough to run
> >
> > $ qemu-system-riscv64 -M microchip-icicle-kit,xipImage=<image> ...
> >
> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> > ---
> >  hw/riscv/microchip_pfsoc.c         | 42 +++++++++++++++++++++++++++---
> >  include/hw/riscv/microchip_pfsoc.h |  1 +
> >  2 files changed, 39 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> > index e952b49e8c..04d81d52fe 100644
> > --- a/hw/riscv/microchip_pfsoc.c
> > +++ b/hw/riscv/microchip_pfsoc.c
> > @@ -181,6 +181,7 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
> >  static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
> >  {
> >      MachineState *ms = MACHINE(qdev_get_machine());
> > +    MicrochipIcicleKitState *mks = MICROCHIP_ICICLE_KIT_MACHINE(ms);
> >      MicrochipPFSoCState *s = MICROCHIP_PFSOC(dev);
> >      const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
> >      MemoryRegion *system_memory = get_system_memory();
> > @@ -415,10 +416,19 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
> >                      memmap[MICROCHIP_PFSOC_IOSCB].base);
> >
> >      /* QSPI Flash */
> > -    memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
>
> I believe we only need to change this to memory_region_init_ram(),
> then use the device loader the load the XIP image into this space. The
> remove the need to introduce the XIP image property as you did.

I think it should be possible to use the device loader with rom as
well, and in this case we can skip this patch altogether. However, my
idea was that specifying explicitly it's not just a random data being
loaded but a kernel image in the XIP format would make things clearer.
OTOH, I would then introduce a property that isn't strictly speaking
necessary. I'll let Alistair decide what is the best way to go :)

~Vitaly

>
> > -                           "microchip.pfsoc.qspi_xip",
> > -                           memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
> > -                           &error_fatal);
> > +    if (mks->xip_image) {
> > +        memory_region_init_ram_from_file(qspi_xip_mem, OBJECT(dev),
> > +                                         "microchip.pfsoc.qspi_xip",
> > +                                         memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
> > +                                         0x10000 /* align */, 0 /* ram_flags */,
> > +                                         mks->xip_image, &error_fatal);
> > +        qspi_xip_mem->readonly = true;
> > +    } else {
> > +        memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
> > +                               "microchip.pfsoc.qspi_xip",
> > +                               memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
> > +                               &error_fatal);
> > +    }
> >      memory_region_add_subregion(system_memory,
> >                                  memmap[MICROCHIP_PFSOC_QSPI_XIP].base,
> >                                  qspi_xip_mem);
> > @@ -517,6 +527,24 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
> >      }
> >  }
> >
>
> Regards,
> Bin

