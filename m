Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93D44D519
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:35:38 +0100 (CET)
Received: from localhost ([::1]:50522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7Qf-0004lP-AV
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:35:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ml7PY-0003dY-2j; Thu, 11 Nov 2021 05:34:28 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:60413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ml7PV-0005Rt-8E; Thu, 11 Nov 2021 05:34:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C291BCAE4490;
 Thu, 11 Nov 2021 11:34:21 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 11 Nov
 2021 11:34:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006750b2484-2964-46e0-b900-2ba83032ca9e,
 8B5B52A496DB6C6EAAECFF7965DC260A0E8F97D2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d5172fc5-3b71-02de-8dbc-060b9faaffda@kaod.org>
Date: Thu, 11 Nov 2021 11:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/1] ppc/mmu_helper.c: do not truncate 'ea' in
 booke206_invalidate_ea_tlb()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211110202516.1993815-1-danielhb413@gmail.com>
 <20211110202516.1993815-2-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211110202516.1993815-2-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b510ea1e-a74b-4e79-9030-5475c4d3f46b
X-Ovh-Tracer-Id: 17414575336573668259
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrvddugddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevudeugffglefftedvlefgffduhfefudegffetffdtueetueetjeffgfdtgedvteenucffohhmrghinhepghhithhlrggsrdgtohhmpdhrrghpthhorhgtshdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 21:25, Daniel Henrique Barboza wrote:
> 'tlbivax' is implemented by gen_tlbivax_booke206() via
> gen_helper_booke206_tlbivax(). In case the TLB needs to be flushed,
> booke206_invalidate_ea_tlb() is called. All these functions, but
> booke206_invalidate_ea_tlb(), uses a 64-bit effective address 'ea'.
> 
> booke206_invalidate_ea_tlb() uses an uint32_t 'ea' argument that
> truncates the original 'ea' value for apparently no particular reason.
> This function retrieves the tlb pointer by calling booke206_get_tlbm(),
> which also uses a target_ulong address as parameter - in this case, a
> truncated 'ea' address. All the surrounding logic considers the
> effective TLB address as a 64 bit value, aside from the signature of
> booke206_invalidate_ea_tlb().
> 
> Last but not the least, PowerISA 2.07B section 6.11.4.9 [2] makes it
> clear that the effective address "EA" is a 64 bit value.
> 
> Commit 01662f3e5133 introduced this code and no changes were made ever
> since. An user detected a problem with tlbivax [1] stating that this
> address truncation was the cause. This same behavior might be the source
> of several subtle bugs that were never caught.
> 
> For all these reasons, this patch assumes that this address truncation
> is the result of a mistake/oversight of the original commit, and changes
> booke206_invalidate_ea_tlb() 'ea' argument to 'vaddr'.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/52
> [2] https://wiki.raptorcs.com/wiki/File:PowerISA_V2.07B.pdf
> 
> Fixes: 01662f3e5133 ("PPC: Implement e500 (FSL) MMU")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/52
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/mmu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

It looks correct. I am not sure why we introduced PPC_TLBIVAX since
we don't use it for the instruction. But e200 needs it AFAICT.

Any how,

Queued for 6.2

Thanks,

C.


> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 2cb98c5169..e0c4950dda 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1216,7 +1216,7 @@ void helper_booke206_tlbsx(CPUPPCState *env, target_ulong address)
>   }
>   
>   static inline void booke206_invalidate_ea_tlb(CPUPPCState *env, int tlbn,
> -                                              uint32_t ea)
> +                                              vaddr ea)
>   {
>       int i;
>       int ways = booke206_tlb_ways(env, tlbn);
> 


