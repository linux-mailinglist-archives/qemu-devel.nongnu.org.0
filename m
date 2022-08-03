Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F185889F0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:54:26 +0200 (CEST)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJB56-0000e6-FA
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAwq-0003JW-Pg; Wed, 03 Aug 2022 05:45:55 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:38470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJAwm-0007sG-Vx; Wed, 03 Aug 2022 05:45:52 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10ee900cce0so8215564fac.5; 
 Wed, 03 Aug 2022 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=inPRNtcEMp5xThEGCx5meamQ1G3KinjiYCYwZvNymbU=;
 b=c4wvVa2nOLWLttJ2ZVgWDR4GawbRR5Vv12AWEDI9lzs9NkeM1QS7JYM9AasJJ5YE8+
 LSvPowA4gjQjYVChbGCbHP63UcKx5rIgKg/Loc9LJBxQnfz7fSyamg2UzB+mQRRRT/FG
 Rd47D2eY61pawelwTfe9fJ6zcToyrNdTNhutFJp+aYZ+0/i0q0XjXNqtaDupUQCaO0wr
 tHqkjIiDRnMZbPou6HMfsLo4654yCDe21NrtLq+JfGF6Qjk1l1KzFoCIM0ZKrbd+GEpx
 qvigKnbEYorv4Aj9wfz97qzRlOuL0TeC6k9A+vXmZ2EVTJhyRJJabEiJyQUsqgTDfq54
 Fvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=inPRNtcEMp5xThEGCx5meamQ1G3KinjiYCYwZvNymbU=;
 b=ssyKkqErwROtxZw8cNohzXw1vgsSkGF+0N7CtzSOiOzmiWIu8AV6Bt8ygz2rAaihmO
 wSOgQWa+pRkAFIFohDs1hWiBp+nlY99jLW6OqghimlMxJ575L4dPMrQntIpq48V1G4w7
 d8NogOeVwtcEP4p2dB07XMTIVDHJKnhtV+fDP3reuImId8hMHCeLxNO/+EV6K4UfCJaj
 71rrPxMWqfeQk/RLiuEmEddu7rbNrQUTjGiIw87jiNAFiiYvNTTK6a+kLUNXTcaJt+q3
 efPbK0mOMHZJFxhYXgSaHGN+6zNWD0es7zx4UHQJYY8TwowRK/2qGEcJrhRaR/SEgv+h
 A7fQ==
X-Gm-Message-State: ACgBeo1A9TnvCwKi4dWFreTkpJSDoVuDuDqnJ13HtPBSvrELAiRuMNbP
 ZNvSfWDFhUgA+bSw/Kf0/00=
X-Google-Smtp-Source: AA6agR7LByBb/V+jxsT2gnqHaeYPljp7t41CiQokY1SEnxvNe1K1upbr8+sZJKCDuygf9GfVl/fNzA==
X-Received: by 2002:a05:6870:65ab:b0:10e:7c08:9de7 with SMTP id
 fp43-20020a05687065ab00b0010e7c089de7mr1401045oab.169.1659519946603; 
 Wed, 03 Aug 2022 02:45:46 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a9d3e0e000000b0061cf85b2a0csm3928465otd.5.2022.08.03.02.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 02:45:46 -0700 (PDT)
Message-ID: <b99d6d76-de6d-7fab-ca02-c22b1487e957@gmail.com>
Date: Wed, 3 Aug 2022 06:45:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 17/19] ppc/ppc405: QOM'ify FPGA
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-18-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220801131039.1693913-18-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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



