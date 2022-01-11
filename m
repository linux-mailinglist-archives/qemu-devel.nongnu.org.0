Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8EF48B560
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 19:08:55 +0100 (CET)
Received: from localhost ([::1]:36212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7LZm-0002DN-0h
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 13:08:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7LGC-0005pN-Au; Tue, 11 Jan 2022 12:48:40 -0500
Received: from [2607:f8b0:4864:20::935] (port=39503
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7LGA-0004tZ-L3; Tue, 11 Jan 2022 12:48:40 -0500
Received: by mail-ua1-x935.google.com with SMTP id m15so16914041uap.6;
 Tue, 11 Jan 2022 09:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HVPJA4CjjY2P3wlIH/UV8qvvoqZ9Uu8pyZjEaNA/gEg=;
 b=Bri42cUFVsRRCR+NF4BXgG5C5wEffLnum0JO44mt576IShqKXfWybGQAgtICWIVKbl
 fn/3wok/weqgKlAZGxIlY0FKWoeuEsHUn1oQjkgtx+6IzX9nC0njc1SS8SxctrtmQIoL
 FzvFSjImgmNmZOxQWEo6g7C+T0/aNbiZBPHiAQ6trT/MB1bACy0LlAWwtWmf9XU3h1u0
 qn1am2fD6Mak7PnYIPNYwWouPys2J1Y6qHlVi1GcokTX8NDciQpwpvshB1olPVeRnxJl
 AEZ6F0eFe+H+7yzKIqwP45wI0HdVdSFWZV92IZpHbhNvRk4mDNoyQwSRo2m9GuvKFq4I
 rzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HVPJA4CjjY2P3wlIH/UV8qvvoqZ9Uu8pyZjEaNA/gEg=;
 b=3IZ71YSVP5fXQuQomaR2OasPGFvAT/+oYQYsVr7w3Y6QUpMpMRn6xxGWEEpKXTkmKH
 T2t3KRrqwGNOWBjEex3vtzE2CdS+mJvUOgAHFjMzeGPp6JfcPq7ImlfROstuk3WJya3+
 d1s0J77DqlSH1hSoSYRJR1tkY6+8WUEYEHBzSdtDEVnit56ctAGKpj4gN/l952q1osX4
 Qszwcodyi1X72ljTPYBYyIe5SfUGBBWJoOPfDNLCb4bASRbQqLxUjNmlDpw3kjaazoEN
 m49AQC699UyMBcjkVNJyvVeHIkuE5Ek7vvH0v+QAaFsPtBWAshSYcqIuIWxpbt+6n3sq
 vpzQ==
X-Gm-Message-State: AOAM531vPoOLMpARp5dk2PxZKTOJmFQywWUDxl6Adjlz5eglB8P0QOy0
 xgZtaZoBfAWDo76NLbIEs+Q=
X-Google-Smtp-Source: ABdhPJx20BBJHVTPvO04j5tXABfiAW75A2mTsQl+zUdv+3qwlXoWYNY8ACPOzrLe4uMCTGiPnRW8lg==
X-Received: by 2002:a67:f5cc:: with SMTP id t12mr2499780vso.6.1641923317307;
 Tue, 11 Jan 2022 09:48:37 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id k6sm5934466uak.9.2022.01.11.09.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 09:48:37 -0800 (PST)
Message-ID: <e3dd9804-53e7-56b3-a13b-96f14252d4b4@gmail.com>
Date: Tue, 11 Jan 2022 14:48:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 4/5] ppc/pnv: Introduce user creatable pnv-phb4 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220111131027.599784-1-danielhb413@gmail.com>
 <20220111131027.599784-5-danielhb413@gmail.com>
 <69ab634e-bdb6-d5ad-e6be-771ac3d9a780@kaod.org>
 <a7b6515f-70da-24ce-006b-4e97a9a8577f@gmail.com>
 <8cf0a790-7dca-0d3b-7a2f-b5da5865999d@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <8cf0a790-7dca-0d3b-7a2f-b5da5865999d@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/11/22 12:47, Cédric Le Goater wrote:
> On 1/11/22 15:57, Daniel Henrique Barboza wrote:
>>
>>
>> On 1/11/22 11:42, Cédric Le Goater wrote:
>>> On 1/11/22 14:10, Daniel Henrique Barboza wrote:
>>>> This patch introduces pnv-phb4 user creatable devices that are created
>>>> in a similar manner as pnv-phb3 devices, allowing the user to interact
>>>> with the PHBs directly instead of creating PCI Express Controllers that
>>>> will create a certain amount of PHBs per controller index.
>>>>
>>>> We accomplish this by doing the following:
>>>>
>>>> - add a pnv_phb4_get_stack() helper to retrieve which stack an user
>>>> created phb4 would occupy;
>>>>
>>>> - when dealing with an user created pnv-phb4 (detected by checking if
>>>> phb->stack is NULL at the start of phb4_realize()), retrieve its stack
>>>> and initialize its properties as done in stk_realize();
>>>>
>>>> - use 'defaults_enabled()' in stk_realize() to avoid creating and
>>>> initializing a 'stack->phb' qdev that might be overwritten by an user
>>>> created pnv-phb4 device. This process is wrapped into a new helper
>>>> called pnv_pec_stk_default_phb_realize().
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>>
>>> Nothing is left in the stack model. I think the next cleanup is to
>>> get rid of it.
>>
>>
>> The first step would be to move some MemoryOps from the stack to the phb, then
>> little by little we can get into a point where the stack will just be a pointer
>> to its phb.
>>
>> This is something that we can keep working on in smaller bits here and there.
>> I mean, assuming that we're not going to use this code base for PHB5. If that's
>> the case then I can prioritize this cleanup.
> 
> PHB5 uses the same models. Only the PHB version and the root port
> model need some adaptation.
> 
> 
> On branch https://github.com/legoater/qemu/commits/powernv-7.0,
> I have merged :
> 
>    ppc/pnv: Move root port allocation under pnv_pec_stk_default_phb_realize()
>    ppc/pnv: Add a 'rp_model' class attribute for the PHB4 PEC
>    ppc/pnv: Remove PHB4 version property
> 
> preparing ground for :
> 
>    ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge
> 
> Should we rework slightly your patchset to include them ? Or we don't
> care may be. Please advise :)

I guess it's fine to add those 3 patches. Do you want me to re-send this series with
them included?


Daniel

> 
> Thanks,
> 
> C.
> 

