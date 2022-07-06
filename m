Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0495694BA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:53:09 +0200 (CEST)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9CxI-0004Nz-3G
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9CEU-0000zq-Jc; Wed, 06 Jul 2022 17:06:54 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:60213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9CES-0004xw-KP; Wed, 06 Jul 2022 17:06:50 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1A4915808CE;
 Wed,  6 Jul 2022 17:06:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 06 Jul 2022 17:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657141601; x=
 1657145201; bh=R2yDIufvXqrirJf8vhWjNeuXmgZAqcOfT5KSen8ayJg=; b=m
 R6gQ6xSr7T9RYn2d+pBLs+nc/m51UBAq/TrbdRr/fsqpQ0SVlM6UzRI6VSdy2OMF
 ZOA0Fzlrurl9ZvLkvz7eUcaeWNDk3/DiNqp4W/n85gClNCEfIlgFiryyKGs9sImT
 xXoSZ6WtHxYCTT1gXjwKz4U1IzpzCK+FCTGODwbWhvljm5ugRMto/1QX8hVT3C6p
 8d9olzLdOFO7FDygzUdrWg9Goj5Q61V7keFhjyqPGs/ZIt2u0UI4aXiMMe4BNot4
 0MpNZX5IkI2vJd5aD7hnancXjoYwrUgZTkink7SN+Jj34x7WKFUZhQyViVQ3EX8g
 pBuT21jaPMu4aXxaF7X9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657141601; x=
 1657145201; bh=R2yDIufvXqrirJf8vhWjNeuXmgZAqcOfT5KSen8ayJg=; b=Y
 2Ax6KDZN2L4D2nrg4QtkbBgu96IbblrkD6ga4qs5EPqyCG0VqQd8T1WqGLPDmKv3
 JODMKPUAyItqoNwDVoBzUOdqAsv8y7U0USZZPwT1JhIK1ijq18aMBj1kqVd4dTFU
 djf0CPHxZcZj3ruRdTwBAlCYEIsUz/GrV0j1eHQnW8gZxGXvMR2PCkRy+bsgLpb9
 M9NsNyS///aGaAxkFhnVS1HLMnAJ1eJ4Z/X8Y/vw9Nqphd7ZrDrMOEgO4wdEmgk9
 WmM7YGmfwJV3iYVWT4ECvwugSVFjljXJXPVwDSbf1x0FsALDRS9y0h6TPEgfuotg
 6Sjqio8ENFdnpIXEXm5lA==
X-ME-Sender: <xms:YPnFYia8jFHYRIsSAo7K7sa_naILKu1CFvlv6y2_-9-tTE_MuXCEYg>
 <xme:YPnFYlZc9NiymaidNO0Ux13k3_BakrbeWKWvfRpxQ7dLCdq-upALgI764hy6cCIUa
 FkKYQ5gkMp8xa3Ahvw>
X-ME-Received: <xmr:YPnFYs_sqJXjbm4soa8sjrIunfaC1Dz7ZczoiUXbA4_-qOwcDlADfDIsgIZUIrZTflXNPC4ZCdU36m-sYgn9BuHV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgudehjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:YPnFYko6ZpNN3ldi2liYKstOpQnbf-j4f_1uSN3wzSaU2G83Gem0NA>
 <xmx:YPnFYtoRYb-7thi_UPnokyJYDtdrc8cUUsVtUQcGwiwC3kclhplxxw>
 <xmx:YPnFYiQSPbSr59bnvS1aWT58DLMYxPts28yAEicJtLnqMAaSx9JJ1w>
 <xmx:YPnFYunyB9PZUTIBUQLPhvQfv21NnJRhE-Y33nfLCq3g3ORYEXnadw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 17:06:39 -0400 (EDT)
Date: Wed, 6 Jul 2022 14:06:37 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] docs: aspeed: Minor updates
Message-ID: <YsX5XcAdn3+inY56@pdel-mbp.dhcp.thefacebook.com>
References: <20220706172131.809255-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220706172131.809255-1-clg@kaod.org>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 06, 2022 at 07:21:31PM +0200, Cédric Le Goater wrote:
> Some more controllers have been modeled recently. Reflect that in the
> list of supported devices. New machines were also added.

Looks good, thanks for this!

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  docs/system/arm/aspeed.rst | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 445095690c04..6c5b05128ea8 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -31,7 +31,10 @@ AST2600 SoC based machines :
>  - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
>  - ``rainier-bmc``          IBM Rainier POWER10 BMC
>  - ``fuji-bmc``             Facebook Fuji BMC
> +- ``bletchley-bmc``        Facebook Bletchley BMC
>  - ``fby35-bmc``            Facebook fby35 BMC
> +- ``qcom-dc-scm-v1-bmc``   Qualcomm DC-SCM V1 BMC
> +- ``qcom-firework-bmc``    Qualcomm Firework BMC
>  
>  Supported devices
>  -----------------
> @@ -40,7 +43,7 @@ Supported devices
>   * Interrupt Controller (VIC)
>   * Timer Controller
>   * RTC Controller
> - * I2C Controller
> + * I2C Controller, including the new register interface of the AST2600
>   * System Control Unit (SCU)
>   * SRAM mapping
>   * X-DMA Controller (basic interface)
> @@ -57,6 +60,10 @@ Supported devices
>   * LPC Peripheral Controller (a subset of subdevices are supported)
>   * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
>   * ADC
> + * Secure Boot Controller (AST2600)
> + * eMMC Boot Controller (dummy)
> + * PECI Controller (minimal)
> + * I3C Controller
>  
>  
>  Missing devices
> @@ -68,12 +75,10 @@ Missing devices
>   * Super I/O Controller
>   * PCI-Express 1 Controller
>   * Graphic Display Controller
> - * PECI Controller
>   * MCTP Controller
>   * Mailbox Controller
>   * Virtual UART
>   * eSPI Controller
> - * I3C Controller
>  
>  Boot options
>  ------------
> @@ -154,6 +159,8 @@ Supported devices
>   * LPC Peripheral Controller (a subset of subdevices are supported)
>   * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
>   * ADC
> + * Secure Boot Controller
> + * PECI Controller (minimal)
>  
>  
>  Missing devices
> @@ -161,7 +168,6 @@ Missing devices
>  
>   * PWM and Fan Controller
>   * Slave GPIO Controller
> - * PECI Controller
>   * Mailbox Controller
>   * Virtual UART
>   * eSPI Controller
> -- 
> 2.35.3
> 
> 

