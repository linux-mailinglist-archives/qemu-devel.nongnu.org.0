Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC963006F4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:18:26 +0100 (CET)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2yCf-0003YC-5D
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2yBJ-0001w5-WC; Fri, 22 Jan 2021 10:17:02 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:37382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2yBE-00032d-EA; Fri, 22 Jan 2021 10:17:01 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 26D47C602E6;
 Fri, 22 Jan 2021 16:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611328613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aDeRcbRcSdeYQMiBxaM0MtdLiWNQTQc9AATAIzjTG3I=;
 b=WwIbZ92krjPfgIxBYuuWsvuqP+s/jeh1l99E3tMh6hFLXvtKnnQTfbsPB9qgSadhM3HXDk
 LEONa8zvijkvC6PFaz1/re7Q0ISUH0maBIZc1evCDYVSR62QnHWiGvIBugxCpHV8CfFUBI
 XsqhxvcgSstBJ/Jjj1yjIz/b2CH76OOirqvg3FoiHpFVbA9AxVHLwUJcQSmatW1WPIHnIu
 kI9nfxAEkcjaVoGkmoRj/e2iJ8Q44Ea64WCQ9KrE3CtMlk4ngHmv1QKoNKt2rStLWMxeBY
 /PtfbUcIFViRTgR+gdg6u35RxHCcF06O+xah04SRV/58O18pItvQH/GZJ7cqig==
Date: Fri, 22 Jan 2021 16:17:14 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 08/25] hw/timer/cmsdk-apb-dualtimer: Add Clock input
Message-ID: <20210122151714.7gd7a3r6oipciw4u@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-9-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-9-peter.maydell@linaro.org>
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> As the first step in converting the CMSDK_APB_DUALTIMER device to the
> Clock framework, add a Clock input.  For the moment we do nothing
> with this clock; we will change the behaviour from using the pclk-frq
> property to using the Clock once all the users of this device have
> been converted to wire up the Clock.
> 
> We take the opportunity to correct the name of the clock input to
> match the hardware -- the dual timer names the clock which drives the
> timers TIMCLK.  (It does also have a 'pclk' input, which is used only
> for the register and APB bus logic; on the SSE-200 these clocks are
> both connected together.)
> 
> This is a migration compatibility break for machines mps2-an385,
> mps2-an386, mps2-an500, mps2-an511, mps2-an505, mps2-an521, musca-a,
> musca-b1.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/timer/cmsdk-apb-dualtimer.h | 3 +++
>  hw/timer/cmsdk-apb-dualtimer.c         | 7 +++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/timer/cmsdk-apb-dualtimer.h b/include/hw/timer/cmsdk-apb-dualtimer.h
> index 08d9e6fa3d5..3adbb01dd34 100644
> --- a/include/hw/timer/cmsdk-apb-dualtimer.h
> +++ b/include/hw/timer/cmsdk-apb-dualtimer.h
> @@ -17,6 +17,7 @@
>   *
>   * QEMU interface:
>   *  + QOM property "pclk-frq": frequency at which the timer is clocked
> + *  + Clock input "TIMCLK": clock (for both timers)
>   *  + sysbus MMIO region 0: the register bank
>   *  + sysbus IRQ 0: combined timer interrupt TIMINTC
>   *  + sysbus IRO 1: timer block 1 interrupt TIMINT1
> @@ -28,6 +29,7 @@
>  
>  #include "hw/sysbus.h"
>  #include "hw/ptimer.h"
> +#include "hw/clock.h"
>  #include "qom/object.h"
>  
>  #define TYPE_CMSDK_APB_DUALTIMER "cmsdk-apb-dualtimer"
> @@ -62,6 +64,7 @@ struct CMSDKAPBDualTimer {
>      MemoryRegion iomem;
>      qemu_irq timerintc;
>      uint32_t pclk_frq;
> +    Clock *timclk;
>  
>      CMSDKAPBDualTimerModule timermod[CMSDK_APB_DUALTIMER_NUM_MODULES];
>      uint32_t timeritcr;
> diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
> index f6534241b94..781b496037b 100644
> --- a/hw/timer/cmsdk-apb-dualtimer.c
> +++ b/hw/timer/cmsdk-apb-dualtimer.c
> @@ -25,6 +25,7 @@
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/registerfields.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/timer/cmsdk-apb-dualtimer.h"
>  #include "migration/vmstate.h"
>  
> @@ -445,6 +446,7 @@ static void cmsdk_apb_dualtimer_init(Object *obj)
>      for (i = 0; i < ARRAY_SIZE(s->timermod); i++) {
>          sysbus_init_irq(sbd, &s->timermod[i].timerint);
>      }
> +    s->timclk = qdev_init_clock_in(DEVICE(s), "TIMCLK", NULL, NULL);
>  }
>  
>  static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
> @@ -485,9 +487,10 @@ static const VMStateDescription cmsdk_dualtimermod_vmstate = {
>  
>  static const VMStateDescription cmsdk_apb_dualtimer_vmstate = {
>      .name = "cmsdk-apb-dualtimer",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
> +        VMSTATE_CLOCK(timclk, CMSDKAPBDualTimer),
>          VMSTATE_STRUCT_ARRAY(timermod, CMSDKAPBDualTimer,
>                               CMSDK_APB_DUALTIMER_NUM_MODULES,
>                               1, cmsdk_dualtimermod_vmstate,
> -- 
> 2.20.1
> 

-- 

