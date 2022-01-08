Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3F34884BE
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 17:55:02 +0100 (CET)
Received: from localhost ([::1]:49108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Ezd-0005Gz-Eg
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 11:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6EyA-0004Yi-TU
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 11:53:31 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:46891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6Ey8-0000WC-Pm
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 11:53:30 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MHG4c-1nAgxY1u5Y-00DE8H; Sat, 08 Jan 2022 17:53:24 +0100
Message-ID: <af5ad708-bdef-af6c-bb38-500f0c62e92a@vivier.eu>
Date: Sat, 8 Jan 2022 17:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] macfb: fix VRAM dirty memory region logging
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220108164147.30813-1-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220108164147.30813-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EZggOMwsNg/eU63BfC+wrFmSsTplW69saRx6bBz5hsTuXvOH7Ku
 i+DARdzXcMUWsUkvzRnqtQ/uF/wWYlSX3VsCHejTQlBtTzxAWkVbH12W2wBoAKGoYTbjMzt
 l9vynuJ8sunlvUxv60832lCQBdC4DyJLhUXfhfTAsZV0y/WE/F2MQweRnsRl6lK6uzav8GF
 3EbmbywtkMG+UMZmcSYdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wTmn5jl1mBE=:DIrsYCp31qTU8xAtiEHsRH
 EVljb2iPjHZDeJVoEWcKUUjIPGsfoaqSxkg01iYvqyIwjRmVZoKP1lk/oSKPP7nXIfBNEx0C9
 uBCiAiwZdhiKs66/o2cyoBecmnMRQnyB+9L45PksrRVc5nSyFKp0ojqTyM8iy8emQukxXbvC0
 PBsmPhDFqMWdxM5AtLA2YMGB5Y6FNW68kPTJpjdwgbLvyJoWzDoJaZFdowyvERAkNo76BN3Hj
 KFA1YcfbCOHoHHtDFAY8frO+mv9sslvmb8PKjcmWInmHCGrlYlMAkTt40ECJ2OxRL7sNFw8sa
 8DmnP0LvnjHozasVEPWJGbt/VzcgE0iUps+/26Kbgt8A1b6S4z3MmdAQQM4cseqwICLg63ukn
 nTKQHPczcqFo+DMlKhyER0GhHH6h6vyK8o7kUF9aIELRiDBOpgXXAb70X//+yMC3oo6xvoqDg
 d48z/l5I2dHkrc+T2n+JNiE2k3G8RhZX1KdFCsidoeWdyBPqFtjom81Nu5r67L90do3v1tY4L
 iZMOG8M1iHBfHvIfKR5uSqlfwUVI+eQmKcrVDyqKtyVJ/RnesP8s9S1yLjvx6dICQHhdwKtHR
 UHY978ILTGOmU3PqnGxUe6HM4UD6LnYJ6dM79Pxg453jDHJDQOw7Ijn/bfJsE3FoL6j/LOxtb
 zb5jJlHcNOL6lZKvGEGuLCDSLIUsv1aupHVRWwNpFOM2NeLQBAxASaII5wg9VIFFnYtU=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 08/01/2022 à 17:41, Mark Cave-Ayland a écrit :
> The macfb VRAM memory region was configured with coalescing rather than dirty
> memory logging enabled, causing some areas of the screen not to redraw after
> a full screen update.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 8ac919a065 ("hw/m68k: add Nubus macfb video card")
> ---
>   hw/display/macfb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 277d3e6633..4bd7c3ad6a 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -661,9 +661,9 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
>   
>       memory_region_init_ram(&s->mem_vram, OBJECT(dev), "macfb-vram",
>                              MACFB_VRAM_SIZE, &error_abort);
> +    memory_region_set_log(&s->mem_vram, true, DIRTY_MEMORY_VGA);
>       s->vram = memory_region_get_ram_ptr(&s->mem_vram);
>       s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
> -    memory_region_set_coalescing(&s->mem_vram);
>   
>       s->vbl_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, macfb_vbl_timer, s);
>       macfb_update_mode(s);

I understant why you add memory_region_set_log() but I don't understand why you remove 
memory_region_set_coalescing().

Thanks,
Laurent