On 8/1/22 10:10, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc405_boards.c | 55 +++++++++++++++++++++++++++++-------------
>   1 file changed, 38 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 82b51cc457fa..2900c267b7ac 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -71,18 +71,23 @@ OBJECT_DECLARE_SIMPLE_TYPE(Ppc405MachineState, PPC405_MACHINE);
>    * - NVRAM (0xF0000000)
>    * - FPGA  (0xF0300000)
>    */
> -typedef struct ref405ep_fpga_t ref405ep_fpga_t;
> -struct ref405ep_fpga_t {
> +
> +#define TYPE_PPC405_FPGA "ppc405-fpga"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405FpgaState, PPC405_FPGA);
> +struct Ppc405FpgaState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +
>       uint8_t reg0;
>       uint8_t reg1;
>   };
>   
>   static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
>   {
> -    ref405ep_fpga_t *fpga;
> +    Ppc405FpgaState *fpga = PPC405_FPGA(opaque);
>       uint32_t ret;
>   
> -    fpga = opaque;
>       switch (addr) {
>       case 0x0:
>           ret = fpga->reg0;
> @@ -101,9 +106,8 @@ static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
>   static void ref405ep_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
>                                    unsigned size)
>   {
> -    ref405ep_fpga_t *fpga;
> +    Ppc405FpgaState *fpga = PPC405_FPGA(opaque);
>   
> -    fpga = opaque;
>       switch (addr) {
>       case 0x0:
>           /* Read only */
> @@ -126,27 +130,39 @@ static const MemoryRegionOps ref405ep_fpga_ops = {
>       .endianness = DEVICE_BIG_ENDIAN,
>   };
>   
> -static void ref405ep_fpga_reset (void *opaque)
> +static void ref405ep_fpga_reset(DeviceState *dev)
>   {
> -    ref405ep_fpga_t *fpga;
> +    Ppc405FpgaState *fpga = PPC405_FPGA(dev);
>   
> -    fpga = opaque;
>       fpga->reg0 = 0x00;
>       fpga->reg1 = 0x0F;
>   }
>   
> -static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
> +static void ref405ep_fpga_realize(DeviceState *dev, Error **errp)
>   {
> -    ref405ep_fpga_t *fpga;
> -    MemoryRegion *fpga_memory = g_new(MemoryRegion, 1);
> +    Ppc405FpgaState *s = PPC405_FPGA(dev);
>   
> -    fpga = g_new0(ref405ep_fpga_t, 1);
> -    memory_region_init_io(fpga_memory, NULL, &ref405ep_fpga_ops, fpga,
> +    memory_region_init_io(&s->iomem, OBJECT(s), &ref405ep_fpga_ops, s,
>                             "fpga", 0x00000100);
> -    memory_region_add_subregion(sysmem, base, fpga_memory);
> -    qemu_register_reset(&ref405ep_fpga_reset, fpga);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +}
> +
> +static void ref405ep_fpga_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ref405ep_fpga_realize;
> +    dc->user_creatable = false;
> +    dc->reset = ref405ep_fpga_reset;
>   }
>   
> +static const TypeInfo ref405ep_fpga_type = {
> +    .name = TYPE_PPC405_FPGA,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(Ppc405FpgaState),
> +    .class_init = ref405ep_fpga_class_init,
> +};
> +
>   /*
>    * CPU reset handler when booting directly from a loaded kernel
>    */
> @@ -325,7 +341,11 @@ static void ref405ep_init(MachineState *machine)
>       ppc405_init(machine);
>   
>       /* Register FPGA */
> -    ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
> +    dev = qdev_new(TYPE_PPC405_FPGA);
> +    object_property_add_child(OBJECT(machine), "fpga", OBJECT(dev));
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, PPC405EP_FPGA_BASE);
> +
>       /* Register NVRAM */
>       dev = qdev_new("sysbus-m48t08");
>       qdev_prop_set_int32(dev, "base-year", 1968);
> @@ -370,6 +390,7 @@ static void ppc405_machine_init(void)
>   {
>       type_register_static(&ppc405_machine_type);
>       type_register_static(&ref405ep_type);
> +    type_register_static(&ref405ep_fpga_type);
>   }
>   
>   type_init(ppc405_machine_init)

