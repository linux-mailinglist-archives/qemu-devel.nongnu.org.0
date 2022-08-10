Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD7F58E75A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 08:36:39 +0200 (CEST)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLfKY-0008Ap-FJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 02:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLfBJ-0003D0-6q
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 02:27:08 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:47047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLfBF-0001Kv-B4
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 02:27:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E00E220080;
 Wed, 10 Aug 2022 06:26:58 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 10 Aug
 2022 08:26:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0054b602094-d0a6-44d5-ae77-eab4c6fb3f47,
 043EABA4B22CD34FCE1B70F8CBB6C707CA017DB3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a71c2ecb-3cdc-d193-0b16-3dbc59625eed@kaod.org>
Date: Wed, 10 Aug 2022 08:26:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 23/24] ppc/ppc405: QOM'ify SDRAM
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-24-clg@kaod.org>
 <d0dca62f-f54f-1f43-18b5-5b67497bc451@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <d0dca62f-f54f-1f43-18b5-5b67497bc451@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a03a9d89-a011-414c-9af5-94c094d726c9
X-Ovh-Tracer-Id: 5742652474989185955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeguddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/9/22 19:53, BALATON Zoltan wrote:
> On Tue, 9 Aug 2022, Cédric Le Goater wrote:
>> This is an initial change of the SDRAM controller preserving the
>> compatibility with the current modeling. Further cleanup will be
>> possible after conversion of the ppc4xx_sdram_banks() and
>> ppc4xx_sdram_init() routines of the sam460ex and bamboo machines.
>>
>> The size and base address of the RAM banks are now set using QOM
>> property arrays. RAM is equally distributed on each bank at the SoC
>> level depending on the number of banks we want to initialize (default
>> is 2). Each RAM memory region representing a RAM bank is initialized
>> in the realize routine of the SDRAM model after a minimal check on the
>> RAM size value with the sdram_bcr() routine. This has the benefit of
>> reporting an error to the user if the requested RAM size is invalid
>> for the SDRAM controller.
> 
> Haven't looked at it in detail yet but I think we have two versions of this (one in ppc4xx_devs.c and another in ppc440_uc.c) that are slightly different due to the differences of the memory controllers of later SoCs. I'm not sure how to clean this up and forgot most of the details about this.

AFAICT We need a Ppc4xxSdramClass to abstract the differences.

Thanks,

C.

