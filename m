Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3BF35C9D6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 17:29:13 +0200 (CEST)
Received: from localhost ([::1]:59876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVyUy-0007xV-33
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 11:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lVyTE-0006tz-PT; Mon, 12 Apr 2021 11:27:24 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:34377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lVyTC-0004YT-LC; Mon, 12 Apr 2021 11:27:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0444A9999079;
 Mon, 12 Apr 2021 17:27:17 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 12 Apr
 2021 17:27:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0038c395076-8eb1-44fe-9bf7-b10b4a61e669,
 30B7ACC6D8DC628EDB1EBF85A4A81F2E60AF40AB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] aspeed: Emulate the AST2600A3
To: Joel Stanley <joel@jms.id.au>
References: <20210304124316.164742-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9c004931-648c-3215-6720-647fe35a50c7@kaod.org>
Date: Mon, 12 Apr 2021 17:27:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210304124316.164742-1-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2a61ed81-537d-495a-bacf-e697c8870768
X-Ovh-Tracer-Id: 7409828763966671779
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudekjedgkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 1:43 PM, Joel Stanley wrote:
> This is the latest revision of the ASPEED 2600 SoC.

Should we change all machines to use the new SoC ? 

I would prefer if we introduced an "ast2600-a3" Aspeed SoC, that we would 
use for the newer rainier machine, and leave the tacoma-bmc and ast2600-evb 
machines as they are.

Thanks,

C. 

> Reset values are taken from v8 of the datasheet.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  include/hw/misc/aspeed_scu.h |  2 ++
>  hw/arm/aspeed_ast2600.c      |  2 +-
>  hw/misc/aspeed_scu.c         | 32 +++++++++++++++++++++++++-------
>  3 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> index d49bfb02fbdb..c14aff2bcbb5 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -43,6 +43,8 @@ struct AspeedSCUState {
>  #define AST2500_A1_SILICON_REV   0x04010303U
>  #define AST2600_A0_SILICON_REV   0x05000303U
>  #define AST2600_A1_SILICON_REV   0x05010303U
> +#define AST2600_A2_SILICON_REV   0x05020303U
> +#define AST2600_A3_SILICON_REV   0x05030303U
>  
>  #define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) == 0x04)
>  
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index bf31ca351feb..8c42dafe8583 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -480,7 +480,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>  
>      sc->name         = "ast2600-a1";
>      sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
> -    sc->silicon_rev  = AST2600_A1_SILICON_REV;
> +    sc->silicon_rev  = AST2600_A3_SILICON_REV;
>      sc->sram_size    = 0x16400;
>      sc->spis_num     = 2;
>      sc->ehcis_num    = 2;
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 40a38ebd8549..3515d6ff6bbf 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -104,11 +104,19 @@
>  #define AST2600_SDRAM_HANDSHAKE   TO_REG(0x100)
>  #define AST2600_HPLL_PARAM        TO_REG(0x200)
>  #define AST2600_HPLL_EXT          TO_REG(0x204)
> +#define AST2600_APLL_PARAM        TO_REG(0x210)
> +#define AST2600_APLL_EXT          TO_REG(0x214)
> +#define AST2600_MPLL_PARAM        TO_REG(0x220)
>  #define AST2600_MPLL_EXT          TO_REG(0x224)
> +#define AST2600_EPLL_PARAM        TO_REG(0x240)
>  #define AST2600_EPLL_EXT          TO_REG(0x244)
> +#define AST2600_DPLL_PARAM        TO_REG(0x260)
> +#define AST2600_DPLL_EXT          TO_REG(0x264)
>  #define AST2600_CLK_SEL           TO_REG(0x300)
>  #define AST2600_CLK_SEL2          TO_REG(0x304)
> -#define AST2600_CLK_SEL3          TO_REG(0x310)
> +#define AST2600_CLK_SEL3          TO_REG(0x308)
> +#define AST2600_CLK_SEL4          TO_REG(0x310)
> +#define AST2600_CLK_SEL5          TO_REG(0x314)
>  #define AST2600_HW_STRAP1         TO_REG(0x500)
>  #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
>  #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
> @@ -433,6 +441,8 @@ static uint32_t aspeed_silicon_revs[] = {
>      AST2500_A1_SILICON_REV,
>      AST2600_A0_SILICON_REV,
>      AST2600_A1_SILICON_REV,
> +    AST2600_A2_SILICON_REV,
> +    AST2600_A3_SILICON_REV,
>  };
>  
>  bool is_supported_silicon_rev(uint32_t silicon_rev)
> @@ -651,16 +661,24 @@ static const MemoryRegionOps aspeed_ast2600_scu_ops = {
>      .valid.unaligned = false,
>  };
>  
> -static const uint32_t ast2600_a1_resets[ASPEED_AST2600_SCU_NR_REGS] = {
> +static const uint32_t ast2600_a3_resets[ASPEED_AST2600_SCU_NR_REGS] = {
>      [AST2600_SYS_RST_CTRL]      = 0xF7C3FED8,
> -    [AST2600_SYS_RST_CTRL2]     = 0xFFFFFFFC,
> +    [AST2600_SYS_RST_CTRL2]     = 0x0DFFFFFC,
>      [AST2600_CLK_STOP_CTRL]     = 0xFFFF7F8A,
>      [AST2600_CLK_STOP_CTRL2]    = 0xFFF0FFF0,
>      [AST2600_SDRAM_HANDSHAKE]   = 0x00000000,
> -    [AST2600_HPLL_PARAM]        = 0x1000405F,
> +    [AST2600_HPLL_PARAM]        = 0x1000408F,
> +    [AST2600_APLL_PARAM]        = 0x1000405F,
> +    [AST2600_MPLL_PARAM]        = 0x1008405F,
> +    [AST2600_EPLL_PARAM]        = 0x1004077F,
> +    [AST2600_DPLL_PARAM]        = 0x1078405F,
> +    [AST2600_CLK_SEL]           = 0xF3940000,
> +    [AST2600_CLK_SEL2]          = 0x00700000,
> +    [AST2600_CLK_SEL3]          = 0x00000000,
> +    [AST2600_CLK_SEL4]          = 0xF3F40000,
> +    [AST2600_CLK_SEL5]          = 0x30000000,
>      [AST2600_CHIP_ID0]          = 0x1234ABCD,
>      [AST2600_CHIP_ID1]          = 0x88884444,
> -
>  };
>  
>  static void aspeed_ast2600_scu_reset(DeviceState *dev)
> @@ -675,7 +693,7 @@ static void aspeed_ast2600_scu_reset(DeviceState *dev)
>       * of actual revision. QEMU and Linux only support A1 onwards so this is
>       * sufficient.
>       */
> -    s->regs[AST2600_SILICON_REV] = AST2600_A1_SILICON_REV;
> +    s->regs[AST2600_SILICON_REV] = AST2600_A3_SILICON_REV;
>      s->regs[AST2600_SILICON_REV2] = s->silicon_rev;
>      s->regs[AST2600_HW_STRAP1] = s->hw_strap1;
>      s->regs[AST2600_HW_STRAP2] = s->hw_strap2;
> @@ -689,7 +707,7 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
>  
>      dc->desc = "ASPEED 2600 System Control Unit";
>      dc->reset = aspeed_ast2600_scu_reset;
> -    asc->resets = ast2600_a1_resets;
> +    asc->resets = ast2600_a3_resets;
>      asc->calc_hpll = aspeed_2500_scu_calc_hpll; /* No change since AST2500 */
>      asc->apb_divider = 4;
>      asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
> 


