Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE44B359D85
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:35:03 +0200 (CEST)
Received: from localhost ([::1]:34256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUpPi-0003DL-AY
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUpOA-0002OP-Pk
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:33:26 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUpO8-0006LW-Sy
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:33:26 -0400
Received: by mail-ej1-x632.google.com with SMTP id u17so8143666ejk.2
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 04:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l5g+xmwsNoogtIPy0ea2A8+v+8iC6bSNLoMneIwo1cc=;
 b=cp4AjLBBtM1tNrGR3zMBk1yYJseinPkXAe+IxVgyQsWp58oQuuRUH50zWpmL646l1m
 MziIjUN60PG0zGATSbpeLLARaEoAOCLMlg6G+x3DDtQmCRl3P2sguAQ3Jv+xWrVRexAQ
 5SUzOtS0gOO4IO7P3CFKTeiOjTbDVserkY1y69voXDDIdmLXBOBclF/EVd3sAOR95cSq
 nykfUv/E2e5SO4CW5HCV7lqbUeJ9CzTRaZH/EFkb8KOUdbkc+1Lhfi1LpVDjqbJtz3iK
 7kAhAzKEncdVBIlrMHVnfNRJ49D9+fABTZHrHvYaLnbNKDEmG6xJJzHT/1v1o2F+42CP
 5Kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l5g+xmwsNoogtIPy0ea2A8+v+8iC6bSNLoMneIwo1cc=;
 b=kqld4gyLVWvigCR6+rCKYeHCFjO3Z7ESm0xAnRngCsaqn6DhgaRM2KOInh2HZ7grxo
 UrRKX0SE2PqeivUVRYkrkBZMNwdhnJvgAPesaVzuoZaJsdNYV/7rPJi0UYt+I0NxaM3B
 8ta0MlQpGrVuZqgVXSEluKaU+yqJ++MQ8IvG/vzMz+JgO2gVxDb7uMJM0FeI+EOYz/rD
 LVxCaTnWQ293zPQHv1wWlDDCbEj5Yl5EoDNYX8VFDl750RtI+DsjYDux1s4x9tkeA7MH
 fxEKbZOOI/Kd442Tw5D/j4b4FO5ZGjMN+CpnaDNHfH1rGRDfnb5s3SPG0kN+V3CrJ7iW
 A4KQ==
X-Gm-Message-State: AOAM532t+8CcgCyv8W1hzdLy34+2ZRKLeoyXdt9mzyzKzBNvOAQiHCgH
 ZHrtXZHOZVPU+W9x2lH2kP8=
X-Google-Smtp-Source: ABdhPJyzriDudj/21ysjHZQXaH2X9HoLqTXjMoybMjf8HNPSop2+6eiJGU4kUEffp2jMsxRb6qhq2A==
X-Received: by 2002:a17:907:628a:: with SMTP id
 nd10mr15751276ejc.326.1617968002763; 
 Fri, 09 Apr 2021 04:33:22 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q25sm1278786edt.51.2021.04.09.04.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 04:33:22 -0700 (PDT)
Subject: Re: [PATCH-for-6.1] hw/avr/atmega: Convert to QDev Clock API
To: qemu-devel@nongnu.org
References: <20210409112555.2430933-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6490927c-9d11-a394-9d7d-2c0665496ae8@amsat.org>
Date: Fri, 9 Apr 2021 13:33:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409112555.2430933-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 1:25 PM, Philippe Mathieu-Daudé wrote:
> Create the oscillator object on the board, and propagate its
> clock to the ATMega MCU. Wire this clock to the timers.
> 
> Properties are remplaced by clocks.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: <20210409062401.2350436-1-f4bug@amsat.org>
> 
> TODO: Add corresponding vmstates for migration,
>       but these devices don't have any, so keep
>       this for later.
> ---
>  hw/avr/atmega.h                |  3 ++-
>  include/hw/timer/avr_timer16.h |  4 +++-
>  hw/avr/arduino.c               |  8 ++++++--
>  hw/avr/atmega.c                | 20 +++++++++++---------
>  hw/timer/avr_timer16.c         | 20 ++++++++++++--------
>  5 files changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
> index a99ee15c7e1..12e856386b6 100644
> --- a/hw/avr/atmega.h
> +++ b/hw/avr/atmega.h
> @@ -11,6 +11,7 @@
>  #ifndef HW_AVR_ATMEGA_H
>  #define HW_AVR_ATMEGA_H
>  
> +#include "hw/clock.h"
>  #include "hw/char/avr_usart.h"
>  #include "hw/timer/avr_timer16.h"
>  #include "hw/misc/avr_power.h"
> @@ -41,11 +42,11 @@ struct AtmegaMcuState {
>      MemoryRegion flash;
>      MemoryRegion eeprom;
>      MemoryRegion sram;
> +    Clock *xtal_clkin;
>      DeviceState *io;
>      AVRMaskState pwr[POWER_MAX];
>      AVRUsartState usart[USART_MAX];
>      AVRTimer16State timer[TIMER_MAX];
> -    uint64_t xtal_freq_hz;
>  };
>  
>  #endif /* HW_AVR_ATMEGA_H */
> diff --git a/include/hw/timer/avr_timer16.h b/include/hw/timer/avr_timer16.h
> index 05362543378..86dc9e98d95 100644
> --- a/include/hw/timer/avr_timer16.h
> +++ b/include/hw/timer/avr_timer16.h
> @@ -28,6 +28,7 @@
>  #ifndef HW_TIMER_AVR_TIMER16_H
>  #define HW_TIMER_AVR_TIMER16_H
>  
> +#include "hw/clock.h"
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "hw/hw.h"
> @@ -84,7 +85,8 @@ struct AVRTimer16State {
>      uint8_t ifr;
>  
>      uint8_t id;
> -    uint64_t cpu_freq_hz;
> +    Clock *io_clkin;
> +
>      uint64_t freq_hz;
>      uint64_t period_ns;
>      uint64_t reset_time_ns;
> diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
> index 3ff31492fa6..71e69823c07 100644
> --- a/hw/avr/arduino.c
> +++ b/hw/avr/arduino.c
> @@ -12,7 +12,9 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "hw/clock.h"
>  #include "hw/boards.h"
> +#include "hw/qdev-clock.h"
>  #include "atmega.h"
>  #include "boot.h"
>  #include "qom/object.h"
> @@ -21,6 +23,7 @@ struct ArduinoMachineState {
>      /*< private >*/
>      MachineState parent_obj;
>      /*< public >*/
> +    Clock *xtal;
>      AtmegaMcuState mcu;
>  };
>  typedef struct ArduinoMachineState ArduinoMachineState;
> @@ -44,9 +47,10 @@ static void arduino_machine_init(MachineState *machine)
>      ArduinoMachineClass *amc = ARDUINO_MACHINE_GET_CLASS(machine);
>      ArduinoMachineState *ams = ARDUINO_MACHINE(machine);
>  
> +    ams->xtal = machine_create_constant_clock(machine, "osc", amc->xtal_hz);
> +
>      object_initialize_child(OBJECT(machine), "mcu", &ams->mcu, amc->mcu_type);
> -    object_property_set_uint(OBJECT(&ams->mcu), "xtal-frequency-hz",
> -                             amc->xtal_hz, &error_abort);
> +    qdev_connect_clock_in(DEVICE(&ams->mcu), "osc-in", ams->xtal);
>      sysbus_realize(SYS_BUS_DEVICE(&ams->mcu), &error_abort);
>  
>      if (machine->firmware) {
> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> index 44c6afebbb6..b8a11965435 100644
> --- a/hw/avr/atmega.c
> +++ b/hw/avr/atmega.c
> @@ -15,6 +15,7 @@
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "qom/object.h"
> @@ -216,6 +217,14 @@ static void connect_power_reduction_gpio(AtmegaMcuState *s,
>                         qdev_get_gpio_in(cpu, 0));
>  }
>  
> +static void atmega_init(Object *obj)
> +{
> +    AtmegaMcuState *s = ATMEGA_MCU(obj);
> +
> +    s->xtal_clkin = qdev_init_clock_in(DEVICE(obj), "osc-in",
> +                                       NULL, NULL, ClockUpdate);
> +}
> +
>  static void atmega_realize(DeviceState *dev, Error **errp)
>  {
>      AtmegaMcuState *s = ATMEGA_MCU(dev);
> @@ -227,11 +236,6 @@ static void atmega_realize(DeviceState *dev, Error **errp)
>  
>      assert(mc->io_size <= 0x200);
>  
> -    if (!s->xtal_freq_hz) {
> -        error_setg(errp, "\"xtal-frequency-hz\" property must be provided.");
> -        return;
> -    }
> -
>      /* CPU */
>      object_initialize_child(OBJECT(dev), "cpu", &s->cpu, mc->cpu_type);
>      object_property_set_bool(OBJECT(&s->cpu), "realized", true, &error_abort);
> @@ -328,8 +332,7 @@ static void atmega_realize(DeviceState *dev, Error **errp)
>          devname = g_strdup_printf("timer%zu", i);
>          object_initialize_child(OBJECT(dev), devname, &s->timer[i],
>                                  TYPE_AVR_TIMER16);

I forgot to commit this hunk:

  +        /*
  +         * Since we do not model the Clock Distribution system,
  +         * directly connect the external clock to I/O clock.
  +         */

> -        object_property_set_uint(OBJECT(&s->timer[i]), "cpu-frequency-hz",
> -                                 s->xtal_freq_hz, &error_abort);
> +        qdev_connect_clock_in(DEVICE(&s->timer[i]), "io-clk", s->xtal_clkin);
>          sbd = SYS_BUS_DEVICE(&s->timer[i]);
>          sysbus_realize(sbd, &error_abort);
>          sysbus_mmio_map(sbd, 0, OFFSET_DATA + mc->dev[idx].addr);
> @@ -353,8 +356,6 @@ static void atmega_realize(DeviceState *dev, Error **errp)
>  }
>  
>  static Property atmega_props[] = {
> -    DEFINE_PROP_UINT64("xtal-frequency-hz", AtmegaMcuState,
> -                       xtal_freq_hz, 0),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> @@ -449,6 +450,7 @@ static const TypeInfo atmega_mcu_types[] = {
>          .name           = TYPE_ATMEGA_MCU,
>          .parent         = TYPE_SYS_BUS_DEVICE,
>          .instance_size  = sizeof(AtmegaMcuState),
> +        .instance_init  = atmega_init,
>          .class_size     = sizeof(AtmegaMcuClass),
>          .class_init     = atmega_class_init,
>          .abstract       = true,
> diff --git a/hw/timer/avr_timer16.c b/hw/timer/avr_timer16.c
> index c48555da525..7092023d616 100644
> --- a/hw/timer/avr_timer16.c
> +++ b/hw/timer/avr_timer16.c
> @@ -35,6 +35,7 @@
>  #include "qapi/error.h"
>  #include "qemu/log.h"
>  #include "hw/irq.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/timer/avr_timer16.h"
>  #include "trace.h"
> @@ -167,7 +168,7 @@ static void avr_timer16_clksrc_update(AVRTimer16State *t16)
>          break;
>      }
>      if (divider) {
> -        t16->freq_hz = t16->cpu_freq_hz / divider;
> +        t16->freq_hz = clock_get_hz(t16->io_clkin) / divider;
>          t16->period_ns = NANOSECONDS_PER_SECOND / t16->freq_hz;
>          trace_avr_timer16_clksrc_update(t16->freq_hz, t16->period_ns,
>                                          (uint64_t)(1e6 / t16->freq_hz));
> @@ -544,8 +545,6 @@ static const MemoryRegionOps avr_timer16_ifr_ops = {
>  
>  static Property avr_timer16_properties[] = {
>      DEFINE_PROP_UINT8("id", struct AVRTimer16State, id, 0),
> -    DEFINE_PROP_UINT64("cpu-frequency-hz", struct AVRTimer16State,
> -                       cpu_freq_hz, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -560,10 +559,20 @@ static void avr_timer16_pr(void *opaque, int irq, int level)
>      }
>  }
>  
> +static void avr_timer16_clock_update(void *opaque, ClockEvent event)
> +{
> +    AVRTimer16State *s = opaque;
> +
> +    avr_timer16_clksrc_update(s);
> +}
> +
>  static void avr_timer16_init(Object *obj)
>  {
>      AVRTimer16State *s = AVR_TIMER16(obj);
>  
> +    s->io_clkin = qdev_init_clock_in(DEVICE(obj), "io-clk",
> +                                     avr_timer16_clock_update, s, ClockUpdate);
> +
>      sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->capt_irq);
>      sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->compa_irq);
>      sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->compb_irq);
> @@ -587,11 +596,6 @@ static void avr_timer16_realize(DeviceState *dev, Error **errp)
>  {
>      AVRTimer16State *s = AVR_TIMER16(dev);
>  
> -    if (s->cpu_freq_hz == 0) {
> -        error_setg(errp, "AVR timer16: cpu-frequency-hz property must be set");
> -        return;
> -    }
> -
>      s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, avr_timer16_interrupt, s);
>      s->enabled = true;
>  }
> 

