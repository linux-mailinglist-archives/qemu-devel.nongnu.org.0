Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5302FF7AB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:02:39 +0100 (CET)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2i2I-0007Nm-BQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hz3-0006Jp-Cy; Thu, 21 Jan 2021 16:59:17 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:39689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hz0-0005Il-Rp; Thu, 21 Jan 2021 16:59:17 -0500
Received: by mail-ed1-x52d.google.com with SMTP id b21so4306334edy.6;
 Thu, 21 Jan 2021 13:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h4M1rJIQpG8KOnehG+d4P5qGua0+3zSUZCd4tyULlTI=;
 b=qmd4mEPFFWsLfKHpBboyXCF3QF6Jjf0BKLsG1sRD2rTgIuIg8GNb/MbjNDqfDe7lKM
 9PrLEP7A7YUDwQUrXT3XGIbGDqe2Xl/Lss6LQ+gQTsBTJK59R5cyhv4PwRBsFiJ25Fb5
 X/19618iXnzyvekn8H7iLPGy+fR4RmgK3EZ0RN7/Z1AUF5C8MXKCZRMdipS+F6ukow8T
 LLxOfy+b26aC6l+rEMhobTksaF8lJZXbbcQw7Iw6bTX5l7myUNrhQ2//eMnE621rlSnY
 6nriVwXvDpsopwW82D/TtaknCABzrlQBKRZ+ox7BQhxq1PndbWRhbyo7jb8ROHoJRPez
 HXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h4M1rJIQpG8KOnehG+d4P5qGua0+3zSUZCd4tyULlTI=;
 b=E1IjSvDnl8bIheWjn7Acq1iZcartxEJyo4Tk5UE9O1RwwouXoiQu1EtiFZjjnqHqL/
 ZcVnxwmotplJaU686EbYAKGbhXtEkukjB6mWj2YBOCu6qd7jf+rAoIOfAW7JicWmtvrv
 bXPjLE7FSwxqQOn9M/81hkQOWV0JPnKX68zwPbLJYGm91cOv2B1frSw1dSF5JMBNcu3q
 YzOIQvgDUaXQAgr8p2nZ2zC7gM5s/VTEfSn7O5GF5yRx0x847axLFjKmfyFXbekPCtRj
 9gWUfYYMOlMnnwNMal8qmzFR/nCNmVRfBQ+Nhc7Tj1A/kDzV4xHdd9PxHj/c2z8hJZbn
 DZWg==
X-Gm-Message-State: AOAM532Pt+q+vm4Vn9LEC7bOzGv9N/XW5bBzl6cTyhghQIVedKOvJM8h
 L/JjGrBDJ21YuG8Suommk68=
X-Google-Smtp-Source: ABdhPJzGJItK2eRG9Xrfs55EZie36oiSJOnAOixamWt6ElY53YnHZB5F0QYTnR1rd9M0hFkO/Z2iPA==
X-Received: by 2002:aa7:da41:: with SMTP id w1mr996738eds.24.1611266352708;
 Thu, 21 Jan 2021 13:59:12 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r7sm2851863ejo.20.2021.01.21.13.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 13:59:11 -0800 (PST)
Subject: Re: [PATCH 17/25] hw/arm/stellaris: Create Clock input for watchdog
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-18-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5ee67f0e-fcda-22bb-2001-109e488cd632@amsat.org>
Date: Thu, 21 Jan 2021 22:59:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Create and connect the Clock input for the watchdog device on the
> Stellaris boards.  Because the Stellaris boards model the ability to
> change the clock rate by programming PLL registers, we have to create
> an output Clock on the ssys_state device and wire it up to the
> watchdog.
> 
> Note that the old comment on ssys_calculate_system_clock() got the
> units wrong -- system_clock_scale is in nanoseconds, not
> milliseconds.  Improve the commentary to clarify how we are
> calculating the period.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/stellaris.c | 43 +++++++++++++++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 12 deletions(-)
...

>  /*
> - * Caculate the sys. clock period in ms.
> + * Calculate the system clock period. We only want to propagate
> + * this change to the rest of the system if we're not being called
> + * from migration post-load.

This part was not trivial to understand. I read the Clock API
doc again then found:

  Care should be taken not to use ``clock_update[_ns|_hz]()`` or
  ``clock_propagate()`` during the whole migration procedure because it
  will trigger side effects to other devices in an unknown state.

>   */
> -static void ssys_calculate_system_clock(ssys_state *s)
> +static void ssys_calculate_system_clock(ssys_state *s, bool propagate_clock)
>  {
> +    /*
> +     * SYSDIV field specifies divisor: 0 == /1, 1 == /2, etc.  Input
> +     * clock is 200MHz, which is a period of 5 ns. Dividing the clock
> +     * frequency by X is the same as multiplying the period by X.
> +     */
>      if (ssys_use_rcc2(s)) {
>          system_clock_scale = 5 * (((s->rcc2 >> 23) & 0x3f) + 1);
>      } else {
>          system_clock_scale = 5 * (((s->rcc >> 23) & 0xf) + 1);
>      }
> +    clock_set_ns(s->sysclk, system_clock_scale);
> +    if (propagate_clock) {
> +        clock_propagate(s->sysclk);
> +    }
>  }
...
>  static void stellaris_sys_reset_exit(Object *obj)
> @@ -690,7 +704,7 @@ static int stellaris_sys_post_load(void *opaque, int version_id)
>  {
>      ssys_state *s = opaque;
>  
> -    ssys_calculate_system_clock(s);
> +    ssys_calculate_system_clock(s, false);

So this makes sense.

I'll keep reviewing and come back to this patch later.

Regards,

Phil.

