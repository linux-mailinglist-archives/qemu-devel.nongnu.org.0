Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E46591B1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 21:44:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAzjv-00024G-QD; Thu, 29 Dec 2022 15:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzjt-00021s-Js; Thu, 29 Dec 2022 15:42:57 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzjs-0003lo-3u; Thu, 29 Dec 2022 15:42:57 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D9445C0056;
 Thu, 29 Dec 2022 15:42:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 29 Dec 2022 15:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672346574; x=
 1672432974; bh=HBu7xmxCt+7VOIuxzAq79bW4ajMwIqXK7XCeCDT5B2I=; b=E
 YZH6QhKObOdDEENCF14zqyZGDT84YK+dw6REzeiBA8tItprFxcnDZ2JEwGWQ3B9g
 3iqiQYHNndNI3GbKtG2+TNX3xI5GdXnDMiYc99Z/JmCL6ysQCsw/5E+2HON1ezOB
 xc85EwRTO0wfZ7Lnvq7UaTSLpyTfqhxohu628Oj1oVVH5HaF7lLFsDDmnPi2r75r
 9byDwfO2aVu1f6msjJyhkCpl6K5bb8BkYpf6G/gxlXxPrAahpv2CiA6LMe2vOiUY
 tgzWSNfrYnUqfltSuV9edAt9LV8pkkAwkpSDn+kOblWEU2xaX5UogVhdSE8oTgMU
 jt/FwP8E81YYH0C/6WzYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672346574; x=
 1672432974; bh=HBu7xmxCt+7VOIuxzAq79bW4ajMwIqXK7XCeCDT5B2I=; b=I
 Xqa0R3WrBKxl/q363Kf4+NAk0B2yjEoEObQ8Em1FTe4pgNM8fST3r8JDgHOlxIuY
 YEKpvfEPclwxb08NVSJL0FiZOF89bRLJpJB4oN1IXCxQRZJxBS6/jr43RhJg0nWc
 V7bYc/DwbuYWGNvol7evB+85TpfFvb1m+EIi2jBKtIPngjqlJlfyNlIcP7xbJtMW
 Vk/0+lOiUopUwLSdnBT3Ul+XgkCvCzzPBhZikCXEFqlu1kFcV6DTL2qrLGvKDXPm
 fzdvvA4a5tEeAcMO4t5FpU+0sehR+YrJbf2ObN8+rE5Hux77SA5A5LYVelyWo7xV
 ucIr5gR8H1DxuC/swY2RQ==
X-ME-Sender: <xms:zvutY-ascshxva1u6fIFNpjGX6XCCepRgueJF_wQdhC2i4AWMXJAOw>
 <xme:zvutYxZeKICtZFEmOvvrcyzQk67jtx1sbU5ZnE_JB-oF6CWgffgHldYb7dda542Wz
 yT1spE3oR2egcxw02g>
X-ME-Received: <xmr:zvutY48rYJ2luKUPKZgcpYluWeonHg9oRZB0n3ghFK7CvYf-KRX3BFvto5pr_DUmRVsBwrk-3_YkQySIXA4Ymw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:zvutYwpyzNcJDI4oB8k3jIZHeNI_EpWBElzTrVPe8BRNtEGOexAilg>
 <xmx:zvutY5pO_Zl-KM4UP4WjR-2IJ25JEx-c7RXNnNCihgmlkivxjmjYuw>
 <xmx:zvutY-RvV6iHNt0-IpS2MrhWcdQfSByAfQUmRNuDFAfEqnc3o93VAQ>
 <xmx:zvutY64GcuyBCOeE3SKWj_QNB1S5F-3pT1h-FBWNF2I_5wAidjVsgQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 15:42:52 -0500 (EST)
Date: Thu, 29 Dec 2022 12:42:50 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 2/9] hw/arm/aspeed: Use the IEC binary prefix definitions
Message-ID: <Y637ygvJH5ge7rYY@pdel-mbp.dhcp.thefacebook.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221229152325.32041-3-philmd@linaro.org>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=peter@pjd.dev;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 29, 2022 at 04:23:18PM +0100, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.

Oh, yeah, another good idea.

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/aspeed_ast10x0.c | 3 ++-
>  hw/arm/aspeed_ast2600.c | 3 ++-
>  hw/arm/aspeed_soc.c     | 4 ++--
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 122b3fd3f3..3500294df7 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
> @@ -348,7 +349,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>      sc->name = "ast1030-a1";
>      sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
>      sc->silicon_rev = AST1030_A1_SILICON_REV;
> -    sc->sram_size = 0xc0000;
> +    sc->sram_size = 768 * KiB;
>      sc->spis_num = 2;
>      sc->ehcis_num = 0;
>      sc->wdts_num = 4;
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index a79e05ddbd..72df72a540 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/arm/aspeed_soc.h"
> @@ -619,7 +620,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>      sc->name         = "ast2600-a3";
>      sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
>      sc->silicon_rev  = AST2600_A3_SILICON_REV;
> -    sc->sram_size    = 0x16400;
> +    sc->sram_size    = 89 * KiB;
>      sc->spis_num     = 2;
>      sc->ehcis_num    = 2;
>      sc->wdts_num     = 4;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 2c0924d311..677342c9ed 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -517,7 +517,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>      sc->name         = "ast2400-a1";
>      sc->cpu_type     = ARM_CPU_TYPE_NAME("arm926");
>      sc->silicon_rev  = AST2400_A1_SILICON_REV;
> -    sc->sram_size    = 0x8000;
> +    sc->sram_size    = 32 * KiB;
>      sc->spis_num     = 1;
>      sc->ehcis_num    = 1;
>      sc->wdts_num     = 2;
> @@ -544,7 +544,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>      sc->name         = "ast2500-a1";
>      sc->cpu_type     = ARM_CPU_TYPE_NAME("arm1176");
>      sc->silicon_rev  = AST2500_A1_SILICON_REV;
> -    sc->sram_size    = 0x9000;
> +    sc->sram_size    = 36 * KiB;
>      sc->spis_num     = 2;
>      sc->ehcis_num    = 2;
>      sc->wdts_num     = 3;
> -- 
> 2.38.1
> 

