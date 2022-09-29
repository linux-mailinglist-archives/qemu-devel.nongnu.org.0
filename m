Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A15EEFBF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:55:57 +0200 (CEST)
Received: from localhost ([::1]:34560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odoOi-0007p7-Ot
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odoCl-0006lJ-Ew; Thu, 29 Sep 2022 03:43:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odoCj-00080e-SE; Thu, 29 Sep 2022 03:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kq0SDU2F+FOwk/E/wCLUAUV4EJzv+K6ZhVsdd4k9xqM=; b=VFwUz6vJFS6aF9FH5unj3hsfA6
 1ANG/NZ/q1wSchlcR+CpRUt8RcE9l+PO1lDDY4M51KxbhYa6mmAHtu31h1/NV4SZlQL5DFgTblbuo
 zFGnTuB5b0cigUQp+kO20uE4OPDFU7VbzkQj8BLcxC/ihITDMmYRQGiGUJcIzkylAED+dXiXb5RYH
 cKs26IF9Qk5CnZtiVPpi7W8hGl/v1QK/lVY/CJrEOJKaVn/iCL7qpW8QWf6peFseBJ8Jl3MGe/Kzo
 xle7kDqfGH6t+qrWBgnA9fNsEgoN9Dux2XwfZSE47mK0C+jozwoMmai3HPdm4n8oPecaGA55/CLlV
 IAQHEGsuh6zRx2yUY3Jsre1s+GjQbLTit2lcIf76gL2phgoVGmCLYn9/Es/fgv3hvrsrS2PuKceSF
 nknNfZqx0EFd9WQR0LOv7bE5/T9GDAYq7GLERuau9DDeggOf09TmNdVcKm9RupMrfbTUfWeyEeUTM
 c4HEX31Uasts13zFZMO43E4EYlDQTbPcwbGd2VQsX67EdOVEoVKiMP9Q28tK+UrrSGLLgMzNLTser
 gpQaXSqqUnOI8HHSzUp2eqaZjWLjJW6W8pSK0971E/PMv/lM7fRZPhiYyFToiJJL10JyP09hUZY/L
 yfaMTddSG6k7aXGTfp6MsjMLKG9gNXMu9PGFwKF3E=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odoAy-000BhB-S1; Thu, 29 Sep 2022 08:41:49 +0100
Message-ID: <2a99a2b9-9b36-7867-cf21-a6dadcd96d70@ilande.co.uk>
Date: Thu, 29 Sep 2022 08:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <d9cecc9724c75f723572d67a0fd33adec3f44228.1664108862.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <d9cecc9724c75f723572d67a0fd33adec3f44228.1664108862.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 09/13] hw/ppc/mac.h: Move macio specific parts out from
 shared header
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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

On 25/09/2022 13:38, BALATON Zoltan wrote:

> Move the parts specific to and only used by macio out from the shared
> mac.h into macio.c where they better belong.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/misc/macio/macio.c         |  5 +++--
>   hw/ppc/mac.h                  | 23 -----------------------
>   include/hw/misc/macio/macio.h | 21 +++++++++++++++++++++
>   3 files changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index c1fad43f6c..f9f0758b03 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -37,8 +37,9 @@
>   #include "hw/intc/heathrow_pic.h"
>   #include "trace.h"
>   
> -/* Note: this code is strongly inspirated from the corresponding code
> - * in PearPC */
> +#define ESCC_CLOCK 3686400
> +
> +/* Note: this code is strongly inspired by the corresponding code in PearPC */
>   
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
>   
> diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
> index 6c05f3bfd2..26cf15b1ce 100644
> --- a/include/hw/misc/macio/macio.h
> +++ b/include/hw/misc/macio/macio.h
> @@ -38,6 +38,27 @@
>   #include "hw/ppc/openpic.h"
>   #include "qom/object.h"
>   
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
>   /* MacIO virtual bus */
>   #define TYPE_MACIO_BUS "macio-bus"
>   OBJECT_DECLARE_SIMPLE_TYPE(MacIOBusState, MACIO_BUS)

At some point I'd like to review whether or not this wiring should be done at the 
board level, however that's orthogonal to this series so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

