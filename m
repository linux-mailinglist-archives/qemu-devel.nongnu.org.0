Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9514A26693F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 21:55:23 +0200 (CEST)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGp8k-0003pz-IV
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 15:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kGowj-0002iu-4U; Fri, 11 Sep 2020 15:42:57 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:60492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kGowh-0001sW-JO; Fri, 11 Sep 2020 15:42:56 -0400
Received: from [172.17.10.18] (unknown [172.17.10.18])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 3CB4A21CC1;
 Fri, 11 Sep 2020 19:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1599853373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEoM+5CdDyC0jQF39LCEo6KSMV3sGlesBTJr9UhF7lw=;
 b=jjuUzpFCalRByMJjbccIIz86r4uDY435PxxWIM6e7JEAJL8xn9YUU1izPukNlLmhKlL2gz
 GNwcQHjjCc4jgCVjqzedTBQpbP8NO3492rQYxZ6Dtx+FvOFC/sT00MnBNdq0wRlkwsDJQI
 IcjSOEqRfHtAHG/925hD6HucIb05J5c=
Subject: Re: [PATCH v5 3/7] hw/misc/led: Emit a trace event when LED intensity
 has changed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-4-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <b87e742d-2777-7db4-97ab-f6c7f22b2a54@greensocs.com>
Date: Fri, 11 Sep 2020 21:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910205429.727766-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 15:41:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/20 10:54 PM, Philippe Mathieu-Daudé wrote:
> Track the LED intensity, and emit a trace event when it changes.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   hw/misc/led.c        | 4 ++++
>   hw/misc/trace-events | 1 +
>   2 files changed, 5 insertions(+)
> 
> diff --git a/hw/misc/led.c b/hw/misc/led.c
> index 3ef4f5e0469..ebe1fa45b1e 100644
> --- a/hw/misc/led.c
> +++ b/hw/misc/led.c
> @@ -41,6 +41,10 @@ void led_set_intensity(LEDState *s, unsigned intensity_percent)
>           intensity_percent = LED_INTENSITY_PERCENT_MAX;
>       }
>       trace_led_set_intensity(s->description, s->color, intensity_percent);
> +    if (intensity_percent != s->intensity_percent) {
> +        trace_led_change_intensity(s->description, s->color,
> +                                   s->intensity_percent, intensity_percent);
> +    }
>       s->intensity_percent = intensity_percent;
>   }
>   
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 76c9ddb54fe..89d15f05f9a 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -216,6 +216,7 @@ grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx6
>   
>   # led.c
>   led_set_intensity(const char *color, const char *desc, uint8_t intensity_percent) "LED desc:'%s' color:%s intensity: %u%%"
> +led_change_intensity(const char *color, const char *desc, uint8_t old_intensity_percent, uint8_t new_intensity_percent) "LED desc:'%s' color:%s intensity %u%% -> %u%%"
>   
>   # pca9552.c
>   pca955x_gpio_status(const char *description, const char *buf) "%s GPIOs 0-15 [%s]"
> 

