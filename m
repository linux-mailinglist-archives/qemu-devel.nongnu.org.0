Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B343FA47E
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 10:21:30 +0200 (CEST)
Received: from localhost ([::1]:43504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJtaj-0008Iv-1K
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 04:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mJtZK-0006q8-W1
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 04:20:03 -0400
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:54986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mJtZI-0001se-Ta
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 04:20:02 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id A28E52939D7;
 Sat, 28 Aug 2021 10:19:57 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sat, 28 Aug
 2021 10:19:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004e0006336-e6ab-4601-8eaf-146fa71e4dd2,
 6CE952B1E590FC391734534FA2C2FCCDA042449D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.199.102.86
Subject: Re: [PATCH 5/5] hw/arm/aspeed: Initialize AST2600 clock selection
 registers
To: <pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-6-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5a4f8d61-d740-cae0-9920-e9a4029a6856@kaod.org>
Date: Sat, 28 Aug 2021 10:19:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827210417.4022054-6-pdel@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0df01f8d-6fa7-4ab5-9128-a8e5ab944f8a
X-Ovh-Tracer-Id: 17414575337671592928
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudduhedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehuedtheeghfdvhedtueelteegvdefueektdefiefhffffieduuddtudfhgfevtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.437,
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
Cc: qemu-arm@nongnu.org, joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/21 11:04 PM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> UART5 is typically used as the default debug UART on the AST2600, but
> UART1 is also designed to be a debug UART. All the AST2600 UART's have
> semi-configurable clock rates through registers in the System Control
> Unit (SCU), but only UART5 works out of the box with zero-initialized
> values. The rest of the UART's expect a few of the registers to be
> initialized to non-zero values, or else the clock rate calculation will
> yield zero or undefined (due to a divide-by-zero).
>
> For reference, the U-Boot clock rate driver here shows the calculation:
> 
>     https://github.com/facebook/openbmc-uboot/blob/main/drivers/clk/aspeed/clk_ast2600.c#L357)
> 
> To summarize, UART5 allows selection from 4 rates: 24 MHz, 192 MHz, 24 /
> 13 MHz, and 192 / 13 MHz. The other UART's allow selecting either the
> "low" rate (UARTCLK) or the "high" rate (HUARTCLK). UARTCLK and HUARTCLK
> are configurable themselves:
> 
>     UARTCLK = UXCLK * R / (N * 2)
>     HUARTCLK = HUXCLK * HR / (HN * 2)
> 
> UXCLK and HUXCLK are also configurable, and depend on the APLL and/or
> HPLL clock rates, which also derive from complicated calculations. Long
> story short, there's lots of multiplication and division from
> configurable registers, and most of these registers are zero-initialized
> in QEMU, which at best is unexpected and at worst causes this clock rate
> driver to hang from divide-by-zero's. This can also be difficult to
> diagnose, because it may cause U-Boot to hang before serial console
> initialization completes, requiring intervention from gdb.
> 
> This change just initializes all of these registers with default values
> from the datasheet.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/misc/aspeed_scu.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index c373e678f0..d51fe8564d 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -104,11 +104,16 @@
>  #define AST2600_SDRAM_HANDSHAKE   TO_REG(0x100)
>  #define AST2600_HPLL_PARAM        TO_REG(0x200)
>  #define AST2600_HPLL_EXT          TO_REG(0x204)
> +#define AST2600_APLL_PARAM        TO_REG(0x210)
>  #define AST2600_MPLL_EXT          TO_REG(0x224)
>  #define AST2600_EPLL_EXT          TO_REG(0x244)
>  #define AST2600_CLK_SEL           TO_REG(0x300)
>  #define AST2600_CLK_SEL2          TO_REG(0x304)
>  #define AST2600_CLK_SEL3          TO_REG(0x308)
> +#define AST2600_CLK_SEL4          TO_REG(0x310)
> +#define AST2600_CLK_SEL5          TO_REG(0x314)
> +#define AST2600_UARTCLK_PARAM     TO_REG(0x338)
> +#define AST2600_HUARTCLK_PARAM    TO_REG(0x33C)
>  #define AST2600_HW_STRAP1         TO_REG(0x500)
>  #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
>  #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
> @@ -658,9 +663,15 @@ static const uint32_t ast2600_a1_resets[ASPEED_AST2600_SCU_NR_REGS] = {
>      [AST2600_CLK_STOP_CTRL2]    = 0xFFF0FFF0,
>      [AST2600_SDRAM_HANDSHAKE]   = 0x00000000,
>      [AST2600_HPLL_PARAM]        = 0x1000405F,
> +    [AST2600_APLL_PARAM]        = 0x1000405F,
>      [AST2600_CHIP_ID0]          = 0x1234ABCD,
>      [AST2600_CHIP_ID1]          = 0x88884444,
> -
> +    [AST2600_CLK_SEL2]          = 0x00700000,
> +    [AST2600_CLK_SEL3]          = 0x00000000,
> +    [AST2600_CLK_SEL4]          = 0xF3F40000,
> +    [AST2600_CLK_SEL5]          = 0x30000000,
> +    [AST2600_UARTCLK_PARAM]     = 0x00014506,
> +    [AST2600_HUARTCLK_PARAM]    = 0x000145C0,
>  };
>  
>  static void aspeed_ast2600_scu_reset(DeviceState *dev)
> 

Some parts have been already covered by the A3 emulation changes 
provided by Joel. I will merge the UART registers only.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


