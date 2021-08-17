Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD8C3EE9E6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:31:56 +0200 (CEST)
Received: from localhost ([::1]:37034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvRr-0001F5-EF
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvPw-0007vX-MD; Tue, 17 Aug 2021 05:29:56 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:53998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvPu-0008HB-PY; Tue, 17 Aug 2021 05:29:56 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 6DEA3C6019D;
 Tue, 17 Aug 2021 11:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629192592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=63zRBf21fQEtHWopWpvJiYdZoa/5ab1gHUCPZopCpFo=;
 b=Ql/l0A8Qm88gAb4/PCoccmvU4e263EsLaW8jk3VvQf1afkddSpZdQ+IUhx1b/riqswEGuj
 h1GYtWmC8SLNfweLczXzuoJ02dKjTtxNBD7ohgp2nk+J1rhlIoup/NVA8kBU39UhDqWV80
 4iM5HR3YmuHyuVwNFT37tlFD1S+XF5+y2cvsr8myB6QbbMM93nbizVurz/luXo0ogRGjbQ
 rnSDz3dGCTzpfWOz59hOiN/fmveNqT89fRULBzjk7ClIA6nc/M3WGZyw5m5CHFFUBSD8wk
 LozsTCYwFDwQakxZr8l55NW1pWL9BZwRWKpzzjSm0Q+DWaVyGttqXVfaytlrQA==
Date: Tue, 17 Aug 2021 11:32:04 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 05/25] hw/timer/armv7m_systick: Add input clocks
Message-ID: <20210817093204.zglk5y35q4onz76t@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-6-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-6-peter.maydell@linaro.org>
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

Reviewed-by: Luc Michel <luc@lmichel.fr>

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

-- 

