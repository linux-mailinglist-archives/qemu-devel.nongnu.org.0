Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF13A4EDE38
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 18:03:17 +0200 (CEST)
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZxGV-0007aV-SR
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 12:03:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nZxDP-0004VC-C1
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 12:00:03 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:56361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nZxDM-0005s8-RI
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 12:00:02 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.27])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3AD52247A0;
 Thu, 31 Mar 2022 15:59:56 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 17:59:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00655fd99f5-3884-4626-beca-aaa6a1eb2adf,
 FC9088D273F6636B0CAAD4892A2C3D02B7ACC8E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fe9ec82c-16df-dfca-4dd6-999a98fe36bf@kaod.org>
Date: Thu, 31 Mar 2022 17:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/9] aspeed/smc: Add AST1030 support
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220331081545.7140-1-jamin_lin@aspeedtech.com>
 <20220331081545.7140-3-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220331081545.7140-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 074ffeaa-6bdf-4e34-9323-f931021202e7
X-Ovh-Tracer-Id: 14986853663541922747
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Jamin,

On 3/31/22 10:15, Jamin Lin wrote:
> From: Steven Lee <steven_lee@aspeedtech.com>
> 
> AST1030 spi controller's address decoding unit is 1MB that is identical
> to ast2600, but fmc address decoding unit is 512kb.
> Introduce seg_to_reg and reg_to_seg handlers for ast1030 fmc controller.
> In addition, add ast1030 fmc, spi1, and spi2 class init handler.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

I did a review of this patch, anyhow

Reviewed-by: Cédric Le Goater <clg@kaod.org>

but please drop the ASPEED_SMC_FEATURE_WDT_CONTROL flag which is not
upstream.

Thanks,

C.


