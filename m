Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CE9483FA6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 11:09:53 +0100 (CET)
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4glM-0005t2-6G
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 05:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4gjY-0004GD-Go
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 05:08:00 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:51181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4gjW-00037L-GH
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 05:08:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0F85120425;
 Tue,  4 Jan 2022 10:07:55 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 4 Jan
 2022 11:07:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001681bb1e6-d609-404e-a577-b430e81b642a,
 8E52E0D80BCA28EB10B868BCDB857CC95652C900) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b741ff1b-a2b6-e43c-5cd9-fccd448a4fb2@kaod.org>
Date: Tue, 4 Jan 2022 11:07:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 19/19] ppc/pnv: Move num_phbs under Pnv8Chip
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211213132830.108372-1-clg@kaod.org>
 <20211213132830.108372-20-clg@kaod.org>
 <0ede7097-61ce-a0b2-68c8-786644bde795@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <0ede7097-61ce-a0b2-68c8-786644bde795@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 974d8bd9-c0c2-4201-8998-07a7c17a5ef9
X-Ovh-Tracer-Id: 2051952581694426019
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 10:53, Daniel Henrique Barboza wrote:
> 
> 
> On 12/13/21 10:28, Cédric Le Goater wrote:
>> It is not used elsewhere so that's where it belongs.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> I am/was using this patch and didn't provide my r-b on it:
> 
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Yes. Just resend with your next series.

Thanks,

C.


> 
>>   include/hw/ppc/pnv.h | 4 ++--
>>   hw/ppc/pnv.c         | 7 +++----
>>   2 files changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
>> index ca27bd39f0ac..251c9854329d 100644
>> --- a/include/hw/ppc/pnv.h
>> +++ b/include/hw/ppc/pnv.h
>> @@ -52,7 +52,6 @@ struct PnvChip {
>>       uint64_t     cores_mask;
>>       PnvCore      **cores;
>> -    uint32_t     num_phbs;
>>       uint32_t     num_pecs;
>>       MemoryRegion xscom_mmio;
>> @@ -82,6 +81,7 @@ struct Pnv8Chip {
>>   #define PNV8_CHIP_PHB3_MAX 4
>>       PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
>> +    uint32_t     num_phbs;
>>       XICSFabric    *xics;
>>   };
>> @@ -136,8 +136,8 @@ struct PnvChipClass {
>>       /*< public >*/
>>       uint64_t     chip_cfam_id;
>>       uint64_t     cores_mask;
>> -    uint32_t     num_phbs;
>>       uint32_t     num_pecs;
>> +    uint32_t     num_phbs;
>>       DeviceRealize parent_realize;
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 2b027e299d27..8a3732c982e5 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1099,7 +1099,6 @@ static void pnv_chip_power10_intc_print_info(PnvChip *chip, PowerPCCPU *cpu,
>>   static void pnv_chip_power8_instance_init(Object *obj)
>>   {
>> -    PnvChip *chip = PNV_CHIP(obj);
>>       Pnv8Chip *chip8 = PNV8_CHIP(obj);
>>       PnvChipClass *pcc = PNV_CHIP_GET_CLASS(obj);
>>       int i;
>> @@ -1118,10 +1117,10 @@ static void pnv_chip_power8_instance_init(Object *obj)
>>       object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
>>       if (defaults_enabled()) {
>> -        chip->num_phbs = pcc->num_phbs;
>> +        chip8->num_phbs = pcc->num_phbs;
>>       }
>> -    for (i = 0; i < chip->num_phbs; i++) {
>> +    for (i = 0; i < chip8->num_phbs; i++) {
>>           object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
>>       }
>> @@ -1239,7 +1238,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>>                                   &chip8->homer.regs);
>>       /* PHB3 controllers */
>> -    for (i = 0; i < chip->num_phbs; i++) {
>> +    for (i = 0; i < chip8->num_phbs; i++) {
>>           PnvPHB3 *phb = &chip8->phbs[i];
>>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);


