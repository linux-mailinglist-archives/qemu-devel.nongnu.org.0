Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E594BC981
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 18:20:49 +0100 (CET)
Received: from localhost ([::1]:60598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLTPa-00078h-MR
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 12:20:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLTO9-0006GK-UD; Sat, 19 Feb 2022 12:19:17 -0500
Received: from [2a00:1450:4864:20::329] (port=53043
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLTNm-0002Iq-DD; Sat, 19 Feb 2022 12:19:17 -0500
Received: by mail-wm1-x329.google.com with SMTP id w13so6629136wmi.2;
 Sat, 19 Feb 2022 09:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oxHPPYLxhCp0eVups0JlUNoWEx27HcHzzDZ32ANCzpE=;
 b=YqbN6RyBYPZNZvSvu408ovDRgm/ek+3nDKv5iBpblfVJt7N5mU7xXzcWEBDLmLW5Ei
 WhMBxjEVABZ4ap+rWz2kvtr/y8a9yCLhvF5P8w1moNeZvhTqKtmmPHYEk10hbiUOrioJ
 Xk+YRR3TNlng+Py9YOVIk8nn9eZrjQF9zCCJFc9ifV1WnVFTQ3uRHc4PdWq7xBxMegx1
 ynARJGJPoGw0/O8LP0a9kfp0HT9dHSzZU9sW4mh++1Q5FraDWhUgAc5hiA/A8r3gLwQZ
 5zJ5bHHCU4icedZLksP5D3vlV1O4smaKFoNmf3AlZIOu63E60nEWDgtBs+J/wS5a4vjM
 pitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oxHPPYLxhCp0eVups0JlUNoWEx27HcHzzDZ32ANCzpE=;
 b=mUvJbx5MsX545FmLHc2fUb6J+NzZ6LBITuFRAOGm7RNsbvEzYPdh5BtvpZkgmF7cAJ
 toJRoDq0P0hMqgcyJXe0rYRO0JKTVSZybf+w/85WOfZPNTTX/vbIJhQFV+3mjf4Dxbej
 AFGUdu8HYdAQzpmfOmeq+YtnPekmpWnA7GxKKQGaZGUbJlApKiR4BTnjCDbVrqlGtJqe
 qesQWEr6mKB33TmLtvip5QFdEe8nfn2XfqCXvG7e/NKpCXBWoyMA6bjUSDhat0O0HIsE
 wUwy3KPVcFFc9jYL08J17FhklnlTJPkURn6AAw6Vx1g5+NidDXIRKY2DJJVnbxlxUsUE
 2sWg==
X-Gm-Message-State: AOAM531OEZCPzRx96XsxwFbXbVMK8loAvJzuuf2zQz3MTf/5krqSqgZT
 S6YqVzX5j4+UJV07k3FpX3VpQ+pTKhamaQ==
X-Google-Smtp-Source: ABdhPJwOUXmqDDAEc9M0qlwXyq8NELMTdRxUjSirTFm60o2uRSDQpVHl7IpvKoa0Mk6aL5oKFHywWw==
X-Received: by 2002:a05:600c:2259:b0:37d:3468:536d with SMTP id
 a25-20020a05600c225900b0037d3468536dmr11680752wmm.42.1645290665126; 
 Sat, 19 Feb 2022 09:11:05 -0800 (PST)
Received: from ?IPV6:2a10:800a:bb8:1:6510:42ac:bb55:9590?
 ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id az13sm25437850wrb.39.2022.02.19.09.11.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 09:11:04 -0800 (PST)
Message-ID: <649a783e-f214-b2d1-2c10-d0def052f0f7@gmail.com>
Date: Sat, 19 Feb 2022 19:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/1] hw/ide: share bmdma read and write functions between
 piix.c and via.c
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20220219080818.327683-1-liavalb@gmail.com>
 <20220219080818.327683-2-liavalb@gmail.com>
 <5b443413-5f5c-48f9-161-6573b79aa8e3@eik.bme.hu>
 <ba8fb8ae-9af0-a740-6451-1e12dba14691@gmail.com>
 <c0736fce-7f4b-7d7b-22a0-4eb102a8572@eik.bme.hu>
 <1066433-593c-c1c5-fa6d-1d30d1c5844@eik.bme.hu>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <1066433-593c-c1c5-fa6d-1d30d1c5844@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/19/22 17:57, BALATON Zoltan wrote:
> On Sat, 19 Feb 2022, BALATON Zoltan wrote:
>> Maybe even the first if that's already contained in the default 
>> function could be avoided with some reorganisation like
>>
>> if (size == 1) {
>>    remaining switch cases to set val
>> } else {
>>    val = bmdma_default_read();
>> }
>
> On second thought this misses the cases where size == 1 and addr is 
> those handeled in bmdma_default_read so one would still need the 
> default case in the if part and then it's not much better than 
> duplicating the if. Maybe calling the default first, then handling the 
> remaining cases, like
>
> val = bmdma_default_read();
> if (size == 1) {
>     remaining switch cases to set val
> }
> return val;
>
> is the simplest and avoids the duplicated if. (Now we only have two 
> trace messages instead of one but that's probably not a problem as 
> it's only a debugging aid.
>
Hmm, is it OK though to have two trace messages? I'm not against it, but 
if someone tries to use the debug messages to see what's going on, it's 
better to not have two of the same message as it will confuse people. We 
definitely don't want that to happen.

So, let's keep it simple (and remove code duplications) but also let's 
do that correctly, to ensure that in the view of the developer that uses 
the debug messages, it all seem clear and neat :)

>
>> but I wasn't sure that won't change anything so may need a bit more 
>> thought.
>>
>>>>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>>>>> ---
>>>>> hw/ide/pci.c         | 47 ++++++++++++++++++++++++++++++++++++++++
>>>>> hw/ide/piix.c        | 50 ++-----------------------------------------
>>>>> hw/ide/via.c         | 51 
>>>>> ++------------------------------------------
>>>>> include/hw/ide/pci.h |  4 ++++
>>>>> 4 files changed, 55 insertions(+), 97 deletions(-)
>>>>>
>>>>> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
>>>>> index 84ba733548..c8b867659a 100644
>>>>> --- a/hw/ide/pci.c
>>>>> +++ b/hw/ide/pci.c
>>>>> @@ -502,6 +502,53 @@ static const struct IDEDMAOps bmdma_ops = {
>>>>>     .reset = bmdma_reset,
>>>>> };
>>>>>
>>>>> +uint64_t bmdma_default_read(void *opaque, hwaddr addr,
>>>>> +                           unsigned size)
>>>>
>>>> Indentation off? Also everywhere else, usually we indent not with 
>>>> the parenthesis but with the list within. (Auto indent in most 
>>>> editors does that probably.)
>>>>
>>> I guess you mean that it should be:
>>>
>>> +uint64_t bmdma_default_read(void *opaque, hwaddr addr,
>>> +                                                unsigned size)
>>>
>>> Like this?
>>
>> No, like the code you've moved had it. The split line should start 
>> after the ( not on the same column. So:
>>
>> uint64_t bmdma_default_read(void *opaque, hwaddr addr,
>>                             unsigned size)
>>
>> but this line does not need to be split at all as it fits within 80 
>> chars so better to keep it one line and only split where needed.
>>
>>> I'm using Visual Studio Code, so I might not have the correct 
>>> settings for this editor with QEMU.
>>> The checkpatch script doesn't complain on style issues, so what can 
>>> I do to make this correct?
>>
>> If checkpatch is happy then probably not a problem but just look at 
>> how code is indented on other places and follow the same. The coding 
>> style doc may have some words on it too. I don't know what setting 
>> Visual Studio might need.

OK. I'll align it to the character after the start of the parenthesis. 
I'll take a look into other code snippets in QEMU, but at least in the 
IDE code, there are lots of code style issues (the checkpatch script 
says so) so I'll probably look into other parts of QEMU to see how it goes.

I'll take this a bit slow, as I wanted to send v2 today. This is 
probably not a good idea as we should let people to see this and maybe 
to let the maintainer (John) to look into this and put his comments on 
this too. I'll give this a couple of days - no rush here, although I'd 
be very happy to see things going forward as soon as possible, so we 
merge this patch and then going back to the ich6-ide patch, and then 
hopefully more patches to the IDE code to add more features and fixes in 
this part of QEMU codebase.

Thanks again for the suggestions, these are awesome and I really 
appreciate the effort you put into these!

Best regards,
Liav


