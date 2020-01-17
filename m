Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BD6140B99
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 14:51:45 +0100 (CET)
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isS2J-0004Mx-Iy
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 08:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51036)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isRz3-0002Fu-S2
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:48:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isRz2-0002xp-Kl
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:48:21 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44167)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isRz2-0002v6-E9
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:48:20 -0500
Received: by mail-oi1-x241.google.com with SMTP id d62so22160592oia.11
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 05:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8rJJ11zKAnCxLPJdTkuCFT0idGhjpwtf3W0G6yikRvc=;
 b=LgqA4PWNstFMAgGotuGAycqrEN6eahf2LL0OR3K5KgPFgVxg8qIV5zexb+uKlN7i77
 zG6hDhzT7eq86Wh/NOxieLaoF82w4zPKpOaAok6JzMs2rsMeJ5H9RGOFuuPCdx1AJuW1
 ATEKx+ov7hlXJvxfxPpu8sE4H1yYUCKQHQsENAFWC0E/+3C5VAZvk8QQLu6TZv1Iq9pC
 KGhyhAHGvdBqneK9FuzH+ZlBzVqu5/NVmAbCn945EU6aHkhuzO+wQZPaWuNhYcXGGiRc
 /3M/pRZfJpmo4BE8lOz6+A5ddLtaOnsMz6/7xv66nLowlhvT1Y/j0Vo9moIDeUZ5zDZZ
 LGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8rJJ11zKAnCxLPJdTkuCFT0idGhjpwtf3W0G6yikRvc=;
 b=JHNfAh0xoCnE42VQnVaFC8iR/VDeO2oyhwFZo7Xo+lLlsP41mbFzhb6T4drT1ZC3e6
 Ck6PvstkzYc+efhnGE1wnAOvVzl6KrRO/lNNA//x3v2uLsXM2rIu8o5nsC946s/eYkAt
 BOkvHzD9ERKFoQD1dkLai4h1U9bT0Q9poWD2qaljEETW3Zo6SP61rLgF8l+jL8p0Ygqb
 dtIp3mmn7jxLgIY9RRqzKzBIW52yzBW9FMINGcQUkIDtlg/78n+S+jQVevkT6wXyu334
 OfaJ+MEVHyUP3/4NPIOwSVe8veOUfcLU7Kto0JzQNqiHdF6F7T9qR4HsMuYSuW+h2uDy
 uK5g==
X-Gm-Message-State: APjAAAX7G50AYEno/CnZMVfgmY9jzveXNrvldvZd+GoIRqeRHLqVAHBJ
 uD3ptzZGxkdaKFFNoLNc8UD2lkOC1oClgAJ4afrZIQ==
X-Google-Smtp-Source: APXvYqxpdr7mcmlKLHlz6ejeZyaGg89gNnxKOaffrz03F4dBZoKakDMk3W6C73XCxC2E8srPhS9ytDoLo+MLIaVwTG4=
X-Received: by 2002:aca:570d:: with SMTP id l13mr3363950oib.146.1579268896810; 
 Fri, 17 Jan 2020 05:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-7-linux@roeck-us.net>
In-Reply-To: <20200110203942.5745-7-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 13:48:06 +0000
Message-ID: <CAFEAcA_v98GcR06PWfm+=VnteQN_Q7iKK4wobAg6NrVSP1AyDg@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Jan 2020 at 20:39, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The Exynos4210 serial driver uses an interrupt line to signal if receive
> data is available. Connect that interrupt with the DMA controller's
> 'peripheral busy' gpio pin.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/exynos4210.c | 39 ++++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index c7b5c587b1..498d79ebb2 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -166,8 +166,8 @@ static uint64_t exynos4210_calc_affinity(int cpu)
>      return (0x9 << ARM_AFF1_SHIFT) | cpu;
>  }
>
> -static void pl330_create(uint32_t base, qemu_irq irq, int nreq, int nevents,
> -                         int width)
> +static DeviceState *pl330_create(uint32_t base, qemu_irq irq, int nreq,
> +                                 int nevents, int width)
>  {
>      SysBusDevice *busdev;
>      DeviceState *dev;
> @@ -191,6 +191,7 @@ static void pl330_create(uint32_t base, qemu_irq irq, int nreq, int nevents,
>      for (i = 0; i < nevents; i++) {
>          sysbus_connect_irq(busdev, i + 1, irq); /* event irq lines */
>      }
> +    return dev;
>  }
>
>  static void exynos4210_realize(DeviceState *socdev, Error **errp)
> @@ -199,7 +200,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
>      MemoryRegion *system_mem = get_system_memory();
>      qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
>      SysBusDevice *busdev;
> -    DeviceState *dev;
> +    DeviceState *dev, *uart[4], *pl330[3];

Rather than having the uart and pl330 pointers be locals,
they should be fields in Exynos4210State. (Otherwise technically
we leak them, though this is unnoticeable in practice because there's
no way to destroy an Exynos4210State.)

Patch looks good otherwise.

thanks
-- PMM

