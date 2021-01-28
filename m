Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D398E3077CC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:21:55 +0100 (CET)
Received: from localhost ([::1]:38282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58BG-00023w-FW
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l585A-0002r9-8K; Thu, 28 Jan 2021 09:15:36 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:40691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5858-0006M9-FT; Thu, 28 Jan 2021 09:15:35 -0500
Received: by mail-yb1-xb30.google.com with SMTP id w24so5575176ybi.7;
 Thu, 28 Jan 2021 06:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=88zMDvynYl+VCILBwZxGIJSVNOkBVvT44NtQ/W11vZg=;
 b=BpmpiMxCbvnplmXE1xZQBfb6/3INnLepE8WAvNyim44FTm5OStMuFQmHhfrbLXBELh
 wRZ5m3XUvHMq0/5Xq8XnI7WEsUCk57zynu3SP2mk3Y3rfjf1Ui4dg/7kP+d4CELUjy0d
 J76DI1aWbnINOHV8upP2mRtJe6hLRSYkQx104AHNdT/9LeUHv9W5RO6/umwpXJf3FUrZ
 CqfZuMv2QMqxww9q/biKAvplEm9q6yBFHD+NbUREf1hYSlvgcRAHCDP9W1hx1jm7b9NM
 FutT13wls0ZCdQlS7mJmMp70ONRTldrbPPYWy4c/iYad084+Mk2/YapVa3r67+w+QaJ2
 112w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=88zMDvynYl+VCILBwZxGIJSVNOkBVvT44NtQ/W11vZg=;
 b=JScarw8qQgMdEmFTGWkglPajaEFBOGax3+mJ5rFEqxxVImH58bBZ+zOGcS3CJ3wITr
 wiPFLGwXNRQUK2b8X4/u+Q8uIMVyvLFJr0DVmDqegx4oTHhav5zJH77nu30auySEsKE7
 JER2L2Jq8cawRICon9dduCXeFaRGaW+LcR06y61QRYBSW5blF1VX8UU7vf0GyP7u9oZU
 JYpIxTeHY2wSsHIcdo/dM2F21jPRxVXxnGeJaB82m3/78nwoEYt/zOtrl0/hlcSCvhY2
 9Ya8VgLniOG5vcUTfFuMb/cq8bY3RJcVM3MMRYNvxH74QYa3jKXGYSSYWdbMofdhdGgj
 RUBQ==
X-Gm-Message-State: AOAM5311y587CJgFrTb0ZxPyGNyA/1ruApEX+Egk1JpYGwnhoxfXJDhk
 xo0FQXGnpJK8AlxxPt3LdODtS1mr8rQgZNE4G7M=
X-Google-Smtp-Source: ABdhPJxqEueHgXs4OcTVtGw5h24FLCen/56aTpkkF8SU1gC+bIbiR19Yu60k49WyXJrKwF7NsdHiknKoO+mtt4Y263M=
X-Received: by 2002:a25:3bc5:: with SMTP id
 i188mr23867635yba.332.1611843332852; 
 Thu, 28 Jan 2021 06:15:32 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
 <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
 <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 28 Jan 2021 22:15:18 +0800
Message-ID: <CAEUhbmVqKxEoPxDBnAEwLb0614Ht7WO6dqeEBLWTNecSy+mYqA@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 9:54 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 28 Jan 2021 at 13:47, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Thu, Jan 28, 2021 at 9:43 PM Peter Maydell <peter.maydell@linaro.org=
> wrote:
> > >
> > > On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > >
> > > > When the block is disabled, all registers are reset with the
> > > > exception of the ECSPI_CONREG. It is initialized to zero
> > > > when the instance is created.
> > > >
> > > > Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
> > > >      chapter 21.7.3: Control Register (ECSPIx_CONREG)
> > >
> > > > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > > > index 8fb3c9b..c952a3d 100644
> > > > --- a/hw/ssi/imx_spi.c
> > > > +++ b/hw/ssi/imx_spi.c
> > > > @@ -231,12 +231,23 @@ static void imx_spi_flush_txfifo(IMXSPIState =
*s)
> > > >  static void imx_spi_reset(DeviceState *dev)
> > > >  {
> > > >      IMXSPIState *s =3D IMX_SPI(dev);
> > > > +    int i;
> > > >
> > > >      DPRINTF("\n");
> > > >
> > > > -    memset(s->regs, 0, sizeof(s->regs));
> > > > -
> > > > -    s->regs[ECSPI_STATREG] =3D 0x00000003;
> > > > +    for (i =3D 0; i < ARRAY_SIZE(s->regs); i++) {
> > > > +        switch (i) {
> > > > +        case ECSPI_CONREG:
> > > > +            /* CONREG is not updated on reset */
> > > > +            break;
> > > > +        case ECSPI_STATREG:
> > > > +            s->regs[i] =3D 0x00000003;
> > > > +            break;
> > > > +        default:
> > > > +            s->regs[i] =3D 0;
> > > > +            break;
> > > > +        }
> > > > +    }
> > >
> > > This retains the CONREG register value for both:
> > >  * 'soft' reset caused by write to device register to disable
> > >    the block
> > >    -- this is corrcet as per the datasheet quote
> > >  * 'power on' reset via TYPE_DEVICE's reset method
> > >    -- but in this case we should reset CONREG, because the Device
> > >    reset method is like a complete device powercycle and should
> > >    return the device state to what it was when QEMU was first
> > >    started.
> >
> > The POR value of CONREG is zero, which should be the default value, no?
>
> But you're not setting it to zero here, you're leaving it with
> whatever value it had before. (That's correct for soft reset,
> but wrong for power-on.)

I think that's ensured by object_initialize_with_type().

Regards,
Bin

