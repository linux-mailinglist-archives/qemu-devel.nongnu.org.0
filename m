Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110333EE9F3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:33:29 +0200 (CEST)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvTM-0003rE-3r
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvSE-0002Tw-Ui; Tue, 17 Aug 2021 05:32:20 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:54124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvSC-0001vR-1e; Tue, 17 Aug 2021 05:32:17 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 1E277C6019D;
 Tue, 17 Aug 2021 11:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629192734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VyJ0GRCLg2eM6lXyjBhCquG669dGpXhKN4eB0u/eZDY=;
 b=DWBAXRkY72YMIaI1x8dKwxjcK2+ukVzfEvCfPXQ3IGbfwCv+hEwTvjwPOwZRVI5XZBaHOx
 upz+g6sWDJMaGgS8o78xEoFnvo0M/holWhubQXvFcgFKdsrowT1IbvMDY2iU4tDQxcspI6
 logpTibWVloXF9SbkdeNGbZ0+PKMfGWXomAt4Oqbi1mTV1AOp8rTsfScqDtMP2/HIWrSi/
 Ub4j+i+9N2urovr85DnVYM5aMUj8r5pMOy5m9L9GvDwFXzKb8R8lrQ5O8U2OLEmN4qwo8G
 AFxvvdMHRLW+UtugRqgPNZBISkf3Qk+FBeU2jXDAv8LpXa9IIoUMfvj6VTFUtA==
Date: Tue, 17 Aug 2021 11:34:26 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 06/25] hw/arm/armv7m: Create input clocks
Message-ID: <20210817093426.gndowlsipblhcwef@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-7-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-7-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> Create input clocks on the armv7m container object which pass through
> to the systick timers, so that users of the armv7m object can specify
> the clocks being used.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/armv7m.h |  6 ++++++
>  hw/arm/armv7m.c         | 23 +++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index fe8b248a6c6..b7ba0ff409c 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -15,6 +15,7 @@
>  #include "hw/misc/armv7m_ras.h"
>  #include "target/arm/idau.h"
>  #include "qom/object.h"
> +#include "hw/clock.h"
>  
>  #define TYPE_BITBAND "ARM-bitband-memory"
>  OBJECT_DECLARE_SIMPLE_TYPE(BitBandState, BITBAND)
> @@ -51,6 +52,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(ARMv7MState, ARMV7M)
>   * + Property "vfp": enable VFP (forwarded to CPU object)
>   * + Property "dsp": enable DSP (forwarded to CPU object)
>   * + Property "enable-bitband": expose bitbanded IO
> + * + Clock input "refclk" is the external reference clock for the systick timers
> + * + Clock input "cpuclk" is the main CPU clock
>   */
>  struct ARMv7MState {
>      /*< private >*/
> @@ -82,6 +85,9 @@ struct ARMv7MState {
>      /* MR providing default PPB behaviour */
>      MemoryRegion defaultmem;
>  
> +    Clock *refclk;
> +    Clock *cpuclk;
> +
>      /* Properties */
>      char *cpu_type;
>      /* MemoryRegion the board provides to us (with its devices, RAM, etc) */
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 7e7fb7a3ad3..db1bfa98df0 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -14,12 +14,14 @@
>  #include "hw/arm/boot.h"
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
>  #include "elf.h"
>  #include "sysemu/reset.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qemu/log.h"
>  #include "target/arm/idau.h"
> +#include "migration/vmstate.h"
>  
>  /* Bitbanded IO.  Each word corresponds to a single bit.  */
>  
> @@ -265,6 +267,9 @@ static void armv7m_instance_init(Object *obj)
>          object_initialize_child(obj, "bitband[*]", &s->bitband[i],
>                                  TYPE_BITBAND);
>      }
> +
> +    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk", NULL, NULL, 0);
> +    s->cpuclk = qdev_init_clock_in(DEVICE(obj), "cpuclk", NULL, NULL, 0);
>  }
>  
>  static void armv7m_realize(DeviceState *dev, Error **errp)
> @@ -416,6 +421,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      }
>  
>      /* Create and map the systick devices */
> +    qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "refclk", s->refclk);
> +    qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "cpuclk", s->cpuclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
>          return;
>      }
> @@ -431,6 +438,10 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>           */
>          object_initialize_child(OBJECT(dev), "systick-reg-s",
>                                  &s->systick[M_REG_S], TYPE_SYSTICK);
> +        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "refclk",
> +                              s->refclk);
> +        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "cpuclk",
> +                              s->cpuclk);
>  
>          if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_S]), errp)) {
>              return;
> @@ -504,11 +515,23 @@ static Property armv7m_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static const VMStateDescription vmstate_armv7m = {
> +    .name = "armv7m",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_CLOCK(refclk, SysTickState),
> +        VMSTATE_CLOCK(cpuclk, SysTickState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static void armv7m_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->realize = armv7m_realize;
> +    dc->vmsd = &vmstate_armv7m;
>      device_class_set_props(dc, armv7m_properties);
>  }
>  
> -- 
> 2.20.1
> 

-- 

