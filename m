Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7F595401
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 09:39:58 +0200 (CEST)
Received: from localhost ([::1]:55240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNrB7-0002xh-OO
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 03:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oNr8C-0000BO-V6; Tue, 16 Aug 2022 03:36:57 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:53749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oNr84-0004yT-5D; Tue, 16 Aug 2022 03:36:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.139])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B248911E8E727;
 Tue, 16 Aug 2022 09:36:43 +0200 (CEST)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 16 Aug
 2022 09:36:43 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0049db59f52-6475-4219-848e-335ecf3cd326,
 F9C770E940B196DD2347A7F94772438AA2E7EC4E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <79d02c8c-7753-d589-c41d-88b880914f9b@kaod.org>
Date: Tue, 16 Aug 2022 09:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 15/22] hw/intc/ppc-uic: Convert ppc-uic to a PPC4xx DCR
 device
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660402839.git.balaton@eik.bme.hu>
 <221c889d9c783397dce54390cf6fcc3f3b194d22.1660402839.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <221c889d9c783397dce54390cf6fcc3f3b194d22.1660402839.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 1f680da1-7153-468a-8675-bea8051927b4
X-Ovh-Tracer-Id: 5263300591866317731
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehfedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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

On 8/13/22 17:34, BALATON Zoltan wrote:
> Make ppc-uic a subclass of ppc4xx-dcr-device which will handle the cpu
> link and make it uniform with the other PPC4xx devices.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/intc/ppc-uic.c         | 26 ++++++--------------------
>   hw/ppc/ppc405_uc.c        |  6 ++----
>   hw/ppc/ppc440_bamboo.c    |  7 ++-----
>   hw/ppc/ppc4xx_devs.c      |  1 -
>   hw/ppc/sam460ex.c         | 17 +++++++----------
>   hw/ppc/virtex_ml507.c     |  7 ++-----
>   include/hw/intc/ppc-uic.h |  6 ++----
>   7 files changed, 21 insertions(+), 49 deletions(-)
> 
> diff --git a/hw/intc/ppc-uic.c b/hw/intc/ppc-uic.c
> index 60013f2dde..dcf5de5d43 100644
> --- a/hw/intc/ppc-uic.c
> +++ b/hw/intc/ppc-uic.c
> @@ -25,11 +25,8 @@
>   #include "qemu/osdep.h"
>   #include "hw/intc/ppc-uic.h"
>   #include "hw/irq.h"
> -#include "cpu.h"
> -#include "hw/ppc/ppc.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
> -#include "qapi/error.h"
>   
>   enum {
>       DCR_UICSR  = 0x000,
> @@ -105,10 +102,9 @@ static void ppcuic_trigger_irq(PPCUIC *uic)
>   
>   static void ppcuic_set_irq(void *opaque, int irq_num, int level)
>   {
> -    PPCUIC *uic;
> +    PPCUIC *uic = opaque;
>       uint32_t mask, sr;
>   
> -    uic = opaque;
>       mask = 1U << (31 - irq_num);
>       LOG_UIC("%s: irq %d level %d uicsr %08" PRIx32
>                   " mask %08" PRIx32 " => %08" PRIx32 " %08" PRIx32 "\n",
> @@ -144,10 +140,9 @@ static void ppcuic_set_irq(void *opaque, int irq_num, int level)
>   
>   static uint32_t dcr_read_uic(void *opaque, int dcrn)
>   {
> -    PPCUIC *uic;
> +    PPCUIC *uic = opaque;
>       uint32_t ret;
>   
> -    uic = opaque;
>       dcrn -= uic->dcr_base;
>       switch (dcrn) {
>       case DCR_UICSR:
> @@ -192,9 +187,8 @@ static uint32_t dcr_read_uic(void *opaque, int dcrn)
>   
>   static void dcr_write_uic(void *opaque, int dcrn, uint32_t val)
>   {
> -    PPCUIC *uic;
> +    PPCUIC *uic = opaque;
>   
> -    uic = opaque;
>       dcrn -= uic->dcr_base;
>       LOG_UIC("%s: dcr %d val 0x%x\n", __func__, dcrn, val);
>       switch (dcrn) {
> @@ -251,19 +245,12 @@ static void ppc_uic_reset(DeviceState *dev)
>   static void ppc_uic_realize(DeviceState *dev, Error **errp)
>   {
>       PPCUIC *uic = PPC_UIC(dev);
> +    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> -    PowerPCCPU *cpu;
>       int i;
>   
> -    if (!uic->cpu) {
> -        /* This is a programming error in the code using this device */
> -        error_setg(errp, "ppc-uic 'cpu' link property was not set");
> -        return;
> -    }
> -
> -    cpu = POWERPC_CPU(uic->cpu);
>       for (i = 0; i < DCR_UICMAX; i++) {
> -        ppc_dcr_register(&cpu->env, uic->dcr_base + i, uic,
> +        ppc4xx_dcr_register(dcr, uic->dcr_base + i, uic,
>                            &dcr_read_uic, &dcr_write_uic);
>       }
>   
> @@ -273,7 +260,6 @@ static void ppc_uic_realize(DeviceState *dev, Error **errp)
>   }
>   
>   static Property ppc_uic_properties[] = {
> -    DEFINE_PROP_LINK("cpu", PPCUIC, cpu, TYPE_CPU, CPUState *),
>       DEFINE_PROP_UINT32("dcr-base", PPCUIC, dcr_base, 0xc0),
>       DEFINE_PROP_BOOL("use-vectors", PPCUIC, use_vectors, true),
>       DEFINE_PROP_END_OF_LIST()
> @@ -308,7 +294,7 @@ static void ppc_uic_class_init(ObjectClass *klass, void *data)
>   
>   static const TypeInfo ppc_uic_info = {
>       .name = TYPE_PPC_UIC,
> -    .parent = TYPE_SYS_BUS_DEVICE,
> +    .parent = TYPE_PPC4xx_DCR_DEVICE,
>       .instance_size = sizeof(PPCUIC),
>       .class_init = ppc_uic_class_init,
>   };
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 82830f52bf..aa3617f876 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1149,12 +1149,10 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>       sysbus_mmio_map(sbd, 0, 0xef600600);
>   
>       /* Universal interrupt controller */
> -    object_property_set_link(OBJECT(&s->uic), "cpu", OBJECT(&s->cpu),
> -                             &error_fatal);
> -    sbd = SYS_BUS_DEVICE(&s->uic);
> -    if (!sysbus_realize(sbd, errp)) {
> +    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->uic), &s->cpu, errp)) {
>           return;
>       }
> +    sbd = SYS_BUS_DEVICE(&s->uic);
>       sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
>                          qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_INT));
>       sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 873f930c77..b14a9ef776 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -193,12 +193,9 @@ static void bamboo_init(MachineState *machine)
>   
>       /* interrupt controller */
>       uicdev = qdev_new(TYPE_PPC_UIC);
> +    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(uicdev), cpu, &error_fatal);
> +    object_unref(OBJECT(uicdev));
>       uicsbd = SYS_BUS_DEVICE(uicdev);
> -
> -    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
> -                             &error_fatal);
> -    sysbus_realize_and_unref(uicsbd, &error_fatal);
> -
>       sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
>                          qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
>       sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 96941ae040..49793b56cd 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -29,7 +29,6 @@
>   #include "hw/irq.h"
>   #include "hw/ppc/ppc.h"
>   #include "hw/ppc/ppc4xx.h"
> -#include "hw/intc/ppc-uic.h"
>   #include "hw/qdev-properties.h"
>   #include "qemu/log.h"
>   #include "exec/address-spaces.h"
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index c16303462d..c96de98690 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -314,7 +314,6 @@ static void sam460ex_init(MachineState *machine)
>   
>       /* interrupt controllers */
>       for (i = 0; i < ARRAY_SIZE(uic); i++) {
> -        SysBusDevice *sbd;
>           /*
>            * UICs 1, 2 and 3 are cascaded through UIC 0.
>            * input_ints[n] is the interrupt number on UIC 0 which
> @@ -326,22 +325,20 @@ static void sam460ex_init(MachineState *machine)
>           const int input_ints[] = { -1, 30, 10, 16 };
>   
>           uic[i] = qdev_new(TYPE_PPC_UIC);
> -        sbd = SYS_BUS_DEVICE(uic[i]);
> -
>           qdev_prop_set_uint32(uic[i], "dcr-base", 0xc0 + i * 0x10);
> -        object_property_set_link(OBJECT(uic[i]), "cpu", OBJECT(cpu),
> -                                 &error_fatal);
> -        sysbus_realize_and_unref(sbd, &error_fatal);
> +        ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(uic[i]), cpu, &error_fatal);
> +        object_unref(OBJECT(uic[i]));
>   
> +        sbdev = SYS_BUS_DEVICE(uic[i]);
>           if (i == 0) {
> -            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
> +            sysbus_connect_irq(sbdev, PPCUIC_OUTPUT_INT,
>                                qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
> -            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
> +            sysbus_connect_irq(sbdev, PPCUIC_OUTPUT_CINT,
>                                qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
>           } else {
> -            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
> +            sysbus_connect_irq(sbdev, PPCUIC_OUTPUT_INT,
>                                  qdev_get_gpio_in(uic[0], input_ints[i]));
> -            sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
> +            sysbus_connect_irq(sbdev, PPCUIC_OUTPUT_CINT,
>                                  qdev_get_gpio_in(uic[0], input_ints[i] + 1));
>           }
>       }
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 53b126ff48..493ea0c19f 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -104,12 +104,9 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
>   
>       /* interrupt controller */
>       uicdev = qdev_new(TYPE_PPC_UIC);
> +    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(uicdev), cpu, &error_fatal);
> +    object_unref(OBJECT(uicdev));
>       uicsbd = SYS_BUS_DEVICE(uicdev);
> -
> -    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
> -                             &error_fatal);
> -    sysbus_realize_and_unref(uicsbd, &error_fatal);
> -
>       sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
>                          qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
>       sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
> diff --git a/include/hw/intc/ppc-uic.h b/include/hw/intc/ppc-uic.h
> index 22dd5e5ac2..4d82e9a3c6 100644
> --- a/include/hw/intc/ppc-uic.h
> +++ b/include/hw/intc/ppc-uic.h
> @@ -25,8 +25,7 @@
>   #ifndef HW_INTC_PPC_UIC_H
>   #define HW_INTC_PPC_UIC_H
>   
> -#include "hw/sysbus.h"
> -#include "qom/object.h"
> +#include "hw/ppc/ppc4xx.h"
>   
>   #define TYPE_PPC_UIC "ppc-uic"
>   OBJECT_DECLARE_SIMPLE_TYPE(PPCUIC, PPC_UIC)
> @@ -56,14 +55,13 @@ enum {
>   
>   struct PPCUIC {
>       /*< private >*/
> -    SysBusDevice parent_obj;
> +    Ppc4xxDcrDeviceState parent_obj;
>   
>       /*< public >*/
>       qemu_irq output_int;
>       qemu_irq output_cint;
>   
>       /* properties */
> -    CPUState *cpu;
>       uint32_t dcr_base;
>       bool use_vectors;
>   


