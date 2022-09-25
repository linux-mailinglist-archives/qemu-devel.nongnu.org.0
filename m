Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96705E91D6
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:22:02 +0200 (CEST)
Received: from localhost ([::1]:34924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNpp-000790-Nd
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNm4-0003Ll-Pi; Sun, 25 Sep 2022 05:18:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNm2-0004LS-P9; Sun, 25 Sep 2022 05:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CFASx01It5rVPKwYy+w7aXQu2TFpAh9UGJDuDSQHfjk=; b=zsUVL8Fo7KDB0p+pgrCz68K82V
 zIR11vXDm2sdR2qPpFMwQNALTqq4eTmd3rUASTn4tL/SBQ5RJn51J8RfJFV3dmeXCy94DbgspzN0i
 wm8iweN+xyjv+QRXtSrIVdFmvjLngZ1x1JPkb3lM/wBepAZBPMHY4lbvDPIIuV7uTSCbkxmhvl/yV
 ditQzdGdaeJnFPALfOwwGlM1Yrw2WraHt1gZlV+OioO40EcG+m2gYX5dpDRf8FEJ4NgY0YFTZCwgc
 5dRvWDOE2aHUcvaJ1bR7L2cgJ9V5YPIz3snH+R8mUoDnwihQNplX2EfRvOst3YavXAl13WpXNMjd2
 fp0xsde6Tsa294+8L8OFWJTANP/iBRGgCqmpO32O2XH9O+PCqDhTJqVyhBBx1ylj1jluvtHAzE5CW
 /eyYyCFVuubVqGOZr6gK/Zia0zIB3YoNEC6mWFvC4YQuctMm7MZ/rpEjtJfmr3KAMSqZJyP9N8PbL
 cksnsFJOOKfiLQL+ug7zOaC2iwp+In2VkRfk2Lw/dEsTLT9nE8y2ZpJP90CiL2MXZsAJdWNtX0TOY
 2e8GTH9QOIkYiLoYJkW4jU+EWFYPZjIQzfHtj2URUPA8vh+Sgj+UUz8DYfoAZFy2BeMRE/D5UDR93
 1whHU8St+fiFpngdqIRPybq0Bk2Zpf5UUzb2JbknU=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNkE-0006vO-7I; Sun, 25 Sep 2022 10:16:18 +0100
Message-ID: <c4b2659e-fece-87c4-dba9-83c90d9b7a8e@ilande.co.uk>
Date: Sun, 25 Sep 2022 10:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <3fd567b3162f70414fcbb7d074e3a7731360f6e4.1663368422.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <3fd567b3162f70414fcbb7d074e3a7731360f6e4.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 07/10] hw/ppc/mac.h: Move macio specific atuff out from
 shared header
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/09/2022 00:07, BALATON Zoltan wrote:

Typo in subject: s/atuff/stuff/

> Move the parts specific to and only used by macio out from the shared
> mac.h into macio.c where they better belong.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c | 26 ++++++++++++++++++++++++--
>   hw/ppc/mac.h          | 23 -----------------------
>   2 files changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index c1fad43f6c..eca5983a4d 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -37,8 +37,30 @@
>   #include "hw/intc/heathrow_pic.h"
>   #include "trace.h"
>   
> -/* Note: this code is strongly inspirated from the corresponding code
> - * in PearPC */
> +#define ESCC_CLOCK 3686400
> +
> +/* Old World IRQs */
> +#define OLDWORLD_CUDA_IRQ      0x12
> +#define OLDWORLD_ESCCB_IRQ     0x10
> +#define OLDWORLD_ESCCA_IRQ     0xf
> +#define OLDWORLD_IDE0_IRQ      0xd
> +#define OLDWORLD_IDE0_DMA_IRQ  0x2
> +#define OLDWORLD_IDE1_IRQ      0xe
> +#define OLDWORLD_IDE1_DMA_IRQ  0x3
> +
> +/* New World IRQs */
> +#define NEWWORLD_CUDA_IRQ      0x19
> +#define NEWWORLD_PMU_IRQ       0x19
> +#define NEWWORLD_ESCCB_IRQ     0x24
> +#define NEWWORLD_ESCCA_IRQ     0x25
> +#define NEWWORLD_IDE0_IRQ      0xd
> +#define NEWWORLD_IDE0_DMA_IRQ  0x2
> +#define NEWWORLD_IDE1_IRQ      0xe
> +#define NEWWORLD_IDE1_DMA_IRQ  0x3
> +#define NEWWORLD_EXTING_GPIO1  0x2f
> +#define NEWWORLD_EXTING_GPIO9  0x37
> +
> +/* Note: this code is strongly inspired by the corresponding code in PearPC */

These IRQ numbers are effectively hardcoded because of the board layout (and at some 
point some of this wiring may move to the board), so I think macio.h is the best 
place for these to allow for use in multiple places if needed.

>   /*
>    * The mac-io has two interfaces to the ESCC. One is called "escc-legacy",
> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
> index e97087c7e7..55cb02c990 100644
> --- a/hw/ppc/mac.h
> +++ b/hw/ppc/mac.h
> @@ -35,29 +35,6 @@
>   #define KERNEL_LOAD_ADDR 0x01000000
>   #define KERNEL_GAP       0x00100000
>   
> -#define ESCC_CLOCK 3686400
> -
> -/* Old World IRQs */
> -#define OLDWORLD_CUDA_IRQ      0x12
> -#define OLDWORLD_ESCCB_IRQ     0x10
> -#define OLDWORLD_ESCCA_IRQ     0xf
> -#define OLDWORLD_IDE0_IRQ      0xd
> -#define OLDWORLD_IDE0_DMA_IRQ  0x2
> -#define OLDWORLD_IDE1_IRQ      0xe
> -#define OLDWORLD_IDE1_DMA_IRQ  0x3
> -
> -/* New World IRQs */
> -#define NEWWORLD_CUDA_IRQ      0x19
> -#define NEWWORLD_PMU_IRQ       0x19
> -#define NEWWORLD_ESCCB_IRQ     0x24
> -#define NEWWORLD_ESCCA_IRQ     0x25
> -#define NEWWORLD_IDE0_IRQ      0xd
> -#define NEWWORLD_IDE0_DMA_IRQ  0x2
> -#define NEWWORLD_IDE1_IRQ      0xe
> -#define NEWWORLD_IDE1_DMA_IRQ  0x3
> -#define NEWWORLD_EXTING_GPIO1  0x2f
> -#define NEWWORLD_EXTING_GPIO9  0x37
> -
>   /* Grackle PCI */
>   #define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"


ATB,

Mark.

