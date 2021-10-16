Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B71D430413
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:10:45 +0200 (CEST)
Received: from localhost ([::1]:43944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbo8q-0003Zn-K1
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbo73-0002s3-94
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:08:53 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:45507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbo71-0004s4-Iz
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:08:52 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2lv2-1mjki51rsC-0132Io; Sat, 16 Oct 2021 20:08:49 +0200
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-7-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 6/8] q800: route SONIC on-board Ethernet IRQ via nubus IRQ
 9 in classic mode
Message-ID: <679f9de8-bddb-07e6-1a3a-2871588a7afc@vivier.eu>
Date: Sat, 16 Oct 2021 20:08:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013212132.31519-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F4DsERkbIQOgA/B+CbPVUvAo+OGbcMoOUc5usFZE+x2KJdOgMd9
 BeufmKu6YBTYCrp4rzsa4CExSGtE+i3a1tUvrvOOUYGZ7lt6Makwv4GhO+jJFNp/pGMHVVX
 ose2JkAciAQxFBt3GCMNlqJMkrymKdfLOBURs5TWzPsvynF3DRpVpDJ3LyVL6IDgcTbH0n5
 hq9kQN/sy0My0ieJ6kF3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jsDUS7XV5oo=:CJeEKzrcUVnHucGpBWR8u1
 nOD6FcgLNqTuv3Q1vNDDNT3aZb2ZxhSkZ8GIsE1OS923Y3K8hYHv7O/YPpl0Aj7a+tiXz2Dik
 H0GYADMEw52qqG/4VmHUFediDJo5C8Zo501M9l/V/+ep8uNYJyzgTt1EDgbh7vz2HmEVZHYJ9
 boz/dlzIlaN6YFhJ9j/tOcCDVwQBiCO99t1ZbzF/OJPzxX/lIubY79iDxRk4mgZyjIAAlFGQJ
 fZHNcokZXBH2M9aG4NDscuK4iDmoJF4toSckh62dhYwJm/JS4icuL80a17+Q5lklCF2a11eAF
 maOzZBuJOl+JWLE6qtRiDaoiSE2i640zUhl70cxkxi97oq7nzO1UELda+N9kAsHMwmnbGGy6O
 2Me5XP7vweDGT2D19NbtveM3en5Iu/7FXw77wH2h8cIB0GmnW92Gxz4EaNgvpuZA7mAJxEQZj
 ZDVj/p5WBG+t83/IcHWzRyRZewNAmmlW5EqyfFyM39jQ7MrCA6NBRx88Wwuw82RxICHZIRlfz
 ft8jhBvzarXgU/zJKPfYpbnbWIP2OzQD/HpwNYZAi76t2K7xjj24lxm9OiG0e1qTvoJu51ZiI
 siM1inyfObwugi4EmwXunvBO+0lTuUlJJO0FBkbQliZQIJZ95F7/MvQDZsHRY5+RABn1fYr7l
 n0Suitii7TcFSWtqRZw8RgWgEaB4dRYVA23I6mcGwGqLbLkDcU/VqKG8cl5U4HkRdKBh4Iiu4
 lnfjPPdYPv88+PhawGyh5MzOmNC/+t7aCf2k0w==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
> When the hardware is operating in classic mode the SONIC on-board Ethernet IRQ is
> routed to nubus IRQ 9 instead of directly to the CPU at level 3. This does not
> affect the framebuffer which although it exists in slot 9, has its own
> dedicated IRQ on the Quadra 800 hardware.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 57 ++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 0093872d89..d55e6a7541 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -101,6 +101,7 @@ struct GLUEState {
>      M68kCPU *cpu;
>      uint8_t ipr;
>      uint8_t auxmode;
> +    qemu_irq irqs[1];
>  };
>  
>  #define GLUE_IRQ_IN_VIA1       0
> @@ -108,27 +109,50 @@ struct GLUEState {
>  #define GLUE_IRQ_IN_SONIC      2
>  #define GLUE_IRQ_IN_ESCC       3
>  
> +#define GLUE_IRQ_NUBUS_9       0
> +
>  static void GLUE_set_irq(void *opaque, int irq, int level)
>  {
>      GLUEState *s = opaque;
>      int i;
>  
> -    switch (irq) {
> -    case GLUE_IRQ_IN_VIA1:
> -        irq = 5;
> -        break;
> +    switch (s->auxmode) {
> +    case 0:

why don't you use "if () {} else {}" rather than "switch() { case 0: ; case 1: }" ?
(I don't think we need to manage a "default:" case.)

Thanks,
Laurent

