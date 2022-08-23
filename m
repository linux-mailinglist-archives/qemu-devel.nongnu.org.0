Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27459EA8F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:11:25 +0200 (CEST)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQYMz-0003Xf-5n
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oQYL0-00020H-CL; Tue, 23 Aug 2022 14:09:18 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:38722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oQYKy-0001CR-LV; Tue, 23 Aug 2022 14:09:18 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-11c5ee9bf43so17751509fac.5; 
 Tue, 23 Aug 2022 11:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Je7DZpz8w+iGbd2sZGon76XJv9s08poKMY2ZEs2t8CA=;
 b=IKLOKL1XnfZpm0blWQHWwTbpuEq3Q2CUACWWNKcsbnLzKMeLB39GWa8Hm5gejIkwnm
 4qWnSj7i3tQcda1VR9QHYb4Oj92paq4F/rxGgN+EsorRYZd4QQEQalwx04AQk92pl6Zq
 43KNcmK4QptLyrhh1FbcsANhY3a+3nfqaOH2Rfv0nZC6sjJskaICuWPt1lddNx2tDLh+
 e6V2vm/sPTLelnjHvNOxg7hKM14ig7lCks0hha+iKL30KSoR5kuA2CJR7+guLmZku3M/
 ROWNxWxpE7ge1fxrVVtvyPHxqy7heaR5oCwm5UohCC8HyxyXZZNr2VxsAxeeQn0OEPnQ
 XN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Je7DZpz8w+iGbd2sZGon76XJv9s08poKMY2ZEs2t8CA=;
 b=r6D+niXsIyQgDTl5vZgh6PDSoDHtbdhh1r/s2xEXAawFaLoPujZaIH75sz0SwTG3Oh
 rZibLOKq6VQ6TSMkEaJXvjh9xt6MhjOdI8KSkDsQM/BgQfdH21YmEBDvKnhPcHEJRR+b
 o9spyj+A8HrFTpjrlnwx4d38ev9RhyXCMDS6Tznvy4r7NxcSTEa0/bhvdkvlcxTIwmey
 TgbW4DD0c+gp6gYUiX8vuDeCmqXEsmqUiDn4RBOrpCSjCvtm7G74v7Del30L22I2JZLp
 swm5fKPinYslKsYhI5TVeYIFryLxw1ZRaMw1WarIeObuBtjfX27I8kpa6AL/sm4u22Va
 tGgg==
X-Gm-Message-State: ACgBeo1qpZEnFKhk7uFOpaSh/wGZDlUxAltJynG5bhjMsg+aFnOGoA42
 FWcLRRWOYfoW8p6gDa46ofI=
X-Google-Smtp-Source: AA6agR721AjGeYIjiOBCh8sx7YO1743PucWGObr4sXuiPDePfd2Vua7Gat2QpAYwLT6ey/COHiCegg==
X-Received: by 2002:a05:6870:32ca:b0:11d:2814:7de5 with SMTP id
 r10-20020a05687032ca00b0011d28147de5mr2101480oac.139.1661278154488; 
 Tue, 23 Aug 2022 11:09:14 -0700 (PDT)
Received: from [192.168.10.102] (201-1-67-25.dsl.telesp.net.br. [201.1.67.25])
 by smtp.gmail.com with ESMTPSA id
 y39-20020a9d22aa000000b00636eeba9209sm3885542ota.52.2022.08.23.11.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 11:09:13 -0700 (PDT)
Message-ID: <21f0dfe2-c0ef-33fd-5e55-363284c6da4f@gmail.com>
Date: Tue, 23 Aug 2022 15:09:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-11-danielhb413@gmail.com>
 <99485a63-f799-2741-8006-f4167c985e54@ozlabs.ru>
 <f2c2e6f9-0da4-443d-55cd-c214e710d0f7@gmail.com> <YwLyhvijapVkpgjr@yekko>
 <708e6776-5589-15ab-535a-69c5d6d5f0d0@ozlabs.ru>
 <95685b0a-42e1-b791-f3fb-a462e2b3ae6f@gmail.com>
 <0bf12cd3-e301-d575-72bf-28a61fc931a4@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <0bf12cd3-e301-d575-72bf-28a61fc931a4@ozlabs.ru>
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



