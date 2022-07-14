Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D535750CA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 16:28:32 +0200 (CEST)
Received: from localhost ([::1]:37430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBzpP-00079k-LW
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 10:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBzoB-0005T6-Iq
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:27:15 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:46717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBzo8-0007yJ-64
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:27:14 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EBCA511820B57;
 Thu, 14 Jul 2022 16:26:56 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 14 Jul
 2022 16:26:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002cf6a21d6-de9b-49a2-a9c4-fd58bfb471b5,
 34332D216D760BBBE1E6AE2DE5FCE67E0A5C7624) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <16349149-8714-505c-c299-ad7e599ec4b5@kaod.org>
Date: Thu, 14 Jul 2022 16:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 00/19] aspeed queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>
References: <20220713075255.2248923-1-clg@kaod.org>
 <CAFEAcA8xxt3k932pgAj45ivZWq3VQoc2GSEQy1j9PtrP42ig9g@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8xxt3k932pgAj45ivZWq3VQoc2GSEQy1j9PtrP42ig9g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 69927096-0d21-4b6a-815b-bef52abd20da
X-Ovh-Tracer-Id: 2859785766474320864
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledgjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedttefhfedttdegleefkeefveefkefgvdfhueeikeduhedvveelleefteeiffffveenucffohhmrghinhepghhithhlrggsrdgtohhmpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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

On 7/14/22 15:51, Peter Maydell wrote:
> On Wed, 13 Jul 2022 at 08:53, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The following changes since commit 8e3d85d36b77f11ad7bded3a2d48c1f0cc334f82:
>>
>>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-12 14:12:15 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220713
>>
>> for you to fetch changes up to 053b2ee5629d1b822127cc454634ec272624bab2:
>>
>>    aspeed: Add fby35-bmc slot GPIO's (2022-07-13 08:16:46 +0200)
>>
>> ----------------------------------------------------------------
>> aspeed queue:
>>
>> * New ISL69259 device model
>> * New fby35 multi-SoC machine (AST1030 BIC + AST2600 BMC)
>> * Aspeed GPIO fixes
>> * Extension of m25p80 with write protect bits
>> * More avocado tests using the Aspeed SDK
>>
>> ----------------------------------------------------------------
> 
> Build failures:
> https://gitlab.com/qemu-project/qemu/-/jobs/2722152320
> 
> hw/arm/fby35.c isn't passing enough arguments to blk_pread().
> 
> Your pullreq probably collided with the recent merge of the
> block patches including
> commits 3b35d4542c853 and a9262f551eba44 which add a new
> argument and swap two of the existing arguments to this function.

Yes. I will resend after a rebase.

Thanks,

C.

