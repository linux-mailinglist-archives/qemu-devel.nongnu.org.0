Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D319B58CACA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 16:53:27 +0200 (CEST)
Received: from localhost ([::1]:39334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL48F-0005VK-06
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 10:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oL45x-0003qJ-L1; Mon, 08 Aug 2022 10:51:05 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:41705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oL45u-0004C2-BU; Mon, 08 Aug 2022 10:51:05 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E864622F2F;
 Mon,  8 Aug 2022 14:50:57 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 8 Aug 2022
 16:50:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0018ce01e62-f182-4a8b-9bf6-dbbcd82d5568,
 014009DFAA8B86078D729D00C01D9476BEEC0396) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <828ed3d7-ffae-980a-59cd-ddc0f17df9e7@kaod.org>
Date: Mon, 8 Aug 2022 16:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 12/22] ppc/ppc405: QOM'ify GPIO
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-13-clg@kaod.org>
 <1d5fe4d1-fff2-8d86-3bb-1f46572ee267@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1d5fe4d1-fff2-8d86-3bb-1f46572ee267@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9ea8a607-591e-4a77-824a-65e716094283
X-Ovh-Tracer-Id: 2508786471676316579
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefkedgkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/8/22 16:32, BALATON Zoltan wrote:
> On Mon, 8 Aug 2022, Cédric Le Goater wrote:
>> The GPIO controller is currently modeled as a simple SysBus device
>> with a unique memory region.
>>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405.h    | 21 +++++++++++++++++++
>> hw/ppc/ppc405_uc.c | 50 +++++++++++++++++++++-------------------------
>> 2 files changed, 44 insertions(+), 27 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index a5b493d3e7bf..21f6cb358501 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -63,6 +63,26 @@ struct ppc4xx_bd_info_t {
>>     uint32_t bi_iic_fast[2];
>> };
>>
>> +/* GPIO */
>> +#define TYPE_PPC405_GPIO "ppc405-gpio"
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GpioState, PPC405_GPIO);
>> +struct Ppc405GpioState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion io;
>> +    uint32_t or;
>> +    uint32_t tcr;
>> +    uint32_t osrh;
>> +    uint32_t osrl;
>> +    uint32_t tsrh;
>> +    uint32_t tsrl;
>> +    uint32_t odr;
>> +    uint32_t ir;
>> +    uint32_t rr1;
>> +    uint32_t isr1h;
>> +    uint32_t isr1l;
>> +};
>> +
>> /* On Chip Memory */
>> #define TYPE_PPC405_OCM "ppc405-ocm"
>> OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OcmState, PPC405_OCM);
>> @@ -152,6 +172,7 @@ struct Ppc405SoCState {
>>     Ppc405CpcState cpc;
>>     Ppc405GptState gpt;
>>     Ppc405OcmState ocm;
>> +    Ppc405GpioState gpio;
>> };
>>
>> /* PowerPC 405 core */
>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index 961a7c851d4a..768e6909a831 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -713,23 +713,6 @@ static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
>> }
>>
>> /*****************************************************************************/
>> -/* GPIO */
>> -typedef struct ppc405_gpio_t ppc405_gpio_t;
>> -struct ppc405_gpio_t {
>> -    MemoryRegion io;
>> -    uint32_t or;
>> -    uint32_t tcr;
>> -    uint32_t osrh;
>> -    uint32_t osrl;
>> -    uint32_t tsrh;
>> -    uint32_t tsrl;
>> -    uint32_t odr;
>> -    uint32_t ir;
>> -    uint32_t rr1;
>> -    uint32_t isr1h;
>> -    uint32_t isr1l;
>> -};
>> -
>> static uint64_t ppc405_gpio_read(void *opaque, hwaddr addr, unsigned size)
>> {
>>     trace_ppc405_gpio_read(addr, size);
>> @@ -748,20 +731,22 @@ static const MemoryRegionOps ppc405_gpio_ops = {
>>     .endianness = DEVICE_NATIVE_ENDIAN,
>> };
>>
>> -static void ppc405_gpio_reset (void *opaque)
>> +static void ppc405_gpio_realize(DeviceState *dev, Error **errp)
>> {
>> +    Ppc405GpioState *s = PPC405_GPIO(dev);
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> +
>> +    memory_region_init_io(&s->io, OBJECT(s), &ppc405_gpio_ops, s, "gpio",
>> +                          0x038);
>> +    sysbus_init_mmio(sbd, &s->io);
>> }
>>
>> -static void ppc405_gpio_init(hwaddr base)
>> +static void ppc405_gpio_class_init(ObjectClass *oc, void *data)
>> {
>> -    ppc405_gpio_t *gpio;
>> -
>> -    trace_ppc405_gpio_init(base);
> 
> Trace gone, update trace-events too.

Yes. I have checked the others.

Thanks,

C.

> 
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>>
>> -    gpio = g_new0(ppc405_gpio_t, 1);
>> -    memory_region_init_io(&gpio->io, NULL, &ppc405_gpio_ops, gpio, "pgio", 0x038);
>> -    memory_region_add_subregion(get_system_memory(), base, &gpio->io);
>> -    qemu_register_reset(&ppc405_gpio_reset, gpio);
>> +    dc->realize = ppc405_gpio_realize;
>> +    dc->user_creatable = false;
>> }
>>
>> /*****************************************************************************/
>> @@ -1405,6 +1390,8 @@ static void ppc405_soc_instance_init(Object *obj)
>>     object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
>>
>>     object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
>> +
>> +    object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
>> }
>>
>> static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>> @@ -1477,8 +1464,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>     /* I2C controller */
>>     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
>>                          qdev_get_gpio_in(s->uic, 2));
>> +
>>     /* GPIO */
>> -    ppc405_gpio_init(0xef600700);
>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, 0xef600700);
>>
>>     /* Serial ports */
>>     if (serial_hd(0) != NULL) {
>> @@ -1540,6 +1531,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>>
>> static const TypeInfo ppc405_types[] = {
>>     {
>> +        .name           = TYPE_PPC405_GPIO,
>> +        .parent         = TYPE_SYS_BUS_DEVICE,
>> +        .instance_size  = sizeof(Ppc405GpioState),
>> +        .class_init     = ppc405_gpio_class_init,
>> +    }, {
>>         .name           = TYPE_PPC405_OCM,
>>         .parent         = TYPE_PPC4xx_DCR_DEVICE,
>>         .instance_size  = sizeof(Ppc405OcmState),
>>


