Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A53584CD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:34:19 +0200 (CEST)
Received: from localhost ([::1]:49408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUna-00024m-Sm
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUUlW-0001XH-54
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:32:10 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUUlU-0007eG-AP
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:32:09 -0400
Received: by mail-ed1-x535.google.com with SMTP id x4so2458443edd.2
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 06:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kt7tbjv09xtwAd3sZN3m2vdxy7FbjsowKoAOnpSDENg=;
 b=T1gDyEJlRZ7aY/VxiMxmf13F6J3EflsqF0PVLnRxM+1PT4s+Un+WS2lb6fuV2Nw6Nc
 6iJ/m4oSJp21zZ/j/sS7tmDnnQmvZHZGA5B/dLV7IlFGKEAa+XTAHaWYus3EU/LcA8Pz
 9wRYR57RmGSS70RCUmoDTbDUVuNVouexi7SZfPz4COnloyG2OWy1cac9YOm/pK3tPUhQ
 SbEuaC5EJIzC+b8VRIFeStXp9A6kxnIHlePnclKACi8rHwOBsmJEKnGniGoDWAVGqSCY
 pqqY1A3+Rk/d73Vf8/EGQaIoDr7wVQo95jxj/JY7VJj0o5lkylZHaW+2mk0dFl/U6eCB
 mosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kt7tbjv09xtwAd3sZN3m2vdxy7FbjsowKoAOnpSDENg=;
 b=bBfO0es9olNiGGGs1UfPLo9qbJ2612V7DxJXAkGcQx50usnK2uNUep8cZWxLrMAIw5
 3xCCyf/E1319Np6OxbzyFhiZN5JbGSgSnwaeK41UOpkhcyIxFymnuPjvTzW3rNaBuhjO
 qiS7v4Fas7b8l6PybEd0n6uXm7cqphwNk9eAU7k74depFz0Y+ewOjHlzUHdye8ez2j67
 ET46ZwUH/h+Kdmu59YiM4gPUEPEkiXtP8ZdOq/6EyBcxjLFz0vg/1EG9u7eJ0QV6NRlh
 qL64vek2KBhqcE6jPdRx4fHS9z+C719o4q8Vva+Vw94F5dS9FKaU2Ym/f/cYmZOqAky0
 k+rg==
X-Gm-Message-State: AOAM531Zz8A+T3fL8N+X2tqIi3k6fTtvI9dd7Ix18KaSUqJmp+bKgbzr
 HmRbTqOD0QV0dmJ7yJWtN1Y=
X-Google-Smtp-Source: ABdhPJy96GIbW58NY7iVzmYIi1T9qW6HqyntZV6vYnC1Fi/nQ6He4Q8mTRlO+fx2PTWr9YoFS2F2aw==
X-Received: by 2002:a05:6402:2744:: with SMTP id
 z4mr11453911edd.347.1617888726537; 
 Thu, 08 Apr 2021 06:32:06 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id g11sm17761652edt.35.2021.04.08.06.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 06:32:05 -0700 (PDT)
Subject: Re: [PATCH-for-6.0? v2] hw/isa/Kconfig: Add missing dependency VIA
 VT82C686 -> APM
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210316110353.3051738-1-f4bug@amsat.org>
 <05578055-216d-1cf3-93cc-a2b358374ca2@amsat.org>
 <da83b8d6-3d33-8dcc-a31a-ec2287802b2c@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <554a7fac-b896-0f22-ce53-7c1c2ed06572@amsat.org>
Date: Thu, 8 Apr 2021 15:32:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <da83b8d6-3d33-8dcc-a31a-ec2287802b2c@eik.bme.hu>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 3:22 PM, BALATON Zoltan wrote:
> On Thu, 8 Apr 2021, Philippe Mathieu-Daudé wrote:
>> This patch apparently got lost.
> 
> No, it's queued for 6.1 as part of my pegasos2 series in David's tree:
> 
> https://github.com/dgibson/qemu/commits/ppc-for-6.1

Ah great, thank you both.

> 
> Regards,
> BALATON Zoltan
> 
>> On 3/16/21 12:03 PM, Philippe Mathieu-Daudé wrote:
>>> TYPE_VIA_PM calls apm_init() in via_pm_realize(), so
>>> requires APM to be selected.
>>>
>>> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> Rebased on usb-20210315-pull-request
>>> Based-on: <20210315180240.1597240-1-kraxel@redhat.com>
>>> ---
>>>  hw/isa/Kconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>>> index 2691eae2f0c..55e0003ce40 100644
>>> --- a/hw/isa/Kconfig
>>> +++ b/hw/isa/Kconfig
>>> @@ -48,6 +48,7 @@ config VT82C686
>>>      select SERIAL_ISA
>>>      select FDC
>>>      select USB_UHCI
>>> +    select APM
>>>
>>>  config SMC37C669
>>>      bool
>>>
>>
>>

