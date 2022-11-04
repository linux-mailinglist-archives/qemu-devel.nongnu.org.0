Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E06193D8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:48:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtJ3-0001ot-P1; Fri, 04 Nov 2022 05:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oqtIt-0001nm-RL; Fri, 04 Nov 2022 05:47:59 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oqtIq-00071k-G5; Fri, 04 Nov 2022 05:47:59 -0400
Received: by mail-oi1-x233.google.com with SMTP id c129so4686381oia.0;
 Fri, 04 Nov 2022 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i4Gkd3YbbHu8jRYN/YysKX9qPCAiML/B7f3oTBSb5AE=;
 b=IMO/yfP4Szfl2O+vhc+1uITvz2YDcRmLP0tmLc6GRP6gURdZvFuLrjONFYkn6o5kJh
 J4KMu51YUtiuIzi5C6CVswsH2PkEWIfPYyGveXdbTFU8i2+EdQ69CAitEGVulRrHE/Kx
 oDndW98U2FoK2b5fbol4+LWH7cvOhSdp26KVxoN7AklnBHfdv7hl4/9XhZ/Q+jOCBLWg
 8Yni4vLKlxQ5bQ1FPc/3DA8ZR6XMiUvK9D+NpUyLUnZ7x35YjHGaLb2DUoO1Bj897VY/
 00rgYo8kbR9KeC3wgV7YJEJuRWF6yVxkqiqGBluNVb/tUilFEuj7ZKz2y4Rvm9h33lyN
 uD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i4Gkd3YbbHu8jRYN/YysKX9qPCAiML/B7f3oTBSb5AE=;
 b=vEVlYJCUWxXazwOp+Uee42v0Me3J7pGDkhYkWfbN042IZMxhSFGKFHWl0yFZheybtf
 RAabw3QNxy1inZpBucHlu9k+A7kctUiZyzSfH7dXfqXaAA3Ip8dSDEnL0hBCBB3s4M80
 7zTZ9z5vNkomG6w1tDJmL9cZIFQsTbpvATFohUn2GWQNZNRgNdFlHQFxMfJlrVYcwQvV
 wo2915S5T/R2EtFYfH7in03IkVOX4s7tXDOW5yIbU4yBhi/JFXTGRvIC5z8MLRcNPB18
 8ccjztXqCE+BuHFylZUL3gBHLGQQie1yQ5uyr0qUaFcfJrwlx3uxKfHIGVCg9FUyVm59
 npzg==
X-Gm-Message-State: ACrzQf33SoQZzz+e/XutcDwF6UKsyW5+wA2HiVQveoSaIMJmmY+HmQ7v
 P/wanzeJHDv/Sl6+LHrTTU8=
X-Google-Smtp-Source: AMsMyM7NlacD6FiKUk8b3MQI1QG5wDOuzByPUWnkq7UL5PvYlEtWN+4Aq8K6kBEynjO2tkhlbYeu2Q==
X-Received: by 2002:a05:6808:1799:b0:35a:2e49:403c with SMTP id
 bg25-20020a056808179900b0035a2e49403cmr9723742oib.299.1667555272037; 
 Fri, 04 Nov 2022 02:47:52 -0700 (PDT)
Received: from [192.168.10.102] ([187.34.29.120])
 by smtp.gmail.com with ESMTPSA id
 5-20020a9d0f05000000b00661ad8741b4sm1260644ott.24.2022.11.04.02.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 02:47:51 -0700 (PDT)
Message-ID: <1b67693c-dcd7-0446-632a-042d671d3d04@gmail.com>
Date: Fri, 4 Nov 2022 06:47:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 0/3] ppc/e500: Add support for eSDHC
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org
References: <20221101222934.52444-1-philmd@linaro.org>
 <72e7c23d-5a07-8d51-2bdb-cf957b84ac2f@gmail.com>
 <29fdeb41-5032-fca0-62a8-c8ee7fa611e7@eik.bme.hu>
 <e83d45c1-ded1-5176-2229-0053579a45df@gmail.com>
 <c80d95d0-c206-5bc0-7393-308873de3d39@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <c80d95d0-c206-5bc0-7393-308873de3d39@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 11/3/22 23:31, BALATON Zoltan wrote:
