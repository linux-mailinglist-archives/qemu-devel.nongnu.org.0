Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3006A7D42
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:03:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXept-0007Va-4B; Thu, 02 Mar 2023 04:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pXepr-0007VC-6H
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:02:47 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pXepp-0008QJ-E1
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:02:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 13D9A1FE70;
 Thu,  2 Mar 2023 09:02:34 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 2 Mar
 2023 10:02:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00197cb44b4-9b15-4aa7-b3f2-c5951b942215,
 9B4FE5079A0EA0ECEB0374FF8CD8206378B8B5FD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d097fedc-ecd7-abe5-7b90-0dcdddbb88ee@kaod.org>
Date: Thu, 2 Mar 2023 10:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 09/11] aspeed: Introduce a spi_boot region under the SoC
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230301165619.2171090-1-clg@kaod.org>
 <20230301165619.2171090-10-clg@kaod.org>
 <4306d877-e667-4bf9-276c-a68bf4e9717e@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <4306d877-e667-4bf9-276c-a68bf4e9717e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9fadfbc1-6659-43fa-8a45-af5f54eaf8fb
X-Ovh-Tracer-Id: 7361696543561911078
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeliedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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

On 3/1/23 18:52, Philippe Mathieu-Daudé wrote:
> On 1/3/23 17:56, Cédric Le Goater wrote:
>> The default boot address of the Aspeed SoCs is 0x0. For this reason,
>> the FMC flash device contents are remapped by HW on the first 256MB of
>> the address space. In QEMU, this is currently done in the machine init
>> with the setup of a region alias.
>>
>> Move this code to the SoC and introduce an extra container to prepare
>> ground for the boot ROM region which will overlap the FMC flash
>> remapping.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/arm/aspeed_soc.h |  5 +++++
>>   hw/arm/aspeed.c             | 13 +------------
>>   hw/arm/aspeed_ast2600.c     | 13 +++++++++++++
>>   hw/arm/aspeed_soc.c         | 14 ++++++++++++++
> 
> Why aspeed2600 duplicates a lot of aspeed_soc_init() /
> aspeed_soc_realize() while inheriting from TYPE_ASPEED_SOC?

We thought, back in 2019 or so, that duplicating the models was a better
approach to keep a clear understanding of the SoCs and their differences.
I agree they are very similar and maybe that was not the best solution.
OTOH, AST2600 has being receiving the most attention since it is the
latest.

The common TYPE_ASPEED_SOC is required to share a few properties at the
board level if I remember well.

Thanks,

C.

> Is that on purpose or because not using device_class_set_parent_realize?
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>>   hw/arm/fby35.c              |  8 +-------
>>   5 files changed, 34 insertions(+), 19 deletions(-)
> 


