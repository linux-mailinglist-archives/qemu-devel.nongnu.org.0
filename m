Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB07511C7B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:04:04 +0200 (CEST)
Received: from localhost ([::1]:36212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njl59-0002Sh-DX
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1njl1m-00085C-0D; Wed, 27 Apr 2022 13:00:34 -0400
Received: from [187.72.171.209] (port=6470 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1njl1k-0005pa-5i; Wed, 27 Apr 2022 13:00:33 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 27 Apr 2022 14:00:25 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 51F7280031A;
 Wed, 27 Apr 2022 14:00:25 -0300 (-03)
Message-ID: <c320ef03-0fc2-2a75-cc39-20747888dafb@eldorado.org.br>
Date: Wed, 27 Apr 2022 14:00:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/20] target/ppc: Substitute msr_pr macro with new
 M_MSR_PR macro
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
 <20220422185450.107256-4-victor.colombo@eldorado.org.br>
 <fd0087dc-10ec-7867-44df-ba84f8b55aee@linaro.org>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <fd0087dc-10ec-7867-44df-ba84f8b55aee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Apr 2022 17:00:25.0631 (UTC)
 FILETIME=[4A3922F0:01D85A58]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello everyone! Thanks Zoltan and Richard for your kind reviews!

On 26/04/2022 18:29, Richard Henderson wrote:
> On 4/22/22 11:54, Víctor Colombo wrote:
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
>> ---
>>   hw/ppc/pegasos2.c        |  2 +-
>>   hw/ppc/spapr.c           |  2 +-
>>   target/ppc/cpu.h         |  3 ++-
>>   target/ppc/cpu_init.c    |  4 ++--
>>   target/ppc/excp_helper.c |  6 +++---
>>   target/ppc/mem_helper.c  |  4 ++--
>>   target/ppc/mmu-radix64.c |  4 ++--
>>   target/ppc/mmu_common.c  | 23 ++++++++++++-----------
>>   8 files changed, 25 insertions(+), 23 deletions(-)
>>
>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>> index 56bf203dfd..27ed54a71d 100644
>> --- a/hw/ppc/pegasos2.c
>> +++ b/hw/ppc/pegasos2.c
>> @@ -461,7 +461,7 @@ static void 
>> pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
>>       /* The TCG path should also be holding the BQL at this point */
>>       g_assert(qemu_mutex_iothread_locked());
>>
>> -    if (msr_pr) {
>> +    if (env->msr & M_MSR_PR) {
> 
> I'm not sure I'm keen on the M_ prefix, but I'll defer to Cedric or 
> Daniel if they're ok
> with it.
> 
> In general there are inconsistencies with the use of MSR_PR (1 vs 1ull), 
> which makes it
> tempting to replace MSR_PR the bit number with MSR_PR the mask and leave 
> off the M_
> prefix.  It's somewhat easy for MSR_PR, since missed conversions will 
> certainly result in
> compiler warnings for out-of-range shift (the same would not be true 
> with bits 0-6, LE
> through EP). >
> Another possibility would be to use hw/registerfields.h.  Missed 
> conversions are missing
> symbol errors.  You'd write FIELD_EX64(env->msr, MSR, PR) in cases like 
> this and
> R_MSR_PR_MASK in cases like cpu_init.c.  It's more verbose for single 
> bits like this, but
> much easier to work with multi-bit fields like MSR.TS.
> 
Thanks for your ideas! I think I'll go with this second one. It'll allow
to remove the !!(val) occurrences that I introduced in this series, so
the code quality will probably be improved.

It'll also be a 'safer' change that will require less rework on other
parts that I didn't intend to touch in this patch series.

I''l work on it!
> 
> r~

--
Víctor Cora Colombo
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

