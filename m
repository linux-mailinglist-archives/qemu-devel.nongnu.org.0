Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA058F18E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 19:27:54 +0200 (CEST)
Received: from localhost ([::1]:51198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLpUm-0005As-SJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 13:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLpPg-0000uH-4M; Wed, 10 Aug 2022 13:22:36 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLpPe-000337-Df; Wed, 10 Aug 2022 13:22:35 -0400
Received: by mail-vs1-xe36.google.com with SMTP id o123so15847564vsc.3;
 Wed, 10 Aug 2022 10:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=u6lPEzs2QV0W3WFGnam8l4l6l+x9qLwaFQs2gRoI6Ic=;
 b=kQ+aVE1upGALsepWeBLmEw3QX3kTkHzPQCAmqBs2p3Clf2h30BOn92FW/P/4acX6Xj
 b1qV4yGj4ZpO3/KWrfxMdCZuNphPEpa2W3f6B0yvF9x3E7dGHlEZIlmHu5g+kAJVdzdv
 WrBpTlZ7DwcmmZ5DWyIY6IgvZHHbB1WQKX98zwgl7Clu+8245Gud+OKoRNWDcddXjIeM
 mGRT0RCRnovR8EQVMLcezdCcN+d9cnECK0C2+HfbQXZWerco2dXS6wSm2odJxhgU3soa
 TJEqUI3OHYH/ZlO0WE1f3E4hSPSUOTz5Rc+tr/KjFXL4G5AnTq0GIkPISDkvdrZ7YMGG
 VGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=u6lPEzs2QV0W3WFGnam8l4l6l+x9qLwaFQs2gRoI6Ic=;
 b=iOqMSka5m1Sw7bV3EyIrCuOCGgo6Wbud0UoPNVFBLLIuKeUZceYW4IuF/CbsPK6HEC
 JraJBiJzyLEm6WEXxa8KfqMFoQX/NZcmhpF2OeDi9P7m22C0ZxK0svd83fN5bhK9dfCG
 Np6PxnMu77wDvr4acZRu6pyaonhjPlPX/bWoZMTTaXwEzcFEEi+b425L0lrEYovJlfEh
 zRDUun1jK1mZBd2HYpLEKjdo5VUza90IDt5aC3HE+bjqxQa3VYqB1UcM0UYyai7Riryw
 u3ya3eG8Yz6m6yYFZ2qnNw6j3VxVUs1FzVnVJ25UB57EHxTnzGX5ZHdtkD84CYgTkevz
 zU9g==
X-Gm-Message-State: ACgBeo22sCslwHE2wtSD50xPnGACd/b/GNAZ9OzoidKuFohoDALeYl26
 viPRg7d/eqAjU58/14sRW/0=
X-Google-Smtp-Source: AA6agR6M8Dfa3PgTKjIjKY6EHq9uosjyu44b20Z0e0KuyvWHB26zyWMOppgmIRdzWwiqrIhUMAAOhA==
X-Received: by 2002:a67:d101:0:b0:357:5ed7:463b with SMTP id
 u1-20020a67d101000000b003575ed7463bmr12209967vsi.73.1660152152907; 
 Wed, 10 Aug 2022 10:22:32 -0700 (PDT)
Received: from [192.168.10.102] (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 s62-20020a1fdb41000000b003774da8fd03sm215563vkg.27.2022.08.10.10.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 10:22:32 -0700 (PDT)
Message-ID: <147b0514-1f62-bd50-48c8-ad7b6d351468@gmail.com>
Date: Wed, 10 Aug 2022 14:22:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 19/24] ppc/ppc405: QOM'ify FPGA
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-20-clg@kaod.org>
 <a1e6fbc2-a572-9ea5-2ef5-e1982229a578@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <a1e6fbc2-a572-9ea5-2ef5-e1982229a578@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 8/9/22 14:37, BALATON Zoltan wrote:
> On Tue, 9 Aug 2022, Cédric Le Goater wrote:
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405_boards.c | 55 +++++++++++++++++++++++++++++-------------
>> 1 file changed, 38 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 3677793adc75..4ff6715f3533 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -71,18 +71,23 @@ struct Ppc405MachineState {
>>  * - NVRAM (0xF0000000)
>>  * - FPGA  (0xF0300000)
>>  */
>> -typedef struct ref405ep_fpga_t ref405ep_fpga_t;
>> -struct ref405ep_fpga_t {
>> +
>> +#define TYPE_REF405EP_FPGA "ref405ep-fpga"
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ref405epFpgaState, REF405EP_FPGA);
>> +struct Ref405epFpgaState {
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
>> +    Ref405epFpgaState *fpga = REF405EP_FPGA(opaque);
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
>> +    Ref405epFpgaState *fpga = REF405EP_FPGA(opaque);
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
>> +    Ref405epFpgaState *fpga = REF405EP_FPGA(dev);
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
>> +    Ref405epFpgaState *s = REF405EP_FPGA(dev);
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
> 
> Comment missing (and I'd drop unnecessary QOM casts) but otherwise:

Which QOM casts are you referring to?


Daniel

> 
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> Regards,
> BALATON Zoltan
> 
>> +    dc->reset = ref405ep_fpga_reset;
>> }
>>
>> +static const TypeInfo ref405ep_fpga_type = {
>> +    .name = TYPE_REF405EP_FPGA,
>> +    .parent = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(Ref405epFpgaState),
>> +    .class_init = ref405ep_fpga_class_init,
>> +};
>> +
>> /*
>>  * CPU reset handler when booting directly from a loaded kernel
>>  */
>> @@ -331,7 +347,11 @@ static void ref405ep_init(MachineState *machine)
>>     memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE, sram);
>>
>>     /* Register FPGA */
>> -    ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
>> +    dev = qdev_new(TYPE_REF405EP_FPGA);
>> +    object_property_add_child(OBJECT(machine), "fpga", OBJECT(dev));
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, PPC405EP_FPGA_BASE);
>> +
>>     /* Register NVRAM */
>>     dev = qdev_new("sysbus-m48t08");
>>     qdev_prop_set_int32(dev, "base-year", 1968);
>> @@ -376,6 +396,7 @@ static void ppc405_machine_init(void)
>> {
>>     type_register_static(&ppc405_machine_type);
>>     type_register_static(&ref405ep_type);
>> +    type_register_static(&ref405ep_fpga_type);
>> }
>>
>> type_init(ppc405_machine_init)
>>

