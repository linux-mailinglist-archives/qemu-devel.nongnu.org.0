Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01917410DB8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 01:04:58 +0200 (CEST)
Received: from localhost ([::1]:55728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS5rl-0000yR-2a
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 19:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mS5qN-0008Gv-Du
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 19:03:31 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:42829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mS5qL-0001u2-Ag
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 19:03:31 -0400
Received: by mail-il1-x12c.google.com with SMTP id m4so16609631ilj.9
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 16:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UojbpHFE7WDqM1JS6Es0a8l7KxX7vlj1un2p8/CbvBQ=;
 b=GaSCJ+7FDyQHSZWgKYWJrIhARhhGcCVNwoGkzutvBWJrTdac8P2OAx4kuvcLwMuQV9
 fXJNcXw74FYuX855HnEIDTZsdainNpLhVexQrrOCpOXVJwcWPqBv8JWb4p7B/XACrd+X
 a1JwtC0jXuWcSYvW2EOu47bNvijZDqCwdMuX0RkclbYegV5OmVm5iEUkhyB00AUo6fZM
 fNr4zSLG9xsxKpVbaZs/uWbbg5ecO1gwHA/PM4YajSDmVnQjErwkqwP2Jl+VVmNV8r73
 PYXJvN+8VwqM6VAy4OpMDB2sNDpzXHqFSDhgfDvOIuM4RhtAYkR+LHOpS2d5tEfEe9PM
 pzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UojbpHFE7WDqM1JS6Es0a8l7KxX7vlj1un2p8/CbvBQ=;
 b=VqovsQCqY8//p+k2DGbjGHeG0GtTFtgMUDCsApY9qoj3vM6yUlRgLRragQ/7Pu3tyP
 pgwYkzhYClS954R9RUiWQJJS6orTaEmS3BcKTAJHZVt+0DDJIK0ojjMR6lASHeClvGF1
 VjUEuIRKGlOnvq2QbFR4LFTxltVWXy+i+mFKiXff9+otgXlbjVLvNux8js4Y/CeZcSvt
 wfM8ZnbnI/316bkCjvsEBLpVpqFIUtdN08cLDvXuDgp2RYEnPWNFBnYlvDmYFtCgLtqb
 SW0RBxHnZEIVzVtdPFm/1Z3LemUFD1ip625qj1c59lMsJeOeSym2FWTtuKbC2n7b5Ze+
 FT+Q==
X-Gm-Message-State: AOAM531Hs+2eL0C2FsRgZs8jqwBWJuowR3WIzYOFAQHC3kKVQzTD5paz
 cl04jiZwPOF0zTst9WNSEPvXP1kCXiuL3xRbZmU=
X-Google-Smtp-Source: ABdhPJxLWB/SIbx49p/oq3KBeUVlD/zhAy1D/wuItagkPbj1L8Mm8pHF6kcXr/zMAWhzD2XGiw/0UIAHJAtD++mL8G8=
X-Received: by 2002:a05:6e02:1b04:: with SMTP id
 i4mr7053323ilv.221.1632092607915; 
 Sun, 19 Sep 2021 16:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200910180938.584205-1-alistair.francis@wdc.com>
 <20200910180938.584205-8-alistair.francis@wdc.com>
 <CAAdtpL7-twPXfLGud9+hQq074g-VWCxOt+drkW02xzHuzDs_pA@mail.gmail.com>
In-Reply-To: <CAAdtpL7-twPXfLGud9+hQq074g-VWCxOt+drkW02xzHuzDs_pA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Sep 2021 09:03:02 +1000
Message-ID: <CAKmqyKNo7or8Or+kcMVWYOEcCbTuEMUbA6si+-7uiJ469daoAw@mail.gmail.com>
Subject: Re: [PULL 07/30] hw/char: Add Microchip PolarFire SoC MMUART emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 19, 2021 at 2:55 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On Thu, Sep 10, 2020 at 8:29 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Microchip PolarFire SoC MMUART is ns16550 compatible, with some
> > additional registers. Create a simple MMUART model built on top
> > of the existing ns16550 model.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Message-Id: <1598924352-89526-6-git-send-email-bmeng.cn@gmail.com>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  include/hw/char/mchp_pfsoc_mmuart.h | 61 ++++++++++++++++++++
> >  hw/char/mchp_pfsoc_mmuart.c         | 86 +++++++++++++++++++++++++++++
> >  MAINTAINERS                         |  2 +
> >  hw/char/Kconfig                     |  3 +
> >  hw/char/meson.build                 |  1 +
> >  5 files changed, 153 insertions(+)
> >  create mode 100644 include/hw/char/mchp_pfsoc_mmuart.h
> >  create mode 100644 hw/char/mchp_pfsoc_mmuart.c
> >
> > diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp=
_pfsoc_mmuart.h
> > new file mode 100644
> > index 0000000000..f61990215f
> > --- /dev/null
> > +++ b/include/hw/char/mchp_pfsoc_mmuart.h
> > @@ -0,0 +1,61 @@
> > +/*
> > + * Microchip PolarFire SoC MMUART emulation
> > + *
> > + * Copyright (c) 2020 Wind River Systems, Inc.
> > + *
> > + * Author:
> > + *   Bin Meng <bin.meng@windriver.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a copy
> > + * of this software and associated documentation files (the "Software"=
), to deal
> > + * in the Software without restriction, including without limitation t=
he rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/o=
r sell
> > + * copies of the Software, and to permit persons to whom the Software =
is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be incl=
uded in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT S=
HALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALI=
NGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#ifndef HW_MCHP_PFSOC_MMUART_H
> > +#define HW_MCHP_PFSOC_MMUART_H
> > +
> > +#include "hw/char/serial.h"
> > +
> > +#define MCHP_PFSOC_MMUART_REG_SIZE  52
> > +
> > +typedef struct MchpPfSoCMMUartState {
> > +    MemoryRegion iomem;
> > +    hwaddr base;
> > +    qemu_irq irq;
> > +
> > +    SerialMM *serial;
> > +
> > +    uint32_t reg[MCHP_PFSOC_MMUART_REG_SIZE / sizeof(uint32_t)];
> > +} MchpPfSoCMMUartState;
> > +
> > +/**
> > + * mchp_pfsoc_mmuart_create - Create a Microchip PolarFire SoC MMUART
> > + *
> > + * This is a helper routine for board to create a MMUART device that i=
s
> > + * compatible with Microchip PolarFire SoC.
> > + *
> > + * @sysmem: system memory region to map
> > + * @base: base address of the MMUART registers
> > + * @irq: IRQ number of the MMUART device
> > + * @chr: character device to associate to
> > + *
> > + * @return: a pointer to the device specific control structure
> > + */
> > +MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
> > +    hwaddr base, qemu_irq irq, Chardev *chr);
> > +
> > +#endif /* HW_MCHP_PFSOC_MMUART_H */
> > diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
> > new file mode 100644
> > index 0000000000..8a002b0a19
> > --- /dev/null
> > +++ b/hw/char/mchp_pfsoc_mmuart.c
> > @@ -0,0 +1,86 @@
> > +/*
> > + * Microchip PolarFire SoC MMUART emulation
> > + *
> > + * Copyright (c) 2020 Wind River Systems, Inc.
> > + *
> > + * Author:
> > + *   Bin Meng <bin.meng@windriver.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 or
> > + * (at your option) version 3 of the License.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License a=
long
> > + * with this program; if not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "chardev/char.h"
> > +#include "exec/address-spaces.h"
> > +#include "hw/char/mchp_pfsoc_mmuart.h"
> > +
> > +static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsi=
gned size)
> > +{
> > +    MchpPfSoCMMUartState *s =3D opaque;
> > +
> > +    if (addr >=3D MCHP_PFSOC_MMUART_REG_SIZE) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: read: addr=3D0x%" HWADDR_P=
RIx "\n",
> > +                      __func__, addr);
> > +        return 0;
> > +    }
> > +
> > +    return s->reg[addr / sizeof(uint32_t)];
> > +}
> > +
> > +static void mchp_pfsoc_mmuart_write(void *opaque, hwaddr addr,
> > +                                    uint64_t value, unsigned size)
> > +{
> > +    MchpPfSoCMMUartState *s =3D opaque;
> > +    uint32_t val32 =3D (uint32_t)value;
> > +
> > +    if (addr >=3D MCHP_PFSOC_MMUART_REG_SIZE) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=3D0x%" HWA=
DDR_PRIx
> > +                      " v=3D0x%x\n", __func__, addr, val32);
> > +        return;
> > +    }
> > +
> > +    s->reg[addr / sizeof(uint32_t)] =3D val32;
> > +}
> > +
> > +static const MemoryRegionOps mchp_pfsoc_mmuart_ops =3D {
> > +    .read =3D mchp_pfsoc_mmuart_read,
> > +    .write =3D mchp_pfsoc_mmuart_write,
> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +    .impl =3D {
> > +        .min_access_size =3D 4,
> > +        .max_access_size =3D 4,
> > +    },
> > +};
> > +
> > +MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
> > +    hwaddr base, qemu_irq irq, Chardev *chr)
> > +{
> > +    MchpPfSoCMMUartState *s;
> > +
> > +    s =3D g_new0(MchpPfSoCMMUartState, 1);
>
> Please stop adding non-QOM devices, we try hard to get rid of them.

Sorry, because of serial_mm_init() I thought this would be ok

Alistair

