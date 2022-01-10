Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D2548A036
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:33:16 +0100 (CET)
Received: from localhost ([::1]:36402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70Pr-0003DK-Ve
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:33:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n70LC-0001Bq-3Z
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:28:26 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:53283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n70L6-0006jx-3l
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:28:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DDEEE20A72;
 Mon, 10 Jan 2022 19:28:17 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 20:28:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006d7d737f4-63d1-49fa-8d21-b610f32a0c90,
 BF6F17FB45C67FCD004F592EBF28FE1306A73352) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1abb3875-c3f0-69eb-4912-107cf1108200@kaod.org>
Date: Mon, 10 Jan 2022 20:28:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: Add extra float instructions to POWER5P
 processors
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20220110161959.758997-1-clg@kaod.org>
 <b72f9546-ab8-9e3-551a-614a61487ddf@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b72f9546-ab8-9e3-551a-614a61487ddf@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f63d61f4-14b3-43b5-8772-24689dc02454
X-Ovh-Tracer-Id: 9858661060389211101
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 19:42, BALATON Zoltan wrote:
> On Mon, 10 Jan 2022, Cédric Le Goater wrote:
>> ISA v2.03 introduced Floating Round to Integer instructions : frin,
>> friz, frip, and frim. Add them to POWER5+.
>>
>> The PPC_FLOAT_EXT flag also includes the fre (Floating Reciprocal
>> Estimate) instruction which was introduced in ISA v2.0x. The
>> architecture document says its optional and that might the reason why
> 
> There's a grammar error in this sentence. I think it should be "might be the reason" or "might have been the reason", not sure which is more correct but "be" is missing here for sure. Another one: it should be "it's" instead of "its" in this context.

A "be" is missing indeed ! Fixed.

Thanks,

C.

> 
> Regards,
> BALATON Zoltan
> 
>> it has been kept under the PPC_FLOAT_EXT. This means 970 CPUs can not
>> use it under QEMU.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> target/ppc/cpu_init.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index f15a52259c90..e30e86fe9d04 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -6953,6 +6953,7 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
>>                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>>                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
>>                        PPC_FLOAT_STFIWX |
>> +                       PPC_FLOAT_EXT |
>>                        PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
>>                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
>>                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
>>


