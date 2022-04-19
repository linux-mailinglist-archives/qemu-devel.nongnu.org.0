Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9796950697B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 13:13:25 +0200 (CEST)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nglnQ-00047j-Ak
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 07:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nglkw-00029M-1v
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:10:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nglku-0002Mc-8U
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:10:49 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nglk3-0005KE-2k; Tue, 19 Apr 2022 12:09:55 +0100
Message-ID: <5066d240-81fc-9c53-1e43-4271130acbc4@ilande.co.uk>
Date: Tue, 19 Apr 2022 12:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-36-yangxiaojuan@loongson.cn>
 <6d62ce6d-acc2-b07e-71ac-dee03bbfd22f@linaro.org>
 <9f27b53d-d2bf-1fb5-3a46-c910a34d5e3d@ilande.co.uk>
 <c25c3a00-b66b-6b1a-1a5e-b007cb36a7be@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <c25c3a00-b66b-6b1a-1a5e-b007cb36a7be@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v1 35/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/2022 02:50, yangxiaojuan wrote:

> On 2022/4/18 下午4:57, Mark Cave-Ayland wrote:
>> On 18/04/2022 04:48, Richard Henderson wrote:
>>
>>> On 4/15/22 02:40, Xiaojuan Yang wrote:
>>>> + memory_region_init(&s->mmio[cpu], OBJECT(s),
>>>> +                           "loongarch_extioi", EXTIOI_SIZE);
>>>> +
>>>> +        memory_region_init_io(&s->mmio_nodetype[cpu], OBJECT(s),
>>>> +                              &extioi_nodetype_ops, s,
>>>> +                              EXTIOI_LINKNAME(.nodetype),
>>>> +                              IPMAP_OFFSET - APIC_BASE);
>>>> +        memory_region_add_subregion(&s->mmio[cpu], 0, &s->mmio_nodetype[cpu]);
>>>> +
>>>> + memory_region_init_io(&s->mmio_ipmap_enable[cpu], OBJECT(s),
>>>> +                              &extioi_ipmap_enable_ops, s,
>>>> +                              EXTIOI_LINKNAME(.ipmap_enable),
>>>> +                              BOUNCE_OFFSET - IPMAP_OFFSET);
>>>> +        memory_region_add_subregion(&s->mmio[cpu], IPMAP_OFFSET - APIC_BASE,
>>>> + &s->mmio_ipmap_enable[cpu]);
>>>> +
>>>> + memory_region_init_io(&s->mmio_bounce_coreisr[cpu], OBJECT(s),
>>>> +                              &extioi_bounce_coreisr_ops, s,
>>>> + EXTIOI_LINKNAME(.bounce_coreisr),
>>>> +                              COREMAP_OFFSET - BOUNCE_OFFSET);
>>>> +        memory_region_add_subregion(&s->mmio[cpu], BOUNCE_OFFSET - APIC_BASE,
>>>> + &s->mmio_bounce_coreisr[cpu]);
>>>> +
>>>> +        memory_region_init_io(&s->mmio_coremap[cpu], OBJECT(s),
>>>> +                              &extioi_coremap_ops, s,
>>>> +                              EXTIOI_LINKNAME(.coremap),
>>>> +                              EXTIOI_COREMAP_END);
>>>> +        memory_region_add_subregion(&s->mmio[cpu], COREMAP_OFFSET - APIC_BASE,
>>>> + &s->mmio_coremap[cpu]);
>>>
>>> Why are these separate memory regions, instead of one region? They're certainly 
>>> described in a single table in section 11.2 of the 3A5000 manual...
>>
>> The reason it was done like this is because there were different access sizes in 
>> the relevant _ops definitions. Certainly when I looked at the patches previously I 
>> wasn't able to easily see how these could be consolidated without digging deeper 
>> into the documentation.
>>
> Would it be better to keep consistent with the content of the 3A5000 manual 
> document？ And only one memory region is used to represent the extioi iocsr region

The reason that different memory regions are required is because you've specified 
different access size requirements for each region:

static const MemoryRegionOps extioi_nodetype_ops = {
     .read = extioi_nodetype_readw,
     .write = extioi_nodetype_writew,
     .impl.min_access_size = 4,
     .impl.max_access_size = 4,
     .valid.min_access_size = 4,
     .valid.max_access_size = 8,
     .endianness = DEVICE_LITTLE_ENDIAN,
};

static const MemoryRegionOps extioi_ipmap_enable_ops = {
     .read = extioi_ipmap_enable_read,
     .write = extioi_ipmap_enable_write,
     .impl.min_access_size = 1,
     .impl.max_access_size = 1,
     .valid.min_access_size = 1,
     .valid.max_access_size = 8,
     .endianness = DEVICE_LITTLE_ENDIAN,
};

static const MemoryRegionOps extioi_bounce_coreisr_ops = {
     .read = extioi_bounce_coreisr_readw,
     .write = extioi_bounce_coreisr_writew,
     .impl.min_access_size = 4,
     .impl.max_access_size = 4,
     .valid.min_access_size = 4,
     .valid.max_access_size = 8,
     .endianness = DEVICE_LITTLE_ENDIAN,
};

static const MemoryRegionOps extioi_coremap_ops = {
     .read = extioi_coremap_read,
     .write = extioi_coremap_write,
     .impl.min_access_size = 1,
     .impl.max_access_size = 1,
     .valid.min_access_size = 1,
     .valid.max_access_size = 8,
     .endianness = DEVICE_LITTLE_ENDIAN,
};

Certainly this is unusual (and for a given device I'd expect that its registers would 
all have the same access requirements), but it's not something that can be tested 
without access to real hardware.

As Richard suggests though, if it is found that all of the device registers have the 
same access requirements then they could potentially be collapsed into a single 
memory region.


ATB,

Mark.

