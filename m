Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881742B21B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 03:17:16 +0200 (CEST)
Received: from localhost ([::1]:60272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maStP-000667-5X
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 21:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1maSsN-000506-Ui
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:16:11 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1maSsK-0008VS-Jv
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:16:11 -0400
Received: by mail-ed1-x52f.google.com with SMTP id i20so3094899edj.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 18:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KS03h+04qhsuwWAsq8ehDVavN/1+FcMvzTOjxiKdmw8=;
 b=zIDP3puDZIuOUJj+dFfDaPJvxjTg6sT4O1FiiXnB3om2mM5dnA0YphstF0c7TzDf7F
 LqJX/lbttS+aMG9O4jWx+LW4/yBlq0nwA8RKlccozsdcZSfURYsxJEhYVFRMzyGGBBay
 6rBsi8ImFSCZR4cV6RJiryhsnw9yTxwyYUD7e7+WMYzxlEvD79Cgr8TDNKJB7HtJ8iXF
 gMxdNE9+Rc7I1OnQiEBFFRjzzAtqDXcz2ESW1DgWhnByFXgO1YOk+71BgDghwvBc5zAy
 Fq+sJnm1xW9QPKs0OKOqjJhrixxDTk+GXeDtSeLg98cMNkZdjzv1gamoaZ/mt5xONpeN
 wbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KS03h+04qhsuwWAsq8ehDVavN/1+FcMvzTOjxiKdmw8=;
 b=aoTWhSjAoLu04L/REhfvZhTWgmHV0WTKI6ud1wjGxAMcRQgBPxaIXRCUqCjoW3/H68
 LDxROd/V8X/IO39f1Owt5rVKl4yfA/XqI2eNC/7IjkYseBlpz3zqkqlE+X5mE9ipMMoq
 aruraGyPXT2LjPU9fch8W0dzX0uyD5BXwWVTsLpN6g42IvtXHJ3EkE2RkQXEnkAenQLr
 rmsB/AqWeQo1p0QJ4VngpRhTdEIu9w8DbwbOH1jp7AfxIJ76o/68cyi2H03sTrrwLEh9
 +JuL4a2e0kw+x2WI8AuiCnP4TzISfIdn9xwXeI9wKA6mNxkw5OLl2tIOA58iEidiByvY
 85zA==
X-Gm-Message-State: AOAM532sUEfibeis1DMpmcFYsiyty+JqXKjiF0LiqW+TEa2HGmG8myaR
 JhtynuQyurnyjAS08i44sSBAV1opf04MQKUcJ1hO+A==
X-Google-Smtp-Source: ABdhPJxW01DvA/dBvDiXTaDyNN/7hRTzUy/Fq0mUM/NqNHQcc4MXfkIVmTvVCtF39i3zUSPIqNKYleBZBzF1wSHPwjI=
X-Received: by 2002:a17:906:94da:: with SMTP id
 d26mr8404396ejy.213.1634087766226; 
 Tue, 12 Oct 2021 18:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <20211013010120.96851-6-sjg@chromium.org>
In-Reply-To: <20211013010120.96851-6-sjg@chromium.org>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 13 Oct 2021 03:15:55 +0200
Message-ID: <CAHFG_=UDFn9MQfJz6oTAg15PiR2nt6QkoZS58+gsOMMVo31AXQ@mail.gmail.com>
Subject: Re: [PATCH 05/16] arm: qemu: Add a devicetree file for qemu_arm64
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000d6912105ce31b484"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, qemu-devel@nongnu.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Rick Chen <rick@andestech.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Jagan Teki <jagan@amarulasolutions.com>, Sean Anderson <seanga2@gmail.com>,
 Heiko Schocher <hs@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Tom Rini <trini@konsulko.com>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d6912105ce31b484
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon

The only place I could agree with this file presence is in the
documentation directory, not in dts. It creates a mental picture  for the
reader an entirely bad mind scheme around Qemu and DT.

And even in a documentation directory I would place a bug warning: don=E2=
=80=99t
use this with any kernel , Qemu generates a DT dynamically based on cpu,
memory and devices specified at the command line.

I would also document how to get the DT that Qemu generates (and lkvm btw)
outside any firmware/os provided.

Cheers

FF

Le mer. 13 oct. 2021 =C3=A0 03:03, Simon Glass <sjg@chromium.org> a =C3=A9c=
rit :

> Add this file, generated from qemu, so there is a reference devicetree
> in the U-Boot tree.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
>  arch/arm/dts/Makefile        |   2 +-
>  arch/arm/dts/qemu-arm64.dts  | 381 +++++++++++++++++++++++++++++++++++
>  configs/qemu_arm64_defconfig |   1 +
>  3 files changed, 383 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/qemu-arm64.dts
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index e2fc0cb65fc..52c586f3974 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -1145,7 +1145,7 @@ dtb-$(CONFIG_TARGET_IMX8MM_CL_IOT_GATE) +=3D
> imx8mm-cl-iot-gate.dtb
>
>  dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) +=3D lpc3250-ea3250.dtb
>
> -dtb-$(CONFIG_ARCH_QEMU) +=3D qemu-arm.dtb
> +dtb-$(CONFIG_ARCH_QEMU) +=3D qemu-arm.dtb qemu-arm64.dtb
>
>  targets +=3D $(dtb-y)
>
> diff --git a/arch/arm/dts/qemu-arm64.dts b/arch/arm/dts/qemu-arm64.dts
> new file mode 100644
> index 00000000000..7590e49cc84
> --- /dev/null
> +++ b/arch/arm/dts/qemu-arm64.dts
> @@ -0,0 +1,381 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Sample device tree for qemu_arm64
> +
> + * Copyright 2021 Google LLC
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +       interrupt-parent =3D <0x8001>;
> +       #size-cells =3D <0x02>;
> +       #address-cells =3D <0x02>;
> +       compatible =3D "linux,dummy-virt";
> +
> +       psci {
> +               migrate =3D <0xc4000005>;
> +               cpu_on =3D <0xc4000003>;
> +               cpu_off =3D <0x84000002>;
> +               cpu_suspend =3D <0xc4000001>;
> +               method =3D "hvc";
> +               compatible =3D "arm,psci-0.2\0arm,psci";
> +       };
> +
> +       memory@40000000 {
> +               reg =3D <0x00 0x40000000 0x00 0x8000000>;
> +               device_type =3D "memory";
> +       };
> +
> +       platform@c000000 {
> +               interrupt-parent =3D <0x8001>;
> +               ranges =3D <0x00 0x00 0xc000000 0x2000000>;
> +               #address-cells =3D <0x01>;
> +               #size-cells =3D <0x01>;
> +               compatible =3D "qemu,platform\0simple-bus";
> +       };
> +
> +       fw-cfg@9020000 {
> +               dma-coherent;
> +               reg =3D <0x00 0x9020000 0x00 0x18>;
> +               compatible =3D "qemu,fw-cfg-mmio";
> +       };
> +
> +       virtio_mmio@a000000 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x10 0x01>;
> +               reg =3D <0x00 0xa000000 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a000200 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x11 0x01>;
> +               reg =3D <0x00 0xa000200 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a000400 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x12 0x01>;
> +               reg =3D <0x00 0xa000400 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a000600 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x13 0x01>;
> +               reg =3D <0x00 0xa000600 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a000800 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x14 0x01>;
> +               reg =3D <0x00 0xa000800 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a000a00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x15 0x01>;
> +               reg =3D <0x00 0xa000a00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a000c00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x16 0x01>;
> +               reg =3D <0x00 0xa000c00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a000e00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x17 0x01>;
> +               reg =3D <0x00 0xa000e00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a001000 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x18 0x01>;
> +               reg =3D <0x00 0xa001000 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a001200 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x19 0x01>;
> +               reg =3D <0x00 0xa001200 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a001400 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x1a 0x01>;
> +               reg =3D <0x00 0xa001400 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a001600 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x1b 0x01>;
> +               reg =3D <0x00 0xa001600 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a001800 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x1c 0x01>;
> +               reg =3D <0x00 0xa001800 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a001a00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x1d 0x01>;
> +               reg =3D <0x00 0xa001a00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a001c00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x1e 0x01>;
> +               reg =3D <0x00 0xa001c00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a001e00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x1f 0x01>;
> +               reg =3D <0x00 0xa001e00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a002000 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x20 0x01>;
> +               reg =3D <0x00 0xa002000 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a002200 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x21 0x01>;
> +               reg =3D <0x00 0xa002200 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a002400 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x22 0x01>;
> +               reg =3D <0x00 0xa002400 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a002600 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x23 0x01>;
> +               reg =3D <0x00 0xa002600 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a002800 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x24 0x01>;
> +               reg =3D <0x00 0xa002800 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a002a00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x25 0x01>;
> +               reg =3D <0x00 0xa002a00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a002c00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x26 0x01>;
> +               reg =3D <0x00 0xa002c00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a002e00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x27 0x01>;
> +               reg =3D <0x00 0xa002e00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a003000 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x28 0x01>;
> +               reg =3D <0x00 0xa003000 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a003200 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x29 0x01>;
> +               reg =3D <0x00 0xa003200 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a003400 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x2a 0x01>;
> +               reg =3D <0x00 0xa003400 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a003600 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x2b 0x01>;
> +               reg =3D <0x00 0xa003600 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a003800 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x2c 0x01>;
> +               reg =3D <0x00 0xa003800 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a003a00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x2d 0x01>;
> +               reg =3D <0x00 0xa003a00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a003c00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x2e 0x01>;
> +               reg =3D <0x00 0xa003c00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       virtio_mmio@a003e00 {
> +               dma-coherent;
> +               interrupts =3D <0x00 0x2f 0x01>;
> +               reg =3D <0x00 0xa003e00 0x00 0x200>;
> +               compatible =3D "virtio,mmio";
> +       };
> +
> +       pcie@10000000 {
> +               interrupt-map-mask =3D <0x1800 0x00 0x00 0x07>;
> +               interrupt-map =3D <0x00 0x00 0x00 0x01 0x8001 0x00 0x00 0=
x00
> +                       0x03 0x04 0x00 0x00 0x00 0x02 0x8001 0x00
> +                       0x00 0x00 0x04 0x04 0x00 0x00 0x00 0x03
> +                       0x8001 0x00 0x00 0x00 0x05 0x04 0x00 0x00
> +                       0x00 0x04 0x8001 0x00 0x00 0x00 0x06 0x04
> +                       0x800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00
> +                       0x04 0x04 0x800 0x00 0x00 0x02 0x8001 0x00
> +                       0x00 0x00 0x05 0x04 0x800 0x00 0x00 0x03
> +                       0x8001 0x00 0x00 0x00 0x06 0x04 0x800 0x00
> +                       0x00 0x04 0x8001 0x00 0x00 0x00 0x03 0x04
> +                       0x1000 0x00 0x00 0x01 0x8001 0x00 0x00 0x00
> +                       0x05 0x04 0x1000 0x00 0x00 0x02 0x8001 0x00
> +                       0x00 0x00 0x06 0x04 0x1000 0x00 0x00 0x03
> +                       0x8001 0x00 0x00 0x00 0x03 0x04 0x1000 0x00
> +                       0x00 0x04 0x8001 0x00 0x00 0x00 0x04 0x04
> +                       0x1800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00
> +                       0x06 0x04 0x1800 0x00 0x00 0x02 0x8001 0x00
> +                       0x00 0x00 0x03 0x04 0x1800 0x00 0x00 0x03
> +                       0x8001 0x00 0x00 0x00 0x04 0x04 0x1800 0x00
> +                       0x00 0x04 0x8001 0x00 0x00 0x00 0x05 0x04>;
> +               #interrupt-cells =3D <0x01>;
> +               ranges =3D <0x1000000 0x00 0x00 0x00
> +                       0x3eff0000 0x00 0x10000 0x2000000
> +                       0x00 0x10000000 0x00 0x10000000
> +                       0x00 0x2eff0000 0x3000000 0x80
> +                       0x00 0x80 0x00 0x80
> +                       0x00>;
> +               reg =3D <0x40 0x10000000 0x00 0x10000000>;
> +               msi-parent =3D <0x8002>;
> +               dma-coherent;
> +               bus-range =3D <0x00 0xff>;
> +               linux,pci-domain =3D <0x00>;
> +               #size-cells =3D <0x02>;
> +               #address-cells =3D <0x03>;
> +               device_type =3D "pci";
> +               compatible =3D "pci-host-ecam-generic";
> +       };
> +
> +       pl031@9010000 {
> +               clock-names =3D "apb_pclk";
> +               clocks =3D <0x8000>;
> +               interrupts =3D <0x00 0x02 0x04>;
> +               reg =3D <0x00 0x9010000 0x00 0x1000>;
> +               compatible =3D "arm,pl031\0arm,primecell";
> +       };
> +
> +       pl011@9000000 {
> +               clock-names =3D "uartclk\0apb_pclk";
> +               clocks =3D <0x8000 0x8000>;
> +               interrupts =3D <0x00 0x01 0x04>;
> +               reg =3D <0x00 0x9000000 0x00 0x1000>;
> +               compatible =3D "arm,pl011\0arm,primecell";
> +       };
> +
> +       pmu {
> +               interrupts =3D <0x01 0x07 0x104>;
> +               compatible =3D "arm,armv8-pmuv3";
> +       };
> +
> +       intc@8000000 {
> +               phandle =3D <0x8001>;
> +               reg =3D <0x00 0x8000000 0x00 0x10000 0x00 0x8010000 0x00
> 0x10000>;
> +               compatible =3D "arm,cortex-a15-gic";
> +               ranges;
> +               #size-cells =3D <0x02>;
> +               #address-cells =3D <0x02>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <0x03>;
> +
> +               v2m@8020000 {
> +                       phandle =3D <0x8002>;
> +                       reg =3D <0x00 0x8020000 0x00 0x1000>;
> +                       msi-controller;
> +                       compatible =3D "arm,gic-v2m-frame";
> +               };
> +       };
> +
> +       flash@0 {
> +               bank-width =3D <0x04>;
> +               reg =3D <0x00 0x00 0x00 0x4000000 0x00 0x4000000 0x00
> 0x4000000>;
> +               compatible =3D "cfi-flash";
> +       };
> +
> +       cpus {
> +               #size-cells =3D <0x00>;
> +               #address-cells =3D <0x01>;
> +
> +               cpu@0 {
> +                       reg =3D <0x00>;
> +                       compatible =3D "arm,cortex-a57";
> +                       device_type =3D "cpu";
> +               };
> +       };
> +
> +       timer {
> +               interrupts =3D <0x01 0x0d 0x104 0x01 0x0e 0x104 0x01 0x0b
> 0x104 0x01 0x0a 0x104>;
> +               always-on;
> +               compatible =3D "arm,armv8-timer\0arm,armv7-timer";
> +       };
> +
> +       apb-pclk {
> +               phandle =3D <0x8000>;
> +               clock-output-names =3D "clk24mhz";
> +               clock-frequency =3D <0x16e3600>;
> +               #clock-cells =3D <0x00>;
> +               compatible =3D "fixed-clock";
> +       };
> +
> +       chosen {
> +               stdout-path =3D "/pl011@9000000";
> +       };
> +};
> diff --git a/configs/qemu_arm64_defconfig b/configs/qemu_arm64_defconfig
> index cf5a03e8a2f..e51ce5c799f 100644
> --- a/configs/qemu_arm64_defconfig
> +++ b/configs/qemu_arm64_defconfig
> @@ -5,6 +5,7 @@ CONFIG_NR_DRAM_BANKS=3D1
>  CONFIG_ENV_SIZE=3D0x40000
>  CONFIG_ENV_SECT_SIZE=3D0x40000
>  CONFIG_SYS_MALLOC_LEN=3D0x1000000
> +CONFIG_DEFAULT_DEVICE_TREE=3D"qemu-arm64"
>  CONFIG_AHCI=3Dy
>  CONFIG_DISTRO_DEFAULTS=3Dy
>  CONFIG_SYS_LOAD_ADDR=3D0x40200000
> --
> 2.33.0.882.g93a45727a2-goog
>
> --
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000d6912105ce31b484
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9ImF1dG8iPkhpIFNpbW9uPC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48
ZGl2IGRpcj0iYXV0byI+VGhlIG9ubHkgcGxhY2UgSSBjb3VsZCBhZ3JlZSB3aXRoIHRoaXMgZmls
ZSBwcmVzZW5jZSBpcyBpbiB0aGUgZG9jdW1lbnRhdGlvbiBkaXJlY3RvcnksIG5vdCBpbiBkdHMu
IEl0IGNyZWF0ZXMgYSBtZW50YWwgcGljdHVyZSDCoGZvciB0aGUgcmVhZGVyIGFuIGVudGlyZWx5
IGJhZCBtaW5kIHNjaGVtZSBhcm91bmQgUWVtdSBhbmQgRFQuPC9kaXY+PGRpdiBkaXI9ImF1dG8i
Pjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+QW5kIGV2ZW4gaW4gYSBkb2N1bWVudGF0aW9uIGRp
cmVjdG9yeSBJIHdvdWxkIHBsYWNlIGEgYnVnIHdhcm5pbmc6IGRvbuKAmXQgdXNlIHRoaXMgd2l0
aCBhbnkga2VybmVsICwgUWVtdSBnZW5lcmF0ZXMgYSBEVCBkeW5hbWljYWxseSBiYXNlZCBvbiBj
cHUsIG1lbW9yeSBhbmQgZGV2aWNlcyBzcGVjaWZpZWQgYXQgdGhlIGNvbW1hbmQgbGluZS48L2Rp
dj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5JIHdvdWxkIGFsc28g
ZG9jdW1lbnQgaG93IHRvIGdldCB0aGUgRFQgdGhhdCBRZW11IGdlbmVyYXRlcyAoYW5kIGxrdm0g
YnR3KSBvdXRzaWRlIGFueSBmaXJtd2FyZS9vcyBwcm92aWRlZC48L2Rpdj48ZGl2IGRpcj0iYXV0
byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5DaGVlcnM8L2Rpdj48ZGl2IGRpcj0iYXV0byI+
PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5GRjwvZGl2PjxkaXY+PGJyPjxkaXYgY2xhc3M9Imdt
YWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+TGXCoG1lci4gMTMg
b2N0LiAyMDIxIMOgIDAzOjAzLCBTaW1vbiBHbGFzcyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnNqZ0Bj
aHJvbWl1bS5vcmciPnNqZ0BjaHJvbWl1bS5vcmc8L2E+Jmd0OyBhIMOpY3JpdMKgOjxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhl
eDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5BZGQgdGhpcyBm
aWxlLCBnZW5lcmF0ZWQgZnJvbSBxZW11LCBzbyB0aGVyZSBpcyBhIHJlZmVyZW5jZSBkZXZpY2V0
cmVlPGJyPg0KaW4gdGhlIFUtQm9vdCB0cmVlLjxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6IFNp
bW9uIEdsYXNzICZsdDs8YSBocmVmPSJtYWlsdG86c2pnQGNocm9taXVtLm9yZyIgdGFyZ2V0PSJf
YmxhbmsiPnNqZ0BjaHJvbWl1bS5vcmc8L2E+Jmd0Ozxicj4NCi0tLTxicj4NCjxicj4NCsKgYXJj
aC9hcm0vZHRzL01ha2VmaWxlwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgYXJjaC9hcm0v
ZHRzL3FlbXUtYXJtNjQuZHRzwqAgfCAzODEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKys8YnI+DQrCoGNvbmZpZ3MvcWVtdV9hcm02NF9kZWZjb25maWcgfMKgIMKgMSArPGJyPg0K
wqAzIGZpbGVzIGNoYW5nZWQsIDM4MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pPGJyPg0K
wqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vZHRzL3FlbXUtYXJtNjQuZHRzPGJyPg0KPGJy
Pg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9NYWtlZmlsZSBiL2FyY2gvYXJtL2R0cy9NYWtl
ZmlsZTxicj4NCmluZGV4IGUyZmMwY2I2NWZjLi41MmM1ODZmMzk3NCAxMDA2NDQ8YnI+DQotLS0g
YS9hcmNoL2FybS9kdHMvTWFrZWZpbGU8YnI+DQorKysgYi9hcmNoL2FybS9kdHMvTWFrZWZpbGU8
YnI+DQpAQCAtMTE0NSw3ICsxMTQ1LDcgQEAgZHRiLSQoQ09ORklHX1RBUkdFVF9JTVg4TU1fQ0xf
SU9UX0dBVEUpICs9IGlteDhtbS1jbC1pb3QtZ2F0ZS5kdGI8YnI+DQo8YnI+DQrCoGR0Yi0kKENP
TkZJR19UQVJHRVRfRUFfTFBDMzI1MERFVktJVFYyKSArPSBscGMzMjUwLWVhMzI1MC5kdGI8YnI+
DQo8YnI+DQotZHRiLSQoQ09ORklHX0FSQ0hfUUVNVSkgKz0gcWVtdS1hcm0uZHRiPGJyPg0KK2R0
Yi0kKENPTkZJR19BUkNIX1FFTVUpICs9IHFlbXUtYXJtLmR0YiBxZW11LWFybTY0LmR0Yjxicj4N
Cjxicj4NCsKgdGFyZ2V0cyArPSAkKGR0Yi15KTxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9kdHMvcWVtdS1hcm02NC5kdHMgYi9hcmNoL2FybS9kdHMvcWVtdS1hcm02NC5kdHM8YnI+
DQpuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4IDAwMDAwMDAwMDAwLi43NTkwZTQ5Y2M4
NDxicj4NCi0tLSAvZGV2L251bGw8YnI+DQorKysgYi9hcmNoL2FybS9kdHMvcWVtdS1hcm02NC5k
dHM8YnI+DQpAQCAtMCwwICsxLDM4MSBAQDxicj4NCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCsgT1IgTUlUPGJyPg0KKy8qPGJyPg0KKyAqIFNhbXBsZSBkZXZpY2UgdHJlZSBm
b3IgcWVtdV9hcm02NDxicj4NCis8YnI+DQorICogQ29weXJpZ2h0IDIwMjEgR29vZ2xlIExMQzxi
cj4NCisgKi88YnI+DQorPGJyPg0KKy9kdHMtdjEvOzxicj4NCis8YnI+DQorLyB7PGJyPg0KK8Kg
IMKgIMKgIMKgaW50ZXJydXB0LXBhcmVudCA9ICZsdDsweDgwMDEmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCNzaXplLWNlbGxzID0gJmx0OzB4MDImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCNhZGRyZXNz
LWNlbGxzID0gJmx0OzB4MDImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVv
dDtsaW51eCxkdW1teS12aXJ0JnF1b3Q7Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBwc2NpIHs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtaWdyYXRlID0gJmx0OzB4YzQwMDAwMDUmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNwdV9vbiA9ICZsdDsweGM0MDAwMDAzJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjcHVfb2ZmID0gJmx0OzB4ODQwMDAwMDIm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNwdV9zdXNwZW5kID0gJmx0OzB4YzQw
MDAwMDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1ldGhvZCA9ICZxdW90O2h2
YyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7
YXJtLHBzY2ktMC4yXDBhcm0scHNjaSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqBtZW1vcnlANDAwMDAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4NDAwMDAwMDAgMHgwMCAweDgwMDAwMDAmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldmljZV90eXBlID0gJnF1b3Q7bWVtb3J5JnF1b3Q7
Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHBsYXRmb3JtQGMw
MDAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdC1wYXJlbnQgPSAm
bHQ7MHg4MDAxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByYW5nZXMgPSAmbHQ7
MHgwMCAweDAwIDB4YzAwMDAwMCAweDIwMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtxZW11LHBsYXRmb3JtXDBzaW1wbGUtYnVzJnF1
b3Q7Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGZ3LWNmZ0A5
MDIwMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkbWEtY29oZXJlbnQ7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MDAgMHg5MDIwMDAwIDB4MDAgMHgx
OCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3Fl
bXUsZnctY2ZnLW1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgdmlydGlvX21taW9AYTAwMDAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMg
PSAmbHQ7MHgwMCAweDEwIDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDsweDAwIDB4YTAwMDAwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMDIwMCB7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDExIDB4MDEmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMDIwMCAweDAwIDB4
MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7
dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgdmlydGlvX21taW9AYTAwMDQwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAm
bHQ7MHgwMCAweDEyIDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9
ICZsdDsweDAwIDB4YTAwMDQwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMDYwMCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDEzIDB4MDEmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMDYwMCAweDAwIDB4MjAw
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmly
dGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgdmlydGlvX21taW9AYTAwMDgwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1h
LWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7
MHgwMCAweDE0IDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDsweDAwIDB4YTAwMDgwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMGEwMCB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDE1IDB4MDEmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMGEwMCAweDAwIDB4MjAwJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlv
LG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
dmlydGlvX21taW9AYTAwMGMwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNv
aGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgw
MCAweDE2IDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsw
eDAwIDB4YTAwMGMwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKg
fTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMGUwMCB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDE3IDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMGUwMCAweDAwIDB4MjAwJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1t
aW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmly
dGlvX21taW9AYTAwMTAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVy
ZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAw
eDE4IDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAw
IDB4YTAwMTAwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMTIwMCB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDE5IDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMTIwMCAweDAwIDB4MjAwJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8m
cXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlv
X21taW9AYTAwMTQwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDFh
IDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4
YTAwMTQwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21w
YXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMTYwMCB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDFiIDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMTYwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21t
aW9AYTAwMTgwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDFjIDB4
MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAw
MTgwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRp
YmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMWEwMCB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlu
dGVycnVwdHMgPSAmbHQ7MHgwMCAweDFkIDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMWEwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9A
YTAwMWMwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDFlIDB4MDEm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMWMw
MCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxl
ID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMWUwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVy
cnVwdHMgPSAmbHQ7MHgwMCAweDFmIDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMWUwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJy
Pg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAw
MjAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDIwIDB4MDEmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMjAwMCAw
eDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0g
JnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMjIwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVw
dHMgPSAmbHQ7MHgwMCAweDIxIDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZyA9ICZsdDsweDAwIDB4YTAwMjIwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMjQw
MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDIyIDB4MDEmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMjQwMCAweDAw
IDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1
b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgdmlydGlvX21taW9AYTAwMjYwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMg
PSAmbHQ7MHgwMCAweDIzIDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDsweDAwIDB4YTAwMjYwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMjgwMCB7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDI0IDB4MDEmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMjgwMCAweDAwIDB4
MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7
dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgdmlydGlvX21taW9AYTAwMmEwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAm
bHQ7MHgwMCAweDI1IDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9
ICZsdDsweDAwIDB4YTAwMmEwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMmMwMCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDI2IDB4MDEmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMmMwMCAweDAwIDB4MjAw
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmly
dGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgdmlydGlvX21taW9AYTAwMmUwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1h
LWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7
MHgwMCAweDI3IDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDsweDAwIDB4YTAwMmUwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMzAwMCB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDI4IDB4MDEmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMzAwMCAweDAwIDB4MjAwJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlv
LG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
dmlydGlvX21taW9AYTAwMzIwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNv
aGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgw
MCAweDI5IDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsw
eDAwIDB4YTAwMzIwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKg
fTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMzQwMCB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDJhIDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMzQwMCAweDAwIDB4MjAwJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1t
aW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmly
dGlvX21taW9AYTAwMzYwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVy
ZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAw
eDJiIDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAw
IDB4YTAwMzYwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwMzgwMCB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDJjIDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwMzgwMCAweDAwIDB4MjAwJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8m
cXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlv
X21taW9AYTAwM2EwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDJk
IDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4
YTAwM2EwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21w
YXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21taW9AYTAwM2MwMCB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDJlIDB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAwM2MwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdmlydGlvX21t
aW9AYTAwM2UwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDJmIDB4
MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4YTAw
M2UwMCAweDAwIDB4MjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRp
YmxlID0gJnF1b3Q7dmlydGlvLG1taW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgcGNpZUAxMDAwMDAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaW50ZXJydXB0LW1hcC1tYXNrID0gJmx0OzB4MTgwMCAweDAwIDB4MDAgMHgwNyZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LW1hcCA9ICZsdDsweDAwIDB4
MDAgMHgwMCAweDAxIDB4ODAwMSAweDAwIDB4MDAgMHgwMDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoDB4MDMgMHgwNCAweDAwIDB4MDAgMHgwMCAweDAyIDB4ODAwMSAw
eDAwPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHgwMCAweDAwIDB4
MDQgMHgwNCAweDAwIDB4MDAgMHgwMCAweDAzPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgMHg4MDAxIDB4MDAgMHgwMCAweDAwIDB4MDUgMHgwNCAweDAwIDB4MDA8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDAwIDB4MDQgMHg4MDAxIDB4
MDAgMHgwMCAweDAwIDB4MDYgMHgwNDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoDB4ODAwIDB4MDAgMHgwMCAweDAxIDB4ODAwMSAweDAwIDB4MDAgMHgwMDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDB4MDQgMHgwNCAweDgwMCAweDAwIDB4
MDAgMHgwMiAweDgwMDEgMHgwMDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoDB4MDAgMHgwMCAweDA1IDB4MDQgMHg4MDAgMHgwMCAweDAwIDB4MDM8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDgwMDEgMHgwMCAweDAwIDB4MDAgMHgwNiAw
eDA0IDB4ODAwIDB4MDA8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAw
eDAwIDB4MDQgMHg4MDAxIDB4MDAgMHgwMCAweDAwIDB4MDMgMHgwNDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDB4MTAwMCAweDAwIDB4MDAgMHgwMSAweDgwMDEgMHgw
MCAweDAwIDB4MDA8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDA1
IDB4MDQgMHgxMDAwIDB4MDAgMHgwMCAweDAyIDB4ODAwMSAweDAwPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHgwMCAweDAwIDB4MDYgMHgwNCAweDEwMDAgMHgwMCAw
eDAwIDB4MDM8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDgwMDEg
MHgwMCAweDAwIDB4MDAgMHgwMyAweDA0IDB4MTAwMCAweDAwPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgMHgwMCAweDA0IDB4ODAwMSAweDAwIDB4MDAgMHgwMCAweDA0
IDB4MDQ8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDE4MDAgMHgw
MCAweDAwIDB4MDEgMHg4MDAxIDB4MDAgMHgwMCAweDAwPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgMHgwNiAweDA0IDB4MTgwMCAweDAwIDB4MDAgMHgwMiAweDgwMDEg
MHgwMDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDB4MDAgMHgwMCAw
eDAzIDB4MDQgMHgxODAwIDB4MDAgMHgwMCAweDAzPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgMHg4MDAxIDB4MDAgMHgwMCAweDAwIDB4MDQgMHgwNCAweDE4MDAgMHgw
MDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDB4MDAgMHgwNCAweDgw
MDEgMHgwMCAweDAwIDB4MDAgMHgwNSAweDA0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjaW50ZXJydXB0LWNlbGxzID0gJmx0OzB4MDEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJhbmdlcyA9ICZsdDsweDEwMDAwMDAgMHgwMCAweDAwIDB4MDA8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDNlZmYwMDAwIDB4MDAgMHgxMDAwMCAw
eDIwMDAwMDA8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDAwIDB4
MTAwMDAwMDAgMHgwMCAweDEwMDAwMDAwPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgMHgwMCAweDJlZmYwMDAwIDB4MzAwMDAwMCAweDgwPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHgwMCAweDgwIDB4MDAgMHg4MDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDB4MDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDQwIDB4MTAwMDAwMDAgMHgwMCAweDEwMDAwMDAwJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtc2ktcGFyZW50ID0gJmx0OzB4ODAwMiZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGJ1cy1yYW5nZSA9ICZsdDsweDAwIDB4ZmYmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGxpbnV4LHBjaS1kb21haW4gPSAmbHQ7MHgwMCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MHgwMiZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MHgwMyZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2aWNlX3R5cGUgPSAmcXVvdDtwY2kmcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3BjaS1ob3N0
LWVjYW0tZ2VuZXJpYyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqBwbDAzMUA5MDEwMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9j
ay1uYW1lcyA9ICZxdW90O2FwYl9wY2xrJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNsb2NrcyA9ICZsdDsweDgwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGludGVycnVwdHMgPSAmbHQ7MHgwMCAweDAyIDB4MDQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwIDB4OTAxMDAwMCAweDAwIDB4MTAwMCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxwbDAzMVwwYXJt
LHByaW1lY2VsbCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqBwbDAxMUA5MDAwMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1u
YW1lcyA9ICZxdW90O3VhcnRjbGtcMGFwYl9wY2xrJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsweDgwMDAgMHg4MDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzB4MDAgMHgwMSAweDA0Jmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwMCAweDkwMDAwMDAgMHgwMCAweDEw
MDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDth
cm0scGwwMTFcMGFybSxwcmltZWNlbGwmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgcG11IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRl
cnJ1cHRzID0gJmx0OzB4MDEgMHgwNyAweDEwNCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxhcm12OC1wbXV2MyZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpbnRjQDgwMDAwMDAgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBoYW5kbGUgPSAmbHQ7MHg4MDAxJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwMCAweDgwMDAwMDAgMHgwMCAweDEwMDAw
IDB4MDAgMHg4MDEwMDAwIDB4MDAgMHgxMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxjb3J0ZXgtYTE1LWdpYyZxdW90Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByYW5nZXM7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgI3NpemUtY2VsbHMgPSAmbHQ7MHgwMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MHgwMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaW50ZXJydXB0LWNvbnRyb2xsZXI7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
I2ludGVycnVwdC1jZWxscyA9ICZsdDsweDAzJmd0Ozs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgdjJtQDgwMjAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHBoYW5kbGUgPSAmbHQ7MHg4MDAyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwMCAweDgwMjAwMDAgMHgwMCAweDEwMDAm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1zaS1jb250cm9s
bGVyOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUg
PSAmcXVvdDthcm0sZ2ljLXYybS1mcmFtZSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGZsYXNo
QDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJhbmstd2lkdGggPSAmbHQ7MHgwNCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MDAgMHgwMCAweDAw
IDB4NDAwMDAwMCAweDAwIDB4NDAwMDAwMCAweDAwIDB4NDAwMDAwMCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2NmaS1mbGFzaCZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBjcHVzIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDsweDAwJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsweDAxJmd0Ozs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY3B1QDAgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXJtLGNvcnRleC1h
NTcmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2aWNl
X3R5cGUgPSAmcXVvdDtjcHUmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB0aW1lciB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsweDAxIDB4MGQgMHgxMDQg
MHgwMSAweDBlIDB4MTA0IDB4MDEgMHgwYiAweDEwNCAweDAxIDB4MGEgMHgxMDQmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFsd2F5cy1vbjs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXJtLGFybXY4LXRpbWVyXDBhcm0sYXJtdjctdGlt
ZXImcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYXBi
LXBjbGsgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBoYW5kbGUgPSAmbHQ7MHg4MDAw
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1vdXRwdXQtbmFtZXMgPSAm
cXVvdDtjbGsyNG1oeiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1m
cmVxdWVuY3kgPSAmbHQ7MHgxNmUzNjAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAjY2xvY2stY2VsbHMgPSAmbHQ7MHgwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY29tcGF0aWJsZSA9ICZxdW90O2ZpeGVkLWNsb2NrJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGNob3NlbiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgc3Rkb3V0LXBhdGggPSAmcXVvdDsvcGwwMTFAOTAwMDAwMCZxdW90Ozs8YnI+DQor
wqAgwqAgwqAgwqB9Ozxicj4NCit9Ozxicj4NCmRpZmYgLS1naXQgYS9jb25maWdzL3FlbXVfYXJt
NjRfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X2FybTY0X2RlZmNvbmZpZzxicj4NCmluZGV4IGNm
NWEwM2U4YTJmLi5lNTFjZTVjNzk5ZiAxMDA2NDQ8YnI+DQotLS0gYS9jb25maWdzL3FlbXVfYXJt
NjRfZGVmY29uZmlnPGJyPg0KKysrIGIvY29uZmlncy9xZW11X2FybTY0X2RlZmNvbmZpZzxicj4N
CkBAIC01LDYgKzUsNyBAQCBDT05GSUdfTlJfRFJBTV9CQU5LUz0xPGJyPg0KwqBDT05GSUdfRU5W
X1NJWkU9MHg0MDAwMDxicj4NCsKgQ09ORklHX0VOVl9TRUNUX1NJWkU9MHg0MDAwMDxicj4NCsKg
Q09ORklHX1NZU19NQUxMT0NfTEVOPTB4MTAwMDAwMDxicj4NCitDT05GSUdfREVGQVVMVF9ERVZJ
Q0VfVFJFRT0mcXVvdDtxZW11LWFybTY0JnF1b3Q7PGJyPg0KwqBDT05GSUdfQUhDST15PGJyPg0K
wqBDT05GSUdfRElTVFJPX0RFRkFVTFRTPXk8YnI+DQrCoENPTkZJR19TWVNfTE9BRF9BRERSPTB4
NDAyMDAwMDA8YnI+DQotLSA8YnI+DQoyLjMzLjAuODgyLmc5M2E0NTcyN2EyLWdvb2c8YnI+DQo8
YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+LS0gPGJyPjxkaXYgZGlyPSJsdHIiIGNsYXNz
PSJnbWFpbF9zaWduYXR1cmUiIGRhdGEtc21hcnRtYWlsPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYg
ZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2Pjxk
aXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2
PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXYgZGlyPSJs
dHIiPjxkaXYgZGlyPSJsdHIiPjx0YWJsZSBzdHlsZT0iZm9udC1zaXplOnNtYWxsIiBib3JkZXI9
IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCI+PHRib2R5Pjx0cj48dGQgc3R5bGU9
InBhZGRpbmctcmlnaHQ6MTBweCIgdmFsaWduPSJ0b3AiPjxpbWcgc3JjPSJodHRwczovL3N0YXRp
Yy5saW5hcm8ub3JnL2NvbW1vbi9pbWFnZXMvbGluYXJvLWxvZ28td2ViLnBuZyI+PC90ZD48dGQg
dmFsaWduPSJ0b3AiPjx0YWJsZSBib3JkZXI9IjAiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2lu
Zz0iMCI+PHRib2R5Pjx0cj48dGQgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGljYSwm
cXVvdDtTYW5zIFNlcmlmJnF1b3Q7O3doaXRlLXNwYWNlOm5vd3JhcDtmb250LXNpemU6OXB0O3Bh
ZGRpbmctdG9wOjBweDtjb2xvcjpyZ2IoODcsODcsODcpIiB2YWxpZ249InRvcCI+PHNwYW4gc3R5
bGU9ImZvbnQtd2VpZ2h0OmJvbGQiPkZyYW7Dp29pcy1GcsOpZMOpcmljIE96b2c8L3NwYW4+wqA8
c3BhbiBzdHlsZT0iY29sb3I6cmdiKDE2MSwxNjEsMTYxKSI+fDwvc3Bhbj7CoDxpPkRpcmVjdG9y
IEJ1c2luZXNzIERldmVsb3BtZW50PC9pPjwvdGQ+PC90cj48dHI+PHRkIHN0eWxlPSJmb250LWZh
bWlseTpBcmlhbCxIZWx2ZXRpY2EsJnF1b3Q7U2FucyBTZXJpZiZxdW90Ozt3aGl0ZS1zcGFjZTpu
b3dyYXA7Zm9udC1zaXplOjlwdDtwYWRkaW5nLXRvcDoycHg7Y29sb3I6cmdiKDg3LDg3LDg3KSIg
dmFsaWduPSJ0b3AiPlQ6wqA8YSB2YWx1ZT0iKzM5MzM4NDA3NTk5MyIgc3R5bGU9ImNvbG9yOnJn
YigxNyw4NSwyMDQpIj4rMzMuNjcyMjEuNjQ4NTwvYT48YnI+PGEgaHJlZj0ibWFpbHRvOmZyYW5j
b2lzLm96b2dAbGluYXJvLm9yZyIgc3R5bGU9ImNvbG9yOnJnYig4Nyw4Nyw4Nyk7dGV4dC1kZWNv
cmF0aW9uOm5vbmUiIHRhcmdldD0iX2JsYW5rIj5mcmFuY29pcy5vem9nQGxpbmFyby5vcmc8L2E+
wqA8c3BhbiBzdHlsZT0iY29sb3I6cmdiKDE2MSwxNjEsMTYxKSI+fDwvc3Bhbj7CoFNreXBlOsKg
ZmZvem9nPC90ZD48L3RyPjwvdGJvZHk+PC90YWJsZT48L3RkPjwvdHI+PC90Ym9keT48L3RhYmxl
PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjxkaXY+PGRpdj48YnIgc3R5bGU9ImZvbnQt
c2l6ZTpzbWFsbCI+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9k
aXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+
DQo=
--000000000000d6912105ce31b484--

