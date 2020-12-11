Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6A82D6FFD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 07:09:21 +0100 (CET)
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knbcF-00055X-PW
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 01:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knbai-0004YG-5O; Fri, 11 Dec 2020 01:07:44 -0500
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:40489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knbaa-0002Eq-1D; Fri, 11 Dec 2020 01:07:43 -0500
Received: by mail-yb1-xb44.google.com with SMTP id t13so6950265ybq.7;
 Thu, 10 Dec 2020 22:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TrbBaplUB2sJwNdN+L06jRi0oIGjxw7QMD+EdX1NGN4=;
 b=suGycHS2ZX105Jl5UATvNumzOEcyQdXOiMP1XtqeZ44Q3T2Lu6jbMrQ9Q/dz25GsjL
 Bcw2Y6zkqIU1cGlEER5InyOVH4WNafdznjn+CasJOeNc6PjcnUH1eKfgmIxBn0EjPEk7
 Ujpl8iK7MO820adDbMc4rArn+RMgWk7j1J+4wMkK3IAs+cE1gnLXZ9YlGtDTBL7Vd+3O
 VO4LHoaP2HqPM78jcdTrlKMU3jgOqAfozEtqwL+6oSd0MSLub8+nFXZEXHvFBlgRMQBz
 Ac5ILsXR5paB8JmpOXXlPzUWj5tJHrHaXSmTuO+aqQ3qxwTYVTSLBqKwfjMwGzpDwbKa
 cptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TrbBaplUB2sJwNdN+L06jRi0oIGjxw7QMD+EdX1NGN4=;
 b=ivhSt6Z0myp4AOZ6qXZXcLmwmorRJswG7fRDE0RsYPswrhs2l2Uhi+l4EWyMiCPRK6
 Y9n7Dy/joiCh7jwwr+FEA3cH5G1O9jFy7izTdNjcFRQe4kivkA03e7y7OyQdwH7O30FO
 a6DTY45pJdKmGcVtUzkw/4g1soEnxbBqq1fRRJxr4i1e1NBLYxO0zWn8cPvH11Y3TDX1
 c3OkFFbdDlmBJot+uVe3V3y5SpIKGhcuWDSL7xvubyc2W6gHV/GkhxEm9PKBiJegmZnx
 mjHaS5oo5mpYdymC1RRRuQSxnNTcT15K5LGbAosoxBtX9OXr7bkdEwt+psrV1hv6+EAD
 BXJA==
X-Gm-Message-State: AOAM530EXPka3kziGA2YSav9IzBA6hZ695YHf9m5T/LuTT3W8o4v2VW5
 p+4y44GZ+hmun/WjrlBv5+q3mxIeMuXw/ndyybY=
X-Google-Smtp-Source: ABdhPJwFfkB1ZKbTghbCL6ikVPP+sPQ/xS9TK9gE5Rzsq2g9CzVOhDQtRosxMuSlSfNW1hai45/8u6UVowDfj8dO/+k=
X-Received: by 2002:a25:be87:: with SMTP id i7mr16080060ybk.332.1607666852506; 
 Thu, 10 Dec 2020 22:07:32 -0800 (PST)
MIME-Version: 1.0
References: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
 <20201203083759.GA2661@fralle-msi>
 <CAEUhbmVkF9W12o04JnYofLLWwTfnNBJDnC+_8iZvdgnyonMYag@mail.gmail.com>
 <20201204104652.GA16865@fralle-dell>
 <CAEUhbmWAFf2sJLfb4i5JxhQgT88cVf54AzREuGrn+0C17ShxoQ@mail.gmail.com>
 <20201204112847.GA16964@fralle-dell>
In-Reply-To: <20201204112847.GA16964@fralle-dell>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 11 Dec 2020 14:07:21 +0800
Message-ID: <CAEUhbmVo268ks+t1tLBcNLFYs4DAM6hexhYzXx=2B+YU31kR3w@mail.gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Francisco,

On Fri, Dec 4, 2020 at 7:28 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hello Bin,
>
> On [2020 Dec 04] Fri 18:52:50, Bin Meng wrote:
> > Hi Francisco,
> >
> > On Fri, Dec 4, 2020 at 6:46 PM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Hello Bin,
> > >
> > > On [2020 Dec 04] Fri 15:52:12, Bin Meng wrote:
> > > > Hi Francisco,
> > > >
> > > > On Thu, Dec 3, 2020 at 4:38 PM Francisco Iglesias
> > > > <frasse.iglesias@gmail.com> wrote:
> > > > >
> > > > > Hi Bin and Alistair,
> > > > >
> > > > > On [2020 Dec 02] Wed 11:40:11, Alistair Francis wrote:
> > > > > > On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > > >
> > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > >
> > > > > > > SST flashes require a dummy byte after the address bits.
> > > > > > >
> > > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > >
> > > > > > I couldn't find a datasheet that says this... But the actual code
> > > > > > change looks fine, so:
> > > > > >
> > > > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > >
> > > > > > Alistair
> > > > > >
> > > > > > > ---
> > > > > > >
> > > > > > >  hw/block/m25p80.c | 3 +++
> > > > > > >  1 file changed, 3 insertions(+)
> > > > > > >
> > > > > > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > > > > > index 483925f..9b36762 100644
> > > > > > > --- a/hw/block/m25p80.c
> > > > > > > +++ b/hw/block/m25p80.c
> > > > > > > @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
> > > > > > >      s->needed_bytes = get_addr_length(s);
> > > > > > >      switch (get_man(s)) {
> > > > > > >      /* Dummy cycles - modeled with bytes writes instead of bits */
> > > > > > > +    case MAN_SST:
> > > > > > > +        s->needed_bytes += 1;
> > > > >
> > > > > 1 dummy clk cycle is modelled as 1 byte write (see the comment above), so 1
> > > > > dummy byte (8 dummy clk cycles) will need +8 above.
> > > >
> > > > I think you were confused by the WINBOND codes. The comments are
> > > > correct. It is modeled with bytes instead of bits, so we should +=1.
> > >
> > > What the comment says is (perhaps not superclear) that 1 dummy clock cycle
> > > is modeled as one 1 byte write into the flash (meaining that 8 byte writes
> > > are needed for 1 dummy byte). Perhaps it is easier to understand
> > > looking into how the controllers issue the command towards the flash model
> > > (for example the xilinx_spips), the start of the FAST_READ cmd is issued
> > > as writing the following into the flash: 1 byte (cmd), 3 bytes (address),
> > > 8 bytes (8 dummy cycles -> 1 dummy byte).
> > >
> >
> > My interpretation of the comments are opposite: one cycle is a bit,
> > but we are not using bits, instead we are using bytes.
>
> Yes, the mentioning of 'bits' in the comment makes it not very clear at first read.
> Maybe just bellow would have been better:
>
> /* Dummy clock cycles - modeled with bytes writes */
>
> >
> > Testing shows that +=1 is the correct way with the imx_spi controller,
> > and with my SiFive SPI model in my local tree (not upstreamed yet)
>
> Perhaps an option could be to look into how the aspeed_smc, xilinx_spips or the
> npcm7xx_fiu generate dummy clock cycles and see if a similar solution to one of
> those could work aswell for the imx_spi?
>

Thanks for pointing this out. So there is some inconsistency among
different SPI controller modeling.

Or maybe fixing aspeed_smc, xilinx_spips and npcm7xx_fiu to work like
imx_spi? Which one is the expected behavior for dummy cycles?

> Regarding this patch, with += 8 it looks correct to me (and will work with
> above controllers as far as I can see).
>

Regards,
Bin

