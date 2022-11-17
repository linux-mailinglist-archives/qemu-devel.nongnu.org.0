Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7F062DC4D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 14:09:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oved6-0003N5-UB; Thu, 17 Nov 2022 08:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovecn-0003Jq-2J
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:08:13 -0500
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovecj-0003QD-PG
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:08:12 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.26])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D50DA232C0;
 Thu, 17 Nov 2022 13:08:05 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 14:08:04 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002b979bdd4-0e91-4ab4-9fd0-0a5eeb2a3b6e,
 AE5717285A2AC47C671D2CB192D1CF6730B7D7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <aefa494a-cc63-aa77-9716-15b1ae74e9bb@kaod.org>
Date: Thu, 17 Nov 2022 14:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>
CC: Vaibhav Jain <vaibhav@linux.ibm.com>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>, <david@gibson.dropbear.id.au>, Kowshik Jois B S
 <kowsjois@linux.ibm.com>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
 <9b92deef-e0ef-101d-8f7e-2b4634bde6de@gmail.com>
 <20221117115005.4b23a318@bahia>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221117115005.4b23a318@bahia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 4715a588-61e6-4e20-b570-5bebf389f51b
X-Ovh-Tracer-Id: 3617797877971651433
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeugfdtteetfefgiefhfefgueduveefieehgfevvdetiedugeeghfehtdehvdffnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhvrghisghhrghvsehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhkohifshhjohhisheslhhinhhugidrihgsmhdrtghomhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehge
 ekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/17/22 11:50, Greg Kurz wrote:
> On Thu, 17 Nov 2022 07:11:51 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> Queued in gitlab.com/danielhb/qemu/tree/ppc-next with the following tags:
>>
> 
> You are planning a PR before 7.2-rc2, right ?
> 
>>
>>       Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>       Fixes: 61bd1d2942 ("target/ppc: Convert to tcg_ops restore_state_to_opc")
>>       Fixes: 670f1da374 ("target/ppc: Implement hashst and hashchk")
> 
> The guard macro also covers the following two, introduced by yet another commit.
> 
>    HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
>    HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
> 
> Fixes: 53ae2aeb9407 ("target/ppc: Implement hashstp and hashchkp")
> 
>>       Resolves: https://gitlab.com/qemu-project/qemu/-/issues/377
> 
> Err... I don't see any relation with this issue.
> 
> Cedric ?

bad copy paste. Sorry about that.

  
> But this resolves the issue created by Vaibhav for 7.2 :
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1319

yes.

C.

> 
>>       Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>>       Reviewed-by: Greg Kurz <groug@kaod.org>
>>       Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>       Tested-by: Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>> On 11/16/22 10:17, Vaibhav Jain wrote:
>>> Kowshik reported that building qemu with GCC 12.2.1 for 'ppc64-softmmu'
>>> target is failing due to following build warnings:
>>>
>>> <snip>
>>>    ../target/ppc/cpu_init.c:7018:13: error: 'ppc_restore_state_to_opc' defined but not used [-Werror=unused-function]
>>>    7018 | static void ppc_restore_state_to_opc(CPUState *cs,
>>> <snip>
>>>
>>> Fix this by wrapping these function definitions in 'ifdef CONFIG_TCG' so that
>>> they are only defined if qemu is compiled with '--enable-tcg'
>>>
>>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>>> ---
>>>    target/ppc/cpu_init.c    | 2 ++
>>>    target/ppc/excp_helper.c | 2 ++
>>>    2 files changed, 4 insertions(+)
>>>
>>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>>> index 32e94153d1..cbf0081374 100644
>>> --- a/target/ppc/cpu_init.c
>>> +++ b/target/ppc/cpu_init.c
>>> @@ -7015,6 +7015,7 @@ static vaddr ppc_cpu_get_pc(CPUState *cs)
>>>        return cpu->env.nip;
>>>    }
>>>    
>>> +#ifdef CONFIG_TCG
>>>    static void ppc_restore_state_to_opc(CPUState *cs,
>>>                                         const TranslationBlock *tb,
>>>                                         const uint64_t *data)
>>> @@ -7023,6 +7024,7 @@ static void ppc_restore_state_to_opc(CPUState *cs,
>>>    
>>>        cpu->env.nip = data[0];
>>>    }
>>> +#endif /* CONFIG_TCG */
>>>    
>>>    static bool ppc_cpu_has_work(CPUState *cs)
>>>    {
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index a05a2ed595..94adcb766b 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -2842,6 +2842,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
>>>    #endif
>>>    #endif
>>>    
>>> +#ifdef CONFIG_TCG
>>>    static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uint32_t lane)
>>>    {
>>>        const uint16_t c = 0xfffc;
>>> @@ -2924,6 +2925,7 @@ HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
>>>    HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
>>>    HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
>>>    HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
>>> +#endif /* CONFIG_TCG */
>>>    
>>>    #if !defined(CONFIG_USER_ONLY)
>>>    
> 