> 
> Regards,
> BALATON Zoltan
> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405.h         |   6 +--
>> include/hw/ppc/ppc4xx.h |  32 ++++++++++++
>> hw/ppc/ppc405_uc.c      |  34 ++++++++----
>> hw/ppc/ppc4xx_devs.c    | 113 ++++++++++++++++++++++++++++------------
>> 4 files changed, 140 insertions(+), 45 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index 56881b181ba1..8c19d167391c 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -228,12 +228,9 @@ struct Ppc405SoCState {
>>     DeviceState parent_obj;
>>
>>     /* Public */
>> -    MemoryRegion ram_banks[2];
>> -    hwaddr ram_bases[2], ram_sizes[2];
>> -    bool do_dram_init;
>> -
>>     MemoryRegion *dram_mr;
>>     hwaddr ram_size;
>> +    uint32_t nr_banks;
>>
>>     PowerPCCPU cpu;
>>     PPCUIC uic;
>> @@ -241,6 +238,7 @@ struct Ppc405SoCState {
>>     Ppc405GptState gpt;
>>     Ppc405OcmState ocm;
>>     Ppc405GpioState gpio;
>> +    Ppc4xxSdramState sdram;
>>     Ppc405DmaState dma;
>>     PPC4xxI2CState i2c;
>>     Ppc405EbcState ebc;
>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>> index acd096cb2394..b841f6600b55 100644
>> --- a/include/hw/ppc/ppc4xx.h
>> +++ b/include/hw/ppc/ppc4xx.h
>> @@ -87,4 +87,36 @@ struct Ppc4xxMalState {
>> void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
>>                      qemu_irq irqs[4]);
>>
>> +/* SDRAM controller */
>> +#define TYPE_PPC4xx_SDRAM "ppc4xx-sdram"
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxSdramState, PPC4xx_SDRAM);
>> +struct Ppc4xxSdramState {
>> +    Ppc4xxDcrDeviceState parent_obj;
>> +
>> +    MemoryRegion *dram_mr;
>> +    bool dram_init;
>> +
>> +    MemoryRegion containers[4]; /* used for clipping */
>> +    MemoryRegion *ram_memories;
>> +    hwaddr *ram_bases;
>> +    hwaddr *ram_sizes;
>> +    uint32_t nb_ram_bases;
>> +    uint32_t nb_ram_sizes;
>> +    uint32_t nbanks; /* Redundant */
>> +
>> +    uint32_t addr;
>> +    uint32_t besr0;
>> +    uint32_t besr1;
>> +    uint32_t bear;
>> +    uint32_t cfg;
>> +    uint32_t status;
>> +    uint32_t rtr;
>> +    uint32_t pmit;
>> +    uint32_t bcr[4];
>> +    uint32_t tr;
>> +    uint32_t ecccfg;
>> +    uint32_t eccesr;
>> +    qemu_irq irq;
>> +};
>> +
>> #endif /* PPC4XX_H */
>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index 1045f5f13e6c..fe0c92ba0d54 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -1361,6 +1361,9 @@ static void ppc405_soc_instance_init(Object *obj)
>>
>>     object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
>>
>> +    object_initialize_child(obj, "sdram", &s->sdram, TYPE_PPC4xx_SDRAM);
>> +    object_property_add_alias(obj, "dram-init", OBJECT(&s->sdram), "dram-init");
>> +
>>     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
>>
>>     object_initialize_child(obj, "i2c", &s->i2c, TYPE_PPC4xx_I2C);
>> @@ -1432,15 +1435,28 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>
>>     /* SDRAM controller */
>>         /* XXX 405EP has no ECC interrupt */
>> -    s->ram_bases[0] = 0;
>> -    s->ram_sizes[0] = s->ram_size;
>> -    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
>> -                             "ppc405.sdram0", s->dram_mr,
>> -                             s->ram_bases[0], s->ram_sizes[0]);
>> +    object_property_set_link(OBJECT(&s->sdram), "dram", OBJECT(s->dram_mr),
>> +                             &error_abort);
>> +
>> +    qdev_prop_set_uint32(DEVICE(&s->sdram), "len-ram-sizes", s->nr_banks);
>> +    qdev_prop_set_uint32(DEVICE(&s->sdram), "len-ram-bases", s->nr_banks);
>>
>> -    ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
>> -                      s->ram_banks, s->ram_bases, s->ram_sizes,
>> -                      s->do_dram_init);
>> +    for (i = 0; i < s->nr_banks; i++) {
>> +        char name[32];
>> +        snprintf(name, sizeof(name), "ram-bases[%d]", i);
>> +        qdev_prop_set_uint32(DEVICE(&s->sdram), name,
>> +                             i * s->ram_size / s->nr_banks);
>> +
>> +        snprintf(name, sizeof(name), "ram-sizes[%d]", i);
>> +        qdev_prop_set_uint32(DEVICE(&s->sdram), name,
>> +                             s->ram_size / s->nr_banks);
>> +    }
>> +
>> +    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->sdram), &s->cpu, errp)) {
>> +        return;
>> +    }
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdram), 0,
>> +                       qdev_get_gpio_in(DEVICE(&s->uic), 17));
>>
>>     /* External bus controller */
>>     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
>> @@ -1520,7 +1536,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>> static Property ppc405_soc_properties[] = {
>>     DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
>>                      MemoryRegion *),
>> -    DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
>> +    DEFINE_PROP_UINT32("nr-banks", Ppc405SoCState, nr_banks, 2),
>>     DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
>>     DEFINE_PROP_END_OF_LIST(),
>> };
>> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
>> index c06c20b195cd..a9ceea13f218 100644
>> --- a/hw/ppc/ppc4xx_devs.c
>> +++ b/hw/ppc/ppc4xx_devs.c
>> @@ -39,28 +39,6 @@
>>
>> /*****************************************************************************/
>> /* SDRAM controller */
>> -typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
>> -struct ppc4xx_sdram_t {
>> -    uint32_t addr;
>> -    int nbanks;
>> -    MemoryRegion containers[4]; /* used for clipping */
>> -    MemoryRegion *ram_memories;
>> -    hwaddr ram_bases[4];
>> -    hwaddr ram_sizes[4];
>> -    uint32_t besr0;
>> -    uint32_t besr1;
>> -    uint32_t bear;
>> -    uint32_t cfg;
>> -    uint32_t status;
>> -    uint32_t rtr;
>> -    uint32_t pmit;
>> -    uint32_t bcr[4];
>> -    uint32_t tr;
>> -    uint32_t ecccfg;
>> -    uint32_t eccesr;
>> -    qemu_irq irq;
>> -};
>> -
>> enum {
>>     SDRAM0_CFGADDR = 0x010,
>>     SDRAM0_CFGDATA = 0x011,
>> @@ -128,7 +106,7 @@ static target_ulong sdram_size (uint32_t bcr)
>>     return size;
>> }
>>
>> -static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
>> +static void sdram_set_bcr(Ppc4xxSdramState *sdram, int i,
>>                           uint32_t bcr, int enabled)
>> {
>>     if (sdram->bcr[i] & 0x00000001) {
>> @@ -154,7 +132,7 @@ static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
>>     }
>> }
>>
>> -static void sdram_map_bcr (ppc4xx_sdram_t *sdram)
>> +static void sdram_map_bcr(Ppc4xxSdramState *sdram)
>> {
>>     int i;
>>
>> @@ -168,7 +146,7 @@ static void sdram_map_bcr (ppc4xx_sdram_t *sdram)
>>     }
>> }
>>
>> -static void sdram_unmap_bcr (ppc4xx_sdram_t *sdram)
>> +static void sdram_unmap_bcr(Ppc4xxSdramState *sdram)
>> {
>>     int i;
>>
>> @@ -182,7 +160,7 @@ static void sdram_unmap_bcr (ppc4xx_sdram_t *sdram)
>>
>> static uint32_t dcr_read_sdram (void *opaque, int dcrn)
>> {
>> -    ppc4xx_sdram_t *sdram;
>> +    Ppc4xxSdramState *sdram;
>>     uint32_t ret;
>>
>>     sdram = opaque;
>> @@ -250,7 +228,7 @@ static uint32_t dcr_read_sdram (void *opaque, int dcrn)
>>
>> static void dcr_write_sdram (void *opaque, int dcrn, uint32_t val)
>> {
>> -    ppc4xx_sdram_t *sdram;
>> +    Ppc4xxSdramState *sdram;
>>
>>     sdram = opaque;
>>     switch (dcrn) {
>> @@ -329,11 +307,10 @@ static void dcr_write_sdram (void *opaque, int dcrn, uint32_t val)
>>     }
>> }
>>
>> -static void sdram_reset (void *opaque)
>> +static void ppc4xx_sdram_reset(DeviceState *dev)
>> {
>> -    ppc4xx_sdram_t *sdram;
>> +    Ppc4xxSdramState *sdram = (Ppc4xxSdramState *) dev;
>>
>> -    sdram = opaque;
>>     sdram->addr = 0x00000000;
>>     sdram->bear = 0x00000000;
>>     sdram->besr0 = 0x00000000; /* No error */
>> @@ -349,21 +326,88 @@ static void sdram_reset (void *opaque)
>>     sdram->cfg = 0x00800000;
>> }
>>
>> +static void sdram_reset(void *opaque)
>> +{
>> +    ppc4xx_sdram_reset(opaque);
>> +}
>> +
>> +static void ppc4xx_sdram_realize(DeviceState *dev, Error **errp)
>> +{
>> +    Ppc4xxSdramState *s = PPC4xx_SDRAM(dev);
>> +    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
>> +    int i;
>> +
>> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>> +
>> +    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR, &dcr_read_sdram, &dcr_write_sdram);
>> +    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA, &dcr_read_sdram, &dcr_write_sdram);
>> +
>> +    if (!s->nb_ram_bases || s->nb_ram_bases != s->nb_ram_sizes) {
>> +        error_setg(errp, "Invalid number of RAM banks");
>> +        return;
>> +    }
>> +
>> +    s->ram_memories = g_new0(MemoryRegion, s->nb_ram_bases);
>> +    for (i = 0; i < s->nb_ram_bases; i++) {
>> +        g_autofree char *name = g_strdup_printf(TYPE_PPC4xx_SDRAM "%d", i);
>> +
>> +        if (!sdram_bcr(s->ram_bases[i], s->ram_sizes[i])) {
>> +            error_setg(errp, "Invalid RAM size 0x%" HWADDR_PRIx,
>> +                       s->ram_sizes[i]);
>> +            return;
>> +        }
>> +
>> +        memory_region_init_alias(&s->ram_memories[i], OBJECT(s), name,
>> +                                 s->dram_mr, s->ram_bases[i], s->ram_sizes[i]);
>> +    }
>> +
>> +    s->nbanks = s->nb_ram_sizes;
>> +    if (s->dram_init) {
>> +        sdram_map_bcr(s);
>> +    }
>> +}
>> +
>> +static Property ppc4xx_sdram_properties[] = {
>> +    DEFINE_PROP_LINK("dram", Ppc4xxSdramState, dram_mr, TYPE_MEMORY_REGION,
>> +                     MemoryRegion *),
>> +    DEFINE_PROP_BOOL("dram-init", Ppc4xxSdramState, dram_init, false),
>> +    DEFINE_PROP_ARRAY("ram-sizes", Ppc4xxSdramState, nb_ram_sizes,
>> +                      ram_sizes, qdev_prop_uint64, uint64_t),
>> +    DEFINE_PROP_ARRAY("ram-bases", Ppc4xxSdramState, nb_ram_bases,
>> +                      ram_bases, qdev_prop_uint64, uint64_t),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void ppc4xx_sdram_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    dc->realize = ppc4xx_sdram_realize;
>> +    dc->user_creatable = false;
>> +    dc->reset = ppc4xx_sdram_reset;
>> +    device_class_set_props(dc, ppc4xx_sdram_properties);
>> +}
>> +
>> void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
>>                         MemoryRegion *ram_memories,
>>                         hwaddr *ram_bases,
>>                         hwaddr *ram_sizes,
>>                         int do_init)
>> {
>> -    ppc4xx_sdram_t *sdram;
>> +    Ppc4xxSdramState *sdram;
>>
>> -    sdram = g_new0(ppc4xx_sdram_t, 1);
>> +    sdram = g_new0(Ppc4xxSdramState, 1);
>>     sdram->irq = irq;
>>     sdram->nbanks = nbanks;
>>     sdram->ram_memories = ram_memories;
>> +
>> +    sdram->ram_bases = g_new0(hwaddr, 4);
>> +
>>     memset(sdram->ram_bases, 0, 4 * sizeof(hwaddr));
>>     memcpy(sdram->ram_bases, ram_bases,
>>            nbanks * sizeof(hwaddr));
>> +
>> +    sdram->ram_sizes = g_new0(hwaddr, 4);
>>     memset(sdram->ram_sizes, 0, 4 * sizeof(hwaddr));
>>     memcpy(sdram->ram_sizes, ram_sizes,
>>            nbanks * sizeof(hwaddr));
>> @@ -683,6 +727,11 @@ static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
>>
>> static const TypeInfo ppc4xx_types[] = {
>>     {
>> +        .name           = TYPE_PPC4xx_SDRAM,
>> +        .parent         = TYPE_PPC4xx_DCR_DEVICE,
>> +        .instance_size  = sizeof(Ppc4xxSdramState),
>> +        .class_init     = ppc4xx_sdram_class_init,
>> +    }, {
>>         .name           = TYPE_PPC4xx_MAL,
>>         .parent         = TYPE_PPC4xx_DCR_DEVICE,
>>         .instance_size  = sizeof(Ppc4xxMalState),
>>


