Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F442082F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:24:45 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKDE-000599-5Y
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXK9Z-0002BK-Bz
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:20:57 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:45185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXK9X-0004IU-GR
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:20:57 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MTzOe-1mNwCV1hFS-00QxYd; Mon, 04 Oct 2021 11:20:53 +0200
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-7-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 06/12] macfb: implement mode sense to allow display type
 to be detected
Message-ID: <c92f20ba-14af-f5de-75a0-aba0c48eb6ed@vivier.eu>
Date: Mon, 4 Oct 2021 11:20:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211002110007.30825-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dFc8mWsTaidN26vylvEvfWO/TAEliM+1YrQAWGxI3nh3O0rFnPq
 FybpbJf8hCvpkn80JjEE52stD2le5+cM6izFFDww8u3ok87GwSPNgB89WhYHH1Qa7eSKaF4
 hyPBjbun8Io0UjfWCKjty1iDeDqC18B1BbmG22gNgjxaWI4tMk7ZkKgV7CcBTY6KPeu8+N2
 cYpsjcWWFq4N8gNH/TtMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:l4yzbCZ+Ng0=:fOPmME7HYsXn13i6XVJBmQ
 8yhjiPFmAUMCKi6Cxdcz6uJ38XWIUoLGQGGJ/935BvnKLU7ItHCyNEcUKHWXFs7R72RVJmukE
 7EzLhcHUOegIw3P6r8kvJjtWQUPAHwx85xKFdPpbSaE01vxuJg3HNkr03rUwZE0AdNu6wXWwj
 wy4VRa5BzEoYch1qlw5+0v7YNmxemG7axeaG9S/y3XrS38kRhLzeP0zy/qHsCfFbpxKfvHQ8k
 zxO2akI4KH4iXUt6N5mIuVZiUaxP0H3xfk89QBSxSl/W8kVGc4sOnANULYq2Qoq7xqLuEYTpp
 JG5vV9rzGG9OYPn56qbGrowHvz3IcdtxdN0ZgL2mxOlXMtaAK/OW47hS9EQDvH33pcBlCXiJh
 URRLXB4qPJHIz4XKkLRj5+iff6oILMG4va5qGPDXY4xaSo0qgzUIFp2Ii9dXNxoHWwXTdoWQw
 ocRR3RlyeYetDTELcmVK62b+n9HuBhiqyXnNJBb0TeWky/YcNeHIdTOtHGfqQrwLeh2Fc8EJF
 e2dfJbS3yLx20hjm+MBEExva9eFGujRkoOFNvbkLQmAiDFxmNZpjgIENZ/RsVyUL29pvoKlNE
 KTgTzVf/MYpgxPlyOHlRKWUily1Sx8IbUEF7+YbprXMGgXSrv5zp0QXYuOVuLT7DBgC21H6eH
 VnVFYmrPwbdjYX1i/kmoMebrAmIihVvbG2z8afwhkz2UV6xSC8A8uyBLjmHtgHg5XCVLIudIL
 SFDEncgMaA/OuAbx+ruIgnr93DSRDqfDFK1atw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 02/10/2021 à 13:00, Mark Cave-Ayland a écrit :
> The MacOS toolbox ROM uses the monitor sense to detect the display type and then
> offer a fixed set of resolutions and colour depths accordingly. Implement the
> monitor sense using information found in Apple Technical Note HW26: "Macintosh
> Quadra Built-In Video" along with some local experiments.
> 
> Since the default configuration is 640 x 480 with 8-bit colour then hardcode
> the sense register to return MACFB_DISPLAY_VGA for now.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c         | 117 ++++++++++++++++++++++++++++++++++++-
>  hw/display/trace-events    |   2 +
>  include/hw/display/macfb.h |  20 +++++++
>  3 files changed, 137 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 62c2727a5b..5c95aa4a11 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -28,8 +28,66 @@
>  #define MACFB_PAGE_SIZE 4096
>  #define MACFB_VRAM_SIZE (4 * MiB)
>  
> -#define DAFB_RESET      0x200
> -#define DAFB_LUT        0x213
> +#define DAFB_MODE_SENSE     0x1c
> +#define DAFB_RESET          0x200
> +#define DAFB_LUT            0x213
> +
> +
> +/*
> + * Quadra sense codes taken from Apple Technical Note HW26:
> + * "Macintosh Quadra Built-In Video". The sense codes and

https://developer.apple.com/library/archive/technotes/hw/hw_26.html

> + * extended sense codes have different meanings:
> + *
> + * Sense:
> + *    bit 2: SENSE2 (pin 10)
> + *    bit 1: SENSE1 (pin 7)
> + *    bit 0: SENSE0 (pin 4)
> + *
> + * 0 = pin tied to ground
> + * 1 = pin unconnected
> + *
> + * Extended Sense:
> + *    bit 2: pins 4-10
> + *    bit 1: pins 10-7
> + *    bit 0: pins 7-4
> + *
> + * 0 = pins tied together
> + * 1 = pins unconnected
> + *
> + * Reads from the sense register appear to be active low, i.e. a 1 indicates
> + * that the pin is tied to ground, a 0 indicates the pin is disconnected.
> + *
> + * Writes to the sense register appear to activate pulldowns i.e. a 1 enables
> + * a pulldown on a particular pin.
> + *
> + * The MacOS toolbox appears to use a series of reads and writes to first
> + * determine if extended sense is to be used, and then check which pins are
> + * tied together in order to determine the display type.
> + */
> +
> +typedef struct MacFbSense {
> +    uint8_t type;
> +    uint8_t sense;
> +    uint8_t ext_sense;
> +} MacFbSense;
> +
> +static MacFbSense macfb_sense_table[] = {
> +    { MACFB_DISPLAY_APPLE_21_COLOR, 0x0, 0 },
> +    { MACFB_DISPLAY_APPLE_PORTRAIT, 0x1, 0 },
> +    { MACFB_DISPLAY_APPLE_12_RGB, 0x2, 0 },
> +    { MACFB_DISPLAY_APPLE_2PAGE_MONO, 0x3, 0 },
> +    { MACFB_DISPLAY_NTSC_UNDERSCAN, 0x4, 0 },
> +    { MACFB_DISPLAY_NTSC_OVERSCAN, 0x4, 0 },
> +    { MACFB_DISPLAY_APPLE_12_MONO, 0x6, 0 },
> +    { MACFB_DISPLAY_APPLE_13_RGB, 0x6, 0 },
> +    { MACFB_DISPLAY_16_COLOR, 0x7, 0x3 },
> +    { MACFB_DISPLAY_PAL1_UNDERSCAN, 0x7, 0x0 },
> +    { MACFB_DISPLAY_PAL1_OVERSCAN, 0x7, 0x0 },
> +    { MACFB_DISPLAY_PAL2_UNDERSCAN, 0x7, 0x6 },
> +    { MACFB_DISPLAY_PAL2_OVERSCAN, 0x7, 0x6 },
> +    { MACFB_DISPLAY_VGA, 0x7, 0x5 },
> +    { MACFB_DISPLAY_SVGA, 0x7, 0x5 },

Perhaps it could be interesting to also have the "no external monitor" entry?
But generally not to have monitor prevents the boot of MacOS.

...

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

