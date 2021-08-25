Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E8A3F702E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:14:06 +0200 (CEST)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIn6m-0006Zb-Vu
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIn4e-0005Wa-HQ; Wed, 25 Aug 2021 03:11:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46078
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIn4d-0000fP-2y; Wed, 25 Aug 2021 03:11:48 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIn4C-00073j-Jt; Wed, 25 Aug 2021 08:11:26 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <e9a9b7f8c4530109b083bf19c547532f14db32a1.1629799776.git.fthain@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <e7042a4f-1958-3e42-2d2e-9cf63eda6f5a@ilande.co.uk>
Date: Wed, 25 Aug 2021 08:11:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e9a9b7f8c4530109b083bf19c547532f14db32a1.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 04/10] hw/mos6522: Rename timer callback functions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.305,
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
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2021 11:09, Finn Thain wrote:

> This improves readability.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>   hw/misc/mos6522.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 1d4a56077e..c0d6bee4cc 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -154,7 +154,7 @@ static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
>       }
>   }
>   
> -static void mos6522_timer1(void *opaque)
> +static void mos6522_timer1_expired(void *opaque)
>   {
>       MOS6522State *s = opaque;
>       MOS6522Timer *ti = &s->timers[0];
> @@ -164,7 +164,7 @@ static void mos6522_timer1(void *opaque)
>       mos6522_update_irq(s);
>   }
>   
> -static void mos6522_timer2(void *opaque)
> +static void mos6522_timer2_expired(void *opaque)
>   {
>       MOS6522State *s = opaque;
>       MOS6522Timer *ti = &s->timers[1];
> @@ -445,8 +445,10 @@ static void mos6522_init(Object *obj)
>           s->timers[i].index = i;
>       }
>   
> -    s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer1, s);
> -    s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer2, s);
> +    s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                      mos6522_timer1_expired, s);
> +    s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                      mos6522_timer2_expired, s);
>   }
>   
>   static void mos6522_finalize(Object *obj)

I'm not overly keen on this one: the general QEMU convention for a timer callback is 
for it to be named *_timer() rather than *_expired(), so I'd prefer to keep this 
consistent with the rest of the codebase.


ATB,

Mark.

