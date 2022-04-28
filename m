Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C97512C9F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:22:48 +0200 (CEST)
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyUB-0007Iq-Ay
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njxvD-0001Uu-2X
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:46:39 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:37097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njxvA-0004Az-QS
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:46:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B8C9221915;
 Thu, 28 Apr 2022 06:46:32 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 08:46:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006b2ace12b-8761-4aea-8cda-4acb57771342,
 964B4B5EE68C69CB799E8147BBEA8F01A3367603) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <32cc9b8b-add7-a87c-3bb7-95e5c5707e3e@kaod.org>
Date: Thu, 28 Apr 2022 08:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/20] target/ppc: Substitute msr_pr macro with new
 M_MSR_PR macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>, Richard
 Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
 <20220422185450.107256-4-victor.colombo@eldorado.org.br>
 <fd0087dc-10ec-7867-44df-ba84f8b55aee@linaro.org>
 <c320ef03-0fc2-2a75-cc39-20747888dafb@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c320ef03-0fc2-2a75-cc39-20747888dafb@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ebb927b0-251e-4103-b48c-7a5ec2c9a41a
X-Ovh-Tracer-Id: 4055491468273814380
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 19:00, Víctor Colombo wrote:
> Hello everyone! Thanks Zoltan and Richard for your kind reviews!
> 
> On 26/04/2022 18:29, Richard Henderson wrote:
>> On 4/22/22 11:54, Víctor Colombo wrote:
>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
>>> ---
>>>   hw/ppc/pegasos2.c        |  2 +-
>>>   hw/ppc/spapr.c           |  2 +-
>>>   target/ppc/cpu.h         |  3 ++-
>>>   target/ppc/cpu_init.c    |  4 ++--
>>>   target/ppc/excp_helper.c |  6 +++---
>>>   target/ppc/mem_helper.c  |  4 ++--
>>>   target/ppc/mmu-radix64.c |  4 ++--
>>>   target/ppc/mmu_common.c  | 23 ++++++++++++-----------
>>>   8 files changed, 25 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>>> index 56bf203dfd..27ed54a71d 100644
>>> --- a/hw/ppc/pegasos2.c
>>> +++ b/hw/ppc/pegasos2.c
>>> @@ -461,7 +461,7 @@ static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
>>>       /* The TCG path should also be holding the BQL at this point */
>>>       g_assert(qemu_mutex_iothread_locked());
>>>
>>> -    if (msr_pr) {
>>> +    if (env->msr & M_MSR_PR) {
>>
>> I'm not sure I'm keen on the M_ prefix, but I'll defer to Cedric or Daniel if they're ok
>> with it.
>>
>> In general there are inconsistencies with the use of MSR_PR (1 vs 1ull), which makes it
>> tempting to replace MSR_PR the bit number with MSR_PR the mask and leave off the M_
>> prefix.  It's somewhat easy for MSR_PR, since missed conversions will certainly result in
>> compiler warnings for out-of-range shift (the same would not be true with bits 0-6, LE
>> through EP). >
>> Another possibility would be to use hw/registerfields.h.  Missed conversions are missing
>> symbol errors.  You'd write FIELD_EX64(env->msr, MSR, PR) in cases like this and
>> R_MSR_PR_MASK in cases like cpu_init.c.  It's more verbose for single bits like this, but
>> much easier to work with multi-bit fields like MSR.TS.
>>
> Thanks for your ideas! I think I'll go with this second one. It'll allow
> to remove the !!(val) occurrences that I introduced in this series, so
> the code quality will probably be improved.
> 
> It'll also be a 'safer' change that will require less rework on other
> parts that I didn't intend to touch in this patch series.


The registerfield API is certainly a good choice for cleanups.

Is there a way to adapt the PPC_BIT macros and keep the PPC bit
ordering ? It might be easier to forget about it. Which is what
the Linux kernel does in many places.


Device models are also impacted :

   include/hw/pci-host/pnv_phb*_regs.h
   include/hw/ppc/xive*_regs.h

Something I have been wanting to change for a while are these macros :

     static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
     {
         return (word & mask) >> ctz64(mask);
     }
     
     static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
                                     uint64_t value)
     {
         return (word & ~mask) | ((value << ctz64(mask)) & mask);
     }

Thanks,

C.
     