On 8/23/22 05:58, Alexey Kardashevskiy wrote:
> 
> 
> On 22/08/2022 20:30, Daniel Henrique Barboza wrote:
>>
>>
>> On 8/22/22 00:29, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 22/08/2022 13:05, David Gibson wrote:
>>>> On Fri, Aug 19, 2022 at 06:42:34AM -0300, Daniel Henrique Barboza wrote:
>>>>>
>>>>>
>>>>> On 8/18/22 23:11, Alexey Kardashevskiy wrote:
>>>>>>
>>>>>>
>>>>>> On 05/08/2022 19:39, Daniel Henrique Barboza wrote:
>>>>>>> The pSeries machine never bothered with the common machine->fdt
>>>>>>> attribute. We do all the FDT related work using spapr->fdt_blob.
>>>>>>>
>>>>>>> We're going to introduce HMP commands to read and save the FDT, which
>>>>>>> will rely on setting machine->fdt properly to work across all machine
>>>>>>> archs/types.
>>>>>>
>>>>>>
>>>>>> Out of curiosity - why new HMP command, is not QOM'ing this ms::fdt property enough?
>>>>>
>>>>> I tried to do the minimal changes needed for the commands to work. ms::fdt is
>>>>> one of the few MachineState fields that hasn't been QOMified by
>>>>> machine_class_init() yet. All pre-existing code that uses ms::fdt are using the
>>>>> pointer directly. To make a QOMified use of it would require extra patches
>>>>> in machine.c to QOMify the property first.
>>>>>
>>>>> There's also the issue with how each machine is creating the FDT. Most are using
>>>>> helpers from device_tree.c, some are creating it from scratch, others required
>>>>> a .dtb file, most of them are not doing a fdt_pack() and so on. To really QOMify
>>>>> the use of ms::fdt we would need some machine hooks that standardize all that.
>>>>> I believe it's worth the trouble, but it would be too much to do
>>>>> right now.
>>>>
>>>> Hmm.. I think this depends on what you mean by "QOM"ify exactly.  If
>>>> you're meaning make the full DT representation QOM objects, that you
>>>> can look into in detail, then, yes, that's pretty complicated.
>>>>
>>>> I suspect what Alexey was suggesting though, was merely to make
>>>> ms::fdt accessible as a single bytestring property on the machine QOM
>>>> object.  Effectively it's just "dumpdtb" but as a property get.
>>>
>>>
>>> Yes, I meant the bytestream, as DTC can easily decompile it onto a DTS.
>>>
>>>
>>>> I'm not 100% certain if QOM can safely represent arbitrary bytestrings
>>>> as QOM properties, which would need checking.
>>>
>>> I am not sure either but rather than adding another command to HMP, I'd explore this option first.
>>
>>
>> I'm not sure what you mean by that. The HMP version of 'dumpdtb' is more flexible
>> that the current "-machine dumpdtb", an extra machine option that would cause
>> the guest to exit after writing the dtb
> 
> True. Especially with CAS :)
> 
>> And 'info fdt' is a new command that
>> makes it easier to inspect specific nodes/props.
> 
> btw what is this new command going to do? decompile the tree or save dtb?

At this moment, 'info fdt <node> [prop]' is using the current ms->fdt bytestream
plus libfdt to output nodes and properties.

> 
>> I don't see how making ms::fdt being retrievable by object_property_get() internally
>> (remember that ms::fdt it's not fully QOMified, so there's no introspection of its
>> value from the QEMU monitor) would make any of these new HMP commands obsolete.
> 
> Well, there are QMP and HMP and my feeling was that HMP is slowly getting deprecated or something and QMP is the superior one. So I thought since this FDT is a property and there is no associated action with it, making it a property would do.

I don't have an option about HMP being deprecated and QMP being the preferable
choice. Perhaps someone else reading this thread can tell more about it.

> 
> For ages I've been using a python3 script to talk to QMP as HMP is really quite limited, the only thing in HMP which is not in QMP is dumping memory ("x", "xp"), in this case I wrap HMP into QMP and keep using QMP :)


Apparently we have a QMP enthusiast over here ;)



Daniel

> 
> 
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>>
>>>
>>>
> 

