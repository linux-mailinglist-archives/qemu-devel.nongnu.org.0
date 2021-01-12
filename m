Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD18A2F2F6B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:55:43 +0100 (CET)
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJD4-0006W4-Rf
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:55:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzJBl-0005qy-57; Tue, 12 Jan 2021 07:54:21 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:41295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzJBj-0005M9-Ip; Tue, 12 Jan 2021 07:54:20 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id w127so2047895ybw.8;
 Tue, 12 Jan 2021 04:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+V9p+fDZKLSr4OjbB1jdKf4hhGBIxJJobfGwO2itWTY=;
 b=Ao49IdWdnADQjgMqngoiBjUqE+JPTv9BE9GK+9Q2itm2OOXJ8WD4wzdGm4aDbLk6v5
 DAxcJBn2tmUWJ9riR4Wp6fM1RR1JkIsYWEYSEhXPqQ+HEVIjyF9oO/+9i7aUairvfRCR
 Y9bVXJ6g3MgCK/Ujt2BRX9se8ts/wh1iEVergiE+iNiQrBuaRbBIyNu46tmi//nomt+3
 4Hdran5oeSr8VT9x5NUSGoOOeJ0BsMO5wNnOWQF7ELDUAWp4WlMDpZN6djZkfzwPfPjU
 /Z2kOM57mjsVXmJCEdWJRSaJmOUE53xNVlJYr307+8s+lWhwpYeHThhg+XKGzTALjJtY
 H+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+V9p+fDZKLSr4OjbB1jdKf4hhGBIxJJobfGwO2itWTY=;
 b=bmGgiqxIOUjie2bf5Cr4lXbjA/3nTx6Si8nH2LdbDOkUfyty7kbx3ONjeOBwNpqxej
 9nJlZmsRB+iwKFtJEi3gSjoCgpy7ZFrlrxJAWor87ziJLIHp0vnjkh/EWpns9Jr5t3TZ
 UFOULRsCJNKdub5+Af9rx1JKkGK/dQvNwwF/LB+QYShHgZMfhX8W+Ka/InuurJ63lnQy
 2iZ8E4u9HMAvsVMes4YQ/O4uhVpsVnFwrT8BRhX/dKKWvcQiGXr7kvRakwrrIxLFIf3z
 C5Q60cXY+aTMqhH5/VKiImx7eq0sizlexkVb1RKIV/LurZrN8WmvM6cG9pj+6CSQCIk4
 CVYg==
X-Gm-Message-State: AOAM531Xp9ePi75asXbq6YNe6GUyVSXhFj8ZcpNQguOyQt6Z0zxLcHQF
 6p1o8IvPrY2mpiaEPWtjn30brI9sNi66Ul2iebI=
X-Google-Smtp-Source: ABdhPJxLo++A+5/7DZ2t+kTXFA5/IFYGg+Q6xfzVt2c7e9+G48xMdwysEKSi+zIUu32vcnQ0Hr8IiVf1Yn69XECkQso=
X-Received: by 2002:a25:690b:: with SMTP id e11mr6418052ybc.314.1610456058206; 
 Tue, 12 Jan 2021 04:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
 <20210110081429.10126-3-bmeng.cn@gmail.com>
 <CAFEAcA8W8vxA8AJY-Ka+--drv_asw5soaFNO90VzVENApMMH0w@mail.gmail.com>
In-Reply-To: <CAFEAcA8W8vxA8AJY-Ka+--drv_asw5soaFNO90VzVENApMMH0w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 12 Jan 2021 20:54:07 +0800
Message-ID: <CAEUhbmW2NaTNusZ123D7FPAK6uJZtCuak=UOtEE6Nc5fNfnsHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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

On Tue, Jan 12, 2021 at 6:49 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 10 Jan 2021 at 08:15, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Usually the approach is that the device on the other end of the line
> > is going to reset its state anyway, so there's no need to actively
> > signal an irq line change during the reset hook.
> >
> > Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
> > imx_spi_hard_reset() that is called when the controller is disabled.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v4:
> > - adujst the patch 2,3 order
> > - rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusion
> >
> > Changes in v3:
> > - new patch: remove imx_spi_update_irq() in imx_spi_reset()
> >
> >  hw/ssi/imx_spi.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > index e605049a21..2c4c5ec1b8 100644
> > --- a/hw/ssi/imx_spi.c
> > +++ b/hw/ssi/imx_spi.c
> > @@ -241,11 +241,16 @@ static void imx_spi_reset(DeviceState *dev)
> >      imx_spi_rxfifo_reset(s);
> >      imx_spi_txfifo_reset(s);
> >
> > -    imx_spi_update_irq(s);
> > -
> >      s->burst_length = 0;
> >  }
> >
> > +static void imx_spi_hard_reset(IMXSPIState *s)
> > +{
> > +    imx_spi_reset(DEVICE(s));
> > +
> > +    imx_spi_update_irq(s);
> > +}
> > +
> >  static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
> >  {
> >      uint32_t value = 0;
> > @@ -351,8 +356,9 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
> >          s->regs[ECSPI_CONREG] = value;
> >
> >          if (!imx_spi_is_enabled(s)) {
> > -            /* device is disabled, so this is a reset */
> > -            imx_spi_reset(DEVICE(s));
> > +            /* device is disabled, so this is a hard reset */
> > +            imx_spi_hard_reset(s);
> > +
> >              return;
> >          }
>
> The function of the code is correct, but you seem to have the function
> naming backwards here. Generally:
>  * soft reset == the reset triggered by the register write
>  * hard reset == power-on reset == the dc->reset function
>
> I think this is what Philippe was trying to say.

Philippe said: "Hmm usually hard reset include soft reset."

Since we are moving imx_spi_update_irq() out of imx_spi_reset() to a
new function called imx_spi_soft_reset() (what I did in v3), that
confused him (and I felt the same thing), so I renamed
imx_spi_soft_reset() to imx_spi_hard_reset() in v4..

Regards,
Bin

