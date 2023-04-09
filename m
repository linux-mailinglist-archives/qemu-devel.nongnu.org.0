Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B8D6DC0E0
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 19:31:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plYra-0000zE-No; Sun, 09 Apr 2023 13:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1plYrZ-0000ya-52; Sun, 09 Apr 2023 13:30:01 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1plYrX-0000dt-HE; Sun, 09 Apr 2023 13:30:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.179])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8E4A120AB7;
 Sun,  9 Apr 2023 17:29:47 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 9 Apr
 2023 19:29:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0069ed3360e-b9f2-4f15-88da-a426a3e6fb7c,
 E084EAA979036BB7449ED778253F1391A5EEEA31) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <72e69d86-cf6c-a621-d2dc-42fc26cbe396@kaod.org>
Date: Sun, 9 Apr 2023 19:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH for-8.0 v2] target/ppc: Fix temp usage in gen_op_arith_modw
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
CC: <danielhb413@gmail.com>, <david@gibson.dropbear.id.au>, <groug@kaod.org>, 
 <qemu-ppc@nongnu.org>, Nicholas Piggin <npiggin@gmail.com>, Anton Johansson
 <anjo@rev.ng>
References: <20230408070547.3609447-1-richard.henderson@linaro.org>
 <606b0b02-a167-8cb1-db0f-119442d0aa16@kaod.org>
 <9bf63987-e868-d663-b8a4-e6a4f7ab0eba@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <9bf63987-e868-d663-b8a4-e6a4f7ab0eba@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 1e639ab7-155f-4100-9c91-e1fe536ba18b
X-Ovh-Tracer-Id: 17729264361517386604
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdektddgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeethedtgfeltdelhedtkefhfeekffegvdekhfdttedvtdevgedvgeeftdfgvdffnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehpdekvddrieeirdejjedrudduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhnphhighhgihhnsehgmhgrihhlrdgtoh
 hmpdgrnhhjohesrhgvvhdrnhhgpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.888,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/9/23 18:21, Richard Henderson wrote:
> On 4/8/23 14:24, Cédric Le Goater wrote:
>> On 4/8/23 09:05, Richard Henderson wrote:
>>> Fix a crash writing to 't3', which is now a constant.
>>> Instead, write the result of the remu to 't1'.
>>>
>>> Fixes: 7058ff5231a ("target/ppc: Avoid tcg_const_* in translate.c")
>>> Reported-by: Nicholas Piggin <npiggin@gmail.com>
>>> Reviewed-by: Anton Johansson <anjo@rev.ng>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> Looks good:
>>
>>    https://gitlab.com/legoater/qemu/-/pipelines/831847446
>>
>> I have a PR ready for this same branch. If you want to me send,
>> just tell.
> 
> Yes, please.  Also, the comment above needs s/t1/t0/.  :-P

sure :)

Are you taking care of :

   https://lore.kernel.org/r/20230408154316.3812709-1-richard.henderson@linaro.org

C.


> 
> 
> r~
> 
>>
>> I don't think we have tcg tests for the prefix or mma instructions
>> introduced in P10. That would be good to have.
>>
>> C.
>>
> 


