Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3458349E8ED
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:26:26 +0100 (CET)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8XQ-0007Vz-Vm
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:26:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nD7ze-0006Jl-6t
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:51:30 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:38109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nD7za-000131-Cw
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:51:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B560A22556;
 Thu, 27 Jan 2022 16:51:15 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 27 Jan
 2022 17:51:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045cac8408-5d5a-455f-89d9-2f01c32a3359,
 005EA5633138E2083738B875F2BEA0C5B8FD6F17) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1ca5f320-7164-6a42-2c9d-ae4b88dd943e@kaod.org>
Date: Thu, 27 Jan 2022 17:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, <qemu-devel@nongnu.org>
References: <20220126164200.1048677-1-farosas@linux.ibm.com>
 <d592e76d-cb1f-7594-39ae-895fb4811242@ilande.co.uk>
 <87a6fhqkd4.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87a6fhqkd4.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4eb31d92-4a8b-46b8-86a3-161be7845470
X-Ovh-Tracer-Id: 14808961476201253737
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevjeeiledthfeljedvueejkeffgeduudffvddutdfhgeettddtjeejkefftdfgheenucffohhmrghinhepghhnuhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/22 16:16, Fabiano Rosas wrote:
> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
> 
>> On 26/01/2022 16:41, Fabiano Rosas wrote:
>>
>>> This handles the exception code for the 74xx family, i.e. 7400, 7410,
>>> 7440, 7445, 7450, 7455, 7457.
>>>
>>> This is another family that is quite well known, so it should be
>>> straight-forward as well.
>>>
>>> Based on legoater/ppc-7.0
>>>
>>> Fabiano Rosas (8):
>>>     target/ppc: Introduce powerpc_excp_74xx
>>>     target/ppc: Simplify powerpc_excp_74xx
>>>     target/ppc: 74xx: Machine Check exception cleanup
>>>     target/ppc: 74xx: External interrupt cleanup
>>>     target/ppc: 74xx: Program exception cleanup
>>>     target/ppc: 74xx: System Call exception cleanup
>>>     target/ppc: 74xx: System Reset interrupt cleanup
>>>     target/ppc: 74xx: Set SRRs directly in exception code
>>>
>>>    target/ppc/excp_helper.c | 175 +++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 175 insertions(+)
>>
>> I'm not overly familiar with PPC exception handling detail, so I can't offer much in
>> the way of review I'm afraid. I could do a quick test and make sure nothing breaks
>> with my MacOS images though?
> 
> Sure, no problem. This is more of an FYI and so you know whom to yell at
> in case anything breaks for you.

yes ! Thanks,

> I have some MacOS images I can use to test as well. I'll do a thorough
> pass before sending the v2.
> 
>> Also any thoughts on Christophe's question re: e300 PVRs at
>> https://lists.gnu.org/archive/html/qemu-ppc/2022-01/msg00592.html? I can handle
>> merging the OpenBIOS changes if someone can come up with a suitable fix.

Why not simply extend 'struct cpudef' with a flag/feature field ?

> I believe Cédric has been looking at the 60x, maybe he has some
> input. 

yes. 604 is running fine under the 40p machine with OpenBIOS.
I have an old debian 3 disk image for it.

On the same machine, AIX 4x and 5x also run with this firmware :

   http://github.com/artyom-tarasenko/openfirmware/releases/download/40p-20190413/q40pofw-serial.rom

and the g3beige supports 604.

Getting a status on 603 is more complex. We need support for the
6xx SoftTLBs in OpenBIOS to move forward. Christophe and I have
spent some time on this. Work in progress.

602 should be removed IMHO. It has no real value.

601 is a transitional processor. It think it should be good to
keep as a reference. I don't have a workload for it though.

> We currently can only run the 604 if I'm not mistaken, so there's
> some work to be done to bring all of the 60x back to life. The e300 will
> be in the mix.

It should yes. I haven't looked at it yet.

Thanks,

C.

