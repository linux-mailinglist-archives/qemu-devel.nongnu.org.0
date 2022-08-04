Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3895589F58
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 18:24:26 +0200 (CEST)
Received: from localhost ([::1]:50528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJde5-0002jh-L6
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 12:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJdbU-0006if-5c
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:21:55 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:41153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJdbP-0007k6-Gj
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:21:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.131])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E770A11CB1804;
 Thu,  4 Aug 2022 18:21:35 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 4 Aug 2022
 18:21:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0062ebe32a3-3322-4beb-b5c3-9cea13468be9,
 E459FF07681E7C706565AD81A8193C11BE0AA2AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bd8fd9c7-ae3c-5db9-6112-b95bb8a915c3@kaod.org>
Date: Thu, 4 Aug 2022 18:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
 <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
 <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
Content-Language: en-US
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, QEMU Developers
 <qemu-devel@nongnu.org>, "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>
In-Reply-To: <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b18b920a-a5b1-47fa-bc23-5897d8de96f8
X-Ovh-Tracer-Id: 17442159883843111904
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvledguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvfhevjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgfeuvedugeefhfegjedufeetjeejgeejvefhhfejteefgeevvefhtddvvedtudehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

[ Resending to all ]

On 8/4/22 14:09, BALATON Zoltan wrote:
> On Thu, 4 Aug 2022, Cédric Le Goater wrote:
>> On 8/4/22 01:36, Daniel Henrique Barboza wrote:
>>> Cedric,
>>>
>>> On 8/3/22 10:28, Cédric Le Goater wrote:
>>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>   hw/ppc/ppc405.h    | 16 +++++++++++
>>>>   hw/ppc/ppc405_uc.c | 71 +++++++++++++++++++++++++++++++---------------
>>>>   2 files changed, 64 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>>>> index 1da34a7f10f3..1c7fe07b8084 100644
>>>> --- a/hw/ppc/ppc405.h
>>>> +++ b/hw/ppc/ppc405.h
>>>> @@ -65,7 +65,22 @@ struct ppc4xx_bd_info_t {
>>>>   typedef struct Ppc405SoCState Ppc405SoCState;
>>>> +/* Peripheral controller */
>>>> +#define TYPE_PPC405_EBC "ppc405-ebc"
>>>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
>>>> +struct Ppc405EbcState {
>>>> +    DeviceState parent_obj;
>>>> +
>>>> +    PowerPCCPU *cpu;
>>>> +    uint32_t addr;
>>>> +    uint32_t bcr[8];
>>>> +    uint32_t bap[8];
>>>> +    uint32_t bear;
>>>> +    uint32_t besr0;
>>>> +    uint32_t besr1;
>>>> +    uint32_t cfg;
>>>> +};
>>>>   /* DMA controller */
>>>>   #define TYPE_PPC405_DMA "ppc405-dma"
>>>> @@ -203,6 +218,7 @@ struct Ppc405SoCState {
>>>>       Ppc405OcmState ocm;
>>>>       Ppc405GpioState gpio;
>>>>       Ppc405DmaState dma;
>>>> +    Ppc405EbcState ebc;
>>>>   };
>>>>   /* PowerPC 405 core */
>>>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>>>> index 6bd93c1cb90c..0166f3fc36da 100644
>>>> --- a/hw/ppc/ppc405_uc.c
>>>> +++ b/hw/ppc/ppc405_uc.c
>>>> @@ -393,17 +393,6 @@ static void ppc4xx_opba_init(hwaddr base)
>>>> /*****************************************************************************/
>>>>   /* Peripheral controller */
>>>> -typedef struct ppc4xx_ebc_t ppc4xx_ebc_t;
>>>> -struct ppc4xx_ebc_t {
>>>> -    uint32_t addr;
>>>> -    uint32_t bcr[8];
>>>> -    uint32_t bap[8];
>>>> -    uint32_t bear;
>>>> -    uint32_t besr0;
>>>> -    uint32_t besr1;
>>>> -    uint32_t cfg;
>>>> -};
>>>> -
>>>>   enum {
>>>>       EBC0_CFGADDR = 0x012,
>>>>       EBC0_CFGDATA = 0x013,
>>>> @@ -411,10 +400,9 @@ enum {
>>>>   static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>>>>   {
>>>> -    ppc4xx_ebc_t *ebc;
>>>> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>>>>       uint32_t ret;
>>>> -    ebc = opaque;
>>>>       switch (dcrn) {
>>>>       case EBC0_CFGADDR:
>>>>           ret = ebc->addr;
>>>> @@ -496,9 +484,8 @@ static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>>>>   static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
>>>>   {
>>>> -    ppc4xx_ebc_t *ebc;
>>>> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>>>> -    ebc = opaque;
>>>>       switch (dcrn) {
>>>>       case EBC0_CFGADDR:
>>>>           ebc->addr = val;
>>>> @@ -554,12 +541,11 @@ static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
>>>>       }
>>>>   }
>>>> -static void ebc_reset (void *opaque)
>>>> +static void ppc405_ebc_reset(DeviceState *dev)
>>>>   {
>>>> -    ppc4xx_ebc_t *ebc;
>>>> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
>>>>       int i;
>>>> -    ebc = opaque;
>>>>       ebc->addr = 0x00000000;
>>>>       ebc->bap[0] = 0x7F8FFE80;
>>>>       ebc->bcr[0] = 0xFFE28000;
>>>> @@ -572,18 +558,46 @@ static void ebc_reset (void *opaque)
>>>>       ebc->cfg = 0x80400000;
>>>>   }
>>>> -void ppc405_ebc_init(CPUPPCState *env)
>>>> +static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
>>>>   {
>>>> -    ppc4xx_ebc_t *ebc;
>>>> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
>>>> +    CPUPPCState *env;
>>>> +
>>>> +    assert(ebc->cpu);
>>>> +
>>>> +    env = &ebc->cpu->env;
>>>> -    ebc = g_new0(ppc4xx_ebc_t, 1);
>>>> -    qemu_register_reset(&ebc_reset, ebc);
>>>>       ppc_dcr_register(env, EBC0_CFGADDR,
>>>>                        ebc, &dcr_read_ebc, &dcr_write_ebc);
>>>>       ppc_dcr_register(env, EBC0_CFGDATA,
>>>>                        ebc, &dcr_read_ebc, &dcr_write_ebc);
>>>>   }
>>>> +static Property ppc405_ebc_properties[] = {
>>>> +    DEFINE_PROP_LINK("cpu", Ppc405EbcState, cpu, TYPE_POWERPC_CPU,
>>>> +                     PowerPCCPU *),
>>>> +    DEFINE_PROP_END_OF_LIST(),
>>>> +};
>>>> +
>>>> +static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
>>>> +{
>>>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>>>> +
>>>> +    dc->realize = ppc405_ebc_realize;
>>>> +    dc->user_creatable = false;
>>>> +    dc->reset = ppc405_ebc_reset;
>>>> +    device_class_set_props(dc, ppc405_ebc_properties);
>>>> +}
>>>> +
>>>> +void ppc405_ebc_init(CPUPPCState *env)
>>>> +{
>>>> +    PowerPCCPU *cpu = env_archcpu(env);
>>>> +    DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
>>>> +
>>>> +    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
>>>
>>> This line is breaking the boot of sam460ex:
>>>
>>>
>>>   ./qemu-system-ppc64 -display none -M sam460ex
>>> Unexpected error in object_property_find_err() at ../qom/object.c:1304:
>>> qemu-system-ppc64: Property '460exb-powerpc64-cpu.cpu' not found
>>> Aborted (core dumped)
>>>
>>>
>>> I think you meant to link the cpu prop of the EBC obj to the CPU object,
>>> not the cpu prop of the CPU obj to the EBC dev.
>>
>> Yes. ppc405_ebc_init() has only one user left, the sam460ex, which I didn't
>> test :/
> 
> This patch changes ppc405_ebc_init to a realize method so shouldn't the sam460ex be changed to create the new object instead of calling ppc405_ebc_init too instead? 

Sure.

First step was to make sure nothing was broken. I can add some extra
patches in v3 to convert ppc405_ebc_init(), ppc4xx_plb_init() and
ppc4xx_mal_init() in the ppc4x machines. I don't think that would be
too much work. It's a good opportunity to modernize a bit the ppc4xx
machines also.

> Is the only reason the keep ppc405_ebc_init to add the cpu link? 

Yes. That's all there is to it really: convert the routines
parameters in object properties.

> As I noted before it would be nice to get rid of this link somehow, 
> it would allow dropping this init func and a bunch of property 
> descriptors where this cpu link is the only object. 

We should introduce a DCR namespace instead and use DCR memory regions
but that's much more work.
  
> It should be possble to get from a QOM object to its parent and the 
> cpu from there but I could not find out how. Maybe somehow with 
> object_resolve_path() or object_resolve_path_type() but I don't know 
> QOM enough and did not find anything in docs.
>
> Does somebody know how to do that? 

One way, would be to introduce a base class DCRDeviceState with a "cpu"
link and a class handler to install the DCR read/write ops. But I think
it's not worth the time and effort. Adding DCR namespace and DCR memory
regions would be better.

Thanks,

C.



> Or maybe the paths are always the same so it could resolve an absolute path. Don't know how it looks buth something like /machine/soc/cpu or similar to get to the cpu to get the env. This could work as long as we assume we only have one cpu but these SoC all have. Then no cpu link is needed and 
> could get rid of a lot of boilerplate code. Does this make sense?
> 
> Regards,
> BALATON Zoltan
> 
>> Thanks,
>>
>> C.
>>
>>>
>>> This fixes the issue:
>>>
>>>
>>> $ git diff
>>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>>> index 0166f3fc36..aac3a3f761 100644
>>> --- a/hw/ppc/ppc405_uc.c
>>> +++ b/hw/ppc/ppc405_uc.c
>>> @@ -594,7 +594,7 @@ void ppc405_ebc_init(CPUPPCState *env)
>>>       PowerPCCPU *cpu = env_archcpu(env);
>>>       DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
>>>
>>> -    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
>>> +    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
>>>       qdev_realize_and_unref(dev, NULL, &error_fatal);
>>>   }
>>>
>>>
>>> Daniel
>>>
>>>
>>>> +    qdev_realize_and_unref(dev, NULL, &error_fatal);
>>>> +}
>>>> +
>>>> /*****************************************************************************/
>>>>   /* DMA controller */
>>>>   enum {
>>>> @@ -1418,6 +1432,8 @@ static void ppc405_soc_instance_init(Object *obj)
>>>>       object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
>>>>       object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
>>>> +
>>>> +    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
>>>>   }
>>>>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>>> @@ -1490,7 +1506,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>>>                         s->ram_bases, s->ram_sizes, s->do_dram_init);
>>>>       /* External bus controller */
>>>> -    ppc405_ebc_init(env);
>>>> +    object_property_set_link(OBJECT(&s->ebc), "cpu", OBJECT(&s->cpu),
>>>> +                             &error_abort);
>>>> +    if (!qdev_realize(DEVICE(&s->ebc), NULL, errp)) {
>>>> +        return;
>>>> +    }
>>>>       /* DMA controller */
>>>>       object_property_set_link(OBJECT(&s->dma), "cpu", OBJECT(&s->cpu),
>>>> @@ -1576,6 +1596,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>>>>   static const TypeInfo ppc405_types[] = {
>>>>       {
>>>> +        .name           = TYPE_PPC405_EBC,
>>>> +        .parent         = TYPE_DEVICE,
>>>> +        .instance_size  = sizeof(Ppc405EbcState),
>>>> +        .class_init     = ppc405_ebc_class_init,
>>>> +    }, {
>>>>           .name           = TYPE_PPC405_DMA,
>>>>           .parent         = TYPE_SYS_BUS_DEVICE,
>>>>           .instance_size  = sizeof(Ppc405DmaState),
>>
>>
>>


