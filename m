Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B431E5593D1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 08:57:57 +0200 (CEST)
Received: from localhost ([::1]:51732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4dGO-0002zy-BQ
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 02:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dDo-0000ug-AN
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:55:16 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:48865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dDk-00052V-Nw
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:55:15 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 911131109BAB7;
 Fri, 24 Jun 2022 08:55:03 +0200 (CEST)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 08:55:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0046d7203b2-9411-4f57-b4ab-39e769465d25,
 5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9093f275-8062-7992-293e-1c5c129fd228@kaod.org>
Date: Fri, 24 Jun 2022 08:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/8] aspeed: Set CPU memory property explicitly
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-2-pdel@fb.com>
 <3ba89576-b482-14da-9a23-22c0e652e148@kaod.org>
In-Reply-To: <3ba89576-b482-14da-9a23-22c0e652e148@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cc83149e-aee2-413e-8d10-82d8b6c2f00d
X-Ovh-Tracer-Id: 6901484954357697504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvvehfjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieejheeiveeuledthfehheeltedtgfetkeevgffguedujefgfeejgfetueelleegnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
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

On 6/24/22 08:36, Cédric Le Goater wrote:
> On 6/24/22 02:36, Peter Delevoryas wrote:
>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> 
> Please merge this patch with patch 2 in which the "memory" property
> is defined.

Ah no. That's another link. I don't understand where that was done
before.

C.


> 
> Thanks,
> 
> C.
> 
> 
>> ---
>>   hw/arm/aspeed_ast2600.c | 2 ++
>>   hw/arm/aspeed_soc.c     | 2 ++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>> index f70b17d3f9..f950fff070 100644
>> --- a/hw/arm/aspeed_ast2600.c
>> +++ b/hw/arm/aspeed_ast2600.c
>> @@ -294,6 +294,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>           object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
>>                                   &error_abort);
>> +        object_property_set_link(OBJECT(&s->cpu[i]), "memory",
>> +                                 OBJECT(get_system_memory()), &error_abort);
>>           if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>>               return;
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index f530028874..06e5629800 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -247,6 +247,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>>       /* CPU */
>>       for (i = 0; i < sc->num_cpus; i++) {
>> +        object_property_set_link(OBJECT(&s->cpu[i]), "memory",
>> +                                 OBJECT(get_system_memory()), &error_abort);
>>           if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>>               return;
>>           }
> 
> 


