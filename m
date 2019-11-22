Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87832107386
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 14:42:55 +0100 (CET)
Received: from localhost ([::1]:51011 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iY9D4-0006hc-Kh
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 08:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iY9CF-0006B1-3y
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 08:42:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iY9CD-00059F-MW
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 08:42:02 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34417)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iY9CD-00058k-Fz
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 08:42:01 -0500
Received: by mail-ot1-x341.google.com with SMTP id w11so6216604ote.1
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 05:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xatyfuz2GAl581J0XU7+HUpyDt+cI/50OkNMo9IAuA4=;
 b=NSDCpdK7a4YsuFXyuDZSTE7rsQg7zzdwcADkRv1AIyh41hvK6I0kdFxMO1/Azx3L7B
 A01iVixKmfYqv7QvB7qDGReBCJAmcURuYJJNJyR7UXO79VVmCSzIGrPbyK4/3Ls+tqcE
 6RdWFxWpq9jGyA0cd6PFOhbhnZSYeLGv/r3U770moZrOttt/vPHs387gKw3l2Ieh6pBz
 gw+aouSXQf6LGJpOaplZpmbSpwrkqAk6V5D1NcrK7BP0DNVj+L3rv2yzWV53lpPazIoZ
 En0avAh+miLgJxszSYnRdNzibofqay30GlWPKdH9KCoPi2/8RmKzzLUPRSjRhaZ+S5PM
 IsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xatyfuz2GAl581J0XU7+HUpyDt+cI/50OkNMo9IAuA4=;
 b=CgRmGEAIZjNwwrhwwAIsc766BDIL5RjaLmsGyqTX7uozDIAdL+70vXD3zL5GyM7FN6
 Wa10LwbcFANCqJZgjLtqlfQt8jUMlSkzkRn69AwmWF1vwMntl/25gbmSoG0CvEwTK2pO
 njQgIu1wfAYJZKlYy8U/taIok4ri8d8z1r5kokhrJz4X3KriL2lEkn366eXH5vPEbvuX
 Br1cyoWw/M8w0ZXjmNUL18+XfDXaiyd1fnAnZElV4xFnG8fKF7EgXwdT1NuVzeVVRPeH
 Xuh03Qp4p7EZMquIqQ1kJ4aZccn7sKVMQuJL55XZaol/xhSBAwToDBcT/RXYJRZVgACi
 m54Q==
X-Gm-Message-State: APjAAAVZnrEdSqT22bc3s7XIQgApBkx8nSbWG7Gd4zGr0Ckxy7HFvZ2Y
 sSaG+09lto22gqGFSFAJZ2tpluJtNr9G2R5Yf6pPFQ==
X-Google-Smtp-Source: APXvYqz3Fy7V7QT+K9OkmmxhInjSQt1YG1Rk3pkXFNj3inInl1/gBhdaq2n6wAWDPZ1SiwGTj4owW4qE5iWeWrvKdec=
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr10762172otn.135.1574430119732; 
 Fri, 22 Nov 2019 05:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20191122133623.13004-1-philmd@redhat.com>
In-Reply-To: <20191122133623.13004-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Nov 2019 13:41:48 +0000
Message-ID: <CAFEAcA86ywmiFO9AULdubwKygJb2bVJ+c2RU_sNyUWxx3pY6NQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0] hw/display/sm501: Always map the UART0
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Nov 2019 at 13:36, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> The SM501 is a Mobile Multimedia Companion Chip with 2 UARTs.
> This model only implements the first UART. Being part of the
> chipset, the UART block is always mapped in memory, regardless

"regardless of whether we provide"

> we provide a chardev backend.
>
> Since commit 12051d82f, qemu_chr_fe_init() accepts a NULL chardev.
> Let's remove the chardev check and always map the UART in the
> chipset memory.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/display/sm501.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 1f33c87e65..79bd7bc2d1 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1958,11 +1958,9 @@ static void sm501_realize_sysbus(DeviceState *dev,=
 Error **errp)
>      sysbus_pass_irq(sbd, SYS_BUS_DEVICE(usb_dev));
>
>      /* bridge to serial emulation module */
> -    if (s->chr_state) {
> -        serial_mm_init(&s->state.mmio_region, SM501_UART0, 2,
> -                       NULL, /* TODO : chain irq to IRL */
> -                       115200, s->chr_state, DEVICE_LITTLE_ENDIAN);
> -    }
> +    serial_mm_init(&s->state.mmio_region, SM501_UART0, 2,
> +                   NULL, /* TODO : chain irq to IRL */
> +                   115200, s->chr_state, DEVICE_LITTLE_ENDIAN);
>  }
>
>  static Property sm501_sysbus_properties[] =3D {

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

This would be one way of resolving a comment I had on
a patch to this device in Marc-Andr=C3=A9's series...

thanks
-- PMM

