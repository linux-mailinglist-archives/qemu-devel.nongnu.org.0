Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F7B58974C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 07:18:16 +0200 (CEST)
Received: from localhost ([::1]:59234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJTFP-0002e1-Cf
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 01:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oJTBn-0000w1-OO; Thu, 04 Aug 2022 01:14:31 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:34983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oJTBl-0000hG-3e; Thu, 04 Aug 2022 01:14:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.210])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 274E9204DD;
 Thu,  4 Aug 2022 05:14:25 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 4 Aug 2022
 07:14:24 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005d326e796-fa91-4dce-bfba-eb25f2a1e574,
 E459FF07681E7C706565AD81A8193C11BE0AA2AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
Date: Thu, 4 Aug 2022 07:14:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>
CC: <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7bc533c5-e178-4a71-9f0e-e65f3614754d
X-Ovh-Tracer-Id: 6174716567139486688
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvkedgleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/4/22 01:36, Daniel Henrique Barboza wrote:
> Cedric,
> 
> On 8/3/22 10:28, Cédric Le Goater wrote:
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/ppc/ppc405.h    | 16 +++++++++++
>>   hw/ppc/ppc405_uc.c | 71 +++++++++++++++++++++++++++++++---------------
>>   2 files changed, 64 insertions(+), 23 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index 1da34a7f10f3..1c7fe07b8084 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -65,7 +65,22 @@ struct ppc4xx_bd_info_t {
>>   typedef struct Ppc405SoCState Ppc405SoCState;
>> +/* Peripheral controller */
>> +#define TYPE_PPC405_EBC "ppc405-ebc"
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
>> +struct Ppc405EbcState {
>> +    DeviceState parent_obj;
>> +
>> +    PowerPCCPU *cpu;
>> +    uint32_t addr;
>> +    uint32_t bcr[8];
>> +    uint32_t bap[8];
>> +    uint32_t bear;
>> +    uint32_t besr0;
>> +    uint32_t besr1;
>> +    uint32_t cfg;
>> +};
>>   /* DMA controller */
>>   #define TYPE_PPC405_DMA "ppc405-dma"
>> @@ -203,6 +218,7 @@ struct Ppc405SoCState {
>>       Ppc405OcmState ocm;
>>       Ppc405GpioState gpio;
>>       Ppc405DmaState dma;
>> +    Ppc405EbcState ebc;
>>   };
>>   /* PowerPC 405 core */
>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index 6bd93c1cb90c..0166f3fc36da 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -393,17 +393,6 @@ static void ppc4xx_opba_init(hwaddr base)
>>   /*****************************************************************************/
>>   /* Peripheral controller */
>> -typedef struct ppc4xx_ebc_t ppc4xx_ebc_t;
>> -struct ppc4xx_ebc_t {
>> -    uint32_t addr;
>> -    uint32_t bcr[8];
>> -    uint32_t bap[8];
>> -    uint32_t bear;
>> -    uint32_t besr0;
>> -    uint32_t besr1;
>> -    uint32_t cfg;
>> -};
>> -
>>   enum {
>>       EBC0_CFGADDR = 0x012,
>>       EBC0_CFGDATA = 0x013,
>> @@ -411,10 +400,9 @@ enum {
>>   static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>>   {
>> -    ppc4xx_ebc_t *ebc;
>> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>>       uint32_t ret;
>> -    ebc = opaque;
>>       switch (dcrn) {
>>       case EBC0_CFGADDR:
>>           ret = ebc->addr;
>> @@ -496,9 +484,8 @@ static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>>   static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
>>   {
>> -    ppc4xx_ebc_t *ebc;
>> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>> -    ebc = opaque;
>>       switch (dcrn) {
>>       case EBC0_CFGADDR:
>>           ebc->addr = val;
>> @@ -554,12 +541,11 @@ static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
>>       }
>>   }
>> -static void ebc_reset (void *opaque)
>> +static void ppc405_ebc_reset(DeviceState *dev)
>>   {
>> -    ppc4xx_ebc_t *ebc;
>> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
>>       int i;
>> -    ebc = opaque;
>>       ebc->addr = 0x00000000;
>>       ebc->bap[0] = 0x7F8FFE80;
>>       ebc->bcr[0] = 0xFFE28000;
>> @@ -572,18 +558,46 @@ static void ebc_reset (void *opaque)
>>       ebc->cfg = 0x80400000;
>>   }
>> -void ppc405_ebc_init(CPUPPCState *env)
>> +static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
>>   {
>> -    ppc4xx_ebc_t *ebc;
>> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
>> +    CPUPPCState *env;
>> +
>> +    assert(ebc->cpu);
>> +
>> +    env = &ebc->cpu->env;
>> -    ebc = g_new0(ppc4xx_ebc_t, 1);
>> -    qemu_register_reset(&ebc_reset, ebc);
>>       ppc_dcr_register(env, EBC0_CFGADDR,
>>                        ebc, &dcr_read_ebc, &dcr_write_ebc);
>>       ppc_dcr_register(env, EBC0_CFGDATA,
>>                        ebc, &dcr_read_ebc, &dcr_write_ebc);
>>   }
>> +static Property ppc405_ebc_properties[] = {
>> +    DEFINE_PROP_LINK("cpu", Ppc405EbcState, cpu, TYPE_POWERPC_CPU,
>> +                     PowerPCCPU *),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    dc->realize = ppc405_ebc_realize;
>> +    dc->user_creatable = false;
>> +    dc->reset = ppc405_ebc_reset;
>> +    device_class_set_props(dc, ppc405_ebc_properties);
>> +}
>> +
>> +void ppc405_ebc_init(CPUPPCState *env)
>> +{
>> +    PowerPCCPU *cpu = env_archcpu(env);
>> +    DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
>> +
>> +    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
> 
> This line is breaking the boot of sam460ex:
> 
> 
>   ./qemu-system-ppc64 -display none -M sam460ex
> Unexpected error in object_property_find_err() at ../qom/object.c:1304:
> qemu-system-ppc64: Property '460exb-powerpc64-cpu.cpu' not found
> Aborted (core dumped)
> 
> 
> I think you meant to link the cpu prop of the EBC obj to the CPU object,
> not the cpu prop of the CPU obj to the EBC dev.

Yes. ppc405_ebc_init() has only one user left, the sam460ex, which I didn't
test :/

Thanks,

C.
  
> 
> This fixes the issue:
> 
> 
> $ git diff
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 0166f3fc36..aac3a3f761 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -594,7 +594,7 @@ void ppc405_ebc_init(CPUPPCState *env)
>       PowerPCCPU *cpu = env_archcpu(env);
>       DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
> 
> -    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
> +    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
>       qdev_realize_and_unref(dev, NULL, &error_fatal);
>   }
>
> 
> Daniel
> 
> 
>> +    qdev_realize_and_unref(dev, NULL, &error_fatal);
>> +}
>> +
>>   /*****************************************************************************/
>>   /* DMA controller */
>>   enum {
>> @@ -1418,6 +1432,8 @@ static void ppc405_soc_instance_init(Object *obj)
>>       object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
>>       object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
>> +
>> +    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
>>   }
>>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>> @@ -1490,7 +1506,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>                         s->ram_bases, s->ram_sizes, s->do_dram_init);
>>       /* External bus controller */
>> -    ppc405_ebc_init(env);
>> +    object_property_set_link(OBJECT(&s->ebc), "cpu", OBJECT(&s->cpu),
>> +                             &error_abort);
>> +    if (!qdev_realize(DEVICE(&s->ebc), NULL, errp)) {
>> +        return;
>> +    }
>>       /* DMA controller */
>>       object_property_set_link(OBJECT(&s->dma), "cpu", OBJECT(&s->cpu),
>> @@ -1576,6 +1596,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>>   static const TypeInfo ppc405_types[] = {
>>       {
>> +        .name           = TYPE_PPC405_EBC,
>> +        .parent         = TYPE_DEVICE,
>> +        .instance_size  = sizeof(Ppc405EbcState),
>> +        .class_init     = ppc405_ebc_class_init,
>> +    }, {
>>           .name           = TYPE_PPC405_DMA,
>>           .parent         = TYPE_SYS_BUS_DEVICE,
>>           .instance_size  = sizeof(Ppc405DmaState),


