Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F5E1A6F10
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 00:25:08 +0200 (CEST)
Received: from localhost ([::1]:49740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jO7Vr-0003O5-OK
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 18:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7Ty-0001Yj-4v
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 18:23:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7Tw-0006Ax-U9
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 18:23:10 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:36454)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7Tw-0006An-QA; Mon, 13 Apr 2020 18:23:08 -0400
Received: by mail-ua1-x944.google.com with SMTP id m15so3732718uao.3;
 Mon, 13 Apr 2020 15:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gEKohtwFE3SQeQe0CuNpY6V0C6EIim4ono+ZvepKLzU=;
 b=VJB4c5T5N3hdsN16C1+Toc3Wt7t/5PLQgT1dit/2xFRajjoJ2JrDb+cGACNa3DHICL
 kBlkEfsQOz+Mr81hvnXWs4jptW3BHJew+b0M3jnnG9yvmyvWPH7lMIbsNv25y9Rk1Kxm
 5Dt1ic6gtHOOMDS2UGHFInFqWFQBw7v7Sv6gdGe4EFkqHRCGTlw5nmVhCoAcT0LeNEBi
 nP0tth8vaLJu86htyafrNDVkRsn9qtWmmuhOUy3PPG7/hcb30GAQE7WIMOn2QxS8ArLO
 9mIhQfHU5a0YApku0bKnqGRTAo8XP9d3QIcyDqsLDgZ1PVVDhLGEsriE7I/3LWEUsgfo
 ruTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gEKohtwFE3SQeQe0CuNpY6V0C6EIim4ono+ZvepKLzU=;
 b=AYf5JoByb+EkUrOTy8yv++Q7amXHI+LQdSdYqk7EDrbCCkN6X6Uusal3JUh+obCOZ8
 0RX4AoXMLEhlr35M/fawHNBA+pXhDzVGpcat95j78vRBhUGDksNeLuNFreC7ObCMZHrR
 wjqVXwnolynHFMi/8/NcBDG9DzoXCYAHJlDJF5a52hE68C+AxyZAZyHu1l77Sna2f7W6
 ArqT6ZmAERlw3eJypY8ImRbpaNxT6cyQEjrt18pkxW7nFAy8kTeiNmfSNvcTfM+glLlV
 kkIByezr5vUIi8BT96LQa6bDJkFureSxN5z+CGbtrS9OyoJ6fWIIAvj6Jra4tGktnYiV
 cGqw==
X-Gm-Message-State: AGi0PuYrulovt8YCSsrHeUJLJ65H221coxe5IEeSKexcqd4EBhRfK4UD
 74Vw4Frr7wb2sbo/keKkUtYXPE+kDETeBxE189g=
X-Google-Smtp-Source: APiQypKW+LGJyMN2AQQBOOaMGrVmWStW0yUDspSnX9w4OhEvQa9sFZCIWMPZ55dV5QuosV//eiHyByXK9cFMu29fPPA=
X-Received: by 2002:ab0:6946:: with SMTP id c6mr5308103uas.85.1586816588194;
 Mon, 13 Apr 2020 15:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-23-f4bug@amsat.org>
In-Reply-To: <20200412223619.11284-23-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:14:52 -0700
Message-ID: <CAKmqyKNpyobujx0_piqmuBf40MLspKjkX64QVenAz6pSEN1uHw@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 22/24] hw/riscv/sifive_u: Store MemoryRegion in
 SiFiveUSoCState
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::944
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 12, 2020 at 3:52 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Coccinelle reported:
>
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/riscv/sifive_u.c
>   >>> possible moves from riscv_sifive_u_soc_init() to riscv_sifive_u_soc=
_realize() in ./hw/riscv/sifive_u.c:473
>
> While reviewing we notice storing the MemoryRegion in the device
> state, we'll be able to later automatically simplify the error
> propagation calls.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/riscv/sifive_u.h |  2 ++
>  hw/riscv/sifive_u.c         | 10 ++++------
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 82667b5746..254c6a64f8 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -42,6 +42,8 @@ typedef struct SiFiveUSoCState {
>      SiFiveUPRCIState prci;
>      SiFiveUOTPState otp;
>      CadenceGEMState gem;
> +    MemoryRegion mask_rom;
> +    MemoryRegion l2lim_mem;
>  } SiFiveUSoCState;
>
>  #define TYPE_RISCV_U_MACHINE MACHINE_TYPE_NAME("sifive_u")
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 754af19eef..96177c1977 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -478,8 +478,6 @@ static void riscv_sifive_u_soc_realize(DeviceState *d=
ev, Error **errp)
>      SiFiveUSoCState *s =3D RISCV_U_SOC(dev);
>      const struct MemmapEntry *memmap =3D sifive_u_memmap;
>      MemoryRegion *system_memory =3D get_system_memory();
> -    MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
> -    MemoryRegion *l2lim_mem =3D g_new(MemoryRegion, 1);
>      qemu_irq plic_gpios[SIFIVE_U_PLIC_NUM_SOURCES];
>      char *plic_hart_config;
>      size_t plic_hart_config_len;
> @@ -503,10 +501,10 @@ static void riscv_sifive_u_soc_realize(DeviceState =
*dev, Error **errp)
>                               &error_abort);
>
>      /* boot rom */
> -    memory_region_init_rom(mask_rom, OBJECT(dev), "riscv.sifive.u.mrom",
> +    memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.u.mr=
om",
>                             memmap[SIFIVE_U_MROM].size, &error_fatal);
>      memory_region_add_subregion(system_memory, memmap[SIFIVE_U_MROM].bas=
e,
> -                                mask_rom);
> +                                &s->mask_rom);
>
>      /*
>       * Add L2-LIM at reset size.
> @@ -517,10 +515,10 @@ static void riscv_sifive_u_soc_realize(DeviceState =
*dev, Error **errp)
>       * leave it enabled all the time. This won't break anything, but wil=
l be
>       * too generous to misbehaving guests.
>       */
> -    memory_region_init_ram(l2lim_mem, NULL, "riscv.sifive.u.l2lim",
> +    memory_region_init_ram(&s->l2lim_mem, NULL, "riscv.sifive.u.l2lim",
>                             memmap[SIFIVE_U_L2LIM].size, &error_fatal);
>      memory_region_add_subregion(system_memory, memmap[SIFIVE_U_L2LIM].ba=
se,
> -                                l2lim_mem);
> +                                &s->l2lim_mem);
>
>      /* create PLIC hart topology configuration string */
>      plic_hart_config_len =3D (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) *
> --
> 2.21.1
>
>

