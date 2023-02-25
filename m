Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FB36A27F9
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 09:59:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqNp-0007nZ-BK; Sat, 25 Feb 2023 03:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVqNn-0007nM-KN; Sat, 25 Feb 2023 03:58:19 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVqNl-0004gE-V0; Sat, 25 Feb 2023 03:58:19 -0500
Received: by mail-oi1-x233.google.com with SMTP id y184so1339959oiy.8;
 Sat, 25 Feb 2023 00:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BLIPKejIEvzVDP3tVydByA2rvnJ/KzqtR68sthosnrA=;
 b=q0Ip23Posm/FeT2mquhj+qvKFXmj1QXJsLJulnub5leByq6Kgk5aGm3OjAw5jGvODc
 DW7LBksCwC1npg0ZwcdaOgYHUZ4LJIYbzYwkVoSe4oBbRX2N5MW6Ar7HiTy3499iQx2k
 H0sYTJyMPbtV1EmI0NXu/m1fVRv8EjReWNqHjk976eKXzCzr805877AkVAP5n1sWV8pP
 SRhTOAHgZ+ck8yzPkiaRFOxhnQ4R3Dhd3P4hGLOZr5/TyOLrDPCG1FY60nCRrpPp8LPL
 o46gqb+QLHoVFFMiLsm9j1Wq9eVYXkw2FIl5iCB1a69Fu7NeBvwUFoTItnIbZfW1cTVH
 AR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BLIPKejIEvzVDP3tVydByA2rvnJ/KzqtR68sthosnrA=;
 b=dprmtWfbHo46ak8zwvOWdOZp+eKyZOod1dLw2+4Z4pIXA7LERLlayMqBv51iT7fcsf
 cv81yP29dAjx589rfUqaoKY4gS68dg8NE8W4U39Jh62gZuC+GP/mUJYguSH9Qx8v9V1E
 KDg8A8VyXoKchLDzo6DEX4Dj/NAE7WUNaj+C4dH0Fu5Nu7kESKBuWkZKUIJIbFw/dCYW
 MhBtDQfADzNo2D6vsaKlc+GxdV6g2OqsdLsCRpH6PCelL5mORNVGP9LG3p5Dt+oOavm6
 3jXQvJkWyT3spbdBcCrpdmJZExeE1ysLzS+Q8idpFySL64F6otuu+NSILwyXwzBdouf8
 SDVA==
X-Gm-Message-State: AO0yUKVfH15e+LYZd1hsZKaAYLT+boLgceR5HXwvvYNP9NDQvHktkchK
 Exw4jifiiuyTe9rn239kVIs=
X-Google-Smtp-Source: AK7set+D/xSDb6zJ2eSya8nQmytXMzuaN/luS+Tont0qNadxohR6HtwKvR4wI/uBidsFBq5g0Fmd7g==
X-Received: by 2002:a54:418a:0:b0:384:637:a4f with SMTP id
 10-20020a54418a000000b0038406370a4fmr1680881oiy.10.1677315495906; 
 Sat, 25 Feb 2023 00:58:15 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 p129-20020acaf187000000b0038413a012dasm345754oih.4.2023.02.25.00.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 00:58:15 -0800 (PST)
Message-ID: <c3e26f55-26c1-86ca-b3fd-b2237ae937b4@gmail.com>
Date: Sat, 25 Feb 2023 05:58:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/5] hw/audio/via-ac97: Basic implementation of audio
 playback
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Bernhard Beschow <shentey@gmail.com>, =?UTF-8?Q?Volker_R=c3=bcmelin?=
 <vr_qemu@t-online.de>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, philmd@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <f84b42b8e811c6a0ddb23139fdfd654c8cc4f09c.1677004415.git.balaton@eik.bme.hu>
 <89f85024-6057-f0a8-3d4a-20eeaeec8878@t-online.de>
 <DF35DA6B-ED6A-43E3-A28E-7936560B6452@gmail.com>
 <62f3e9a1-f360-b525-7d1e-f57ccc8dca9e@eik.bme.hu>
 <23a7106f-bc25-20c4-d446-b0fff84cc2fb@gmail.com>
 <32aa39da-e6ec-4fcb-99fa-e1a09906decc@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <32aa39da-e6ec-4fcb-99fa-e1a09906decc@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/24/23 18:08, BALATON Zoltan wrote:
> On Fri, 24 Feb 2023, Daniel Henrique Barboza wrote:
>> On 2/24/23 10:05, BALATON Zoltan wrote:
>>> Just for some motivation, this is what we want to make possible for more people with QEMU 8.0: https://youtu.be/YY9RExl4VDI
>>
>> That's neat!
>>
>>>
>>> This would need at least my SM502 patches and fixing the IRQ routing in the VT8231 (this test was with my series for that, I'll ask testing Bernhard's version the same way once I get it and rebase my patches on it). AmigaOS can use ES1370 so the via-ac97 patches are not that important now but the other patches would be needed. I hope users won't have to wait until September to try this.
>>
>> If you're referring to "hw/display/sm501: Implement more 2D raster operations" then it's already
>> queued in ppc-next.
> 
> That one and another I've sent yesterday that adds fallbacks for pixman routines.
> 
>> In fact I believe you can re-send it with this series, with my r-b, and whoever
>> gets to send the PR can send everything at once.
> 
> OK I'll collect all the patches in one series and submit it early next week. Hopefully we can test over the weekend and address any comments by the freeze.

Yes please.

> 
>> If either Gerd of Phil wants to pick these up I have already acked the pegasos2 changes.
>>
>> If you want me to get this via qemu-ppc bear in mind that I need to send the PR March 7th
>> at the latest.
> 
> I'm aware of that, although if we get more CI outage which stops pulls maybe we should consider 1-2 week extension, but I'm planning accordingly and if there won't be unexpected delays (e.g. new late reviews asking for extensive changes) this should be ready a week before the freeze. I think we can do one or two more versions/

It's no possible to predict this kind of unexpected delay, yes. But in the end the
maintainer is here to mediate these situations. If the patches have acks and the
maintainer considered it worth pushing, then this late review must be so good that
it convinces the maintainer to drop the patches from the PR (and from the release,
in this case).

It can happen, sure, but it's not a given. Specially considering that we have a good
code freeze window to fix any bugs that we might have left behind during the development
cycle.


Thanks,


Daniel

> 
> Regards,
> BALATON Zoltan

