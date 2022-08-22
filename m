Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1BB59BDA3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 12:34:48 +0200 (CEST)
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ4lb-0007xY-0b
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 06:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oQ4hg-0003ND-1o; Mon, 22 Aug 2022 06:30:44 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:37786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oQ4he-0004wF-DM; Mon, 22 Aug 2022 06:30:43 -0400
Received: by mail-vk1-xa35.google.com with SMTP id o198so1498735vko.4;
 Mon, 22 Aug 2022 03:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=3WgtOjQxOTACclU0eGpBNGjg8A/XHuXeYUdLlEkXP9k=;
 b=f2xjF9DElmiY3gVZeSOx+p9tnTT+Db+5aOF4zuMfwdzYnWC9PXNMItqrc5voYTvW+L
 J9wGCct4/zA+Hd9SGQux8gr2JKxyI4uoBFnxElW2QZc2+gqQX3Qra5+klkLuhTT7sTh/
 U24Mi1RA+GXa8Ydh7qW0KjVigWxLzn2BszHJLDxMqaUIZOoUCbVl+/Y45eVXn6i7qX9i
 G0dY0FHFT/RvhFNgDYXovs7sJsPBLqlCkP0fUbdMIWDIjQjDfMKUiBHhPHiV0q+LiuYo
 TFkwl4wsFCl4A0sYTwgVvfWjsYG3Il7L4d3kvbR7PTX99pIO4Wzg17DHrqMZeaGzBJWV
 zsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=3WgtOjQxOTACclU0eGpBNGjg8A/XHuXeYUdLlEkXP9k=;
 b=gV1Yv/L2LYIxfIzOQK6X6TebmHoxKW/Uj87OxHMi2d50srTKumitOJ3eco7fNCRYYv
 m4tIJsNzK1at9XiK7CzvHjultBjD3M79dqCX7A909IVq8D+nnN8oojXg2icOzCua/qmH
 F9KTqbo4uPMIAH/oEe0pHJR3TiB8jl41a51QrvCQLUB/W9LCqu1rGtkCzQ26j4yTqKN8
 d1ztXnEi/gtn/4CI2J53IxzI5d7WQqAmqExXn8SpXS+bNKvHzVzOzPOc0/ECpN+Gn0aX
 rQLErvq2Qxzgv+9Nch649PkOYYno2rgaXQX4/m/nbGAErcvqAH6n0qE3ZKbEiQg57U0Y
 eQ9Q==
X-Gm-Message-State: ACgBeo1HK2p3/rj2+Jnt8FBgaZtMVU2kDWF+3eqMKXYiMk7RrhpsKScf
 RumX8A66UTQddRhzSIpTxKc=
X-Google-Smtp-Source: AA6agR5VhjTndod8OBfFtVKoL38VfbNbD4rUZokvxJSOS8ePtw/4WWI2LPw+9N3minSch36Hmy7Ebg==
X-Received: by 2002:a1f:9107:0:b0:38c:87da:34c9 with SMTP id
 t7-20020a1f9107000000b0038c87da34c9mr868524vkd.3.1661164240554; 
 Mon, 22 Aug 2022 03:30:40 -0700 (PDT)
Received: from [192.168.10.102] (201-1-67-25.dsl.telesp.net.br. [201.1.67.25])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a9f310d000000b00383c1958249sm9596008uab.24.2022.08.22.03.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 03:30:40 -0700 (PDT)
Message-ID: <95685b0a-42e1-b791-f3fb-a462e2b3ae6f@gmail.com>
Date: Mon, 22 Aug 2022 07:30:36 -0300
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
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <708e6776-5589-15ab-535a-69c5d6d5f0d0@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa35.google.com
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



On 8/22/22 00:29, Alexey Kardashevskiy wrote:
> 
> 
> On 22/08/2022 13:05, David Gibson wrote:
>> On Fri, Aug 19, 2022 at 06:42:34AM -0300, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 8/18/22 23:11, Alexey Kardashevskiy wrote:
>>>>
>>>>
>>>> On 05/08/2022 19:39, Daniel Henrique Barboza wrote:
>>>>> The pSeries machine never bothered with the common machine->fdt
>>>>> attribute. We do all the FDT related work using spapr->fdt_blob.
>>>>>
>>>>> We're going to introduce HMP commands to read and save the FDT, which
>>>>> will rely on setting machine->fdt properly to work across all machine
>>>>> archs/types.
>>>>
>>>>
>>>> Out of curiosity - why new HMP command, is not QOM'ing this ms::fdt property enough?
>>>
>>> I tried to do the minimal changes needed for the commands to work. ms::fdt is
>>> one of the few MachineState fields that hasn't been QOMified by
>>> machine_class_init() yet. All pre-existing code that uses ms::fdt are using the
>>> pointer directly. To make a QOMified use of it would require extra patches
>>> in machine.c to QOMify the property first.
>>>
>>> There's also the issue with how each machine is creating the FDT. Most are using
>>> helpers from device_tree.c, some are creating it from scratch, others required
>>> a .dtb file, most of them are not doing a fdt_pack() and so on. To really QOMify
>>> the use of ms::fdt we would need some machine hooks that standardize all that.
>>> I believe it's worth the trouble, but it would be too much to do
>>> right now.
>>
>> Hmm.. I think this depends on what you mean by "QOM"ify exactly.  If
>> you're meaning make the full DT representation QOM objects, that you
>> can look into in detail, then, yes, that's pretty complicated.
>>
>> I suspect what Alexey was suggesting though, was merely to make
>> ms::fdt accessible as a single bytestring property on the machine QOM
>> object.  Effectively it's just "dumpdtb" but as a property get.
> 
> 
> Yes, I meant the bytestream, as DTC can easily decompile it onto a DTS.
> 
> 
>> I'm not 100% certain if QOM can safely represent arbitrary bytestrings
>> as QOM properties, which would need checking.
> 
> I am not sure either but rather than adding another command to HMP, I'd explore this option first.


I'm not sure what you mean by that. The HMP version of 'dumpdtb' is more flexible
that the current "-machine dumpdtb", an extra machine option that would cause
the guest to exit after writing the dtb. And 'info fdt' is a new command that
makes it easier to inspect specific nodes/props.

I don't see how making ms::fdt being retrievable by object_property_get() internally
(remember that ms::fdt it's not fully QOMified, so there's no introspection of its
value from the QEMU monitor) would make any of these new HMP commands obsolete.


Thanks,


Daniel

> 
> 
> 

