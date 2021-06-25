Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1E13B453E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:04:50 +0200 (CEST)
Received: from localhost ([::1]:48722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmRt-0006z6-HA
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwmQu-0005jX-Dc
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:03:48 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwmQs-0004TU-04
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:03:47 -0400
Received: by mail-pl1-x62e.google.com with SMTP id h1so4784147plt.1
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nxqoZzzBlupf43nY0FxUiu3uici9/zvGKxmLdlOxjfQ=;
 b=rzsu6xoUmqJ53GPVZux31H/VWy6AhzP5GPSaD5UN4aYN1tfxfd70PwqRiQaVq5746R
 Y4iWHioS/Z0ajmLaWAzj4ITYA5dOACViP1Z8/VmFlACQtfMK9APZtiJzUWElk+ULX1OM
 gCHfCh2vWPEifFkGmar3MkO+ehGCNjoL1Uzc97lICr8IMnh+/PDt9HfomspnyosnTvgc
 b2U9k4tfagFCKkQxx4i4YPeUbflI64+WjpgIG712IkWDeBjcxetcnMzUoHk0ItWxFRXj
 TarrX5NmBIVcapWY2nOlBHOtMG/I5of5aXmo1mi7VHEAlNl7Acp5r/D4c1+56Ywqw4Td
 2UXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nxqoZzzBlupf43nY0FxUiu3uici9/zvGKxmLdlOxjfQ=;
 b=fe7fclI8YO2DvxaPB5EQdFeW0ynHyO5E7sTIoeMc+U++NiLsv4J17e4dvmFnFUkfcd
 G/nLp9RhiZOk29yAArSoS595kgjA4xbwvcb2uIiV3Zo9kHFCo2RkWFnTyPhGNsvSsDOt
 kb7D9uP47cwwe2EMxegZKUWzTCSOQeYb43AoyHphFn1Ex9uQmxl2JpL9YhIF9tzh+9Oz
 QBgaWrQGj7Js9Sng4b1sDdLjp4KCJ3UCjbcQpDOvdwqWWWzThcfEuyfwHvGxuOVLVLiy
 7sGa+1JS80tf2c3W+h123M5UEZdjBsXpmFAXEhRxLadMRCKZoyWjZBLWepezuhZsVDsC
 7N3A==
X-Gm-Message-State: AOAM531trxa3mAj9eGRFvwNmz2BiNufhR4q2TYfJX88WyzLDA+EES3QT
 P4QpeT6wehOMKr2KKV0pkXngnqXmo8LQKI4vW1FtqjMoA9nRa7je
X-Google-Smtp-Source: ABdhPJyxHa1XJHbfbH2SA2aWSn+OyMwWlyL+1CWNolPqFGZHJUrtZ6ZPm+kPLirnTQjLRa7gQXn+KLh6UaHAsIdYHlw=
X-Received: by 2002:a17:902:aa4a:b029:10e:f98c:2b83 with SMTP id
 c10-20020a170902aa4ab029010ef98c2b83mr9219387plr.62.1624629824254; Fri, 25
 Jun 2021 07:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210625111842.3790-1-maxim.uvarov@linaro.org>
 <20210625111842.3790-2-maxim.uvarov@linaro.org>
 <CAFEAcA9Q9kc2-8h5xprg1FsKf3F7Uo7DaxMftecWgZFFoWYWXw@mail.gmail.com>
In-Reply-To: <CAFEAcA9Q9kc2-8h5xprg1FsKf3F7Uo7DaxMftecWgZFFoWYWXw@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Fri, 25 Jun 2021 17:03:33 +0300
Message-ID: <CAD8XO3ZdgseJUWhTLahOfatOFXEi=h-3GHhoXkX7a7eyU_tfeA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm/virt: fix irq mapping for gpio_pwr
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 at 14:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 25 Jun 2021 at 12:18, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > Fix irq mapping for virt machine reboot and shutdown
> > interrupts triggered from ATF code.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  hw/arm/virt.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 4b96f06014..d83f4ebdd3 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -846,8 +846,8 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
> >                             "gpios", phandle, 3, 0);
> >  }
> >
> > -#define SECURE_GPIO_POWEROFF 0
> > -#define SECURE_GPIO_RESET    1
> > +#define SECURE_GPIO_POWEROFF 1
> > +#define SECURE_GPIO_RESET    2
>
> I don't understand why this is needed. QEMU counts its GPIO
> lines from 0 for the PL061, so wiring up lines 1 and 2
> should be no different from using lines 0 and 1 (either way,
> we tell the guest what lines to use in the device tree).
>
> -- PMM

For now we do not tell in the device tree. It's pin 0 for poweroff and
pin 1 for reboot;
https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/qemu/qemu/include/platform_def.h#L94
https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/qemu/common/qemu_pm.c#L211

But to answer the question why 0 and 1 do not work and 1 and 2 works I
need to do some debugging on pl061 or qemu interrupt code.

Regards,
Maxim.