> On Thu, 3 Nov 2022, Daniel Henrique Barboza wrote:
>> On 11/3/22 09:51, BALATON Zoltan wrote:
>>> On Wed, 2 Nov 2022, Daniel Henrique Barboza wrote:
>>>> On 11/1/22 19:29, Philippe Mathieu-Daudé wrote:
>>>>> This is a respin of Bernhard's v4 with Freescale eSDHC implemented
>>>>> as an 'UNIMP' region. See v4 cover here:
>>>>> https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shentey@gmail.com/
>>>>>
>>>>> Since v5:
>>>>> - Rebased (ppc-next merged)
>>>>> - Properly handle big-endian
>>>>>
>>>>> Since v4:
>>>>> - Do not rename ESDHC_* definitions to USDHC_*
>>>>> - Do not modify SDHCIState structure
>>>>>
>>>>> Supersedes: <20221031115402.91912-1-philmd@linaro.org>
>>>>
>>>> Queued in gitlab.com/danielhb/qemu/tree/ppc-8.0 (since we missed the
>>>> freeze for 7.2).
>>>
>>> Could you please always use ppc-next to queue patches for the next upcoming version and ppc-7.2 for the current version? Unless this makes your workflow harder in which case ignore this but the reason I ask is because then it's enough for me to only track ppc-next if I need to rebase patches on that and don't have to add a new branch at every release (unless I have some patches to rebase on it during a freeze but that's less likely than rebasing on your queued patches for the next release xo using version for the current branch and keep next for the future versions makes more sense to me).
>>
>> Note that doing "ppc-7.2" for the current release and ppc-next for the
>> next release will not prevent you from adding a new branch at every
>> release, e.g. for the next release you would need to add a ppc-8.0
>> branch.
>>
>> 'ppc-next' is used like a standard, a way of telling 'this is the next
>> pull request that is going upstream'. Can we change it? Sure, but if the
>> idea is to avoid new branches every new release then I suggest the
>> following:
>>
>> - ppc-next: keep it as is
>> - ppc-next-release/ppc-future: branch that will host any code for the next
>> release during the code freeze window. Note that this branch will become
>> 'ppc-next' when the new release cycle begins
>>
>>
>> This would avoid changing everyone's workflow with the current ppc-next
>> usage, while also standardize a branch for the future release patches
>> during freeze.
> 
> As I said above if this means changing your or other's workflow making it more inconvenient for you then just ignore my request as it does not worth the trouble this might cause for others. So only change it if it's not much trouble.
> 
> As for using next for future release and versioned branch for current one in freeze this might not completely eliminate the need to track it for me but makes it much less likely as I only need the freeze branch when I have to submit a fix during the freeze AND you also already have other fixes queued AND those fixes conflict with my patch. This is very unlikely so in most cases I can just base the fix on master during the freeze and not care about the freeze branch only in very rare cases. It's much more likely that I have outstanding patches that I have to rebase for the next release when you already queued patches e.g. during a freeze (or during development before pull requests but the latter case already uses ppc-next).
> 
> Philippe's solution to use something like ppc-freze, -fixes whatever without a version number for pathces during a freeze would also work as then I only need to track those two branches but this would also break your condition of always using ppc-next for the next pull request so again if this causes any trouble for others then just leave it as it is.


I think I'll actually make the change I proposed:

- ppc-next will always be the next incoming content for the current release,
like it's has been for some time now.

- ppc-future will consist of ppc-next + patches that didn't make the freeze.
And yeah, every change I make on ppc-next I'll rebase ppc-future accordingly.


I won't be using any versioned branch like ppc-7.2, ppc-8.0 or something.
These two branches can be used regardless of the current release number.

I'll do that later today.


Daniel

> 
>>>> BTW, checkpatch complained about this line being too long (83 chars):
>>>>
>>>>
>>>> 3/3 Checking commit bc7b8cc88560 (hw/ppc/e500: Add Freescale eSDHC to e500plat)
>>>> WARNING: line over 80 characters
>>>> #150: FILE: hw/ppc/e500.c:1024:
>>>> +                                    pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,
>>>>
>>>>
>>>> The code except is this:
>>>>
>>>>    if (pmc->has_esdhc) {
>>>>        create_unimplemented_device("esdhc",
>>>>                                    pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,
>>>>                                    MPC85XX_ESDHC_REGS_SIZE);
>>>>
>>>>
>>>> To get rid of the warning we would need to make a python-esque identation (line
>>>> break after "(" ) or create a new variable to hold the sum. Both seems overkill
>>>> so I'll ignore the warning. Phil is welcome to re-send if he thinks it's worth
>>>> it.
>>>
>>> Or you could break indentation and not start at the ( but 3 chars back. I.e.:
>>>
>>> create_unimplemented_device("esdhc",
>>>                           pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,
>>>                           MPC85XX_ESDHC_REGS_SIZE);
>>>
>>> But I think it can be just ignored in this case.
>>>
>>>> And I'll follow it up with my usual plea in these cases: can we move the line size warning to 100 chars? For QEMU 8.0? Pretty please?
>>>
>>> I think the consensus was to keep 80 columns if possible, this is good becuase you can open more files side by side (although it does not match well with the long _ naming convention of glib and qemu)  but we have a distinction between checkpatch warning and error in line length. I think it will give error at 90 chars but as long as it's just warns that means: fix it if you can but in rare cases if it's more readable with a slightly longer line then it is still acceptable. I think that's the case here, splitting the line would be less readable than a few chars longer line.
>>
>> Yeah I know that we can usually ignore these warnings. I keep bringing
>> this up because it's weird to keep bothering with 80 chars per line when
>> people are using 28" flat screen monitors, multiple screen desktops
>> and so on.
> 
> Not everyone does. I mostly use a single screen which is not 28" and still want to open more than one window without switching desktops or some may use laptops with smaller screens etc. 80 chars may be an old convention that could be raised now but probably this would just result in some files being formatted for longer lines while most of the older code still having 80 chars so it just brings inconsistency. Reformatting everything would not work either so maybe it's easier to just stick with it now.
> 
> Regards,
> BALATON Zoltan

