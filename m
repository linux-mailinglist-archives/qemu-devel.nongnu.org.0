Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919C146B8AE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:18:58 +0100 (CET)
Received: from localhost ([::1]:38360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXYn-0001F1-FA
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:18:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1muXXS-0008Ux-MZ; Tue, 07 Dec 2021 05:17:34 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:51447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1muXXQ-00072R-3C; Tue, 07 Dec 2021 05:17:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 52630D04FDCF;
 Tue,  7 Dec 2021 11:17:29 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 11:17:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0029ced5c89-56d3-400b-80d5-d1bdca37f5cd,
 EDCC1E77E28A65BD51DFCD2B92BF934EEA10E5FB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4984d971-9255-b5bd-3989-02a30f55d50d@kaod.org>
Date: Tue, 7 Dec 2021 11:17:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 04/14] ppc/pnv: Introduce support for user created PHB3
 devices
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-5-clg@kaod.org>
 <72b4d947-2f6d-da3d-46f7-75e729643036@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <72b4d947-2f6d-da3d-46f7-75e729643036@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0fad2ff7-270b-40b9-9064-813a1d2e0538
X-Ovh-Tracer-Id: 3799067763752405923
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeehgdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 10:47, Frederic Barrat wrote:
> 
> 
> On 02/12/2021 15:42, Cédric Le Goater wrote:
>> PHB3 devices and PCI devices can now be added to the powernv8 machine
>> using :
>>
>>    -device pnv-phb3,chip-id=0,index=1 \
>>    -device nec-usb-xhci,bus=pci.1,addr=0x0
>>
>> The 'index' property identifies the PHB3 in the chip. In case of user
>> created devices, a lookup on 'chip-id' is required to assign the
>> owning chip.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index de277c457838..d7fe92cb082d 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1097,14 +1097,14 @@ static void pnv_chip_power8_instance_init(Object *obj)
>>       object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
>> -    for (i = 0; i < pcc->num_phbs; i++) {
>> +    if (defaults_enabled()) {
>> +        chip->num_phbs = pcc->num_phbs;
>> +    }
>> +
>> +    for (i = 0; i < chip->num_phbs; i++) {
>>           object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
>>       }
>> -    /*
>> -     * Number of PHBs is the chip default
>> -     */
>> -    chip->num_phbs = pcc->num_phbs;
>>   }
> 
> 
> So if "-nodefaults" is mentioned on the command line, then chip->num_phbs is not set. It seems the intention is to have only the PHBs defined on the CLI, which is fine. However, I don't see where chip->num_phbs is incremented in that case.

Good catch :) That's why we need another patch fixing all this because
it is breaking the XICS fabric handlers, ics_get and ics_resend.
'info pic' is impacted also.

Here is the proposed fix for v2 :

  https://github.com/legoater/qemu/commit/b47bce3109f316a65aa2fa2a46651b2960e93fca

I chose to loop on the children of the chip to find the user
created devices and leave the PnvChip model with empty defaults.


'info pic' is impacted the same on P9

   https://github.com/legoater/qemu/commit/d4733edca94c95f717f4ee35bbea6dc085365286

Thanks,

C.

