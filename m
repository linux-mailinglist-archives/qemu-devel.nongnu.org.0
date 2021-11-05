Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD1D44696B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 21:07:00 +0100 (CET)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj5UJ-0007oL-FG
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 16:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mj5Su-0006dl-6H; Fri, 05 Nov 2021 16:05:32 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:43584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mj5Ss-0007wT-GK; Fri, 05 Nov 2021 16:05:31 -0400
Received: by mail-qk1-x736.google.com with SMTP id p138so3299223qke.10;
 Fri, 05 Nov 2021 13:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J3QA5UEuwwXEvUO1cx/vZDguLGvd9fhg5IzeYF9ae68=;
 b=fu5cTGbWjcZgodGaa0UFi0vMXIMgpH0gUUojYVYkxqA5ueriTLBaPihllUGfjlNGGI
 jUktzqBOHwWJnC2EGDdThkcKMDKskjBUSDkxKMfjq+8ed1+BApbn/dBIi5YqcAHdHSTb
 ljAOuRf0mTXaUNyuJSQroznZSIh2N+FQpAI/NsM3a4K1k9nEV0+B0phiWS1DiPK5Th4w
 YyqoMaJ2QS2K+n3DngXIGfT9J9f3vV+xrfTUJcXJYq6p8rCXmuATWWFB9k5S/gHyD5Al
 KUUUKcG07w182v/V+jZvPTYwpROQrFd6zzEoROvZDAcHpe8J9FcjLxZws/isac9gL7tr
 5NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J3QA5UEuwwXEvUO1cx/vZDguLGvd9fhg5IzeYF9ae68=;
 b=piPZUXLFvceoGAaR4F30cP+ztw+UkDvPqYPXA3f4YCfRMubVskxobrNy9flCPtBCsy
 tFZVRYQi/v6yuHnjTWFFxRbQXTQDKYnbvUNqdsaNkGJl6bv+oqgwVN4jsOBnHz2TMEgt
 7qFsbWw2KtJw7VfHgt2e9Ru5UBy1MVBxsJW4vqDabVraQXqS7qNTzf1QB8jj6FINfZxe
 jR44xFcn84VIxB8OfldNB1saZz1QWkN2c/TLrB2bgSpvu50hlVqBpES53bUKEcJzpAzl
 RhPX0XZ4yDdfV9GL1GzF5S9CGtAmiRXPSxexmVUksPmUFOyMLxjs48OiGCHOrDgKTV6B
 hUxQ==
X-Gm-Message-State: AOAM531viOZ3pgmiwmnRAOy6DYVA83kjtHylaeaeMQN1F/PdBnRhgyXZ
 AjRdgEMwfPPuhBJ+1BKpWYAZLRe5m70=
X-Google-Smtp-Source: ABdhPJyhAkcEGy+SS0MUoE3+tYnErM09AYUuSa/N20Eh8ynz5rkdCKUNYguupFH7GGvC3c/pTbqiKw==
X-Received: by 2002:a05:620a:29c6:: with SMTP id
 s6mr26883140qkp.350.1636142729103; 
 Fri, 05 Nov 2021 13:05:29 -0700 (PDT)
Received: from [192.168.10.222] (201-42-211-153.dsl.telesp.net.br.
 [201.42.211.153])
 by smtp.gmail.com with ESMTPSA id o8sm6612071qtk.77.2021.11.05.13.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 13:05:28 -0700 (PDT)
