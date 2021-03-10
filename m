Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214193337CC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:49:37 +0100 (CET)
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuX9-0007ac-OX
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuSK-0004r8-En
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:44:36 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:50915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuSI-0005O1-Es
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:44:36 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKsWr-1l1YlB1vlF-00LJ2d; Wed, 10 Mar 2021 09:44:32 +0100
Subject: Re: [PATCH 5/7] mac_via: rename VBL timer to 60Hz timer
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-6-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2b2f4f17-c2dc-4510-caa7-25784390b077@vivier.eu>
Date: Wed, 10 Mar 2021 09:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310080908.11861-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p+dkCC3Lecf4geSEV7k+QaV47oItiCo3Vkk5XuCBx25crOR4z+P
 3WfE/ix/ueRNaUKLfCf3pUqaINNSLUcZGBINP63uAXOBig9a71SvUlSB+4ae5zsT4g7P/Tp
 lT1Rq4z4d6OPNOY8Cd83vfJIJcFu+ez0SG593k6gGUfS3OHB9mcKj/9ZAe7NtCXUslASLLv
 mmGNtIoQx+SYANP9/mqdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oC/OlSe9uAQ=:JbZuOSemfMmkKLIajjmGIi
 2A+ZsOB6/DeXuruJM97iDOjaBIr2KJbfKVBh+oYAKt+iiaZLxvQhlSYCNB+v8DnMzd05JSDeg
 XRDHLAQijkJu4nsxnmp0exYwbzsdylm+GVjIl77tvr1+DKt61wQfWaHc5wn1r+hGMAijekbNx
 XkiaZzUZmRxYDzG4h6noNdgwEYe5/wMJPG9qPyyK4MGnQH0JTpqbYLnX6/djXdfYMoKAEwAeb
 /v0stywhdCOPfJJvoKdy3BNkh5hnXmnwXSD+COT8mkRyoWbtp+wFQpbUq5TrNsb80tZM7JQWM
 4DMoeozJ2sXEVvoe0/HKN3mxsylhQitlBaTr3xmW1TdDoBZHJ90cCfGWxm3Aa/onof/6nErdh
 eoDkFm2PnoIJGoTjbRXraAuTDQnPJ6jIUA5IDyrydsN9mRQ0hORbpYM299oj09Ommgqyk/PG+
 +IK+OzgS3A==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Le 10/03/2021 à 09:09, Mark Cave-Ayland a écrit :
