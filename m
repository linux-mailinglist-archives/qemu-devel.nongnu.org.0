Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2D306723
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 23:19:45 +0100 (CET)
Received: from localhost ([::1]:43236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4tA8-0000L2-Oz
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 17:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4t7T-0007l6-Ae; Wed, 27 Jan 2021 17:17:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4t7R-0007Fj-4P; Wed, 27 Jan 2021 17:16:58 -0500
Received: by mail-wr1-x436.google.com with SMTP id v15so3520708wrx.4;
 Wed, 27 Jan 2021 14:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OTuEjDC5K6UsCHMjmJcHO+UyZ528TXMXVDTN+oruipQ=;
 b=olL+uqIlMjicg1X6Clpb/GX0bpsJvAU0r3puKuHh6TsH/jsPKm9Go2hqPV/TofGJIh
 a7s98nG/4X3BdNAb0oct4Fdthw6M4U88oFdT9bzQ0Ic5KnOVUtQXzxt33JX0OrBRgSfK
 +oIh/1NWKGUBOI7jeILdzqxDqRjmqLx6YiWasLIugjs9xZER+BC5V7ZKnPun9LDemo5v
 2ARCFfSw5oyB2t97ApUQ8t8K4+GmoeouoeFN8UWSp2+zI3TVTDWQDCg9/1dMFSvO4uoN
 HvULSwuVWgAKa+dhL4uoDpu86FpzPmswDTozHargZjQkGcGwRyxBK6irqnkcTLzqwQYQ
 2NHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OTuEjDC5K6UsCHMjmJcHO+UyZ528TXMXVDTN+oruipQ=;
 b=JT68fTc7ldiIU+QT4LZ+rtgWl4nCvUhTR3HPH0dNMDzn3fhvx9E/fTfN3ZzkytdBzE
 1hMVLsfobezKuvnFh3oza83xp7woOzbrXnyyqQwHYd7fZ45b5jAl8AXu7WLHfAxM/ztQ
 xENs0yEFN90uNDfEmC+w9CjJqVg1TCRDF8pLJ0+Qn/SBKR1KeeTNdcImuv8PPTyEZyIy
 6QnuzfJAO4vn6qWo4fs9c2y0Q84E5Fmz+PsImo5z52OjCYRw7rqqmpibYh70tnEbtUf/
 OH6mMPkpDr21uvQBbAIEvmdzQOdVPkNSvbq+L1JB5M6XvRqmSPM5uljIuwG6QZ82+fYR
 2cAA==
X-Gm-Message-State: AOAM53386N3ppewPPP6hRmTD4ZzApuSP1UlevmN2WziJyKF9Fm3ZZ+sD
 Mm2Sw+jcJ3w+HtXaOB43yWg=
X-Google-Smtp-Source: ABdhPJzxjCgzgKYZ/a+jec6DhUMGJiC9cC//u4stoLBb2A5YqUqX3WzVMYVtjvHoTo3nSit43toXqw==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr13194981wrn.333.1611785814972; 
 Wed, 27 Jan 2021 14:16:54 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s24sm3747148wmh.22.2021.01.27.14.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 14:16:54 -0800 (PST)
Subject: Re: [PATCH 17/25] hw/arm/stellaris: Create Clock input for watchdog
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-18-peter.maydell@linaro.org>
 <5ee67f0e-fcda-22bb-2001-109e488cd632@amsat.org>
Message-ID: <83870454-4d8b-bb1e-7449-9edd18618b51@amsat.org>
Date: Wed, 27 Jan 2021 23:16:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5ee67f0e-fcda-22bb-2001-109e488cd632@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 1/21/21 10:59 PM, Philippe Mathieu-Daudé wrote:
> On 1/21/21 8:06 PM, Peter Maydell wrote:
>> Create and connect the Clock input for the watchdog device on the
>> Stellaris boards.  Because the Stellaris boards model the ability to
>> change the clock rate by programming PLL registers, we have to create
>> an output Clock on the ssys_state device and wire it up to the
>> watchdog.
>>
>> Note that the old comment on ssys_calculate_system_clock() got the
>> units wrong -- system_clock_scale is in nanoseconds, not
>> milliseconds.  Improve the commentary to clarify how we are
>> calculating the period.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/arm/stellaris.c | 43 +++++++++++++++++++++++++++++++------------
>>  1 file changed, 31 insertions(+), 12 deletions(-)
> ...
> 
>>  /*
>> - * Caculate the sys. clock period in ms.
>> + * Calculate the system clock period. We only want to propagate
>> + * this change to the rest of the system if we're not being called
>> + * from migration post-load.
> 
> This part was not trivial to understand. I read the Clock API
> doc again then found:
> 
>   Care should be taken not to use ``clock_update[_ns|_hz]()`` or
>   ``clock_propagate()`` during the whole migration procedure because it
>   will trigger side effects to other devices in an unknown state.
> 
>>   */
>> -static void ssys_calculate_system_clock(ssys_state *s)
>> +static void ssys_calculate_system_clock(ssys_state *s, bool propagate_clock)
>>  {
>> +    /*
>> +     * SYSDIV field specifies divisor: 0 == /1, 1 == /2, etc.  Input
>> +     * clock is 200MHz, which is a period of 5 ns. Dividing the clock
>> +     * frequency by X is the same as multiplying the period by X.
>> +     */
>>      if (ssys_use_rcc2(s)) {
>>          system_clock_scale = 5 * (((s->rcc2 >> 23) & 0x3f) + 1);
>>      } else {
>>          system_clock_scale = 5 * (((s->rcc >> 23) & 0xf) + 1);
>>      }
>> +    clock_set_ns(s->sysclk, system_clock_scale);
>> +    if (propagate_clock) {
>> +        clock_propagate(s->sysclk);
>> +    }
>>  }
> ...
>>  static void stellaris_sys_reset_exit(Object *obj)
>> @@ -690,7 +704,7 @@ static int stellaris_sys_post_load(void *opaque, int version_id)
>>  {
>>      ssys_state *s = opaque;
>>  
>> -    ssys_calculate_system_clock(s);
>> +    ssys_calculate_system_clock(s, false);
> 
> So this makes sense.
> 
> I'll keep reviewing and come back to this patch later.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

