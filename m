Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713C961813A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 16:15:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqbuT-0007nQ-Ep; Thu, 03 Nov 2022 11:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oqbuQ-0007iT-6C; Thu, 03 Nov 2022 11:13:34 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oqbuM-00079R-RB; Thu, 03 Nov 2022 11:13:33 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-13be3ef361dso2455964fac.12; 
 Thu, 03 Nov 2022 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Whaq+DJoI8jeGgKTzbctNuzA3rAS5NpN9g++Ef8Jcs=;
 b=RNv+VS3BIbb+uEs/vC+FoEcYqgBnr4kts+slhiImNRvlxQdpF5BsaKJccHq6m0Hhgd
 AE0frIUIQfsbvNXyg8+inrah1XRcCm+trfTQZt4tVI0j6WW/EOCFk5H/4iXfYXODDH+T
 B3WGjl/KRjt/JZytGLTK9TfmVpBPwpak9a9pgPDkDXMvHIQxrEnVuEHfdJ6lsTiY4u9T
 aUWZbu2G6VGbhFdhimJF16UzFt0G83Dp+jZeszbv6OmDJi4JxFRaVRUQa3mOg8xXNF7H
 xyKKYuoDaTkGQ4QJOT2+2vTFDI/KCTm/U+lqzgVzkm09oviCD4PYoiE39LHwVL6oZg+y
 yveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Whaq+DJoI8jeGgKTzbctNuzA3rAS5NpN9g++Ef8Jcs=;
 b=UlxqU1Ydk4Bo+iUFDSO9qh2vVJ4AaUkJCc7kM+1+fbNz1a672+j/X6RKueJ34Y+Cqo
 3ZE34QpxWOALWAyM6FUuS7UkX0oitq8J3yBjtNizHG62aazcN9cwRRa9tfdGgzp+YeTX
 7TsPIcIicjnL4dRmDfF5HLdk82EcGmx/wRD3NACvRSVPmzCTJPcDddofBvd1aR4NpC9T
 hhyHTMqbWyiqmED0heWq1gOvp+Zg3/3IM7X1JV4ujfyJ7aC+Y4JkAc1PQIU3t1f9qkIK
 AjfeTnfOtwLpWg9yzQ2dteM52I09P3g+tJ9nd3Sw/Muk+6C71jvQQzGwpDCy1K7enS8E
 GTeQ==
X-Gm-Message-State: ACrzQf3jOX6D5Oz3ennSzyAs23poMei81xkMQJau7sVTuGbx3BOebOjo
 TP4yugBMOBcGEL6znnRYxZM=
X-Google-Smtp-Source: AMsMyM6mOvMtW/mTtuWHNfw9HLGhEbsAaVywwzOSnz9QnVsD9JldiXJPeLZROWDtvmdLDyw+LQkdyg==
X-Received: by 2002:a05:6870:5801:b0:13c:14f9:869f with SMTP id
 r1-20020a056870580100b0013c14f9869fmr18181381oap.89.1667488408887; 
 Thu, 03 Nov 2022 08:13:28 -0700 (PDT)
Received: from [192.168.10.102] ([177.189.35.250])
 by smtp.gmail.com with ESMTPSA id
 5-20020a9d0f05000000b00661ad8741b4sm434377ott.24.2022.11.03.08.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 08:13:28 -0700 (PDT)
Message-ID: <e83d45c1-ded1-5176-2229-0053579a45df@gmail.com>
Date: Thu, 3 Nov 2022 12:13:22 -0300
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
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <29fdeb41-5032-fca0-62a8-c8ee7fa611e7@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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



On 11/3/22 09:51, BALATON Zoltan wrote:
> On Wed, 2 Nov 2022, Daniel Henrique Barboza wrote:
>> On 11/1/22 19:29, Philippe Mathieu-Daudé wrote:
>>> This is a respin of Bernhard's v4 with Freescale eSDHC implemented
>>> as an 'UNIMP' region. See v4 cover here:
>>> https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shentey@gmail.com/
>>>
>>> Since v5:
>>> - Rebased (ppc-next merged)
>>> - Properly handle big-endian
>>>
>>> Since v4:
>>> - Do not rename ESDHC_* definitions to USDHC_*
>>> - Do not modify SDHCIState structure
>>>
>>> Supersedes: <20221031115402.91912-1-philmd@linaro.org>
>>
>> Queued in gitlab.com/danielhb/qemu/tree/ppc-8.0 (since we missed the
>> freeze for 7.2).
> 
> Could you please always use ppc-next to queue patches for the next upcoming version and ppc-7.2 for the current version? Unless this makes your workflow harder in which case ignore this but the reason I ask is because then it's enough for me to only track ppc-next if I need to rebase patches on that and don't have to add a new branch at every release (unless I have some patches to rebase on it during a freeze but that's less likely than rebasing on your queued patches for the next release xo using version for the current branch and keep next for the future versions makes more sense to me).

Note that doing "ppc-7.2" for the current release and ppc-next for the
next release will not prevent you from adding a new branch at every
release, e.g. for the next release you would need to add a ppc-8.0
branch.

'ppc-next' is used like a standard, a way of telling 'this is the next
pull request that is going upstream'. Can we change it? Sure, but if the
idea is to avoid new branches every new release then I suggest the
following:

- ppc-next: keep it as is
- ppc-next-release/ppc-future: branch that will host any code for the next
release during the code freeze window. Note that this branch will become
'ppc-next' when the new release cycle begins


This would avoid changing everyone's workflow with the current ppc-next
usage, while also standardize a branch for the future release patches
during freeze.



> 
>> BTW, checkpatch complained about this line being too long (83 chars):
>>
>>
>> 3/3 Checking commit bc7b8cc88560 (hw/ppc/e500: Add Freescale eSDHC to e500plat)
>> WARNING: line over 80 characters
>> #150: FILE: hw/ppc/e500.c:1024:
>> +                                    pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,
>>
>>
>> The code except is this:
>>
>>    if (pmc->has_esdhc) {
>>        create_unimplemented_device("esdhc",
>>                                    pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,
>>                                    MPC85XX_ESDHC_REGS_SIZE);
>>
>>
>> To get rid of the warning we would need to make a python-esque identation (line
>> break after "(" ) or create a new variable to hold the sum. Both seems overkill
>> so I'll ignore the warning. Phil is welcome to re-send if he thinks it's worth
>> it.
> 
> Or you could break indentation and not start at the ( but 3 chars back. I.e.:
> 
> create_unimplemented_device("esdhc",
>                           pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,
>                           MPC85XX_ESDHC_REGS_SIZE);
> 
> But I think it can be just ignored in this case.
> 
>> And I'll follow it up with my usual plea in these cases: can we move the line size warning to 100 chars? For QEMU 8.0? Pretty please?
> 
> I think the consensus was to keep 80 columns if possible, this is good becuase you can open more files side by side (although it does not match well with the long _ naming convention of glib and qemu)  but we have a distinction between checkpatch warning and error in line length. I think it will give error at 90 chars but as long as it's just warns that means: fix it if you can but in rare cases if it's more readable with a slightly longer line then it is still acceptable. I think that's the case here, splitting the line would be less readable than a few chars longer line.

Yeah I know that we can usually ignore these warnings. I keep bringing
this up because it's weird to keep bothering with 80 chars per line when
people are using 28" flat screen monitors, multiple screen desktops
and so on.


Thanks,


Daniel

> 
> Regards,
> BALATON Zoltan

