Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49782F0FED
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 11:21:47 +0100 (CET)
Received: from localhost ([::1]:50380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyuKY-0003QD-Co
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 05:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyuJR-0002re-24
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:20:37 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:51862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyuJK-0007HT-Tc
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:20:35 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B38187470EE;
 Mon, 11 Jan 2021 11:20:25 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 73FB07470E3; Mon, 11 Jan 2021 11:20:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 722AD74645B;
 Mon, 11 Jan 2021 11:20:25 +0100 (CET)
Date: Mon, 11 Jan 2021 11:20:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PULL 23/35] hw/intc: Rework Loongson LIOINTC
In-Reply-To: <3f383a52-6583-4c60-8f24-a24e6b95c068@www.fastmail.com>
Message-ID: <29acb49a-4d1-ae6b-328d-6e3081e2ab2f@eik.bme.hu>
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <20210103205021.2837760-24-f4bug@amsat.org>
 <CAFEAcA_YqAiiLRY08-gACmKOCf2mat3AaBGnyRK0Jc+aK-iuOw@mail.gmail.com>
 <b2dd6d33-d8e9-21a3-7b76-bdf44e117128@amsat.org>
 <3aece87-60ff-b195-8bd-c696bf461cb6@eik.bme.hu>
 <CAAhV-H71-wrTfDWN9zH2gU4gdJkCpMk5EDfAi1W1d4jXA3OkZg@mail.gmail.com>
 <3f383a52-6583-4c60-8f24-a24e6b95c068@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-16891760-1610360425=:96624"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 BALATON Zoltan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-16891760-1610360425=:96624
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 11 Jan 2021, Jiaxun Yang wrote:
> On Mon, Jan 11, 2021, at 8:36 AM, Huacai Chen wrote:
>> I think R_END should be 0x60, Jiaxun, what do you think?
>
> U r right.
> The manual is misleading.

The R_END constant is also used in loongson_liointc_init() for the length 
of the memory region so you might want to revise that. If this is a 32 bit 
register then you should decide what R_END means? Is it the end of the 
memory region in which case the reg starts at R_END - 4 or is it the 
address of the last reg in which case the memory region ends at R_END + 4. 
From the above I think it's the address of the last reg so you'll probably 
need to add 4 in loongson_liointc_init() when creating the memory region.

Regards,
BALATON Zoltan

> Thanks.
>
> - Jiaxun
>
>>
>> Huacai
>>
>> On Mon, Jan 11, 2021 at 5:51 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>
>>> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>>>> Hi Peter, Huacai,
>>>>
>>>> On 1/10/21 8:49 PM, Peter Maydell wrote:
>>>>> On Sun, 3 Jan 2021 at 21:11, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>>>
>>>>>> From: Huacai Chen <chenhuacai@kernel.org>
>>>>>>
>>>>>> As suggested by Philippe Mathieu-Daudé, rework Loongson's liointc:
>>>>>> 1, Move macro definitions to loongson_liointc.h;
>>>>>> 2, Remove magic values and use macros instead;
>>>>>> 3, Replace dead D() code by trace events.
>>>>>>
>>>>>> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
>>>>>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>> Message-Id: <20201221110538.3186646-2-chenhuacai@kernel.org>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>> ---
>>>>>>  include/hw/intc/loongson_liointc.h | 22 ++++++++++++++++++
>>>>>>  hw/intc/loongson_liointc.c         | 36 +++++++++++++-----------------
>>>>>>  2 files changed, 38 insertions(+), 20 deletions(-)
>>>>>>  create mode 100644 include/hw/intc/loongson_liointc.h
>>>>>
>>>>> Hi; Coverity complains about a possible array overrun
>>>>> in this commit:
>>>>>
>>>>>
>>>>>> @@ -40,13 +39,10 @@
>>>>>>  #define R_IEN                   0x24
>>>>>>  #define R_IEN_SET               0x28
>>>>>>  #define R_IEN_CLR               0x2c
>>>>>> -#define R_PERCORE_ISR(x)        (0x40 + 0x8 * x)
>>>>>> +#define R_ISR_SIZE              0x8
>>>>>> +#define R_START                 0x40
>>>>>>  #define R_END                   0x64
>>>>>>
>>>>>> -#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
>>>>>> -DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
>>>>>> -                         TYPE_LOONGSON_LIOINTC)
>>>>>> -
>>>>>>  struct loongson_liointc {
>>>>>>      SysBusDevice parent_obj;
>>>>>>
>>>>>> @@ -123,14 +119,13 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
>>>>>>          goto out;
>>>>>>      }
>>>>>>
>>>>>> -    /* Rest is 4 byte */
>>>>>> +    /* Rest are 4 bytes */
>>>>>>      if (size != 4 || (addr % 4)) {
>>>>>>          goto out;
>>>>>>      }
>>>>>>
>>>
>>> Expanding macros in the following:
>>>
>>>>>> -    if (addr >= R_PERCORE_ISR(0) &&
>>>>>> -        addr < R_PERCORE_ISR(NUM_CORES)) {
>>>>>> -        int core = (addr - R_PERCORE_ISR(0)) / 8;
>>>
>>> if (addr >= (0x40 + 0x8 * 0) && addr < (0x40 + 0x8 * 4))
>>> ->
>>> if (addr >= 0x40 && addr < 0x60)
>>> int core = (addr - 0x40) / 8;
>>>
>>>
>>>>>> +    if (addr >= R_START && addr < R_END) {
>>>>>> +        int core = (addr - R_START) / R_ISR_SIZE;
>>>
>>> if (addr >= 0x40 && addr < 0x64)
>>> int core = (addr - 0x40) / 0x8;
>>>
>>> R_END seems to be off by 4 in the above. Should it be 0x60?
>>>
>>> Regards,
>>> BALATON Zoltan
>>>
>>>>> R_END is 0x64 and R_START is 0x40, so if addr is 0x60
>>>>> then addr - R_START is 0x32 and so core here is 4.
>>>>> However p->per_core_isr[] only has 4 entries, so this will
>>>>> be off the end of the array.
>>>>>
>>>>> This is CID 1438965.
>>>>>
>>>>>>          r = p->per_core_isr[core];
>>>>>>          goto out;
>>>>>>      }
>>>>>
>>>>>> -    if (addr >= R_PERCORE_ISR(0) &&
>>>>>> -        addr < R_PERCORE_ISR(NUM_CORES)) {
>>>>>> -        int core = (addr - R_PERCORE_ISR(0)) / 8;
>>>>>> +    if (addr >= R_START && addr < R_END) {
>>>>>> +        int core = (addr - R_START) / R_ISR_SIZE;
>>>>>>          p->per_core_isr[core] = value;
>>>>>>          goto out;
>>>>>>      }
>>>>>
>>>>> Same thing here, CID 1438967.
>>>>
>>>> Thanks Peter.
>>>>
>>>> Huacai, can you have a look please?
>>>>
>>>> Thanks,
>>>>
>>>> Phil.
>>>>
>>>>
>>
>
>
--3866299591-16891760-1610360425=:96624--

