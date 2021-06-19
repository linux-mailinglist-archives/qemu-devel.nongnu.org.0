Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F863ADAF0
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 18:52:57 +0200 (CEST)
Received: from localhost ([::1]:49232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lueDI-00024W-HY
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 12:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lueCV-0001NO-Cu
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 12:52:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lueCS-0006uU-Tx
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 12:52:07 -0400
Received: by mail-wr1-x429.google.com with SMTP id a11so14436604wrt.13
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 09:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2ItnFWl/vUWGLjtvyCmJqIeVrNw8i3L6jnzb9jNbqL8=;
 b=RBPNjnopiUkWHuKTrEfAVpcNoan/Zj87ZhdJ8VOaPN/Fu/c48HvsnkPFRz9ydsH7Xe
 gbrsnDaQN+DGqcLT+n+0lll9a362ax7TBandIcmw9uAJgWhrJX8bVVrGZx/KwJ4jyhdZ
 5gsJ8wVXKVtg9vPZYVuJvHyeq6Ua98Q1gIMN0uC5Upp2WtUduMjyZTM4vSNAtMZHFZf3
 OsBAi7McMT5pJ5QGjxFmXExT5gFYMQqnZvDUAyyFWpSXzsVsWx5CtmJnBszJyjldwIKz
 kl0ymX4UkhJD2LqkloboSJKvcXsa0pUoH/L6rpPXag8r2oVg7aAKOr2VcbaukMqu9u7k
 f5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2ItnFWl/vUWGLjtvyCmJqIeVrNw8i3L6jnzb9jNbqL8=;
 b=jWWAixbCHFaGdOLSSZVhwS7KjBwPGQRuoNOsv3oK4tUaWJesMgOGlvHWlsd8tsaRU2
 vEqm7QKXAmeQ4Z6BRuq/en9z5Xrmje5tCfc/I4jkJKPIILFEtDaeZD/3+j9HWxMmQEMY
 jueECPtbdHTi/4bNAL9ndx2/Qx8FVs06ALdamcH1wtE2nL1+OV2kbyEG/91UnmD5NRTE
 3rHuB5qDBTconN62/WIEjl5fe3i1NfqWWBiYDyCeMtoLPdSKk7rbVXSkePVExQef50ub
 jNOL+PO8F0K8L5EX8Acm/Uyy2/Vv42fzHoJbu5E9RVxZF4FcpMKbd33IK41ImT1YH6Fy
 0yZA==
X-Gm-Message-State: AOAM530tq+hGRszBJaaps2QqNdt0G44G30PQE+3iExPxXI6wcPiYs1g/
 vKjrC5ZbVXgqG79R2jF8IAM=
X-Google-Smtp-Source: ABdhPJyYF7vAueUDUTERU8+EyodmlVA2eKTUBGOXwX1aQapv36ao18x0AJfxUQplvEUs/8uNJp37Bw==
X-Received: by 2002:a5d:538c:: with SMTP id d12mr18342394wrv.116.1624121522565; 
 Sat, 19 Jun 2021 09:52:02 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c21sm10832771wme.38.2021.06.19.09.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 09:52:01 -0700 (PDT)
Subject: Re: [RFC v3 1/1] Implement AVR watchdog timer
To: Michael Rolnik <mrolnik@gmail.com>, qemu-devel@nongnu.org
References: <20210515220957.13053-1-mrolnik@gmail.com>
 <20210515220957.13053-2-mrolnik@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e509a0fc-cc98-1658-4235-f5b58847e3d9@amsat.org>
Date: Sat, 19 Jun 2021 18:52:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210515220957.13053-2-mrolnik@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: me@xcancerberox.com.ar, konrad@adacore.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/21 12:09 AM, Michael Rolnik wrote:
> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> ---
>  MAINTAINERS                   |   2 +
>  hw/avr/Kconfig                |   1 +
>  hw/avr/atmega.c               |  15 +-
>  hw/avr/atmega.h               |   2 +

I'd split this patch in 4:

^ patch #2, wire wdt in atmega

(This patch is OK)

>  hw/watchdog/Kconfig           |   3 +
>  hw/watchdog/avr_wdt.c         | 279 ++++++++++++++++++++++++++++++++++
>  hw/watchdog/meson.build       |   2 +
>  hw/watchdog/trace-events      |   5 +
>  include/hw/watchdog/avr_wdt.h |  47 ++++++

^ patch #1, add wdt model

>  target/avr/cpu.c              |   3 +
>  target/avr/cpu.h              |   1 +
>  target/avr/helper.c           |   7 +-

^ patch #4, wire opcode

>  target/avr/translate.c        |  58 ++++++-

^ patch #3, adding gen_io()

(I'd like review from Alex / Pavel Dovgalyuk)

>  13 files changed, 419 insertions(+), 6 deletions(-)
>  create mode 100644 hw/watchdog/avr_wdt.c
>  create mode 100644 include/hw/watchdog/avr_wdt.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 78561a223f..e53bccfa9a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1036,6 +1036,8 @@ F: include/hw/timer/avr_timer16.h
>  F: hw/timer/avr_timer16.c
>  F: include/hw/misc/avr_power.h
>  F: hw/misc/avr_power.c
> +F: include/hw/watchdog/avr_wdt.h
> +F: hw/watchdog/avr_wdt.c
>  
>  Arduino
>  M: Philippe Mathieu-Daudé <f4bug@amsat.org>


> diff --git a/hw/watchdog/avr_wdt.c b/hw/watchdog/avr_wdt.c
> new file mode 100644
> index 0000000000..4e14f734cd
> --- /dev/null
> +++ b/hw/watchdog/avr_wdt.c
> @@ -0,0 +1,279 @@
> +/*
> + * AVR watchdog
> + *
> + * Copyright (c) 2021 Michael Rolnik
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/lgpl-2.1.html>

Why not use GPL-2.0-or-later?

> +
> +#define DB_PRINT(fmt, args...) /* Nothing */

If you don't use it, drop it?

> +
> +#define MS2NS(n)        ((n) * 1000000ull)

Please drop this macro ...

> +static void avr_wdt_reset_alarm(AVRWatchdogState *wdt)
> +{
> +    uint32_t csr = wdt->csr;
> +    int wdp = WDP(csr);
> +
> +    if (WDIE(csr) == 0 && WDE(csr) == 0) {
> +        /* watchdog is stopped */
> +        return;
> +    }
> +
> +    timer_mod_ns(&wdt->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +            (MS2NS(15) << wdp));

... and use 15 * SCALE_MS.

Even better, add a avr_wdt_timeout_value() where you check the
prescaler, and here:

       timer_mod_ns(&wdt->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
                                 + avr_wdt_timeout_value(wdt))

What is this '15' magic number anyway?

> +}
> +
> +static void avr_wdt_interrupt(void *opaque)

Maybe name that avr_wdt_expire/timeout?

> +{
> +    AVRWatchdogState *wdt = opaque;
> +    int8_t csr = wdt->csr;
> +

       trace_avr_wdt_expired(csr);

> +    if (WDIE(csr) == 1) {
> +        /* Interrupt Mode */
> +        set_bits(&wdt->csr, R_CSR_WDIF_MASK);
> +        qemu_set_irq(wdt->irq, 1);
> +        rst_bits(&wdt->csr, R_CSR_WDIE_MASK);
> +        trace_avr_wdt_interrupt();

replaced by trace_avr_wdt_expired()?

> +    }

else

> +    if (WDE(csr) == 1) {

Can we have definitions instead of '1' & comment?

> +        /* System Reset Mode */
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +    }

What about the watchdog_perform_action() case?

> +
> +    avr_wdt_reset_alarm(wdt);

This call doesn't seem correct, maybe add it in each case?

Anyway this function body doesn't look like table 12-1 "Watchdog
Timer Configuration".

What about:

  if (!WDTON) {
    goto system_reset;
  } else {
    if (WDIE) {
      // interrupt
      if (WDE) {
        return;
      } else {
        goto system_reset;
      }
    }
    if (WDE) {
       goto system_reset;
    }
    g_assert_not_reached();
  }
system_reset:
  ...

> +}
> +
> +static void avr_wdt_reset(DeviceState *dev)
> +{
> +    AVRWatchdogState *wdt = AVR_WDT(dev);
> +
> +    wdt->csr = 0;

What about MCUSR flags?

> +    qemu_set_irq(wdt->irq, 0);
> +    avr_wdt_reset_alarm(wdt);
> +}
> +

> +static void avr_wdt_write(void *opaque, hwaddr offset,
> +                              uint64_t val64, unsigned size)
> +{
> +    assert(size == 1);
> +    AVRWatchdogState *wdt = opaque;
> +    uint8_t val = (uint8_t)val64;
> +    uint8_t set1 = val; /* bits that should be set to 1 */
> +    uint8_t set0 = ~val;/* bits that should be set to 0 */
> +    uint8_t mcusr = 0;
> +
> +    /*
> +     *  Bit 7 - WDIF: Watchdog Interrupt Flag
> +     *  This bit is set when a time-out occurs in the Watchdog Timer and the
> +     *  Watchdog Timer is configured for interrupt. WDIF is cleared by hardware
> +     *  when executing the corresponding interrupt handling vector.
> +     *  Alternatively, WDIF is cleared by writing a logic one to the flag.
> +     *  When the I-bit in SREG and WDIE are set, the Watchdog Time-out Interrupt
> +     *  is executed.
> +     */
> +    if (val & R_CSR_WDIF_MASK) {
> +        rst_bits(&set1, R_CSR_WDIF_MASK);  /* don't set 1 */
> +        set_bits(&set0, R_CSR_WDIF_MASK);  /* set 0 */
> +    } else {
> +        rst_bits(&set1, R_CSR_WDIF_MASK);  /* don't set 1 */
> +        rst_bits(&set0, R_CSR_WDIF_MASK);  /* don't set 0 */
> +    }
> +
> +    /*
> +     *  Bit 4 - WDCE: Watchdog Change Enable
> +     *  This bit is used in timed sequences for changing WDE and prescaler
> +     *  bits. To clear the WDE bit, and/or change the prescaler bits,
> +     *  WDCE must be set.
> +     *  Once written to one, hardware will clear WDCE after four clock cycles.
> +     */
> +    if (!(val & R_CSR_WDCE_MASK)) {
> +        uint8_t bits = R_CSR_WDE_MASK | R_CSR_WDP0_MASK | R_CSR_WDP1_MASK |
> +                       R_CSR_WDP2_MASK | R_CSR_WDP3_MASK;
> +        rst_bits(&set1, bits);
> +        rst_bits(&set0, bits);
> +    }
> +
> +    /*
> +     *  Bit 3 - WDE: Watchdog System Reset Enable
> +     *  WDE is overridden by WDRF in MCUSR. This means that WDE is always set
> +     *  when WDRF is set. To clear WDE, WDRF must be cleared first. This
> +     *  feature ensures multiple resets during conditions causing failure, and
> +     *  a safe start-up after the failure.
> +     */
> +    cpu_physical_memory_read(A_MCUSR, &mcusr, sizeof(mcusr));
> +    if (mcusr & R_MCUSR_WDRF_MASK) {
> +        set_bits(&set1, R_CSR_WDE_MASK);
> +        rst_bits(&set0, R_CSR_WDE_MASK);
> +    }
> +
> +    /*  update CSR value */
> +    assert((set0 & set1) == 0);
> +
> +    val = wdt->csr;
> +    set_bits(&val, set1);
> +    rst_bits(&val, set0);
> +    wdt->csr = val;
> +    trace_avr_wdt_write(offset, val);
> +    avr_wdt_reset_alarm(wdt);
> +
> +    /*
> +     *  Bit 6 - WDIE: Watchdog Interrupt Enable
> +     *  When this bit is written to one and the I-bit in the Status Register is
> +     *  set, the Watchdog Interrupt is enabled. If WDE is cleared in
> +     *  combination with this setting, the Watchdog Timer is in Interrupt Mode,
> +     *  and the corresponding interrupt is executed if time-out in the Watchdog
> +     *  Timer occurs.
> +     *  If WDE is set, the Watchdog Timer is in Interrupt and System Reset Mode.
> +     *  The first time-out in the Watchdog Timer will set WDIF. Executing the
> +     *  corresponding interrupt vector will clear WDIE and WDIF automatically by
> +     *  hardware (the Watchdog goes to System Reset Mode). This is useful for
> +     *  keeping the Watchdog Timer security while using the interrupt. To stay
> +     *  in Interrupt and System Reset Mode, WDIE must be set after each
> +     *  interrupt. This should however not be done within the interrupt service
> +     *  routine itself, as this might compromise the safety-function of the
> +     *  Watchdog System Reset mode. If the interrupt is not executed before the
> +     *  next time-out, a System Reset will be applied.
> +     */
> +    if ((val & R_CSR_WDIE_MASK) && (wdt->csr & R_CSR_WDIF_MASK)) {
> +        avr_wdt_interrupt(opaque);
> +    }

This function is too complex, I'm skipping it.

> diff --git a/include/hw/watchdog/avr_wdt.h b/include/hw/watchdog/avr_wdt.h
> new file mode 100644
> index 0000000000..006f9496fb
> --- /dev/null
> +++ b/include/hw/watchdog/avr_wdt.h
> @@ -0,0 +1,47 @@
> +/*
> + * AVR watchdog
> + *
> + * Copyright (c) 2021 Michael Rolnik
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> + */
> +
> +#ifndef HW_WATCHDOG_AVR_WDT_H
> +#define HW_WATCHDOG_AVR_WDT_H
> +
> +#include "hw/sysbus.h"
> +#include "qemu/timer.h"
> +#include "hw/hw.h"

Probably not needed.

> +#include "qom/object.h"
> +
> +#define TYPE_AVR_WDT "avr-wdt"
> +OBJECT_DECLARE_SIMPLE_TYPE(AVRWatchdogState, AVR_WDT)
> +
> +struct AVRWatchdogState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    /* <public> */
> +    MemoryRegion iomem;
> +    MemoryRegion imsk_iomem;
> +    MemoryRegion ifr_iomem;
> +    QEMUTimer timer;
> +    qemu_irq irq;
> +
> +    /* registers */
> +    uint8_t csr;
> +};
> +
> +#endif /* HW_WATCHDOG_AVR_WDT_H */

