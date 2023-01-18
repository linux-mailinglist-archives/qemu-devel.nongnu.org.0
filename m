Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3355867166E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 09:45:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI43D-0004Ey-1C; Wed, 18 Jan 2023 03:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pI438-0004AZ-9m
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 03:44:02 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pI435-0002XY-4e
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 03:44:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8EBFE2E5F9;
 Wed, 18 Jan 2023 08:43:52 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 18 Jan
 2023 09:43:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002bf42bf42-eb5a-4fae-aeeb-d1d95dbb7365,
 B02C0E203F6A6AD140F658F33EDEBE178EEACDD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <28570971-123f-83aa-8b46-df2377746817@kaod.org>
Date: Wed, 18 Jan 2023 09:43:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 04/11] hw/arm/aspeed: Use the IEC binary prefix
 definitions
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Joel Stanley
 <joel@jms.id.au>
CC: <qemu-devel@nongnu.org>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo Leal
 <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-5-philmd@linaro.org>
 <CACPK8XcdKGvQGOeBKQXRhYVZKO5k8jCv_1syNbZr8YPufaSjLg@mail.gmail.com>
 <8646a560-dd95-6cdb-1f7b-3d344ee744f7@kaod.org>
 <1c532bf1-e69e-1ee6-da46-44ad07208af3@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1c532bf1-e69e-1ee6-da46-44ad07208af3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ad651086-a4fe-4c8a-a755-a612da6824d6
X-Ovh-Tracer-Id: 12774460343123544964
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdgslhgvrghlsehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgrnhgurhgvfiesrghjrdhiugdrrghupdgthhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthh
 drtghomhdpphgvthgvrhesphhjugdruggvvhdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhpuggvlhesfhgsrdgtohhmpdhpuggvlhesmhgvthgrrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
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

On 1/18/23 09:37, Philippe Mathieu-Daudé wrote:
> On 18/1/23 08:32, Cédric Le Goater wrote:
>> On 1/18/23 07:53, Joel Stanley wrote:
>>> On Fri, 30 Dec 2022 at 11:35, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> IEC binary prefixes ease code review: the unit is explicit.
>>>
>>> I strongly prefer the existing code; it tells you the size without
>>> having to do maths.
> 
> I guess it depends on one's mindset and culture / education,
> maybe I'm too young for the full hexadecimal world and am more
> custom to decimal notation with binary prefixes.
> 
> 0x16400 is just another magic number for me, while 89 * KiB is a size.
> 
>> you mean that it matches better with the address space representation
>> in the code and the 'info mtree' output ? If so, I agree. We can keep
>> this patch out, it is not fundamental.
>>
>> The hex representation of values has its advantages compared to the
>> macros because hex is generally what you get in debug outputs and
>> it is easier to compare and manipulate.  Some Linux dev feel the
>> same.
> 
>>>> aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>>>>       sc->name         = "ast2600-a3";
>>>>       sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
>>>>       sc->silicon_rev  = AST2600_A3_SILICON_REV;
>>>> -    sc->sram_size    = 0x16400;
>>>> +    sc->sram_size    = 89 * KiB;
> To keep everybody happy I'll respin using:
> 
>           sc->sram_size    = 0x16400; /* 89 * KiB */

I had some minor/aesthetic comments. If you could also address them please, I will
include this series in the aspeed-8.0 PR.

Thanks,

C.