Message-ID: <91972ce2-8d1f-f22e-c87f-45cb3c221b18@gmail.com>
Date: Fri, 5 Nov 2021 17:05:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/ppc, hw/ppc: Change maintainers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, clg@kaod.org
References: <20211105034640.53754-1-david@gibson.dropbear.id.au>
 <8e05f98a-6a46-f728-5035-fab10f5a209a@gmail.com>
 <880124b9-5cd1-7fcb-fdc6-3d3f8a1da2b6@amsat.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <880124b9-5cd1-7fcb-fdc6-3d3f8a1da2b6@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.093,
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
Cc: peter.maydell@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/5/21 16:16, Philippe Mathieu-Daudé wrote:
> Hi Daniel,
> 
> On 11/5/21 10:48, Daniel Henrique Barboza wrote:
>> On 11/5/21 00:46, David Gibson wrote:
>>> As our day jobs and interests have moved onto other things, Greg and I
>>> have
>>> been struggling to keep on top of maintainership of target/ppc and
>>> associated pieces like the pseries and powernv machine types, with their
>>> platform specific devices.
>>>
>>> We've therefore discussed and plan to transfer maintainership to
>>> Cédric Le
>>> Goater (primary) and Daniel Henrique Barboza (backup).  Cédric and Daniel
>>> have been actively contributing to the area for some time, and they're
>>> supported in this by their current employer, IBM, who has an obvious
>>> interest in the platform.
>>
>> Thank you and Greg and Red Hat for all the years of service supporting
>> qemu-ppc in the community. IBM will shoulder this responsibility now.
> 
> In term of the MAINTAINERS file:
> 
>          S: Status, one of the following:
>             Supported:   Someone is actually paid to look after this.
>             Maintained:  Someone actually looks after it.
> 
> The PPC entries have a 'Maintained' status. You say "IBM will shoulder
> this responsibility", does that mean the entries will be 'Supported'
> as in "someone paid to look after them"?

Yes. It's appropriate to change the PPC entries of this patch to "Supported"
now.


> I wonder because both Cédric and you have some commits with an IBM
> email, but both are registering a non-IBM email as contact. I don't
> mind the email technical detail, but I am curious about the status
> and expectations.

I had problems using IBM corporate email with mailing lists in the past,
and started using this gmail account instead. I believe Cedric has a
similar sob story.

FWIW the contrib/gitdm/group-map-ibm file has both our emails there to
indicate that we're IBM contributors.


Thanks,


Daniel

> 
> Thanks,
> 
> Phil.
> 
>>> Greg and I do plan to stay around in some capacity for at least the next
>>> 6 months, providing reviews and advice to assist the new maintainers into
>>> the role.
>>
>> I hope both of you stay around way longer than that :)
>>
>>
>>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>
>>>
>>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>>> ---
>>>    MAINTAINERS | 20 ++++++++++++++------
>>>    1 file changed, 14 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 797be5b366..066c4fb2b0 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -262,8 +262,10 @@ F: hw/openrisc/
>>>    F: tests/tcg/openrisc/
>>>      PowerPC TCG CPUs
>>> -M: David Gibson <david@gibson.dropbear.id.au>
>>> -M: Greg Kurz <groug@kaod.org>
>>> +M: Cédric Le Goater <clg@kaod.org>
>>> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> +R: David Gibson <david@gibson.dropbear.id.au>
>>> +R: Greg Kurz <groug@kaod.org>
>>>    L: qemu-ppc@nongnu.org
>>>    S: Maintained
>>>    F: target/ppc/
>>> @@ -382,8 +384,10 @@ F: target/mips/kvm*
>>>    F: target/mips/sysemu/
>>>      PPC KVM CPUs
>>> -M: David Gibson <david@gibson.dropbear.id.au>
>>> -M: Greg Kurz <groug@kaod.org>
>>> +M: Cédric Le Goater <clg@kaod.org>
>>> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> +R: David Gibson <david@gibson.dropbear.id.au>
>>> +R: Greg Kurz <groug@kaod.org>
>>>    S: Maintained
>>>    F: target/ppc/kvm.c
>>>    @@ -1321,8 +1325,10 @@ F: include/hw/rtc/m48t59.h
>>>    F: tests/acceptance/ppc_prep_40p.py
>>>      sPAPR
>>> -M: David Gibson <david@gibson.dropbear.id.au>
>>> -M: Greg Kurz <groug@kaod.org>
>>> +M: Cédric Le Goater <clg@kaod.org>
>>> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> +R: David Gibson <david@gibson.dropbear.id.au>
>>> +R: Greg Kurz <groug@kaod.org>
>>>    L: qemu-ppc@nongnu.org
>>>    S: Maintained
>>>    F: hw/*/spapr*
>>> @@ -1382,6 +1388,8 @@ F: include/hw/pci-host/mv64361.h
>>>      Virtual Open Firmware (VOF)
>>>    M: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> +R: Cédric Le Goater <clg@kaod.org>
>>> +R: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>    R: David Gibson <david@gibson.dropbear.id.au>
>>>    R: Greg Kurz <groug@kaod.org>
>>>    L: qemu-ppc@nongnu.org
>>>
>>
> 

