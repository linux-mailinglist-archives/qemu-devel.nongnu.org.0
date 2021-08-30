Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411623FB1B7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:14:00 +0200 (CEST)
Received: from localhost ([::1]:42122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbUU-0005As-BU
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mKbSS-0002ae-S3
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:11:52 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:52693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mKbSQ-0003A0-F6
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:11:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2955B200A9;
 Mon, 30 Aug 2021 07:11:48 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 30 Aug
 2021 09:11:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002371a789e-efc5-46d0-a7f9-fd1ad89b170f,
 A410DCCBFF6448DFF799E1C977766415213BDB3F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Subject: Re: [PATCH 04/26] ppc/pnv: Use a simple incrementing index for the
 chip-id
To: Greg Kurz <groug@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-5-clg@kaod.org> <20210820155151.05797a87@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9109b266-9084-30b1-a5ea-ec2c25155a0e@kaod.org>
Date: Mon, 30 Aug 2021 09:11:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820155151.05797a87@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7a9bb691-d50c-40e3-af20-acd3eb4aef84
X-Ovh-Tracer-Id: 9562267909735943136
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddukedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.58,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 3:51 PM, Greg Kurz wrote:
> On Mon, 9 Aug 2021 15:45:25 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> When the QEMU PowerNV machine was introduced, multi chip support
>> modeled a two socket system with dual chip modules as found on some P8
>> Tuleta systems (8286-42A). But this is hardly used and not relevant
>> for QEMU. Use a simple index instead.
>>
> 
> Makes sense.
> 
>> With this change, we can now increase the max socket number to 16 as
>> found on high end systems.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  include/hw/ppc/pnv.h | 33 +++++++--------------------------
>>  hw/ppc/pnv.c         | 11 ++++++-----
>>  2 files changed, 13 insertions(+), 31 deletions(-)
>>
>> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
>> index 3fec7c87d82d..aa08d79d24de 100644
>> --- a/include/hw/ppc/pnv.h
>> +++ b/include/hw/ppc/pnv.h
>> @@ -174,25 +174,6 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER9,
>>  DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>>                           TYPE_PNV_CHIP_POWER10)
>>  
>> -/*
>> - * This generates a HW chip id depending on an index, as found on a
>> - * two socket system with dual chip modules :
>> - *
>> - *    0x0, 0x1, 0x10, 0x11
>> - *
>> - * 4 chips should be the maximum
>> - *
>> - * TODO: use a machine property to define the chip ids
>> - */
>> -#define PNV_CHIP_HWID(i) ((((i) & 0x3e) << 3) | ((i) & 0x1))
>> -
>> -/*
>> - * Converts back a HW chip id to an index. This is useful to calculate
>> - * the MMIO addresses of some controllers which depend on the chip id.
>> - */
>> -#define PNV_CHIP_INDEX(chip)                                    \
>> -    (((chip)->chip_id >> 2) * 2 + ((chip)->chip_id & 0x3))
>> -
>>  PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
>>  
>>  #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
>> @@ -256,11 +237,11 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
>>  #define PNV_OCC_COMMON_AREA_SIZE    0x0000000000800000ull
>>  #define PNV_OCC_COMMON_AREA_BASE    0x7fff800000ull
>>  #define PNV_OCC_SENSOR_BASE(chip)   (PNV_OCC_COMMON_AREA_BASE + \
>> -    PNV_OCC_SENSOR_DATA_BLOCK_BASE(PNV_CHIP_INDEX(chip)))
>> +    PNV_OCC_SENSOR_DATA_BLOCK_BASE((chip)->chip_id))
>>  
>>  #define PNV_HOMER_SIZE              0x0000000000400000ull
>>  #define PNV_HOMER_BASE(chip)                                            \
>> -    (0x7ffd800000ull + ((uint64_t)PNV_CHIP_INDEX(chip)) * PNV_HOMER_SIZE)
>> +    (0x7ffd800000ull + ((uint64_t)(chip)->chip_id) * PNV_HOMER_SIZE)
>>  
>>  
>>  /*
>> @@ -279,16 +260,16 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
>>   */
>>  #define PNV_ICP_SIZE         0x0000000000100000ull
>>  #define PNV_ICP_BASE(chip)                                              \
>> -    (0x0003ffff80000000ull + (uint64_t) PNV_CHIP_INDEX(chip) * PNV_ICP_SIZE)
>> +    (0x0003ffff80000000ull + (uint64_t) (chip)->chip_id * PNV_ICP_SIZE)
>>  
>>  
>>  #define PNV_PSIHB_SIZE       0x0000000000100000ull
>>  #define PNV_PSIHB_BASE(chip) \
>> -    (0x0003fffe80000000ull + (uint64_t)PNV_CHIP_INDEX(chip) * PNV_PSIHB_SIZE)
>> +    (0x0003fffe80000000ull + (uint64_t)(chip)->chip_id * PNV_PSIHB_SIZE)
>>  
>>  #define PNV_PSIHB_FSP_SIZE   0x0000000100000000ull
>>  #define PNV_PSIHB_FSP_BASE(chip) \
>> -    (0x0003ffe000000000ull + (uint64_t)PNV_CHIP_INDEX(chip) * \
>> +    (0x0003ffe000000000ull + (uint64_t)(chip)->chip_id * \
>>       PNV_PSIHB_FSP_SIZE)
>>  
>>  /*
>> @@ -324,11 +305,11 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
>>  #define PNV9_OCC_COMMON_AREA_SIZE    0x0000000000800000ull
>>  #define PNV9_OCC_COMMON_AREA_BASE    0x203fff800000ull
>>  #define PNV9_OCC_SENSOR_BASE(chip)   (PNV9_OCC_COMMON_AREA_BASE +       \
>> -    PNV_OCC_SENSOR_DATA_BLOCK_BASE(PNV_CHIP_INDEX(chip)))
>> +    PNV_OCC_SENSOR_DATA_BLOCK_BASE((chip)->chip_id))
>>  
>>  #define PNV9_HOMER_SIZE              0x0000000000400000ull
>>  #define PNV9_HOMER_BASE(chip)                                           \
>> -    (0x203ffd800000ull + ((uint64_t)PNV_CHIP_INDEX(chip)) * PNV9_HOMER_SIZE)
>> +    (0x203ffd800000ull + ((uint64_t)(chip)->chip_id) * PNV9_HOMER_SIZE)
>>  
>>  /*
>>   * POWER10 MMIO base addresses - 16TB stride per chip
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index b122251d1a5d..025f01c55744 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -809,9 +809,10 @@ static void pnv_init(MachineState *machine)
>>       * TODO: should we decide on how many chips we can create based
>>       * on #cores and Venice vs. Murano vs. Naples chip type etc...,
>>       */
>> -    if (!is_power_of_2(pnv->num_chips) || pnv->num_chips > 4) {
>> +    if (!is_power_of_2(pnv->num_chips) || pnv->num_chips > 16) {
>>          error_report("invalid number of chips: '%d'", pnv->num_chips);
>> -        error_printf("Try '-smp sockets=N'. Valid values are : 1, 2 or 4.\n");
>> +        error_printf(
>> +            "Try '-smp sockets=N'. Valid values are : 1, 2, 4, 8 and 16.\n");
>>          exit(1);
>>      }
>>  
>> @@ -819,6 +820,7 @@ static void pnv_init(MachineState *machine)
>>      for (i = 0; i < pnv->num_chips; i++) {
>>          char chip_name[32];
>>          Object *chip = OBJECT(qdev_new(chip_typename));
>> +        int chip_id = i;
>>  
>>          pnv->chips[i] = PNV_CHIP(chip);
>>  
>> @@ -831,10 +833,9 @@ static void pnv_init(MachineState *machine)
>>                                      &error_fatal);
>>          }
>>  
>> -        snprintf(chip_name, sizeof(chip_name), "chip[%d]", PNV_CHIP_HWID(i));
>> +        snprintf(chip_name, sizeof(chip_name), "chip[%d]", chip_id);
> 
> I'd rather pass directly the i variable. It is clear enough this is
> the index of the chip in pnv->chips[]. No need for an intermediate
> variable IMHO.

Yes. I will address that in a follow-up series.

Thanks,

C.  

> Anyway,
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
>>          object_property_add_child(OBJECT(pnv), chip_name, chip);
>> -        object_property_set_int(chip, "chip-id", PNV_CHIP_HWID(i),
>> -                                &error_fatal);
>> +        object_property_set_int(chip, "chip-id", chip_id, &error_fatal);
>>          object_property_set_int(chip, "nr-cores", machine->smp.cores,
>>                                  &error_fatal);
>>          object_property_set_int(chip, "nr-threads", machine->smp.threads,
> 


