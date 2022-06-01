Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E3753A3A6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 13:12:14 +0200 (CEST)
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwMGs-0001Es-1F
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 07:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwLh7-0008JY-CI; Wed, 01 Jun 2022 06:35:17 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:37843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwLh5-00021t-Cr; Wed, 01 Jun 2022 06:35:16 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-f3381207a5so2139506fac.4; 
 Wed, 01 Jun 2022 03:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+0UGt23KosgLkQ+8TDWzY7iCosFcHec3SN1EQ+2sXIQ=;
 b=AojKYd9bSkJsjR/wsOmRUW+hnNl5NVMtdunUPBbmTzF1wYdjA+GWXf5ZHJA3e1K0TX
 kwxtnHLKi8GECUPO+AXZyU4vqD1vxXA6RPfKVsOoVEtxTuljAo9abGETGtxcVY3mZuk2
 OW9T76jP4SS1SCOWGHJlV+D+avwgcY7qyq0SsNI/qSRF4ysnW6MVKEgauVAwl8WQhDUE
 Bqfj6F7lnJ4+oVlLcklRDzb+JV3d2eIlSqpUUknOFjKeOrySWE08Y/h/nbXp9I/zgUyp
 +noGhzMlEYoJP6K5hJBxjk2Xbjm2bDFnTdYKyt83r3Rbo7fV79yZcg5As7siMMfmNOiu
 cvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+0UGt23KosgLkQ+8TDWzY7iCosFcHec3SN1EQ+2sXIQ=;
 b=CoN3oQB9stqRJRqD68QUm0X4BxiCcwz2JbsMBhTBgLq0muuXWhNMJO0L7Z7/XEohBD
 8tAyVhswvV1kwM4oBmqwmDUzRQdC65KyOPXSWKU/sXToyd2kdBDotNVp0gB4ElvhZ9hx
 tF6qIfMxnPc+3M8CTktToVL9SqDSt9PJAm6g4tFx66rn0U3GuWZHJEe/CIYxSM1ouK/Y
 8svtgmr5Vq4pNNfUeSUaDGrhOQNyBs/+VW6arDfboRXHkBcDa2cNzVFr0TnzcBooCyHF
 QKlvcKoFSfwdlJft2Z6VXu/MjxYHtk1SMKCimSQbud0AlfH7MjubTTEs8b2bPxyf/gul
 WwJA==
X-Gm-Message-State: AOAM5328/eS99AdtsLwHhCsUbIGJ1rnyhU/Spk+LlS+J2Rg+hAAqyGZ3
 DkYf+ZmRLZqBZApm9077gyI=
X-Google-Smtp-Source: ABdhPJx75j7g4qjoLYahfOPmT0W7C/QVgrcS+whXIUuqrmuVbLaCugZNlJAbUYTVRJSyFmEN9uIp1Q==
X-Received: by 2002:a05:6870:9594:b0:f2:db67:be52 with SMTP id
 k20-20020a056870959400b000f2db67be52mr16449295oao.222.1654079713415; 
 Wed, 01 Jun 2022 03:35:13 -0700 (PDT)
Received: from [192.168.10.102] ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a056870415400b000f5ce48efb2sm437410oad.58.2022.06.01.03.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 03:35:12 -0700 (PDT)
Message-ID: <d3a0baba-57d7-2086-d866-beb3099830e1@gmail.com>
Date: Wed, 1 Jun 2022 07:35:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, mopsfelder@gmail.com,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
 <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
 <20220601103825.498c378f@bahia>
 <5076ea8a-428d-5aa2-1a8c-cd38bf67c7f9@redhat.com>
 <20220601120324.66c77571@bahia>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220601120324.66c77571@bahia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/1/22 07:03, Greg Kurz wrote:
> On Wed, 1 Jun 2022 11:25:43 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 01/06/2022 10.38, Greg Kurz wrote:
>>> On Wed, 1 Jun 2022 09:27:31 +0200
>>> Thomas Huth <thuth@redhat.com> wrote:
>>>
>>>> On 31/05/2022 19.27, Murilo Opsfelder Araujo wrote:
>>>>> Update max alias to power10 so users can take advantage of a more
>>>>> recent CPU model when '-cpu max' is provided.
>> ...
>>> We already have the concept of default CPU for the spapr
>>> machine types, that is usually popped up to the newer
>>> CPU model that is going to be supported in production.
>>> This goes with a bump of the machine type version as
>>> well for the sake of migration. This seems a lot more
>>> reliable than the "max" thingy IMHO.
>>>
>>> Unless there's a very important use case I'm missing,
>>> I'd rather kill the thing instead of trying to resurrect
>>> it.
>>
>> It's about making ppc similar to other architectures, which
>> have "-cpu max" as well, see:
>>
>>    https://gitlab.com/qemu-project/qemu/-/issues/1038
>>
>> It would be nice to get something similar on ppc.
>>
> 
> Problem is that on ppc, given the variety of models and boards,
> the concept of "max" is quite fuzzy... i.e. a lot of cases to
> consider for a benefit that is unclear to me. Hence my questioning.
> If the idea is just to match what other targets do without a specific
> use case in mind, this looks quite useless to me.

I mean, yes, the use case is that users/tooling are using -cpu max with x86
and arm. We'd rather not increase the gap between them and ppc64 because we
ended up removing -cpu max.

Even if the concept might not be applicable to every machine we have we can alias
-cpu max to the default machine CPU.

> 
>> By the way, the warnings that you currently get when running with
>> TCG are quite ugly, too:
>>
>> $ ./qemu-system-ppc64
>> qemu-system-ppc64: warning: TCG doesn't support requested feature,
>> cap-cfpc=workaround
>> qemu-system-ppc64: warning: TCG doesn't support requested feature,
>> cap-sbbc=workaround
>> qemu-system-ppc64: warning: TCG doesn't support requested feature,
>> cap-ibs=workaround
>> qemu-system-ppc64: warning: TCG doesn't support requested feature,
>> cap-ccf-assist=on
>>
>> Maybe these could get fixed with a proper "max" CPU in TCG
>> mode, too?
>>
> 
> I don't think so. These warnings are the consequence of pseries
> being the default machine for ppc64, and the default pseries
> machine decides on the default CPU model and default values for
> features (in this case, these are mitigations for spectre/meltdown).
> TCG doesn't support them but we certainly don't want to add more
> divergence between TCG and KVM.

I sent a patch last year trying to suppress the warning:

https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05029.html

I proposed to suppress these warnings when the user didn't specifically
set those caps to true (which TCG doesn't support). David thought that
this was also a bad idea and we reached an impasse. Back then seemed like
I was the only one severely aggravated by these messages so I gave up :)


Thanks,


Daniel

> 
> Cheers,
> 
> --
> Greg
> 
>>    Thomas
>>
> 

