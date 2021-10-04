Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F304B420889
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:41:06 +0200 (CEST)
Received: from localhost ([::1]:50394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKT3-0002m9-Gn
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXKDW-0007r8-CM
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:02 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:60859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXKDU-0007hi-Gi
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:02 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MK3eC-1mE0NY2VvK-00LVXE; Mon, 04 Oct 2021 11:24:58 +0200
Subject: Re: [PATCH 07/12] macfb: add qdev property to specify display type
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-8-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a0cc2ea6-306d-34b9-09e9-b6acb6e9876b@vivier.eu>
Date: Mon, 4 Oct 2021 11:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211002110007.30825-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nCaCI8bVi0geeU506iYz8zxK9BErsMtQef2j4UaxfEB6UZfUaDU
 fq5ohHf/hLYsucK1ERd0rrS/H7YzoiaVnk1bOnKXUIeSV59QsJ9YZwO9IWk5n7Ome1dopMC
 njOVFwMwtwVaNWUcLbvB34tf+UpBjQWZo670aK9yNFtN8Z9adokJt33XBEI7RYlK2R9qFO5
 CwN7iu+jgNAh6qKqbEOQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ylGrWxdGFjA=:0Hkjka/jgdjMuplG82i1DI
 ud4u01/9t41oTTd+rRqpw2HX4TOnjIuDxQ7rTpBzPIP2EWq9aBqOA7ba1SZFgfBBDBSFy3NN9
 O3fyqxA8OdxgqdnhR/l7NfbDeFWMLHC3qdFgbY1n/RDkLDJSvvkovTaouUsunqN8yb5jKw0rB
 Z9WmU1NHiZiF+THxtZIBHrqo1dHynWMAzTwhIVLSz5mNhxA68OFL0LX0bpc0u0JeY2XSp5Wf9
 KqLDuQhGiVzTXaIpjfae3IcvT/u3K6C8HUGPwugRARhF3Es8OnhM/R5J4WVcnSBJ8kpA8ju2M
 0Av9Vxnx+SRsHCPVv9BZHPmsCWjkwzpRjLkI8/zdYQbqgekEeAjgjxLd6eNBbwr0LQA2Dp5aZ
 jNnojEQin4V5Ftun88T0vNkaxa2g8qhDC8gTtiWC5uk+ZzaN3xyVqbh+pfYnT798gWKiSzJsm
 6FADlbiVm+natxqnkaVQoUovrzdAiUtd5fOhSUbWZuFIzQCQp9pXxbvYb991dKdIpfFuKtgqs
 DMjvv1lnxI2GOb4l1GEGUSgW1WMY9iHhOpp2181XzQnFF3WxL89AEPWpIg6N37DjTJj9hLC9e
 TXKz5zfscfO2ScDldqaucWpfrhjFTH5xXEFdcPXiQ7qu+n3UJkYnMTKCOKv8XE64niH4H6TLo
 YxJo9wDT4WKQNTw4IzCM96pCYwSOYvyWZdG1C2fkGospgLv2rk9sahoYrZwSGQleXOxbkHLE/
 xow15GOEVa6pWwMd0H/UgXVaMIVA9/jnM0PI3g==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
> Since the available resolutions and colour depths are determined by the attached
> display type, add a qdev property to allow the display type to be specified.
> 
> The main resolutions of interest are high resolution 1152x870 with 8-bit colour
> and SVGA resolution up to 800x600 with 32-bit colour so update the q800 machine
> to allow high resolution mode if specified and otherwise fall back to SVGA.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c         | 6 +++++-
>  hw/m68k/q800.c             | 5 +++++
>  include/hw/display/macfb.h | 1 +
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 5c95aa4a11..023d1f0cd1 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -316,7 +316,7 @@ static uint32_t macfb_sense_read(MacfbState *s)
>      MacFbSense *macfb_sense;
>      uint8_t sense;
>  
> -    macfb_sense = &macfb_sense_table[MACFB_DISPLAY_VGA];
> +    macfb_sense = &macfb_sense_table[s->type];
>      if (macfb_sense->sense == 0x7) {
>          /* Extended sense */
>          sense = 0;
> @@ -545,6 +545,8 @@ static Property macfb_sysbus_properties[] = {
>      DEFINE_PROP_UINT32("width", MacfbSysBusState, macfb.width, 640),
>      DEFINE_PROP_UINT32("height", MacfbSysBusState, macfb.height, 480),
>      DEFINE_PROP_UINT8("depth", MacfbSysBusState, macfb.depth, 8),
> +    DEFINE_PROP_UINT8("display", MacfbSysBusState, macfb.type,
> +                      MACFB_DISPLAY_VGA),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -552,6 +554,8 @@ static Property macfb_nubus_properties[] = {
>      DEFINE_PROP_UINT32("width", MacfbNubusState, macfb.width, 640),
>      DEFINE_PROP_UINT32("height", MacfbNubusState, macfb.height, 480),
>      DEFINE_PROP_UINT8("depth", MacfbNubusState, macfb.depth, 8),
> +    DEFINE_PROP_UINT8("display", MacfbNubusState, macfb.type,
> +                      MACFB_DISPLAY_VGA),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 09b3366024..5223b880bc 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -421,6 +421,11 @@ static void q800_init(MachineState *machine)
>      qdev_prop_set_uint32(dev, "width", graphic_width);
>      qdev_prop_set_uint32(dev, "height", graphic_height);
>      qdev_prop_set_uint8(dev, "depth", graphic_depth);
> +    if (graphic_width == 1152 && graphic_height == 870 && graphic_depth == 8) {
> +        qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_APPLE_21_COLOR);
> +    } else {
> +        qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_VGA);
> +    }
>      qdev_realize_and_unref(dev, BUS(nubus), &error_fatal);
>  
>      cs = CPU(cpu);
> diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
> index febf4ce0e8..e95a97ebdc 100644
> --- a/include/hw/display/macfb.h
> +++ b/include/hw/display/macfb.h
> @@ -46,6 +46,7 @@ typedef struct MacfbState {
>      uint8_t color_palette[256 * 3];
>      uint32_t width, height; /* in pixels */
>      uint8_t depth;
> +    uint8_t type;
>  
>      uint32_t sense;
>  } MacfbState;
> 

I think the display modes should be documentend somewhere to be directly usable by the user and get
ride of the graphic_XXX variables (and -g).

Perhaps it could also be merged with the previous one.

Thanks,
Laurent

