Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08CF484705
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 18:34:25 +0100 (CET)
Received: from localhost ([::1]:58186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4nhY-00072f-SZ
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 12:34:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4ne2-0001np-Bn
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:30:46 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:37579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4ndx-0003CI-Jr
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:30:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8B514D58B51B;
 Tue,  4 Jan 2022 18:30:38 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 4 Jan
 2022 18:30:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00185534eca-e61e-4eb8-938e-a94e0367f529,
 DC41CA294A1AC0AE13D8E7EBC58C249E9ADF812E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d8769cce-be68-9631-6ff1-f871e7150983@kaod.org>
Date: Tue, 4 Jan 2022 18:30:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/9] target/ppc: Use ppc_interrupts_little_endian in
 powerpc_excp
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
 <20220103220746.3916246-6-farosas@linux.ibm.com>
 <ca700ead-7cf1-6d8c-12f6-9d03b547d517@kaod.org>
 <87bl0rh9q2.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87bl0rh9q2.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a434fc03-42b6-4fff-b430-9fab9e58b9d5
X-Ovh-Tracer-Id: 9529053864036109094
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 15:11, Fabiano Rosas wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 1/3/22 23:07, Fabiano Rosas wrote:
>>> The ppc_interrupts_little_endian function is suitable for determining
>>> the endianness of interrupts for all Book3S CPUs.
>>>
>>> (I'm keeping the MSR check for the rest of the CPUs, but it will go
>>> away in the next patch.)
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>>> ---
>>>    target/ppc/excp_helper.c | 21 ++-------------------
>>>    1 file changed, 2 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index 0dbadc5d07..5d31940426 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -760,25 +760,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
>>>         * CPU, the HV mode, etc...
>>>         */
>>>    #ifdef TARGET_PPC64
>>> -    if (excp_model == POWERPC_EXCP_POWER7) {
>>> -        if (!(new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
>>> -            new_msr |= (target_ulong)1 << MSR_LE;
>>> -        }
>>> -    } else if (excp_model == POWERPC_EXCP_POWER8) {
>>> -        if (new_msr & MSR_HVB) {
>>> -            if (env->spr[SPR_HID0] & HID0_HILE) {
>>> -                new_msr |= (target_ulong)1 << MSR_LE;
>>> -            }
>>> -        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
>>> -            new_msr |= (target_ulong)1 << MSR_LE;
>>> -        }
>>> -    } else if (excp_model == POWERPC_EXCP_POWER9 ||
>>> -               excp_model == POWERPC_EXCP_POWER10) {
>>> -        if (new_msr & MSR_HVB) {
>>> -            if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
>>> -                new_msr |= (target_ulong)1 << MSR_LE;
>>> -            }
>>> -        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
>>> +    if (excp_model >= POWERPC_EXCP_970) {
>>
>> why include POWERPC_EXCP_970 ? These CPUs do not support Little Endian.
>>
> 
> Because the 970 exception model covers POWER5P as well which has ILE.
we need to untangle this first.

POWERPC_EXCP_970 is checked in dbcz and the HID5 bits are specific to 970.
May be add a POWERPC_EXCP_POWER5P ?

> And looking at cpu_init.c, POWER5 uses a bunch of 970 functions. And
> POWER7 uses the POWER5 ones. So we kind of have a dependency chain
> there. That is why I'm always handling ">= 970" as "books".
> 

This is a mess. We also have is_book3s_arch2x() but it will not apply
here.

C.

