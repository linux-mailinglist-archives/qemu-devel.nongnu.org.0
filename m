Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115E78B522
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 12:12:08 +0200 (CEST)
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxTmh-0008Fd-25
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 06:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59677)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hxTmC-0007px-1f
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 06:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hxTmA-0004FW-Bs
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 06:11:35 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51782)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hxTmA-0004E8-1i
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 06:11:34 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so962497wma.1
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 03:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JA20UDQ6+LOswDOmvjV6VZckvggg6DhVcGBN0Zex39c=;
 b=RORYG77TBeI9tnwYx1E6ijN9PX1umzMbaj5M4v5GAeTb46PwdpnbbHfHyj/eh1FjBc
 HBFM8Chjj666sE9ZQZww5bMZQkLd0GdZdSjCueZaPvgwcGTaI5AkzDE7X2gZkcvX6fpo
 s7MeCJufboizKePRpOT/jsX7BDQGyjAGa5Pr91/2/4o8kVN/aAOdtTVsBQgcQ2FZwyDG
 vlu+9+mc9uHZnyJYnpHUQHoNMX1DYoRCpmax0Yl8vyp9vfh+8NktheY/bshpGFu5Ye8b
 Nu+dHKJBqrU/dO9bib+5/KVPMpU2whrCoNn1AJFANYpdpo1g4T4IbfBTh5U0wvIOe6t7
 P+RQ==
X-Gm-Message-State: APjAAAUCizq5DSrCbw88If5px9cZwfF6q6ez9sDxJQME0sNcZMa5naW1
 W++C7fag6THWgMbYkCcBZ8ueAQ==
X-Google-Smtp-Source: APXvYqw+KFCdiTuJGyqNbOImsuWFBmgNs95ADIor3Q8MJhZo9jvNGX4jirho34YhL6VRrY1vSa+WNA==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr2203301wmi.11.1565691091988; 
 Tue, 13 Aug 2019 03:11:31 -0700 (PDT)
Received: from [192.168.1.35] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id q19sm760428wmc.41.2019.08.13.03.11.30
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 03:11:31 -0700 (PDT)
To: Thomas Huth <huth@tuxfamily.org>, qemu-devel@nongnu.org
References: <20190709073222.26370-1-huth@tuxfamily.org>
 <20190709073222.26370-2-huth@tuxfamily.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f2ba6fc7-dbe7-b82c-b605-b2280af39613@redhat.com>
