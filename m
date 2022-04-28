Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A81F513DD3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 23:47:13 +0200 (CEST)
Received: from localhost ([::1]:38908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkByi-00076u-6V
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 17:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nkBxa-0006Ry-T6; Thu, 28 Apr 2022 17:46:02 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nkBxY-0002Kl-CC; Thu, 28 Apr 2022 17:46:02 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 57A257462D3;
 Thu, 28 Apr 2022 23:45:53 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 11F687457EF; Thu, 28 Apr 2022 23:45:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1023F74579D;
 Thu, 28 Apr 2022 23:45:53 +0200 (CEST)
Date: Thu, 28 Apr 2022 23:45:53 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?V=EDctor_Colombo?= <victor.colombo@eldorado.org.br>
Subject: Re: [PATCH 03/20] target/ppc: Substitute msr_pr macro with new
 M_MSR_PR macro
In-Reply-To: <9978cf74-2c81-98c8-d985-efe47d1519df@eldorado.org.br>
Message-ID: <a983e88f-7d11-b731-085-6d154cac3ff4@eik.bme.hu>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
 <20220422185450.107256-4-victor.colombo@eldorado.org.br>
 <fd0087dc-10ec-7867-44df-ba84f8b55aee@linaro.org>
 <c320ef03-0fc2-2a75-cc39-20747888dafb@eldorado.org.br>
 <32cc9b8b-add7-a87c-3bb7-95e5c5707e3e@kaod.org>
 <9978cf74-2c81-98c8-d985-efe47d1519df@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-291280435-1651182353=:76546"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: danielhb413@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-291280435-1651182353=:76546
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 28 Apr 2022, Víctor Colombo wrote:
> On 28/04/2022 03:46, Cédric Le Goater wrote:
>> On 4/27/22 19:00, Víctor Colombo wrote:
>>> Hello everyone! Thanks Zoltan and Richard for your kind reviews!
>>> 
>>> On 26/04/2022 18:29, Richard Henderson wrote:
>>>> On 4/22/22 11:54, Víctor Colombo wrote:
>>>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>>>> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
>>>>> ---
>>>>>   hw/ppc/pegasos2.c        |  2 +-
>>>>>   hw/ppc/spapr.c           |  2 +-
>>>>>   target/ppc/cpu.h         |  3 ++-
>>>>>   target/ppc/cpu_init.c    |  4 ++--
>>>>>   target/ppc/excp_helper.c |  6 +++---
>>>>>   target/ppc/mem_helper.c  |  4 ++--
>>>>>   target/ppc/mmu-radix64.c |  4 ++--
>>>>>   target/ppc/mmu_common.c  | 23 ++++++++++++-----------
>>>>>   8 files changed, 25 insertions(+), 23 deletions(-)
>>>>> 
>>>>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>>>>> index 56bf203dfd..27ed54a71d 100644
>>>>> --- a/hw/ppc/pegasos2.c
>>>>> +++ b/hw/ppc/pegasos2.c
>>>>> @@ -461,7 +461,7 @@ static void pegasos2_hypercall(PPCVirtualHypervisor 
>>>>> *vhyp, PowerPCCPU *cpu)
>>>>>       /* The TCG path should also be holding the BQL at this point */
>>>>>       g_assert(qemu_mutex_iothread_locked());
>>>>> 
>>>>> -    if (msr_pr) {
>>>>> +    if (env->msr & M_MSR_PR) {
>>>> 
>>>> I'm not sure I'm keen on the M_ prefix, but I'll defer to Cedric or 
>>>> Daniel if they're ok
>>>> with it.
>>>> 
>>>> In general there are inconsistencies with the use of MSR_PR (1 vs 1ull), 
>>>> which makes it
>>>> tempting to replace MSR_PR the bit number with MSR_PR the mask and leave 
>>>> off the M_
>>>> prefix.  It's somewhat easy for MSR_PR, since missed conversions will 
>>>> certainly result in
>>>> compiler warnings for out-of-range shift (the same would not be true with 
>>>> bits 0-6, LE
>>>> through EP). >
>>>> Another possibility would be to use hw/registerfields.h.  Missed 
>>>> conversions are missing
>>>> symbol errors.  You'd write FIELD_EX64(env->msr, MSR, PR) in cases like 
>>>> this and
>>>> R_MSR_PR_MASK in cases like cpu_init.c.  It's more verbose for single 
>>>> bits like this, but
>>>> much easier to work with multi-bit fields like MSR.TS.
>>>> 
>>> Thanks for your ideas! I think I'll go with this second one. It'll allow
>>> to remove the !!(val) occurrences that I introduced in this series, so
>>> the code quality will probably be improved.
>>> 
>>> It'll also be a 'safer' change that will require less rework on other
>>> parts that I didn't intend to touch in this patch series.
>> 
>> 
>> The registerfield API is certainly a good choice for cleanups.
>> 
>> Is there a way to adapt the PPC_BIT macros and keep the PPC bit
>> ordering ? It might be easier to forget about it. Which is what
>> the Linux kernel does in many places.
>
> Hello Cédric.
>
> It would probably be easier to change this if we went with Zoltan's
> idea. Just 'invert' the MSR_* values to match the ISA order and use
> env->msr & PPC_BIT(MSR_*). However registerfield API expects it to be
> in the "0 is the rightmost" order,
> so we can't easily go with it and just invert the MSR_* values.

One thing I'm a bit worried about with registerfields macros is that they 
use deposit64 and extract64 which have an IMO unneeded assert so this 
means it adds an expression evaluation at every invocation of these 
(hopefully the function overhead is optimisied out by inlining) which 
might have some performance impact. So I still prefer the PPC_BIT macro 
but changing the MSR_* defines might introduce bugs when not done 
carefully so I'm nor sure it worths it.

Do we have some performance benchmarks that could be used to evaluate the 
changes for performance impact? There was some Summer of Code project for 
this but I think it was abandoned. It would be useful to run that as part 
of CI testing maybe.

Regards,
BALATON Zoltan

> A solution I could think that might be easy is: rename PPC_BIT to
> PPC_BIT_ULL (behaves like BIT_ULL but 'inverted'), and create a new
> PPC_BIT macro that just inverts the bit value
>
> #define PPC_BIT_ULL(bit) (0x8000000000000000ULL >> (bit))
> #define PPC_BIT(bit) (63 - (bit))
>
> and change MSR_* to use it
>
> #define MSR_LE PPC_BIT(63)
>
>> 
>> 
>> Device models are also impacted :
>>
>>    include/hw/pci-host/pnv_phb*_regs.h
>>    include/hw/ppc/xive*_regs.h
>> 
>> Something I have been wanting to change for a while are these macros :
>>
>>      static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
>>      {
>>          return (word & mask) >> ctz64(mask);
>>      }
>>
>>      static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
>>                                      uint64_t value)
>>      {
>>          return (word & ~mask) | ((value << ctz64(mask)) & mask);
>>      }
>> 
>> Thanks,
>> 
>> C.
>> 
>
> Thanks!
>
> --
> Víctor Cora Colombo
> Instituto de Pesquisas ELDORADO
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
>
>
--3866299591-291280435-1651182353=:76546--

