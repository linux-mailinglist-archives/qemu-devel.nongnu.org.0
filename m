Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF530776C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:49:53 +0100 (CET)
Received: from localhost ([::1]:39186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57gG-0002gE-DO
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l57db-0001o0-BV; Thu, 28 Jan 2021 08:47:07 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:34268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l57dZ-0006LC-M7; Thu, 28 Jan 2021 08:47:07 -0500
Received: by mail-yb1-xb35.google.com with SMTP id v200so5515638ybe.1;
 Thu, 28 Jan 2021 05:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PHspNHzClM8kdz38xYtmQHS4+REVO2x57FezXCH/BDY=;
 b=f2zk0rJ3y1T9Q5ofdFORrWHD2Eg1flxm9ae2fdqc3kTTx2hdAbtheSeHZ/EElg6Be5
 PrraepRJgssyG0krnl7gtpdIGEOQcQJ7HzGcN65lFi+e/sp840P4yMVVMDt3/TbPVqcg
 F7IUqcUFxkOAZ6jQ294iLxbrXPTzq8ibf2GQMW5euAu+AKvWS64izUgPosFOw5ng2EHj
 NSrnfw17tWQO4OuaD3/bRTrgpT4WstEn4jwYbU26YUMmTUhquDDH+/0qPQC9YmDmfatj
 IfmgDz+Pvr+WJ4wXe5K9hYk3Fi6LK7XEyvVId663HU0lUwSagqMtQzP9ORSpwsSYkby3
 OvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PHspNHzClM8kdz38xYtmQHS4+REVO2x57FezXCH/BDY=;
 b=NtVzUwUHaWBIyGNo7WxFD2x+Z+aOyu/3osxk3ldEHZ9/vGIQCEs/oG2ngNwRh8tz/E
 WvVYeTSJvGrF/vRtfSM8SGIQSajk/cr7G8x6GgKLNL5In77b7Mlj7BZdD3OlygC2rjLU
 7UWWHGeI7EZkP6ocAfAIdymraRdUcup7HKZFqJmk25oiftTmMzcnQWz6O9Eavh6nf4Sb
 7LjiSHUgbH2rIKlRPy48tbwbBy+hZIWNhDQJ7slqXB4H8BGIrDHgBmbIIxIcQJ2feOU6
 pcOWPHoljx8532SQhUCPKJPk9xeGoyr+5vEzWUrfd7bXaEA/dqHNnD97LRH3hYFAf0GN
 ZzmA==
X-Gm-Message-State: AOAM533ZGt2NYv4Rjt4vKN1XVshJ9eZBcS1tF9E1NrOm4vzoIWUOh1xY
 tNuX2scjs0tfz29LS+JzxsDRoU9/d2vteFgrDJg=
X-Google-Smtp-Source: ABdhPJzYgRi2ddthSpSvM4liEexLJ3YrxKRVu9RwTXJ0ej1rU8LqNcpbckQj74/Wbe3D+H33fOt1vGB3q5mKWbi+EpU=
X-Received: by 2002:a25:b8ca:: with SMTP id g10mr21873244ybm.517.1611841624163; 
 Thu, 28 Jan 2021 05:47:04 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
In-Reply-To: <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 28 Jan 2021 21:46:52 +0800
Message-ID: <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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

On Thu, Jan 28, 2021 at 9:43 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >
> > When the block is disabled, all registers are reset with the
> > exception of the ECSPI_CONREG. It is initialized to zero
> > when the instance is created.
> >
> > Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
> >      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>
> > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > index 8fb3c9b..c952a3d 100644
> > --- a/hw/ssi/imx_spi.c
> > +++ b/hw/ssi/imx_spi.c
> > @@ -231,12 +231,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >  static void imx_spi_reset(DeviceState *dev)
> >  {
> >      IMXSPIState *s =3D IMX_SPI(dev);
> > +    int i;
> >
> >      DPRINTF("\n");
> >
> > -    memset(s->regs, 0, sizeof(s->regs));
> > -
> > -    s->regs[ECSPI_STATREG] =3D 0x00000003;
> > +    for (i =3D 0; i < ARRAY_SIZE(s->regs); i++) {
> > +        switch (i) {
> > +        case ECSPI_CONREG:
> > +            /* CONREG is not updated on reset */
> > +            break;
> > +        case ECSPI_STATREG:
> > +            s->regs[i] =3D 0x00000003;
> > +            break;
> > +        default:
> > +            s->regs[i] =3D 0;
> > +            break;
> > +        }
> > +    }
>
> This retains the CONREG register value for both:
>  * 'soft' reset caused by write to device register to disable
>    the block
>    -- this is corrcet as per the datasheet quote
>  * 'power on' reset via TYPE_DEVICE's reset method
>    -- but in this case we should reset CONREG, because the Device
>    reset method is like a complete device powercycle and should
>    return the device state to what it was when QEMU was first
>    started.

The POR value of CONREG is zero, which should be the default value, no?

Regards,
Bin

