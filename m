Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F85412701
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 21:49:31 +0200 (CEST)
Received: from localhost ([::1]:50108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSPI9-0006sN-Gc
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 15:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPH4-0006Bk-EG
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:48:22 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:42773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPH2-0007l9-C6
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:48:22 -0400
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MUXd0-1mJVL72fia-00QP9j; Mon, 20 Sep 2021 21:48:17 +0200
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v4 04/20] nubus: use bitmap to manage available slots
Message-ID: <5398d9ef-d243-f600-2ec6-8ea8c0d48b09@vivier.eu>
Date: Mon, 20 Sep 2021 21:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VHPjzaNeOE25FCFwnBzraXa/FEpu44TNBJH4Xq3WFiS3QX1oZPL
 RZuJ8dsFcQr6xw3QhhiDuu7Y0KxR8euY5qYKP3aoUjQhbuqyYk6E3xo4YnRQvGYgCbXvJb5
 mOwICtMrPyzSNKG/mltLdPiXI0TEPYShEtbzK+2M8WrnDqnAzjrXNy9VEXERd5Zf9n6UFTn
 GPHH5o7lE7khfr6363Ojg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qceg44/Rejw=:Pdg5PIan13AB3ML8PZu6iH
 05jRcNw2Hw4IJzWYDv/yGfq465tg74nRuaNJI4vaZPnlYWxtpwiiqA3zb81bpn7e3cc8bUFhb
 hV+3SpsfMbiX+5FFomC+0hLAkPvxN+wk9INu2xGM6pSNcr8WpJYYQPQcFNAmCwBh8AEy++64T
 kifsscwa798uIdQhDOKKxh7L7qkQu+75mEbuNe74AuNwwFHa7TOV8kIJBg3/oCW9V1jC0bL+r
 +nnHmxvcLyCGvnq6nCLinFvcBdH3GZ4y2JW0Nqc4GsBwg8FkF8tMYYk4gvTpD/rOYAcfr7V57
 7Eq8GBYIdaRUQmFtsP4LeByxvDB/8j0K99JkDNSZ1S5ts/eiQk5DSE5oeyJayxJdApWQwc+Hs
 YU7l2Zv9fiFylZ6CCvNUnXezLGIo7Lx8IWvO/WtEexcLCWzAs5px6dBMLfljBAe1cUiG72+gC
 +HKRrIAsavKs3iHuWCbzBgdA7tDj2icTuBDlRVT18ghpIx1StrXyuvpT7ME77UjwA2nT2PI3c
 2adJB3vlaYlNHxJ79WEB+KOdtY3Dh2LrzUVwfSXlHRYROouRp8ROmYEqKnC617rE4lcml6K7y
 Z3kksk0JHsoBwR9ohZPbRI8yUN1wPq1zKFCmzvHYsBkjKW/LNGBhcj2nSNyRRnhUN4WN+6kwO
 lk47MGlZUlJlhxjCX6mGBH0VfSIc+yXReXEsfvzl+RHfFTV3VqgQjGMNNu2M2T3LOvYqoHtbt
 uPWAi4skM+n4zsrGv1LTUO0bwN2IY0WndPqIxQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> Convert nubus_device_realize() to use a bitmap to manage available slots to allow
> for future Nubus devices to be plugged into arbitrary slots from the command line.
> 
> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on a Macintosh
> machines as documented in "Desigining Cards and Drivers for the Macintosh Family".

Perhaps we can also add "NuBus Specification" for the non mac-nubus part?

http://www.bitsavers.org/pdf/ti/nubus/2242825-0001_NuBus_Spec1983.pdf

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/mac-nubus-bridge.c |  3 +++
>  hw/nubus/nubus-bus.c        |  2 +-
>  hw/nubus/nubus-device.c     | 29 +++++++++++++++++++++++++----
>  include/hw/nubus/nubus.h    |  4 ++--
>  4 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
> index 7c329300b8..c1d77e2bc7 100644
> --- a/hw/nubus/mac-nubus-bridge.c
> +++ b/hw/nubus/mac-nubus-bridge.c
> @@ -18,6 +18,9 @@ static void mac_nubus_bridge_init(Object *obj)
>  
>      s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
>  
> +    /* Macintosh only has slots 0x9 to 0xe available */
> +    s->bus->slot_available_mask = MAKE_64BIT_MASK(9, 6);

