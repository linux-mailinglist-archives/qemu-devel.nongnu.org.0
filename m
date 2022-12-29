Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142416591F3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 22:04:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAzwm-0007S7-EA; Thu, 29 Dec 2022 15:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzw8-0007Gg-Em; Thu, 29 Dec 2022 15:55:37 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzw7-0007it-0Z; Thu, 29 Dec 2022 15:55:36 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 396795C0040;
 Thu, 29 Dec 2022 15:55:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 29 Dec 2022 15:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672347334; x=
 1672433734; bh=/PvDhT/beLl6NzvQv2ytane0xQn6O82paxWstLW5oAI=; b=I
 8ipnqOqQXrI8EgmFHFhIX2yTcHp/OluNTmtF9cqUnaTn9SUje3hQk9vlwh6gcFGX
 3ZYAy7otHGGRyGi0BzQl2TcpfsNEW0w/+g25dLZD1kGzR9LTKUsF0W9L4oidySYk
 hUikoVYzeOlA5xOQtbgdG+qRzIsAC+CZLaldFaWdR38flhov6CRhEOBS1A+nOSbd
 FEhLZTbAkFL4/7jkdAbfIfQv/AwGRi2jujtlu8dlRWc+ZIAeEn1cJQ6Z2ok56q//
 8G43CYgdHKPdNmXBESPgoFym/dWBZKxGsMWeEwmxVT/gVn0TPrndRf3rMmMj4gZd
 yDGDAqAXFSY7t5QLm8ejg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672347334; x=
 1672433734; bh=/PvDhT/beLl6NzvQv2ytane0xQn6O82paxWstLW5oAI=; b=I
 vGc7MyHn5LhjYM1eGPafVP40U7mmRxs7xmLEXXbbvQvuxHkFJUMKUNoqvfpAdTtl
 e4uH1qryudXSVA/4/KIHQrP+pkxdoXpWb7LQzNulXGm9967jrM6YxJ4ryDFHBl9j
 VU64DJcaz+UEmd9PlnRB6nTPdhynP5jBIDFs2TESBFP5bISqAgDzemxO4JZs2pJ+
 CEtQvu7pBe7TY4QAARvnfxn5SaCBnfCPH+4KfbZ+ngG2XVLEFJz4NPsI8NlC4RP+
 m312NdBhOOu6BjDDCSwWwZMJHveGuTwWpPQRj5Nw/CNmBBsG+K/Eq8oKgZ4PwtXl
 Bm8ag/VJgEHlIYs6I7WEA==
X-ME-Sender: <xms:xv6tY5d-VExPmDMUvBhfCLBOl9aa6crp3zDnWRJ9VCR7mOncuBaoNQ>
 <xme:xv6tY3Os31aVyBjaZrHo4292tTwhuWRMAt4yE28P7Y8M3aDwzdbLm09nyTPYOi9rv
 vDUBvfxGoRjl31pjkc>
X-ME-Received: <xmr:xv6tYygXkJ3sx8rgFK5uktPa0vl_a1xQL3n1VKqDi_tANkYzPSPuUO6R4XuPNfUpT-UaU3hcyi982BsgqpYolg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddugeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:xv6tYy8469gWFXeHmEeFIDqsNgqdlwAVHYO2G-By9oxIfX7-ReBHoA>
 <xmx:xv6tY1vqOHq1WeSVtr1bVV3UhzrYAmD-j9hBEOSt575irb411Rh8Xw>
 <xmx:xv6tYxEnlKO6OH4TxldYWlztLJ8U0IXa9qPalYQvpOc5Kt_09xQufw>
 <xmx:xv6tY2Ox5HYCqQhhgePoygLWzgvmqncgByBQIUyjx_oRRXUlrsf8_w>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 15:55:32 -0500 (EST)
Date: Thu, 29 Dec 2022 12:55:30 -0800
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
Subject: Re: [PATCH 8/9] hw/arm/aspeed_ast10x0: Add TODO comment to use
 Cortex-M4F
Message-ID: <Y63+wm37Nl6tNXY+@pdel-mbp.dhcp.thefacebook.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-9-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221229152325.32041-9-philmd@linaro.org>
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

On Thu, Dec 29, 2022 at 04:23:24PM +0100, Philippe Mathieu-Daudé wrote:
> This SoC uses a Cortex-M4F. QEMU only implements a M4,
> which is good enough. Add a TODO note in case the M4F
> is added.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Oh, yeah good to have a note of this somewhere.

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> ---
>  hw/arm/aspeed_ast10x0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 02636705b6..788827ca9d 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -421,7 +421,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>      dc->realize = aspeed_soc_ast1030_realize;
>  
>      sc->name = "ast1030-a1";
> -    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
> +    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4"); /* TODO cortex-m4f */
>      sc->silicon_rev = AST1030_A1_SILICON_REV;
>      sc->sram_size = 768 * KiB;
>      sc->secsram_size = 9 * KiB;
> -- 
> 2.38.1
> 

