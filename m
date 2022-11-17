Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122862D39D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 07:50:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovYiv-0005ev-5Q; Thu, 17 Nov 2022 01:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovYiU-0005ZY-DU
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 01:49:51 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovYiS-0005zx-4X
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 01:49:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 017302962D;
 Thu, 17 Nov 2022 06:49:33 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 07:49:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006dae6a3b1-e246-403e-8ec2-0407047322ac,
 AE5717285A2AC47C671D2CB192D1CF6730B7D7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <69a17931-20b2-3d38-cd89-b8375d311b6b@kaod.org>
Date: Thu, 17 Nov 2022 07:49:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
Content-Language: en-US
To: Vaibhav Jain <vaibhav@linux.ibm.com>, Greg Kurz <groug@kaod.org>
CC: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>,
 <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, Kowshik Jois B S <kowsjois@linux.ibm.com>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
 <20221116162025.330e5a4f@bahia> <87r0y2wcnx.fsf@vajain21.in.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87r0y2wcnx.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 4745d010-1eb0-45c9-88c0-7b680ec75358
X-Ovh-Tracer-Id: 15671682279450839913
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejteffvddviedtvedvhfdttefgteefheffgfehfffgfeelkeetleeghfeivdefveenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehvrghisghhrghvsehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhkohifshhjohhisheslhhinhhugidrihgsmhdrtghomhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmoh
 ehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 11/17/22 03:13, Vaibhav Jain wrote:
> Greg Kurz <groug@kaod.org> writes:
> 
>> Hi Vaibhav,
>>
> Hey Greg,
> 
> Good to see you,
> 
>> Nice to see some people are still building QEMU at IBM ;-)
> Yeah, and will hopefully continue to do this in future :-)
> 
> <snip>
>>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>>> ---
>>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
>>
> Thanks
> 
>> This was introduced by a recent commit.
>>
>> Fixes: 61bd1d29421a ("target/ppc: Convert to tcg_ops restore_state_to_opc")
> Thanks again for pointing out the commit that caused this.
> 
>>
>>
>> Vaibhav,
>>
>> This is serious enough it should get fixed in 7.2. Please fill up an
>> issue as explain in [1].
> I have raised an issue on gitlab at
> https://gitlab.com/qemu-project/qemu/-/issues/1319
> 

And so,

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/377

Thanks,

C.


