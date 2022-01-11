Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E52F48A954
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 09:28:38 +0100 (CET)
Received: from localhost ([::1]:57234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7CWD-0006L5-63
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 03:28:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7CTi-0004Am-2a
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:26:02 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:46241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7CTf-0002Df-SD
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:26:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 12B8921E81;
 Tue, 11 Jan 2022 08:25:53 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 09:25:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001feae2f63-891f-48fe-9e03-5fa327fe1117,
 FFD8DCB8B568E78E86EDC96A86417857C679DA6D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <cbeab84b-2d50-3713-63d9-6d8f2af5c85f@kaod.org>
Date: Tue, 11 Jan 2022 09:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/2] hw/misc: Implementating dummy AST2600 I3C model
Content-Language: en-US
To: Troy Lee <leetroy@gmail.com>
References: <20220110072125.1886683-1-troy_lee@aspeedtech.com>
 <20220110072125.1886683-2-troy_lee@aspeedtech.com>
 <a8d6b7b7-7072-9407-3135-f2459bc915b2@kaod.org>
 <CAN9Jwz0qFQKe5HuTMwo-u=1vSh47gXJm9DU2wdOjgH8ZcbAsAw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAN9Jwz0qFQKe5HuTMwo-u=1vSh47gXJm9DU2wdOjgH8ZcbAsAw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 89d84ea3-cd7a-4013-95b0-ea4e14554cb7
X-Ovh-Tracer-Id: 4544132025855609708
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehvddguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefheegveekkefggefhjeduvdefudevtdeluedufeevuddtteffvdefuefgieeuhfenucffohhmrghinhepghiirdhithenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 hailin.wu@aspeedtech.com, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Troy,


>>> +
>>> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i3c_ops, s,
>>> +            TYPE_ASPEED_I3C, ASPEED_I3C_NR_REGS << 2);
>>> +
>>> +    sysbus_init_mmio(sbd, &s->iomem);
>>
>> I would add a container region containing all the regions :
>>
>>
>>       memory_region_init(&s->iomem_container, OBJECT(s),
>>                          TYPE_ASPEED_I3C ".container", 0x8000);
>>
>>       sysbus_init_mmio(sbd, &s->iomem_container);
>>
>>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i3c_ops, s,
>>               TYPE_ASPEED_I3C ".regs", 0x70);
>>
>>       memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
>>
>>
>>
>> The goal is to have a stricter layout so that you can catch errors :
>>
>>       000000001e7a0000-000000001e7a7fff (prio 0, i/o): aspeed.i3c.container
>>         000000001e7a0000-000000001e7a006f (prio 0, i/o): aspeed.i3c.regs
>>         000000001e7a2000-000000001e7a22ff (prio 0, i/o): aspeed.i3c.device.0
>>         000000001e7a3000-000000001e7a32ff (prio 0, i/o): aspeed.i3c.device.1
>>         000000001e7a4000-000000001e7a42ff (prio 0, i/o): aspeed.i3c.device.2
>>         000000001e7a5000-000000001e7a52ff (prio 0, i/o): aspeed.i3c.device.3
>>         000000001e7a6000-000000001e7a62ff (prio 0, i/o): aspeed.i3c.device.4
>>         000000001e7a7000-000000001e7a72ff (prio 0, i/o): aspeed.i3c.device.5
>>
>> and if under U-Boot, you peek into unimplemented regs, you get a warning :
>>
>>       ast# md 1e7a0000
>>       1e7a0000: 00000000 00000000 00000000 00000000    ................
>>       1e7a0010: 00000000 00000000 00000000 00000000    ................
>>       1e7a0020: 00000000 00000000 00000000 00000000    ................
>>       1e7a0030: 00000000 00000000 00000000 00000000    ................
>>       1e7a0040: 00000000 00000000 00000000 00000000    ................
>>       1e7a0050: 00000000 00000000 00000000 00000000    ................
>>       1e7a0060: 00000000 00000000 00000000 00000000    ................
>>       1e7a0070:aspeed_soc.io: unimplemented device read  (size 4, offset 0x1a0070)
>>        00000000aspeed_soc.io: unimplemented device read  (size 4, offset 0x1a0074)
> 
> Thanks for the code snippet, learnt and applied.
> Yes, it would be easier to catch driver problems.

That said, not all Aspeed models follow this pattern. We learned along
the way and we could improve some older implementations.

btw, I tried your series with ast2600-default-obmc.tar.gz. It boots fine.

Thanks,

C.

