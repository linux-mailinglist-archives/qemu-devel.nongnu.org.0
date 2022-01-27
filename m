Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F31449EEC2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 00:19:43 +0100 (CET)
Received: from localhost ([::1]:39698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDE3K-00089A-P2
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 18:19:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDE0A-0006t9-G0
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 18:16:26 -0500
Received: from [2001:738:2001:2001::2001] (port=29291 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDE08-0008KV-4M
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 18:16:25 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 82A127457EF;
 Fri, 28 Jan 2022 00:16:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 652D07456FE; Fri, 28 Jan 2022 00:16:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6396B7456E3;
 Fri, 28 Jan 2022 00:16:21 +0100 (CET)
Date: Fri, 28 Jan 2022 00:16:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 01/11] mos6522: add defines for IFR bit flags
In-Reply-To: <20220127205405.23499-2-mark.cave-ayland@ilande.co.uk>
Message-ID: <9e5c4e86-8555-1a42-783f-dae53f114cd2@eik.bme.hu>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-2-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022, Mark Cave-Ayland wrote:
> These are intended to make it easier to see how the physical control lines
> are wired for each instance.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> include/hw/misc/mos6522.h | 22 +++++++++++++++-------
> 1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
> index fc95d22b0f..12abd8b8d2 100644
> --- a/include/hw/misc/mos6522.h
> +++ b/include/hw/misc/mos6522.h
> @@ -41,13 +41,21 @@
> #define IER_SET            0x80    /* set bits in IER */
> #define IER_CLR            0       /* clear bits in IER */
>
> -#define CA2_INT            0x01
> -#define CA1_INT            0x02
> -#define SR_INT             0x04    /* Shift register full/empty */
> -#define CB2_INT            0x08
> -#define CB1_INT            0x10
> -#define T2_INT             0x20    /* Timer 2 interrupt */
> -#define T1_INT             0x40    /* Timer 1 interrupt */
> +#define CA2_INT_BIT        0
> +#define CA1_INT_BIT        1
> +#define SR_INT_BIT         2       /* Shift register full/empty */
> +#define CB2_INT_BIT        3
> +#define CB1_INT_BIT        4
> +#define T2_INT_BIT         5       /* Timer 2 interrupt */
> +#define T1_INT_BIT         6       /* Timer 1 interrupt */
> +
> +#define CA2_INT            (1 << CA2_INT_BIT)
> +#define CA1_INT            (1 << CA1_INT_BIT)
> +#define SR_INT             (1 << SR_INT_BIT)
> +#define CB2_INT            (1 << CB2_INT_BIT)
> +#define CB1_INT            (1 << CB1_INT_BIT)
> +#define T2_INT             (1 << T2_INT_BIT)
> +#define T1_INT             (1 << T1_INT_BIT)

Maybe you could leave the #defines called XX_INT and then use BIT(XX_INT) 
instead of the second set of #defines which would provide same readability 
but with less #defines needed.

Regards,
BALATON Zoltan

> /* Bits in ACR */
> #define T1MODE             0xc0    /* Timer 1 mode */
>

