Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B4C30185F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 21:35:58 +0100 (CET)
Received: from localhost ([::1]:59948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3PdV-0008A0-BF
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 15:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3PbC-0006i4-4B; Sat, 23 Jan 2021 15:33:34 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:58896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3PbA-0004Xs-DN; Sat, 23 Jan 2021 15:33:33 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id B9F75C602E6;
 Sat, 23 Jan 2021 21:33:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611434009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6e+z3MckAZFaGT703sf2KecvlXuBkoiUJcmnxnowGZU=;
 b=SChU8k6SM9NnCFHEQHpuh0aNi1kxogPietfj30yXmO0XnEFPP/nAyDoK475RrRewytZ7+y
 nWyV8HKaCaKMqzx7S5UsXGYJPfnZ6vcRZKwu+rLBMHUenkWk1fV6ZsVtW7x1Xj3jQ9c4zM
 wkKbw0mN0yStHF95UYpeNLIdVHukHvmvnCIkiMAhoEPX5WkzevpoVgRPMIdobCC2dfZsIy
 lo+e7wTrjh+k4FowAbV/MPObi8G1bdUFIySDZkY31pkpj9irQUlnzdITzcn6YvAedMIe6r
 hdBO3tRH7JBBWVSzUY+vmulu6ABrFV3OlTQy3QLvTa7wDh/zkCe9WMpwzVSO+A==
Date: Sat, 23 Jan 2021 21:33:51 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 25/25] hw/arm/stellaris: Remove board-creation reset of
 STELLARIS_SYS
Message-ID: <20210123203351.453pcpozshxiwlxg@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-26-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-26-peter.maydell@linaro.org>
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
> Now that the watchdog device uses its Clock input rather than being
> passed the value of system_clock_scale at creation time, we can
> remove the hack where we reset the STELLARIS_SYS at board creation
> time to force it to set system_clock_scale.  Instead it will be reset
> at the usual point in startup and will inform the watchdog of the
> clock frequency at that point.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/stellaris.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 5acb043a07e..ad72c0959f1 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -780,16 +780,6 @@ static DeviceState *stellaris_sys_init(uint32_t base, qemu_irq irq,
>      sysbus_mmio_map(sbd, 0, base);
>      sysbus_connect_irq(sbd, 0, irq);
>  
> -    /*
> -     * Normally we should not be resetting devices like this during
> -     * board creation. For the moment we need to do so, because
> -     * system_clock_scale will only get set when the STELLARIS_SYS
> -     * device is reset, and we need its initial value to pass to
> -     * the watchdog device. This hack can be removed once the
> -     * watchdog has been converted to use a Clock input instead.
> -     */
> -    device_cold_reset(dev);
> -
>      return dev;
>  }
>  
> -- 
> 2.20.1
> 

-- 

