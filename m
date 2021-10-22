Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD16437196
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 08:13:32 +0200 (CEST)
Received: from localhost ([::1]:49100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdno3-0003MI-Os
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 02:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mdnmX-0001jj-Kt; Fri, 22 Oct 2021 02:11:59 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:47771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mdnmR-0003ss-P8; Fri, 22 Oct 2021 02:11:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 43093C63803B;
 Fri, 22 Oct 2021 08:11:39 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 08:11:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002ee799bff-900b-4c40-9879-1a9c17108f09,
 972C48F4C85068776659E713CFF049F78FAA73AB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c898783c-50e1-df8d-2246-c16e85db6c0f@kaod.org>
Date: Fri, 22 Oct 2021 08:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/5] aspeed/smc: Improve support for the alternate boot
 function
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Peter Delevoryas <pdel@fb.com>
References: <20211018132609.160008-1-clg@kaod.org>
 <DDD67A99-FA65-4671-ACE6-5D3BACE3F45A@fb.com>
 <2c54310f-2800-33ac-7c47-500a24f88b8f@kaod.org>
In-Reply-To: <2c54310f-2800-33ac-7c47-500a24f88b8f@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9b8e23c4-81ea-42a7-b41f-8fdbaeb55e8f
X-Ovh-Tracer-Id: 6204552912246115177
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvjedguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeihfefffffgedtkeegtdekffevudeggfegffethfffhefhhfevhfdtudejhfdvieenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.867,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> And the FMC registers are just an alias to write
>> to these watchdog 2 registers? 
> 
> If this is the same watchdog mapped into the FMC, I would say yes
> and the logic generate load/stores transactions on the AHB bus.
> Adding an address space for the WDT registers in the model is the
> closer we can get without implementing the bus protocol.
> 
>> Just curious, is it
>> strictly necessary to use the FMC registers to disable
>> the alternate boot watchdog, or could you just use the
>> old address, 0x1e78504C? 
> 
> Hey, this is something to try on HW and check how both register
> sets evolve. Would you have time ?

Andrew did some experiments in the past and the two register sets
were evolving independently.

>> In our OpenBMC initialization
>> for Fuji, we’re using the FMC registers, but would
>> it still work if we used the old addresses? Just curious,
>> the more I think about it, it seems odd to me that these
>> FMC watchdog registers exist if they’re just an alias.
> 
> We should ask the HW designers.

Aspeed tells me its an independent logic. So, I will drop the
model from this patchset.

Thanks,

C.


