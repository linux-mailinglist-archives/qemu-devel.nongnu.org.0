Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6D430417
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:11:53 +0200 (CEST)
Received: from localhost ([::1]:46406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbo9w-0005MR-Rc
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbo7q-0003bx-9J
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:09:42 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:41581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbo7o-0005XZ-It
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:09:42 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mj8eD-1nGLTi0Bcr-00fChk; Sat, 16 Oct 2021 20:09:39 +0200
Subject: Re: [PATCH 7/8] q800: wire up remaining IRQs in classic mode
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-8-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <258c843f-2af4-8c48-0992-fa0dc69b86a3@vivier.eu>
Date: Sat, 16 Oct 2021 20:09:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013212132.31519-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3PhatnSlZftN1RT21Yvr60TcvC7gf9KogxEX6nl4Sp31E93uI7F
 YYVIexwi5Xm/wtcag97xL1aQ5oFMcXJrm2WTwDYWARisE+SS0057zwqjA63IJ/oQqx0eDvh
 ur2Mfn0xGOVOCsKw8i4k+EUVweVLYvSXbe3TxODtHZeqsDMMLV7rlQMxQGtqODUyx2nu+nZ
 WrpsYSj5Fy8byCboMBusw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QyAUxtiLUrU=:JiDs4FDOO02LTm2pfsK5x3
 /k28HP25vCFM4KIlQWpQqOhbttRiFV6jbhBi+hZHMCaannh1Cy+IRDuI11cxM1u/M74njsVDv
 GiJzV39HsmCJPlnmTFt5gZio0OkPaGvBLSW7vWk97mwNPyrC1JderZwJwKlBt4jDm3/So2W2X
 PJfqrAX/E7Tvbfg610+E1ugPsEw6HArt7UWtKBXNxytvoISc3ecYjkPG+rDs8VyRJCuwuBxor
 ngcXY4jn1YXfZTYWOziOE5fL9OIT8Et1lcNlKE5yDh3LJQbeidxas6O4iHov0E5AKPfo9+UfY
 U17qhIQaf4os9qhiDIKLJAvN6Vm5Rjoj7mlks/EyLdOrd9eLPrr/irRzPAjTkDTW7VP5gmH4p
 sqWBFiGoCZdintNP28xd3U/0aF4QCa9lyQOrcpAd6uGhBjeJjoqiQ7NIaLLPoyJMtgTSOmRHq
 W5nTKlcQVC7jyr+/mKAUFj9V6jHeaFZYaRFLIv6VXHTwkAotH4KlLAVwD+TQagZgd1io3WCMJ
 EPlEqE2VcgKuAvRCtWbLl893j7nhzNNlPtKVOEb4ZKZzklSj0Kvum3gOxJyCnDVD1XChXDROK
 nYZ0+V0eE8gEResyJq3+88PsKK4C+sstEX4coopLSGQxlAghSyh9lXQfh5zFzBPO2455kgu6T
 jbGlST/vcpT2CmC9bs+qpsB2ADh8kdk0LcuKgmxC0thgXCiRcgG+/PUC4APBwhbUs9/fNdeQs
 vwxveChtZsLfug+37qorz9Hxou42wEVTR8XHWQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
> Explicitly wire up the remaining IRQs in classic mode to enable the use of
> g_assert_not_reached() in the default case to detect any unexpected IRQs.
> 
> Add a comment explaining the IRQ routing differences in A/UX mode based
> upon the comments in NetBSD (also noting that at least A/UX 3.0.1 still
> uses classic mode).
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index d55e6a7541..fa851e2ec9 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -111,6 +111,37 @@ struct GLUEState {
>  
>  #define GLUE_IRQ_NUBUS_9       0
>  
> +/*
> + * The GLUE logic on the Quadra 800 supports 2 different IRQ routing modes
> + * controlled from the VIA1 auxmode GPIO (port B bit 6) which are documented
> + * in NetBSD as follows:
> + *
> + * A/UX mode (Linux, NetBSD, auxmode GPIO low)
> + *
> + *   Level 0:        Spurious: ignored
> + *   Level 1:        Software
> + *   Level 2:        VIA2 (except ethernet, sound)
> + *   Level 3:        Ethernet
> + *   Level 4:        Serial (SCC)
> + *   Level 5:        Sound
> + *   Level 6:        VIA1
> + *   Level 7:        NMIs: parity errors, RESET button, YANCC error
> + *
> + * Classic mode (default: used by MacOS, A/UX 3.0.1, auxmode GPIO high)
> + *
> + *   Level 0:        Spurious: ignored
> + *   Level 1:        VIA1 (clock, ADB)
> + *   Level 2:        VIA2 (NuBus, SCSI)
> + *   Level 3:
> + *   Level 4:        Serial (SCC)
> + *   Level 5:
> + *   Level 6:
> + *   Level 7:        Non-maskable: parity errors, RESET button
> + *
> + * Note that despite references to A/UX mode in Linux and NetBSD, at least
> + * A/UX 3.0.1 still uses Classic mode.
> + */
> +
>  static void GLUE_set_irq(void *opaque, int irq, int level)
>  {
>      GLUEState *s = opaque;
> @@ -144,10 +175,25 @@ static void GLUE_set_irq(void *opaque, int irq, int level)
>      case 1:
>          /* Classic mode */
>          switch (irq) {
> +        case GLUE_IRQ_IN_VIA1:
> +            irq = 0;
> +            break;
> +
> +        case GLUE_IRQ_IN_VIA2:
> +            irq = 1;
> +            break;
> +
>          case GLUE_IRQ_IN_SONIC:
>              /* Route to VIA2 instead */
>              qemu_set_irq(s->irqs[GLUE_IRQ_NUBUS_9], level);
>              return;
> +
> +        case GLUE_IRQ_IN_ESCC:
> +            irq = 3;
> +            break;
> +
> +        default:
> +            g_assert_not_reached();
>          }
>          break;
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

