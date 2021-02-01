Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9313130A30B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:10:49 +0100 (CET)
Received: from localhost ([::1]:59352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6UIK-0001yW-Lm
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l6UGs-0001SV-3d; Mon, 01 Feb 2021 03:09:18 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l6UGp-0001wk-T4; Mon, 01 Feb 2021 03:09:17 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 51E99C602E6;
 Mon,  1 Feb 2021 09:09:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1612166950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2mbTAOSW43stHE3WluobYQIt2cFJmUioMvJ34X3NGQ=;
 b=ROcyJhbzqO8pMz2tuSudK9D7F04DhJfx/1fNqLJw4YX+BxfSztUURM5oAG/u9fkdgciaeQ
 HemU735u08jSJcjVQkj9IgQ7oNFijy7KN9O5voLDHDECwOCWIrnGEI2qCio8C357f+vZLK
 DiuamlFluYsrcqP6NOcRgKRUJm2fpFd6zpiuz3tL1qa/JbLtx4oO9yjP9j0yIRsI+2mYoy
 9U1Xn2p4Il+W4lD/0t33JznjsUXgzffcJoTodaFBV4Nj45zZM2Du5f/8/T7TUJ2PBOnNt6
 o+hOF6zNVNVa1n6wretDhCbTlCgSmarzO2gmvvp6Ax3VWSsegFbVS44iUWdTYQ==
Date: Mon, 1 Feb 2021 09:09:36 +0100
From: Luc Michel <luc@lmichel.fr>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 1/2] hw/arm/raspi: Trivial code movement
Message-ID: <20210201080936.wgoxywx6zkjpkeht@sekoia-pc.home.lmichel.fr>
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210131151410.318649-2-f4bug@amsat.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16:14 Sun 31 Jan     , Philippe Mathieu-Daudé wrote:
> Move the abstract TYPE_BCM283X and TYPE_RASPI_MACHINE declarations
> earlier to make the next commit easier to review.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/bcm2836.c | 32 +++++++++++++++++---------------
>  hw/arm/raspi.c   | 18 ++++++++++--------
>  2 files changed, 27 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index de7ade2878e..fd16ed87c40 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -219,20 +219,6 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
>  
>  static const TypeInfo bcm283x_types[] = {
>      {
> -        .name           = TYPE_BCM2835,
> -        .parent         = TYPE_BCM283X,
> -        .class_init     = bcm2835_class_init,
> -    }, {
> -        .name           = TYPE_BCM2836,
> -        .parent         = TYPE_BCM283X,
> -        .class_init     = bcm2836_class_init,
> -#ifdef TARGET_AARCH64
> -    }, {
> -        .name           = TYPE_BCM2837,
> -        .parent         = TYPE_BCM283X,
> -        .class_init     = bcm2837_class_init,
> -#endif
> -    }, {
>          .name           = TYPE_BCM283X,
>          .parent         = TYPE_DEVICE,
>          .instance_size  = sizeof(BCM283XState),
> @@ -240,7 +226,23 @@ static const TypeInfo bcm283x_types[] = {
>          .class_size     = sizeof(BCM283XClass),
>          .class_init     = bcm283x_class_init,
>          .abstract       = true,
> -    }
> +    },
> +    {
> +        .name           = TYPE_BCM2835,
> +        .parent         = TYPE_BCM283X,
> +        .class_init     = bcm2835_class_init,
> +    }, {
> +        .name           = TYPE_BCM2836,
> +        .parent         = TYPE_BCM283X,
> +        .class_init     = bcm2836_class_init,
> +    },
> +#ifdef TARGET_AARCH64
> +    {
> +        .name           = TYPE_BCM2837,
> +        .parent         = TYPE_BCM283X,
> +        .class_init     = bcm2837_class_init,
> +    },
> +#endif
>  };
>  
>  DEFINE_TYPES(bcm283x_types)
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 990509d3852..dce966a4dd8 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -369,6 +369,13 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
>  #endif /* TARGET_AARCH64 */
>  
>  static const TypeInfo raspi_machine_types[] = {
> +    {
> +        .name           = TYPE_RASPI_MACHINE,
> +        .parent         = TYPE_MACHINE,
> +        .instance_size  = sizeof(RaspiMachineState),
> +        .class_size     = sizeof(RaspiMachineClass),
> +        .abstract       = true,
> +    },
>      {
>          .name           = MACHINE_TYPE_NAME("raspi0"),
>          .parent         = TYPE_RASPI_MACHINE,
> @@ -381,8 +388,9 @@ static const TypeInfo raspi_machine_types[] = {
>          .name           = MACHINE_TYPE_NAME("raspi2b"),
>          .parent         = TYPE_RASPI_MACHINE,
>          .class_init     = raspi2b_machine_class_init,
> +    },
>  #ifdef TARGET_AARCH64
> -    }, {
> +    {
>          .name           = MACHINE_TYPE_NAME("raspi3ap"),
>          .parent         = TYPE_RASPI_MACHINE,
>          .class_init     = raspi3ap_machine_class_init,
> @@ -390,14 +398,8 @@ static const TypeInfo raspi_machine_types[] = {
>          .name           = MACHINE_TYPE_NAME("raspi3b"),
>          .parent         = TYPE_RASPI_MACHINE,
>          .class_init     = raspi3b_machine_class_init,
> +    },
>  #endif
> -    }, {
> -        .name           = TYPE_RASPI_MACHINE,
> -        .parent         = TYPE_MACHINE,
> -        .instance_size  = sizeof(RaspiMachineState),
> -        .class_size     = sizeof(RaspiMachineClass),
> -        .abstract       = true,
> -    }
>  };
>  
>  DEFINE_TYPES(raspi_machine_types)
> -- 
> 2.26.2
> 

-- 

