Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F701FFE9A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 01:28:57 +0200 (CEST)
Received: from localhost ([::1]:43426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jm3xo-0007SS-Gx
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 19:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jm3wn-0006ho-EU; Thu, 18 Jun 2020 19:27:53 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:39724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jm3wi-0000VC-Ki; Thu, 18 Jun 2020 19:27:53 -0400
Received: by mail-il1-x142.google.com with SMTP id p5so7659564ile.6;
 Thu, 18 Jun 2020 16:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pTElCFey18Ru5XGzvnggSJ6W0YVsd3lhuBWjCi/cAn0=;
 b=bYGqgJvp55ZOMgQtBx/3EFE9V7U2sgkTW+qqfgLU6f/0kG0XetXnjFuDYODhI3gPOo
 eezi+uUD7ZHqp724+FrYwUrF2r/P2ZJPYjar87XchP+Z9yQxEKCWSu6rrXqQfpfzEDeo
 0v0dl6/RXTYOCfY6s1jfVpRY3nFd+pIcm3DvAvnwpi6Abvtg2YOfTC2GldgqQiCCF9dO
 8igk9naz2miqM/K049S7qFOcXU4Om+ULsr23uzH55eNnU0TSX5+hMW0wyCLiDDbt2NB0
 iomVAp2D9VFe6VsR3psrlMeUsQtdJmNeyq70RFLcjFDw6bosRx4Zo9sAPyzpYXtwkdjs
 HokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pTElCFey18Ru5XGzvnggSJ6W0YVsd3lhuBWjCi/cAn0=;
 b=CtB/4B0smjRVfIZ+yyTZdTLmUQPvndISM42bKvkXZ9YRrn0+mitFaYu/JTbZYKSwGb
 VXOO/fPIFNCqgR2jpTbVZCc/D4DDA0HVQ0hZMK+xtVkTtCBt+Mjs3q2C53HMdGc1Vc+d
 13iv8yP1UHggu9jFO0s18wBav4rFdclb6oD6tdcsx9PNwTxHwpQH29FLb4joaSQSIbEe
 KAY3XDbd8BOhJ4Ax1yaKzxs7eATxemTbVEoGwVim3IB/mOfB2FoKyH9tmmTIYWv8GX2h
 aj7+te4b4+mv4vRWtryV25Sy1Y/fbMD0FoQkzhPA8/BOD+3e4OpA8G9R16IxvKzj5M9N
 s8eQ==
X-Gm-Message-State: AOAM531uSlsyuXpfvMet/xEj8E3pGoyHXhpsXR6uNhjsp8zbK4GDhv40
 dxEdhyfkiDCz+LOCqE7Att4kWy6ODrVQq+pFrWg=
X-Google-Smtp-Source: ABdhPJwlcUbE4+apAGQZGuES5psfg3gfIy9Km7ecgmShOTYZrvXfXpK9HxMUf5ggCtSlLestfgzIT9Lux+cBtugrpiw=
X-Received: by 2002:a92:c94b:: with SMTP id i11mr963059ilq.177.1592522867172; 
 Thu, 18 Jun 2020 16:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKPOSdgnWfCR40jXC6qQjeeEr8rfzQaez+Ce92CZstz_aw@mail.gmail.com>
 <mhng-1811460a-33f1-4c92-a74e-bdb56605da62@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-1811460a-33f1-4c92-a74e-bdb56605da62@palmerdabbelt-glaptop1>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Jun 2020 16:18:20 -0700
Message-ID: <CAKmqyKMKF9QDFthRqLRQTziKNka5oJjcmYebyiR71y019AHE1g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] sifive_e: Support the revB machine
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 18, 2020 at 3:42 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 10 Jun 2020 15:13:49 PDT (-0700), alistair23@gmail.com wrote:
> > On Thu, May 28, 2020 at 11:13 AM Alistair Francis <alistair23@gmail.com> wrote:
> >>
> >> On Thu, May 21, 2020 at 8:57 AM Alistair Francis <alistair23@gmail.com> wrote:
> >> >
> >> > On Wed, May 20, 2020 at 4:08 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >> > >
> >> > > On Thu, 14 May 2020 13:47:10 PDT (-0700), Alistair Francis wrote:
> >> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> > > > ---
> >> > > >  hw/riscv/sifive_e.c         | 35 +++++++++++++++++++++++++++++++----
> >> > > >  include/hw/riscv/sifive_e.h |  1 +
> >> > > >  2 files changed, 32 insertions(+), 4 deletions(-)
> >> > > >
> >> > > > diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> >> > > > index 472a98970b..cb7818341b 100644
> >> > > > --- a/hw/riscv/sifive_e.c
> >> > > > +++ b/hw/riscv/sifive_e.c
> >> > > > @@ -98,10 +98,14 @@ static void riscv_sifive_e_init(MachineState *machine)
> >> > > >          memmap[SIFIVE_E_DTIM].base, main_mem);
> >> > > >
> >> > > >      /* Mask ROM reset vector */
> >> > > > -    uint32_t reset_vec[2] = {
> >> > > > -        0x204002b7,        /* 0x1000: lui     t0,0x20400 */
> >> > > > -        0x00028067,        /* 0x1004: jr      t0 */
> >> > > > -    };
> >> > > > +    uint32_t reset_vec[2];
> >> > > > +
> >> > > > +    if (s->revb) {
> >> > > > +        reset_vec[0] = 0x200102b7;        /* 0x1000: lui     t0,0x20010 */
> >> > > > +    } else {
> >> > > > +        reset_vec[0] = 0x204002b7;        /* 0x1000: lui     t0,0x20400 */
> >> > > > +    }
> >> > > > +    reset_vec[1] = 0x00028067;        /* 0x1004: jr      t0 */
> >> > > >
> >> > > >      /* copy in the reset vector in little_endian byte order */
> >> > > >      for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
> >> > > > @@ -115,8 +119,31 @@ static void riscv_sifive_e_init(MachineState *machine)
> >> > > >      }
> >> > > >  }
> >> > > >
> >> > > > +static bool sifive_e_machine_get_revb(Object *obj, Error **errp)
> >> > > > +{
> >> > > > +    SiFiveEState *s = RISCV_E_MACHINE(obj);
> >> > > > +
> >> > > > +    return s->revb;
> >> > > > +}
> >> > > > +
> >> > > > +static void sifive_e_machine_set_revb(Object *obj, bool value, Error **errp)
> >> > > > +{
> >> > > > +    SiFiveEState *s = RISCV_E_MACHINE(obj);
> >> > > > +
> >> > > > +    s->revb = value;
> >> > > > +}
> >> > > > +
> >> > > >  static void sifive_e_machine_instance_init(Object *obj)
> >> > > >  {
> >> > > > +    SiFiveEState *s = RISCV_E_MACHINE(obj);
> >> > > > +
> >> > > > +    s->revb = false;
> >> > > > +    object_property_add_bool(obj, "revb", sifive_e_machine_get_revb,
> >> > > > +                             sifive_e_machine_set_revb, NULL);
> >> > > > +    object_property_set_description(obj, "revb",
> >> > > > +                                    "Set on to tell QEMU that it should model "
> >> > > > +                                    "the revB HiFive1 board",
> >> > > > +                                    NULL);
> >> > > >  }
> >> > > >
> >> > > >  static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
> >> > > > diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> >> > > > index 414992119e..0d3cd07fcc 100644
> >> > > > --- a/include/hw/riscv/sifive_e.h
> >> > > > +++ b/include/hw/riscv/sifive_e.h
> >> > > > @@ -45,6 +45,7 @@ typedef struct SiFiveEState {
> >> > > >
> >> > > >      /*< public >*/
> >> > > >      SiFiveESoCState soc;
> >> > > > +    bool revb;
> >> > > >  } SiFiveEState;
> >> > > >
> >> > > >  #define TYPE_RISCV_E_MACHINE MACHINE_TYPE_NAME("sifive_e")
> >> > >
> >> > > IIRC there are way more differences between the un-suffixed FE310 and the Rev
> >> > > B, specifically the interrupt map is all different.
> >> >
> >> > The three IRQs that QEMU uses for the SiFive E (UART0, UART1 and GPIO)
> >> > all seem to be the same.
> >>
> >> Ping!
> >
> > Ping^2
> >
> > Applying to RISC-V tree.
>
> They're not: uart0 is interrupt 3 on the rev b but 5 on the non-rev b (which
> they don't call rev a but I'm going to :)).  There's isn't even a uart1 in the
> DTS on the rev a, and the GPIO interrupts are different as well.
>
> The DTS files are in SiFive's SDK:
>
> https://github.com/sifive/freedom-e-sdk/blob/master/bsp/sifive-hifive1-revb/core.dts
> https://github.com/sifive/freedom-e-sdk/blob/master/bsp/sifive-hifive1/core.dts
>
> which should also generate some test programs.  When I was there we tested on
> QEMU for the platforms that were supported, so there should be some support for
> doing so still.

I am reading the wrong data sheets?

For revB I looked at
https://sifive.cdn.prismic.io/sifive%2F9ecbb623-7c7f-4acc-966f-9bb10ecdb62e_fe310-g002.pdf,
page 46, table 26. The interrupts for the revB match what we currently
have in QEMU.

For revA https://sifive.cdn.prismic.io/sifive%2F500a69f8-af3a-4fd9-927f-10ca77077532_fe310-g000.pdf,
page 42, table 21 also matches what we have in QEMU.

To me it looks like both have two UARTs and both have the same
interrupt numbers.

The actual software I am running also hasn't changed UART interrupt
numbering between the two boards and UART interrupts are working
correctly.

Alistair

>
> >
> > Alistair
> >
> >>
> >> >
> >> > Alistair

