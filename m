Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE9758CBCB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 18:03:10 +0200 (CEST)
Received: from localhost ([::1]:47066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL5Dg-0002T0-AU
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 12:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL59I-0006sl-IJ
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:58:36 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:59261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL59F-0000ST-NK
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:58:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.179])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E4F5120E63;
 Mon,  8 Aug 2022 15:58:29 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 8 Aug 2022
 17:58:29 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003e94c7cee-2bfd-4b9e-bdf1-5c19b085a74a,
 014009DFAA8B86078D729D00C01D9476BEEC0396) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e304859e-f0c8-57ef-7b6c-56737beada01@kaod.org>
Date: Mon, 8 Aug 2022 17:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 19/22] ppc/ppc405: QOM'ify FPGA
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-20-clg@kaod.org>
 <d5f0ad35-5044-4fde-69aa-9bd965cfebae@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <d5f0ad35-5044-4fde-69aa-9bd965cfebae@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7fe826a7-8def-4650-9019-a80e0c1cd252
X-Ovh-Tracer-Id: 3649323074613250979
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefkedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
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

On 8/8/22 16:55, BALATON Zoltan wrote:
> On Mon, 8 Aug 2022, Cédric Le Goater wrote:
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405_boards.c | 55 +++++++++++++++++++++++++++++-------------
>> 1 file changed, 38 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 5ba12d60bc00..195aa58c35ad 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -71,18 +71,23 @@ struct Ppc405MachineState {
>>  * - NVRAM (0xF0000000)
>>  * - FPGA  (0xF0300000)
>>  */
>> -typedef struct ref405ep_fpga_t ref405ep_fpga_t;
>> -struct ref405ep_fpga_t {
>> +
>> +#define TYPE_PPC405_FPGA "ppc405-fpga"
> 
> If this is specific to ref405ep maybe it should be named accordingly.

done.

Thanks,

C.

> 
> Regards,
> BALATON Zoltan
> 
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405FpgaState, PPC405_FPGA);
>> +struct Ppc405FpgaState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion iomem;
>> +
>>     uint8_t reg0;
>>     uint8_t reg1;
>> };
>>
>> static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
>> {
>> -    ref405ep_fpga_t *fpga;
>> +    Ppc405FpgaState *fpga = PPC405_FPGA(opaque);
>>     uint32_t ret;
>>
>> -    fpga = opaque;
>>     switch (addr) {
>>     case 0x0:
>>         ret = fpga->reg0;
>> @@ -101,9 +106,8 @@ static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
>> static void ref405ep_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
>>                                  unsigned size)
>> {
>> -    ref405ep_fpga_t *fpga;
>> +    Ppc405FpgaState *fpga = PPC405_FPGA(opaque);
>>
>> -    fpga = opaque;
>>     switch (addr) {
>>     case 0x0:
>>         /* Read only */
>> @@ -126,27 +130,39 @@ static const MemoryRegionOps ref405ep_fpga_ops = {
>>     .endianness = DEVICE_BIG_ENDIAN,
>> };
>>
>> -static void ref405ep_fpga_reset (void *opaque)
>> +static void ref405ep_fpga_reset(DeviceState *dev)
>> {
>> -    ref405ep_fpga_t *fpga;
>> +    Ppc405FpgaState *fpga = PPC405_FPGA(dev);
>>
>> -    fpga = opaque;
>>     fpga->reg0 = 0x00;
>>     fpga->reg1 = 0x0F;
>> }
>>
>> -static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
>> +static void ref405ep_fpga_realize(DeviceState *dev, Error **errp)
>> {
>> -    ref405ep_fpga_t *fpga;
>> -    MemoryRegion *fpga_memory = g_new(MemoryRegion, 1);
>> +    Ppc405FpgaState *s = PPC405_FPGA(dev);
>>
>> -    fpga = g_new0(ref405ep_fpga_t, 1);
>> -    memory_region_init_io(fpga_memory, NULL, &ref405ep_fpga_ops, fpga,
>> +    memory_region_init_io(&s->iomem, OBJECT(s), &ref405ep_fpga_ops, s,
>>                           "fpga", 0x00000100);
>> -    memory_region_add_subregion(sysmem, base, fpga_memory);
>> -    qemu_register_reset(&ref405ep_fpga_reset, fpga);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
>> +}
>> +
>> +static void ref405ep_fpga_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    dc->realize = ref405ep_fpga_realize;
>> +    dc->user_creatable = false;
>> +    dc->reset = ref405ep_fpga_reset;
>> }
>>
>> +static const TypeInfo ref405ep_fpga_type = {
>> +    .name = TYPE_PPC405_FPGA,
>> +    .parent = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(Ppc405FpgaState),
>> +    .class_init = ref405ep_fpga_class_init,
>> +};
>> +
>> /*
>>  * CPU reset handler when booting directly from a loaded kernel
>>  */
>> @@ -332,7 +348,11 @@ static void ref405ep_init(MachineState *machine)
>>     memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
>>
>>     /* Register FPGA */
>> -    ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
>> +    dev = qdev_new(TYPE_PPC405_FPGA);
>> +    object_property_add_child(OBJECT(machine), "fpga", OBJECT(dev));
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, PPC405EP_FPGA_BASE);
>> +
>>     /* Register NVRAM */
>>     dev = qdev_new("sysbus-m48t08");
>>     qdev_prop_set_int32(dev, "base-year", 1968);
>> @@ -377,6 +397,7 @@ static void ppc405_machine_init(void)
>> {
>>     type_register_static(&ppc405_machine_type);
>>     type_register_static(&ref405ep_type);
>> +    type_register_static(&ref405ep_fpga_type);
>> }
>>
>> type_init(ppc405_machine_init)
>>


