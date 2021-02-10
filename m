Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403133173AC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:51:04 +0100 (CET)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9yK7-0007Sb-9i
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9xpU-0005Yp-Um
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:19:24 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9xpT-0006VY-EW
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:19:24 -0500
Received: by mail-ed1-x536.google.com with SMTP id s11so4893748edd.5
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/qB1a01mxozqLOliwo6Nil14ds+AWRj3ZOOOmMFAdos=;
 b=BzbGkeoc5cEbcx5xWy0HLw3e3Da8mMoJOnM0NVMZOIysrn1tMNeSDZbVawb+sV8QLj
 nRl0SsYGx64IXhxpHWwffndUNOpaIVwwF6FEVO9NpHhfDSyNMbb1j02K5LrgRsbFjI1B
 K8vcZMCnwtriB5leAvGZPBe08RSdp6eEF3hB4tVseSpMJlQ226iSX70bs/eZZRu/3pRx
 iMNfxQ1FWxN/HdNy28c/S5Cr7bza1WlAjdvUvHQiyFE7Inxu+g8jmHF3VZc7+67wbSJR
 qoUa5TQdrOSZBJ8tA5Ibm8lq56Gaq+sLwr1GRGUC5SqjJRrdBNWKKerkXNEbz5yaSan8
 IiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/qB1a01mxozqLOliwo6Nil14ds+AWRj3ZOOOmMFAdos=;
 b=HchxSpKtZD3eg/n0HvBiOUuUJTAE9dunoJK8MGZGgVS1mK+BXHEWL9bwM2GCDb44zr
 hJrmnqeVTOP+Bh/R/adUEbeQjdsVzgdmkLTVCJWTGuE1dSynU4fg4rW9Nynqzpdw6TiS
 C+lUlQmRLhADgWqkLvWeHQruGPYdy/N183yCoi342FdVVWUdHRVKXPbEVYshtVCtREpe
 vgdHeiZIvh1hj2jd5LeVQQ2yGMo3TGmDOWiSD0AceB5HBtSr8wIpaXt3L8sf+v48Rih7
 cSuoBoalfjxXBwgEnlXI+ygqpPnhv+RP8e94uUQQyvY5etrvgbNyj4tjFV+O8ikCNZ8l
 i+/w==
X-Gm-Message-State: AOAM533azwEnb9NKsVgCt4QV2kE5oQw82+O86fy4jIBn6AcnpHQGab9i
 gFQAnECqjIwG1/PrSX+lVp8tGURu3DPEh0g1QbhxGw==
X-Google-Smtp-Source: ABdhPJwhoMldwayepHJWb6PVvSi7jvE1c1Qx13C89FJv3/4KFDk20iosWQTUjWSXtpS4nVpUw5YMS17qMExjeFk01oI=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr5246290edd.100.1612995561558; 
 Wed, 10 Feb 2021 14:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-2-peter.maydell@linaro.org>
 <CAGcCb13Jsfk=pqbCZBwrBgi7dv3QQQJ6Mb8ZVPJ0OCgvxxzQtA@mail.gmail.com>
In-Reply-To: <CAGcCb13Jsfk=pqbCZBwrBgi7dv3QQQJ6Mb8ZVPJ0OCgvxxzQtA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 22:19:10 +0000
Message-ID: <CAFEAcA-wwH5KNK1zMJVc-UL8oXnEeRg2kuOjjL8PasK59SQsAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clock: Add ClockEvent parameter to callbacks
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Luc Michel <luc@lmichel.fr>, Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 20:53, Hao Wu <wuhaotsh@google.com> wrote:
>
>
>
> On Tue, Feb 9, 2021 at 5:24 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>> diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
>> index 870a6d50c27..573f4876dc6 100644
>> --- a/hw/adc/npcm7xx_adc.c
>> +++ b/hw/adc/npcm7xx_adc.c
>> @@ -238,7 +238,7 @@ static void npcm7xx_adc_init(Object *obj)
>>      memory_region_init_io(&s->iomem, obj, &npcm7xx_adc_ops, s,
>>                            TYPE_NPCM7XX_ADC, 4 * KiB);
>>      sysbus_init_mmio(sbd, &s->iomem);
>> -    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
>> +    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL, ClockUpdate);
>
> Since there's no callback here should it be
>  s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL, 0);
> ?

Yes; thanks for the catch. (The function ignores the events argument
if there's no callback function specified, but 0 makes more sense.)

-- PMM

