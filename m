Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1A02C94F7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 03:05:44 +0100 (CET)
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjv30-0006ap-Vu
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 21:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv1O-00060T-OL; Mon, 30 Nov 2020 21:04:02 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:45295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv1N-0000FV-8F; Mon, 30 Nov 2020 21:04:02 -0500
Received: by mail-il1-x141.google.com with SMTP id w8so133046ilg.12;
 Mon, 30 Nov 2020 18:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AyocmZBaWefAPt+dNjMqu4XTXi7KxfPksz5qVukrjQo=;
 b=QfdRoERrFsXBpux9BcQTY+qPP7gUXEO8iXsl/WIwfOLIXPrPu07mN18tJTXMc+h58g
 en8k0UACAy7+e8yaxHN1DaCwvP0Ry0lq5dc/JIfFWfyZeeGse0TmAqBN1gNxktqdyse5
 qnIc8iAXPBrlV0A8XfRH4QDHYJz+Tn1DmdX+cM9LtG0x2hulZmYyw5qmXdctrLI7/0pr
 HqY7m6oOrJGfcj61q0Cgxeby0WbM2tkyT/9iE56uISoH1Eey+IZ1MCm7mKaLk6mwo1U5
 DxrH9iRGUF6+Lzq/kVGgxxrSR0xJw/XGzYmJPirHR9pN6UJGNPeIFNxHWdjgV6vVy+ZE
 hgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AyocmZBaWefAPt+dNjMqu4XTXi7KxfPksz5qVukrjQo=;
 b=Y0cmbo9EvnOMrYFT7GT6c0WMg/GE5xN002wsTmwqOW5DurumceoXpLg64lf2LxR8SO
 t32L9J/AnCPEvkckvP+ydXUH+39lhX+ESl4EvEqBa24OgoBrPVajgnfcIHkDBnpWjQQr
 UZOipt/KpWKf1QMlbeYFkmOjVrzLaGaplBmS6LZ5zp5akeAvHfXjEFNG6mj9rfFWhU0M
 QbKD2bL0vDBQHXZyCdYzHcYlDz/0QPR7SO+Ao44tZ/JL+jOVmKRQjFR/K1CNEL2HseXv
 jZQxU86Kr5TRGjj6FKLMqTHhFwof+xsExKcQ/sbyQ3c2P5iIovYUcnIpHK4jE9gYOvHt
 /nwA==
X-Gm-Message-State: AOAM532uatiuo4vB0Owyhc8J5HQjfS+boOV4CGyFJF4HKqxM1V7towEx
 5rgEhzDvsp+RT02xGuNO1B6NKwoHilLOZYl6kzo=
X-Google-Smtp-Source: ABdhPJyT3gIbp41D73pi+4Eai4VRlsZr61R5s+KRXAJ0XZp8gIWSEX57YYf3aGV4WdHE4T+iKYt+y8K1z+n0uTLcS1A=
X-Received: by 2002:a05:6e02:ca5:: with SMTP id 5mr659170ilg.40.1606788239431; 
 Mon, 30 Nov 2020 18:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20201124094941.485767-1-f4bug@amsat.org>
 <20201124094941.485767-3-f4bug@amsat.org>
In-Reply-To: <20201124094941.485767-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Nov 2020 17:51:42 -0800
Message-ID: <CAKmqyKNs1u3ZOZWj0i07qVGtG5L20Tm_0WOeRtdBCWH5yZ32+g@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 2/4] hw/arm/exynos4210: Add SD bus QOM alias on
 the SoC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 1:55 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> To be able to select a particular SD bus from the command
> line, add a QOM alias on the SoC (using an unique name).
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/exynos4210.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index ced2769b102..a60f08d372a 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -408,6 +408,7 @@ static void exynos4210_realize(DeviceState *socdev, E=
rror **errp)
>
>      /*** SD/MMC host controllers ***/
>      for (n =3D 0; n < EXYNOS4210_SDHCI_NUMBER; n++) {
> +        g_autofree char *bus_name =3D NULL;
>          DeviceState *carddev;
>          BlockBackend *blk;
>          DriveInfo *di;
> @@ -432,6 +433,10 @@ static void exynos4210_realize(DeviceState *socdev, =
Error **errp)
>          sysbus_mmio_map(busdev, 0, EXYNOS4210_SDHCI_ADDR(n));
>          sysbus_connect_irq(busdev, 0, s->irq_table[exynos4210_get_irq(29=
, n)]);
>
> +        /* Alias controller SD bus to the SoC itself */
> +        bus_name =3D g_strdup_printf("sd-bus%d", n);
> +        object_property_add_alias(OBJECT(s), bus_name, OBJECT(dev), "sd-=
bus");
> +
>          di =3D drive_get(IF_SD, 0, n);
>          blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
>          carddev =3D qdev_new(TYPE_SD_CARD);
> --
> 2.26.2
>
>

