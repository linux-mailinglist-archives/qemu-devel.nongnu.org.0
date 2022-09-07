Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891615B05CB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 15:55:17 +0200 (CEST)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVvWO-00035q-3f
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 09:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVvU6-0007na-5Z
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:52:54 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:46709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVvU3-0001bo-Di
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:52:53 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 27E20125D9905;
 Wed,  7 Sep 2022 15:52:49 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 7 Sep
 2022 15:52:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002826e16bb-da43-4412-8eaf-1b5d8f686c29,
 2B0902173EB74D822BE58268A8E021C7C40D5376) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <3fbec7a1-a1d1-ae3d-14de-584c6f54caf9@kaod.org>
Date: Wed, 7 Sep 2022 15:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 15/20] ppc440_sdram: QOM'ify
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <a4205f42dbf34351ea0e27157538271069cb36c7.1660926381.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <a4205f42dbf34351ea0e27157538271069cb36c7.1660926381.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7fd8d400-acf5-4024-970c-35e95b007c40
X-Ovh-Tracer-Id: 11687122508974033827
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
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

On 8/19/22 18:55, BALATON Zoltan wrote:
> Change the ppc440_sdram model to a QOM class derived from the
> PPC4xx-dcr-device and name it ppc4xx-sdram-ddr2. This is mostly
> modelling the DDR2 SDRAM controller found in the 460EX (used on the
> sam460ex board). Newer SoCs (regardless of their PPC core, e.g. 405EX)
> may have this controller but we only emulate enough of it for the
> sam460ex u-boot firmware.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/ppc/ppc440.h         |   2 -
>   hw/ppc/ppc440_uc.c      | 115 +++++++++++++++++++++++++---------------
>   hw/ppc/sam460ex.c       |   7 ++-
>   include/hw/ppc/ppc4xx.h |  14 +++++
>   4 files changed, 91 insertions(+), 47 deletions(-)
> 
> diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
> index 29f6f14ed7..7c24db8504 100644
> --- a/hw/ppc/ppc440.h
> +++ b/hw/ppc/ppc440.h
> @@ -16,8 +16,6 @@
>   void ppc4xx_l2sram_init(CPUPPCState *env);
>   void ppc4xx_cpr_init(CPUPPCState *env);
>   void ppc4xx_sdr_init(CPUPPCState *env);
> -void ppc440_sdram_init(CPUPPCState *env, int nbanks,
> -                       MemoryRegion *ram);
>   void ppc4xx_ahb_init(CPUPPCState *env);
>   void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
>   void ppc460ex_pcie_init(CPUPPCState *env);
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index e77d56225d..a75a1748bd 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -483,13 +483,6 @@ void ppc4xx_sdr_init(CPUPPCState *env)
>   
>   /*****************************************************************************/
>   /* SDRAM controller */
> -typedef struct ppc440_sdram_t {
> -    uint32_t addr;
> -    uint32_t mcopt2;
> -    int nbanks; /* Banks to use from the 4, e.g. when board has less slots */
> -    Ppc4xxSdramBank bank[4];
> -} ppc440_sdram_t;
> -
>   enum {
>       SDRAM_R0BAS = 0x40,
>       SDRAM_R1BAS,
> @@ -578,7 +571,7 @@ static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
>       object_unparent(OBJECT(&bank->container));
>   }
>   
> -static void sdram_ddr2_set_bcr(ppc440_sdram_t *sdram, int i,
> +static void sdram_ddr2_set_bcr(Ppc4xxSdramDdr2State *sdram, int i,
>                                  uint32_t bcr, int enabled)
>   {
>       if (sdram->bank[i].bcr & 1) {
> @@ -596,7 +589,7 @@ static void sdram_ddr2_set_bcr(ppc440_sdram_t *sdram, int i,
>       }
>   }
>   
> -static void sdram_ddr2_map_bcr(ppc440_sdram_t *sdram)
> +static void sdram_ddr2_map_bcr(Ppc4xxSdramDdr2State *sdram)
>   {
>       int i;
>   
> @@ -611,7 +604,7 @@ static void sdram_ddr2_map_bcr(ppc440_sdram_t *sdram)
>       }
>   }
>   
> -static void sdram_ddr2_unmap_bcr(ppc440_sdram_t *sdram)
> +static void sdram_ddr2_unmap_bcr(Ppc4xxSdramDdr2State *sdram)
>   {
>       int i;
>   
> @@ -624,7 +617,7 @@ static void sdram_ddr2_unmap_bcr(ppc440_sdram_t *sdram)
>   
>   static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
>   {
> -    ppc440_sdram_t *sdram = opaque;
> +    Ppc4xxSdramDdr2State *sdram = opaque;
>       uint32_t ret = 0;
>   
>       switch (dcrn) {
> @@ -677,7 +670,7 @@ static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
>   
>   static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
>   {
> -    ppc440_sdram_t *sdram = opaque;
> +    Ppc4xxSdramDdr2State *sdram = opaque;
>   
>       switch (dcrn) {
>       case SDRAM_R0BAS:
> @@ -719,52 +712,86 @@ static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
>       }
>   }
>   
> -static void sdram_ddr2_reset(void *opaque)
> +static void ppc4xx_sdram_ddr2_reset(DeviceState *dev)
>   {
> -    ppc440_sdram_t *sdram = opaque;
> +    Ppc4xxSdramDdr2State *sdram = PPC4xx_SDRAM_DDR2(dev);
>   
>       sdram->addr = 0;
>       sdram->mcopt2 = 0;
>   }
>   
> -void ppc440_sdram_init(CPUPPCState *env, int nbanks,
> -                       MemoryRegion *ram)
> +static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
>   {
> -    ppc440_sdram_t *s;
> +    Ppc4xxSdramDdr2State *s = PPC4xx_SDRAM_DDR2(dev);
> +    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
>       const ram_addr_t valid_bank_sizes[] = {
>           4 * GiB, 2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
>           32 * MiB, 16 * MiB, 8 * MiB, 0
>       };
>   
> -    s = g_malloc0(sizeof(*s));
> -    s->nbanks = nbanks;
> -    ppc4xx_sdram_banks(ram, s->nbanks, s->bank, valid_bank_sizes);
> -    qemu_register_reset(&sdram_ddr2_reset, s);
> -    ppc_dcr_register(env, SDRAM0_CFGADDR,
> -                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc_dcr_register(env, SDRAM0_CFGDATA,
> -                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -
> -    ppc_dcr_register(env, SDRAM_R0BAS,
> -                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc_dcr_register(env, SDRAM_R1BAS,
> -                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc_dcr_register(env, SDRAM_R2BAS,
> -                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc_dcr_register(env, SDRAM_R3BAS,
> -                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc_dcr_register(env, SDRAM_CONF1HB,
> -                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc_dcr_register(env, SDRAM_PLBADDULL,
> -                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc_dcr_register(env, SDRAM_CONF1LL,
> -                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc_dcr_register(env, SDRAM_CONFPATHB,
> -                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> -    ppc_dcr_register(env, SDRAM_PLBADDUHB,
> -                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    if (s->nbanks < 1 || s->nbanks > 4) {
> +        error_setg(errp, "Invalid number of RAM banks");
> +        return;
> +    }
> +    if (!s->dram_mr) {
> +        error_setg(errp, "Missing dram memory region");
> +        return;
> +    }
> +    ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
> +
> +    ppc4xx_dcr_register(dcr, SDRAM0_CFGADDR,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM0_CFGDATA,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +
> +    ppc4xx_dcr_register(dcr, SDRAM_R0BAS,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_R1BAS,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_R2BAS,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_R3BAS,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_CONF1HB,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_PLBADDULL,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_CONF1LL,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_CONFPATHB,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +    ppc4xx_dcr_register(dcr, SDRAM_PLBADDUHB,
> +                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> +}
> +
> +static Property ppc4xx_sdram_ddr2_props[] = {
> +    DEFINE_PROP_LINK("dram", Ppc4xxSdramDdr2State, dram_mr, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_UINT32("nbanks", Ppc4xxSdramDdr2State, nbanks, 4),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc4xx_sdram_ddr2_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = ppc4xx_sdram_ddr2_realize;
> +    dc->reset = ppc4xx_sdram_ddr2_reset;
> +    /* Reason: only works as function of a ppc4xx SoC */
> +    dc->user_creatable = false;
> +    device_class_set_props(dc, ppc4xx_sdram_ddr2_props);
>   }
>   
> +static const TypeInfo ppc4xx_types[] = {
> +    {
> +        .name           = TYPE_PPC4xx_SDRAM_DDR2,
> +        .parent         = TYPE_PPC4xx_DCR_DEVICE,
> +        .instance_size  = sizeof(Ppc4xxSdramDdr2State),
> +        .class_init     = ppc4xx_sdram_ddr2_class_init,
> +    }
> +};
> +DEFINE_TYPES(ppc4xx_types)
> +
>   /*****************************************************************************/
>   /* PLB to AHB bridge */
>   enum {
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 9b850808a3..ea06b099b2 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -342,11 +342,16 @@ static void sam460ex_init(MachineState *machine)
>           error_report("Memory below 64 MiB is not supported");
>           exit(1);
>       }
> +    dev = qdev_new(TYPE_PPC4xx_SDRAM_DDR2);
> +    object_property_set_link(OBJECT(dev), "dram", OBJECT(machine->ram),
> +                             &error_abort);
>       /*
>        * Put all RAM on first bank because board has one slot
>        * and firmware only checks that
>        */
> -    ppc440_sdram_init(env, 1, machine->ram);
> +    object_property_set_int(OBJECT(dev), "nbanks", 1, &error_abort);
> +    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
> +    object_unref(OBJECT(dev));
>       /* FIXME: does 460EX have ECC interrupts? */
>       /* Enable SDRAM memory regions as we may boot without firmware */
>       if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x21) ||
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index 20d0cdde8a..7d3cfa7ad6 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -139,4 +139,18 @@ struct Ppc4xxSdramDdrState {
>       uint32_t eccesr;
>   };
>   
> +/* SDRAM DDR2 controller */
> +#define TYPE_PPC4xx_SDRAM_DDR2 "ppc4xx-sdram-ddr2"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxSdramDdr2State, PPC4xx_SDRAM_DDR2);
> +struct Ppc4xxSdramDdr2State {
> +    Ppc4xxDcrDeviceState parent_obj;
> +
> +    MemoryRegion *dram_mr;
> +    uint32_t nbanks; /* Banks to use from 4, e.g. when board has less slots */
> +    Ppc4xxSdramBank bank[4];
> +
> +    uint32_t addr;
> +    uint32_t mcopt2;
> +};
> +
>   #endif /* PPC4XX_H */