Perhaps we can introduce MAC_NUBUS_FIRST_SLOT and MAC_NUBUS_LAST_SLOT

#define MAC_NUBUS_FIRST_SLOT 0x9
#define MAC_NUBUS_LAST_SLOT  0xe

MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT, MAC_NUBUS_LAST_SLOT - MAC_NUBUS_FIRST_SLOT + 1)

> +
>      sysbus_init_mmio(sbd, &s->bus->super_slot_io);
>      sysbus_init_mmio(sbd, &s->bus->slot_io);
>  }
> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
> index 5c13452308..404c1032e0 100644
> --- a/hw/nubus/nubus-bus.c
> +++ b/hw/nubus/nubus-bus.c
> @@ -84,7 +84,7 @@ static void nubus_init(Object *obj)
>                            nubus, "nubus-slots",
>                            NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
>  
> -    nubus->current_slot = NUBUS_FIRST_SLOT;
> +    nubus->slot_available_mask = MAKE_64BIT_MASK(0, 16);

MAKE_64BIT_MASK(NUBUS_FIRST_SLOT, NUBUS_LAST_SLOT - NUBUS_FIRST_SLOT + 1) ?

And we define 16 slots, but NUBUS_SLOT_NB (above) is 15. (I think it's the value for Mac as last
slot is 0xe)

>  }
>  
>  static void nubus_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index c1832f73da..d91a1e4af3 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -160,14 +160,35 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>      NubusDevice *nd = NUBUS_DEVICE(dev);
>      char *name;
>      hwaddr slot_offset;
> +    uint16_t s;
> +
> +    if (nd->slot == -1) {
> +        /* No slot specified, find first available free slot */
> +        s = ctz32(nubus->slot_available_mask);
> +        if (s != 32) {
> +            nd->slot = s;
> +        } else {
> +            error_setg(errp, "Cannot register nubus card, no free slot "
> +                             "available");
> +            return;
> +        }
> +    } else {
> +        /* Slot specified, make sure the slot is available */
> +        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
> +            error_setg(errp, "Cannot register nubus card, slot %d is "
> +                             "unavailable or already occupied", nd->slot);
> +            return;
> +        }
> +    }
>  
> -    if (nubus->current_slot < NUBUS_FIRST_SLOT ||
> -            nubus->current_slot > NUBUS_LAST_SLOT) {
> -        error_setg(errp, "Cannot register nubus card, not enough slots");
> +    if (nd->slot < NUBUS_FIRST_SLOT || nd->slot > NUBUS_LAST_SLOT) {
> +        error_setg(errp, "Cannot register nubus card, slot must be "
> +                         "between %d and %d", NUBUS_FIRST_SLOT,
> +                         NUBUS_LAST_SLOT);

Do we need this checking as we already checked the slot bit is available?
Moreover it would be more accurate to rely on the bitmap as the first available slot differs between
nubus and mac-nubus.


>          return;
>      }
>  
> -    nd->slot = nubus->current_slot++;
> +    nubus->slot_available_mask &= ~BIT(nd->slot);
>  
>      /* Super */
>      slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
> index 357f621d15..8ff4736259 100644
> --- a/include/hw/nubus/nubus.h
> +++ b/include/hw/nubus/nubus.h
> @@ -19,7 +19,7 @@
>  #define NUBUS_SLOT_SIZE       0x01000000
>  #define NUBUS_SLOT_NB         0xF
>  
> -#define NUBUS_FIRST_SLOT      0x9
> +#define NUBUS_FIRST_SLOT      0x0
>  #define NUBUS_LAST_SLOT       0xF
>  
>  #define TYPE_NUBUS_DEVICE "nubus-device"
> @@ -36,7 +36,7 @@ struct NubusBus {
>      MemoryRegion super_slot_io;
>      MemoryRegion slot_io;
>  
> -    int current_slot;
> +    uint32_t slot_available_mask;
>  };
>  
>  struct NubusDevice {
> 


