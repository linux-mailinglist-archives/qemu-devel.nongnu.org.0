Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148185D5F8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 20:15:34 +0200 (CEST)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiNJU-0005cr-Uc
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 14:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47441)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hiLX6-0006Iy-OJ
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:21:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hiLX5-0002qW-0Y
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:21:28 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:39839)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hiLX3-0002pU-St; Tue, 02 Jul 2019 12:21:26 -0400
Received: by mail-lj1-x243.google.com with SMTP id v18so17500995ljh.6;
 Tue, 02 Jul 2019 09:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cFgkdvMYsWhiBib6W6plAvh0fpa8NPIlRLO7+mO7kaA=;
 b=NjouclcPe83CWqPrA4eudITx8wipx9id4p6wn7Gm4k7M31OhtVr82z1KIyZcy0vemC
 7Ovdnq+5vrHjYa7N9NHD9htEA7ArSd+3NOSBNf6HspzetnB5yiuOulYc6DeEikv2oTXt
 G4UWFVCmomEe0pglcyOikKxmfrvXHCrrKBvx09yz6zT3TJlor8ms/vrWsz2eaa15XSQx
 Vc0ITFWv6KEGOHoJd5g44KOEJn0UpHcUoOwHT2O1YSF/MiJfjq9+CiFktkVAN/ruhY+U
 FL9mk5+aLVOsYdTLU2JDyNghG1Nas++K4YKP3BtZyk+PuRJlmbUA66gBNMPpSSQM9aH4
 Xr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cFgkdvMYsWhiBib6W6plAvh0fpa8NPIlRLO7+mO7kaA=;
 b=gAM1QHb++3pa/DEUTpAjj2WFj1fM1QhIhMUDSNPVi3SKg8khT/aDzVY0xCyEtCAJf2
 nwIIIwUie0y9kqJgcTboXujUol3FUA9SG0FR9e9vtNI+XCDKn9NyiANz3LU0Y3BlSKmt
 Kx17YjMfPxFqtCApWxgyxmOa+J1eFwdc0f2WmfSi9F9kZjdRVruKaYKUG3dupSbQbaoS
 Ftldcmf2DkH685Xe6QtR2NgaMuDtgr9HyMr0x0WrJ/m/UNBhJy/TgQGlgAZAw9IJCwrW
 I13XpIK68fmxOCExHLZPtquAcktvcSAWQFHO8ShzpXGPaOErUoKzrdSx7e2g8xwvGFDq
 wA/g==
X-Gm-Message-State: APjAAAUDB4YwA30GYpatt2nQvYPjY4ucYhfehyq4q6MEbCWThelVvQDq
 GhJVRlf6fe1MFS+97G9a4ZPUM3nBzFM5K2O1bJc=
X-Google-Smtp-Source: APXvYqzYsozTBI+43Vht1tQmWIPQvf4OT/fB9GE4ZfCl/BwdYhspLEvEwzurP94ra0FtjBWiJIXz9ygpCUpuBXI8RaY=
X-Received: by 2002:a2e:3604:: with SMTP id d4mr17966298lja.85.1562084483826; 
 Tue, 02 Jul 2019 09:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190701123108.12493-1-philmd@redhat.com>
 <20190701123108.12493-6-philmd@redhat.com>
In-Reply-To: <20190701123108.12493-6-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 09:18:20 -0700
Message-ID: <CAKmqyKMWb5LE=gtdDpbEUcceGD9T3V9gNAXfo16sOuQh2hCVgg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-devel] [PATCH 5/6] hw/dma/xilinx_axi: Use
 object_initialize_child for correct ref. counting
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
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 1, 2019 at 5:32 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> As explained in commit aff39be0ed97:
>
>   Both functions, object_initialize() and object_property_add_child()
>   increase the reference counter of the new object, so one of the
>   references has to be dropped afterwards to get the reference
>   counting right. Otherwise the child object will not be properly
>   cleaned up when the parent gets destroyed.
>   Thus let's use now object_initialize_child() instead to get the
>   reference counting here right.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/dma/xilinx_axidma.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 921be178d9..91f5ec587f 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -563,14 +563,14 @@ static void xilinx_axidma_init(Object *obj)
>      XilinxAXIDMA *s =3D XILINX_AXI_DMA(obj);
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
>
> -    object_initialize(&s->rx_data_dev, sizeof(s->rx_data_dev),
> -                      TYPE_XILINX_AXI_DMA_DATA_STREAM);
> -    object_initialize(&s->rx_control_dev, sizeof(s->rx_control_dev),
> -                      TYPE_XILINX_AXI_DMA_CONTROL_STREAM);
> -    object_property_add_child(OBJECT(s), "axistream-connected-target",
> -                              (Object *)&s->rx_data_dev, &error_abort);
> -    object_property_add_child(OBJECT(s), "axistream-control-connected-ta=
rget",
> -                              (Object *)&s->rx_control_dev, &error_abort=
);
> +    object_initialize_child(OBJECT(s), "axistream-connected-target",
> +                            &s->rx_data_dev, sizeof(s->rx_data_dev),
> +                            TYPE_XILINX_AXI_ENET_DATA_STREAM, &error_abo=
rt,
> +                            NULL);
> +    object_initialize_child(OBJECT(s), "axistream-control-connected-targ=
et",
> +                            &s->rx_control_dev, sizeof(s->rx_control_dev=
),
> +                            TYPE_XILINX_AXI_ENET_CONTROL_STREAM, &error_=
abort,
> +                            NULL);
>
>      sysbus_init_irq(sbd, &s->streams[0].irq);
>      sysbus_init_irq(sbd, &s->streams[1].irq);
> --
> 2.20.1
>
>

