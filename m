Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A684CE53D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 15:20:45 +0100 (CET)
Received: from localhost ([::1]:47844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQVH2-0005RZ-Rs
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 09:20:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQVDw-0007GK-T7
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:17:32 -0500
Received: from [2001:41c9:1:41f::167] (port=58998
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQVDu-0007sN-Vg
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:17:32 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQVDE-00086i-05; Sat, 05 Mar 2022 14:16:51 +0000
Message-ID: <f61039bd-59e1-1850-62f0-58627e5bba0c@ilande.co.uk>
Date: Sat, 5 Mar 2022 14:17:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, laurent@vivier.eu, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-8-mark.cave-ayland@ilande.co.uk>
 <739406f5-56a7-c94f-c800-0c050c8c936f@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <739406f5-56a7-c94f-c800-0c050c8c936f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 07/12] mos6522: add register names to register
 read/write trace events
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/2022 14:04, Philippe Mathieu-Daudé wrote:

> On 24/2/22 12:59, Mark Cave-Ayland wrote:
>> This helps to follow how the guest is programming the mos6522 when debugging.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/misc/mos6522.c    | 10 ++++++++--
>>   hw/misc/trace-events |  4 ++--
>>   2 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
>> index 093cc83dcf..aaae195d63 100644
>> --- a/hw/misc/mos6522.c
>> +++ b/hw/misc/mos6522.c
>> @@ -36,6 +36,12 @@
>>   #include "qemu/module.h"
>>   #include "trace.h"
> 
> I'd feel safer adding:
> 
>    #define MOS6522_IOSIZE 0x10
> 
>> +static const char *mos6522_reg_names[16] = {
> 
> Then here:
> 
>     ... mos6522_reg_names[MOS6522_IOSIZE] ...
> 
>> +    "ORB", "ORA", "DDRB", "DDRA", "T1CL", "T1CH", "T1LL", "T1LH",
>> +    "T2CL", "T2CH", "SR", "ACR", "PCR", "IFR", "IER", "ANH"
>> +};
>> +
>>   /* XXX: implement all timer modes */
>>   static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
>> @@ -310,7 +316,7 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
>>       }
>>       if (addr != VIA_REG_IFR || val != 0) {
>> -        trace_mos6522_read(addr, val);
>> +        trace_mos6522_read(addr, mos6522_reg_names[addr], val);
>>       }
> 
> And finally:
> 
> -- >8 --
> @@ -478,7 +478,8 @@ static void mos6522_init(Object *obj)
>       MOS6522State *s = MOS6522(obj);
>       int i;
> 
> -    memory_region_init_io(&s->mem, obj, &mos6522_ops, s, "mos6522", 0x10);
> +    memory_region_init_io(&s->mem, obj, &mos6522_ops, s, "mos6522",
> +                          MOS6522_IOSIZE);
>       sysbus_init_mmio(sbd, &s->mem);
>       sysbus_init_irq(sbd, &s->irq);
> 
> ---
> 
> Regardless:
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

I've done this in v3 but using MOS6522_NUM_REGS rather than MOS6522_IOSIZE since IO 
size != number of registers at a higher level (e.g. where the 6522 registers are 
mapped in CUDA/mac_via with a stride).


ATB,

Mark.

