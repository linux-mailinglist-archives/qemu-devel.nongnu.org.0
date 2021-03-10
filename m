Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B44334B8C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 23:26:01 +0100 (CET)
Received: from localhost ([::1]:35312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK7HE-0006aJ-Aq
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 17:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lK6st-0007Pc-TF
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 17:00:57 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51394
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lK6sj-0003IK-KC
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 17:00:49 -0500
Received: from host86-140-100-136.range86-140.btcentralplus.com
 ([86.140.100.136] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lK6sd-0004ek-Jb; Wed, 10 Mar 2021 22:00:35 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20210305235414.2358144-1-f4bug@amsat.org>
 <20210305235414.2358144-3-f4bug@amsat.org> <20210308234025.GP397383@xz-x1>
 <f3bda42d-759f-dbcd-04f0-45375e3eb9fd@amsat.org>
 <c524c45f-695e-fed5-bd24-f3d4deff4016@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f1401c74-2907-374c-e230-be36137d0d31@ilande.co.uk>
Date: Wed, 10 Mar 2021 22:00:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c524c45f-695e-fed5-bd24-f3d4deff4016@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.100.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/3] memory: Provide 'base address' argument to
 mtree_print_mr()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2021 21:54, Philippe Mathieu-Daudé wrote:

> +Peter/Mark/Edgar for SoC modelling
> 
> On 3/9/21 10:39 AM, Philippe Mathieu-Daudé wrote:
>> Hi Peter,
>>
>> On 3/9/21 12:40 AM, Peter Xu wrote:> On Sat, Mar 06, 2021 at 12:54:13AM
>> +0100, Philippe Mathieu-Daudé wrote:
>>>> @@ -3188,14 +3188,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>>>>   
>>>>       QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>>>>           qemu_printf("address-space: %s\n", as->name);
>>>> -        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
>>>> +        mtree_print_mr(as->root, 1, 0, as->root->addr,
>>>
>>> Root MR of any address space should have mr->addr==0, right?
>>>
>>> I'm slightly confused on what this patch wanted to do if so, since then "base"
>>> will always be zero..  Or am I wrong?
>>
>> That is what I am expecting too... Maybe the problem is elsewhere
>> when I create the address space... The simpler way to
>> figure it out is add an assertion. I haven't figure out my
>> issue yet, I'll follow up later with a proof-of-concept series
>> which triggers the assertion.
> 
> To trigger I simply use:
> 
> mydevice_realize()
> {
>    memory_region_init(&mr, obj, name, size);
> 
>    address_space_init(&as, &mr, name);
>    // here we have as.root.addr = 0
> 
>    sysbus_init_mmio(sbd, &mr);
> }
> 
> soc_realize()
> {
>      ...
>      sysbus_realize(SYS_BUS_DEVICE(&mydevice), &error_abort);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&mydevice), 0, NONZERO_ADDRESS);
>      ...
> }
> 
> sysbus_mmio_map
> -> sysbus_mmio_map_common
>     -> memory_region_add_subregion
>        -> memory_region_add_subregion_common
> 
> Which does:
> 
> static void memory_region_add_subregion_common(MemoryRegion *mr,
>                                                 hwaddr offset,
>                                                 MemoryRegion *subregion)
> {
>      assert(!subregion->container);
>      subregion->container = mr;
>      subregion->addr = offset;
>      // subregion = &as.root
>      // offset = NONZERO_ADDRESS
>      // so here as.root.addr becomes non-zero
> 
> Is that use case incorrect? If so:
> - where to add the proper assertions to avoid having address spaces
>    with non-zero base address?
> - what is the proper design?
> 
> Else what should we fix?

I think I've seen something like this before with the sun4u IOMMU - I tried to get 
the offset of the IOMMU address space memory region from its parent in 
sun4u_translate_iommu() but I ended up getting back an absolute address instead. I 
think the conclusion I came to was that it wouldn't work with a memory region at the 
root of an address space, so I'd be interested to know what the behaviour here should be.

In terms of soc_realize() I believe there are 2 options for getting the memory 
region: 1) use object_resolve_path_component() to retrieve the memory region as a QOM 
property or 2) use sysbus_mmio_get_region(). Once you have a reference to the memory 
region you can add it to the parent using memory_region_add_subregion() as needed. 
There is an existing example of 2) in hw/sparc64/sun4u.c in ebus_realize().


ATB,

Mark.