> ---
>   hw/ssi/aspeed_smc.c | 160 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 160 insertions(+)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 48305e1574..81af783729 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -1696,6 +1696,163 @@ static const TypeInfo aspeed_2600_spi2_info = {
>       .class_init = aspeed_2600_spi2_class_init,
>   };
>   
> +/*
> + * The FMC Segment Registers of the AST1030 have a 512KB unit.
> + * Only bits [27:19] are used for decoding.
> + */
> +#define AST1030_SEG_ADDR_MASK 0x0ff80000
> +
> +static uint32_t aspeed_1030_smc_segment_to_reg(const AspeedSMCState *s,
> +        const AspeedSegments *seg)
> +{
> +    uint32_t reg = 0;
> +
> +    /* Disabled segments have a nil register */
> +    if (!seg->size) {
> +        return 0;
> +    }
> +
> +    reg |= (seg->addr & AST1030_SEG_ADDR_MASK) >> 16; /* start offset */
> +    reg |= (seg->addr + seg->size - 1) & AST1030_SEG_ADDR_MASK; /* end offset */
> +    return reg;
> +}
> +
> +static void aspeed_1030_smc_reg_to_segment(const AspeedSMCState *s,
> +        uint32_t reg, AspeedSegments *seg)
> +{
> +    uint32_t start_offset = (reg << 16) & AST1030_SEG_ADDR_MASK;
> +    uint32_t end_offset = reg & AST1030_SEG_ADDR_MASK;
> +    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
> +
> +    if (reg) {
> +        seg->addr = asc->flash_window_base + start_offset;
> +        seg->size = end_offset + (512 * KiB) - start_offset;
> +    } else {
> +        seg->addr = asc->flash_window_base;
> +        seg->size = 0;
> +    }
> +}
> +
> +static const uint32_t aspeed_1030_fmc_resets[ASPEED_SMC_R_MAX] = {
> +    [R_CONF] = (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0 |
> +                            CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1),
> +};
> +
> +static const AspeedSegments aspeed_1030_fmc_segments[] = {
> +    { 0x0, 128 * MiB }, /* start address is readonly */
> +    { 128 * MiB, 128 * MiB }, /* default is disabled but needed for -kernel */
> +    { 0x0, 0 }, /* disabled */
> +};
> +
> +static void aspeed_1030_fmc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
> +
> +    dc->desc               = "Aspeed 1030 FMC Controller";
> +    asc->r_conf            = R_CONF;
> +    asc->r_ce_ctrl         = R_CE_CTRL;
> +    asc->r_ctrl0           = R_CTRL0;
> +    asc->r_timings         = R_TIMINGS;
> +    asc->nregs_timings     = 2;
> +    asc->conf_enable_w0    = CONF_ENABLE_W0;
> +    asc->cs_num_max        = 2;
> +    asc->segments          = aspeed_1030_fmc_segments;
> +    asc->segment_addr_mask = 0x0ff80ff8;
> +    asc->resets            = aspeed_1030_fmc_resets;
> +    asc->flash_window_base = 0x80000000;
> +    asc->flash_window_size = 0x10000000;
> +    asc->features          = ASPEED_SMC_FEATURE_DMA |
> +                             ASPEED_SMC_FEATURE_WDT_CONTROL;
> +    asc->dma_flash_mask    = 0x0FFFFFFC;
> +    asc->dma_dram_mask     = 0x000BFFFC;
> +    asc->nregs             = ASPEED_SMC_R_MAX;
> +    asc->segment_to_reg    = aspeed_1030_smc_segment_to_reg;
> +    asc->reg_to_segment    = aspeed_1030_smc_reg_to_segment;
> +    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +}
> +
> +static const TypeInfo aspeed_1030_fmc_info = {
> +    .name =  "aspeed.fmc-ast1030",
> +    .parent = TYPE_ASPEED_SMC,
> +    .class_init = aspeed_1030_fmc_class_init,
> +};
> +
> +static const AspeedSegments aspeed_1030_spi1_segments[] = {
> +    { 0x0, 128 * MiB }, /* start address is readonly */
> +    { 0x0, 0 }, /* disabled */
> +};
> +
> +static void aspeed_1030_spi1_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
> +
> +    dc->desc               = "Aspeed 1030 SPI1 Controller";
> +    asc->r_conf            = R_CONF;
> +    asc->r_ce_ctrl         = R_CE_CTRL;
> +    asc->r_ctrl0           = R_CTRL0;
> +    asc->r_timings         = R_TIMINGS;
> +    asc->nregs_timings     = 2;
> +    asc->conf_enable_w0    = CONF_ENABLE_W0;
> +    asc->cs_num_max        = 2;
> +    asc->segments          = aspeed_1030_spi1_segments;
> +    asc->segment_addr_mask = 0x0ff00ff0;
> +    asc->flash_window_base = 0x90000000;
> +    asc->flash_window_size = 0x10000000;
> +    asc->features          = ASPEED_SMC_FEATURE_DMA |
> +                             ASPEED_SMC_FEATURE_WDT_CONTROL;
> +    asc->dma_flash_mask    = 0x0FFFFFFC;
> +    asc->dma_dram_mask     = 0x000BFFFC;
> +    asc->nregs             = ASPEED_SMC_R_MAX;
> +    asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
> +    asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
> +    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +}
> +
> +static const TypeInfo aspeed_1030_spi1_info = {
> +    .name =  "aspeed.spi1-ast1030",
> +    .parent = TYPE_ASPEED_SMC,
> +    .class_init = aspeed_1030_spi1_class_init,
> +};
> +static const AspeedSegments aspeed_1030_spi2_segments[] = {
> +    { 0x0, 128 * MiB }, /* start address is readonly */
> +    { 0x0, 0 }, /* disabled */
> +};
> +
> +static void aspeed_1030_spi2_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
> +
> +    dc->desc               = "Aspeed 1030 SPI2 Controller";
> +    asc->r_conf            = R_CONF;
> +    asc->r_ce_ctrl         = R_CE_CTRL;
> +    asc->r_ctrl0           = R_CTRL0;
> +    asc->r_timings         = R_TIMINGS;
> +    asc->nregs_timings     = 2;
> +    asc->conf_enable_w0    = CONF_ENABLE_W0;
> +    asc->cs_num_max        = 2;
> +    asc->segments          = aspeed_1030_spi2_segments;
> +    asc->segment_addr_mask = 0x0ff00ff0;
> +    asc->flash_window_base = 0xb0000000;
> +    asc->flash_window_size = 0x10000000;
> +    asc->features          = ASPEED_SMC_FEATURE_DMA |
> +                             ASPEED_SMC_FEATURE_WDT_CONTROL;
> +    asc->dma_flash_mask    = 0x0FFFFFFC;
> +    asc->dma_dram_mask     = 0x000BFFFC;
> +    asc->nregs             = ASPEED_SMC_R_MAX;
> +    asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
> +    asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
> +    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +}
> +
> +static const TypeInfo aspeed_1030_spi2_info = {
> +    .name =  "aspeed.spi2-ast1030",
> +    .parent = TYPE_ASPEED_SMC,
> +    .class_init = aspeed_1030_spi2_class_init,
> +};
> +
>   static void aspeed_smc_register_types(void)
>   {
>       type_register_static(&aspeed_smc_flash_info);
> @@ -1709,6 +1866,9 @@ static void aspeed_smc_register_types(void)
>       type_register_static(&aspeed_2600_fmc_info);
>       type_register_static(&aspeed_2600_spi1_info);
>       type_register_static(&aspeed_2600_spi2_info);
> +    type_register_static(&aspeed_1030_fmc_info);
> +    type_register_static(&aspeed_1030_spi1_info);
> +    type_register_static(&aspeed_1030_spi2_info);
>   }
>   
>   type_init(aspeed_smc_register_types)


