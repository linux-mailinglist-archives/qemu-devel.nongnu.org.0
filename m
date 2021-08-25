Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA903F6FE4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 08:56:39 +0200 (CEST)
Received: from localhost ([::1]:52762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mImpt-0007FG-2p
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 02:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mImos-0006IA-Rr; Wed, 25 Aug 2021 02:55:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46038
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mImoq-0002ZE-Tw; Wed, 25 Aug 2021 02:55:30 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mImoO-0006tg-Bl; Wed, 25 Aug 2021 07:55:05 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <9b78e8c6e453feab6275d04bf503051645770d85.1629799776.git.fthain@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ee403f8a-2fde-56cd-789f-a2ab7f35eb00@ilande.co.uk>
Date: Wed, 25 Aug 2021 07:55:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9b78e8c6e453feab6275d04bf503051645770d85.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 01/10] hw/mos6522: Remove get_load_time() methods and
 functions
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

> This code appears to be unnecessary.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>   hw/misc/mos6522.c | 22 +---------------------
>   1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 1c57332b40..a478c1ca43 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -63,17 +63,6 @@ static uint64_t get_counter_value(MOS6522State *s, MOS6522Timer *ti)
>       }
>   }
>   
> -static uint64_t get_load_time(MOS6522State *s, MOS6522Timer *ti)
> -{
> -    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
> -
> -    if (ti->index == 0) {
> -        return mdc->get_timer1_load_time(s, ti);
> -    } else {
> -        return mdc->get_timer2_load_time(s, ti);
> -    }
> -}
> -
>   static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
>   {
>       int64_t d;
> @@ -98,7 +87,7 @@ static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
>   static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
>   {
>       trace_mos6522_set_counter(1 + ti->index, val);
> -    ti->load_time = get_load_time(s, ti);
> +    ti->load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>       ti->counter_value = val;
>       if (ti->index == 0) {
>           mos6522_timer1_update(s, ti, ti->load_time);
> @@ -208,13 +197,6 @@ static uint64_t mos6522_get_counter_value(MOS6522State *s, MOS6522Timer *ti)
>                       ti->frequency, NANOSECONDS_PER_SECOND);
>   }
>   
> -static uint64_t mos6522_get_load_time(MOS6522State *s, MOS6522Timer *ti)
> -{
> -    uint64_t load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -
> -    return load_time;
> -}
> -
>   static void mos6522_portA_write(MOS6522State *s)
>   {
>       qemu_log_mask(LOG_UNIMP, "portA_write unimplemented\n");
> @@ -518,8 +500,6 @@ static void mos6522_class_init(ObjectClass *oc, void *data)
>       mdc->update_irq = mos6522_update_irq;
>       mdc->get_timer1_counter_value = mos6522_get_counter_value;
>       mdc->get_timer2_counter_value = mos6522_get_counter_value;
> -    mdc->get_timer1_load_time = mos6522_get_load_time;
> -    mdc->get_timer2_load_time = mos6522_get_load_time;
>   }
>   
>   static const TypeInfo mos6522_type_info = {

Both the get_counter_value() and get_load_time() callbacks are used as part of the 
CUDA emulation in hw/misc/macio/cuda.c as per the comment:

/* MacOS uses timer 1 for calibration on startup, so we use
  * the timebase frequency and cuda_get_counter_value() with
  * cuda_get_load_time() to steer MacOS to calculate calibrate its timers
  * correctly for both TCG and KVM (see commit b981289c49 "PPC: Cuda: Use cuda
  * timer to expose tbfreq to guest" for more information) */

Certainly for the 6522 device it is worth configuring with --target-list="ppc-softmmu 
m68k-softmmu" to make sure that you don't inadvertently break anything in the PPC world.

A bit of history here: the original mos6522.c was extracted from hw/misc/macio/cuda.c 
when Laurent presented his initial q800 patches since they also had their own 
implementation of the 6522, and it was better to move the implementation into a 
separate QEMU device so that the logic could be shared.

The Darwin kernel timer calibration loop is quite hard to get right: see 
https://opensource.apple.com/source/xnu/xnu-123.5/pexpert/ppc/pe_clock_speed_asm.s.auto.html 
and 
https://opensource.apple.com/source/xnu/xnu-123.5/pexpert/ppc/pe_clock_speed.c.auto.html. 
Ben/Alex came up with the current mechanism to fool the calibration routine, and I 
simply added in those callbacks to allow it to be implemented as part of the 
now-generic 6522 device.


ATB,

Mark.

