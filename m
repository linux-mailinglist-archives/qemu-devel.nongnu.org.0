Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5C259D4C3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:02:38 +0200 (CEST)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQPnw-0005sA-Of
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oQPjr-00030M-7T
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 04:58:23 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oQPjo-000163-F5
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 04:58:22 -0400
Received: by mail-pl1-x62e.google.com with SMTP id u22so12219476plq.12
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 01:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=CujRr4Rc79VG3sniB7ZU5moml/T6AKezpOIpgIb6BpM=;
 b=YK61RCQZqzNuw4xYnS39InNXtX28MglGhsEapU532AjRcyX8AXan+Gn4BC9sO0C9P0
 mXmtt61IduHwTAbemnFElaUR+/olNRsqeC1LpGGm42MFNji3lONhhUBMtw29wvQlsB2Q
 6RpuiatWomkJoOOfK4zsOrcr2i1eSRYhXnMQ5XjMcth3Uh0m8dWT2peb9B92YelSkhhI
 e3OAAD+aXsEzd3C1jFgQ2fE4tHCiFUW06ZogWhSBoBJ90gaKuE1VqL6/ZDsYzGaoXCpD
 saMNA4iHUZp9bgovnH9pjVGuzhSZ1st/QRmL51ppWBNxRqBiJ9c22r2Lbv4CD+6m71uu
 UjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=CujRr4Rc79VG3sniB7ZU5moml/T6AKezpOIpgIb6BpM=;
 b=EA2wJ/x5C2eL3bLfaRGieDRTHmjjYOilVAi6Ps8IZ/0QBYCkcOxhnGn+6AerOLn/Jd
 Mf+0aQUgOlEerd54yoiH/fXsNZp+8F++XTxWExfHwrkMr3qNBXR664jvgD4bl54ujbdx
 /SRza6YNdvfVIRadWl6RSLu6q8b18N0SdQ+rf9/ZnUc9Pi/yhT964v2HjThNpYhF3o0t
 WC3uWXDqkNDMH8b7FjW2KTezpDK4TZN1uEhuYOaDLTyFdOouG7h4GDfTG1m4cUjegAZ8
 xj6ZHaQSeEZJceqlByP75/pbZy5oY0NiyULLe/yhdnzVgXdseb+chy3ar2eGWvEhfG9n
 wdOA==
X-Gm-Message-State: ACgBeo0gEgeCXhgBgCvvJSkrEshyYYMcEWGBNCcvbphtgWkVcbWDkLhS
 OEgQnVI5m6RKgGEtnwfuFBPfPQ==
X-Google-Smtp-Source: AA6agR6a/KX40T+1BeIrA1ks0V5eA8ikjFUu3nfDvJHP2k06WCaL8pNg87giISpXJPS+xYNvCuY+TA==
X-Received: by 2002:a17:90b:3907:b0:1fb:544c:5c4a with SMTP id
 ob7-20020a17090b390700b001fb544c5c4amr2349443pjb.211.1661245097507; 
 Tue, 23 Aug 2022 01:58:17 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a17090a0acf00b001f559e00473sm11393838pje.43.2022.08.23.01.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 01:58:16 -0700 (PDT)
Message-ID: <0bf12cd3-e301-d575-72bf-28a61fc931a4@ozlabs.ru>
Date: Tue, 23 Aug 2022 18:58:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-11-danielhb413@gmail.com>
 <99485a63-f799-2741-8006-f4167c985e54@ozlabs.ru>
 <f2c2e6f9-0da4-443d-55cd-c214e710d0f7@gmail.com> <YwLyhvijapVkpgjr@yekko>
 <708e6776-5589-15ab-535a-69c5d6d5f0d0@ozlabs.ru>
 <95685b0a-42e1-b791-f3fb-a462e2b3ae6f@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <95685b0a-42e1-b791-f3fb-a462e2b3ae6f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 22/08/2022 20:30, Daniel Henrique Barboza wrote:
> 
> 
> On 8/22/22 00:29, Alexey Kardashevskiy wrote:
>>
>>
>> On 22/08/2022 13:05, David Gibson wrote:
>>> On Fri, Aug 19, 2022 at 06:42:34AM -0300, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 8/18/22 23:11, Alexey Kardashevskiy wrote:
>>>>>
>>>>>
>>>>> On 05/08/2022 19:39, Daniel Henrique Barboza wrote:
>>>>>> The pSeries machine never bothered with the common machine->fdt
>>>>>> attribute. We do all the FDT related work using spapr->fdt_blob.
>>>>>>
>>>>>> We're going to introduce HMP commands to read and save the FDT, which
>>>>>> will rely on setting machine->fdt properly to work across all machine
>>>>>> archs/types.
>>>>>
>>>>>
>>>>> Out of curiosity - why new HMP command, is not QOM'ing this ms::fdt 
>>>>> property enough?
>>>>
>>>> I tried to do the minimal changes needed for the commands to work. 
>>>> ms::fdt is
>>>> one of the few MachineState fields that hasn't been QOMified by
>>>> machine_class_init() yet. All pre-existing code that uses ms::fdt 
>>>> are using the
>>>> pointer directly. To make a QOMified use of it would require extra 
>>>> patches
>>>> in machine.c to QOMify the property first.
>>>>
>>>> There's also the issue with how each machine is creating the FDT. 
>>>> Most are using
>>>> helpers from device_tree.c, some are creating it from scratch, 
>>>> others required
>>>> a .dtb file, most of them are not doing a fdt_pack() and so on. To 
>>>> really QOMify
>>>> the use of ms::fdt we would need some machine hooks that standardize 
>>>> all that.
>>>> I believe it's worth the trouble, but it would be too much to do
>>>> right now.
>>>
>>> Hmm.. I think this depends on what you mean by "QOM"ify exactly.  If
>>> you're meaning make the full DT representation QOM objects, that you
>>> can look into in detail, then, yes, that's pretty complicated.
>>>
>>> I suspect what Alexey was suggesting though, was merely to make
>>> ms::fdt accessible as a single bytestring property on the machine QOM
>>> object.  Effectively it's just "dumpdtb" but as a property get.
>>
>>
>> Yes, I meant the bytestream, as DTC can easily decompile it onto a DTS.
>>
>>
>>> I'm not 100% certain if QOM can safely represent arbitrary bytestrings
>>> as QOM properties, which would need checking.
>>
>> I am not sure either but rather than adding another command to HMP, 
>> I'd explore this option first.
> 
> 
> I'm not sure what you mean by that. The HMP version of 'dumpdtb' is more 
> flexible
> that the current "-machine dumpdtb", an extra machine option that would 
> cause
> the guest to exit after writing the dtb

True. Especially with CAS :)

> And 'info fdt' is a new command 
> that
> makes it easier to inspect specific nodes/props.

btw what is this new command going to do? decompile the tree or save dtb?

> I don't see how making ms::fdt being retrievable by 
> object_property_get() internally
> (remember that ms::fdt it's not fully QOMified, so there's no 
> introspection of its
> value from the QEMU monitor) would make any of these new HMP commands 
> obsolete.

Well, there are QMP and HMP and my feeling was that HMP is slowly 
getting deprecated or something and QMP is the superior one. So I 
thought since this FDT is a property and there is no associated action 
with it, making it a property would do.

For ages I've been using a python3 script to talk to QMP as HMP is 
really quite limited, the only thing in HMP which is not in QMP is 
dumping memory ("x", "xp"), in this case I wrap HMP into QMP and keep 
using QMP :)


> 
> 
> Thanks,
> 
> 
> Daniel
> 
>>
>>
>>

-- 
Alexey

