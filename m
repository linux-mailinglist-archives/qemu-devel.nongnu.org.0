Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C83A6FEF02
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:38:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2jU-0002Nf-Ts; Thu, 11 May 2023 05:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1px2jT-0002NA-8y
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:37:07 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1px2jR-0002yn-7v
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:37:07 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 60E19227CF;
 Thu, 11 May 2023 09:37:00 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 11 May
 2023 11:36:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0046aed04de-8909-4e5a-9e28-a38d0650c780,
 144821B34C2936864118ABACE4D2D33E1039104D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <79077066-d12a-6584-5b73-9abadb51e98b@kaod.org>
Date: Thu, 11 May 2023 11:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] pnv_lpc: disable reentrancy detection for lpc-hc
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>
CC: <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, "open
 list:PowerNV Non-Virtu..." <qemu-ppc@nongnu.org>
References: <20230511085337.3688527-1-alxndr@bu.edu>
 <3102db7a-bbaa-f394-b739-23950fe81be0@kaod.org>
 <20230511091509.nypeyd5fhzxlvo47@mozz.bu.edu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230511091509.nypeyd5fhzxlvo47@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: fbbc1c77-4d26-4cd9-ae0a-ea0b306f4f98
X-Ovh-Tracer-Id: 13203428208344730592
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegkedgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddutddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlgihnughrsegsuhdrvgguuhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.251,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/11/23 11:15, Alexander Bulekov wrote:
> On 230511 1104, Cédric Le Goater wrote:
>> Hello Alexander
>>
>> On 5/11/23 10:53, Alexander Bulekov wrote:
>>> As lpc-hc is designed for re-entrant calls from xscom, mark it
>>> re-entrancy safe.
>>>
>>> Reported-by: Thomas Huth <thuth@redhat.com>
>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>> ---
>>>    hw/ppc/pnv_lpc.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
>>> index 01f44c19eb..67fd049a7f 100644
>>> --- a/hw/ppc/pnv_lpc.c
>>> +++ b/hw/ppc/pnv_lpc.c
>>> @@ -738,6 +738,8 @@ static void pnv_lpc_realize(DeviceState *dev, Error **errp)
>>>                                    &lpc->opb_master_regs);
>>>        memory_region_init_io(&lpc->lpc_hc_regs, OBJECT(dev), &lpc_hc_ops, lpc,
>>>                              "lpc-hc", LPC_HC_REGS_OPB_SIZE);
>>> +    /* xscom writes to lpc-hc. As such mark lpc-hc re-entrancy safe */
>>> +    lpc->lpc_hc_regs.disable_reentrancy_guard = true;
>>>        memory_region_add_subregion(&lpc->opb_mr, LPC_HC_REGS_OPB_ADDR,
>>>                                    &lpc->lpc_hc_regs);
>>
>> The warning changed :
>>
>>    qemu-system-ppc64: warning: Blocked re-entrant IO on MemoryRegion: lpc-opb-master at addr: 0x8
>>
>> I will take a look unless you know exactly what to do.
>>
> 
> That does not show up for me with "./qemu-system-ppc64 -M powernv8"
> Do I need to boot a kernel to see the message?

There are other processors:

powernv10            IBM PowerNV (Non-Virtualized) POWER10
powernv8             IBM PowerNV (Non-Virtualized) POWER8
powernv              IBM PowerNV (Non-Virtualized) POWER9 (alias of powernv9)
powernv9             IBM PowerNV (Non-Virtualized) POWER9

Region lpc->opb_master_regs needs to be tagged also for powernv9 and
powernv10.

Thanks,

C.

> I was worried that there might be other re-entrant IO in this device.
> Maybe there should be a way to just mark the whole device re-entrancy
> safe.



