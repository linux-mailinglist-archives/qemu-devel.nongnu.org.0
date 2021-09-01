Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B28B3FDDD9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:34:01 +0200 (CEST)
Received: from localhost ([::1]:60066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRJP-0002GB-Oi
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mLRHr-0001Mj-9C; Wed, 01 Sep 2021 10:32:23 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:57073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mLRHp-0001yI-AY; Wed, 01 Sep 2021 10:32:22 -0400
Received: from [192.168.100.1] ([82.142.3.22]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MF39S-1mEslh46kS-00FUeb; Wed, 01 Sep 2021 16:32:14 +0200
To: Finn Thain <fthain@linux-m68k.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <b87cf2a2841d4597cc779df5dfce500c51a172ef.1629799776.git.fthain@linux-m68k.org>
 <bd94f1e6-4f15-b4d0-ddc8-fa98e2e3d780@ilande.co.uk>
 <e18e24e4-c310-4f22-e6ac-f2d7816cdf2@linux-m68k.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [RFC 05/10] hw/mos6522: Don't clear T1 interrupt flag on latch
 write
Message-ID: <8ef22032-c120-efe9-e1bc-70a91472c820@vivier.eu>
Date: Wed, 1 Sep 2021 16:32:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e18e24e4-c310-4f22-e6ac-f2d7816cdf2@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lssLlriMEJ/0CDY4kwjzK0laorlgL6o+ZXQkY/6WGK43h6A3voK
 IpcRXlTsplUz2iFHneQH42EeJUejjXKNEixR6Rd6gfX31TFMclgdbZNJq4DbHjH1u2FSaku
 HhsiC/nrsp7uF/AmTnX7TfGSwm2Mz6XokVIumNnEUUT7qkC5T+mbnU2JQfG7SF1iHRPpL8O
 ZM86ceNHMsGhOWt4LHJkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fmxsCEzQLoQ=:H3GjR61oe9BONE4E+cCNJ4
 G5izii6y6C8bxm5Yx1WMGwigwG5NZ0qONYLtewRwM6qvmovoy6V9SG2grbxJzw8z2SYZp0FsG
 hzNhVdJ9leiJT9BsUD0ipxmyJyZhhcgYe0Hd0669H4RZ3/QgCsKCNb6hjTYJny7rGiDN2bvhY
 hAALyFckI5N89ILOvycnZJVyY5VDUOWGCYPsG9V5Jsl3dba3aU+f6xxCM73PfAtwqhPS0AApB
 /mU3yW/1OMsO9LEl1gMbz4aVuM8gOYH/jYZ2WO4OPuuJtlAAls+t2ddi1nOPJQ1Mz6ow6pSMo
 sapQNuFU3ONYF1aZrHSn0vSrbENw2BjFUJ0tJ6LWfTqpfBZFFCi9dhCNhT5bUX4vYKJs4Kg9Q
 q4qpyMj0v/aapiCYxMiX0w6LKSJKdDvVI/m/VKrrbfTIuHW4BQpg6vdZ3FVYaMh1oFmxv1UL+
 900ZnPW8Ncr0NPIrJFiSBsP6rDxzbOZa2HzT6Z1oQnWtj1PCetKVLvtx65TsLbRoufSK4VHRO
 RS4cxRa72LYBYr89YRCuE3gCs63lTIWHsQTIBSBvefvW+6fBOTZ4yHA/Yxmvxt6byNpdU9uFm
 p2JTUyt2OPe9abcHmFkGhRs8SLZCmlnyJNtYhyr5um6GNoRP+KhhhumnTLt+nNOn8FjXnvLKl
 BVU9vQSASGssPw/x/c6o9bhuAGfa0EWCUL8zMTQ3fbCt7Xg0JpPaUAWATDQ47l6+P0DXjtYkN
 Qw1HM4RiEB95NKTtVxir8EzheHhvJ+AZJgGyxg==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.029,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/08/2021 à 07:21, Finn Thain a écrit :
> On Wed, 25 Aug 2021, Mark Cave-Ayland wrote:
> 
>> On 24/08/2021 11:09, Finn Thain wrote:
>>
>>> The Synertek datasheet says, "A write to T1L-H loads an 8-bit count value
>>> into the latch. A read of T1L-H transfers the contents of the latch to
>>> the data bus. Neither operation has an affect [sic] on the interrupt
>>> flag."
>>>
>>> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
>>> ---
>>>   hw/misc/mos6522.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
>>> index c0d6bee4cc..ffff8991f4 100644
>>> --- a/hw/misc/mos6522.c
>>> +++ b/hw/misc/mos6522.c
>>> @@ -313,7 +313,6 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t
>>> val, unsigned size)
>>>           break;
>>>       case VIA_REG_T1LH:
>>>           s->timers[0].latch = (s->timers[0].latch & 0xff) | (val << 8);
>>> -        s->ifr &= ~T1_INT;
>>>           break;
>>>       case VIA_REG_T2CL:
>>>           s->timers[1].latch = (s->timers[1].latch & 0xff00) | val;
>>
>> Hmmm. The reference document I used for QEMU's 6522 device is at
>> http://archive.6502.org/datasheets/mos_6522_preliminary_nov_1977.pdf and
>> according to page 6 and the section "Writing the Timer 1 Registers" writing to
>> the high byte of the latch does indeed clear the T1 interrupt flag.
>>
>> Side note: there is reference in Gary Davidian's excellent CHM video that
>> 6522s obtained from different manufacturers had different behaviours, and
>> there are also web pages mentioning that 6522s integrated as part of other
>> silicon e.g. IOSB/CUDA also had their own bugs... :/
>>
> 
> The MOS document you've cited is much older than the Synertek and Rockwell 
> devices. The datasheets for the Synertek and Rockwell parts disagree with 
> MOS about T1LH behaviour. Apple certainly used SY6522 devices in my Mac II 
> and I'd assumed Apple would have used compatible logic cores in the custom 
> ICs found in later models. But I don't really trust assumptions and 
> datasheets so I wrote the Linux patch below and ran it on my Quadra 630.
> 
> diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> index 3d11d6219cdd..ed41f6ae2bf2 100644
> --- a/arch/m68k/mac/via.c
> +++ b/arch/m68k/mac/via.c
> @@ -634,3 +634,27 @@ static u64 mac_read_clk(struct clocksource *cs)
>  
>  	return ticks;
>  }
> +
> +static int baz(void)
> +{
> +	u8 a, b, c;
> +
> +	local_irq_disable();
> +
> +	while (!(via1[vIFR] & VIA_TIMER_1_INT))
> +		continue;
> +	a = via1[vIFR] & VIA_TIMER_1_INT;
> +	via1[vT1LH] = via1[vT1LH];
> +	b = via1[vIFR] & VIA_TIMER_1_INT;
> +	via1[vT1LL] = via1[vT1LL];
> +	c = via1[vIFR] & VIA_TIMER_1_INT;
> +
> +	printk("a == %2x\n", a);
> +	printk("b == %2x\n", b);
> +	printk("c == %2x\n", c);
> +
> +	local_irq_enable();
> +
> +	return 0;
> +}
> +late_initcall(baz);
> 
> Based on the Synertek datasheet* one would expect to see b equal to a but 
> I got this result instead:
> 
> [   10.450000] a == 40
> [   10.450000] b ==  0
> [   10.450000] c ==  0
> 
> This amounts to a MOS design flaw and I doubt that this result from my 
> Quadra 630 would apply to other Mac models. So it would be great to see 
> the output from a Quadra 800. But until then, let's disregard this patch.
> 
> * http://archive.6502.org/datasheets/synertek_sy6522.pdf
> 

Tested on my Quadra 800:

[    4.730000] a == 40
[    4.730000] b ==  0
[    4.730000] c ==  0

Laurent



