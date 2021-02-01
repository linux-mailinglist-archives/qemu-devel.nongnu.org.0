Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D1330A326
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:19:05 +0100 (CET)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6UQK-0003w1-H6
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l6UPO-0003P7-80; Mon, 01 Feb 2021 03:18:06 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:37208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l6UPM-00069Q-9A; Mon, 01 Feb 2021 03:18:06 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 3433EC602E6;
 Mon,  1 Feb 2021 09:18:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1612167480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r0CltJWtYwRND/OpSTkq0nuwwoFHtGa7FKmGwICQdK4=;
 b=j39dMqTafjD423uZqunZV/Qrp1ydIz2+jW7S55DRG9z4iN9uY2Qd5aR5obfd//W/xc6WkO
 VTOjHcrhWWS9HWkhJ9wmiuxUIYIcfzNIrVbnpYrEBtb0cMPjsj2Iw6qGxwZWBlXhCupkzY
 B6Xhe2Dc88ZUG7Ua4ozgYorzVlvrLOdkxSTF0XJYA7cELLtubNktA1kTF8O//eOGoCMfcR
 ozO5eyKJILfEegR2t+h/Z/jRm7Ph+OIzePH+fzo/0GyulS7Sx8P0xKt1OGHYMD1PhIEKU9
 4Kyy3idzjEC4hsn/IfTZ8PtDCLtgTr7DUiuI7wTduvoF6NnNe9OKd75xnS8HOQ==
Date: Mon, 1 Feb 2021 09:18:26 +0100
From: Luc Michel <luc@lmichel.fr>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
Message-ID: <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210131151410.318649-3-f4bug@amsat.org>
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

Hi Philippe,

On 16:14 Sun 31 Jan     , Philippe Mathieu-Daudé wrote:
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
Wow, is there absolutely no way to do that then? What about using an
ARMv8 and starting in AArch32 mode? Is that possible with KVM? I guess
it might not be strictly identical as spawning the "real" CPU...

> 
> From the various SoC used by the Raspberry Pi machines, only
> the BCM2837 is an ARMv8 (Cortex-A53).
> 
> Restrict the BCM2835 (ARM1176) and BCM2836 (Cortex-A7) to TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/bcm2836.c | 6 ++++++
>  hw/arm/raspi.c   | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index fd16ed87c40..3051764f2dc 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -89,6 +89,7 @@ static bool bcm283x_common_realize(DeviceState *dev, Error **errp)
>      return true;
>  }
>  
> +#ifdef CONFIG_TCG
I'm not sure it's enough. TCG and KVM can be enabled in the same
binary. You'll have to perform a runtime check here I think.

>  static void bcm2835_realize(DeviceState *dev, Error **errp)
>  {
>      BCM283XState *s = BCM283X(dev);
> @@ -107,6 +108,7 @@ static void bcm2835_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
>              qdev_get_gpio_in(DEVICE(&s->cpu[0].core), ARM_CPU_FIQ));
>  }
> +#endif /* CONFIG_TCG */
>  
>  static void bcm2836_realize(DeviceState *dev, Error **errp)
>  {
> @@ -178,6 +180,7 @@ static void bcm283x_class_init(ObjectClass *oc, void *data)
>      dc->user_creatable = false;
>  }
>  
> +#ifdef CONFIG_TCG
>  static void bcm2835_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> @@ -201,6 +204,7 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
>      bc->clusterid = 0xf;
>      dc->realize = bcm2836_realize;
>  };
> +#endif /* CONFIG_TCG */
>  
>  #ifdef TARGET_AARCH64
>  static void bcm2837_class_init(ObjectClass *oc, void *data)
> @@ -227,6 +231,7 @@ static const TypeInfo bcm283x_types[] = {
>          .class_init     = bcm283x_class_init,
>          .abstract       = true,
>      },
> +#ifdef CONFIG_TCG
>      {
>          .name           = TYPE_BCM2835,
>          .parent         = TYPE_BCM283X,
> @@ -236,6 +241,7 @@ static const TypeInfo bcm283x_types[] = {
>          .parent         = TYPE_BCM283X,
>          .class_init     = bcm2836_class_init,
>      },
> +#endif /* CONFIG_TCG */
>  #ifdef TARGET_AARCH64
>      {
>          .name           = TYPE_BCM2837,
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index dce966a4dd8..cfa15504d9c 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -319,6 +319,7 @@ static void raspi_machine_class_common_init(MachineClass *mc,
>      mc->default_ram_id = "ram";
>  };
>  
> +#ifdef CONFIG_TCG
>  static void raspi0_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -346,6 +347,7 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
>      rmc->board_rev = 0xa21041;
>      raspi_machine_class_common_init(mc, rmc->board_rev);
>  };
> +#endif /* CONFIG_TCG */
>  
>  #ifdef TARGET_AARCH64
>  static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
> @@ -376,6 +378,7 @@ static const TypeInfo raspi_machine_types[] = {
>          .class_size     = sizeof(RaspiMachineClass),
>          .abstract       = true,
>      },
> +#ifdef CONFIG_TCG
>      {
>          .name           = MACHINE_TYPE_NAME("raspi0"),
>          .parent         = TYPE_RASPI_MACHINE,
> @@ -389,6 +392,7 @@ static const TypeInfo raspi_machine_types[] = {
>          .parent         = TYPE_RASPI_MACHINE,
>          .class_init     = raspi2b_machine_class_init,
>      },
> +#endif /* CONFIG_TCG */
>  #ifdef TARGET_AARCH64
>      {
>          .name           = MACHINE_TYPE_NAME("raspi3ap"),
> -- 
> 2.26.2
> 

-- 

