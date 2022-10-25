Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEE760CEC8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 16:20:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onKhl-0005rh-2O; Tue, 25 Oct 2022 10:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1onKhg-0005oA-0J
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 10:14:52 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1onKhS-00021A-2p
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 10:14:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2861D136370D1;
 Tue, 25 Oct 2022 16:14:20 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 25 Oct
 2022 16:14:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003005edf09-bd91-4c0b-b6b6-767824917878,
 C51D709EDC378CBF81E5C879F3A6BC578FFA89E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7b6eb8bf-1f5a-8c6b-4346-876f1bd34f55@kaod.org>
Date: Tue, 25 Oct 2022 16:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: soc_name for supermicrox11-bmc machine: ast2400-a1 or ast2500-a1 ?
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, QEMU Developers <qemu-devel@nongnu.org>
CC: Erik Smit <erik.lucas.smit@gmail.com>, Joel Stanley <joel@jms.id.au>, Ryan
 Sie <ryans@supermicro.com.tw>
References: <f9a80497-bdfa-f3e3-1e32-75687d5f7256@roeck-us.net>
 <527a218f-96b8-8123-730d-ade3fe7f0d39@kaod.org>
 <6c770eba-c3e4-bf11-151c-18aae4d82ddf@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <6c770eba-c3e4-bf11-151c-18aae4d82ddf@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f6927022-d940-4d4a-972a-5bbf467372c8
X-Ovh-Tracer-Id: 17238653477363813283
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrtddtgdegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvddvgfejudegudfgteduueehjedugffftdefgeetffeivdfhvdduhffhheegleefnecuffhomhgrihhnpehsuhhpvghrmhhitghrohdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgvrhhikhdrlhhutggrshdrshhmihhtsehgmhgrihhlrdgtohhmpdhjohgvlhesjhhmshdrihgurdgruhdprhihrghnshesshhuphgvrhhmihgtrhhordgtohhmrdhtfidpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 15:37, Guenter Roeck wrote:
> On 10/24/22 23:25, Cédric Le Goater wrote:
>> Hello Guenter
>>
>> On 10/24/22 22:56, Guenter Roeck wrote:
>>> Hi,
>>>
>>> I always wondered why I am having trouble running Linux on supermicrox11-bmc.
>>> Building the kernel with aspeed_g4_defconfig results in its clock running
>>> at ~20x the real clock speed, and kernels built with aspeed_g5_defconfig
>>> do not boot at all.
>>>
>>> I ended up spending some time on it last weekend and noticed that the SOC
>>> is configured to ast2400-a1. However, the Supermicro documentation as well
>>> as the devicetree file in the Linux kernel suggest that the SOC on the X11
>>> board is an ast2500.
>>
>> It is true that the Linux DT file includes an AST2500 SoC.
>>
>> However, the QEMU BMC machine was added to support such boards :
>>
>>     https://www.supermicro.com/en/products/motherboard/X11SSL-F
>>
>> where it says ASPEED AST2400 BMC for IPMI and graphics. The firmware
>> detects the SoC as an AST2300, which means it doesn't have support for
>> the ast2400 ...
>>
> 
> Interesting. I was looking at
> 
> https://www.supermicro.com/en/solutions/management-software/bmc-resources
> 
> where X11 boards are associated with AST2500, and X10 boards with AST2400,
> However, I do see that the motherboard list shows that it is indeed a mixed
> bag.
> 
>>
>>> Indeed, it turns out that all my problems are gone if I change the SOC
>>> to ast2500-a1 and use aspeed_g5_defconfig to build the Linux kernel.
>>>
>>> Was there a reason to select ast2400-a1 for this machine, or is that
>>> a bug ?
>>
>>
>> May be there were multiple generations of the X11 mother boards.
>>
> 
> Looks like it.
> 
>> It wouldn't be difficult adding a new supermicrox11-<something>-bmc
>> machine with an AST2500 SoC for your needs.

I would suggest supermicrox11-spi-bmc to match the DT.

mac0 and mac1 are active. It would be nice to have some flash models
commonly attached to these boards. May be Ryan can tell.

Thanks,

C.
   

