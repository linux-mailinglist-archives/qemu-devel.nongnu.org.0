Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247893EAE25
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 03:29:13 +0200 (CEST)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEM0W-0007Hz-7U
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 21:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mELzP-0005oy-1k; Thu, 12 Aug 2021 21:28:03 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mELzN-0003r5-Ic; Thu, 12 Aug 2021 21:28:02 -0400
Received: by mail-il1-x132.google.com with SMTP id x7so9153928ilh.10;
 Thu, 12 Aug 2021 18:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yMDTWfznyvEgw6u/Pl3jXQ9mHgCr8SCOf9kQD0WkbxY=;
 b=ARolOuUJp9W/LyPuGqC86Esdf7q3Taj1dPKjEfcgn7ZoiuAvowAnJLnyYFykMgaAow
 wLIGUIIwdPh0TE70qgD4SqPYkVfDZkOcVINMicm3OBUlChSvosT17PIBXGYmzd7fAJ41
 xWjzUWyj0l6iB+mlZzWsAylkgC7X5GzAlibkF6bJV/bwzYce6w84sfC9G4f+WPqv4Bv+
 oCuImqTN3WMlF1OdlkhTOtPP3SbbTeW0sCn0GDodEcf26lV1tFSQShTW+dISDhoLNVL4
 Fe9f1gNJBjCEa2TN9atpYu7+wcpXSzaweYNMf0OPPSLOzsAd5oXAuIvBCtMqj+UDxYuX
 bvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yMDTWfznyvEgw6u/Pl3jXQ9mHgCr8SCOf9kQD0WkbxY=;
 b=CTxWqQomeRCGbNejwJeQqq3oLugAgj1iyKLr4rF2pm0+5wYnMBt/WopbHyqJZUKaXg
 sjiRbDdijhLNjcRvJIFaXe6GwDOtp11YLZ4/z4OdhmQar+JoQ4Ik5InTtrOOCcAS+2ho
 hiA7TM7fKDRRexbQL62AUDyDKbwWg9ke/erJupZmRqviGh6b0Az9Hkdn05oJk4/QFbQc
 uxOyRY6u4w1GfWkzG05YHEqtywrH6EWgo3nyzEH4n+akGgsw2nNwcBEUe8j7PKywUoxR
 YUs3PR3IhXWzan8Q4w5peCywWu1Huhp7lAtq6ElL/5Rj9QeFIjbKlUmxSerL14LgVaa0
 gI9g==
X-Gm-Message-State: AOAM532IBd1dBQzdEbNzXvSY0Z+egLUQdxPlk34faK2fdGcvIJI9obk/
 pc8G0iwuJzIu3dfqRt6Vqlm2C2FrdvFXdhSTs/s=
X-Google-Smtp-Source: ABdhPJw+WCLUREj0pAUgtpzDZqgGRqwNH++H7GspH+Q+3JINjpyeGeM0hDM/MmMo3PJxhjPJBEFr1SQbSiPhaypSy/k=
X-Received: by 2002:a05:6e02:12c9:: with SMTP id
 i9mr979814ilm.131.1628818080019; 
 Thu, 12 Aug 2021 18:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-6-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-6-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 11:27:34 +1000
Message-ID: <CAKmqyKPxyihW9Rnup0i=FSQ6gnmpvSyYEfhN=OsQfYhY4mLP=A@mail.gmail.com>
Subject: Re: [PATCH for-6.2 05/25] hw/timer/armv7m_systick: Add input clocks
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 7:36 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The v7M systick timer can be programmed to run from either of
> two clocks:
>  * an "external reference clock" (when SYST_CSR.CLKSOURCE == 0)
>  * the main CPU clock (when SYST_CSR.CLKSOURCE == 1)
>
> Our implementation currently hardwires the external reference clock
> to be 1MHz, and allows boards to set the main CPU clock frequency via
> the global 'system_clock_scale'.  (Most boards set that to a constant
> value; the Stellaris boards allow the guest to reprogram it via the
> board-specific RCC registers).
>
> As the first step in converting this to use the Clock infrastructure,
> add input clocks to the systick device for the reference clock and
> the CPU clock.  The device implementation ignores them; once we have
> made all the users of the device correctly wire up the new Clocks we
> will switch the implementation to use them and ignore the old
> system_clock_scale.
>
> This is a migration compat break for all M-profile boards, because of
> the addition of the new clock objects to the vmstate struct.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/timer/armv7m_systick.h |  7 +++++++
>  hw/timer/armv7m_systick.c         | 10 ++++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
> index 685fc5bc0d7..38adf8d274e 100644
> --- a/include/hw/timer/armv7m_systick.h
> +++ b/include/hw/timer/armv7m_systick.h
> @@ -15,6 +15,7 @@
>  #include "hw/sysbus.h"
>  #include "qom/object.h"
>  #include "hw/ptimer.h"
> +#include "hw/clock.h"
>
>  #define TYPE_SYSTICK "armv7m_systick"
>
> @@ -25,6 +26,10 @@ OBJECT_DECLARE_SIMPLE_TYPE(SysTickState, SYSTICK)
>   *  + sysbus MMIO region 0 is the register interface (covering
>   *    the registers which are mapped at address 0xE000E010)
>   *  + sysbus IRQ 0 is the interrupt line to the NVIC
> + *  + Clock input "refclk" is the external reference clock
> + *    (used when SYST_CSR.CLKSOURCE == 0)
> + *  + Clock input "cpuclk" is the main CPU clock
> + *    (used when SYST_CSR.CLKSOURCE == 1)
>   */
>
>  struct SysTickState {
> @@ -38,6 +43,8 @@ struct SysTickState {
>      ptimer_state *ptimer;
>      MemoryRegion iomem;
>      qemu_irq irq;
> +    Clock *refclk;
> +    Clock *cpuclk;
>  };
>
>  /*
> diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
> index 2f192011eb0..e43f74114e8 100644
> --- a/hw/timer/armv7m_systick.c
> +++ b/hw/timer/armv7m_systick.c
> @@ -14,6 +14,7 @@
>  #include "migration/vmstate.h"
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
> +#include "hw/qdev-clock.h"
>  #include "qemu/timer.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> @@ -201,6 +202,9 @@ static void systick_instance_init(Object *obj)
>      memory_region_init_io(&s->iomem, obj, &systick_ops, s, "systick", 0xe0);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq);
> +
> +    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk", NULL, NULL, 0);
> +    s->cpuclk = qdev_init_clock_in(DEVICE(obj), "cpuclk", NULL, NULL, 0);
>  }
>
>  static void systick_realize(DeviceState *dev, Error **errp)
> @@ -215,9 +219,11 @@ static void systick_realize(DeviceState *dev, Error **errp)
>
>  static const VMStateDescription vmstate_systick = {
>      .name = "armv7m_systick",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>      .fields = (VMStateField[]) {
> +        VMSTATE_CLOCK(refclk, SysTickState),
> +        VMSTATE_CLOCK(cpuclk, SysTickState),
>          VMSTATE_UINT32(control, SysTickState),
>          VMSTATE_INT64(tick, SysTickState),
>          VMSTATE_PTIMER(ptimer, SysTickState),
> --
> 2.20.1
>
>

