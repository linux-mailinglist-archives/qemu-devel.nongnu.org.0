Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426B652410
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 09:09:13 +0200 (CEST)
Received: from localhost ([::1]:57018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hffZo-0002r6-EI
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 03:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58718)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <atar4qemu@gmail.com>) id 1hffVk-0001lz-N9
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 03:05:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <atar4qemu@gmail.com>) id 1hffVj-0000wn-BL
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 03:05:00 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:35151)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <atar4qemu@gmail.com>) id 1hffVi-0000uW-WB
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 03:04:59 -0400
Received: by mail-io1-xd44.google.com with SMTP id m24so295673ioo.2
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 00:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7WcuPFvvgwavS8cJ2IWDuusKpU3X2B9vBzghhkLVXHw=;
 b=WzIWgxppEoJOPU16+Y9DRUBeIELpUrcIgMVph7OtgOdL4F+RElwsMb03gIeyucBwSI
 oADGDHsO2Q+r23+JasDb/YYb6Px6DhHMWuOVSbtyF9IwuNs56cizPR8rrz54bVi4Z1QY
 4POjJ98zDtG5yc5ki9cjapyFgesobkYjmp5WRNw2H+VBMB1bqp9RB9PnAp9wR4syzhXJ
 W2us8/AaHYbz4LufP8cVA6/VIqdtlQ+3902VjTzqif6OVkWTLM/T8Z/7/VFs9QcY/c1G
 4uHkRxs3MCOtf2imkGrwuVat860Y/Mtj0TbaPU+M7NvN3p6oJREopyvOvECALZvvMY84
 mX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7WcuPFvvgwavS8cJ2IWDuusKpU3X2B9vBzghhkLVXHw=;
 b=cZugdN9Re7cOcPMPdHcUKLVv0xBJ4sMf2GNFwi7pA9HEV3aummpR8wRkkZY+FY7CWo
 d0HZv5d/uchINj9cmzZuXzZTHrzz9SDRtPW++7u8Ss06OkV1emh/6re1lv+N8RbbL3oB
 OQZXTU5Kr9MZzNJ1vBV50gP++Pt0DNmF4xnBL5PX8VOGgxvp/ZAtA0ueLffju+A5q5vG
 I9jBao8xR260YfDI2QsEyPb2c/YlhAmSu6ThydAJ3UQWzDJ/thzr/iNxOz46zPRA6fsY
 G8PsMmRDrhNRCnvrcXo8Va3nVjTiQpziaWq98kkUdCcvR3ac7f5F5DRU2HWEGg1b6o/n
 DyDg==
X-Gm-Message-State: APjAAAUrTq+crMI119XjqJ4hQb7xJWcSdDBVrbBz2arzrKEhxvEcvnfW
 GQQH3DaTOg+WjuuDXG2mdcVATn23Bp/MVP+eRQc=
X-Google-Smtp-Source: APXvYqz+XNSk9XJeGC+TfZCLLTS1a3+BXaUNN4gGkCKxQX/9tgy2Ml55+8G/8A168z4NzAr8BzMCOz3zJIpt9bvK5Q4=
X-Received: by 2002:a6b:6012:: with SMTP id r18mr4344705iog.241.1561446298031; 
 Tue, 25 Jun 2019 00:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190624220056.25861-1-f4bug@amsat.org>
 <20190624220056.25861-7-f4bug@amsat.org>
In-Reply-To: <20190624220056.25861-7-f4bug@amsat.org>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Tue, 25 Jun 2019 09:04:47 +0200
Message-ID: <CACXAS8BbvAWr0UW9_RCnu0qGH-A1TtRrW9O9zC5dnEwSV2a_Bw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Subject: Re: [Qemu-devel] [PATCH 6/9] hw/misc/empty_slot: Convert debug
 printf()s to trace events
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 25, 2019 at 12:01 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>

> ---
>  hw/misc/empty_slot.c | 19 ++++++++-----------
>  hw/misc/trace-events |  4 ++++
>  2 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/hw/misc/empty_slot.c b/hw/misc/empty_slot.c
> index c32241a9e5..b810655554 100644
> --- a/hw/misc/empty_slot.c
> +++ b/hw/misc/empty_slot.c
> @@ -15,15 +15,7 @@
>  #include "hw/sysbus.h"
>  #include "qemu/module.h"
>  #include "hw/misc/empty_slot.h"
> -
> -//#define DEBUG_EMPTY_SLOT
> -
> -#ifdef DEBUG_EMPTY_SLOT
> -#define DPRINTF(fmt, ...)                                       \
> -    do { printf("empty_slot: " fmt , ## __VA_ARGS__); } while (0)
> -#else
> -#define DPRINTF(fmt, ...) do {} while (0)
> -#endif
> +#include "trace.h"
>
>  #define TYPE_EMPTY_SLOT "empty_slot"
>  #define EMPTY_SLOT(obj) OBJECT_CHECK(EmptySlot, (obj), TYPE_EMPTY_SLOT)
> @@ -39,14 +31,19 @@ typedef struct EmptySlot {
>  static uint64_t empty_slot_read(void *opaque, hwaddr addr,
>                                  unsigned size)
>  {
> -    DPRINTF("read from " TARGET_FMT_plx "\n", addr);
> +    EmptySlot *s =3D EMPTY_SLOT(opaque);
> +
> +    trace_empty_slot_write(addr, size << 1, 0, size, s->name);
> +
>      return 0;
>  }
>
>  static void empty_slot_write(void *opaque, hwaddr addr,
>                               uint64_t val, unsigned size)
>  {
> -    DPRINTF("write 0x%x to " TARGET_FMT_plx "\n", (unsigned)val, addr);
> +    EmptySlot *s =3D EMPTY_SLOT(opaque);
> +
> +    trace_empty_slot_write(addr, size << 1, val, size, s->name);
>  }
>
>  static const MemoryRegionOps empty_slot_ops =3D {
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 47e1bccf71..b81135ab1e 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -1,5 +1,9 @@
>  # See docs/devel/tracing.txt for syntax documentation.
>
> +# empty_slot.c
> +empty_slot_read(uint64_t addr, unsigned width, uint64_t value, unsigned =
size, const char *name) "rd addr:0x%04"PRIx64" data:0x%0*"PRIx64" size %u [=
%s]"
> +empty_slot_write(uint64_t addr, unsigned width, uint64_t value, unsigned=
 size, const char *name) "wr addr:0x%04"PRIx64" data:0x%0*"PRIx64" size %u =
[%s]"
> +
>  # eccmemctl.c
>  ecc_mem_writel_mer(uint32_t val) "Write memory enable 0x%08x"
>  ecc_mem_writel_mdr(uint32_t val) "Write memory delay 0x%08x"
> --
> 2.19.1
>


--=20
Regards,
Artyom Tarasenko

SPARC and PPC PReP under qemu blog: http://tyom.blogspot.com/search/label/q=
emu

