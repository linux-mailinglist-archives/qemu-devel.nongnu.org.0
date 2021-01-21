Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF22FF7B0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:04:08 +0100 (CET)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2i3j-00012y-Dm
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i0v-0007gq-Eu; Thu, 21 Jan 2021 17:01:13 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i0u-0005xX-1Z; Thu, 21 Jan 2021 17:01:13 -0500
Received: by mail-ej1-x633.google.com with SMTP id ke15so4780355ejc.12;
 Thu, 21 Jan 2021 14:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rujD0roQ0HOQu9W1/SwRDP5CFtHEOzLbMnNErSaFFgw=;
 b=JPvhJV3TL2+wLytwcfHgqphilEMPWtGwcUv/Y64B3hNawbVVE90FAiC2Gh6XnLftuC
 AYtiUbmMkFICsv7CxDebjJD15fTK9U058Vg8JSWGz707pNYUZG+3iQxphdqDO/v4A/9K
 0pel5Az55x9zA2e+/y9PioIDN3AVlJYjqe7R3HFv8eHAzTPzM64B0sAnkKaQK+y95H9S
 hWQfxR/DjMLo/JdK5I6O7JXGIXIh4hY3spRS9hR4OHRV9u494b3b9mqiF+C/efHmp+fw
 lw2OwrHa/0PowPJ7Pfa8TsiK+B6202EqcczMh4Nq+E9Lb3ksCOtCyEezVjhhw4soITT4
 YwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rujD0roQ0HOQu9W1/SwRDP5CFtHEOzLbMnNErSaFFgw=;
 b=qhSRZIKyUgiOgzlGIprPNMW6kAER9axp1EpXzM4r+yyG3VhPsgin1t+ZztbPah20T8
 pvd6ZFFc2RM77jUNId/X3bZHQy/cqwdWoIzqWvPbTGNEzAuqZME22dCqhibT9k+3Zw6I
 DosBhS1KdJQ4C7aJnQx1yrCqox159yHZVaxwOkO+7WF8upUAOVfsaQHAHMi/UZgObTXg
 tAEY/4Zh1JuSL8ZcF8mVi/hArzaYP2Q+hZXoEiNYRpJ2VGDUNMr4WEtEElN/46uzXDEJ
 3C7HNgLVYJjNG3j5cg/FMeQ81hufDKX9xoHtQBW8YeIS6vQmaKmqPpYM4N6pw8XIVxNY
 55Qg==
X-Gm-Message-State: AOAM531wGAbMNtIkvyuZ4objpEHrDANuvnEuKcoNsDq+shQbxKS6LWrz
 UiUNWU7xzV3PRrSvaZVMl04=
X-Google-Smtp-Source: ABdhPJx3xFT24i3PzBQVu2gz44UDD2lL/jABLyZ5xYZwLGyzVTo6SRJlgI7m5Rh+2O43VPBs/chA9g==
X-Received: by 2002:a17:906:2e9a:: with SMTP id
 o26mr1003426eji.77.1611266469911; 
 Thu, 21 Jan 2021 14:01:09 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id di28sm3496425edb.71.2021.01.21.14.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 14:01:09 -0800 (PST)
Subject: Re: [PATCH 18/25] hw/timer/cmsdk-apb-timer: Convert to use Clock input
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-19-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <db511564-4829-99c4-f84b-14158c1ee442@amsat.org>
Date: Thu, 21 Jan 2021 23:01:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Switch the CMSDK APB timer device over to using its Clock input; the
> pclk-frq property is now ignored.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/cmsdk-apb-timer.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
> index c63145ff553..f053146d88f 100644
> --- a/hw/timer/cmsdk-apb-timer.c
> +++ b/hw/timer/cmsdk-apb-timer.c
> @@ -204,6 +204,15 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
>      ptimer_transaction_commit(s->timer);
>  }
>  
> +static void cmsdk_apb_timer_clk_update(void *opaque)
> +{
> +    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
> +
> +    ptimer_transaction_begin(s->timer);
> +    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
> +    ptimer_transaction_commit(s->timer);
> +}
> +
>  static void cmsdk_apb_timer_init(Object *obj)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> @@ -213,15 +222,16 @@ static void cmsdk_apb_timer_init(Object *obj)
>                            s, "cmsdk-apb-timer", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->timerint);
> -    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk", NULL, NULL);
> +    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk",
> +                                 cmsdk_apb_timer_clk_update, s);
>  }
>  
>  static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
>  {
>      CMSDKAPBTimer *s = CMSDK_APB_TIMER(dev);
>  
> -    if (s->pclk_frq == 0) {
> -        error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
> +    if (!clock_has_source(s->pclk)) {
> +        error_setg(errp, "CMSDK APB timer: pclk clock must be connected");
>          return;
>      }
>  
> @@ -232,7 +242,7 @@ static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
>                             PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
>  
>      ptimer_transaction_begin(s->timer);
> -    ptimer_set_freq(s->timer, s->pclk_frq);
> +    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
>      ptimer_transaction_commit(s->timer);
>  }

Nice to see how ptimer_set_period_from_clock() fits :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

