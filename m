Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2684E4DD3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 09:10:40 +0100 (CET)
Received: from localhost ([::1]:59824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWw4l-00085L-NL
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 04:10:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWw1S-0006DW-0T
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 04:07:14 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:59057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWw1P-0004fi-Oj
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 04:07:13 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 33810EE3292C;
 Wed, 23 Mar 2022 09:07:09 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 23 Mar
 2022 09:07:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001e5f199b1-21b7-407d-9bd5-20564261d9db,
 6259E11BD0CF39FA32E4FBD571F84D370B3A9A5D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f2101faa-3b58-ad8a-5bdc-9476ad7e1c99@kaod.org>
Date: Wed, 23 Mar 2022 09:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 6/9] aspeed/scu: Add AST1030 support
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
 <20220322025154.3989-7-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220322025154.3989-7-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6421c46e-305e-47ed-8848-0b0e4b1952a8
X-Ovh-Tracer-Id: 15360933904224848827
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudegiedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 03:51, Jamin Lin wrote:
> From: Steven Lee <steven_lee@aspeedtech.com>
> 
> Per ast1030_v07.pdf, AST1030 SOC doesn't have SCU300, the pclk divider
> selection is defined in SCU310[11:8].
> Add a get_apb_freq function and a class init handler for ast1030.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/misc/aspeed_scu.c         | 63 ++++++++++++++++++++++++++++++++++++
>   include/hw/misc/aspeed_scu.h | 24 ++++++++++++++
>   2 files changed, 87 insertions(+)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 150567f98a..19b03471fc 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -235,6 +235,15 @@ static uint32_t aspeed_2600_scu_get_apb_freq(AspeedSCUState *s)
>           / asc->apb_divider;
>   }
>   
> +static uint32_t aspeed_1030_scu_get_apb_freq(AspeedSCUState *s)
> +{
> +    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
> +    uint32_t hpll = asc->calc_hpll(s, s->regs[AST2600_HPLL_PARAM]);
> +
> +    return hpll / (SCU_AST1030_CLK_GET_PCLK_DIV(s->regs[AST2600_CLK_SEL4]) + 1)
> +        / asc->apb_divider;
> +}
> +
>   static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
>   {
>       AspeedSCUState *s = ASPEED_SCU(opaque);
> @@ -482,6 +491,8 @@ static uint32_t aspeed_silicon_revs[] = {
>       AST2600_A1_SILICON_REV,
>       AST2600_A2_SILICON_REV,
>       AST2600_A3_SILICON_REV,
> +    AST1030_A0_SILICON_REV,
> +    AST1030_A1_SILICON_REV,
>   };
>   
>   bool is_supported_silicon_rev(uint32_t silicon_rev)
> @@ -770,12 +781,64 @@ static const TypeInfo aspeed_2600_scu_info = {
>       .class_init = aspeed_2600_scu_class_init,
>   };
>   
> +static const uint32_t ast1030_a1_resets[ASPEED_AST2600_SCU_NR_REGS] = {
> +    [AST2600_SYS_RST_CTRL]      = 0xFFC3FED8,
> +    [AST2600_SYS_RST_CTRL2]     = 0x09FFFFFC,
> +    [AST2600_CLK_STOP_CTRL]     = 0xFFFF7F8A,
> +    [AST2600_CLK_STOP_CTRL2]    = 0xFFF0FFF0,
> +    [AST2600_DEBUG_CTRL2]       = 0x00000000,
> +    [AST2600_HPLL_PARAM]        = 0x10004077,
> +    [AST2600_HPLL_EXT]          = 0x00000031,
> +    [AST2600_CLK_SEL4]          = 0x43F90900,
> +    [AST2600_CLK_SEL5]          = 0x40000000,
> +    [AST2600_CHIP_ID0]          = 0xDEADBEEF,
> +    [AST2600_CHIP_ID1]          = 0x0BADCAFE,
> +};
> +
> +static void aspeed_ast1030_scu_reset(DeviceState *dev)
> +{
> +    AspeedSCUState *s = ASPEED_SCU(dev);
> +    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(dev);
> +
> +    memcpy(s->regs, asc->resets, asc->nr_regs * 4);
> +
> +    s->regs[AST2600_SILICON_REV] = AST1030_A1_SILICON_REV;
> +    s->regs[AST2600_SILICON_REV2] = s->silicon_rev;
> +    s->regs[AST2600_HW_STRAP1] = s->hw_strap1;
> +    s->regs[AST2600_HW_STRAP2] = s->hw_strap2;
> +    s->regs[PROT_KEY] = s->hw_prot_key;
> +}
> +
> +static void aspeed_1030_scu_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedSCUClass *asc = ASPEED_SCU_CLASS(klass);
> +
> +    dc->desc = "ASPEED 1030 System Control Unit";
> +    dc->reset = aspeed_ast1030_scu_reset;
> +    asc->resets = ast1030_a1_resets;
> +    asc->calc_hpll = aspeed_2600_scu_calc_hpll;
> +    asc->get_apb = aspeed_1030_scu_get_apb_freq;
> +    asc->apb_divider = 2;
> +    asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
> +    asc->clkin_25Mhz = true;
> +    asc->ops = &aspeed_ast2600_scu_ops;
> +}
> +
> +static const TypeInfo aspeed_1030_scu_info = {
> +    .name = TYPE_ASPEED_1030_SCU,
> +    .parent = TYPE_ASPEED_SCU,
> +    .instance_size = sizeof(AspeedSCUState),
> +    .class_init = aspeed_1030_scu_class_init,
> +};
> +
>   static void aspeed_scu_register_types(void)
>   {
>       type_register_static(&aspeed_scu_info);
>       type_register_static(&aspeed_2400_scu_info);
>       type_register_static(&aspeed_2500_scu_info);
>       type_register_static(&aspeed_2600_scu_info);
> +    type_register_static(&aspeed_1030_scu_info);
>   }
>   
>   type_init(aspeed_scu_register_types);
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> index fdc721846c..d2c485c8f6 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -19,6 +19,7 @@ OBJECT_DECLARE_TYPE(AspeedSCUState, AspeedSCUClass, ASPEED_SCU)
>   #define TYPE_ASPEED_2400_SCU TYPE_ASPEED_SCU "-ast2400"
>   #define TYPE_ASPEED_2500_SCU TYPE_ASPEED_SCU "-ast2500"
>   #define TYPE_ASPEED_2600_SCU TYPE_ASPEED_SCU "-ast2600"
> +#define TYPE_ASPEED_1030_SCU TYPE_ASPEED_SCU "-ast1030"
>   
>   #define ASPEED_SCU_NR_REGS (0x1A8 >> 2)
>   #define ASPEED_AST2600_SCU_NR_REGS (0xE20 >> 2)
> @@ -45,6 +46,8 @@ struct AspeedSCUState {
>   #define AST2600_A1_SILICON_REV   0x05010303U
>   #define AST2600_A2_SILICON_REV   0x05020303U
>   #define AST2600_A3_SILICON_REV   0x05030303U
> +#define AST1030_A0_SILICON_REV   0x80000000U
> +#define AST1030_A1_SILICON_REV   0x80010000U
>   
>   #define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) == 0x04)
>   
> @@ -335,4 +338,25 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
>   #define SCU_AST2600_H_PLL_BYPASS_EN                        (0x1 << 24)
>   #define SCU_AST2600_H_PLL_OFF                              (0x1 << 23)
>   
> +/* SCU310   Clock Selection Register Set 4 (for Aspeed AST1030 SOC)
> + *
> + *  31     I3C Clock Source selection
> + *  30:28  I3C clock divider selection
> + *  26:24  MAC AHB clock divider selection
> + *  22:20  RGMII 125MHz clock divider ration
> + *  19:16  RGMII 50MHz clock divider ration
> + *  15     LHCLK clock generation/output enable control
> + *  14:12  LHCLK divider selection
> + *  11:8   APB Bus PCLK divider selection
> + *  7      Select PECI clock source
> + *  6      Select UART debug port clock source
> + *  5      Select UART6 clock source
> + *  4      Select UART5 clock source
> + *  3      Select UART4 clock source
> + *  2      Select UART3 clock source
> + *  1      Select UART2 clock source
> + *  0      Select UART1 clock source
> + */
> +#define SCU_AST1030_CLK_GET_PCLK_DIV(x)                    (((x) >> 8) & 0xf)
> +
>   #endif /* ASPEED_SCU_H */


