Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B59D64E2AA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 21:59:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5vJH-0000kf-Py; Thu, 15 Dec 2022 15:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5vJF-0000gV-48
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 15:58:29 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5vJD-0005OE-Hb
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 15:58:28 -0500
Received: by mail-ej1-x632.google.com with SMTP id n20so1666766ejh.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 12:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rl9xITtaCkagoyl4Bf/xnIcuaWSzA1SgjCNoN1aS4xc=;
 b=i2Z1fZ5i42ScT8DhgBCjy5ERg1p774IHJTSOqVYqhgJ9pEVW6mHGU03yPEsMY1um6/
 ef8KsODH98iC/xd3sspV1mkq32XHj16Q5ikaLuK5n9PTWhyz4UsBgtnuCrvWk7k2REUn
 p8ROHQCplDD5YvTQHq+wpFXoyPQ/Xxsnsagdj14jxQ44ilPiTSjVYOwE22PK8ON7yRxe
 ax3vbywkgGnBFesf8//J+ECUXXRBAsPK672lh3zQhcvUfitUevTo6xKpyD0A4NjZADna
 seczhAJ2r4VPh+2u2RThOpjw8JUpQVFXAz9+AlZGP6cL5n7+pG8L/wxJRVVvTfg2CiXx
 5SJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rl9xITtaCkagoyl4Bf/xnIcuaWSzA1SgjCNoN1aS4xc=;
 b=dFQygsRmrobfLEPIAE4/xcx+NvlsT7Aor41wC11B5YNjJ7DrbCZ1qAqZ3HXr1Beb+E
 xA7bCOyfj539kjQ6Oyd2qfLCiB0RpTrhKbNiaw0RaIzNPt3byR3zQvfIH9KvzDkBTgZx
 iXHQtkGi16AXn+j0aNMSwuhOntxlV5RRmniNiPJCS1l2CtLI7bdErBnYRgUNJpnqQa0I
 Nglw/qZ0Jea8HFYOOygIj+kLPPPIBQBIGPeDqCzNPmj83icGpkOQ+fy3LnngAhT1GD8b
 t1k9F49HApKJOYubSCtNg/UfOhZEVdhwSxBT4awwPf1x3lJDhgwB47i5pj0vh84joLqj
 eOpA==
X-Gm-Message-State: ANoB5pkMvH498kn8i4xbIwQm5+IqSQqzRMsQOSTvrzLvd0lxCpCJWlME
 gd1cuYtX0blilej4Hx04VZzJyw==
X-Google-Smtp-Source: AA0mqf55ewny6k89ZGZ406xdB9t1pvFNjRcSS5I+5EvWGIRjF02Uj6UXJVr8++pdFxT4rhL6+XG5mg==
X-Received: by 2002:a17:906:fb13:b0:7c1:ed:171c with SMTP id
 lz19-20020a170906fb1300b007c100ed171cmr24393532ejb.26.1671137905669; 
 Thu, 15 Dec 2022 12:58:25 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a170906539600b007c0b4387d2asm81644ejo.8.2022.12.15.12.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 12:58:25 -0800 (PST)
Message-ID: <2d3abe70-d1f8-736b-81fc-8b3c6aa60ea0@linaro.org>
Date: Thu, 15 Dec 2022 21:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] linux-user: Add translation for argument of msync()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <Y5rMcts4qe15RaVN@p100>
 <165fbdfe-8e72-0ab7-727e-0f54df9957b3@linaro.org>
 <b2432b6a-ceef-647d-3e0f-ff7a7bdc0beb@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <b2432b6a-ceef-647d-3e0f-ff7a7bdc0beb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 15/12/22 16:58, Richard Henderson wrote:
> On 12/14/22 23:58, Philippe Mathieu-Daudé wrote:
>>> --- a/linux-user/alpha/target_mman.h
>>> +++ b/linux-user/alpha/target_mman.h
>>> @@ -3,6 +3,10 @@
>>>
>>>   #define TARGET_MADV_DONTNEED 6
>>>
>>> +#define TARGET_MS_ASYNC 1
>>> +#define TARGET_MS_SYNC 2
>>> +#define TARGET_MS_INVALIDATE 4
>>> +
>>>   #include "../generic/target_mman.h"
>>>
>>>   #endif
>>> diff --git a/linux-user/generic/target_mman.h 
>>> b/linux-user/generic/target_mman.h
>>> index 1436a3c543..32bf1a52d0 100644
>>> --- a/linux-user/generic/target_mman.h
>>> +++ b/linux-user/generic/target_mman.h
>>> @@ -89,4 +89,17 @@
>>>   #define TARGET_MADV_DONTNEED_LOCKED 24
>>>   #endif
>>>
>>> +
>>> +#ifndef TARGET_MS_ASYNC
>>> +#define TARGET_MS_ASYNC 1
>>
>> Hmm don't we want to keep the host flag instead?
>>
>>     #define TARGET_MS_ASYNC MS_ASYNC
> 
> No.  What if the host has an odd value, like Alpha.

But TARGET_MS_ASYNC  would be defined in linux-user/alpha/target_mman.h
so this path won't apply... What am I missing?

