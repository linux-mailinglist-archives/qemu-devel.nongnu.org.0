Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E92539EB1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 09:47:07 +0200 (CEST)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwJ4L-00073t-90
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 03:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwJ2P-0006G5-Oz
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 03:45:06 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:34311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwJ2N-0007zc-Af
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 03:45:05 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0326C1063015C;
 Wed,  1 Jun 2022 09:44:58 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 1 Jun 2022
 09:44:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0049bad7fe5-a66a-4b9c-9332-54b11b03aa0e,
 A963F33A9D1A618F9A1E828761F10BD73193B711) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5435bc6f-70c4-4a18-72b7-147ada5f6a1b@kaod.org>
Date: Wed, 1 Jun 2022 09:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Murilo Opsfelder Araujo
 <muriloo@linux.ibm.com>, <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 <mopsfelder@gmail.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
 <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5e384090-e17e-4d3d-97b9-15754c8486eb
X-Ovh-Tracer-Id: 1799751003841661874
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeelgdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeljefhieetffeltdefteeutdekhfefuedttdevteffffffgedttdekieeftdetkeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/22 09:27, Thomas Huth wrote:
> On 31/05/2022 19.27, Murilo Opsfelder Araujo wrote:
>> Update max alias to power10 so users can take advantage of a more
>> recent CPU model when '-cpu max' is provided.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1038
>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: Cédric Le Goater <clg@kaod.org>
>> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>> ---
>>   target/ppc/cpu-models.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
>> index 976be5e0d1..c15fcb43a1 100644
>> --- a/target/ppc/cpu-models.c
>> +++ b/target/ppc/cpu-models.c
>> @@ -879,7 +879,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>>       { "755", "755_v2.8" },
>>       { "goldfinger", "755_v2.8" },
>>       { "7400", "7400_v2.9" },
>> -    { "max", "7400_v2.9" },
>>       { "g4",  "7400_v2.9" },
>>       { "7410", "7410_v1.4" },
>>       { "nitro", "7410_v1.4" },
>> @@ -910,6 +909,8 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>>       { "power8nvl", "power8nvl_v1.0" },
>>       { "power9", "power9_v2.0" },
>>       { "power10", "power10_v2.0" },
>> +    /* Update the 'max' alias to the latest CPU model */
>> +    { "max", "power10_v2.0" },
>>   #endif
> 
> I'm not sure whether "max" should really be fixed alias in this list here? What if a user runs with KVM on a POWER8 host - then "max" won't work this way, will it?
> 
> And in the long run, it would also be good if this would work with other machines like the "g3beige", too (which don't support the new 64-bit POWER CPUs), so you should at least mention in the commit description that this is only a temporary hack for the pseries machine, I think.

Yes. You are right, Thomas.

s390 and x86 have a nice way to address "max".

Thanks,

C.

> 
>   Thomas
> 


