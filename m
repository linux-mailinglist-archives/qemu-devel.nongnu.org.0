Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031D48E971
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:50:32 +0100 (CET)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8L6G-0002I7-4c
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:50:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8Kv1-0001M6-2I
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:38:55 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:48575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8Kux-0000gA-Tt
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:38:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.68])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 752BFD7BD0B5;
 Fri, 14 Jan 2022 12:38:49 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 12:38:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002178a8852-b0dc-4656-86e6-999f6fdd62df,
 48AE69F32F38AAAF76E9DC5A3CEB3A821FE35450) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2b1196da-bbc9-3253-6d83-db73415241fc@kaod.org>
Date: Fri, 14 Jan 2022 12:38:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/17] ppc/pnv: introduce PnvPHB4 'phb_number' property
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220113192952.911188-1-danielhb413@gmail.com>
 <20220113192952.911188-12-danielhb413@gmail.com>
 <3416965f-203e-f902-a4cb-a5dcd4da6f83@kaod.org>
 <6501c291-38d3-3131-9b3d-7b4513cadee4@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <6501c291-38d3-3131-9b3d-7b4513cadee4@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b358fb4c-92ad-4a31-88be-0f548ed73107
X-Ovh-Tracer-Id: 6974105500483750880
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/22 12:29, Daniel Henrique Barboza wrote:
> 
> 
> On 1/14/22 07:46, Cédric Le Goater wrote:
>> On 1/13/22 20:29, Daniel Henrique Barboza wrote:
>>> One of the remaining dependencies we have on the PnvPhb4PecStack object
>>> is the stack->stack_no property. This is set as the position the stack
>>> occupies in the pec->stacks[] array.
>>>
>>> We need a way to report this same value in the PnvPHB4. This patch
>>> creates a new property called 'phb_number' to be used in existing code
>>> in all instances stack->stack_no is currently being used.
>>>
>>> The 'phb_number' name is an indication of our future intention to convert
>>> the pec->stacks[] array into a pec->phbs[] array, when the PEC object will
>>> deal directly with phb4 objects.
>>
>>
>> So the PHB would have a 'phb_number' and a 'index' property ? That's
>> confusing. Can we simplify ? compute one from another ?
>>
>> or keep 'stack_no' to make it clear this belongs to the stack subunit
>> logic.
> 
> 
> I guess for now we can keep it as phb->stack_no. We can think about reworking the
> logic (my initial reaction is to keep 'index' and then derive the 'stack_no' from
> it when needed) in a follow up.

ok. Patches 1-10 are fine. no need to resend.

Thanks,

C.

