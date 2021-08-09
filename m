Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B563E4952
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 17:56:41 +0200 (CEST)
Received: from localhost ([::1]:43338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD7do-0003M9-Hk
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 11:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD7cr-0002B8-6i; Mon, 09 Aug 2021 11:55:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD7cp-0001kn-Kg; Mon, 09 Aug 2021 11:55:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id z4so22119509wrv.11;
 Mon, 09 Aug 2021 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FZ9lCCZF3xP8RXLcSvof1xt1odnHTPoLFE4m74RpMc4=;
 b=bO0OFflD6GJabneN56xdDJ8rHJvDqqZnooy4NJovJrKSt10Fe1ksp8kcr4ZGrGAUAD
 /JZ7qcUdCWDeH++S9AV9AFkA2svwZvBOMCawuUaTBlLQFo3729LshyLeQam/oo1BHIUS
 ie90oB8UqYi1YjWCz3PaSradGuz3QRIPdBnOZuliFLe7CUsWVgQJHlxHtDjSqwGHNhhe
 O7oDbko0q8yFNd/1mOSREvvg0nokhMpevgUyQ1d7geuauGc+HSQiJPIXOGeHPTQfzCpw
 UJGeRV1K6uqmOuWYRLQiiXXiHnTqRDvw5LTqaXaLfRO9WquJsPmdC0HlJyWJi9Yw5oSw
 sJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FZ9lCCZF3xP8RXLcSvof1xt1odnHTPoLFE4m74RpMc4=;
 b=coiTZzPRfnDMcgaZ7tWbgIkCz0Cx1iAj+AMt7VnAkGP2XviEPmBvQWEdhp44uSQxIj
 MeM6aIR9ot8odJxo+zKIy2sJ3HYQYgG2g+Z38BbuwinZWDcG/ixWme0VuqZfQsI3Sl/I
 mK2DgmU2EWErjzf1FPp4SanxtR3j9NwjlN8mzfYIWpt8KJiYfnXuavSJZAGSOa3At9R+
 /CeQ86d6LKv9lYh/5uNBMX/qvQsuyePSCORtj8Ks4Qdq7PL46hXFNz+I4IGYZ9SvdcwS
 ND1/HDmUNLLwmJnjLHivmIQ6jcW1PKYFDOt0jVVnBUOkOM6asqOOtjcPQvsZuNuf2Oax
 y5hA==
X-Gm-Message-State: AOAM532Jr96a/JbTrsSpswTOjOvz9wIIywMM8Eu5EQmkOb84pSTGxI1W
 oOzVkkfnNb/DzY267adYP8Tt3cU2AyE=
X-Google-Smtp-Source: ABdhPJyuyYG+oN20gsUrvfngbkZCYDzdeb+zq9QkGQR3o7qFeOd3h9a80JSW8C+xTVO4a1Ba8RYNZw==
X-Received: by 2002:a5d:4521:: with SMTP id j1mr24837388wra.44.1628524537497; 
 Mon, 09 Aug 2021 08:55:37 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l9sm5720208wrt.95.2021.08.09.08.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 08:55:36 -0700 (PDT)
Subject: Re: [PATCH 08/10] aspeed: Emulate the AST2600A3
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210809131556.686260-1-clg@kaod.org>
 <20210809131556.686260-9-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d41fddce-4c87-5356-faf0-762f9f4fd32b@amsat.org>
Date: Mon, 9 Aug 2021 17:55:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809131556.686260-9-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 3:15 PM, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> This is the latest revision of the ASPEED 2600 SoC. As there is no
> need to model multiple revisions of the same SoC for the moment,
> update the SCU AST2600 to model the A3 revision instead of the A1 and
> adapt the AST2600 SoC and machines.
> 
> Reset values are taken from v8 of the datasheet.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [ clg: - Introduced an Aspeed "ast2600-a3" SoC class
>        - Commit log update ]
> Message-Id: <20210407171637.777743-21-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Message-Id: <20210629142336.750058-3-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/misc/aspeed_scu.h |  2 ++
>  hw/arm/aspeed.c              |  6 +++---
>  hw/arm/aspeed_ast2600.c      |  6 +++---
>  hw/misc/aspeed_scu.c         | 36 +++++++++++++++++++++++++++++-------
>  4 files changed, 37 insertions(+), 13 deletions(-)

> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 40a38ebd8549..05edebedeb46 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -101,14 +101,24 @@
>  #define AST2600_CLK_STOP_CTRL_CLR TO_REG(0x84)
>  #define AST2600_CLK_STOP_CTRL2     TO_REG(0x90)
>  #define AST2600_CLK_STOP_CTRL2_CLR TO_REG(0x94)
> +#define AST2600_DEBUG_CTRL        TO_REG(0xC8)
> +#define AST2600_DEBUG_CTRL2       TO_REG(0xD8)
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

Is it a bugfix? Otherwise this is annoying.

Maybe:

 #define AST2600A1_CLK_SEL3          TO_REG(0x310)
 #define AST2600A3_CLK_SEL3          TO_REG(0x308)

and...

> +#define AST2600_CLK_SEL4          TO_REG(0x310)
> +#define AST2600_CLK_SEL5          TO_REG(0x314)
>  #define AST2600_HW_STRAP1         TO_REG(0x500)
>  #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
>  #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
> @@ -433,6 +443,8 @@ static uint32_t aspeed_silicon_revs[] = {
>      AST2500_A1_SILICON_REV,
>      AST2600_A0_SILICON_REV,
>      AST2600_A1_SILICON_REV,
> +    AST2600_A2_SILICON_REV,
> +    AST2600_A3_SILICON_REV,
>  };
>  
>  bool is_supported_silicon_rev(uint32_t silicon_rev)
> @@ -651,16 +663,26 @@ static const MemoryRegionOps aspeed_ast2600_scu_ops = {
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
> +    [AST2600_DEBUG_CTRL]        = 0x00000FFF,
> +    [AST2600_DEBUG_CTRL2]       = 0x000000FF,
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

... use AST2600A3_CLK_SEL3 here?

So someone wanting the emulate the A1 doesn't get
the nasty bug of having CLK_SEL3 misplaced.

> +    [AST2600_CLK_SEL4]          = 0xF3F40000,
> +    [AST2600_CLK_SEL5]          = 0x30000000,
>      [AST2600_CHIP_ID0]          = 0x1234ABCD,
>      [AST2600_CHIP_ID1]          = 0x88884444,
> -
>  };

