Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25C846B96E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:48:03 +0100 (CET)
Received: from localhost ([::1]:50682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muY0w-0004oq-Af
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:48:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXz3-0003IF-Mx
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:46:05 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:56629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muXyz-0006wJ-MI
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:46:05 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.238])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B2FA32044B;
 Tue,  7 Dec 2021 10:45:51 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 11:45:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001ff39935e-d900-4446-9447-36fdf20faf32,
 D5B34436B48CBBE29FDE786D5871FA4E32D79878) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fe4c3744-91b1-bd5b-2a04-e2782c46fc09@kaod.org>
Date: Tue, 7 Dec 2021 11:45:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 07/14] ppc/pnv: Introduce a num_pecs class attribute for
 PHB4 PEC devices
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-8-clg@kaod.org>
 <453c5cc3-5ac5-c6ff-fa7f-5ccb8492e314@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <453c5cc3-5ac5-c6ff-fa7f-5ccb8492e314@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a3295c16-12e7-4435-9da6-80be8fca389b
X-Ovh-Tracer-Id: 4278138172691352483
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeehgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 11:00, Frederic Barrat wrote:
> 
> 
> On 02/12/2021 15:42, Cédric Le Goater wrote:
>> POWER9 processor comes with 3 PHB4 PECs (PCI Express Controller) and
>> each PEC can have several PHBs :
>>
>>    * PEC0 provides 1 PHB  (PHB0)
>>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
>>
>> A num_pecs class attribute represents better the logic units of the
>> POWER9 chip. Use that instead of num_phbs which fits POWER8 chips.
>> This will ease adding support for user created devices.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> With this patch, chip->num_phbs is only defined and used on P8. We may want to add a comment to make it clear.

Yes.

With the latest changes, I think we can now move num_phbs under PnvChip8
and num_pecs under PnvChip9 since they are only used in these routines :

P8:
     static void pnv_chip_power8_instance_init(Object *obj)
             chip->num_phbs = pcc->num_phbs;
         for (i = 0; i < chip->num_phbs; i++) {

     static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
         for (i = 0; i < chip->num_phbs; i++) {
     
P9:
     static void pnv_chip_power9_instance_init(Object *obj)
             chip->num_pecs = pcc->num_pecs;
         for (i = 0; i < chip->num_pecs; i++) {
	
     static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
         for (i = 0; i < chip->num_pecs; i++) {
     

> As I review this series, something is bugging me though: the difference of handling between P8 and P9.
> On P9, we seem to have a more logical hiearachy:
> phb <- PCI controller (PEC) <- chip

Yes. It's cleaner than P8 in terms of logic. P8 initial support was
done hastily for skiboot bringup in 2014.

> With P8, we don't have an explicit PEC, but we have a PBCQ object, which is somewhat similar. The hierarchy seems also more convoluted.

But we don't have stacks on P8. Do we ?

> I don't see why it's treated differently. It seems both chips could be treated the same, which would make the code easier to follow.

I agree. Daniel certainly would also :)

> That's outside of the scope of this series though. 

Well, this patchset enables libvirt support for the PowerNV machines.
Once this is pushed, we need to keep the API, the object model names
being part of it.

7.0 is a good time for a change, really. After that, we won't be able
to change the QOM hierarchy that much.

> So maybe for a future patch? Who knows, I might volunteer...

You would introduce a phb3-pec on top of the phb3s ?

Let me send a v2 first and may be we could rework the object hierarchy
in the 7.0 time frame. We don't have to merge this ASAP.

Thanks,

C.