Date: Tue, 13 Aug 2019 12:11:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190709073222.26370-2-huth@tuxfamily.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH v4 1/6] m68k: Add NeXTcube framebuffer
 device emulation
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/19 9:32 AM, Thomas Huth wrote:
> The NeXTcube uses a linear framebuffer with 4 greyscale colors and
> a fixed resolution of 1120 * 832.
> This code has been taken from Bryce Lanham's GSoC 2011 NeXT branch at
> 
>  https://github.com/blanham/qemu-NeXT/blob/next-cube/hw/next-fb.c
> 
> and altered to fit the latest interface of the current QEMU (e.g.
> the device has been "qdev"-ified etc.).
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  default-configs/m68k-softmmu.mak |   1 +
>  hw/display/Makefile.objs         |   1 +
>  hw/display/next-fb.c             | 145 +++++++++++++++++++++++++++++++
>  hw/m68k/Kconfig                  |   4 +
>  include/hw/m68k/next-cube.h      |   7 ++
>  5 files changed, 158 insertions(+)
>  create mode 100644 hw/display/next-fb.c
>  create mode 100644 include/hw/m68k/next-cube.h
> 
> diff --git a/default-configs/m68k-softmmu.mak b/default-configs/m68k-softmmu.mak
> index 4049a8f2ba..d67ab8b96d 100644
> --- a/default-configs/m68k-softmmu.mak
> +++ b/default-configs/m68k-softmmu.mak
> @@ -6,3 +6,4 @@ CONFIG_SEMIHOSTING=y
>  #
>  CONFIG_AN5206=y
>  CONFIG_MCF5208=y
> +CONFIG_NEXTCUBE=y
> diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
> index a64998fc7b..8d1c71026d 100644
> --- a/hw/display/Makefile.objs
> +++ b/hw/display/Makefile.objs
> @@ -38,6 +38,7 @@ obj-$(CONFIG_RASPI) += bcm2835_fb.o
>  obj-$(CONFIG_SM501) += sm501.o
>  obj-$(CONFIG_TCX) += tcx.o
>  obj-$(CONFIG_CG3) += cg3.o
> +obj-$(CONFIG_NEXTCUBE) += next-fb.o
>  
>  obj-$(CONFIG_VGA) += vga.o
>  
> diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
> new file mode 100644
> index 0000000000..916a002f61
> --- /dev/null
> +++ b/hw/display/next-fb.c
> @@ -0,0 +1,145 @@
> +/*
> + * NeXT Cube/Station Framebuffer Emulation
> + *
> + * Copyright (c) 2011 Bryce Lanham
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "ui/console.h"
> +#include "hw/hw.h"
> +#include "hw/boards.h"
> +#include "hw/loader.h"
> +#include "hw/display/framebuffer.h"
> +#include "ui/pixel_ops.h"
> +#include "hw/m68k/next-cube.h"
> +
> +#define NEXTFB(obj) OBJECT_CHECK(NeXTFbState, (obj), TYPE_NEXTFB)
> +
> +struct NeXTFbState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion fb_mr;
> +    MemoryRegionSection fbsection;
> +    QemuConsole *con;
> +
> +    uint32_t pitch;
> +    uint32_t cols;
> +    uint32_t rows;
> +    int invalidate;
> +};
> +typedef struct NeXTFbState NeXTFbState;
> +
> +static void nextfb_draw_line(void *opaque, uint8_t *d, const uint8_t *s,
> +                             int width, int pitch)
> +{
> +    NeXTFbState *nfbstate = NEXTFB(opaque);
> +    static const uint32_t pal[4] = {
> +        0xFFFFFFFF, 0xFFAAAAAA, 0xFF555555, 0xFF000000
> +    };
> +    uint32_t *buf = (uint32_t *)d;
> +    int i = 0;
> +
> +    for (i = 0; i < nfbstate->cols / 4; i++) {
> +        int j = i * 4;
> +        uint8_t src = s[i];
> +        buf[j + 3] = pal[src & 0x3];
> +        src >>= 2;
> +        buf[j + 2] = pal[src & 0x3];
> +        src >>= 2;
> +        buf[j + 1] = pal[src & 0x3];
> +        src >>= 2;
> +        buf[j + 0] = pal[src & 0x3];
> +    }
> +}
> +
> +static void nextfb_update(void *opaque)
> +{
> +    NeXTFbState *s = NEXTFB(opaque);
> +    int dest_width = 4;
> +    int src_width;
> +    int first = 0;
> +    int last  = 0;
> +    DisplaySurface *surface = qemu_console_surface(s->con);
> +
> +    src_width = s->cols / 4 + 8;
> +    dest_width = s->cols * 4;
> +
> +    if (s->invalidate) {
> +        framebuffer_update_memory_section(&s->fbsection, &s->fb_mr, 0,
> +                                          s->cols, src_width);
> +        s->invalidate = 0;
> +    }
> +
> +    framebuffer_update_display(surface, &s->fbsection, s->cols, s->rows,
> +                               src_width, dest_width, 0, 1, nextfb_draw_line,
> +                               s, &first, &last);
> +
> +    dpy_gfx_update(s->con, 0, 0, s->cols, s->rows);
> +}
> +
> +static void nextfb_invalidate(void *opaque)
> +{
> +    NeXTFbState *s = NEXTFB(opaque);
> +    s->invalidate = 1;
> +}
> +
> +static const GraphicHwOps nextfb_ops = {
> +    .invalidate  = nextfb_invalidate,
> +    .gfx_update  = nextfb_update,
> +};
> +
> +static void nextfb_realize(DeviceState *dev, Error **errp)
> +{
> +    NeXTFbState *s = NEXTFB(dev);
> +
> +    memory_region_init_ram(&s->fb_mr, OBJECT(dev), "next-video", 0x1CB100,
> +                           &error_fatal);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->fb_mr);
> +
> +    s->invalidate = 1;
> +    s->cols = 1120;
> +    s->rows = 832;
> +
> +    s->con = graphic_console_init(dev, 0, &nextfb_ops, s);
> +    qemu_console_resize(s->con, s->cols, s->rows);
> +}
> +
> +static void nextfb_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> +    dc->realize = nextfb_realize;
> +}
> +
> +static const TypeInfo nextfb_info = {
> +    .name          = TYPE_NEXTFB,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(NeXTFbState),
> +    .class_init    = nextfb_class_init,
> +};
> +
> +static void nextfb_register_types(void)
> +{
> +    type_register_static(&nextfb_info);
> +}
> +
> +type_init(nextfb_register_types)
> diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
> index 49ef0b3f6d..ec58a2eb06 100644
> --- a/hw/m68k/Kconfig
> +++ b/hw/m68k/Kconfig
> @@ -7,3 +7,7 @@ config MCF5208
>      bool
>      select COLDFIRE
>      select PTIMER
> +
> +config NEXTCUBE
> +    bool
> +    select FRAMEBUFFER
> diff --git a/include/hw/m68k/next-cube.h b/include/hw/m68k/next-cube.h
> new file mode 100644
> index 0000000000..090c7c51aa
> --- /dev/null
> +++ b/include/hw/m68k/next-cube.h
> @@ -0,0 +1,7 @@
> +
> +#ifndef NEXT_CUBE_H
> +#define NEXT_CUBE_H
> +
> +#define TYPE_NEXTFB "next-fb"
> +
> +#endif /* NEXT_CUBE_H */
> 