> According to the "Guide To The Macintosh Family Hardware", the 60Hz VIA1 timer
> on newer Macs such as the Quadra only exists for compatibility with old software
> and is no longer synced to the VBL interval.
> 
> Rename the VBL timer to 60Hz timer to emphasise this and to prevent confusion
> when the real VBL interrupt (now handled as a NuBus slot interrupt) is added in
> future.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c         | 41 ++++++++++++++++++++-------------------
>  include/hw/misc/mac_via.h |  8 ++++----
>  2 files changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
> index 76f31b8cae..f994fefa7c 100644
> --- a/hw/misc/mac_via.c
> +++ b/hw/misc/mac_via.c
> @@ -297,18 +297,18 @@ enum {
>      REG_EMPTY = 0xff,
>  };
>  
> -static void via1_VBL_update(MOS6522Q800VIA1State *v1s)
> +static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
>  {
>      MOS6522State *s = MOS6522(v1s);
>  
>      /* 60 Hz irq */
> -    v1s->next_VBL = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
> -                    16630 * 16630;
> +    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
> +                          16630 * 16630;
>  
> -    if (s->ier & VIA1_IRQ_VBLANK) {
> -        timer_mod(v1s->VBL_timer, v1s->next_VBL);
> +    if (s->ier & VIA1_IRQ_60HZ) {
> +        timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
>      } else {
> -        timer_del(v1s->VBL_timer);
> +        timer_del(v1s->sixty_hz_timer);
>      }
>  }
>  
> @@ -325,16 +325,16 @@ static void via1_one_second_update(MOS6522Q800VIA1State *v1s)
>      }
>  }
>  
> -static void via1_VBL(void *opaque)
> +static void via1_sixty_hz(void *opaque)
>  {
>      MOS6522Q800VIA1State *v1s = opaque;
>      MOS6522State *s = MOS6522(v1s);
>      MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
>  
> -    s->ifr |= VIA1_IRQ_VBLANK;
> +    s->ifr |= VIA1_IRQ_60HZ;
>      mdc->update_irq(s);
>  
> -    via1_VBL_update(v1s);
> +    via1_sixty_hz_update(v1s);
>  }
>  
>  static void via1_one_second(void *opaque)
> @@ -897,12 +897,12 @@ static uint64_t mos6522_q800_via1_read(void *opaque, hwaddr addr, unsigned size)
>  
>      /*
>       * If IRQs are disabled, timers are disabled, but we need to update
> -     * VIA1_IRQ_VBLANK and VIA1_IRQ_ONE_SECOND bits in the IFR
> +     * VIA1_IRQ_60HZ and VIA1_IRQ_ONE_SECOND bits in the IFR
>       */
>  
> -    if (now >= s->next_VBL) {
> -        ms->ifr |= VIA1_IRQ_VBLANK;
> -        via1_VBL_update(s);
> +    if (now >= s->next_sixty_hz) {
> +        ms->ifr |= VIA1_IRQ_60HZ;
> +        via1_sixty_hz_update(s);
>      }
>      if (now >= s->next_second) {
>          ms->ifr |= VIA1_IRQ_ONE_SECOND;
> @@ -933,7 +933,7 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
>      }
>  
>      via1_one_second_update(v1s);
> -    via1_VBL_update(v1s);
> +    via1_sixty_hz_update(v1s);
>  }
>  
>  static const MemoryRegionOps mos6522_q800_via1_ops = {
> @@ -983,8 +983,8 @@ static void mac_via_reset(DeviceState *dev)
>  
>      adb_set_autopoll_enabled(adb_bus, true);
>  
> -    timer_del(v1s->VBL_timer);
> -    v1s->next_VBL = 0;
> +    timer_del(v1s->sixty_hz_timer);
> +    v1s->next_sixty_hz = 0;
>      timer_del(v1s->one_second_timer);
>      v1s->next_second = 0;
>  
> @@ -1026,8 +1026,9 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
>      m->mos6522_via1.one_second_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
>                                                       via1_one_second,
>                                                       &m->mos6522_via1);
> -    m->mos6522_via1.VBL_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, via1_VBL,
> -                                              &m->mos6522_via1);
> +    m->mos6522_via1.sixty_hz_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                                  via1_sixty_hz,
> +                                                  &m->mos6522_via1);
>  
>      qemu_get_timedate(&tm, 0);
>      m->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
> @@ -1116,8 +1117,8 @@ static const VMStateDescription vmstate_mac_via = {
>          VMSTATE_BUFFER(mos6522_via1.PRAM, MacVIAState),
>          VMSTATE_TIMER_PTR(mos6522_via1.one_second_timer, MacVIAState),
>          VMSTATE_INT64(mos6522_via1.next_second, MacVIAState),
> -        VMSTATE_TIMER_PTR(mos6522_via1.VBL_timer, MacVIAState),
> -        VMSTATE_INT64(mos6522_via1.next_VBL, MacVIAState),
> +        VMSTATE_TIMER_PTR(mos6522_via1.sixty_hz_timer, MacVIAState),
> +        VMSTATE_INT64(mos6522_via1.next_sixty_hz, MacVIAState),
>          VMSTATE_STRUCT(mos6522_via2.parent_obj, MacVIAState, 0, vmstate_mos6522,
>                         MOS6522State),
>          /* RTC */
> diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
> index a59f0bd422..3058b30685 100644
> --- a/include/hw/misc/mac_via.h
> +++ b/include/hw/misc/mac_via.h
> @@ -17,7 +17,7 @@
>  
>  /* VIA 1 */
>  #define VIA1_IRQ_ONE_SECOND_BIT 0
> -#define VIA1_IRQ_VBLANK_BIT     1
> +#define VIA1_IRQ_60HZ_BIT       1
>  #define VIA1_IRQ_ADB_READY_BIT  2
>  #define VIA1_IRQ_ADB_DATA_BIT   3
>  #define VIA1_IRQ_ADB_CLOCK_BIT  4
> @@ -25,7 +25,7 @@
>  #define VIA1_IRQ_NB             8
>  
>  #define VIA1_IRQ_ONE_SECOND (1 << VIA1_IRQ_ONE_SECOND_BIT)
> -#define VIA1_IRQ_VBLANK     (1 << VIA1_IRQ_VBLANK_BIT)
> +#define VIA1_IRQ_60HZ       (1 << VIA1_IRQ_60HZ_BIT)
>  #define VIA1_IRQ_ADB_READY  (1 << VIA1_IRQ_ADB_READY_BIT)
>  #define VIA1_IRQ_ADB_DATA   (1 << VIA1_IRQ_ADB_DATA_BIT)
>  #define VIA1_IRQ_ADB_CLOCK  (1 << VIA1_IRQ_ADB_CLOCK_BIT)
> @@ -45,8 +45,8 @@ struct MOS6522Q800VIA1State {
>      /* external timers */
>      QEMUTimer *one_second_timer;
>      int64_t next_second;
> -    QEMUTimer *VBL_timer;
> -    int64_t next_VBL;
> +    QEMUTimer *sixty_hz_timer;
> +    int64_t next_sixty_hz;
>  };
>  
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

