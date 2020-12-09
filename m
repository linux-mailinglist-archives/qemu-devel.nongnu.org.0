Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3BD2D3DF3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 09:54:40 +0100 (CET)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvF9-0001gw-0v
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 03:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kmvAt-0000K7-Lg
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:50:15 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:46572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kmvAr-00048A-Ta
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:50:15 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 91D3E21CD2;
 Wed,  9 Dec 2020 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1607503811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGg4omeGHmNIqfFq0CvLtVEQ5wzSsNFl8syHq41T9MI=;
 b=vs2di5ahYRuneUFiHMMwquxfBR/eFpS0VP0Q3uybHPjnhATwxtqMsKbqtJQQKm7fTH3I0K
 Bifx9IlCuYkt8o5cj8nElXwT8F+mveFvk3hFPa+XJMtexhwDp3o6QW7lP7NZgw5/yTBezq
 HlYlsHnPCOuYHQ6GF3P21b2cH99u9wI=
Subject: Re: [PATCH 3/4] clock: Remove clock_get_ns()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-4-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <88337452-5486-b3e6-ac5c-cad308852492@greensocs.com>
Date: Wed, 9 Dec 2020 09:50:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201208181554.435-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 7:15 PM, Peter Maydell wrote:
> Remove the now-unused clock_get_ns() API and the CLOCK_PERIOD_TO_NS()
> macro that only it was using.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>   docs/devel/clocks.rst | 17 +++++++++++++----
>   include/hw/clock.h    |  6 ------
>   2 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index aebeedbb95e..9a93d1361b4 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -238,8 +238,17 @@ object during device instance init. For example:
>   Fetching clock frequency/period
>   -------------------------------
>   
> -To get the current state of a clock, use the functions ``clock_get()``,
> -``clock_get_ns()`` or ``clock_get_hz()``.
> +To get the current state of a clock, use the functions ``clock_get()``
> +or ``clock_get_hz()``.
> +
> +``clock_get()`` returns the period of the clock in its fully precise
> +internal representation, as an unsigned 64-bit integer in units of
> +2^-32 nanoseconds. (For many purposes ``clock_ticks_to_ns()`` will
> +be more convenient; see the section below on expiry deadlines.)
> +
> +``clock_get_hz()`` returns the frequency of the clock, rounded to the
> +next lowest integer. This implies some inaccuracy due to the rounding,
> +so be cautious about using it in calculations.
>   
>   It is also possible to register a callback on clock frequency changes.
>   Here is an example:
> @@ -254,8 +263,8 @@ Here is an example:
>            */
>   
>           /* do something with the new period */
> -        fprintf(stdout, "device new period is %" PRIu64 "ns\n",
> -                        clock_get_ns(dev->my_clk_input));
> +        fprintf(stdout, "device new period is %" PRIu64 "* 2^-32 ns\n",
> +                        clock_get(dev->my_clk_input));
>       }
>   
>   Calculating expiry deadlines
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index a9425d9fb14..9c0b1eb4c3f 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -39,7 +39,6 @@ typedef void ClockCallback(void *opaque);
>    * macro helpers to convert to hertz / nanosecond
>    */
>   #define CLOCK_PERIOD_FROM_NS(ns) ((ns) * (CLOCK_PERIOD_1SEC / 1000000000llu))
> -#define CLOCK_PERIOD_TO_NS(per) ((per) / (CLOCK_PERIOD_1SEC / 1000000000llu))
>   #define CLOCK_PERIOD_FROM_HZ(hz) (((hz) != 0) ? CLOCK_PERIOD_1SEC / (hz) : 0u)
>   #define CLOCK_PERIOD_TO_HZ(per) (((per) != 0) ? CLOCK_PERIOD_1SEC / (per) : 0u)
>   
> @@ -214,11 +213,6 @@ static inline unsigned clock_get_hz(Clock *clk)
>       return CLOCK_PERIOD_TO_HZ(clock_get(clk));
>   }
>   
> -static inline unsigned clock_get_ns(Clock *clk)
> -{
> -    return CLOCK_PERIOD_TO_NS(clock_get(clk));
> -}
> -
>   /**
>    * clock_ticks_to_ns:
>    * @clk: the clock to query
> 

