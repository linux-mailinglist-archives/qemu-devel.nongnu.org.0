Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0836A991B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 15:09:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY65w-0008FW-0z; Fri, 03 Mar 2023 09:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pY65s-0008F9-Rr
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:09:08 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pY65r-00015K-4y
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:09:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 86DDC20790;
 Fri,  3 Mar 2023 14:09:03 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 3 Mar
 2023 15:09:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0042d930621-53e7-4135-96e2-3284c0a14617,
 D247C90D5DACFD620130D6A3F59DE8A1FE9C6D23) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d62972e8-cfc9-e494-1b41-cf4825715532@kaod.org>
Date: Fri, 3 Mar 2023 15:08:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL 00/11] aspeed queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230302174206.2434673-1-clg@kaod.org>
 <840ae915-390e-5cb9-3186-360856ecf407@kaod.org>
 <CAFEAcA-HvviZFZXBwJQXhxVsqv473=5BW=WJgKSd25uqmschXw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA-HvviZFZXBwJQXhxVsqv473=5BW=WJgKSd25uqmschXw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 89f1fae1-78d8-483f-b685-d7f4d3f7e7da
X-Ovh-Tracer-Id: 18410433804771363805
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudelledgheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedukeeuheegtdekvdegveelvdffieegveevheeukeetgeekfeeivefgheduieekteenucffohhmrghinhepghhithhlrggsrdgtohhmpdhgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
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

On 3/3/23 14:34, Peter Maydell wrote:
> On Fri, 3 Mar 2023 at 13:23, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Hello Peter,
>>
>> On 3/2/23 18:41, Cédric Le Goater wrote:
>>> The following changes since commit a2b5f8b8ab7b2c947823088103a40f0ff11fe06b:
>>>
>>>     Merge tag 'pull-tcg-20230301' of https://gitlab.com/rth7680/qemu into staging (2023-03-01 19:19:20 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://github.com/legoater/qemu/ tags/pull-aspeed-20230302
>>>
>>> for you to fetch changes up to b22a2d409b1acfdf0d63d1bb3595194ceb3d94da:
>>>
>>>     aspeed/smc: Replace SysBus IRQs with GPIO lines (2023-03-02 13:57:50 +0100)
>>>
>>> ----------------------------------------------------------------
>>> aspeed queue:
>>>
>>> * fix for the Aspeed I2C slave mode
>>> * a new I2C echo device from Klaus and its associated test in avocado.
>>> * initial SoC cleanups to allow the use of block devices instead of
>>>     drives on the command line.
>>> * new facebook machines and eeprom fixes for the Fuji
>>> * readline fix
>>
>> This one was merged already. Would you prefer an updated PR instead ?
> 
> I'm not sure what you're asking ?

Sorry, I am not being clear. I included commit 76f5801a83 ("readline:
fix hmp completion issue") in the PR, which could be an issue when you
merge, may be not, I am not sure. I can respin if you like.

Thanks,

C.


