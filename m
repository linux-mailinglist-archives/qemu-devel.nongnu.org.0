Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECAB215BCC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 18:29:42 +0200 (CEST)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsTzx-0003hj-Ce
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 12:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsTxd-0002F8-7C
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:27:17 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:32856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsTxb-0008OG-EP
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:27:16 -0400
Received: by mail-io1-xd42.google.com with SMTP id i25so40107610iog.0
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UrdqtdN8QnM86ZxJijptv6H6264ITNG1OcilN6WhpEQ=;
 b=BE63bGwmvtQe/WvrOaX3XRJGV/aBhQGzIn9VDkuDvQcoA8uIrWXGDMkZvziZ4gnIzf
 JNhTjZbdrvgfKz4YpsRtmo7sp4/eOmXy2lXpdUCOLQv6Gd8hqAgoum0X8opn0+FulQkZ
 HaUAdbeoX1XDjzulLYCJG9ErMWnQS3BecaTMw5dQQVXtWkvw4nkhBCQ+r75oiRk5YJrN
 olo2sHNDh1IFOs4RcjYrx4Hg3Jn7MzgNSRw2YO5K71Zu1RN5LMyDNOCPHfWb6DV1FEdw
 1tYZgG3x0eUHns7AeKtKXRoSSdZVlZY8jjesJeDgLdLZ+jx5OXA+de+ubbT0L4MEw9lS
 hOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UrdqtdN8QnM86ZxJijptv6H6264ITNG1OcilN6WhpEQ=;
 b=etvqE6Le8JpffLjaeBdHTrbjdw9LLH+FL6hckvvfKsWbIgAm9toKJdePPFDNJFUWTc
 at+gmSSeeDsjkJuan/b//5o613+1/47BDFXiKu4PLu94ehtnjCcEqYFax41UZyvyKTUQ
 5rjb9nO5QS0PoYwYKSCt+uSx2D4wGvP740T5zABwFhqU5AJlOPURJZOt5JI9FN3vV4dw
 3f2nymkjwYTeCpNfbdnksZjbpFzCmAeMtkSr4HG4NM37LiGPAZZ7LJ9tsiv1wWLSq1IF
 8qrcn3EItay8TTutfSYY4VoaDvFOHuWYj1p3Wh2h3UQ647dR6Q6qH9X1DviFNS7yJsG9
 9OIg==
X-Gm-Message-State: AOAM530ZGenT7/yyLWpZI39H1XXxBuD12yCjgGOqQ1/n/ueLlAbQ3ocJ
 savB5gBghFIa3aXhLy4USmWACP6u58kDpIleX/E=
X-Google-Smtp-Source: ABdhPJwjZuIFa96zfeEEkYonOFOK42eFVuJ0I8l+ryU0E+5pOnBN1xQvXTvOl8KnHgbP/HSyK4oCaaVuY2rr7GzZv5k=
X-Received: by 2002:a02:10c1:: with SMTP id 184mr52857929jay.135.1594052834328; 
 Mon, 06 Jul 2020 09:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200705211016.15241-1-f4bug@amsat.org>
 <20200705211016.15241-2-f4bug@amsat.org>
In-Reply-To: <20200705211016.15241-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:17:26 -0700
Message-ID: <CAKmqyKNW_e24fYZGZw_g6Qi1ggi3tGvVE+d3fDMaaVd-Qc-z3A@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/lm32/milkymist: Un-inline
 milkymist_memcard_create()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 5, 2020 at 2:13 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> As we will modify milkymist_memcard_create(), move it first
> to the source file where it is used.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/lm32/milkymist-hw.h | 11 -----------
>  hw/lm32/milkymist.c    | 11 +++++++++++
>  2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/hw/lm32/milkymist-hw.h b/hw/lm32/milkymist-hw.h
> index 05e2c2a5a7..5dca5d52f5 100644
> --- a/hw/lm32/milkymist-hw.h
> +++ b/hw/lm32/milkymist-hw.h
> @@ -31,17 +31,6 @@ static inline DeviceState *milkymist_hpdmc_create(hwad=
dr base)
>      return dev;
>  }
>
> -static inline DeviceState *milkymist_memcard_create(hwaddr base)
> -{
> -    DeviceState *dev;
> -
> -    dev =3D qdev_new("milkymist-memcard");
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> -
> -    return dev;
> -}
> -
>  static inline DeviceState *milkymist_vgafb_create(hwaddr base,
>          uint32_t fb_offset, uint32_t fb_mask)
>  {
> diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
> index 85913bb68b..469e3c4322 100644
> --- a/hw/lm32/milkymist.c
> +++ b/hw/lm32/milkymist.c
> @@ -80,6 +80,17 @@ static void main_cpu_reset(void *opaque)
>      env->deba =3D reset_info->flash_base;
>  }
>
> +static DeviceState *milkymist_memcard_create(hwaddr base)
> +{
> +    DeviceState *dev;
> +
> +    dev =3D qdev_new("milkymist-memcard");
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> +
> +    return dev;
> +}
> +
>  static void
>  milkymist_init(MachineState *machine)
>  {
> --
> 2.21.3
>
>

