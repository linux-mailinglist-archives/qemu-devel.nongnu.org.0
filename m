Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0553C36E4
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 23:20:01 +0200 (CEST)
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2KOG-0003zP-EO
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 17:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KLX-00020w-Hg
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:17:11 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55976
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KLU-000754-Uz
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 17:17:11 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m2KLK-0003x2-W8; Sat, 10 Jul 2021 22:17:03 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210710174954.2577195-1-f4bug@amsat.org>
 <20210710174954.2577195-3-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <e197185a-11b2-8d4d-3209-e59944564159@ilande.co.uk>
Date: Sat, 10 Jul 2021 22:17:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710174954.2577195-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 2/8] dp8393x: Replace 0x40 magic value by
 SONIC_REG16_COUNT definition
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/07/2021 18:49, Philippe Mathieu-Daudé wrote:

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/net/dp8393x.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 9118364aa33..d1e147a82a6 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -85,6 +85,7 @@ static const char *reg_names[] = {
>   #define SONIC_MPT    0x2e
>   #define SONIC_MDT    0x2f
>   #define SONIC_DCR2   0x3f
> +#define SONIC_REG_COUNT  0x40
>   
>   #define SONIC_CR_HTX     0x0001
>   #define SONIC_CR_TXP     0x0002
> @@ -158,7 +159,7 @@ struct dp8393xState {
>   
>       /* Registers */
>       uint8_t cam[16][6];
> -    uint16_t regs[0x40];
> +    uint16_t regs[SONIC_REG_COUNT];
>   
>       /* Temporaries */
>       uint8_t tx_buffer[0x10000];
> @@ -972,7 +973,7 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
>   
>       address_space_init(&s->as, s->dma_mr, "dp8393x");
>       memory_region_init_io(&s->mmio, OBJECT(dev), &dp8393x_ops, s,
> -                          "dp8393x-regs", 0x40 << s->it_shift);
> +                          "dp8393x-regs", SONIC_REG_COUNT << s->it_shift);
>   
>       s->nic = qemu_new_nic(&net_dp83932_info, &s->conf,
>                             object_get_typename(OBJECT(dev)), dev->id, s);
> @@ -987,7 +988,7 @@ static const VMStateDescription vmstate_dp8393x = {
>       .minimum_version_id = 0,
>       .fields = (VMStateField []) {
>           VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
> -        VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
> +        VMSTATE_UINT16_ARRAY(regs, dp8393xState, SONIC_REG_COUNT),
>           VMSTATE_END_OF_LIST()
>       }
>   };

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

